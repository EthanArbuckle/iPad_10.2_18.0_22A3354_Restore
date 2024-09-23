__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_23558A3C0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23558A3E0(uint64_t result, int a2, int a3)
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
  sub_23558A79C(a1, &qword_256248838);
}

uint64_t initializeBufferWithCopyOfBuffer for ManagedAppReply(uint64_t *a1, uint64_t *a2)
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

uint64_t sub_23558A458(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23558A478(uint64_t result, int a2, int a3)
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
  sub_23558A79C(a1, &qword_256248840);
}

uint64_t sub_23558A4B8(uint64_t a1, uint64_t a2)
{
  return sub_23558A600(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_23558A4C4(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_2355C8EE0();
  *a2 = 0;
  return result;
}

uint64_t sub_23558A538(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_2355C8EEC();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23558A5B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_2355C8EF8();
  v2 = sub_2355C8ED4();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23558A5F4(uint64_t a1, uint64_t a2)
{
  return sub_23558A600(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_23558A600(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_2355C8EF8();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23558A63C()
{
  sub_2355C8EF8();
  sub_2355C8F1C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23558A67C()
{
  uint64_t v0;

  sub_2355C8EF8();
  sub_2355C927C();
  sub_2355C8F1C();
  v0 = sub_2355C92AC();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23558A6EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_2355C8EF8();
  v2 = v1;
  if (v0 == sub_2355C8EF8() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_2355C9234();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_23558A79C(a1, &qword_256248848);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_23558A79C(a1, &qword_256248850);
}

void sub_23558A79C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23558A7E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2355C8ED4();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23558A824@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2355C8EF8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23558A84C()
{
  sub_23558A900((unint64_t *)&qword_256248870, (uint64_t)&unk_2355C9A88);
  sub_23558A900(&qword_256248878, (uint64_t)&unk_2355C99DC);
  return sub_2355C91E0();
}

uint64_t sub_23558A8B8()
{
  return sub_23558A900(&qword_256248858, (uint64_t)&unk_2355C99A0);
}

uint64_t sub_23558A8DC()
{
  return sub_23558A900(&qword_256248860, (uint64_t)&unk_2355C9974);
}

uint64_t sub_23558A900(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for Key(255);
    result = MEMORY[0x23B7CFBF8](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23558A940()
{
  return sub_23558A900(&qword_256248868, (uint64_t)&unk_2355C9A10);
}

uint64_t sub_23558A96C()
{
  uint64_t v0;

  sub_23558A9F8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for OfferViewModel()
{
  return objc_opt_self();
}

uint64_t sub_23558A9C4()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_23558A9D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2355C8604();
  *a1 = result;
  return result;
}

uint64_t sub_23558A9F8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (a3 == 1)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_23558AA10(unsigned __int8 *a1, __n128 a2)
{
  return ((uint64_t (*)(__n128, double, double, __n128))((char *)sub_23558AA44 + 4 * byte_2355C9B50[*a1]))(a2, 5.0, 9.5, (__n128)xmmword_2355C9AD0);
}

__n128 sub_23558AA44@<Q0>(uint64_t a1@<X8>, double a2@<D0>)
{
  char v2;
  double v3;
  float64x2_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  __n128 result;

  v3 = a2 * 28.0;
  v4 = vmulq_n_f64((float64x2_t)xmmword_2355C9AE0, a2);
  v5 = a2 + a2;
  v6 = a2 * 17.0;
  *(double *)a1 = a2 * 28.0;
  *(double *)(a1 + 8) = (a2 * 28.0 - (a2 + a2)) * 0.5;
  *(double *)(a1 + 16) = a2 * 28.0 * 0.5;
  *(double *)(a1 + 24) = a2 * 28.0 * 0.5;
  v7 = (a2 * 28.0 - (v5 + v5)) / 2.5;
  *(_OWORD *)(a1 + 32) = xmmword_2355C9B10;
  *(_OWORD *)(a1 + 48) = xmmword_2355C9B20;
  *(_QWORD *)(a1 + 64) = 0x3FF0000000000000;
  *(double *)(a1 + 72) = v5;
  *(double *)(a1 + 80) = v7;
  v8 = v3 * 0.5 - v7 * 0.5;
  *(double *)(a1 + 88) = v7;
  *(double *)(a1 + 96) = v8;
  *(double *)(a1 + 104) = v8;
  __asm { FMOV            V0.2D, #1.0 }
  *(__n128 *)(a1 + 112) = result;
  *(double *)(a1 + 128) = v6;
  *(double *)(a1 + 136) = 6.0;
  *(double *)(a1 + 144) = 12.0;
  *(double *)(a1 + 152) = 6.0;
  *(double *)(a1 + 160) = 12.0;
  *(float64x2_t *)(a1 + 168) = v4;
  *(_BYTE *)(a1 + 184) = 0;
  *(_BYTE *)(a1 + 185) = 0;
  *(_WORD *)(a1 + 186) = 1;
  *(_BYTE *)(a1 + 188) = v2;
  return result;
}

void sub_23558AB5C(double a1)
{
  void *v2;
  uint64_t inited;
  void *v4;
  void *v5;
  double v6;
  id v7;
  id v8;
  void *v9;

  v2 = (void *)sub_2355C8ED4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256248930);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2355C9B30;
  v4 = (void *)*MEMORY[0x24BEBB360];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB360];
  v5 = (void *)objc_opt_self();
  v6 = *MEMORY[0x24BEBB5E8];
  v7 = v4;
  v8 = objc_msgSend(v5, sel_systemFontOfSize_weight_, a1, v6);
  *(_QWORD *)(inited + 64) = sub_23558AD28();
  *(_QWORD *)(inited + 40) = v8;
  sub_23558AD64(inited);
  type metadata accessor for Key(0);
  sub_23558AE7C();
  v9 = (void *)sub_2355C8EB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_boundingRectWithSize_options_attributes_context_, 1, v9, 0, 1.79769313e308, 1.79769313e308);

}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7CFBE0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23558AD28()
{
  unint64_t result;

  result = qword_256248938;
  if (!qword_256248938)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256248938);
  }
  return result;
}

unint64_t sub_23558AD64(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256248940);
  v2 = sub_2355C9174();
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
    sub_23558AF44(v6, (uint64_t)&v13);
    v7 = v13;
    result = sub_23558AEC4(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_23558AF8C(&v14, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_23558AE7C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256248870;
  if (!qword_256248870)
  {
    type metadata accessor for Key(255);
    result = MEMORY[0x23B7CFBF8](&unk_2355C9A88, v1);
    atomic_store(result, (unint64_t *)&qword_256248870);
  }
  return result;
}

unint64_t sub_23558AEC4(uint64_t a1)
{
  uint64_t v2;

  sub_2355C8EF8();
  sub_2355C927C();
  sub_2355C8F1C();
  v2 = sub_2355C92AC();
  swift_bridgeObjectRelease();
  return sub_23558AF9C(a1, v2);
}

uint64_t sub_23558AF44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248948);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_23558AF8C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_23558AF9C(uint64_t a1, uint64_t a2)
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
    v6 = sub_2355C8EF8();
    v8 = v7;
    if (v6 == sub_2355C8EF8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_2355C9234();
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
          v13 = sub_2355C8EF8();
          v15 = v14;
          if (v13 == sub_2355C8EF8() && v15 == v16)
            break;
          v18 = sub_2355C9234();
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

uint64_t sub_23558B110(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v4;
  uint64_t inited;
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
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;

  v4 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a1;
  *(_BYTE *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 56) = a2;
  *(_QWORD *)(v3 + 64) = a3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256248950);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2355C9B40;
  swift_retain();
  v6 = sub_2355AAE1C();
  v8 = v7;
  *(_QWORD *)(inited + 32) = v6;
  *(_QWORD *)(inited + 40) = v7;
  v9 = sub_2355AAE1C();
  v11 = v10;
  *(_QWORD *)(inited + 48) = v9;
  *(_QWORD *)(inited + 56) = v10;
  v12 = sub_2355AAE1C();
  v14 = v13;
  *(_QWORD *)(inited + 64) = v12;
  *(_QWORD *)(inited + 72) = v13;
  v24 = sub_2355AAE1C();
  v16 = v15;
  *(_QWORD *)(inited + 80) = v24;
  *(_QWORD *)(inited + 88) = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17 = sub_2355C8F28();
  v18 = sub_2355C8F28();
  v19 = v18 < v17;
  if (v18 >= v17)
    v20 = v8;
  else
    v20 = v11;
  if (v19)
    v6 = v9;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v21 = sub_2355C8F28();
  if (sub_2355C8F28() < v21)
  {
    v20 = v14;
    v6 = v12;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v22 = sub_2355C8F28();
  if (sub_2355C8F28() < v22)
  {
    v6 = v24;
    v20 = v16;
  }
  swift_release();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v3 + 40) = v6;
  *(_QWORD *)(v3 + 48) = v20;
  return v3;
}

uint64_t sub_23558B2F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v7;

  v5[2] = sub_2355C8FB8();
  v5[3] = sub_2355C8FAC();
  v7 = (_QWORD *)swift_task_alloc();
  v5[4] = v7;
  *v7 = v5;
  v7[1] = sub_23558B36C;
  return sub_23558B40C(a5);
}

uint64_t sub_23558B36C()
{
  swift_task_dealloc();
  sub_2355C8F94();
  return swift_task_switch();
}

uint64_t sub_23558B3DC()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23558B40C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[13] = a1;
  v2[14] = v1;
  sub_2355C8FB8();
  v2[15] = sub_2355C8FAC();
  sub_2355C8F94();
  return swift_task_switch();
}

uint64_t sub_23558B4AC()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)v0[13];
  swift_release();
  v0[2] = 0;
  MEMORY[0x23B7CFC94](v0 + 2, 8);
  v2 = v0[2];
  v0[2] = 0;
  v3 = objc_msgSend(v1, sel_makeXPCConnectionWithError_, v0 + 2);
  v4 = (void *)v0[2];
  if (v3)
  {
    v5 = v3;
    v6 = v0[14];
    v7 = (void *)objc_opt_self();
    v8 = v4;
    v9 = objc_msgSend(v7, sel_interfaceWithProtocol_, &unk_25624E4B0);
    objc_msgSend(v5, sel_setRemoteObjectInterface_, v9);

    objc_msgSend(v5, sel_resume);
    v10 = swift_allocObject();
    v39 = v2 << 32;
    *(_QWORD *)(v10 + 16) = v2 << 32;
    *(_QWORD *)(v10 + 24) = 0;
    *(_BYTE *)(v10 + 32) = 0;
    v0[6] = sub_23558E30C;
    v0[7] = v10;
    v0[2] = MEMORY[0x24BDAC760];
    v0[3] = 1107296256;
    v0[4] = sub_23558C04C;
    v0[5] = &block_descriptor;
    v11 = _Block_copy(v0 + 2);
    swift_release();
    v12 = objc_msgSend(v5, sel_remoteObjectProxyWithErrorHandler_, v11);
    _Block_release(v11);
    sub_2355C9138();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256248B98);
    if (swift_dynamicCast())
      v13 = (void *)v0[12];
    else
      v13 = 0;
    sub_2355C83C4();
    swift_allocObject();
    sub_2355C83B8();
    v14 = v6 + OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUI20AppExtensionHostView11Coordinator_parent;
    type metadata accessor for AppExtensionHostView(0);
    v15 = sub_2355C84C0();
    v17 = v16;
    v18 = *(_QWORD *)v14;
    LOBYTE(v14) = *(_BYTE *)(v14 + 8);
    sub_23558C900(v18, v14);
    sub_23559D63C(v18, v14, &v40);
    sub_23558CA44(v18, v14);
    v19 = v40;
    v0[2] = v15;
    v0[3] = v17;
    *((_BYTE *)v0 + 32) = v19;
    sub_23558E330();
    v20 = sub_2355C83AC();
    v22 = v21;
    swift_release();
    swift_bridgeObjectRelease();
    if (v13)
    {
      swift_unknownObjectRetain();
      v34 = (void *)sub_2355C840C();
      v35 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v36 = swift_allocObject();
      *(_QWORD *)(v36 + 16) = v39;
      *(_QWORD *)(v36 + 24) = 0;
      *(_BYTE *)(v36 + 32) = 0;
      *(_QWORD *)(v36 + 40) = v35;
      v0[6] = sub_23558E40C;
      v0[7] = v36;
      v0[2] = MEMORY[0x24BDAC760];
      v0[3] = 1107296256;
      v0[4] = sub_23558C564;
      v0[5] = &block_descriptor_22;
      v37 = _Block_copy(v0 + 2);
      swift_release();
      objc_msgSend(v13, sel_setWithManagedAppViewData_reply_, v34, v37);
      swift_unknownObjectRelease();
      sub_23558E374(v20, v22);

      swift_unknownObjectRelease();
      _Block_release(v37);

    }
    else
    {
      sub_23558E374(v20, v22);

    }
  }
  else
  {
    v23 = v4;
    v24 = (void *)sub_2355C83DC();

    swift_willThrow();
    if (qword_256248820 != -1)
      swift_once();
    v25 = sub_2355C85C8();
    __swift_project_value_buffer(v25, (uint64_t)qword_25624C3A0);
    v26 = v24;
    v27 = v24;
    v28 = sub_2355C85B0();
    v29 = sub_2355C9084();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = swift_slowAlloc();
      v31 = swift_slowAlloc();
      v42[0] = v31;
      *(_DWORD *)v30 = 136315394;
      v40 = 5527621;
      v41 = 0xE300000000000000;
      *((_DWORD *)v0 + 4) = v2;
      sub_23558E07C();
      sub_2355C8F4C();
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      v0[2] = sub_23558FF68(v40, v41, v42);
      sub_2355C9120();
      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2080;
      swift_getErrorValue();
      v32 = sub_2355C9270();
      v0[2] = sub_23558FF68(v32, v33, v42);
      sub_2355C9120();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_235588000, v28, v29, "[%s]: Cannot make connection to extension. %s", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23B7CFC88](v31, -1, -1);
      MEMORY[0x23B7CFC88](v30, -1, -1);

    }
    else
    {

    }
  }
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_23558BAE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2355C8FDC();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2355C8FD0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23558E470(a1, &qword_256248B68);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2355C8F94();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_23558BD34(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8;
  id v9;
  id v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  NSObject *oslog;
  uint64_t v19;

  if (qword_256248820 != -1)
    swift_once();
  v8 = sub_2355C85C8();
  __swift_project_value_buffer(v8, (uint64_t)qword_25624C3A0);
  sub_23558E460(a2, a3, a4 & 1);
  v9 = a1;
  sub_23558E460(a2, a3, a4 & 1);
  v10 = a1;
  oslog = sub_2355C85B0();
  v11 = sub_2355C9084();
  if (os_log_type_enabled(oslog, v11))
  {
    v12 = swift_slowAlloc();
    v13 = swift_slowAlloc();
    v19 = v13;
    *(_DWORD *)v12 = 136315394;
    if ((a4 & 1) != 0)
    {
      swift_bridgeObjectRetain();
      v14 = a2;
      v15 = a3;
    }
    else
    {
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      sub_23558E07C();
      sub_2355C8F4C();
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      v14 = 0;
      v15 = 0xE000000000000000;
    }
    sub_23558FF68(v14, v15, &v19);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    sub_23558E2FC(a2, a3, a4 & 1);
    sub_23558E2FC(a2, a3, a4 & 1);
    *(_WORD *)(v12 + 12) = 2080;
    swift_getErrorValue();
    v16 = sub_2355C9270();
    sub_23558FF68(v16, v17, &v19);
    sub_2355C9120();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_235588000, oslog, v11, "[%s]: Failed to create proxy to extension. %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7CFC88](v13, -1, -1);
    MEMORY[0x23B7CFC88](v12, -1, -1);

  }
  else
  {
    sub_23558E2FC(a2, a3, a4 & 1);
    sub_23558E2FC(a2, a3, a4 & 1);

  }
}

void sub_23558C04C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_23558C09C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t result;
  void *v33;
  char *v34;
  unint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  __int128 v46;
  __int128 v47;
  int v48;

  v10 = type metadata accessor for AppExtensionHostView(0);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2355C83A0();
  swift_allocObject();
  sub_2355C8394();
  sub_23558E41C();
  sub_2355C8388();
  v13 = a6 + 16;
  swift_release();
  v14 = v44;
  v15 = v45;
  v16 = v46;
  v17 = v47;
  if (qword_256248820 != -1)
    swift_once();
  v18 = sub_2355C85C8();
  __swift_project_value_buffer(v18, (uint64_t)qword_25624C3A0);
  sub_23558E460(a3, a4, a5 & 1);
  sub_23558E460(a3, a4, a5 & 1);
  v19 = sub_2355C85B0();
  v20 = sub_2355C9078();
  if (os_log_type_enabled(v19, (os_log_type_t)v20))
  {
    v39 = v20;
    v40 = v13;
    v21 = swift_slowAlloc();
    v38 = swift_slowAlloc();
    v41 = v38;
    *(_DWORD *)v21 = 136315394;
    if ((a5 & 1) != 0)
    {
      swift_bridgeObjectRetain();
      v22 = a3;
      v23 = a4;
    }
    else
    {
      v44 = 0;
      v45 = 0xE000000000000000;
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      v48 = HIDWORD(a3);
      sub_23558E07C();
      sub_2355C8F4C();
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      v22 = v44;
      v23 = v45;
    }
    v44 = sub_23558FF68(v22, v23, &v41);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    sub_23558E2FC(a3, a4, a5 & 1);
    sub_23558E2FC(a3, a4, a5 & 1);
    *(_WORD *)(v21 + 12) = 2080;
    v24 = sub_2355C9024();
    v44 = sub_23558FF68(v24, v25, &v41);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235588000, v19, (os_log_type_t)v39, "[%s]: Setting cell bounds %s", (uint8_t *)v21, 0x16u);
    v26 = v38;
    swift_arrayDestroy();
    MEMORY[0x23B7CFC88](v26, -1, -1);
    MEMORY[0x23B7CFC88](v21, -1, -1);

    v13 = v40;
  }
  else
  {
    sub_23558E2FC(a3, a4, a5 & 1);
    sub_23558E2FC(a3, a4, a5 & 1);

  }
  swift_beginAccess();
  v27 = MEMORY[0x23B7CFD18](v13);
  if (v27)
  {
    v28 = (void *)v27;
    sub_23558DF34(v27 + OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUI20AppExtensionHostView11Coordinator_parent, (uint64_t)v12);

    v29 = (uint64_t *)&v12[*(int *)(v10 + 24)];
    v30 = v29[1];
    v31 = v29[2];
    v44 = *v29;
    v45 = v30;
    *(_QWORD *)&v46 = v31;
    v41 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256248BB0);
    sub_2355C8DF0();
    sub_23558DF78((uint64_t)v12, type metadata accessor for AppExtensionHostView);
  }
  swift_beginAccess();
  result = MEMORY[0x23B7CFD18](v13);
  if (result)
  {
    v33 = (void *)result;
    sub_23558DF34(result + OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUI20AppExtensionHostView11Coordinator_parent, (uint64_t)v12);

    v34 = &v12[*(int *)(v10 + 28)];
    v35 = *((_QWORD *)v34 + 1);
    v44 = *(_QWORD *)v34;
    v45 = v35;
    v36 = *((_OWORD *)v34 + 2);
    v46 = *((_OWORD *)v34 + 1);
    v47 = v36;
    v41 = v15;
    v42 = v16;
    v43 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256248BB8);
    sub_2355C8DF0();
    return sub_23558DF78((uint64_t)v12, type metadata accessor for AppExtensionHostView);
  }
  return result;
}

uint64_t sub_23558C564(uint64_t a1, void *a2)
{
  void (*v3)(uint64_t, unint64_t);
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = *(void (**)(uint64_t, unint64_t))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = sub_2355C8418();
  v7 = v6;

  v3(v5, v7);
  sub_23558E374(v5, v7);
  return swift_release();
}

id sub_23558C600()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23558C680()
{
  return type metadata accessor for AppExtensionHostView.Coordinator(0);
}

uint64_t type metadata accessor for AppExtensionHostView.Coordinator(uint64_t a1)
{
  return sub_23558C920(a1, (uint64_t *)&unk_2562489E8);
}

void sub_23558C69C()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for AppExtensionHostView(319);
  if (v0 <= 0x3F)
  {
    sub_23558D398(319, &qword_2562489F8, (void (*)(uint64_t))MEMORY[0x24BDC7920]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t type metadata accessor for AppExtensionHostView(uint64_t a1)
{
  return sub_23558C920(a1, (uint64_t *)&unk_256248A60);
}

unint64_t sub_23558C748(unint64_t a1, uint64_t a2, int *a3)
{
  int v5;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, _QWORD, uint64_t, uint64_t);

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v29 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = v29 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = *(_QWORD *)a2;
    v8 = *(_BYTE *)(a2 + 8);
    sub_23558C900(*(_QWORD *)a2, v8);
    *(_QWORD *)a1 = v7;
    *(_BYTE *)(a1 + 8) = v8;
    v9 = a3[5];
    v10 = a1 + v9;
    v11 = a2 + v9;
    v12 = sub_2355C8520();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    v13 = a3[6];
    v14 = a3[7];
    v15 = (_QWORD *)(a1 + v13);
    v16 = (_QWORD *)(a2 + v13);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    v15[2] = v16[2];
    v18 = a1 + v14;
    v19 = a2 + v14;
    v20 = *(_QWORD *)(v19 + 8);
    *(_QWORD *)v18 = *(_QWORD *)v19;
    *(_QWORD *)(v18 + 8) = v20;
    v21 = *(_OWORD *)(v19 + 32);
    *(_OWORD *)(v18 + 16) = *(_OWORD *)(v19 + 16);
    *(_OWORD *)(v18 + 32) = v21;
    v22 = a3[8];
    v23 = (char *)(a1 + v22);
    v24 = (char *)(a2 + v22);
    v25 = type metadata accessor for AppExtensionHostView.Configuration(0);
    v26 = *(_QWORD *)(v25 - 8);
    v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    if (v27(v24, 1, v25))
    {
      v28 = __swift_instantiateConcreteTypeFromMangledName(qword_256248A00);
      memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      v30 = sub_2355C849C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v23, v24, v30);
      v31 = *(int *)(v25 + 20);
      v32 = &v23[v31];
      v33 = &v24[v31];
      v34 = *((_QWORD *)v33 + 1);
      *(_QWORD *)v32 = *(_QWORD *)v33;
      *((_QWORD *)v32 + 1) = v34;
      v35 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56);
      swift_bridgeObjectRetain();
      v35(v23, 0, 1, v25);
    }
  }
  return a1;
}

uint64_t sub_23558C900(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t type metadata accessor for AppExtensionHostView.Configuration(uint64_t a1)
{
  return sub_23558C920(a1, qword_256248B08);
}

uint64_t sub_23558C920(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23558C954(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  sub_23558CA44(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_2355C8520();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v6 = a1 + *(int *)(a2 + 32);
  v7 = type metadata accessor for AppExtensionHostView.Configuration(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7);
  if (!(_DWORD)result)
  {
    v9 = sub_2355C849C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v6, v9);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23558CA44(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t sub_23558CA50(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, _QWORD, uint64_t, uint64_t);

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_23558C900(*(_QWORD *)a2, v7);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  v8 = a3[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_2355C8520();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  v12 = a3[6];
  v13 = a3[7];
  v14 = (_QWORD *)(a1 + v12);
  v15 = (_QWORD *)(a2 + v12);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v14[2] = v15[2];
  v17 = a1 + v13;
  v18 = a2 + v13;
  v19 = *(_QWORD *)(v18 + 8);
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *(_QWORD *)(v17 + 8) = v19;
  v20 = *(_OWORD *)(v18 + 32);
  *(_OWORD *)(v17 + 16) = *(_OWORD *)(v18 + 16);
  *(_OWORD *)(v17 + 32) = v20;
  v21 = a3[8];
  v22 = (char *)(a1 + v21);
  v23 = (char *)(a2 + v21);
  v24 = type metadata accessor for AppExtensionHostView.Configuration(0);
  v25 = *(_QWORD *)(v24 - 8);
  v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  if (v26(v23, 1, v24))
  {
    v27 = __swift_instantiateConcreteTypeFromMangledName(qword_256248A00);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
  }
  else
  {
    v28 = sub_2355C849C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v22, v23, v28);
    v29 = *(int *)(v24 + 20);
    v30 = &v22[v29];
    v31 = &v23[v29];
    v32 = *((_QWORD *)v31 + 1);
    *(_QWORD *)v30 = *(_QWORD *)v31;
    *((_QWORD *)v30 + 1) = v32;
    v33 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56);
    swift_bridgeObjectRetain();
    v33(v22, 0, 1, v24);
  }
  return a1;
}

uint64_t sub_23558CBDC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(char *, uint64_t, uint64_t);
  int v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  void (*v31)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_23558C900(*(_QWORD *)a2, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_23558CA44(v8, v9);
  v10 = a3[5];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_2355C8520();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  v14 = a3[6];
  v15 = a1 + v14;
  v16 = a2 + v14;
  *(_QWORD *)(a1 + v14) = *(_QWORD *)(a2 + v14);
  swift_retain();
  swift_release();
  *(_QWORD *)(v15 + 8) = *(_QWORD *)(v16 + 8);
  swift_retain();
  swift_release();
  *(_QWORD *)(v15 + 16) = *(_QWORD *)(v16 + 16);
  v17 = a3[7];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (_QWORD *)(a2 + v17);
  *(_QWORD *)(a1 + v17) = *(_QWORD *)(a2 + v17);
  swift_retain();
  swift_release();
  v18[1] = v19[1];
  swift_retain();
  swift_release();
  v18[2] = v19[2];
  v18[3] = v19[3];
  v18[4] = v19[4];
  v18[5] = v19[5];
  v20 = a3[8];
  v21 = (char *)(a1 + v20);
  v22 = (char *)(a2 + v20);
  v23 = type metadata accessor for AppExtensionHostView.Configuration(0);
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  LODWORD(v18) = v25(v21, 1, v23);
  v26 = v25(v22, 1, v23);
  if (!(_DWORD)v18)
  {
    if (!v26)
    {
      v34 = sub_2355C849C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 24))(v21, v22, v34);
      v35 = *(int *)(v23 + 20);
      v36 = &v21[v35];
      v37 = &v22[v35];
      *(_QWORD *)v36 = *(_QWORD *)v37;
      *((_QWORD *)v36 + 1) = *((_QWORD *)v37 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_23558DF78((uint64_t)v21, type metadata accessor for AppExtensionHostView.Configuration);
    goto LABEL_6;
  }
  if (v26)
  {
LABEL_6:
    v32 = __swift_instantiateConcreteTypeFromMangledName(qword_256248A00);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    return a1;
  }
  v27 = sub_2355C849C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v21, v22, v27);
  v28 = *(int *)(v23 + 20);
  v29 = &v21[v28];
  v30 = &v22[v28];
  *(_QWORD *)v29 = *(_QWORD *)v30;
  *((_QWORD *)v29 + 1) = *((_QWORD *)v30 + 1);
  v31 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56);
  swift_bridgeObjectRetain();
  v31(v21, 0, 1, v23);
  return a1;
}

uint64_t sub_23558CE3C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 *v13;
  __int128 v14;
  _OWORD *v15;
  _OWORD *v16;
  __int128 v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = a3[5];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2355C8520();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[6];
  v11 = a3[7];
  v12 = a1 + v10;
  v13 = (__int128 *)(a2 + v10);
  v14 = *v13;
  *(_QWORD *)(v12 + 16) = *((_QWORD *)v13 + 2);
  *(_OWORD *)v12 = v14;
  v15 = (_OWORD *)(a1 + v11);
  v16 = (_OWORD *)(a2 + v11);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  v15[2] = v16[2];
  v18 = a3[8];
  v19 = (char *)(a1 + v18);
  v20 = (char *)(a2 + v18);
  v21 = type metadata accessor for AppExtensionHostView.Configuration(0);
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    v23 = __swift_instantiateConcreteTypeFromMangledName(qword_256248A00);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    v24 = sub_2355C849C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v19, v20, v24);
    *(_OWORD *)&v19[*(int *)(v21 + 20)] = *(_OWORD *)&v20[*(int *)(v21 + 20)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  return a1;
}

uint64_t sub_23558CF80(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
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
  __int128 v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(char *, uint64_t, uint64_t);
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;

  v6 = *a2;
  v7 = *((_BYTE *)a2 + 8);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_23558CA44(v8, v9);
  v10 = a3[5];
  v11 = a1 + v10;
  v12 = (uint64_t)a2 + v10;
  v13 = sub_2355C8520();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  v14 = a3[6];
  v15 = a1 + v14;
  v16 = (uint64_t)a2 + v14;
  *(_QWORD *)(a1 + v14) = *(uint64_t *)((char *)a2 + v14);
  swift_release();
  *(_QWORD *)(v15 + 8) = *(_QWORD *)(v16 + 8);
  swift_release();
  *(_QWORD *)(v15 + 16) = *(_QWORD *)(v16 + 16);
  v17 = a3[7];
  v18 = a1 + v17;
  v19 = (uint64_t)a2 + v17;
  *(_QWORD *)(a1 + v17) = *(uint64_t *)((char *)a2 + v17);
  swift_release();
  *(_QWORD *)(v18 + 8) = *(_QWORD *)(v19 + 8);
  swift_release();
  v20 = *(_OWORD *)(v19 + 32);
  *(_OWORD *)(v18 + 16) = *(_OWORD *)(v19 + 16);
  *(_OWORD *)(v18 + 32) = v20;
  v21 = a3[8];
  v22 = (char *)(a1 + v21);
  v23 = (char *)a2 + v21;
  v24 = type metadata accessor for AppExtensionHostView.Configuration(0);
  v25 = *(_QWORD *)(v24 - 8);
  v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48);
  LODWORD(v19) = v26(v22, 1, v24);
  v27 = v26(v23, 1, v24);
  if (!(_DWORD)v19)
  {
    if (!v27)
    {
      v31 = sub_2355C849C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 40))(v22, v23, v31);
      v32 = *(int *)(v24 + 20);
      v33 = &v22[v32];
      v34 = &v23[v32];
      v36 = *(_QWORD *)v34;
      v35 = *((_QWORD *)v34 + 1);
      *(_QWORD *)v33 = v36;
      *((_QWORD *)v33 + 1) = v35;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_23558DF78((uint64_t)v22, type metadata accessor for AppExtensionHostView.Configuration);
    goto LABEL_6;
  }
  if (v27)
  {
LABEL_6:
    v29 = __swift_instantiateConcreteTypeFromMangledName(qword_256248A00);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    return a1;
  }
  v28 = sub_2355C849C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v22, v23, v28);
  *(_OWORD *)&v22[*(int *)(v24 + 20)] = *(_OWORD *)&v23[*(int *)(v24 + 20)];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  return a1;
}

uint64_t sub_23558D178()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23558D184(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v6 = sub_2355C8520();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_256248A00);
    v7 = *(_QWORD *)(v8 - 8);
    v9 = a3[8];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v10 = *(_QWORD *)(a1 + a3[6] + 8);
  if (v10 >= 0xFFFFFFFF)
    LODWORD(v10) = -1;
  return (v10 + 1);
}

uint64_t sub_23558D230()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23558D23C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = sub_2355C8520();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = a4[5];
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + a4[6] + 8) = (a2 - 1);
      return result;
    }
    v10 = __swift_instantiateConcreteTypeFromMangledName(qword_256248A00);
    v9 = *(_QWORD *)(v10 - 8);
    v11 = a4[8];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
}

void sub_23558D2E4()
{
  unint64_t v0;
  unint64_t v1;

  sub_2355C8520();
  if (v0 <= 0x3F)
  {
    sub_23558D398(319, qword_256248A70, (void (*)(uint64_t))type metadata accessor for AppExtensionHostView.Configuration);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_23558D398(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_2355C9114();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t *sub_23558D3E4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_2355C849C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_23558D478(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2355C849C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23558D4C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = sub_2355C849C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23558D528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_2355C849C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23558D5A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_2355C849C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_23558D600(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_2355C849C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23558D66C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23558D678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_2355C849C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_23558D6F8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23558D704(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_2355C849C();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_23558D780()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2355C849C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23558D7F0()
{
  return sub_23558DEF4(&qword_256248B40, (uint64_t)&unk_2355C9D10);
}

void sub_23558D814(NSObject *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  os_log_type_t v20;
  int v21;
  uint8_t *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;

  sub_2355C8448();
  MEMORY[0x24BDAC7A8]();
  v28 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2355C849C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v27 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for AppExtensionHostView.Configuration(0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(qword_256248A00);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256248B50);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = 0;
  MEMORY[0x23B7CFC94](&v31, 8);
  v14 = v31;
  objc_opt_self();
  v15 = a1;
  if (swift_dynamicCastObjCClass())
  {
    v16 = type metadata accessor for AppExtensionHostView(0);
    sub_23558E0C0(v29 + *(int *)(v16 + 32), (uint64_t)v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v11, 1, v6) == 1)
    {
      v17 = sub_2355C90FC();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v13, 1, 1, v17);
      v18 = a1;
    }
    else
    {
      sub_23558E108((uint64_t)v11, (uint64_t)v9);
      (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v27, v9, v3);
      v24 = a1;
      swift_bridgeObjectRetain();
      sub_2355C8454();
      sub_2355C90F0();
      sub_23558DF78((uint64_t)v9, type metadata accessor for AppExtensionHostView.Configuration);
      v25 = sub_2355C90FC();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v13, 0, 1, v25);
    }
    sub_2355C9108();
  }
  else
  {
    if (qword_256248820 != -1)
      swift_once();
    v19 = sub_2355C85C8();
    __swift_project_value_buffer(v19, (uint64_t)qword_25624C3A0);
    v15 = sub_2355C85B0();
    v20 = sub_2355C9084();
    if (os_log_type_enabled(v15, v20))
    {
      v21 = v14;
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      *(_DWORD *)v22 = 136315138;
      v31 = 5527621;
      v32 = 0xE300000000000000;
      v33 = v23;
      v30 = v21;
      sub_23558E07C();
      sub_2355C8F4C();
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      v31 = sub_23558FF68(v31, v32, &v33);
      sub_2355C9120();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235588000, v15, v20, "[%s]: No HostingViewController found", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7CFC88](v23, -1, -1);
      MEMORY[0x23B7CFC88](v22, -1, -1);
    }
  }

}

id sub_23558DC34()
{
  id v0;
  void *v2;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC7BB0]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256248B60);
  sub_2355C8AC0();
  objc_msgSend(v0, sel_setDelegate_, v2);

  return v0;
}

uint64_t sub_23558DCB4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  objc_class *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  id v9;
  uint64_t result;
  objc_super v11;

  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23558DF34(v1, (uint64_t)v4);
  v5 = (objc_class *)type metadata accessor for AppExtensionHostView.Coordinator(0);
  v6 = (char *)objc_allocWithZone(v5);
  v7 = &v6[OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUI20AppExtensionHostView11Coordinator_identity];
  v8 = sub_2355C849C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_23558DF34((uint64_t)v4, (uint64_t)&v6[OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUI20AppExtensionHostView11Coordinator_parent]);
  v11.receiver = v6;
  v11.super_class = v5;
  v9 = objc_msgSendSuper2(&v11, sel_init);
  result = sub_23558DF78((uint64_t)v4, type metadata accessor for AppExtensionHostView);
  *a1 = v9;
  return result;
}

uint64_t sub_23558DDA4()
{
  return sub_2355C8A6C();
}

uint64_t sub_23558DDDC()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_23558DDE8()
{
  sub_23558DEF4(&qword_256248B48, (uint64_t)&unk_2355C9C98);
  return sub_2355C8AA8();
}

uint64_t sub_23558DE48()
{
  sub_23558DEF4(&qword_256248B48, (uint64_t)&unk_2355C9C98);
  return sub_2355C8A78();
}

uint64_t sub_23558DEA8()
{
  return sub_2355C8C1C();
}

void sub_23558DEC0()
{
  sub_23558DEF4(&qword_256248B48, (uint64_t)&unk_2355C9C98);
  sub_2355C8A9C();
  __break(1u);
}

uint64_t sub_23558DEF4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for AppExtensionHostView(255);
    result = MEMORY[0x23B7CFBF8](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23558DF34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppExtensionHostView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23558DF78(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23558DFCC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23558E030;
  return v6(a1);
}

uint64_t sub_23558E030()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_23558E07C()
{
  unint64_t result;

  result = qword_256248B58;
  if (!qword_256248B58)
  {
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BEE4538], MEMORY[0x24BEE44F0]);
    atomic_store(result, (unint64_t *)&qword_256248B58);
  }
  return result;
}

uint64_t sub_23558E0C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_256248A00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23558E108(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppExtensionHostView.Configuration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23558E14C()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_23558E180(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_23558E1F8;
  return sub_23558B2F8(a1, v4, v5, v7, v6);
}

uint64_t sub_23558E1F8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23558E240()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23558E264(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23558E1F8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256248B80 + dword_256248B80))(a1, v4);
}

uint64_t sub_23558E2D4()
{
  uint64_t v0;

  sub_23558E2FC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_23558E2FC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

void sub_23558E30C(void *a1)
{
  uint64_t v1;

  sub_23558BD34(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_BYTE *)(v1 + 32));
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

unint64_t sub_23558E330()
{
  unint64_t result;

  result = qword_256248BA0;
  if (!qword_256248BA0)
  {
    result = MEMORY[0x23B7CFBF8](&protocol conformance descriptor for ManagedAppViewConfiguration, &type metadata for ManagedAppViewConfiguration);
    atomic_store(result, (unint64_t *)&qword_256248BA0);
  }
  return result;
}

uint64_t sub_23558E374(uint64_t a1, unint64_t a2)
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

uint64_t sub_23558E3B8()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23558E3DC()
{
  uint64_t v0;

  sub_23558E2FC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23558E40C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23558C09C(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_BYTE *)(v2 + 32), *(_QWORD *)(v2 + 40));
}

unint64_t sub_23558E41C()
{
  unint64_t result;

  result = qword_256248BA8;
  if (!qword_256248BA8)
  {
    result = MEMORY[0x23B7CFBF8](&protocol conformance descriptor for ManagedAppReply, &type metadata for ManagedAppReply);
    atomic_store(result, (unint64_t *)&qword_256248BA8);
  }
  return result;
}

uint64_t sub_23558E460(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_23558E470(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t MADViewServiceExtension.configuration.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  objc_class *v12;
  char *v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD v18[2];
  objc_super v19;

  v18[0] = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v18 - v10;
  (*(void (**)(uint64_t, uint64_t))(a2 + 40))(a1, a2);
  v12 = (objc_class *)type metadata accessor for MADViewServiceConfiguration.ExportedObject();
  v13 = (char *)objc_allocWithZone(v12);
  *(_QWORD *)&v13[OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUIP33_34AFEEE0F5A92C95419345CDA8C7B18F27MADViewServiceConfiguration14ExportedObject_xpcConnection] = 0;
  v19.receiver = v13;
  v19.super_class = v12;
  v14 = objc_msgSendSuper2(&v19, sel_init, v18[0]);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, AssociatedTypeWitness);
  v15 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a1;
  *(_QWORD *)(v16 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v16 + v15, v9, AssociatedTypeWitness);
  v18[1] = v14;
  swift_getAssociatedConformanceWitness();
  sub_23558E77C();
  sub_2355C8430();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, AssociatedTypeWitness);
}

uint64_t type metadata accessor for MADViewServiceConfiguration.ExportedObject()
{
  return objc_opt_self();
}

uint64_t sub_23558E680()
{
  uint64_t v0;
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80)), AssociatedTypeWitness);
  return swift_deallocObject();
}

uint64_t sub_23558E6F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 80);
  v4 = v1 + ((v3 + 32) & ~v3);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a1, v4, AssociatedTypeWitness);
}

unint64_t sub_23558E77C()
{
  unint64_t result;

  result = qword_256248C38;
  if (!qword_256248C38)
  {
    result = MEMORY[0x23B7CFBF8](&unk_2355C9F4C, &type metadata for MADViewServiceConfiguration);
    atomic_store(result, (unint64_t *)&qword_256248C38);
  }
  return result;
}

uint64_t MADViewServiceScene.body.getter(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *v1;
  v3 = v1[1];
  type metadata accessor for ExportedObject();
  v5 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256248C48);
  sub_2355C864C();
  *(_QWORD *)(v5 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject_connection) = 0;
  v6 = (_QWORD *)(v5 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject_reply);
  *v6 = 0;
  v6[1] = 0;
  v7 = (_QWORD *)swift_allocObject();
  v9 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v7[2] = v9;
  v7[3] = v8;
  v7[4] = v4;
  v7[5] = v3;
  v7[6] = v5;
  swift_retain();
  swift_retain();
  return sub_2355C8424();
}

uint64_t type metadata accessor for ExportedObject()
{
  uint64_t result;

  result = qword_256248D38;
  if (!qword_256248D38)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23558E91C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void (*v13)(char *, uint64_t);
  uint64_t v15;

  v5 = *(_QWORD *)(a2 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v15 - v9;
  v12(v11);
  sub_2355C82E4((uint64_t)v8, a2, (uint64_t)v10);
  v13 = *(void (**)(char *, uint64_t))(v5 + 8);
  v13(v8, a2);
  sub_2355C4BF4((uint64_t)v10, a2, a3);
  return ((uint64_t (*)(char *, uint64_t))v13)(v10, a2);
}

uint64_t sub_23558E9FC()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23558EA28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23558E91C(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_23558EA38(void *a1)
{
  uint64_t v1;

  objc_msgSend(a1, sel_setExportedObject_, v1);
  return sub_23558EA68(a1);
}

uint64_t sub_23558EA68(void *a1)
{
  uint64_t v1;
  unsigned __int8 v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend(a1, sel_auditToken);
  v3 = sub_235590B2C(v12, v13, v14, v15);
  if ((v3 & 1) != 0)
  {
    objc_msgSend(a1, sel_setExportedObject_, v1);
    v4 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_25624E4B0);
    objc_msgSend(a1, sel_setExportedInterface_, v4);

    objc_msgSend(a1, sel_resume);
    v5 = *(void **)(v1 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject_connection);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject_connection) = a1;

    v6 = a1;
  }
  else
  {
    if (qword_256248820 != -1)
      swift_once();
    v7 = sub_2355C85C8();
    __swift_project_value_buffer(v7, (uint64_t)qword_25624C3A0);
    v8 = sub_2355C85B0();
    v9 = sub_2355C9084();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_235588000, v8, v9, "Invalidating ViewService connection due to missing entitlements.", v10, 2u);
      MEMORY[0x23B7CFC88](v10, -1, -1);
    }

    objc_msgSend(a1, sel_invalidate);
  }
  return v3 & 1;
}

uint64_t MADViewServiceScene.init(content:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t ExportedObject.managedAppViewConfiguration.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2355C867C();
  swift_release();
  return swift_release();
}

double sub_23558EC7C@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  char v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2355C867C();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_BYTE *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_23558ED04()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_2355C8688();
}

uint64_t ExportedObject.managedAppViewConfiguration.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_2355C8688();
}

void (*ExportedObject.managedAppViewConfiguration.modify(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2355C8670();
  return sub_23558EE84;
}

void sub_23558EE84(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t ExportedObject.$managedAppViewConfiguration.getter()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256248C58);
  sub_2355C8658();
  return swift_endAccess();
}

uint64_t sub_23558EF30()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256248C58);
  sub_2355C8658();
  return swift_endAccess();
}

uint64_t sub_23558EF94(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, uint64_t, uint64_t);
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248C60);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v11 - v7;
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256248C58);
  sub_2355C8664();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t ExportedObject.$managedAppViewConfiguration.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248C60);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256248C58);
  sub_2355C8664();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*ExportedObject.$managedAppViewConfiguration.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248C60);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject__managedAppViewConfiguration;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_256248C58);
  sub_2355C8658();
  swift_endAccess();
  return sub_23558F240;
}

void sub_23558F240(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = (void *)v3[13];
  v6 = (void *)v3[14];
  v8 = v3[11];
  v7 = (void *)v3[12];
  v9 = v3[10];
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_2355C8664();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_2355C8664();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

uint64_t ExportedObject.set(managedAppViewData:reply:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t aBlock;
  uint64_t v30;
  uint64_t (*v31)();
  void *v32;
  uint64_t (*v33)();
  uint64_t v34;
  uint64_t v35;

  v5 = v4;
  v28 = a3;
  v7 = sub_2355C8E8C();
  v26 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2355C8EA4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2355C83A0();
  swift_allocObject();
  sub_2355C8394();
  sub_23558F778();
  sub_2355C8388();
  swift_release();
  v27 = a4;
  v14 = aBlock;
  v15 = v30;
  v16 = (char)v31;
  sub_2355905A8();
  v25 = sub_2355C90D8();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v4;
  *(_QWORD *)(v17 + 24) = v14;
  *(_QWORD *)(v17 + 32) = v15;
  *(_BYTE *)(v17 + 40) = v16;
  v33 = sub_235590610;
  v34 = v17;
  aBlock = MEMORY[0x24BDAC760];
  v30 = 1107296256;
  v31 = sub_23558F848;
  v32 = &block_descriptor_0;
  v18 = _Block_copy(&aBlock);
  swift_retain();
  sub_2355C8E98();
  v35 = MEMORY[0x24BEE4AF8];
  sub_235590638();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256248C80);
  sub_235590680();
  v19 = v27;
  sub_2355C9144();
  v20 = (void *)v25;
  MEMORY[0x23B7CF5EC](0, v13, v9, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  swift_release();
  v21 = (_QWORD *)(v5 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject_reply);
  v22 = *(_QWORD *)(v5 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject_reply);
  *v21 = v28;
  v21[1] = v19;
  sub_23558FF58(v22);
  return swift_retain();
}

unint64_t sub_23558F778()
{
  unint64_t result;

  result = qword_256248C68;
  if (!qword_256248C68)
  {
    result = MEMORY[0x23B7CFBF8](&protocol conformance descriptor for ManagedAppViewConfiguration, &type metadata for ManagedAppViewConfiguration);
    atomic_store(result, (unint64_t *)&qword_256248C68);
  }
  return result;
}

uint64_t sub_23558F7BC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_2355C8688();
}

uint64_t ExportedObject.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject__managedAppViewConfiguration;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248C58);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  sub_23558FF58(*(_QWORD *)(v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject_reply));
  return v0;
}

uint64_t ExportedObject.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject__managedAppViewConfiguration;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248C58);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  sub_23558FF58(*(_QWORD *)(v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject_reply));
  return swift_deallocClassInstance();
}

uint64_t sub_23558F9DC(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)();
  void *v18;
  void (*v19)();
  uint64_t v20;

  v15 = 0;
  MEMORY[0x23B7CFC94](&v15, 8);
  v3 = v15 << 32;
  v4 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_25624E4B0);
  objc_msgSend(a1, sel_setRemoteObjectInterface_, v4);

  v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = v3;
  *(_QWORD *)(v6 + 32) = 0;
  *(_BYTE *)(v6 + 40) = 0;
  v19 = sub_2355909E4;
  v20 = v6;
  v7 = MEMORY[0x24BDAC760];
  v15 = MEMORY[0x24BDAC760];
  v16 = 1107296256;
  v17 = sub_23558F848;
  v18 = &block_descriptor_21;
  v8 = _Block_copy(&v15);
  swift_release();
  objc_msgSend(a1, sel_setInvalidationHandler_, v8);
  _Block_release(v8);
  v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = v3;
  *(_QWORD *)(v10 + 32) = 0;
  *(_BYTE *)(v10 + 40) = 0;
  v19 = sub_235590A2C;
  v20 = v10;
  v15 = v7;
  v16 = 1107296256;
  v17 = sub_23558F848;
  v18 = &block_descriptor_28;
  v11 = _Block_copy(&v15);
  swift_release();
  objc_msgSend(a1, sel_setInterruptionHandler_, v11);
  _Block_release(v11);
  v12 = *(void **)(v1
                 + OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUIP33_34AFEEE0F5A92C95419345CDA8C7B18F27MADViewServiceConfiguration14ExportedObject_xpcConnection);
  *(_QWORD *)(v1
            + OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUIP33_34AFEEE0F5A92C95419345CDA8C7B18F27MADViewServiceConfiguration14ExportedObject_xpcConnection) = a1;
  v13 = a1;

  objc_msgSend(v13, sel_resume);
  return 1;
}

uint64_t sub_23558FBF0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_23558FC1C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t (*a5)(void), const char *a6)
{
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;

  v11 = a1 + 16;
  swift_beginAccess();
  v12 = (char *)MEMORY[0x23B7CFD18](v11);
  if (v12)
  {
    v13 = *(void **)&v12[OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUIP33_34AFEEE0F5A92C95419345CDA8C7B18F27MADViewServiceConfiguration14ExportedObject_xpcConnection];
    *(_QWORD *)&v12[OBJC_IVAR____TtCV31_ManagedAppDistribution_SwiftUIP33_34AFEEE0F5A92C95419345CDA8C7B18F27MADViewServiceConfiguration14ExportedObject_xpcConnection] = 0;

  }
  if (qword_256248820 != -1)
    swift_once();
  v14 = sub_2355C85C8();
  __swift_project_value_buffer(v14, (uint64_t)qword_25624C3A0);
  sub_23558E460(a2, a3, a4 & 1);
  sub_23558E460(a2, a3, a4 & 1);
  v15 = sub_2355C85B0();
  v16 = a5();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v21 = v18;
    *(_DWORD *)v17 = 136315138;
    if ((a4 & 1) != 0)
    {
      swift_bridgeObjectRetain();
      v19 = a2;
      v20 = a3;
    }
    else
    {
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      sub_23558E07C();
      sub_2355C8F4C();
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      v19 = 0;
      v20 = 0xE000000000000000;
    }
    sub_23558FF68(v19, v20, &v21);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    sub_23558E2FC(a2, a3, a4 & 1);
    sub_23558E2FC(a2, a3, a4 & 1);
    _os_log_impl(&dword_235588000, v15, v16, a6, v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7CFC88](v18, -1, -1);
    MEMORY[0x23B7CFC88](v17, -1, -1);
  }
  else
  {
    sub_23558E2FC(a2, a3, a4 & 1);
    sub_23558E2FC(a2, a3, a4 & 1);
  }

}

id sub_23558FEF0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MADViewServiceConfiguration.ExportedObject();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23558FF34(void *a1)
{
  return sub_23558F9DC(a1) & 1;
}

uint64_t sub_23558FF58(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_23558FF68(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_235590038(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_235590AEC((uint64_t)v12, *a3);
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
      sub_235590AEC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_235590038(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2355C912C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2355901F0(a5, a6);
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
  v8 = sub_2355C915C();
  if (!v8)
  {
    sub_2355C9168();
    __break(1u);
LABEL_17:
    result = sub_2355C9180();
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

uint64_t sub_2355901F0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_235590284(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23559045C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23559045C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_235590284(uint64_t a1, unint64_t a2)
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
      v3 = sub_2355903F8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2355C9150();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2355C9168();
      __break(1u);
LABEL_10:
      v2 = sub_2355C8F40();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2355C9180();
    __break(1u);
LABEL_14:
    result = sub_2355C9168();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2355903F8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256248E00);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23559045C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256248E00);
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
  result = sub_2355C9180();
  __break(1u);
  return result;
}

unint64_t sub_2355905A8()
{
  unint64_t result;

  result = qword_256248C70;
  if (!qword_256248C70)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256248C70);
  }
  return result;
}

uint64_t sub_2355905E4()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_235590610()
{
  return sub_23558F7BC();
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

unint64_t sub_235590638()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256248C78;
  if (!qword_256248C78)
  {
    v1 = sub_2355C8E8C();
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_256248C78);
  }
  return result;
}

unint64_t sub_235590680()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256248C88[0];
  if (!qword_256248C88[0])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248C80);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, qword_256248C88);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7CFBEC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_235590710(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x23B7CFBF8](&protocol conformance descriptor for MADViewServiceScene<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23559073C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t dispatch thunk of MADViewServiceExtension.body.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_235590780()
{
  return swift_allocateGenericValueMetadata();
}

_QWORD *sub_235590788(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_2355907B4()
{
  return swift_release();
}

_QWORD *sub_2355907BC(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_2355907F4(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_235590824(uint64_t *a1, int a2)
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

uint64_t sub_23559086C(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for MADViewServiceScene(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MADViewServiceScene);
}

uint64_t sub_2355908B4()
{
  return type metadata accessor for ExportedObject();
}

void sub_2355908BC()
{
  unint64_t v0;

  sub_235590948();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for ExportedObject()
{
  return swift_lookUpClassMethod();
}

void sub_235590948()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256248D48[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248C48);
    v0 = sub_2355C8694();
    if (!v1)
      atomic_store(v0, qword_256248D48);
  }
}

uint64_t sub_2355909A0()
{
  return MEMORY[0x24BDC7A50];
}

ValueMetadata *type metadata accessor for MADViewServiceConfiguration()
{
  return &type metadata for MADViewServiceConfiguration;
}

uint64_t sub_2355909BC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_2355909E4()
{
  sub_235590A40(MEMORY[0x24BEE7910], "[%s] XPC Connection to MAD framework invalidated");
}

uint64_t objectdestroy_17Tm()
{
  uint64_t v0;

  swift_release();
  sub_23558E2FC(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40));
  return swift_deallocObject();
}

void sub_235590A2C()
{
  sub_235590A40(MEMORY[0x24BEE7928], "[%s] XPC Connection to MAD framework interrupted");
}

void sub_235590A40(uint64_t (*a1)(void), const char *a2)
{
  uint64_t v2;

  sub_23558FC1C(*(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_BYTE *)(v2 + 40), a1, a2);
}

uint64_t sub_235590A68()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_235590A8C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = (id)sub_2355C840C();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

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

uint64_t sub_235590AEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_235590B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  const __CFAllocator *v4;
  SecTaskRef v5;
  __SecTask *v6;
  __CFString *v7;
  CFTypeRef v8;
  id v9;
  uint64_t v10;
  audit_token_t v12;

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  *(_QWORD *)v12.val = a1;
  *(_QWORD *)&v12.val[2] = a2;
  *(_QWORD *)&v12.val[4] = a3;
  *(_QWORD *)&v12.val[6] = a4;
  v5 = SecTaskCreateWithAuditToken(v4, &v12);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = (__CFString *)sub_2355C8ED4();
  v8 = SecTaskCopyValueForEntitlement(v6, v7, 0);

  if (v8)
  {
    objc_opt_self();
    v9 = (id)swift_dynamicCastObjCClass();
    if (v9)
    {
      v10 = sub_2355C8ED4();
      v9 = objc_msgSend(v9, sel_containsObject_, v10);

      v6 = (__SecTask *)v10;
    }
    swift_unknownObjectRelease();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B7CFB68](a1, v6, a5);
}

uint64_t sub_235590C94()
{
  return swift_allocateGenericValueMetadata();
}

void sub_235590C9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  type metadata accessor for ManagedAppCellContext(319, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a4);
  if (v4 <= 0x3F)
  {
    sub_235593DE4(319, (unint64_t *)&qword_256248E90, (void (*)(uint64_t))MEMORY[0x24BDEB418]);
    if (v5 <= 0x3F)
    {
      sub_235593D8C();
      if (v6 <= 0x3F)
      {
        sub_235593DE4(319, (unint64_t *)&qword_256248EA8, (void (*)(uint64_t))MEMORY[0x24BDEEEA0]);
        if (v7 <= 0x3F)
        {
          sub_235593E30();
          if (v8 <= 0x3F)
            swift_initStructMetadata();
        }
      }
    }
  }
}

_QWORD *sub_235590DA4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  unsigned int v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  __int128 v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  __int128 v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  _QWORD *v64;
  _QWORD *v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  _QWORD *v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  _QWORD *v76;
  _QWORD *v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  _QWORD *v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  unint64_t v87;
  unint64_t v88;
  void (*v89)(unint64_t, unint64_t, uint64_t);
  unint64_t v90;
  unint64_t v91;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  size_t __n;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = sub_2355C870C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_DWORD *)(v8 + 80);
  v103 = v8;
  v104 = v7;
  v10 = *(_QWORD *)(v8 + 64);
  if (v10 <= 8)
    v10 = 8;
  v109 = v10;
  v11 = sub_2355C8400();
  v12 = *(_QWORD *)(v11 - 8);
  v14 = *(_DWORD *)(v12 + 80);
  v13 = *(_DWORD *)(v12 + 84);
  v107 = v12;
  v108 = v11;
  v15 = *(_QWORD *)(v12 + 64);
  if (v13)
    v16 = v15;
  else
    v16 = v15 + 1;
  __n = v16;
  if (v16 <= 8)
    v16 = 8;
  v110 = v16;
  v17 = sub_2355C8994();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(_DWORD *)(v18 + 80);
  v105 = v18;
  v106 = v17;
  v20 = *(_QWORD *)(v18 + 64);
  if (v20 <= 8)
    v20 = 8;
  v111 = v20;
  v21 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(_DWORD *)(v22 + 80);
  v24 = v14 | v9 | v19 | *(_DWORD *)(v5 + 80);
  v25 = v24 & 0xF8 | v23;
  if (v25 > 7
    || ((v24 | *(_DWORD *)(v22 + 80)) & 0x100000) != 0
    || (v26 = (((((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
             + 63) & 0xFFFFFFFFFFFFFFF8,
        v27 = ~(unint64_t)(v9 & 0xF8) & 0xFFFFFFFFFFFFFFF8,
        v28 = (v9 & 0xF8) + 16,
        v29 = v14 & 0xF8 | 7,
        v30 = v19 & 0xF8 | 7,
        v31 = *(_QWORD *)(v22 + 64),
        ((v31
        + v23
        + ((v31
          + v23
          + ((v111
            + v23
            + 1
            + ((v110 + v30 + 1 + ((v109 + v29 + 1 + ((v28 + ((v26 + 23) & 0xFFFFFFFFFFFFFFF8)) & v27)) & ~v29)) & ~v30)) & ~v23)) & ~v23)) & ~v23)
      + v31 > 0x18))
  {
    v43 = *a2;
    *a1 = *a2;
    v44 = v43 + (((v25 | 7) + 16) & ~(unint64_t)(v25 | 7));
    swift_retain();
  }
  else
  {
    v94 = v14 & 0xF8 | 7;
    v95 = v109 + v29 + 1;
    v96 = v19 & 0xF8 | 7;
    v97 = v110 + v30 + 1;
    v98 = v111 + v23 + 1;
    v99 = v31 + v23;
    v100 = *(_QWORD *)(v21 - 8);
    v101 = v21;
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v5 + 16))(a1, a2, v4);
    v32 = ((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    v93 = (char *)a2 + 7;
    v33 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    v34 = *(_QWORD *)v33;
    v35 = *(_QWORD *)(v33 + 8);
    v36 = *(_BYTE *)(v33 + 16);
    sub_2355914F4(*(_QWORD *)v33, v35, v36);
    *(_QWORD *)v32 = v34;
    *(_QWORD *)(v32 + 8) = v35;
    *(_BYTE *)(v32 + 16) = v36;
    *(_QWORD *)(v32 + 24) = *(_QWORD *)(v33 + 24);
    v37 = (v32 + 39) & 0xFFFFFFFFFFFFFFF8;
    v38 = (v33 + 39) & 0xFFFFFFFFFFFFFFF8;
    v39 = *(_QWORD *)(v38 + 24);
    swift_bridgeObjectRetain();
    if (v39 < 0xFFFFFFFF)
    {
      v45 = *(_OWORD *)(v38 + 16);
      *(_OWORD *)v37 = *(_OWORD *)v38;
      *(_OWORD *)(v37 + 16) = v45;
    }
    else
    {
      v40 = *(_QWORD *)v38;
      v41 = *(_QWORD *)(v38 + 8);
      v42 = *(_BYTE *)(v38 + 16);
      sub_2355914F4(*(_QWORD *)v38, v41, v42);
      *(_QWORD *)v37 = v40;
      *(_QWORD *)(v37 + 8) = v41;
      *(_BYTE *)(v37 + 16) = v42;
      *(_QWORD *)(v37 + 24) = *(_QWORD *)(v38 + 24);
      swift_bridgeObjectRetain();
    }
    v46 = (v37 + 39) & 0xFFFFFFFFFFFFFFF8;
    v47 = (v38 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)(v47 + 24) < 0xFFFFFFFFuLL)
    {
      v51 = *(_OWORD *)(v47 + 16);
      *(_OWORD *)v46 = *(_OWORD *)v47;
      *(_OWORD *)(v46 + 16) = v51;
    }
    else
    {
      v48 = *(_QWORD *)v47;
      v49 = *(_QWORD *)(v47 + 8);
      v50 = *(_BYTE *)(v47 + 16);
      sub_2355914F4(*(_QWORD *)v47, v49, v50);
      *(_QWORD *)v46 = v48;
      *(_QWORD *)(v46 + 8) = v49;
      *(_BYTE *)(v46 + 16) = v50;
      *(_QWORD *)(v46 + 24) = *(_QWORD *)(v47 + 24);
      swift_bridgeObjectRetain();
    }
    v52 = v26 + 16;
    v53 = (v46 + 39) & 0xFFFFFFFFFFFFFFF8;
    v54 = (v47 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)(v54 + 24) < 0xFFFFFFFFuLL)
    {
      v58 = *(_OWORD *)(v54 + 16);
      *(_OWORD *)v53 = *(_OWORD *)v54;
      *(_OWORD *)(v53 + 16) = v58;
    }
    else
    {
      v55 = *(_QWORD *)v54;
      v56 = *(_QWORD *)(v54 + 8);
      v57 = *(_BYTE *)(v54 + 16);
      sub_2355914F4(*(_QWORD *)v54, v56, v57);
      *(_QWORD *)v53 = v55;
      *(_QWORD *)(v53 + 8) = v56;
      *(_BYTE *)(v53 + 16) = v57;
      *(_QWORD *)(v53 + 24) = *(_QWORD *)(v54 + 24);
      swift_bridgeObjectRetain();
    }
    v59 = (v53 + 39) & 0xFFFFFFFFFFFFFFF8;
    v60 = (v54 + 39) & 0xFFFFFFFFFFFFFFF8;
    v61 = *(_QWORD *)v60;
    v62 = *(_QWORD *)(v60 + 8);
    v63 = *(_BYTE *)(v60 + 16);
    sub_235591504(*(_QWORD *)v60, v62, v63);
    *(_QWORD *)v59 = v61;
    *(_QWORD *)(v59 + 8) = v62;
    *(_BYTE *)(v59 + 16) = v63;
    v64 = (_QWORD *)((v53 + 63) & 0xFFFFFFFFFFFFFFF8);
    v65 = (_QWORD *)((v54 + 63) & 0xFFFFFFFFFFFFFFF8);
    v66 = v65[1];
    *v64 = *v65;
    v64[1] = v66;
    v67 = ((unint64_t)a1 + v52 + 7) & 0xFFFFFFFFFFFFFFF8;
    v68 = (unint64_t)&v93[v52] & 0xFFFFFFFFFFFFFFF8;
    v69 = *(_QWORD *)v68;
    LOBYTE(v62) = *(_BYTE *)(v68 + 8);
    swift_retain();
    sub_23558C900(v69, v62);
    *(_QWORD *)v67 = v69;
    *(_BYTE *)(v67 + 8) = v62;
    v70 = (_QWORD *)((v28 + v67) & v27);
    v71 = (_QWORD *)((v28 + v68) & v27);
    v72 = *((unsigned __int8 *)v71 + v109);
    if (v72 >= 2)
    {
      if (v109 <= 3)
        v73 = v109;
      else
        v73 = 4;
      __asm { BR              X12 }
    }
    v74 = ~v94;
    if (v72 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v103 + 16))(v70, v71, v104);
      v75 = 1;
    }
    else
    {
      *v70 = *v71;
      swift_retain();
      v75 = 0;
    }
    *((_BYTE *)v70 + v109) = v75;
    v76 = (_QWORD *)(((unint64_t)v70 + v95) & v74);
    v77 = (_QWORD *)(((unint64_t)v71 + v95) & v74);
    v78 = *((unsigned __int8 *)v77 + v110);
    if (v78 >= 2)
    {
      if (v110 <= 3)
        v79 = v110;
      else
        v79 = 4;
      __asm { BR              X12 }
    }
    v80 = ~v96;
    if (v78 == 1)
    {
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v107 + 48))(v77, 1, v108))
      {
        memcpy(v76, v77, __n);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v107 + 16))(v76, v77, v108);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v107 + 56))(v76, 0, 1, v108);
      }
      *((_BYTE *)v76 + v110) = 1;
    }
    else
    {
      *v76 = *v77;
      *((_BYTE *)v76 + v110) = 0;
      swift_retain();
    }
    v81 = (_QWORD *)(((unint64_t)v76 + v97) & v80);
    v82 = (_QWORD *)(((unint64_t)v77 + v97) & v80);
    v83 = *((unsigned __int8 *)v82 + v111);
    if (v83 >= 2)
    {
      if (v111 <= 3)
        v84 = v111;
      else
        v84 = 4;
      __asm { BR              X12 }
    }
    v85 = ~v23;
    if (v83 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v105 + 16))(v81, v82, v106);
      v86 = 1;
    }
    else
    {
      *v81 = *v82;
      swift_retain();
      v86 = 0;
    }
    *((_BYTE *)v81 + v111) = v86;
    v87 = ((unint64_t)v81 + v98) & v85;
    v88 = ((unint64_t)v82 + v98) & v85;
    v89 = *(void (**)(unint64_t, unint64_t, uint64_t))(v100 + 16);
    v89(v87, v88, v101);
    v90 = (v99 + v87) & v85;
    v91 = (v99 + v88) & v85;
    v89(v90, v91, v101);
    v89((v99 + v90) & v85, (v99 + v91) & v85, v101);
    return a1;
  }
  return (_QWORD *)v44;
}

uint64_t sub_2355914F4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_235591504(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (a3 == 1)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_23559151C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v41)(uint64_t, uint64_t);

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v3 + 8))();
  v4 = *(_QWORD *)(v3 + 64);
  v5 = (a1 + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_235591958(*(_QWORD *)v5, *(_QWORD *)(v5 + 8), *(_BYTE *)(v5 + 16));
  swift_bridgeObjectRelease();
  v6 = (v5 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v6 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_235591958(*(_QWORD *)v6, *(_QWORD *)(v6 + 8), *(_BYTE *)(v6 + 16));
    swift_bridgeObjectRelease();
  }
  v7 = (v6 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v7 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_235591958(*(_QWORD *)v7, *(_QWORD *)(v7 + 8), *(_BYTE *)(v7 + 16));
    swift_bridgeObjectRelease();
  }
  v8 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v8 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_235591958(*(_QWORD *)v8, *(_QWORD *)(v8 + 8), *(_BYTE *)(v8 + 16));
    swift_bridgeObjectRelease();
  }
  sub_23558A9F8(*(_QWORD *)((v8 + 39) & 0xFFFFFFFFFFFFFFF8), *(_QWORD *)(((v8 + 39) & 0xFFFFFFFFFFFFFFF8) + 8), *(_BYTE *)(((v8 + 39) & 0xFFFFFFFFFFFFFFF8) + 16));
  swift_release();
  v9 = (a1
      + ((((((((((v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 23) & 0xFFFFFFFFFFFFFFF8;
  sub_23558CA44(*(_QWORD *)v9, *(_BYTE *)(v9 + 8));
  v10 = sub_2355C870C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_DWORD *)(v11 + 80) & 0xF8 | 7;
  v13 = (v9 + v12 + 9) & ~v12;
  if (*(_QWORD *)(v11 + 64) <= 8uLL)
    v14 = 8;
  else
    v14 = *(_QWORD *)(v11 + 64);
  v15 = *(unsigned __int8 *)(v13 + v14);
  if (v15 >= 2)
  {
    if (v14 <= 3)
      v16 = v14;
    else
      v16 = 4;
    __asm { BR              X13 }
  }
  if (v15 == 1)
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v13, v10);
  else
    swift_release();
  v17 = v14 + v13;
  v18 = sub_2355C8400();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(_DWORD *)(v19 + 80) & 0xF8 | 7;
  v21 = (v17 + v20 + 1) & ~v20;
  v22 = *(_QWORD *)(v19 + 64);
  if (!*(_DWORD *)(v19 + 84))
    ++v22;
  if (v22 <= 8)
    v23 = 8;
  else
    v23 = v22;
  v24 = *(unsigned __int8 *)(v21 + v23);
  if (v24 >= 2)
  {
    if (v23 <= 3)
      v25 = v23;
    else
      v25 = 4;
    __asm { BR              X12 }
  }
  if (v24 == 1)
  {
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v21, 1, v18))
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v21, v18);
  }
  else
  {
    swift_release();
  }
  v26 = sub_2355C8994();
  v27 = *(_QWORD *)(v26 - 8);
  v28 = *(_DWORD *)(v27 + 80) & 0xF8 | 7;
  v29 = (v23 + v21 + v28 + 1) & ~v28;
  if (*(_QWORD *)(v27 + 64) <= 8uLL)
    v30 = 8;
  else
    v30 = *(_QWORD *)(v27 + 64);
  v31 = *(unsigned __int8 *)(v29 + v30);
  if (v31 >= 2)
  {
    if (v30 <= 3)
      v32 = v30;
    else
      v32 = 4;
    __asm { BR              X13 }
  }
  if (v31 == 1)
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v29, v26);
  else
    swift_release();
  v33 = v30 + v29;
  v34 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v35 = *(_QWORD *)(v34 - 8);
  v36 = *(unsigned __int8 *)(v35 + 80);
  v37 = (v33 + v36 + 1) & ~v36;
  v41 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
  v41(v37, v34);
  v38 = *(_QWORD *)(v35 + 64) + v36;
  v39 = (v38 + v37) & ~v36;
  v41(v39, v34);
  return ((uint64_t (*)(uint64_t, uint64_t))v41)((v38 + v39) & ~v36, v34);
}

uint64_t sub_235591958(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_235591968(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  __int128 v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  _QWORD *v61;
  size_t v62;
  uint64_t v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  _QWORD *v71;
  uint64_t v72;
  unsigned int v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  void (*v82)(unint64_t, unint64_t, uint64_t);
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_QWORD *)v8;
  v10 = *(_QWORD *)(v8 + 8);
  v11 = *(_BYTE *)(v8 + 16);
  sub_2355914F4(*(_QWORD *)v8, v10, v11);
  *(_QWORD *)v7 = v9;
  *(_QWORD *)(v7 + 8) = v10;
  *(_BYTE *)(v7 + 16) = v11;
  *(_QWORD *)(v7 + 24) = *(_QWORD *)(v8 + 24);
  v12 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  v13 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  v14 = *(_QWORD *)(v13 + 24);
  swift_bridgeObjectRetain();
  if (v14 < 0xFFFFFFFF)
  {
    v18 = *(_OWORD *)(v13 + 16);
    *(_OWORD *)v12 = *(_OWORD *)v13;
    *(_OWORD *)(v12 + 16) = v18;
  }
  else
  {
    v15 = *(_QWORD *)v13;
    v16 = *(_QWORD *)(v13 + 8);
    v17 = *(_BYTE *)(v13 + 16);
    sub_2355914F4(*(_QWORD *)v13, v16, v17);
    *(_QWORD *)v12 = v15;
    *(_QWORD *)(v12 + 8) = v16;
    *(_BYTE *)(v12 + 16) = v17;
    *(_QWORD *)(v12 + 24) = *(_QWORD *)(v13 + 24);
    swift_bridgeObjectRetain();
  }
  v19 = (v12 + 39) & 0xFFFFFFFFFFFFFFF8;
  v20 = (v13 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v20 + 24) < 0xFFFFFFFFuLL)
  {
    v24 = *(_OWORD *)(v20 + 16);
    *(_OWORD *)v19 = *(_OWORD *)v20;
    *(_OWORD *)(v19 + 16) = v24;
  }
  else
  {
    v21 = *(_QWORD *)v20;
    v22 = *(_QWORD *)(v20 + 8);
    v23 = *(_BYTE *)(v20 + 16);
    sub_2355914F4(*(_QWORD *)v20, v22, v23);
    *(_QWORD *)v19 = v21;
    *(_QWORD *)(v19 + 8) = v22;
    *(_BYTE *)(v19 + 16) = v23;
    *(_QWORD *)(v19 + 24) = *(_QWORD *)(v20 + 24);
    swift_bridgeObjectRetain();
  }
  v25 = (v19 + 39) & 0xFFFFFFFFFFFFFFF8;
  v26 = (v20 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v26 + 24) < 0xFFFFFFFFuLL)
  {
    v30 = *(_OWORD *)(v26 + 16);
    *(_OWORD *)v25 = *(_OWORD *)v26;
    *(_OWORD *)(v25 + 16) = v30;
  }
  else
  {
    v27 = *(_QWORD *)v26;
    v28 = *(_QWORD *)(v26 + 8);
    v29 = *(_BYTE *)(v26 + 16);
    sub_2355914F4(*(_QWORD *)v26, v28, v29);
    *(_QWORD *)v25 = v27;
    *(_QWORD *)(v25 + 8) = v28;
    *(_BYTE *)(v25 + 16) = v29;
    *(_QWORD *)(v25 + 24) = *(_QWORD *)(v26 + 24);
    swift_bridgeObjectRetain();
  }
  v31 = (v25 + 39) & 0xFFFFFFFFFFFFFFF8;
  v32 = (v26 + 39) & 0xFFFFFFFFFFFFFFF8;
  v33 = *(_QWORD *)v32;
  v34 = *(_QWORD *)(v32 + 8);
  v35 = *(_BYTE *)(v32 + 16);
  sub_235591504(*(_QWORD *)v32, v34, v35);
  *(_QWORD *)v31 = v33;
  *(_QWORD *)(v31 + 8) = v34;
  *(_BYTE *)(v31 + 16) = v35;
  v36 = (_QWORD *)((v25 + 63) & 0xFFFFFFFFFFFFFFF8);
  v37 = (_QWORD *)((v26 + 63) & 0xFFFFFFFFFFFFFFF8);
  v38 = v37[1];
  *v36 = *v37;
  v36[1] = v38;
  v39 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  v40 = (a1 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
  v41 = (a2 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
  v42 = *(_QWORD *)v41;
  LOBYTE(v33) = *(_BYTE *)(v41 + 8);
  swift_retain();
  sub_23558C900(v42, v33);
  *(_QWORD *)v40 = v42;
  *(_BYTE *)(v40 + 8) = v33;
  v43 = sub_2355C870C();
  v44 = *(_QWORD *)(v43 - 8);
  v45 = *(_DWORD *)(v44 + 80) & 0xF8;
  v46 = v45 + 16;
  v47 = v45 + 16 + v40;
  v48 = ~v45 & 0xFFFFFFFFFFFFFFF8;
  v49 = (_QWORD *)(v47 & v48);
  v50 = (_QWORD *)((v46 + v41) & v48);
  if (*(_QWORD *)(v44 + 64) <= 8uLL)
    v51 = 8;
  else
    v51 = *(_QWORD *)(v44 + 64);
  v52 = *((unsigned __int8 *)v50 + v51);
  if (v52 >= 2)
  {
    if (v51 <= 3)
      v53 = v51;
    else
      v53 = 4;
    __asm { BR              X13 }
  }
  if (v52 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v44 + 16))(v49, v50, v43);
    v54 = 1;
  }
  else
  {
    *v49 = *v50;
    swift_retain();
    v54 = 0;
  }
  *((_BYTE *)v49 + v51) = v54;
  v55 = v51 + 1;
  v56 = sub_2355C8400();
  v57 = *(_QWORD *)(v56 - 8);
  v58 = *(_DWORD *)(v57 + 80) & 0xF8 | 7;
  v59 = v55 + v58;
  v60 = (_QWORD *)(((unint64_t)v49 + v55 + v58) & ~v58);
  v61 = (_QWORD *)(((unint64_t)v50 + v59) & ~v58);
  if (*(_DWORD *)(v57 + 84))
    v62 = *(_QWORD *)(v57 + 64);
  else
    v62 = *(_QWORD *)(v57 + 64) + 1;
  if (v62 <= 8)
    v63 = 8;
  else
    v63 = v62;
  v64 = *((unsigned __int8 *)v61 + v63);
  if (v64 >= 2)
  {
    if (v63 <= 3)
      v65 = v63;
    else
      v65 = 4;
    __asm { BR              X12 }
  }
  if (v64 == 1)
  {
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v57 + 48))(v61, 1, v56))
    {
      memcpy(v60, v61, v62);
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v57 + 16))(v60, v61, v56);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v57 + 56))(v60, 0, 1, v56);
    }
    *((_BYTE *)v60 + v63) = 1;
  }
  else
  {
    *v60 = *v61;
    *((_BYTE *)v60 + v63) = 0;
    swift_retain();
  }
  v66 = sub_2355C8994();
  v67 = *(_QWORD *)(v66 - 8);
  v68 = *(_DWORD *)(v67 + 80) & 0xF8 | 7;
  v69 = v63 + v68 + 1;
  v70 = (_QWORD *)(((unint64_t)v60 + v69) & ~v68);
  v71 = (_QWORD *)(((unint64_t)v61 + v69) & ~v68);
  if (*(_QWORD *)(v67 + 64) <= 8uLL)
    v72 = 8;
  else
    v72 = *(_QWORD *)(v67 + 64);
  v73 = *((unsigned __int8 *)v71 + v72);
  if (v73 >= 2)
  {
    if (v72 <= 3)
      v74 = v72;
    else
      v74 = 4;
    __asm { BR              X13 }
  }
  if (v73 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v67 + 16))(v70, v71, v66);
    v75 = 1;
  }
  else
  {
    *v70 = *v71;
    swift_retain();
    v75 = 0;
  }
  *((_BYTE *)v70 + v72) = v75;
  v76 = v72 + 1;
  v77 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v78 = *(_QWORD *)(v77 - 8);
  v79 = *(unsigned __int8 *)(v78 + 80);
  v80 = ((unint64_t)v70 + v76 + v79) & ~v79;
  v81 = ((unint64_t)v71 + v76 + v79) & ~v79;
  v82 = *(void (**)(unint64_t, unint64_t, uint64_t))(v78 + 16);
  v82(v80, v81, v77);
  v83 = *(_QWORD *)(v78 + 64) + v79;
  v84 = (v83 + v80) & ~v79;
  v85 = (v83 + v81) & ~v79;
  v82(v84, v85, v77);
  v82((v83 + v84) & ~v79, (v83 + v85) & ~v79, v77);
  return a1;
}

uint64_t sub_235591F58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  __int128 v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  __int128 v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  __int128 v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  _QWORD *v62;
  _QWORD *v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  _QWORD *v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t v80;
  unsigned int v81;
  uint64_t v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  _QWORD *v91;
  unint64_t v92;
  uint64_t v93;
  size_t v94;
  uint64_t v95;
  unsigned int v96;
  uint64_t v97;
  unsigned int v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD *v107;
  _QWORD *v108;
  uint64_t v109;
  unsigned int v110;
  uint64_t v111;
  unsigned int v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  unint64_t v119;
  void (*v120)(unint64_t, unint64_t, uint64_t);
  uint64_t v121;
  unint64_t v122;
  unint64_t v123;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_QWORD *)v8;
  v10 = *(_QWORD *)(v8 + 8);
  v11 = *(_BYTE *)(v8 + 16);
  sub_2355914F4(*(_QWORD *)v8, v10, v11);
  v12 = *(_QWORD *)v7;
  v13 = *(_QWORD *)(v7 + 8);
  v14 = *(_BYTE *)(v7 + 16);
  *(_QWORD *)v7 = v9;
  *(_QWORD *)(v7 + 8) = v10;
  *(_BYTE *)(v7 + 16) = v11;
  sub_235591958(v12, v13, v14);
  *(_QWORD *)(v7 + 24) = *(_QWORD *)(v8 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  v16 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  v17 = *(_QWORD *)(v16 + 24);
  if (*(_QWORD *)(v15 + 24) < 0xFFFFFFFFuLL)
  {
    if (v17 >= 0xFFFFFFFF)
    {
      v24 = *(_QWORD *)v16;
      v25 = *(_QWORD *)(v16 + 8);
      v26 = *(_BYTE *)(v16 + 16);
      sub_2355914F4(*(_QWORD *)v16, v25, v26);
      *(_QWORD *)v15 = v24;
      *(_QWORD *)(v15 + 8) = v25;
      *(_BYTE *)(v15 + 16) = v26;
      *(_QWORD *)(v15 + 24) = *(_QWORD *)(v16 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
  }
  else
  {
    if (v17 >= 0xFFFFFFFF)
    {
      v18 = *(_QWORD *)v16;
      v19 = *(_QWORD *)(v16 + 8);
      v20 = *(_BYTE *)(v16 + 16);
      sub_2355914F4(*(_QWORD *)v16, v19, v20);
      v21 = *(_QWORD *)v15;
      v22 = *(_QWORD *)(v15 + 8);
      v23 = *(_BYTE *)(v15 + 16);
      *(_QWORD *)v15 = v18;
      *(_QWORD *)(v15 + 8) = v19;
      *(_BYTE *)(v15 + 16) = v20;
      sub_235591958(v21, v22, v23);
      *(_QWORD *)(v15 + 24) = *(_QWORD *)(v16 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    sub_235591958(*(_QWORD *)v15, *(_QWORD *)(v15 + 8), *(_BYTE *)(v15 + 16));
    swift_bridgeObjectRelease();
  }
  v27 = *(_OWORD *)(v16 + 16);
  *(_OWORD *)v15 = *(_OWORD *)v16;
  *(_OWORD *)(v15 + 16) = v27;
LABEL_8:
  v28 = (v15 + 39) & 0xFFFFFFFFFFFFFFF8;
  v29 = (v16 + 39) & 0xFFFFFFFFFFFFFFF8;
  v30 = *(_QWORD *)(v29 + 24);
  if (*(_QWORD *)(v28 + 24) < 0xFFFFFFFFuLL)
  {
    if (v30 >= 0xFFFFFFFF)
    {
      v37 = *(_QWORD *)v29;
      v38 = *(_QWORD *)(v29 + 8);
      v39 = *(_BYTE *)(v29 + 16);
      sub_2355914F4(*(_QWORD *)v29, v38, v39);
      *(_QWORD *)v28 = v37;
      *(_QWORD *)(v28 + 8) = v38;
      *(_BYTE *)(v28 + 16) = v39;
      *(_QWORD *)(v28 + 24) = *(_QWORD *)(v29 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_15;
    }
  }
  else
  {
    if (v30 >= 0xFFFFFFFF)
    {
      v31 = *(_QWORD *)v29;
      v32 = *(_QWORD *)(v29 + 8);
      v33 = *(_BYTE *)(v29 + 16);
      sub_2355914F4(*(_QWORD *)v29, v32, v33);
      v34 = *(_QWORD *)v28;
      v35 = *(_QWORD *)(v28 + 8);
      v36 = *(_BYTE *)(v28 + 16);
      *(_QWORD *)v28 = v31;
      *(_QWORD *)(v28 + 8) = v32;
      *(_BYTE *)(v28 + 16) = v33;
      sub_235591958(v34, v35, v36);
      *(_QWORD *)(v28 + 24) = *(_QWORD *)(v29 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    sub_235591958(*(_QWORD *)v28, *(_QWORD *)(v28 + 8), *(_BYTE *)(v28 + 16));
    swift_bridgeObjectRelease();
  }
  v40 = *(_OWORD *)(v29 + 16);
  *(_OWORD *)v28 = *(_OWORD *)v29;
  *(_OWORD *)(v28 + 16) = v40;
LABEL_15:
  v41 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
  v42 = (v29 + 39) & 0xFFFFFFFFFFFFFFF8;
  v43 = *(_QWORD *)(v42 + 24);
  if (*(_QWORD *)(v41 + 24) < 0xFFFFFFFFuLL)
  {
    if (v43 >= 0xFFFFFFFF)
    {
      v50 = *(_QWORD *)v42;
      v51 = *(_QWORD *)(v42 + 8);
      v52 = *(_BYTE *)(v42 + 16);
      sub_2355914F4(*(_QWORD *)v42, v51, v52);
      *(_QWORD *)v41 = v50;
      *(_QWORD *)(v41 + 8) = v51;
      *(_BYTE *)(v41 + 16) = v52;
      *(_QWORD *)(v41 + 24) = *(_QWORD *)(v42 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_22;
    }
  }
  else
  {
    if (v43 >= 0xFFFFFFFF)
    {
      v44 = *(_QWORD *)v42;
      v45 = *(_QWORD *)(v42 + 8);
      v46 = *(_BYTE *)(v42 + 16);
      sub_2355914F4(*(_QWORD *)v42, v45, v46);
      v47 = *(_QWORD *)v41;
      v48 = *(_QWORD *)(v41 + 8);
      v49 = *(_BYTE *)(v41 + 16);
      *(_QWORD *)v41 = v44;
      *(_QWORD *)(v41 + 8) = v45;
      *(_BYTE *)(v41 + 16) = v46;
      sub_235591958(v47, v48, v49);
      *(_QWORD *)(v41 + 24) = *(_QWORD *)(v42 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_22;
    }
    sub_235591958(*(_QWORD *)v41, *(_QWORD *)(v41 + 8), *(_BYTE *)(v41 + 16));
    swift_bridgeObjectRelease();
  }
  v53 = *(_OWORD *)(v42 + 16);
  *(_OWORD *)v41 = *(_OWORD *)v42;
  *(_OWORD *)(v41 + 16) = v53;
LABEL_22:
  v54 = (v41 + 39) & 0xFFFFFFFFFFFFFFF8;
  v55 = (v42 + 39) & 0xFFFFFFFFFFFFFFF8;
  v56 = *(_QWORD *)v55;
  v57 = *(_QWORD *)(v55 + 8);
  v58 = *(_BYTE *)(v55 + 16);
  sub_235591504(*(_QWORD *)v55, v57, v58);
  v59 = *(_QWORD *)v54;
  v60 = *(_QWORD *)(v54 + 8);
  *(_QWORD *)v54 = v56;
  *(_QWORD *)(v54 + 8) = v57;
  v61 = *(_BYTE *)(v54 + 16);
  *(_BYTE *)(v54 + 16) = v58;
  sub_23558A9F8(v59, v60, v61);
  v62 = (_QWORD *)((v41 + 63) & 0xFFFFFFFFFFFFFFF8);
  v63 = (_QWORD *)((v42 + 63) & 0xFFFFFFFFFFFFFFF8);
  v64 = v63[1];
  *v62 = *v63;
  v62[1] = v64;
  swift_retain();
  swift_release();
  v65 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  v66 = (a1 + v65 + 7) & 0xFFFFFFFFFFFFFFF8;
  v67 = (a2 + v65 + 7) & 0xFFFFFFFFFFFFFFF8;
  v68 = *(_QWORD *)v67;
  LOBYTE(v56) = *(_BYTE *)(v67 + 8);
  sub_23558C900(*(_QWORD *)v67, v56);
  v69 = *(_QWORD *)v66;
  v70 = *(_BYTE *)(v66 + 8);
  *(_QWORD *)v66 = v68;
  *(_BYTE *)(v66 + 8) = v56;
  sub_23558CA44(v69, v70);
  v71 = sub_2355C870C();
  v72 = *(_QWORD *)(v71 - 8);
  v73 = *(_DWORD *)(v72 + 80) & 0xF8;
  v74 = v73 + 16;
  v75 = v73 + 16 + v66;
  v76 = ~v73 & 0xFFFFFFFFFFFFFFF8;
  v77 = (_QWORD *)(v75 & v76);
  v78 = (_QWORD *)((v74 + v67) & v76);
  if (*(_QWORD *)(v72 + 64) <= 8uLL)
    v79 = 8;
  else
    v79 = *(_QWORD *)(v72 + 64);
  if (v77 != v78)
  {
    v80 = v71;
    v81 = *((unsigned __int8 *)v77 + v79);
    if (v81 >= 2)
    {
      if (v79 <= 3)
        v82 = v79;
      else
        v82 = 4;
      __asm { BR              X12 }
    }
    if (v81 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v72 + 8))(v77, v71);
    else
      swift_release();
    v83 = *((unsigned __int8 *)v78 + v79);
    if (v83 >= 2)
    {
      if (v79 <= 3)
        v84 = v79;
      else
        v84 = 4;
      __asm { BR              X12 }
    }
    if (v83 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v72 + 16))(v77, v78, v80);
      *((_BYTE *)v77 + v79) = 1;
    }
    else
    {
      *v77 = *v78;
      *((_BYTE *)v77 + v79) = 0;
      swift_retain();
    }
  }
  v85 = sub_2355C8400();
  v86 = *(_QWORD *)(v85 - 8);
  v87 = *(_DWORD *)(v86 + 84);
  v88 = *(_DWORD *)(v86 + 80) & 0xF8 | 7;
  v89 = v79 + v88 + 1;
  v90 = (_QWORD *)(((unint64_t)v77 + v89) & ~v88);
  v91 = (_QWORD *)(((unint64_t)v78 + v89) & ~v88);
  v92 = *(_QWORD *)(v86 + 64);
  if (v90 != v91)
  {
    v93 = v85;
    if (v87)
      v94 = *(_QWORD *)(v86 + 64);
    else
      v94 = v92 + 1;
    if (v94 <= 8)
      v95 = 8;
    else
      v95 = v94;
    v96 = *((unsigned __int8 *)v90 + v95);
    if (v96 >= 2)
    {
      if (v95 <= 3)
        v97 = v95;
      else
        v97 = 4;
      __asm { BR              X12 }
    }
    if (v96 == 1)
    {
      if (!(*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v86 + 48))(v90, 1, v85))
        (*(void (**)(_QWORD *, uint64_t))(v86 + 8))(v90, v93);
    }
    else
    {
      swift_release();
    }
    v98 = *((unsigned __int8 *)v91 + v95);
    if (v98 >= 2)
    {
      if (v95 <= 3)
        v99 = v95;
      else
        v99 = 4;
      __asm { BR              X12 }
    }
    if (v98 == 1)
    {
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v86 + 48))(v91, 1, v93))
      {
        memcpy(v90, v91, v94);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v86 + 16))(v90, v91, v93);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v86 + 56))(v90, 0, 1, v93);
      }
      *((_BYTE *)v90 + v95) = 1;
    }
    else
    {
      *v90 = *v91;
      *((_BYTE *)v90 + v95) = 0;
      swift_retain();
    }
  }
  if (v87)
    v100 = v92;
  else
    v100 = v92 + 1;
  v101 = 8;
  if (v100 <= 8)
    v102 = 8;
  else
    v102 = v100;
  v103 = sub_2355C8994();
  v104 = *(_QWORD *)(v103 - 8);
  v105 = *(_DWORD *)(v104 + 80) & 0xF8 | 7;
  v106 = v102 + v105 + 1;
  v107 = (_QWORD *)(((unint64_t)v90 + v106) & ~v105);
  v108 = (_QWORD *)(((unint64_t)v91 + v106) & ~v105);
  if (*(_QWORD *)(v104 + 64) > 8uLL)
    v101 = *(_QWORD *)(v104 + 64);
  if (v107 != v108)
  {
    v109 = v103;
    v110 = *((unsigned __int8 *)v107 + v101);
    if (v110 >= 2)
    {
      if (v101 <= 3)
        v111 = v101;
      else
        v111 = 4;
      __asm { BR              X12 }
    }
    if (v110 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v104 + 8))(v107, v103);
    else
      swift_release();
    v112 = *((unsigned __int8 *)v108 + v101);
    if (v112 >= 2)
    {
      if (v101 <= 3)
        v113 = v101;
      else
        v113 = 4;
      __asm { BR              X12 }
    }
    if (v112 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v104 + 16))(v107, v108, v109);
      *((_BYTE *)v107 + v101) = 1;
    }
    else
    {
      *v107 = *v108;
      *((_BYTE *)v107 + v101) = 0;
      swift_retain();
    }
  }
  v114 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v115 = *(_QWORD *)(v114 - 8);
  v116 = *(unsigned __int8 *)(v115 + 80);
  v117 = v101 + v116 + 1;
  v118 = ((unint64_t)v107 + v117) & ~v116;
  v119 = ((unint64_t)v108 + v117) & ~v116;
  v120 = *(void (**)(unint64_t, unint64_t, uint64_t))(v115 + 24);
  v120(v118, v119, v114);
  v121 = *(_QWORD *)(v115 + 64) + v116;
  v122 = (v121 + v118) & ~v116;
  v123 = (v121 + v119) & ~v116;
  v120(v122, v123, v114);
  v120((v121 + v122) & ~v116, (v121 + v123) & ~v116, v114);
  return a1;
}

uint64_t sub_23559297C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  __int128 v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;
  _OWORD *v13;
  _OWORD *v14;
  __int128 v15;
  _OWORD *v16;
  _OWORD *v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  size_t v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  unsigned int v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  void (*v65)(unint64_t, unint64_t, uint64_t);
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  v10 = (_OWORD *)(((unint64_t)v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  v11 = (_OWORD *)(((unint64_t)v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  v13 = (_OWORD *)(((unint64_t)v10 + 39) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_OWORD *)(((unint64_t)v11 + 39) & 0xFFFFFFFFFFFFFFF8);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = (_OWORD *)(((unint64_t)v13 + 39) & 0xFFFFFFFFFFFFFFF8);
  v17 = (_OWORD *)(((unint64_t)v14 + 39) & 0xFFFFFFFFFFFFFFF8);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = ((unint64_t)v16 + 39) & 0xFFFFFFFFFFFFFFF8;
  v20 = ((unint64_t)v17 + 39) & 0xFFFFFFFFFFFFFFF8;
  v21 = *(_BYTE *)(v20 + 16);
  *(_OWORD *)v19 = *(_OWORD *)v20;
  *(_BYTE *)(v19 + 16) = v21;
  *(_OWORD *)(((unint64_t)v16 + 63) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v17 + 63) & 0xFFFFFFFFFFFFF8);
  v22 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  v23 = (a1 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  v24 = (a2 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  LOBYTE(v22) = *(_BYTE *)(v24 + 8);
  *(_QWORD *)v23 = *(_QWORD *)v24;
  *(_BYTE *)(v23 + 8) = v22;
  v25 = sub_2355C870C();
  v26 = *(_QWORD *)(v25 - 8);
  v27 = *(_DWORD *)(v26 + 80) & 0xF8;
  v28 = v27 + 16;
  v29 = v27 + 16 + v23;
  v30 = ~v27 & 0xFFFFFFFFFFFFFFF8;
  v31 = (_QWORD *)(v29 & v30);
  v32 = (_QWORD *)((v28 + v24) & v30);
  if (*(_QWORD *)(v26 + 64) <= 8uLL)
    v33 = 8;
  else
    v33 = *(_QWORD *)(v26 + 64);
  v34 = *((unsigned __int8 *)v32 + v33);
  if (v34 >= 2)
  {
    if (v33 <= 3)
      v35 = v33;
    else
      v35 = 4;
    __asm { BR              X13 }
  }
  if (v34 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v26 + 32))(v31, v32, v25);
    v36 = 1;
  }
  else
  {
    v36 = 0;
    *v31 = *v32;
  }
  *((_BYTE *)v31 + v33) = v36;
  v37 = v33 + 1;
  v38 = sub_2355C8400();
  v39 = *(_QWORD *)(v38 - 8);
  v40 = *(_DWORD *)(v39 + 80) & 0xF8 | 7;
  v41 = v37 + v40;
  v42 = (_QWORD *)(((unint64_t)v31 + v37 + v40) & ~v40);
  v43 = (_QWORD *)(((unint64_t)v32 + v41) & ~v40);
  if (*(_DWORD *)(v39 + 84))
    v44 = *(_QWORD *)(v39 + 64);
  else
    v44 = *(_QWORD *)(v39 + 64) + 1;
  if (v44 <= 8)
    v45 = 8;
  else
    v45 = v44;
  v46 = *((unsigned __int8 *)v43 + v45);
  if (v46 >= 2)
  {
    if (v45 <= 3)
      v47 = v45;
    else
      v47 = 4;
    __asm { BR              X12 }
  }
  if (v46 == 1)
  {
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v39 + 48))(v43, 1, v38))
    {
      memcpy(v42, v43, v44);
      v48 = 1;
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v39 + 32))(v42, v43, v38);
      v48 = 1;
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v39 + 56))(v42, 0, 1, v38);
    }
  }
  else
  {
    v48 = 0;
    *v42 = *v43;
  }
  *((_BYTE *)v42 + v45) = v48;
  v49 = sub_2355C8994();
  v50 = *(_QWORD *)(v49 - 8);
  v51 = *(_DWORD *)(v50 + 80) & 0xF8 | 7;
  v52 = v45 + v51 + 1;
  v53 = (_QWORD *)(((unint64_t)v42 + v52) & ~v51);
  v54 = (_QWORD *)(((unint64_t)v43 + v52) & ~v51);
  if (*(_QWORD *)(v50 + 64) <= 8uLL)
    v55 = 8;
  else
    v55 = *(_QWORD *)(v50 + 64);
  v56 = *((unsigned __int8 *)v54 + v55);
  if (v56 >= 2)
  {
    if (v55 <= 3)
      v57 = v55;
    else
      v57 = 4;
    __asm { BR              X13 }
  }
  if (v56 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v50 + 32))(v53, v54, v49);
    v58 = 1;
  }
  else
  {
    v58 = 0;
    *v53 = *v54;
  }
  *((_BYTE *)v53 + v55) = v58;
  v59 = v55 + 1;
  v60 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v61 = *(_QWORD *)(v60 - 8);
  v62 = *(unsigned __int8 *)(v61 + 80);
  v63 = ((unint64_t)v53 + v59 + v62) & ~v62;
  v64 = ((unint64_t)v54 + v59 + v62) & ~v62;
  v65 = *(void (**)(unint64_t, unint64_t, uint64_t))(v61 + 32);
  v65(v63, v64, v60);
  v66 = *(_QWORD *)(v61 + 64) + v62;
  v67 = (v66 + v63) & ~v62;
  v68 = (v66 + v64) & ~v62;
  v65(v67, v68, v60);
  v65((v66 + v67) & ~v62, (v66 + v68) & ~v62, v60);
  return a1;
}

uint64_t sub_235592E3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  unint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  _QWORD *v67;
  unint64_t v68;
  uint64_t v69;
  size_t v70;
  uint64_t v71;
  unsigned int v72;
  uint64_t v73;
  unsigned int v74;
  uint64_t v75;
  char v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  _QWORD *v85;
  uint64_t v86;
  unsigned int v87;
  uint64_t v88;
  unsigned int v89;
  uint64_t v90;
  char v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  void (*v98)(unint64_t, unint64_t, uint64_t);
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_BYTE *)(v8 + 16);
  v10 = *(_QWORD *)v7;
  v11 = *(_QWORD *)(v7 + 8);
  v12 = *(_BYTE *)(v7 + 16);
  *(_OWORD *)v7 = *(_OWORD *)v8;
  *(_BYTE *)(v7 + 16) = v9;
  sub_235591958(v10, v11, v12);
  *(_QWORD *)(v7 + 24) = *(_QWORD *)(v8 + 24);
  swift_bridgeObjectRelease();
  v13 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  v14 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v13 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(_QWORD *)(v14 + 24) >= 0xFFFFFFFFuLL)
    {
      v15 = *(_BYTE *)(v14 + 16);
      v16 = *(_QWORD *)v13;
      v17 = *(_QWORD *)(v13 + 8);
      v18 = *(_BYTE *)(v13 + 16);
      *(_OWORD *)v13 = *(_OWORD *)v14;
      *(_BYTE *)(v13 + 16) = v15;
      sub_235591958(v16, v17, v18);
      *(_QWORD *)(v13 + 24) = *(_QWORD *)(v14 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_235591958(*(_QWORD *)v13, *(_QWORD *)(v13 + 8), *(_BYTE *)(v13 + 16));
    swift_bridgeObjectRelease();
  }
  v19 = *(_OWORD *)(v14 + 16);
  *(_OWORD *)v13 = *(_OWORD *)v14;
  *(_OWORD *)(v13 + 16) = v19;
LABEL_6:
  v20 = (v13 + 39) & 0xFFFFFFFFFFFFFFF8;
  v21 = (v14 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v20 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(_QWORD *)(v21 + 24) >= 0xFFFFFFFFuLL)
    {
      v22 = *(_BYTE *)(v21 + 16);
      v23 = *(_QWORD *)v20;
      v24 = *(_QWORD *)(v20 + 8);
      v25 = *(_BYTE *)(v20 + 16);
      *(_OWORD *)v20 = *(_OWORD *)v21;
      *(_BYTE *)(v20 + 16) = v22;
      sub_235591958(v23, v24, v25);
      *(_QWORD *)(v20 + 24) = *(_QWORD *)(v21 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    sub_235591958(*(_QWORD *)v20, *(_QWORD *)(v20 + 8), *(_BYTE *)(v20 + 16));
    swift_bridgeObjectRelease();
  }
  v26 = *(_OWORD *)(v21 + 16);
  *(_OWORD *)v20 = *(_OWORD *)v21;
  *(_OWORD *)(v20 + 16) = v26;
LABEL_11:
  v27 = (v20 + 39) & 0xFFFFFFFFFFFFFFF8;
  v28 = (v21 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v27 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(_QWORD *)(v28 + 24) >= 0xFFFFFFFFuLL)
    {
      v29 = *(_BYTE *)(v28 + 16);
      v30 = *(_QWORD *)v27;
      v31 = *(_QWORD *)(v27 + 8);
      v32 = *(_BYTE *)(v27 + 16);
      *(_OWORD *)v27 = *(_OWORD *)v28;
      *(_BYTE *)(v27 + 16) = v29;
      sub_235591958(v30, v31, v32);
      *(_QWORD *)(v27 + 24) = *(_QWORD *)(v28 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_16;
    }
    sub_235591958(*(_QWORD *)v27, *(_QWORD *)(v27 + 8), *(_BYTE *)(v27 + 16));
    swift_bridgeObjectRelease();
  }
  v33 = *(_OWORD *)(v28 + 16);
  *(_OWORD *)v27 = *(_OWORD *)v28;
  *(_OWORD *)(v27 + 16) = v33;
LABEL_16:
  v34 = (v27 + 39) & 0xFFFFFFFFFFFFFFF8;
  v35 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
  v36 = *(_BYTE *)(v35 + 16);
  v37 = *(_QWORD *)v34;
  v38 = *(_QWORD *)(v34 + 8);
  *(_OWORD *)v34 = *(_OWORD *)v35;
  v39 = *(_BYTE *)(v34 + 16);
  *(_BYTE *)(v34 + 16) = v36;
  sub_23558A9F8(v37, v38, v39);
  *(_OWORD *)((v27 + 63) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v28 + 63) & 0xFFFFFFFFFFFFF8);
  swift_release();
  v40 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  v41 = (a1 + v40 + 7) & 0xFFFFFFFFFFFFFFF8;
  v42 = (a2 + v40 + 7) & 0xFFFFFFFFFFFFFFF8;
  v43 = *(_BYTE *)(v42 + 8);
  v44 = *(_QWORD *)v41;
  v45 = *(_BYTE *)(v41 + 8);
  *(_QWORD *)v41 = *(_QWORD *)v42;
  *(_BYTE *)(v41 + 8) = v43;
  sub_23558CA44(v44, v45);
  v46 = sub_2355C870C();
  v47 = *(_QWORD *)(v46 - 8);
  v48 = *(_DWORD *)(v47 + 80) & 0xF8;
  v49 = v48 + 16;
  v50 = v48 + 16 + v41;
  v51 = ~v48 & 0xFFFFFFFFFFFFFFF8;
  v52 = (_QWORD *)(v50 & v51);
  v53 = (_QWORD *)((v49 + v42) & v51);
  if (*(_QWORD *)(v47 + 64) <= 8uLL)
    v54 = 8;
  else
    v54 = *(_QWORD *)(v47 + 64);
  if (v52 != v53)
  {
    v55 = v46;
    v56 = *((unsigned __int8 *)v52 + v54);
    if (v56 >= 2)
    {
      if (v54 <= 3)
        v57 = v54;
      else
        v57 = 4;
      __asm { BR              X12 }
    }
    if (v56 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v47 + 8))(v52, v46);
    else
      swift_release();
    v58 = *((unsigned __int8 *)v53 + v54);
    if (v58 >= 2)
    {
      if (v54 <= 3)
        v59 = v54;
      else
        v59 = 4;
      __asm { BR              X12 }
    }
    if (v58 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v47 + 32))(v52, v53, v55);
      v60 = 1;
    }
    else
    {
      v60 = 0;
      *v52 = *v53;
    }
    *((_BYTE *)v52 + v54) = v60;
  }
  v61 = sub_2355C8400();
  v62 = *(_QWORD *)(v61 - 8);
  v63 = *(_DWORD *)(v62 + 84);
  v64 = *(_DWORD *)(v62 + 80) & 0xF8 | 7;
  v65 = v54 + v64 + 1;
  v66 = (_QWORD *)(((unint64_t)v52 + v65) & ~v64);
  v67 = (_QWORD *)(((unint64_t)v53 + v65) & ~v64);
  v68 = *(_QWORD *)(v62 + 64);
  if (v66 != v67)
  {
    v69 = v61;
    if (v63)
      v70 = *(_QWORD *)(v62 + 64);
    else
      v70 = v68 + 1;
    if (v70 <= 8)
      v71 = 8;
    else
      v71 = v70;
    v72 = *((unsigned __int8 *)v66 + v71);
    if (v72 >= 2)
    {
      if (v71 <= 3)
        v73 = v71;
      else
        v73 = 4;
      __asm { BR              X12 }
    }
    if (v72 == 1)
    {
      if (!(*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v62 + 48))(v66, 1, v61))
        (*(void (**)(_QWORD *, uint64_t))(v62 + 8))(v66, v69);
    }
    else
    {
      swift_release();
    }
    v74 = *((unsigned __int8 *)v67 + v71);
    if (v74 >= 2)
    {
      if (v71 <= 3)
        v75 = v71;
      else
        v75 = 4;
      __asm { BR              X12 }
    }
    if (v74 == 1)
    {
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v62 + 48))(v67, 1, v69))
      {
        memcpy(v66, v67, v70);
        v76 = 1;
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v62 + 32))(v66, v67, v69);
        v76 = 1;
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v62 + 56))(v66, 0, 1, v69);
      }
    }
    else
    {
      v76 = 0;
      *v66 = *v67;
    }
    *((_BYTE *)v66 + v71) = v76;
  }
  if (v63)
    v77 = v68;
  else
    v77 = v68 + 1;
  v78 = 8;
  if (v77 <= 8)
    v79 = 8;
  else
    v79 = v77;
  v80 = sub_2355C8994();
  v81 = *(_QWORD *)(v80 - 8);
  v82 = *(_DWORD *)(v81 + 80) & 0xF8 | 7;
  v83 = v79 + v82 + 1;
  v84 = (_QWORD *)(((unint64_t)v66 + v83) & ~v82);
  v85 = (_QWORD *)(((unint64_t)v67 + v83) & ~v82);
  if (*(_QWORD *)(v81 + 64) > 8uLL)
    v78 = *(_QWORD *)(v81 + 64);
  if (v84 != v85)
  {
    v86 = v80;
    v87 = *((unsigned __int8 *)v84 + v78);
    if (v87 >= 2)
    {
      if (v78 <= 3)
        v88 = v78;
      else
        v88 = 4;
      __asm { BR              X12 }
    }
    if (v87 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v81 + 8))(v84, v80);
    else
      swift_release();
    v89 = *((unsigned __int8 *)v85 + v78);
    if (v89 >= 2)
    {
      if (v78 <= 3)
        v90 = v78;
      else
        v90 = 4;
      __asm { BR              X12 }
    }
    if (v89 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v81 + 32))(v84, v85, v86);
      v91 = 1;
    }
    else
    {
      v91 = 0;
      *v84 = *v85;
    }
    *((_BYTE *)v84 + v78) = v91;
  }
  v92 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v93 = *(_QWORD *)(v92 - 8);
  v94 = *(unsigned __int8 *)(v93 + 80);
  v95 = v78 + v94 + 1;
  v96 = ((unint64_t)v84 + v95) & ~v94;
  v97 = ((unint64_t)v85 + v95) & ~v94;
  v98 = *(void (**)(unint64_t, unint64_t, uint64_t))(v93 + 40);
  v98(v96, v97, v92);
  v99 = *(_QWORD *)(v93 + 64) + v94;
  v100 = (v99 + v96) & ~v94;
  v101 = (v99 + v97) & ~v94;
  v98(v100, v101, v92);
  v98((v99 + v100) & ~v94, (v99 + v101) & ~v94, v92);
  return a1;
}

uint64_t sub_235593678(unint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  int v32;
  unsigned int v34;
  int v35;
  int v36;
  uint64_t (*v37)(unint64_t);
  unint64_t v38;
  unsigned int v39;
  unint64_t v40;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v39 = *(_DWORD *)(v4 + 84);
  if (v39 <= 0x7FFFFFFF)
    v5 = 0x7FFFFFFF;
  else
    v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(sub_2355C870C() - 8);
  v7 = *(_QWORD *)(v6 + 64);
  if (v7 <= 8)
    v7 = 8;
  v40 = v7;
  v8 = *(_QWORD *)(sub_2355C8400() - 8);
  v9 = *(_DWORD *)(v8 + 84);
  v10 = *(_QWORD *)(v8 + 64);
  v11 = *(_QWORD *)(sub_2355C8994() - 8);
  if (*(_QWORD *)(v11 + 64) <= 8uLL)
    v12 = 8;
  else
    v12 = *(_QWORD *)(v11 + 64);
  v13 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_256248E08) - 8);
  v14 = *(_DWORD *)(v13 + 84);
  if (v14 <= v5)
    v15 = v5;
  else
    v15 = *(_DWORD *)(v13 + 84);
  if (v9)
    v16 = v10;
  else
    v16 = v10 + 1;
  if (v16 <= 8)
    v17 = 8;
  else
    v17 = v16;
  if (!a2)
    return 0;
  v18 = *(_QWORD *)(v4 + 64);
  v19 = (((((((((v18 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
       + 63) & 0xFFFFFFFFFFFFFFF8;
  v20 = *(_DWORD *)(v6 + 80) & 0xF8;
  v21 = ~v20 & 0xFFFFFFFFFFFFFFF8;
  v22 = v20 + 16;
  v23 = *(_DWORD *)(v8 + 80) & 0xF8 | 7;
  v24 = a1;
  v25 = v40 + v23 + 1;
  v26 = *(_DWORD *)(v11 + 80) & 0xF8 | 7;
  v27 = v17 + v26 + 1;
  v28 = *(unsigned __int8 *)(v13 + 80);
  v29 = v12 + v28 + 1;
  if (a2 <= v15)
    goto LABEL_38;
  v30 = ((*(_QWORD *)(v13 + 64)
        + v28
        + ((*(_QWORD *)(v13 + 64)
          + v28
          + ((v29 + ((v27 + ((v25 + ((v22 + ((v19 + 23) & 0xFFFFFFFFFFFFFFF8)) & v21)) & ~v23)) & ~v26)) & ~v28)) & ~v28)) & ~v28)
      + *(_QWORD *)(v13 + 64);
  v31 = 8 * v30;
  if (v30 > 3)
    goto LABEL_21;
  v34 = ((a2 - v15 + ~(-1 << v31)) >> v31) + 1;
  if (HIWORD(v34))
  {
    v32 = *(_DWORD *)(a1 + v30);
    if (v32)
      goto LABEL_29;
  }
  else
  {
    if (v34 <= 0xFF)
    {
      if (v34 < 2)
        goto LABEL_38;
LABEL_21:
      v32 = *(unsigned __int8 *)(a1 + v30);
      if (!*(_BYTE *)(a1 + v30))
        goto LABEL_38;
LABEL_29:
      v35 = (v32 - 1) << v31;
      if (v30 > 3)
        v35 = 0;
      if ((_DWORD)v30)
      {
        if (v30 <= 3)
          v36 = v30;
        else
          v36 = 4;
        __asm { BR              X12 }
      }
      return v15 + v35 + 1;
    }
    v32 = *(unsigned __int16 *)(a1 + v30);
    if (*(_WORD *)(a1 + v30))
      goto LABEL_29;
  }
LABEL_38:
  if (v5 < v14)
  {
    v24 = (v29 + ((v27 + ((v25 + ((v22 + ((a1 + v19 + 23) & 0xFFFFFFFFFFFFFFF8)) & v21)) & ~v23)) & ~v26)) & ~v28;
    v37 = *(uint64_t (**)(unint64_t))(v13 + 48);
    return v37(v24);
  }
  if (v39 >= 0x7FFFFFFF)
  {
    v37 = *(uint64_t (**)(unint64_t))(v4 + 48);
    return v37(v24);
  }
  v38 = *(_QWORD *)(((a1 + v18 + 7) & 0xFFFFFFFFFFFFF8) + 0x18);
  if (v38 >= 0xFFFFFFFF)
    LODWORD(v38) = -1;
  return (v38 + 1);
}

void sub_2355939A0(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  size_t v20;
  _BYTE *v21;
  unsigned int v22;
  unsigned int v23;
  int v24;
  unsigned int v25;
  int v26;

  v4 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v4 + 84) <= 0x7FFFFFFFu)
    v5 = 0x7FFFFFFF;
  else
    v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(sub_2355C870C() - 8);
  if (*(_QWORD *)(v6 + 64) <= 8uLL)
    v7 = 8;
  else
    v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(sub_2355C8400() - 8);
  v9 = *(_DWORD *)(v8 + 84);
  v10 = *(_QWORD *)(v8 + 64);
  v11 = *(_QWORD *)(sub_2355C8994() - 8);
  if (*(_QWORD *)(v11 + 64) <= 8uLL)
    v12 = 8;
  else
    v12 = *(_QWORD *)(v11 + 64);
  v13 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_256248E08) - 8);
  if (*(_DWORD *)(v13 + 84) <= v5)
    v14 = v5;
  else
    v14 = *(_DWORD *)(v13 + 84);
  if (v9)
    v17 = v10;
  else
    v17 = v10 + 1;
  if (v17 <= 8)
    v17 = 8;
  v18 = *(_DWORD *)(v11 + 80) & 0xF8 | 7;
  v19 = *(unsigned __int8 *)(v13 + 80);
  v15 = *(_DWORD *)(v6 + 80) & 0xF8;
  v16 = *(_DWORD *)(v8 + 80) & 0xF8 | 7;
  v20 = ((*(_QWORD *)(v13 + 64)
        + v19
        + ((*(_QWORD *)(v13 + 64)
          + v19
          + ((v12
            + v19
            + 1
            + ((v17
              + v18
              + 1
              + ((v7
                + v16
                + 1
                + ((v15
                  + 16
                  + ((((((((((((*(_QWORD *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
                        + 39) & 0xFFFFFFFFFFFFFFF8)
                      + 63) & 0xFFFFFFFFFFFFFFF8)
                    + 23) & 0xFFFFFFFFFFFFFFF8)) & ~v15 & 0xFFFFFFFFFFFFFFF8)) & ~v16)) & ~v18)) & ~v19)) & ~v19)) & ~v19)
      + *(_QWORD *)(v13 + 64);
  if (a3 <= v14)
  {
    v23 = 0;
    v21 = a1;
    v22 = a2;
  }
  else
  {
    v21 = a1;
    v22 = a2;
    if (v20 <= 3)
    {
      v25 = ((a3 - v14 + ~(-1 << (8 * v20))) >> (8 * v20)) + 1;
      if (HIWORD(v25))
      {
        v23 = 4u;
      }
      else if (v25 >= 0x100)
      {
        v23 = 2;
      }
      else
      {
        v23 = v25 > 1;
      }
    }
    else
    {
      v23 = 1u;
    }
  }
  if (v14 < v22)
  {
    v24 = ~v14 + v22;
    if (v20 < 4)
    {
      if ((_DWORD)v20)
      {
        v26 = v24 & ~(-1 << (8 * v20));
        bzero(v21, v20);
        if ((_DWORD)v20 == 3)
        {
          *(_WORD *)v21 = v26;
          v21[2] = BYTE2(v26);
        }
        else if ((_DWORD)v20 == 2)
        {
          *(_WORD *)v21 = v26;
        }
        else
        {
          *v21 = v26;
        }
      }
    }
    else
    {
      bzero(v21, v20);
      *(_DWORD *)v21 = v24;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X5 }
}

uint64_t type metadata accessor for DefaultManagedAppCell(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DefaultManagedAppCell);
}

void sub_235593D8C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256248E98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EA0);
    v0 = sub_2355C8718();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256248E98);
  }
}

void sub_235593DE4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_2355C8718();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_235593E30()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256248EB0)
  {
    sub_235593E88();
    v0 = sub_2355C8754();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256248EB0);
  }
}

unint64_t sub_235593E88()
{
  unint64_t result;

  result = qword_256248EB8;
  if (!qword_256248EB8)
  {
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BEE13D0], MEMORY[0x24BEE13C8]);
    atomic_store(result, (unint64_t *)&qword_256248EB8);
  }
  return result;
}

uint64_t sub_235593ECC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235593F00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;

  v2 = v1 + *(int *)(a1 + 36);
  v3 = *(_QWORD *)v2;
  v4 = *(_BYTE *)(v2 + 8);
  sub_23558C900(*(_QWORD *)v2, v4);
  v5 = sub_23559D804(v3, v4);
  sub_23558CA44(v3, v4);
  return v5 & 1;
}

uint64_t sub_235593F5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  uint64_t OpaqueTypeConformance2;
  uint64_t v38;
  uint64_t v39;
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
  _QWORD v53[2];
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[3];

  v50 = a2;
  sub_2355C8820();
  sub_2355C8AB4();
  sub_2355C8820();
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  sub_2355C8820();
  sub_2355C89D0();
  v3 = sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248ED0);
  swift_getTupleTypeMetadata3();
  v4 = sub_2355C8E50();
  v5 = MEMORY[0x24BDF5428];
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDF5428], v4);
  v6 = sub_2355C8D90();
  v7 = sub_2355C8820();
  v8 = MEMORY[0x24BDF4498];
  v58[0] = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF4498], v6);
  v58[1] = MEMORY[0x24BDEDBB8];
  v48 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v7, v58);
  v49 = v7;
  v54 = v7;
  v55 = v48;
  v9 = MEMORY[0x24BDF2F10];
  v10 = MEMORY[0x23B7CFBA4](0, &v54, MEMORY[0x24BDF2F10], 0);
  v42 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v44 = (uint64_t)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v43 = (uint64_t)&v41 - v13;
  v54 = v3;
  v55 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248ED8);
  v56 = type metadata accessor for OfferView();
  v57 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EE0);
  swift_getTupleTypeMetadata();
  v14 = sub_2355C8E50();
  MEMORY[0x23B7CFBF8](v5, v14);
  sub_2355C8DE4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EE8);
  sub_2355C8820();
  swift_getTupleTypeMetadata2();
  v15 = sub_2355C8E50();
  MEMORY[0x23B7CFBF8](v5, v15);
  v16 = sub_2355C8D90();
  v51 = MEMORY[0x23B7CFBF8](v8, v16);
  v52 = v16;
  v54 = v16;
  v55 = v51;
  v17 = MEMORY[0x23B7CFBA4](0, &v54, v9, 0);
  v41 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v41 - v21;
  v23 = sub_2355C8994();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v41 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = v10;
  v27 = sub_2355C89D0();
  v45 = *(_QWORD *)(v27 - 8);
  v46 = v27;
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)&v41 - v28;
  sub_23559D9EC((uint64_t)v26);
  LOBYTE(v5) = sub_2355C8988();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
  if ((v5 & 1) != 0)
  {
    sub_235594594(a1, (uint64_t)v20);
    v54 = v52;
    v55 = v51;
    swift_getOpaqueTypeConformance2();
    sub_2355C82E4((uint64_t)v20, v17, (uint64_t)v22);
    v30 = *(void (**)(char *, uint64_t))(v41 + 8);
    v30(v20, v17);
    sub_2355C4BF4((uint64_t)v22, v17, (uint64_t)v20);
    v32 = v48;
    v31 = v49;
    v54 = v49;
    v55 = v48;
    swift_getOpaqueTypeConformance2();
    sub_2355C4C0C((uint64_t)v20, v17);
    v30(v20, v17);
    v30(v22, v17);
  }
  else
  {
    v33 = v44;
    sub_235594858(a1, v44);
    v32 = v48;
    v31 = v49;
    v54 = v49;
    v55 = v48;
    swift_getOpaqueTypeConformance2();
    v34 = v43;
    v35 = v47;
    sub_2355C82E4(v33, v47, v43);
    v36 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
    v36(v33, v35);
    sub_2355C4BF4(v34, v35, v33);
    v54 = v52;
    v55 = v51;
    swift_getOpaqueTypeConformance2();
    sub_2355C4CD0(v33, v17, v35);
    v36(v33, v35);
    v36(v34, v35);
  }
  v54 = v52;
  v55 = v51;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v54 = v31;
  v55 = v32;
  v38 = swift_getOpaqueTypeConformance2();
  v53[0] = OpaqueTypeConformance2;
  v53[1] = v38;
  v39 = v46;
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v46, v53);
  sub_2355C4BF4((uint64_t)v29, v39, v50);
  return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v29, v39);
}

uint64_t sub_235594594@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v17 = a2;
  v18 = sub_2355C8A48();
  v4 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 16);
  sub_2355C8820();
  sub_2355C8AB4();
  sub_2355C8820();
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  sub_2355C8820();
  sub_2355C89D0();
  v22 = sub_2355C8820();
  v23 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248ED8);
  v24 = type metadata accessor for OfferView();
  v25 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EE0);
  swift_getTupleTypeMetadata();
  v8 = sub_2355C8E50();
  v9 = MEMORY[0x24BDF5428];
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDF5428], v8);
  sub_2355C8DE4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EE8);
  sub_2355C8820();
  swift_getTupleTypeMetadata2();
  v10 = sub_2355C8E50();
  MEMORY[0x23B7CFBF8](v9, v10);
  v11 = sub_2355C8D90();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v17 - v13;
  v15 = *(_QWORD *)(a1 + 24);
  v19 = v7;
  v20 = v15;
  v21 = v2;
  sub_2355C8940();
  sub_2355C8D84();
  sub_2355C8A3C();
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDF4498], v11);
  sub_2355C8C4C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_235594858@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  char *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];

  v31 = a2;
  v32 = sub_2355C8A48();
  v30 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v29 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_2355C8994();
  v26 = *(_QWORD *)(v28 - 8);
  v4 = MEMORY[0x24BDAC7A8](v28);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v23 - v7;
  v24 = *(_QWORD *)(a1 + 16);
  sub_2355C8820();
  sub_2355C8AB4();
  sub_2355C8820();
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  sub_2355C8820();
  sub_2355C89D0();
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248ED0);
  swift_getTupleTypeMetadata3();
  v9 = sub_2355C8E50();
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDF5428], v9);
  v10 = sub_2355C8D90();
  v23 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v23 - v11;
  v13 = sub_2355C8820();
  v25 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v23 - v14;
  sub_2355C8940();
  v16 = *(_QWORD *)(a1 + 24);
  v33 = v24;
  v34 = v16;
  v35 = v27;
  sub_2355C8D84();
  sub_23559D9EC((uint64_t)v8);
  v17 = v26;
  v18 = v28;
  (*(void (**)(char *, _QWORD, uint64_t))(v26 + 104))(v6, *MEMORY[0x24BDEEE88], v28);
  sub_2355981D4((uint64_t)v8, (uint64_t)v6);
  v19 = *(void (**)(char *, uint64_t))(v17 + 8);
  v19(v6, v18);
  v19(v8, v18);
  sub_2355C8E14();
  v22 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF4498], v10);
  sub_2355C8C7C();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v10);
  v20 = v29;
  sub_2355C8A3C();
  v36[0] = v22;
  v36[1] = MEMORY[0x24BDEDBB8];
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v13, v36);
  sub_2355C8C4C();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v20, v32);
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v15, v13);
}

uint64_t sub_235594C5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44[16];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[3];

  v43 = a2;
  v2 = *(_QWORD *)(a1 + 16);
  v34 = a1;
  v33 = v2;
  v4 = sub_2355C8820();
  v36 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v32 - v5;
  sub_2355C8AB4();
  v7 = sub_2355C8820();
  v38 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v32 - v8;
  v10 = sub_2355C8820();
  v42 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v35 = (char *)&v32 - v11;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  v37 = sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  v39 = sub_2355C8820();
  v12 = sub_2355C89D0();
  v13 = *(_QWORD *)(v12 - 8);
  v40 = v12;
  v41 = v13;
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v32 - v14;
  sub_2355C8E14();
  v16 = *(_QWORD *)(a1 + 24);
  sub_2355C8C70();
  v53[0] = v16;
  v53[1] = MEMORY[0x24BDEBEE0];
  v17 = MEMORY[0x24BDED308];
  v18 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v4, v53);
  sub_2355C8C40();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v6, v4);
  v19 = sub_235598144(&qword_256248EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
  v52[0] = v18;
  v52[1] = v19;
  v20 = MEMORY[0x23B7CFBF8](v17, v7, v52);
  v21 = v35;
  sub_2355C8C64();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v9, v7);
  v22 = v32;
  LOBYTE(v6) = sub_235593F00(v34);
  v45 = v33;
  v46 = v16;
  v47 = v22;
  v23 = sub_235597B84();
  v51[0] = v20;
  v51[1] = v23;
  v24 = MEMORY[0x23B7CFBF8](v17, v10, v51);
  v25 = sub_23559867C(&qword_256248F08, &qword_256248EC0, MEMORY[0x24BDEB950]);
  v50[0] = v24;
  v50[1] = v25;
  v26 = MEMORY[0x23B7CFBF8](v17, v37, v50);
  v27 = sub_23559867C(&qword_256248F10, &qword_256248EC8, MEMORY[0x24BDEDC10]);
  v49[0] = v26;
  v49[1] = v27;
  v28 = v39;
  v29 = MEMORY[0x23B7CFBF8](v17, v39, v49);
  sub_2355BF7EC(v6 & 1, (void (*)(uint64_t))sub_235598138, (uint64_t)v44, v10, v28, v24, v29, (uint64_t)v15);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v21, v10);
  sub_2355C8AFC();
  v48[0] = v29;
  v48[1] = v24;
  v30 = v40;
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v40, v48);
  sub_2355C8C94();
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v15, v30);
}

uint64_t sub_235595074@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64x2_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int8 *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(__int8 *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(void);
  __int8 *v34;
  uint64_t v35;
  uint64_t (*v36)(void);
  int64x2_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int8 *v42;
  uint64_t v43;
  __int8 *v44;
  void (*v45)(__int8 *, uint64_t);
  void *v46;
  char **v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t, uint64_t);
  int64x2_t v67;
  uint64_t v68;
  __int8 *v69;
  uint64_t v70;
  __int8 *v71;
  uint64_t v72;
  uint64_t v73;
  __int8 *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __int8 *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  __int128 v92;
  __int128 v93;
  uint64_t v94;

  v68 = a4;
  v70 = a3;
  v76 = a2;
  v72 = a1;
  v86 = a5;
  v77 = sub_2355C870C();
  v75 = *(_QWORD *)(v77 - 8);
  v6 = MEMORY[0x24BDAC7A8](v77);
  v74 = &v67.i8[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v73 = (uint64_t)v67.i64 - v8;
  v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248FD0);
  MEMORY[0x24BDAC7A8](v85);
  v79 = (uint64_t)v67.i64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2355C882C();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v71 = &v67.i8[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v11);
  v14 = (int64x2_t *)((char *)&v67 - v13);
  v15 = sub_2355C8820();
  sub_2355C8AB4();
  v16 = sub_2355C8820();
  v17 = sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  v18 = sub_2355C8820();
  v83 = *(_QWORD *)(v18 - 8);
  v80 = v18;
  MEMORY[0x24BDAC7A8](v18);
  v69 = &v67.i8[-v19];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  v82 = sub_2355C8820();
  v84 = *(_QWORD *)(v82 - 8);
  v20 = MEMORY[0x24BDAC7A8](v82);
  v78 = &v67.i8[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v20);
  v81 = (uint64_t)v67.i64 - v22;
  v23 = &v14->i8[*(int *)(v10 + 20)];
  v24 = *MEMORY[0x24BDEEB68];
  v25 = sub_2355C8964();
  v26 = *(void (**)(__int8 *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 104);
  v26(v23, v24, v25);
  v67 = vdupq_n_s64(0x4033400000000000uLL);
  *v14 = v67;
  v91[0] = a4;
  v91[1] = MEMORY[0x24BDEBEE0];
  v27 = MEMORY[0x24BDED308];
  v28 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v15, v91);
  v29 = sub_235598144(&qword_256248EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
  v90[0] = v28;
  v90[1] = v29;
  v30 = MEMORY[0x23B7CFBF8](v27, v16, v90);
  v31 = sub_235597B84();
  v89[0] = v30;
  v89[1] = v31;
  v32 = MEMORY[0x23B7CFBF8](v27, v17, v89);
  v33 = MEMORY[0x24BDED998];
  sub_235598144(&qword_256248FD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDED998], MEMORY[0x24BDED990]);
  v34 = v69;
  sub_2355C8CA0();
  v35 = (uint64_t)v14;
  v36 = v33;
  sub_23558DF78(v35, (uint64_t (*)(_QWORD))v33);
  v37 = (int64x2_t *)v71;
  v26(&v71[*(int *)(v10 + 20)], v24, v25);
  *v37 = v67;
  v38 = (uint64_t)v37;
  type metadata accessor for DefaultManagedAppCell(0, v70, v68, v39);
  v40 = v73;
  sub_23559D9BC(v73);
  v41 = v75;
  v42 = v74;
  v43 = v77;
  (*(void (**)(__int8 *, _QWORD, uint64_t))(v75 + 104))(v74, *MEMORY[0x24BDEB400], v77);
  v44 = v42;
  LOBYTE(v42) = sub_2355C8700();
  v45 = *(void (**)(__int8 *, uint64_t))(v41 + 8);
  v45(v44, v43);
  v45((__int8 *)v40, v43);
  v46 = (void *)objc_opt_self();
  v47 = &selRef_systemGray6Color;
  if ((v42 & 1) == 0)
    v47 = &selRef_secondarySystemFillColor;
  v48 = MEMORY[0x23B7CF22C](objc_msgSend(v46, *v47));
  sub_2355C8724();
  v49 = v79;
  sub_235598184(v38, v79, (uint64_t (*)(_QWORD))v36);
  v50 = v49 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256248FE0) + 36);
  v51 = v93;
  *(_OWORD *)v50 = v92;
  *(_OWORD *)(v50 + 16) = v51;
  *(_QWORD *)(v50 + 32) = v94;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248FE8);
  *(_QWORD *)(v49 + *(int *)(v52 + 52)) = v48;
  *(_WORD *)(v49 + *(int *)(v52 + 56)) = 256;
  v53 = sub_2355C8E14();
  v55 = v54;
  v56 = (uint64_t *)(v49 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256248FF0) + 36));
  *v56 = v53;
  v56[1] = v55;
  sub_23558DF78(v38, (uint64_t (*)(_QWORD))v36);
  sub_2355C8E14();
  v57 = sub_23559867C(&qword_256248F08, &qword_256248EC0, MEMORY[0x24BDEB950]);
  v88[0] = v32;
  v88[1] = v57;
  v58 = MEMORY[0x24BDED308];
  v59 = v80;
  v60 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v80, v88);
  sub_23559867C(&qword_256248FF8, &qword_256248FD0, MEMORY[0x24BDED500]);
  v61 = (uint64_t)v78;
  sub_2355C8C88();
  sub_23558E470(v49, &qword_256248FD0);
  (*(void (**)(__int8 *, uint64_t))(v83 + 8))(v34, v59);
  v62 = sub_23559867C(&qword_256248F10, &qword_256248EC8, MEMORY[0x24BDEDC10]);
  v87[0] = v60;
  v87[1] = v62;
  v63 = v82;
  MEMORY[0x23B7CFBF8](v58, v82, v87);
  v64 = v81;
  sub_2355C82E4(v61, v63, v81);
  v65 = *(void (**)(uint64_t, uint64_t))(v84 + 8);
  v65(v61, v63);
  sub_2355C4BF4(v64, v63, v86);
  return ((uint64_t (*)(uint64_t, uint64_t))v65)(v64, v63);
}

uint64_t sub_235595730@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;

  v4 = sub_2355C8B5C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ManagedAppCellContext(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), v8);
  sub_2355C8B14();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDF17C8], v4);
  sub_2355C8B68();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v9 = sub_2355C8BBC();
  v11 = v10;
  LOBYTE(v4) = v12;
  v14 = v13;
  result = swift_release();
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  *(_BYTE *)(a2 + 16) = v4 & 1;
  *(_QWORD *)(a2 + 24) = v14;
  return result;
}

uint64_t sub_23559585C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t KeyPath;
  uint64_t result;

  v5 = (uint64_t *)(v3
                 + *(int *)(type metadata accessor for ManagedAppCellContext(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2)+ 40));
  v6 = *v5;
  v7 = v5[1];
  v8 = v5[2];
  v9 = v5[3];
  sub_235597D54(*v5, v7, v8, v9);
  v10 = sub_2355C8B80();
  KeyPath = swift_getKeyPath();
  result = sub_2355C89F4();
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v7;
  *(_QWORD *)(a3 + 16) = v8;
  *(_QWORD *)(a3 + 24) = v9;
  *(_QWORD *)(a3 + 32) = KeyPath;
  *(_QWORD *)(a3 + 40) = v10;
  *(_DWORD *)(a3 + 48) = result;
  return result;
}

__n128 sub_2355958EC@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void (*v18)(_BYTE *, uint64_t);
  uint64_t v19;
  uint64_t KeyPath;
  uint64_t v21;
  uint64_t v22;
  char v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __n128 result;
  _BYTE v35[4];
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _OWORD v43[11];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248FA8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v35[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_2355C8994();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = (uint64_t *)(v2
                  + *(int *)(type metadata accessor for ManagedAppCellContext(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), v12)+ 44));
  v14 = v13[1];
  v15 = v13[2];
  v16 = v13[3];
  v42 = *v13;
  v41 = v14;
  v38 = v15;
  v40 = v16;
  sub_235597D54(v42, v14, v15, v16);
  sub_23559D9EC((uint64_t)v11);
  v17 = sub_2355C8988();
  v18 = *(void (**)(_BYTE *, uint64_t))(v9 + 8);
  v18(v11, v8);
  if ((v17 & 1) != 0)
  {
    v39 = sub_2355C8B74();
  }
  else
  {
    v19 = sub_2355C8B20();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v7, 1, 1, v19);
    v39 = sub_2355C8B44();
    sub_23558E470((uint64_t)v7, &qword_256248FA8);
  }
  KeyPath = swift_getKeyPath();
  v37 = KeyPath;
  v21 = sub_2355C8D0C();
  v22 = swift_getKeyPath();
  sub_23559D9EC((uint64_t)v11);
  v23 = sub_2355C8988();
  v18(v11, v8);
  v36 = v23 & 1;
  if ((v23 & 1) != 0)
    v24 = 0.0;
  else
    v24 = 62.0;
  v25 = v42;
  v26 = v41;
  v44 = v42;
  v45 = v41;
  v27 = v38;
  v28 = v40;
  v46 = v38;
  v47 = v40;
  v48 = KeyPath;
  v49 = v39;
  v50 = v22;
  v51 = v21;
  sub_2355C8E14();
  sub_2355BFA54(0.0, 1, 0.0, 1, v24, v36, 0.0, 1, v43, 0.0, 1, 0.0, 1);
  sub_235597C94(v25, v26, v27, v28);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v29 = swift_getKeyPath();
  v30 = v43[9];
  *(_OWORD *)(a2 + 128) = v43[8];
  *(_OWORD *)(a2 + 144) = v30;
  *(_OWORD *)(a2 + 160) = v43[10];
  v31 = v43[5];
  *(_OWORD *)(a2 + 64) = v43[4];
  *(_OWORD *)(a2 + 80) = v31;
  v32 = v43[7];
  *(_OWORD *)(a2 + 96) = v43[6];
  *(_OWORD *)(a2 + 112) = v32;
  v33 = v43[1];
  *(_OWORD *)a2 = v43[0];
  *(_OWORD *)(a2 + 16) = v33;
  result = (__n128)v43[3];
  *(_OWORD *)(a2 + 32) = v43[2];
  *(__n128 *)(a2 + 48) = result;
  *(_QWORD *)(a2 + 176) = v29;
  *(_QWORD *)(a2 + 184) = 2;
  *(_BYTE *)(a2 + 192) = 0;
  return result;
}

uint64_t sub_235595C18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t KeyPath;
  uint64_t result;

  v5 = (uint64_t *)(v3
                 + *(int *)(type metadata accessor for ManagedAppCellContext(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2)+ 48));
  v6 = *v5;
  v7 = v5[1];
  v8 = v5[2];
  v9 = v5[3];
  sub_235597D54(*v5, v7, v8, v9);
  v10 = sub_2355C8B80();
  KeyPath = swift_getKeyPath();
  result = sub_2355C89F4();
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v7;
  *(_QWORD *)(a3 + 16) = v8;
  *(_QWORD *)(a3 + 24) = v9;
  *(_QWORD *)(a3 + 32) = KeyPath;
  *(_QWORD *)(a3 + 40) = v10;
  *(_DWORD *)(a3 + 48) = result;
  return result;
}

uint64_t sub_235595CA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14[2];
  char v15;

  v5 = type metadata accessor for ManagedAppCellContext(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2);
  v6 = *(int *)(v5 + 56);
  v7 = v3 + *(int *)(v5 + 52);
  v8 = *(_QWORD *)(v7 + 8);
  v9 = *(_BYTE *)(v7 + 16);
  v14[0] = *(_QWORD *)v7;
  v14[1] = v8;
  v15 = v9;
  v10 = v3 + v6;
  v11 = *(_QWORD *)(v3 + v6);
  v12 = *(_QWORD *)(v10 + 8);
  sub_235591504(v14[0], v8, v9);
  swift_retain();
  return OfferView.init(offerState:action:)((uint64_t)v14, v11, v12, a3);
}

uint64_t sub_235595D20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t KeyPath;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  _QWORD v57[3];
  uint64_t v58;
  char v59;
  uint64_t v60[3];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];

  v53 = a1;
  v52 = a4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249000);
  MEMORY[0x24BDAC7A8](v6);
  v46 = (uint64_t *)((char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248ED0);
  v8 = MEMORY[0x24BDAC7A8](v51);
  v49 = (uint64_t)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v50 = (uint64_t)&v44 - v10;
  v48 = a2;
  v11 = sub_2355C8820();
  sub_2355C8AB4();
  v12 = sub_2355C8820();
  v13 = sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  v14 = sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  v15 = sub_2355C8820();
  v45 = sub_2355C89D0();
  v16 = sub_2355C8820();
  v47 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v44 = (uint64_t)&v44 - v20;
  v22 = type metadata accessor for DefaultManagedAppCell(0, a2, a3, v21);
  sub_235594C5C(v22, (uint64_t)v19);
  v67[0] = a3;
  v67[1] = MEMORY[0x24BDEBEE0];
  v23 = MEMORY[0x24BDED308];
  v24 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v11, v67);
  v25 = sub_235598144(&qword_256248EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
  v66[0] = v24;
  v66[1] = v25;
  v26 = MEMORY[0x23B7CFBF8](v23, v12, v66);
  v27 = sub_235597B84();
  v65[0] = v26;
  v65[1] = v27;
  v28 = MEMORY[0x23B7CFBF8](v23, v13, v65);
  v29 = sub_23559867C(&qword_256248F08, &qword_256248EC0, MEMORY[0x24BDEB950]);
  v64[0] = v28;
  v64[1] = v29;
  v30 = MEMORY[0x23B7CFBF8](v23, v14, v64);
  v31 = sub_23559867C(&qword_256248F10, &qword_256248EC8, MEMORY[0x24BDEDC10]);
  v63[0] = v30;
  v63[1] = v31;
  v62[0] = MEMORY[0x23B7CFBF8](v23, v15, v63);
  v62[1] = v28;
  v61[0] = MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v45, v62);
  v61[1] = MEMORY[0x24BDECC60];
  v45 = MEMORY[0x23B7CFBF8](v23, v16, v61);
  v32 = v44;
  sub_2355C82E4((uint64_t)v19, v16, v44);
  v33 = v47;
  v34 = *(void (**)(char *, uint64_t))(v47 + 8);
  v34(v19, v16);
  v35 = sub_2355C89AC();
  v36 = (uint64_t)v46;
  *v46 = v35;
  *(_QWORD *)(v36 + 8) = 0;
  *(_BYTE *)(v36 + 16) = 0;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249008);
  sub_235596234(v53, v48, a3, (char *)(v36 + *(int *)(v37 + 44)));
  KeyPath = swift_getKeyPath();
  v39 = v49;
  sub_2355986BC(v36, v49, &qword_256249000);
  v40 = v51;
  v41 = v39 + *(int *)(v51 + 36);
  *(_QWORD *)v41 = KeyPath;
  *(_QWORD *)(v41 + 8) = 2;
  *(_BYTE *)(v41 + 16) = 0;
  sub_23558E470(v36, &qword_256249000);
  v42 = v50;
  sub_235598700(v39, v50, &qword_256248ED0);
  (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v19, v32, v16);
  v60[0] = (uint64_t)v19;
  sub_2355986BC(v42, v39, &qword_256248ED0);
  v58 = 0;
  v59 = 1;
  v60[1] = v39;
  v60[2] = (uint64_t)&v58;
  v57[0] = v16;
  v57[1] = v40;
  v57[2] = MEMORY[0x24BDF4638];
  v54 = v45;
  v55 = sub_23559855C();
  v56 = MEMORY[0x24BDF4610];
  sub_2355B91C0(v60, 3uLL, (uint64_t)v57);
  sub_23558E470(v42, &qword_256248ED0);
  v34((char *)v32, v16);
  sub_23558E470(v39, &qword_256248ED0);
  return ((uint64_t (*)(char *, uint64_t))v34)(v19, v16);
}

uint64_t sub_235596234@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void (*v31)(char *, char *, uint64_t);
  char *v32;
  char *v33;
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
  char *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  void (*v52)(char *, char *, uint64_t);
  char *v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  void (*v56)(char *, uint64_t);
  uint64_t v58;
  char *v59;
  uint64_t v60;
  void (*v61)(char *, uint64_t);
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  _BYTE v73[72];
  __int128 v74;
  uint64_t v75;
  char v76;

  v70 = a3;
  v69 = a2;
  v60 = a1;
  v68 = a4;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249020);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249028);
  MEMORY[0x24BDAC7A8](v65);
  v8 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249030);
  v71 = *(_QWORD *)(v67 - 8);
  v9 = MEMORY[0x24BDAC7A8](v67);
  v64 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v66 = (char *)&v58 - v11;
  v12 = sub_2355C8A48();
  v13 = *(_QWORD *)(v12 - 8);
  v62 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248ED8);
  v58 = *(_QWORD *)(v63 - 8);
  v16 = v58;
  v17 = MEMORY[0x24BDAC7A8](v63);
  v19 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v58 - v20;
  v59 = (char *)&v58 - v20;
  v22 = sub_2355C89AC();
  sub_235597514(v69, v70, v23, (uint64_t)&v72);
  v24 = *(_QWORD *)&v73[64];
  v25 = v74;
  v26 = v72;
  v27 = *(_OWORD *)v73;
  v28 = *(_OWORD *)&v73[16];
  v29 = *(_OWORD *)&v73[32];
  v30 = *(_OWORD *)&v73[48];
  v72 = (unint64_t)v22;
  v73[0] = 0;
  *(_OWORD *)&v73[8] = v26;
  *(_OWORD *)&v73[24] = v27;
  *(_OWORD *)&v73[40] = v28;
  *(_OWORD *)&v73[56] = v29;
  v74 = v30;
  v75 = v24;
  v76 = v25;
  sub_2355C8A30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256248F18);
  sub_23559867C(&qword_256248F20, &qword_256248F18, MEMORY[0x24BDF4700]);
  sub_2355C8C4C();
  v61 = *(void (**)(char *, uint64_t))(v13 + 8);
  v61(v15, v12);
  sub_235597BC8(*(uint64_t *)&v73[8], *(uint64_t *)&v73[16], v73[24], *(uint64_t *)&v73[32], *(uint64_t *)&v73[40], *(uint64_t *)&v73[48], v73[56], *(uint64_t *)&v73[64], v74, SBYTE8(v74), v75, v76);
  v31 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
  v32 = v21;
  v33 = v19;
  v34 = v63;
  v31(v32, v19, v63);
  *(_QWORD *)v6 = sub_2355C8940();
  *((_QWORD *)v6 + 1) = 0x4020000000000000;
  v6[16] = 0;
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249038);
  sub_235596710(v69, v70, (uint64_t)&v6[*(int *)(v35 + 44)]);
  LOBYTE(v22) = sub_2355C8AE4();
  sub_2355C86F4();
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;
  sub_2355986BC((uint64_t)v6, (uint64_t)v8, &qword_256249020);
  v44 = &v8[*(int *)(v65 + 36)];
  *v44 = v22;
  *((_QWORD *)v44 + 1) = v37;
  *((_QWORD *)v44 + 2) = v39;
  *((_QWORD *)v44 + 3) = v41;
  *((_QWORD *)v44 + 4) = v43;
  v44[40] = 0;
  sub_23558E470((uint64_t)v6, &qword_256249020);
  sub_2355C8A30();
  sub_2355985F8();
  v45 = v64;
  sub_2355C8C4C();
  v61(v15, v62);
  sub_23558E470((uint64_t)v8, &qword_256249028);
  v46 = v71;
  v47 = v66;
  v48 = v67;
  (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v66, v45, v67);
  v49 = v58;
  v50 = *(void (**)(char *, char *, uint64_t))(v58 + 16);
  v51 = v59;
  v50(v33, v59, v34);
  v52 = *(void (**)(char *, char *, uint64_t))(v46 + 16);
  v52(v45, v47, v48);
  v53 = v68;
  v50(v68, v33, v34);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249050);
  v52(&v53[*(int *)(v54 + 48)], v45, v48);
  v55 = *(void (**)(char *, uint64_t))(v71 + 8);
  v55(v47, v48);
  v56 = *(void (**)(char *, uint64_t))(v49 + 8);
  v56(v51, v34);
  v55(v45, v48);
  return ((uint64_t (*)(char *, uint64_t))v56)(v33, v34);
}

uint64_t sub_235596710@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[200];
  _OWORD v25[12];
  char v26;
  _OWORD v27[12];
  char v28;
  _BYTE v29[216];

  v23 = a3;
  v5 = type metadata accessor for OfferView();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249058);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v22 - v12;
  v15 = type metadata accessor for DefaultManagedAppCell(0, a1, a2, v14);
  sub_235595CA8(v15, v16, (uint64_t)v7);
  sub_235598184((uint64_t)v7, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for OfferView);
  *(_QWORD *)&v11[*(int *)(v8 + 36)] = 0x3FF0000000000000;
  sub_23558DF78((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for OfferView);
  sub_235598700((uint64_t)v11, (uint64_t)v13, &qword_256249058);
  v18 = type metadata accessor for ManagedAppCellContext(0, a1, a2, v17);
  if (sub_2355BF664(v18))
  {
    sub_2355958EC(v15, (uint64_t)v25);
    v27[10] = v25[10];
    v27[11] = v25[11];
    v28 = v26;
    v27[6] = v25[6];
    v27[7] = v25[7];
    v27[8] = v25[8];
    v27[9] = v25[9];
    v27[2] = v25[2];
    v27[3] = v25[3];
    v27[4] = v25[4];
    v27[5] = v25[5];
    v27[0] = v25[0];
    v27[1] = v25[1];
    nullsub_1(v27);
  }
  else
  {
    sub_235597CC4((uint64_t)v27);
  }
  sub_235598700((uint64_t)v27, (uint64_t)v29, &qword_256248EE0);
  sub_2355986BC((uint64_t)v13, (uint64_t)v11, &qword_256249058);
  sub_235598700((uint64_t)v29, (uint64_t)v24, &qword_256248EE0);
  v19 = v23;
  sub_2355986BC((uint64_t)v11, v23, &qword_256249058);
  v20 = v19 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256249060) + 48);
  sub_235598700((uint64_t)v24, (uint64_t)v25, &qword_256248EE0);
  sub_235598700((uint64_t)v25, v20, &qword_256248EE0);
  sub_23559803C((uint64_t)v25, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_235597CE8);
  sub_23558E470((uint64_t)v13, &qword_256249058);
  sub_235598700((uint64_t)v24, (uint64_t)v27, &qword_256248EE0);
  sub_23559803C((uint64_t)v27, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2355980B0);
  return sub_23558E470((uint64_t)v11, &qword_256249058);
}

uint64_t sub_235596998@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
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
  _QWORD v35[2];
  uint64_t v36;
  char v37;
  _QWORD v38[2];
  char *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;

  v28 = a3;
  v29 = a4;
  sub_2355C8820();
  sub_2355C8AB4();
  sub_2355C8820();
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  sub_2355C8820();
  sub_2355C89D0();
  v39 = (char *)sub_2355C8820();
  v40 = (uint64_t *)__swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248ED8);
  v41 = type metadata accessor for OfferView();
  v42 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EE0);
  swift_getTupleTypeMetadata();
  v6 = sub_2355C8E50();
  v24 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF5428], v6);
  v7 = sub_2355C8DE4();
  v26 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v24 - v8;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EE8);
  v10 = sub_2355C8820();
  v27 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v25 = (uint64_t)&v24 - v14;
  sub_2355C89AC();
  v15 = v28;
  type metadata accessor for DefaultManagedAppCell(0, a2, v28, v16);
  __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  sub_2355C8748();
  v30 = a2;
  v31 = v15;
  v32 = a1;
  sub_2355C8DD8();
  v17 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF4700], v7);
  sub_2355C8CAC();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v7);
  v18 = sub_23559867C(&qword_256248EF0, &qword_256248EE8, MEMORY[0x24BDF1028]);
  v38[0] = v17;
  v38[1] = v18;
  v19 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v10, v38);
  v20 = v25;
  sub_2355C82E4((uint64_t)v13, v10, v25);
  v21 = v27;
  v22 = *(void (**)(char *, uint64_t))(v27 + 8);
  v22(v13, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v13, v20, v10);
  v36 = 0;
  v37 = 0;
  v39 = v13;
  v40 = &v36;
  v35[0] = v10;
  v35[1] = MEMORY[0x24BDF4638];
  v33 = v19;
  v34 = MEMORY[0x24BDF4610];
  sub_2355B91C0((uint64_t *)&v39, 2uLL, (uint64_t)v35);
  v22((char *)v20, v10);
  return ((uint64_t (*)(char *, uint64_t))v22)(v13, v10);
}

uint64_t sub_235596D30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
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
  void (*v67)(char *, uint64_t);
  uint64_t (*v68)(uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t OpaqueTypeConformance2;
  uint64_t v97;
  unint64_t v98;
  _QWORD v99[4];
  _OWORD v100[12];
  char v101;
  uint64_t v102[4];
  _OWORD v103[12];
  char v104;
  _QWORD v105[2];
  _QWORD v106[2];
  _QWORD v107[2];
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[2];
  __int128 v112;
  _BYTE v113[72];
  __int128 v114;
  uint64_t v115;
  char v116;

  v90 = a1;
  v88 = a4;
  v86 = type metadata accessor for OfferView();
  v6 = MEMORY[0x24BDAC7A8](v86);
  v89 = (uint64_t)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v93 = (uint64_t)&v70 - v8;
  v9 = sub_2355C8A48();
  v82 = *(_QWORD *)(v9 - 8);
  v83 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v79 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248ED8);
  v84 = *(_QWORD *)(v11 - 8);
  v85 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v87 = (char *)&v70 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v80 = (char *)&v70 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v91 = (char *)&v70 - v16;
  v73 = a2;
  v17 = sub_2355C8820();
  sub_2355C8AB4();
  v18 = sub_2355C8820();
  v19 = sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  v20 = sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  v81 = (uint64_t (*)(uint64_t, uint64_t))sub_2355C8820();
  v94 = sub_2355C89D0();
  v21 = sub_2355C8820();
  v92 = *(_QWORD *)(v21 - 8);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v70 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v70 - v25;
  v27 = a2;
  v28 = a3;
  v72 = type metadata accessor for DefaultManagedAppCell(0, v27, a3, v29);
  sub_235594C5C(v72, (uint64_t)v24);
  v111[0] = a3;
  v71 = a3;
  v111[1] = MEMORY[0x24BDEBEE0];
  v30 = MEMORY[0x24BDED308];
  v31 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v17, v111);
  v32 = sub_235598144(&qword_256248EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
  v110[0] = v31;
  v110[1] = v32;
  v33 = MEMORY[0x23B7CFBF8](v30, v18, v110);
  v34 = sub_235597B84();
  v109[0] = v33;
  v109[1] = v34;
  v35 = MEMORY[0x23B7CFBF8](v30, v19, v109);
  v36 = sub_23559867C(&qword_256248F08, &qword_256248EC0, MEMORY[0x24BDEB950]);
  v108[0] = v35;
  v108[1] = v36;
  v37 = MEMORY[0x23B7CFBF8](v30, v20, v108);
  v38 = sub_23559867C(&qword_256248F10, &qword_256248EC8, MEMORY[0x24BDEDC10]);
  v107[0] = v37;
  v107[1] = v38;
  v106[0] = MEMORY[0x23B7CFBF8](v30, v81, v107);
  v106[1] = v35;
  v105[0] = MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v94, v106);
  v105[1] = MEMORY[0x24BDECC60];
  v39 = MEMORY[0x23B7CFBF8](v30, v21, v105);
  v94 = (uint64_t)v26;
  v77 = v39;
  sub_2355C82E4((uint64_t)v24, v21, (uint64_t)v26);
  v40 = *(uint64_t (**)(uint64_t, uint64_t))(v92 + 8);
  v76 = v24;
  v78 = v21;
  v81 = v40;
  v40((uint64_t)v24, v21);
  v41 = sub_2355C89AC();
  v42 = v72;
  __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  sub_2355C8748();
  v43 = v112;
  v44 = v73;
  sub_235597514(v73, v28, v45, (uint64_t)&v112);
  v46 = *(_QWORD *)&v113[64];
  v47 = v114;
  v48 = v112;
  v49 = *(_OWORD *)v113;
  v50 = *(_OWORD *)&v113[16];
  v51 = *(_OWORD *)&v113[32];
  v52 = *(_OWORD *)&v113[48];
  *(_QWORD *)&v112 = v41;
  *((_QWORD *)&v112 + 1) = v43;
  v113[0] = 0;
  *(_OWORD *)&v113[8] = v48;
  *(_OWORD *)&v113[24] = v49;
  *(_OWORD *)&v113[40] = v50;
  *(_OWORD *)&v113[56] = v51;
  v114 = v52;
  v115 = v46;
  v116 = v47;
  v53 = v79;
  sub_2355C8A30();
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248F18);
  v74 = sub_23559867C(&qword_256248F20, &qword_256248F18, MEMORY[0x24BDF4700]);
  v75 = v54;
  sub_2355C8C4C();
  (*(void (**)(char *, uint64_t))(v82 + 8))(v53, v83);
  sub_235597BC8(*(uint64_t *)&v113[8], *(uint64_t *)&v113[16], v113[24], *(uint64_t *)&v113[32], *(uint64_t *)&v113[40], *(uint64_t *)&v113[48], v113[56], *(uint64_t *)&v113[64], v114, SBYTE8(v114), v115, v116);
  v55 = v84;
  v56 = v91;
  v57 = v85;
  (*(void (**)(void))(v84 + 32))();
  sub_235595CA8(v42, v58, v93);
  v60 = type metadata accessor for ManagedAppCellContext(0, v44, v71, v59);
  if (sub_2355BF664(v60))
  {
    sub_2355958EC(v42, (uint64_t)v100);
    v103[10] = v100[10];
    v103[11] = v100[11];
    v104 = v101;
    v103[6] = v100[6];
    v103[7] = v100[7];
    v103[8] = v100[8];
    v103[9] = v100[9];
    v103[2] = v100[2];
    v103[3] = v100[3];
    v103[4] = v100[4];
    v103[5] = v100[5];
    v103[0] = v100[0];
    v103[1] = v100[1];
    nullsub_1(v103);
  }
  else
  {
    sub_235597CC4((uint64_t)v103);
  }
  sub_235598700((uint64_t)v103, (uint64_t)&v112, &qword_256248EE0);
  v61 = (uint64_t)v76;
  v62 = v78;
  (*(void (**)(char *, uint64_t, uint64_t))(v92 + 16))(v76, v94, v78);
  v102[0] = v61;
  v63 = (uint64_t)v87;
  v64 = v57;
  (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v87, v56, v57);
  v102[1] = v63;
  v65 = v93;
  v66 = v89;
  sub_235598184(v93, v89, (uint64_t (*)(_QWORD))type metadata accessor for OfferView);
  v102[2] = v66;
  sub_235598700((uint64_t)&v112, (uint64_t)v100, &qword_256248EE0);
  v102[3] = (uint64_t)v100;
  sub_23559803C((uint64_t)&v112, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_235597CE8);
  v99[0] = v62;
  v99[1] = v64;
  v99[2] = v86;
  v99[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_256248EE0);
  v95 = v77;
  *(_QWORD *)&v103[0] = v75;
  *((_QWORD *)&v103[0] + 1) = v74;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v97 = sub_235598144(&qword_256248F28, (uint64_t (*)(uint64_t))type metadata accessor for OfferView, (uint64_t)&protocol conformance descriptor for OfferView);
  v98 = sub_235597D84();
  sub_2355B91C0(v102, 4uLL, (uint64_t)v99);
  sub_23559803C((uint64_t)&v112, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2355980B0);
  sub_23558DF78(v65, (uint64_t (*)(_QWORD))type metadata accessor for OfferView);
  v67 = *(void (**)(char *, uint64_t))(v55 + 8);
  v67(v91, v64);
  v68 = v81;
  v81(v94, v62);
  sub_235598700((uint64_t)v100, (uint64_t)v103, &qword_256248EE0);
  sub_23559803C((uint64_t)v103, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2355980B0);
  sub_23558DF78(v66, (uint64_t (*)(_QWORD))type metadata accessor for OfferView);
  v67((char *)v63, v64);
  return v68(v61, v62);
}

double sub_235597514@<D0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  uint64_t v16;
  __int128 v17;
  char v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  double result;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  char v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  char v37;

  v6 = type metadata accessor for ManagedAppCellContext(0, a1, a2, a3);
  v7 = sub_2355BF64C(v6);
  v9 = type metadata accessor for DefaultManagedAppCell(0, a1, a2, v8);
  v11 = v9;
  if (v7)
  {
    sub_235595C18(v9, v10, (uint64_t)&v31);
    v12 = v31;
    v13 = v32;
    sub_235595730(v11, (uint64_t)&v31);
    v14 = v31;
    v15 = v32;
    sub_235597D54(v12, *((uint64_t *)&v12 + 1), v13, *((uint64_t *)&v13 + 1));
    swift_retain();
    swift_retain();
    sub_2355914F4(v14, *((uint64_t *)&v14 + 1), v15);
    swift_bridgeObjectRetain();
    sub_235597D54(v12, *((uint64_t *)&v12 + 1), v13, *((uint64_t *)&v13 + 1));
    swift_retain();
    swift_retain();
    sub_2355914F4(v14, *((uint64_t *)&v14 + 1), v15);
    swift_bridgeObjectRetain();
    sub_235591958(v14, *((uint64_t *)&v14 + 1), v15);
    swift_bridgeObjectRelease();
    sub_235597C94(v12, *((uint64_t *)&v12 + 1), v13, *((uint64_t *)&v13 + 1));
    swift_release();
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256248FB0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256248FB8);
    v16 = MEMORY[0x24BDF5428];
    sub_23559867C(&qword_256248FC0, &qword_256248FB0, MEMORY[0x24BDF5428]);
    sub_23559867C(&qword_256248FC8, &qword_256248FB8, v16);
    sub_2355C89C4();
    sub_235591958(v14, *((uint64_t *)&v14 + 1), v15);
    swift_bridgeObjectRelease();
    sub_235597C94(v12, *((uint64_t *)&v12 + 1), v13, *((uint64_t *)&v13 + 1));
    swift_release();
    swift_release();
  }
  else
  {
    sub_235595730(v9, (uint64_t)&v31);
    v17 = v31;
    v18 = v32;
    sub_23559585C(v11, v19, (uint64_t)&v31);
    v20 = v31;
    v21 = v32;
    sub_2355914F4(v17, *((uint64_t *)&v17 + 1), v18);
    swift_bridgeObjectRetain();
    sub_235597D54(v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1));
    swift_retain();
    swift_retain();
    sub_2355914F4(v17, *((uint64_t *)&v17 + 1), v18);
    swift_bridgeObjectRetain();
    sub_235597D54(v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1));
    swift_retain();
    swift_retain();
    sub_235597C94(v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1));
    swift_release();
    swift_release();
    sub_235591958(v17, *((uint64_t *)&v17 + 1), v18);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256248FB0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256248FB8);
    v22 = MEMORY[0x24BDF5428];
    sub_23559867C(&qword_256248FC0, &qword_256248FB0, MEMORY[0x24BDF5428]);
    sub_23559867C(&qword_256248FC8, &qword_256248FB8, v22);
    sub_2355C89C4();
    sub_235597C94(v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1));
    swift_release();
    swift_release();
    sub_235591958(v17, *((uint64_t *)&v17 + 1), v18);
    swift_bridgeObjectRelease();
  }
  result = *(double *)&v31;
  v24 = v32;
  v25 = v33;
  v26 = v34;
  v27 = v35;
  v28 = v36;
  v29 = v37;
  *(_OWORD *)a4 = v31;
  *(_OWORD *)(a4 + 16) = v24;
  *(_OWORD *)(a4 + 32) = v25;
  *(_OWORD *)(a4 + 48) = v26;
  *(_OWORD *)(a4 + 64) = v27;
  *(_QWORD *)(a4 + 80) = v28;
  *(_BYTE *)(a4 + 88) = v29;
  return result;
}

uint64_t sub_235597960@<X0>(uint64_t *a1@<X8>)
{
  return sub_235597988(&qword_256249088, a1);
}

uint64_t sub_235597974@<X0>(uint64_t *a1@<X8>)
{
  return sub_235597988(&qword_256249080, a1);
}

uint64_t sub_235597988@<X0>(uint64_t *a1@<X3>, uint64_t *a2@<X8>)
{
  *a2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(a1);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2355979C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  uint64_t *v20;

  v16 = type metadata accessor for ManagedAppCellContext(0, a6, a7, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(a8, a1, v16);
  v18 = (int *)type metadata accessor for DefaultManagedAppCell(0, a6, a7, v17);
  v19 = a8 + v18[9];
  *(_QWORD *)v19 = a2;
  *(_BYTE *)(v19 + 8) = a3 & 1;
  sub_235598700(a4, a8 + v18[10], &qword_256249068);
  sub_235598700(a5, a8 + v18[11], &qword_256249070);
  v20 = (uint64_t *)(a8 + v18[12]);
  *v20 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249078);
  swift_storeEnumTagMultiPayload();
  sub_235593E88();
  sub_2355C873C();
  sub_2355C873C();
  return sub_2355C873C();
}

uint64_t sub_235597B6C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_235596998(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_235597B78@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_235596D30(v1[4], v1[2], v1[3], a1);
}

unint64_t sub_235597B84()
{
  unint64_t result;

  result = qword_256248F00;
  if (!qword_256248F00)
  {
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF1438], MEMORY[0x24BDF1448]);
    atomic_store(result, (unint64_t *)&qword_256248F00);
  }
  return result;
}

uint64_t sub_235597BC8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, char a12)
{
  if ((a12 & 1) != 0)
  {
    sub_235591958(a1, a2, a3 & 1);
    swift_bridgeObjectRelease();
    sub_235597C94(a5, a6, a7, a8);
    swift_release();
    return swift_release();
  }
  else
  {
    sub_235597C94(a1, a2, a3, a4);
    swift_release();
    swift_release();
    sub_235591958(a8, a9, a10 & 1);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_235597C94(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_235591958(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

double sub_235597CC4(uint64_t a1)
{
  double result;

  *(_BYTE *)(a1 + 192) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_235597CE8(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    sub_235597D54(result, a2, a3, a4);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_235597D54(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2355914F4(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_235597D84()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_256248F30;
  if (!qword_256248F30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EE0);
    v2 = sub_235597DE8();
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256248F30);
  }
  return result;
}

unint64_t sub_235597DE8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256248F38;
  if (!qword_256248F38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248F40);
    v2[0] = sub_235597E6C();
    v2[1] = sub_23559867C(&qword_256248EF0, &qword_256248EE8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256248F38);
  }
  return result;
}

unint64_t sub_235597E6C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256248F48;
  if (!qword_256248F48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248F50);
    v2[0] = sub_235597ED8();
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256248F48);
  }
  return result;
}

unint64_t sub_235597ED8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256248F58;
  if (!qword_256248F58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248F60);
    v2[0] = sub_235597F5C();
    v2[1] = sub_23559867C(&qword_256248F98, &qword_256248FA0, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256248F58);
  }
  return result;
}

unint64_t sub_235597F5C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256248F68;
  if (!qword_256248F68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248F70);
    v2[0] = sub_235597FE0();
    v2[1] = sub_23559867C(&qword_256248F88, &qword_256248F90, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256248F68);
  }
  return result;
}

unint64_t sub_235597FE0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256248F78;
  if (!qword_256248F78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248F80);
    v2 = MEMORY[0x24BDF1F80];
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256248F78);
  }
  return result;
}

uint64_t sub_23559803C(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 192);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    v4);
  return a1;
}

uint64_t sub_2355980B0(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    sub_235597C94(result, a2, a3, a4);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_235598138@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return sub_235595074(a1, v2[4], v2[2], v2[3], a2);
}

uint64_t sub_235598144(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B7CFBF8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_235598184(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2355981C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_235595D20(v1[4], v1[2], v1[3], a1);
}

BOOL sub_2355981D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t (*v12)(char *, uint64_t);
  int v13;
  unint64_t v14;
  int v15;
  _DWORD *v16;
  int v17;
  unint64_t v18;
  uint64_t v20;

  v4 = sub_2355C8994();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v20 - v9;
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)&v20 - v9, a1, v4);
  v12 = *(uint64_t (**)(char *, uint64_t))(v5 + 88);
  v13 = v12(v10, v4);
  v14 = 0;
  v15 = *MEMORY[0x24BDEEE58];
  v16 = (_DWORD *)MEMORY[0x24BDEEE90];
  if (v13 != *MEMORY[0x24BDEEE58])
  {
    if (v13 == *MEMORY[0x24BDEEE90])
    {
      v14 = 1;
      goto LABEL_24;
    }
    if (v13 == *MEMORY[0x24BDEEE98])
    {
      v14 = 2;
      goto LABEL_24;
    }
    if (v13 == *MEMORY[0x24BDEEE88])
      goto LABEL_7;
    if (v13 == *MEMORY[0x24BDEEE50])
    {
      v14 = 4;
    }
    else if (v13 == *MEMORY[0x24BDEEE60])
    {
      v14 = 5;
    }
    else if (v13 == *MEMORY[0x24BDEEE30])
    {
      v14 = 6;
    }
    else if (v13 == *MEMORY[0x24BDEEE70])
    {
      v14 = 7;
    }
    else if (v13 == *MEMORY[0x24BDEEE68])
    {
      v14 = 8;
    }
    else if (v13 == *MEMORY[0x24BDEEE78])
    {
      v14 = 9;
    }
    else if (v13 == *MEMORY[0x24BDEEE40])
    {
      v14 = 10;
    }
    else
    {
      if (v13 != *MEMORY[0x24BDEEE48])
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
LABEL_7:
        v14 = 3;
        goto LABEL_24;
      }
      v14 = 11;
    }
  }
LABEL_24:
  v11(v8, a2, v4);
  v17 = v12(v8, v4);
  if (v17 == v15)
  {
    v18 = 0;
  }
  else if (v17 == *v16)
  {
    v18 = 1;
  }
  else if (v17 == *MEMORY[0x24BDEEE98])
  {
    v18 = 2;
  }
  else
  {
    if (v17 != *MEMORY[0x24BDEEE88])
    {
      if (v17 == *MEMORY[0x24BDEEE50])
      {
        v18 = 4;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE60])
      {
        v18 = 5;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE30])
      {
        v18 = 6;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE70])
      {
        v18 = 7;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE68])
      {
        v18 = 8;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE78])
      {
        v18 = 9;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE40])
      {
        v18 = 10;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE48])
      {
        v18 = 11;
        return v14 < v18;
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    v18 = 3;
  }
  return v14 < v18;
}

unint64_t sub_23559855C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249010;
  if (!qword_256249010)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248ED0);
    v2[0] = sub_23559867C(&qword_256249018, &qword_256249000, MEMORY[0x24BDF4700]);
    v2[1] = sub_23559867C(&qword_256248EF0, &qword_256248EE8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249010);
  }
  return result;
}

unint64_t sub_2355985F8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249040;
  if (!qword_256249040)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249028);
    v2[0] = sub_23559867C(&qword_256249048, &qword_256249020, MEMORY[0x24BDF4498]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249040);
  }
  return result;
}

uint64_t sub_23559867C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B7CFBF8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2355986BC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_235598700(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23559875C()
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
  uint64_t OpaqueTypeConformance2;
  _QWORD v14[2];
  _QWORD v15[2];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  sub_2355C8820();
  sub_2355C8AB4();
  sub_2355C8820();
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  sub_2355C8820();
  sub_2355C89D0();
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248ED8);
  v18 = type metadata accessor for OfferView();
  v19 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EE0);
  swift_getTupleTypeMetadata();
  v0 = sub_2355C8E50();
  v1 = MEMORY[0x24BDF5428];
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDF5428], v0);
  sub_2355C8DE4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EE8);
  sub_2355C8820();
  swift_getTupleTypeMetadata2();
  v2 = sub_2355C8E50();
  MEMORY[0x23B7CFBF8](v1, v2);
  v3 = sub_2355C8D90();
  v4 = MEMORY[0x24BDF4498];
  v5 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF4498], v3);
  v16 = v3;
  v17 = v5;
  v6 = MEMORY[0x24BDF2F10];
  MEMORY[0x23B7CFBA4](255, &v16, MEMORY[0x24BDF2F10], 0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  sub_2355C8820();
  sub_2355C89D0();
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248ED0);
  swift_getTupleTypeMetadata3();
  v7 = sub_2355C8E50();
  MEMORY[0x23B7CFBF8](v1, v7);
  v8 = sub_2355C8D90();
  v9 = sub_2355C8820();
  v15[0] = MEMORY[0x23B7CFBF8](v4, v8);
  v15[1] = MEMORY[0x24BDEDBB8];
  v10 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v9, v15);
  v16 = v9;
  v17 = v10;
  MEMORY[0x23B7CFBA4](255, &v16, v6, 0);
  v11 = sub_2355C89D0();
  v16 = v3;
  v17 = v5;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v16 = v9;
  v17 = v10;
  v14[0] = OpaqueTypeConformance2;
  v14[1] = swift_getOpaqueTypeConformance2();
  return MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v11, v14);
}

uint64_t OfferView.init(offerState:action:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  int *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;

  v24 = a2;
  v7 = sub_2355C8B8C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)a1;
  v23 = *(_QWORD *)(a1 + 8);
  HIDWORD(v22) = *(unsigned __int8 *)(a1 + 16);
  *(_QWORD *)a4 = swift_getKeyPath();
  *(_BYTE *)(a4 + 8) = 0;
  v12 = (int *)type metadata accessor for OfferView();
  v13 = (uint64_t *)(a4 + v12[5]);
  *v13 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249078);
  swift_storeEnumTagMultiPayload();
  v14 = a4 + v12[6];
  *(_QWORD *)v14 = swift_getKeyPath();
  *(_QWORD *)(v14 + 8) = 0;
  *(_BYTE *)(v14 + 16) = 0;
  v15 = a4 + v12[8];
  v28 = 0;
  sub_2355C8D3C();
  v16 = v26;
  *(_BYTE *)v15 = v25;
  *(_QWORD *)(v15 + 8) = v16;
  v25 = 0x4059000000000000;
  sub_235593E88();
  sub_2355C873C();
  v25 = 0x402E000000000000;
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BDF1860], v7);
  sub_2355C8730();
  v25 = v11;
  v26 = v23;
  v27 = BYTE4(v22);
  type metadata accessor for OfferViewModel();
  swift_allocObject();
  swift_retain();
  sub_23558B110((uint64_t)&v25, v24, a3);
  swift_release();
  sub_235598144(&qword_256249090, (uint64_t (*)(uint64_t))type metadata accessor for OfferViewModel, (uint64_t)&unk_2355C9BB0);
  v17 = sub_2355C87D8();
  v19 = v18;
  result = swift_release();
  v21 = (uint64_t *)(a4 + v12[7]);
  *v21 = v17;
  v21[1] = v19;
  return result;
}

uint64_t static OfferView.Space.== infix(_:_:)()
{
  return 1;
}

uint64_t OfferView.Space.hash(into:)()
{
  return sub_2355C9288();
}

uint64_t OfferView.Space.hashValue.getter()
{
  sub_2355C927C();
  sub_2355C9288();
  return sub_2355C92AC();
}

uint64_t sub_235598D9C()
{
  return 1;
}

uint64_t sub_235598DA4()
{
  sub_2355C927C();
  sub_2355C9288();
  return sub_2355C92AC();
}

uint64_t sub_235598DE4()
{
  return sub_2355C9288();
}

uint64_t sub_235598E08()
{
  sub_2355C927C();
  sub_2355C9288();
  return sub_2355C92AC();
}

uint64_t OfferView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char v13;
  __n128 v14;
  unint64_t v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char *v22;
  char *v23;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 v29;
  _OWORD v30[10];
  _OWORD v31[2];

  v27 = a1;
  v28 = sub_2355C897C();
  v26 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v25 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for OfferView();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249098);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562490A0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)v1;
  v13 = *(_BYTE *)(v1 + 8);
  sub_23558C900(*(_QWORD *)v1, v13);
  sub_23559D63C(v12, v13, &v29);
  sub_23558CA44(v12, v13);
  __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  sub_2355C8748();
  v14.n128_f64[0] = *(double *)v30 / 100.0;
  sub_23558AA10(&v29, v14);
  sub_235599134(v1, (uint64_t)v30, (uint64_t)v8);
  sub_23559DF78(v1, (uint64_t)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = (*(unsigned __int8 *)(v4 + 80) + 205) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v16 = (_OWORD *)swift_allocObject();
  v17 = v30[9];
  v16[9] = v30[8];
  v16[10] = v17;
  v16[11] = v31[0];
  *(_OWORD *)((char *)v16 + 189) = *(_OWORD *)((char *)v31 + 13);
  v18 = v30[5];
  v16[5] = v30[4];
  v16[6] = v18;
  v19 = v30[7];
  v16[7] = v30[6];
  v16[8] = v19;
  v20 = v30[1];
  v16[1] = v30[0];
  v16[2] = v20;
  v21 = v30[3];
  v16[3] = v30[2];
  v16[4] = v21;
  sub_23559E0FC((uint64_t)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v16 + v15);
  sub_2355986BC((uint64_t)v8, (uint64_t)v11, &qword_256249098);
  v22 = &v11[*(int *)(v9 + 36)];
  *(_QWORD *)v22 = sub_23559CEE8;
  *((_QWORD *)v22 + 1) = 0;
  *((_QWORD *)v22 + 2) = sub_23559E140;
  *((_QWORD *)v22 + 3) = v16;
  sub_23558E470((uint64_t)v8, &qword_256249098);
  v23 = v25;
  sub_2355C8970();
  sub_23559E180();
  sub_2355C8C58();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v23, v28);
  return sub_23558E470((uint64_t)v11, &qword_2562490A0);
}

uint64_t sub_235599134@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v13;
  uint64_t *v14;
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
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char *v44;
  int *v45;
  _OWORD *v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v64[2];
  uint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  char *v90;
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
  int *v102;
  uint64_t v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;

  v95 = a2;
  v100 = a3;
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249150);
  MEMORY[0x24BDAC7A8](v65);
  v67 = (char *)v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249208);
  v5 = MEMORY[0x24BDAC7A8](v81);
  v66 = (char *)v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v68 = (char *)v64 - v7;
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249300);
  MEMORY[0x24BDAC7A8](v78);
  v80 = (uint64_t)v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249308);
  MEMORY[0x24BDAC7A8](v74);
  v75 = (char *)v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562491F8);
  MEMORY[0x24BDAC7A8](v79);
  v76 = (char *)v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562491E8);
  MEMORY[0x24BDAC7A8](v99);
  v82 = (char *)v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249310);
  MEMORY[0x24BDAC7A8](v69);
  v70 = (char *)v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562491D8);
  MEMORY[0x24BDAC7A8](v87);
  v93 = type metadata accessor for Style.CapsuleButtonStyle();
  MEMORY[0x24BDAC7A8](v93);
  v14 = (_QWORD *)((char *)v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249158);
  v89 = *(_QWORD *)(v92 - 8);
  MEMORY[0x24BDAC7A8](v92);
  v88 = (char *)v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249318);
  v91 = *(_QWORD *)(v94 - 8);
  v16 = MEMORY[0x24BDAC7A8](v94);
  v77 = (char *)v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v90 = (char *)v64 - v18;
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562491C8);
  v64[1] = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v64[0] = (char *)v64 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249320);
  MEMORY[0x24BDAC7A8](v96);
  v98 = (uint64_t)v64 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249328);
  MEMORY[0x24BDAC7A8](v83);
  v85 = (uint64_t)v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249330);
  MEMORY[0x24BDAC7A8](v71);
  v23 = (char *)v64 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562490E0);
  MEMORY[0x24BDAC7A8](v84);
  v72 = (char *)v64 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562490D0);
  MEMORY[0x24BDAC7A8](v97);
  v86 = (char *)v64 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249100);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)v64 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562490F0);
  v30 = MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)v64 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)v64 - v33;
  v35 = type metadata accessor for OfferView();
  v36 = a1;
  v37 = *(_QWORD *)(a1 + *(int *)(v35 + 28) + 8);
  v39 = *(_QWORD *)(v37 + 16);
  v38 = *(_QWORD *)(v37 + 24);
  if (*(_BYTE *)(v37 + 32))
  {
    if (*(_BYTE *)(v37 + 32) != 1)
      __asm { BR              X9 }
    v40 = *(_OWORD *)(v95 + 152);
    v105 = *(_OWORD *)(v95 + 136);
    v106 = v40;
    v42 = *(_QWORD *)(v95 + 168);
    v41 = *(_QWORD *)(v95 + 176);
    v43 = *(_BYTE *)(v95 + 184);
    MEMORY[0x24BDAC7A8](v35);
    swift_retain_n();
    sub_235591504(v39, v38, 1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256249338);
    sub_23559F808();
    v44 = v88;
    sub_2355C8D78();
    *v14 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256249088);
    swift_storeEnumTagMultiPayload();
    v45 = (int *)v93;
    *((_BYTE *)v14 + *(int *)(v93 + 20)) = v43;
    v46 = (_OWORD *)((char *)v14 + v45[6]);
    v47 = v106;
    *v46 = v105;
    v46[1] = v47;
    *(uint64_t *)((char *)v14 + v45[7]) = v42;
    *(uint64_t *)((char *)v14 + v45[8]) = v41;
    v48 = sub_23559867C(&qword_256249160, &qword_256249158, MEMORY[0x24BDF43B0]);
    v49 = sub_235598144(&qword_256249168, (uint64_t (*)(uint64_t))type metadata accessor for Style.CapsuleButtonStyle, (uint64_t)&unk_2355CA8A8);
    v50 = v77;
    v51 = v92;
    sub_2355C8C04();
    sub_23559F894((uint64_t)v14);
    (*(void (**)(char *, uint64_t))(v89 + 8))(v44, v51);
    sub_23558A9F8(v39, v38, 1);
    swift_release();
    v52 = v91;
    v53 = v90;
    v54 = v94;
    (*(void (**)(char *, char *, uint64_t))(v91 + 32))(v90, v50, v94);
    (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v75, v53, v54);
    swift_storeEnumTagMultiPayload();
    v101 = v51;
    v102 = v45;
    v103 = v48;
    v104 = v49;
    swift_getOpaqueTypeConformance2();
    v55 = (uint64_t)v76;
    sub_2355C89C4();
    sub_2355986BC(v55, v80, &qword_2562491F8);
    swift_storeEnumTagMultiPayload();
    sub_23559E848();
    sub_23559E938();
    v56 = (uint64_t)v82;
    sub_2355C89C4();
    sub_23558E470(v55, &qword_2562491F8);
    sub_2355986BC(v56, v98, &qword_2562491E8);
    swift_storeEnumTagMultiPayload();
    sub_23559E288();
    sub_23559E824();
    sub_2355C89C4();
    sub_23558E470(v56, &qword_2562491E8);
    return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v53, v54);
  }
  else
  {
    sub_23559AA20(*(_QWORD *)(v37 + 16), v38 & 1, v36, v95, (uint64_t)v28);
    sub_2355C8E14();
    sub_2355C8838();
    sub_2355986BC((uint64_t)v28, (uint64_t)v32, &qword_256249100);
    v57 = &v32[*(int *)(v29 + 36)];
    v58 = v110;
    *((_OWORD *)v57 + 4) = v109;
    *((_OWORD *)v57 + 5) = v58;
    *((_OWORD *)v57 + 6) = v111;
    v59 = v106;
    *(_OWORD *)v57 = v105;
    *((_OWORD *)v57 + 1) = v59;
    v60 = v108;
    *((_OWORD *)v57 + 2) = v107;
    *((_OWORD *)v57 + 3) = v60;
    sub_23558E470((uint64_t)v28, &qword_256249100);
    sub_235598700((uint64_t)v32, (uint64_t)v34, &qword_2562490F0);
    sub_2355986BC((uint64_t)v34, (uint64_t)v23, &qword_2562490F0);
    swift_storeEnumTagMultiPayload();
    sub_23559FC60(&qword_2562490E8, &qword_2562490F0, (uint64_t (*)(void))sub_23559E350, MEMORY[0x24BDEDBB8]);
    sub_23559867C(&qword_2562491C0, &qword_2562491C8, MEMORY[0x24BDF43B0]);
    v61 = (uint64_t)v72;
    sub_2355C89C4();
    sub_2355986BC(v61, v85, &qword_2562490E0);
    swift_storeEnumTagMultiPayload();
    sub_23559E2AC();
    sub_23559E73C();
    v62 = (uint64_t)v86;
    sub_2355C89C4();
    sub_23558E470(v61, &qword_2562490E0);
    sub_2355986BC(v62, v98, &qword_2562490D0);
    swift_storeEnumTagMultiPayload();
    sub_23559E288();
    sub_23559E824();
    sub_2355C89C4();
    sub_23558E470(v62, &qword_2562490D0);
    return sub_23558E470((uint64_t)v34, &qword_2562490F0);
  }
}

uint64_t sub_23559AA20@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  int *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
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
  __int128 *v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  _OWORD *v44;
  __int128 v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  _OWORD *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  _OWORD *v66;
  __int128 v67;
  char *v68;
  uint64_t v69;
  uint64_t KeyPath;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  _OWORD *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t *v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  uint64_t v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  char *v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
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
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  uint64_t v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;

  LODWORD(v121) = a2;
  v120 = a1;
  v136 = a5;
  v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249398);
  MEMORY[0x24BDAC7A8](v133);
  v135 = (uint64_t)&v110 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249120);
  v8 = MEMORY[0x24BDAC7A8](v134);
  v10 = (char *)&v110 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v110 - v11;
  v13 = (int *)type metadata accessor for Style.CapsuleButtonStyle();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (uint64_t *)((char *)&v110 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249158);
  v123 = *(_QWORD *)(v16 - 8);
  v124 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v110 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249318);
  v127 = *(_QWORD *)(v19 - 8);
  v128 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v122 = (char *)&v110 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249150);
  v21 = MEMORY[0x24BDAC7A8](v126);
  v23 = (char *)&v110 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v110 = (char *)&v110 - v24;
  v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249140);
  v25 = MEMORY[0x24BDAC7A8](v129);
  v112 = (uint64_t)&v110 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v111 = (uint64_t)&v110 - v27;
  v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249130);
  v28 = MEMORY[0x24BDAC7A8](v130);
  v125 = (uint64_t)&v110 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v113 = (uint64_t)&v110 - v30;
  v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562491A8);
  MEMORY[0x24BDAC7A8](v115);
  v114 = (uint64_t)&v110 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249198);
  v32 = MEMORY[0x24BDAC7A8](v132);
  v117 = (char *)&v110 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = MEMORY[0x24BDAC7A8](v32);
  v116 = (char *)&v110 - v35;
  MEMORY[0x24BDAC7A8](v34);
  v118 = (uint64_t)&v110 - v36;
  v37 = type metadata accessor for OfferView();
  v38 = *(int *)(v37 + 28);
  v119 = (char *)a3;
  v39 = (__int128 *)(a4 + 136);
  v131 = a4;
  if ((v121 & 1) != 0)
  {
    v62 = *(_OWORD *)(a4 + 152);
    v162 = *v39;
    v163 = v62;
    v63 = *(_QWORD *)(a4 + 168);
    v64 = *(_QWORD *)(a4 + 176);
    v65 = *(_BYTE *)(a4 + 184);
    MEMORY[0x24BDAC7A8](v37);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256249338);
    sub_23559F808();
    sub_2355C8D78();
    *v15 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256249088);
    swift_storeEnumTagMultiPayload();
    *((_BYTE *)v15 + v13[5]) = v65;
    v66 = (_OWORD *)((char *)v15 + v13[6]);
    v67 = v163;
    *v66 = v162;
    v66[1] = v67;
    *(uint64_t *)((char *)v15 + v13[7]) = v63;
    *(uint64_t *)((char *)v15 + v13[8]) = v64;
    sub_23559867C(&qword_256249160, &qword_256249158, MEMORY[0x24BDF43B0]);
    sub_235598144(&qword_256249168, (uint64_t (*)(uint64_t))type metadata accessor for Style.CapsuleButtonStyle, (uint64_t)&unk_2355CA8A8);
    v68 = v122;
    v69 = v124;
    sub_2355C8C04();
    sub_23559F894((uint64_t)v15);
    (*(void (**)(char *, uint64_t))(v123 + 8))(v18, v69);
    swift_bridgeObjectRelease();
    KeyPath = swift_getKeyPath();
    v71 = swift_allocObject();
    *(_BYTE *)(v71 + 16) = 1;
    v73 = v127;
    v72 = v128;
    v74 = (uint64_t)v110;
    (*(void (**)(char *, char *, uint64_t))(v127 + 16))(v110, v68, v128);
    v75 = (uint64_t *)(v74 + *(int *)(v126 + 36));
    *v75 = KeyPath;
    v75[1] = (uint64_t)sub_2355A012C;
    v75[2] = v71;
    (*(void (**)(char *, uint64_t))(v73 + 8))(v68, v72);
    sub_2355C8E14();
    sub_2355C8838();
    v76 = v111;
    sub_2355986BC(v74, v111, &qword_256249150);
    v77 = (_OWORD *)(v76 + *(int *)(v129 + 36));
    v78 = v160;
    v77[4] = v159;
    v77[5] = v78;
    v77[6] = v161;
    v79 = v156;
    *v77 = v155;
    v77[1] = v79;
    v80 = v158;
    v77[2] = v157;
    v77[3] = v80;
    sub_23558E470(v74, &qword_256249150);
    v81 = v113;
    sub_2355986BC(v76, v113, &qword_256249140);
    *(_QWORD *)(v81 + *(int *)(v130 + 36)) = 0;
    sub_23558E470(v76, &qword_256249140);
    v82 = v131;
    if ((*(_BYTE *)(v131 + 185) & 1) != 0)
      v83 = sub_2355C8E14();
    else
      v83 = sub_2355C8E20();
    v92 = v83;
    v93 = v84;
    sub_23559C208(v82, (uint64_t)v119, (uint64_t)&v139);
    v94 = v114;
    sub_2355986BC(v81, v114, &qword_256249130);
    v95 = v94 + *(int *)(v115 + 36);
    v96 = v152;
    *(_OWORD *)(v95 + 192) = v151;
    *(_OWORD *)(v95 + 208) = v96;
    *(_OWORD *)(v95 + 224) = v153;
    v97 = v154;
    v98 = v148;
    *(_OWORD *)(v95 + 128) = v147;
    *(_OWORD *)(v95 + 144) = v98;
    v99 = v150;
    *(_OWORD *)(v95 + 160) = v149;
    *(_OWORD *)(v95 + 176) = v99;
    v100 = v144;
    *(_OWORD *)(v95 + 64) = v143;
    *(_OWORD *)(v95 + 80) = v100;
    v101 = v146;
    *(_OWORD *)(v95 + 96) = v145;
    *(_OWORD *)(v95 + 112) = v101;
    v102 = v140;
    *(_OWORD *)v95 = v139;
    *(_OWORD *)(v95 + 16) = v102;
    v103 = v142;
    *(_OWORD *)(v95 + 32) = v141;
    *(_OWORD *)(v95 + 48) = v103;
    *(_QWORD *)(v95 + 240) = v97;
    *(_QWORD *)(v95 + 248) = v92;
    *(_QWORD *)(v95 + 256) = v93;
    sub_23558E470(v81, &qword_256249130);
    sub_23559E698();
    v104 = (uint64_t)v117;
    sub_2355C8C40();
    sub_23558E470(v94, &qword_2562491A8);
    v137 = sub_2355AAE1C();
    v138 = v105;
    sub_23559FB5C();
    v106 = v116;
    sub_2355C8814();
    swift_bridgeObjectRelease();
    v89 = &qword_256249198;
    sub_23558E470(v104, &qword_256249198);
    v107 = (uint64_t)v106;
    v108 = v118;
    sub_235598700(v107, v118, &qword_256249198);
    sub_2355986BC(v108, v135, &qword_256249198);
    swift_storeEnumTagMultiPayload();
    sub_23559E444();
    sub_23559E614();
    sub_2355C89C4();
    v91 = v108;
  }
  else
  {
    v118 = a3 + v38;
    v119 = v10;
    v121 = (uint64_t)v12;
    v40 = *(_OWORD *)(a4 + 152);
    v155 = *v39;
    v156 = v40;
    v41 = *(_QWORD *)(a4 + 168);
    v42 = *(_QWORD *)(a4 + 176);
    v43 = *(_BYTE *)(a4 + 184);
    MEMORY[0x24BDAC7A8](v37);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256249338);
    sub_23559F808();
    sub_2355C8D78();
    *v15 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256249088);
    swift_storeEnumTagMultiPayload();
    *((_BYTE *)v15 + v13[5]) = v43;
    v44 = (_OWORD *)((char *)v15 + v13[6]);
    v45 = v156;
    *v44 = v155;
    v44[1] = v45;
    *(uint64_t *)((char *)v15 + v13[7]) = v41;
    *(uint64_t *)((char *)v15 + v13[8]) = v42;
    sub_23559867C(&qword_256249160, &qword_256249158, MEMORY[0x24BDF43B0]);
    sub_235598144(&qword_256249168, (uint64_t (*)(uint64_t))type metadata accessor for Style.CapsuleButtonStyle, (uint64_t)&unk_2355CA8A8);
    v46 = v122;
    v47 = v124;
    sub_2355C8C04();
    sub_23559F894((uint64_t)v15);
    (*(void (**)(char *, uint64_t))(v123 + 8))(v18, v47);
    swift_bridgeObjectRelease();
    v48 = swift_getKeyPath();
    v49 = swift_allocObject();
    *(_BYTE *)(v49 + 16) = 1;
    v51 = v127;
    v50 = v128;
    (*(void (**)(char *, char *, uint64_t))(v127 + 16))(v23, v46, v128);
    v52 = (uint64_t *)&v23[*(int *)(v126 + 36)];
    *v52 = v48;
    v52[1] = (uint64_t)sub_2355A012C;
    v52[2] = v49;
    (*(void (**)(char *, uint64_t))(v51 + 8))(v46, v50);
    v53 = (uint64_t)v23;
    sub_2355C8E14();
    sub_2355C8838();
    v54 = v112;
    sub_2355986BC(v53, v112, &qword_256249150);
    v55 = (_OWORD *)(v54 + *(int *)(v129 + 36));
    v56 = v144;
    v55[4] = v143;
    v55[5] = v56;
    v55[6] = v145;
    v57 = v140;
    *v55 = v139;
    v55[1] = v57;
    v58 = v142;
    v55[2] = v141;
    v55[3] = v58;
    sub_23558E470(v53, &qword_256249150);
    v59 = v125;
    sub_2355986BC(v54, v125, &qword_256249140);
    *(_QWORD *)(v59 + *(int *)(v130 + 36)) = 0;
    sub_23558E470(v54, &qword_256249140);
    if ((*(_BYTE *)(v131 + 185) & 1) != 0)
      v60 = sub_2355C8E14();
    else
      v60 = sub_2355C8E20();
    v130 = v60;
    v85 = v61;
    v86 = (uint64_t)v119;
    v87 = &v119[*(int *)(v134 + 36)];
    MEMORY[0x24BDAC7A8](v60);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2562493A8);
    sub_23559FBBC();
    sub_2355C8D78();
    v88 = (uint64_t *)&v87[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256249188) + 36)];
    *v88 = v130;
    v88[1] = v85;
    sub_235598700(v125, v86, &qword_256249130);
    v89 = &qword_256249120;
    v90 = v121;
    sub_235598700(v86, v121, &qword_256249120);
    sub_2355986BC(v90, v135, &qword_256249120);
    swift_storeEnumTagMultiPayload();
    sub_23559E444();
    sub_23559E614();
    sub_2355C89C4();
    v91 = v90;
  }
  return sub_23558E470(v91, v89);
}

uint64_t sub_23559B754(double a1)
{
  uint64_t result;
  double v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  _OWORD v10[16];
  char v11;
  char v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  sub_2355C8E14();
  sub_23559BAB4((uint64_t)v10);
  v26 = v10[12];
  v27 = v10[13];
  v28 = v10[14];
  v29 = v10[15];
  v22 = v10[8];
  v23 = v10[9];
  v24 = v10[10];
  v25 = v10[11];
  v18 = v10[4];
  v19 = v10[5];
  v20 = v10[6];
  v21 = v10[7];
  v14 = v10[0];
  v15 = v10[1];
  v16 = v10[2];
  v17 = v10[3];
  v11 = 0;
  sub_2355C8E14();
  sub_2355C8760();
  v13 = v8;
  v12 = v9;
  sub_2355AAE1C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562493E8);
  result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_2355C9B30;
  v3 = a1 * 100.0;
  if ((~COERCE__INT64(a1 * 100.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v3 < 9.22337204e18)
  {
    v4 = (_QWORD *)result;
    v5 = sub_2355C9228();
    v7 = v6;
    v4[7] = MEMORY[0x24BEE0D00];
    v4[8] = sub_23559FD4C();
    v4[4] = v5;
    v4[5] = v7;
    sub_2355C8F04();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2562493C0);
    sub_23559FC60(&qword_2562493B8, &qword_2562493C0, (uint64_t (*)(void))sub_23559FCC8, MEMORY[0x24BDEBEE0]);
    sub_23559FB5C();
    sub_2355C8C34();
    swift_bridgeObjectRelease();
    return sub_23559FD90((uint64_t)v10);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_23559BAB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned __int8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned __int8 v34;

  sub_2355C8CD0();
  v9 = sub_2355C8CDC();
  swift_release();
  sub_2355C8BB0();
  sub_2355C8724();
  if (qword_256248808 != -1)
    swift_once();
  v5 = qword_25624C390;
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  swift_retain();
  sub_2355C8BB0();
  sub_2355C8724();
  v8 = sub_2355C8CB8();
  v4 = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](v4);
  sub_2355C8BB0();
  v6 = sub_2355C8CB8();
  v3 = swift_getKeyPath();
  *(_QWORD *)a1 = v9;
  *(_QWORD *)(a1 + 8) = v10;
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(a1 + 24) = v12;
  *(_QWORD *)(a1 + 32) = v13;
  *(_BYTE *)(a1 + 40) = v14;
  *(_QWORD *)(a1 + 48) = v15;
  *(_QWORD *)(a1 + 56) = v16;
  *(_QWORD *)(a1 + 64) = v17;
  *(_QWORD *)(a1 + 72) = v18;
  *(_QWORD *)(a1 + 80) = v19;
  *(_QWORD *)(a1 + 88) = KeyPath;
  *(_QWORD *)(a1 + 96) = v5;
  *(_QWORD *)(a1 + 104) = v20;
  *(_QWORD *)(a1 + 112) = v21;
  *(_QWORD *)(a1 + 120) = v22;
  *(_QWORD *)(a1 + 128) = v23;
  *(_BYTE *)(a1 + 136) = v24;
  *(_QWORD *)(a1 + 144) = v25;
  *(_QWORD *)(a1 + 152) = v26;
  *(_QWORD *)(a1 + 160) = v27;
  *(_QWORD *)(a1 + 168) = v28;
  *(_QWORD *)(a1 + 176) = v29;
  *(_QWORD *)(a1 + 184) = v4;
  *(_QWORD *)(a1 + 192) = v8;
  *(_QWORD *)(a1 + 200) = v30;
  *(_QWORD *)(a1 + 208) = v31;
  *(_QWORD *)(a1 + 216) = v32;
  *(_QWORD *)(a1 + 224) = v33;
  *(_BYTE *)(a1 + 232) = v34;
  *(_QWORD *)(a1 + 240) = v3;
  *(_QWORD *)(a1 + 248) = v6;
  swift_retain();
  sub_23559FF08(v10, v11, v12, v13, v14);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_23559FF08(v20, v21, v22, v23, v24);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_23559FF08(v30, v31, v32, v33, v34);
  swift_retain();
  swift_retain();
  sub_23559FECC(v30, v31, v32, v33, v34);
  swift_release();
  swift_release();
  sub_23559FECC(v20, v21, v22, v23, v24);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_23559FECC(v10, v11, v12, v13, v14);
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23559C06C()
{
  return sub_2355C8BA4();
}

uint64_t sub_23559C0BC()
{
  return sub_2355C8BA4();
}

uint64_t sub_23559C114()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  _QWORD v5[6];

  v0 = sub_2355C8964();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDEEB68], v0);
  v5[0] = 0x3FF0000000000000;
  v5[1] = 0;
  v5[2] = 0;
  v5[3] = 0x3FF0000000000000;
  v5[4] = 0;
  v5[5] = 0;
  sub_2355C8B98();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

double sub_23559C208@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double result;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t KeyPath;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unsigned __int8 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  double v59[3];

  v6 = type metadata accessor for OfferView();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = a1;
  sub_2355C8BB0();
  v41 = v45;
  v40 = v46;
  v39 = v47;
  v38 = v48;
  v37 = v49;
  sub_2355C8724();
  v10 = v50;
  v11 = v51;
  v12 = v52;
  v36 = v53;
  v13 = v54;
  if (qword_256248808 != -1)
    swift_once();
  v34 = qword_25624C390;
  KeyPath = swift_getKeyPath();
  v14 = a2 + *(int *)(v6 + 32);
  v15 = *(_BYTE *)v14;
  v16 = *(_QWORD *)(v14 + 8);
  LOBYTE(v55) = *(_BYTE *)v14;
  v56 = v16;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562493F8);
  sub_2355C8D48();
  if (v44)
    v17 = 6.28318531;
  else
    v17 = 0.0;
  sub_2355C8E80();
  v19 = v18;
  v21 = v20;
  sub_2355C8E38();
  v33 = sub_2355C8E2C();
  swift_release();
  LOBYTE(v55) = v15;
  v56 = v16;
  sub_2355C8D48();
  v22 = v44;
  sub_23559DF78(a2, (uint64_t)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v23 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v24 = swift_allocObject();
  sub_23559E0FC((uint64_t)v9, v24 + v23);
  sub_23559DF78(a2, (uint64_t)v9);
  v25 = swift_allocObject();
  sub_23559E0FC((uint64_t)v9, v25 + v23);
  sub_2355C8E14();
  sub_2355C8760();
  v26 = v55;
  v27 = v57;
  v44 = v56;
  v43 = v58;
  v28 = v40;
  *(_QWORD *)a3 = v41;
  *(_QWORD *)(a3 + 8) = v28;
  v29 = v38;
  *(_QWORD *)(a3 + 16) = v39;
  *(_QWORD *)(a3 + 24) = v29;
  *(_BYTE *)(a3 + 32) = v37;
  *(_QWORD *)(a3 + 40) = v10;
  *(_QWORD *)(a3 + 48) = v11;
  *(_QWORD *)(a3 + 56) = v12;
  *(_QWORD *)(a3 + 64) = v36;
  *(_QWORD *)(a3 + 72) = v13;
  v30 = v34;
  *(_QWORD *)(a3 + 80) = KeyPath;
  *(_QWORD *)(a3 + 88) = v30;
  *(double *)(a3 + 96) = v17;
  *(_QWORD *)(a3 + 104) = v19;
  *(_QWORD *)(a3 + 112) = v21;
  *(_QWORD *)(a3 + 120) = v33;
  *(_BYTE *)(a3 + 128) = v22;
  *(_QWORD *)(a3 + 136) = sub_23559FF2C;
  *(_QWORD *)(a3 + 144) = v24;
  *(_OWORD *)(a3 + 168) = 0u;
  *(_OWORD *)(a3 + 152) = 0u;
  *(_QWORD *)(a3 + 184) = sub_2355A0070;
  *(_QWORD *)(a3 + 192) = v25;
  *(_QWORD *)(a3 + 200) = v26;
  *(_BYTE *)(a3 + 208) = v44;
  *(_QWORD *)(a3 + 216) = v27;
  *(_BYTE *)(a3 + 224) = v43;
  result = v59[0];
  *(_OWORD *)(a3 + 232) = *(_OWORD *)v59;
  return result;
}

uint64_t sub_23559C5C4()
{
  return sub_2355C8BA4();
}

uint64_t sub_23559C614()
{
  type metadata accessor for OfferView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562493F8);
  return sub_2355C8D54();
}

uint64_t sub_23559C67C()
{
  type metadata accessor for OfferView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562493F8);
  return sub_2355C8D54();
}

uint64_t sub_23559C6E0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  _OWORD *v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t KeyPath;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  char *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
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
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
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
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;

  v72 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248FA8);
  MEMORY[0x24BDAC7A8](v3);
  v71 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (int *)type metadata accessor for Style.CapsuleButtonStyle();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (uint64_t *)((char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249158);
  v58 = *(_QWORD *)(v57 - 8);
  MEMORY[0x24BDAC7A8](v57);
  v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249318);
  v60 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v11 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249150);
  MEMORY[0x24BDAC7A8](v59);
  v13 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249140);
  MEMORY[0x24BDAC7A8](v62);
  v15 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249130);
  MEMORY[0x24BDAC7A8](v63);
  v65 = (uint64_t)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249370);
  MEMORY[0x24BDAC7A8](v64);
  v66 = (uint64_t)&v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249360);
  MEMORY[0x24BDAC7A8](v68);
  v69 = (uint64_t)&v57 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249348);
  MEMORY[0x24BDAC7A8](v19);
  v67 = (char *)&v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_2355AAE1C();
  v22 = *(_QWORD *)(a1 + 168);
  v23 = *(_QWORD *)(a1 + 176);
  v24 = *(_BYTE *)(a1 + 184);
  v73 = v21;
  v74 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249338);
  sub_23559F808();
  sub_2355C8D78();
  *v7 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249088);
  swift_storeEnumTagMultiPayload();
  *((_BYTE *)v7 + v5[5]) = v24;
  v26 = (_OWORD *)((char *)v7 + v5[6]);
  v27 = *(_OWORD *)(a1 + 136);
  v70 = a1;
  v28 = *(_OWORD *)(a1 + 152);
  *v26 = v27;
  v26[1] = v28;
  *(uint64_t *)((char *)v7 + v5[7]) = v22;
  *(uint64_t *)((char *)v7 + v5[8]) = v23;
  sub_23559867C(&qword_256249160, &qword_256249158, MEMORY[0x24BDF43B0]);
  sub_235598144(&qword_256249168, (uint64_t (*)(uint64_t))type metadata accessor for Style.CapsuleButtonStyle, (uint64_t)&unk_2355CA8A8);
  v29 = v57;
  sub_2355C8C04();
  sub_23559F894((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v9, v29);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  v31 = swift_allocObject();
  *(_BYTE *)(v31 + 16) = 1;
  v32 = v60;
  v33 = v61;
  (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v13, v11, v61);
  v34 = (uint64_t *)&v13[*(int *)(v59 + 36)];
  *v34 = KeyPath;
  v34[1] = (uint64_t)sub_2355A012C;
  v34[2] = v31;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v33);
  sub_2355C8E14();
  sub_2355C8838();
  sub_2355986BC((uint64_t)v13, (uint64_t)v15, &qword_256249150);
  v35 = &v15[*(int *)(v62 + 36)];
  v36 = v82;
  *((_OWORD *)v35 + 4) = v81;
  *((_OWORD *)v35 + 5) = v36;
  *((_OWORD *)v35 + 6) = v83;
  v37 = v78;
  *(_OWORD *)v35 = v77;
  *((_OWORD *)v35 + 1) = v37;
  v38 = v80;
  *((_OWORD *)v35 + 2) = v79;
  *((_OWORD *)v35 + 3) = v38;
  sub_23558E470((uint64_t)v13, &qword_256249150);
  v39 = v65;
  sub_2355986BC((uint64_t)v15, v65, &qword_256249140);
  *(_QWORD *)(v39 + *(int *)(v63 + 36)) = 0;
  sub_23558E470((uint64_t)v15, &qword_256249140);
  sub_2355C8CD0();
  v40 = sub_2355C8CDC();
  swift_release();
  LOBYTE(v15) = sub_2355C8AD8();
  v41 = v66;
  sub_2355986BC(v39, v66, &qword_256249130);
  v42 = v41 + *(int *)(v64 + 36);
  *(_QWORD *)v42 = v40;
  *(_BYTE *)(v42 + 8) = (_BYTE)v15;
  sub_23558E470(v39, &qword_256249130);
  if ((*(_BYTE *)(v70 + 185) & 1) != 0)
    v43 = sub_2355C8E14();
  else
    v43 = sub_2355C8E20();
  v45 = v43;
  v46 = v44;
  v47 = sub_2355C8D30();
  sub_2355C8B38();
  v48 = sub_2355C8B20();
  v49 = (uint64_t)v71;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v71, 1, 1, v48);
  v50 = sub_2355C8B44();
  sub_23558E470(v49, &qword_256248FA8);
  v51 = swift_getKeyPath();
  v52 = v69;
  sub_2355986BC(v41, v69, &qword_256249370);
  v53 = (uint64_t *)(v52 + *(int *)(v68 + 36));
  *v53 = v47;
  v53[1] = v51;
  v53[2] = v50;
  v53[3] = v45;
  v53[4] = v46;
  sub_23558E470(v41, &qword_256249370);
  v75 = sub_2355AAE1C();
  v76 = v54;
  sub_23559FA24();
  sub_23559FB5C();
  v55 = (uint64_t)v67;
  sub_2355C8C28();
  swift_bridgeObjectRelease();
  sub_23558E470(v52, &qword_256249360);
  return sub_235598700(v55, v72, &qword_256249348);
}

uint64_t sub_23559CEE8@<X0>(_QWORD *a1@<X8>)
{
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
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  v2 = sub_2355C89DC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23559F7BC();
  sub_2355C8A00();
  sub_2355C8778();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *a1 = v7;
  a1[1] = v9;
  a1[2] = v11;
  a1[3] = v13;
  return result;
}

uint64_t sub_23559CFB8(uint64_t a1, __int128 *a2, uint64_t a3)
{
  uint64_t v4;
  double v5;
  double v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  void (*v23)(__int128 *);
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[2];

  v5 = *(double *)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v6 = *(double *)(a1 + 16);
  v7 = a2[9];
  v34 = a2[8];
  v35 = v7;
  v36[0] = a2[10];
  *(_OWORD *)((char *)v36 + 13) = *(__int128 *)((char *)a2 + 173);
  v8 = a2[5];
  v30 = a2[4];
  v31 = v8;
  v9 = a2[7];
  v32 = a2[6];
  v33 = v9;
  v10 = a2[1];
  v26 = *a2;
  v27 = v10;
  v11 = a2[3];
  v28 = a2[2];
  v29 = v11;
  v12 = type metadata accessor for OfferView();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  sub_2355C8748();
  sub_23558AB5C(v25);
  v14 = v13;
  v16 = v15;
  swift_bridgeObjectRelease();
  v17 = *(_QWORD *)a3;
  v18 = *(_BYTE *)(a3 + 8);
  sub_23558C900(*(_QWORD *)a3, v18);
  sub_23559D63C(v17, v18, &v26);
  sub_23558CA44(v17, v18);
  if (v26 - 1 >= 3)
    v5 = v5 + v6 - v14;
  v19 = a3 + *(int *)(v12 + 24);
  v20 = *(_QWORD *)v19;
  v21 = *(_QWORD *)(v19 + 8);
  v22 = *(_BYTE *)(v19 + 16);
  sub_23559EC88();
  v23 = (void (*)(__int128 *))sub_23559DC50(v20, v21, v22);
  sub_23559E0F0();
  *(double *)&v26 = v5;
  *((_QWORD *)&v26 + 1) = v4;
  *(double *)&v27 = v14;
  *((_QWORD *)&v27 + 1) = v16;
  v23(&v26);
  return swift_release();
}

uint64_t sub_23559D158@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  sub_23559FB5C();
  swift_bridgeObjectRetain();
  v2 = sub_2355C8BD4();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  result = swift_getKeyPath();
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v6 & 1;
  *(_QWORD *)(a1 + 24) = v8;
  *(_QWORD *)(a1 + 32) = result;
  *(_QWORD *)(a1 + 40) = 1;
  *(_BYTE *)(a1 + 48) = 0;
  return result;
}

void sub_23559D1F4(_QWORD *a1@<X8>)
{
  *a1 = nullsub_1;
  a1[1] = 0;
}

uint64_t (*EnvironmentValues.reportOfferButtonFrame.getter())(double, double, double, double)
{
  __int128 v1;

  sub_23559E9BC();
  sub_2355C891C();
  *(_OWORD *)(swift_allocObject() + 16) = v1;
  return sub_23559EA24;
}

double sub_23559D264@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  sub_23559E9BC();
  sub_2355C891C();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_23559D2B0()
{
  sub_23559E9BC();
  swift_retain();
  return sub_2355C8928();
}

uint64_t EnvironmentValues.reportOfferButtonFrame.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  sub_23559E9BC();
  return sub_2355C8928();
}

void (*EnvironmentValues.reportOfferButtonFrame.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  v3[5] = sub_23559E9BC();
  sub_2355C891C();
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = *((_OWORD *)v3 + 1);
  *v3 = sub_23559EA24;
  v3[1] = v4;
  return sub_23559D40C;
}

void sub_23559D40C(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *a1;
  v4 = **a1;
  v3 = (*a1)[1];
  if ((a2 & 1) != 0)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    *(_QWORD *)(v5 + 24) = v3;
    v2[2] = (uint64_t)sub_23559EA28;
    v2[3] = v5;
    swift_retain();
    sub_2355C8928();
    swift_release();
  }
  else
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v3;
    v2[2] = (uint64_t)sub_23559EA28;
    v2[3] = v6;
    sub_2355C8928();
  }
  free(v2);
}

uint64_t sub_23559D4D8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_2355A00D8();
  result = sub_2355C891C();
  *a1 = v3;
  return result;
}

uint64_t sub_23559D524@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_2355A00D8();
  result = sub_2355C891C();
  *a1 = v3;
  return result;
}

uint64_t sub_23559D570()
{
  sub_2355A00D8();
  return sub_2355C8928();
}

uint64_t sub_23559D5B8()
{
  sub_2355A00D8();
  return sub_2355C8928();
}

uint64_t type metadata accessor for OfferView()
{
  uint64_t result;

  result = qword_256249290;
  if (!qword_256249290)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23559D63C@<X0>(uint64_t a1@<X0>, char a2@<W1>, _BYTE *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  os_log_type_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[3];
  uint64_t v18;

  v6 = sub_2355C8910();
  v7 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x24BDAC7A8]();
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    *a3 = a1;
  }
  else
  {
    sub_23558C900(a1, 0);
    v11 = sub_2355C9090();
    v12 = sub_2355C8ACC();
    v13 = v11;
    if (os_log_type_enabled(v12, v11))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v17[1] = a3;
      v16 = v15;
      v18 = v15;
      *(_DWORD *)v14 = 136315138;
      v17[2] = sub_23558FF68(0x656C797453, 0xE500000000000000, &v18);
      sub_2355C9120();
      _os_log_impl(&dword_235588000, v12, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7CFC88](v16, -1, -1);
      MEMORY[0x23B7CFC88](v14, -1, -1);
    }

    sub_2355C8904();
    swift_getAtKeyPath();
    sub_23558CA44(a1, 0);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return result;
}

uint64_t sub_23559D804(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v4 = sub_2355C8910();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  swift_retain();
  v8 = sub_2355C9090();
  v9 = sub_2355C8ACC();
  v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v15 = v12;
    *(_DWORD *)v11 = 136315138;
    v14 = sub_23558FF68(1819242306, 0xE400000000000000, &v15);
    sub_2355C9120();
    _os_log_impl(&dword_235588000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7CFC88](v12, -1, -1);
    MEMORY[0x23B7CFC88](v11, -1, -1);
  }

  sub_2355C8904();
  swift_getAtKeyPath();
  sub_23558CA44(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_23559D9BC@<X0>(uint64_t a1@<X8>)
{
  return sub_23559DA18(&qword_256249088, (uint64_t (*)(_QWORD))MEMORY[0x24BDEB418], 0x686353726F6C6F43, 0xEB00000000656D65, a1);
}

uint64_t sub_23559D9EC@<X0>(uint64_t a1@<X8>)
{
  return sub_23559DA18(&qword_256249078, (uint64_t (*)(_QWORD))MEMORY[0x24BDEEEA0], 0xD000000000000013, 0x80000002355CC050, a1);
}

uint64_t sub_23559DA18@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  os_log_type_t v20;
  NSObject *v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v28 = a3;
  v9 = v5;
  v11 = sub_2355C8910();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2355986BC(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    v20 = sub_2355C9090();
    v21 = sub_2355C8ACC();
    if (os_log_type_enabled(v21, v20))
    {
      v26 = a4;
      v22 = swift_slowAlloc();
      v27 = a5;
      v23 = (uint8_t *)v22;
      v24 = swift_slowAlloc();
      v30 = v24;
      *(_DWORD *)v23 = 136315138;
      v29 = sub_23558FF68(v28, v26, &v30);
      sub_2355C9120();
      _os_log_impl(&dword_235588000, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7CFC88](v24, -1, -1);
      MEMORY[0x23B7CFC88](v23, -1, -1);
    }

    sub_2355C8904();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_23559DC50(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  _QWORD v15[2];
  uint64_t v16;

  v5 = sub_2355C8910();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a3 & 1) != 0)
  {
    swift_retain();
  }
  else
  {
    swift_retain();
    v9 = sub_2355C9090();
    v10 = sub_2355C8ACC();
    v11 = v9;
    if (os_log_type_enabled(v10, v9))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v16 = v13;
      *(_DWORD *)v12 = 136315138;
      v15[0] = v12 + 4;
      v15[1] = sub_23558FF68(0x2974636552474328, 0xEE002928203E2D20, &v16);
      sub_2355C9120();
      _os_log_impl(&dword_235588000, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7CFC88](v13, -1, -1);
      MEMORY[0x23B7CFC88](v12, -1, -1);
    }

    sub_2355C8904();
    swift_getAtKeyPath();
    sub_23559E0F0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return v16;
  }
  return a1;
}

uint64_t sub_23559DE34@<X0>(uint64_t a1@<X8>)
{
  return sub_23559DA18(&qword_2562492F0, (uint64_t (*)(_QWORD))MEMORY[0x24BDECF50], 0x5463696D616E7944, 0xEF657A6953657079, a1);
}

uint64_t sub_23559DE68()
{
  return sub_2355C885C();
}

uint64_t sub_23559DE88()
{
  return sub_2355C885C();
}

uint64_t sub_23559DEA8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_2355C8994();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2355C8868();
}

double sub_23559DF28@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  sub_23559E9BC();
  sub_2355C891C();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_23559DF78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for OfferView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23559DFBC()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);

  v1 = (int *)type metadata accessor for OfferView();
  v2 = v0
     + ((*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80) + 205) & ~(unint64_t)*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80));
  sub_23558CA44(*(_QWORD *)v2, *(_BYTE *)(v2 + 8));
  v3 = v2 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249078);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_2355C8994();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  }
  else
  {
    swift_release();
  }
  sub_23559E0F0();
  swift_release();
  swift_release();
  v5 = v2 + v1[9];
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(v2 + v1[10], v6);
  return swift_deallocObject();
}

uint64_t sub_23559E0F0()
{
  return swift_release();
}

uint64_t sub_23559E0FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for OfferView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23559E140(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for OfferView() - 8) + 80);
  return sub_23559CFB8(a1, (__int128 *)(v1 + 16), v1 + ((v3 + 205) & ~v3));
}

unint64_t sub_23559E180()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2562490A8;
  if (!qword_2562490A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2562490A0);
    v2[0] = sub_23559E204();
    v2[1] = sub_23559867C(&qword_256249210, &qword_256249218, MEMORY[0x24BDF0400]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2562490A8);
  }
  return result;
}

unint64_t sub_23559E204()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2562490B0;
  if (!qword_2562490B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249098);
    v2 = sub_23559E3D4(&qword_2562490B8, &qword_2562490C0, sub_23559E288, sub_23559E824);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2562490B0);
  }
  return result;
}

uint64_t sub_23559E288()
{
  return sub_23559E3D4(&qword_2562490C8, &qword_2562490D0, (uint64_t (*)(void))sub_23559E2AC, (uint64_t (*)(void))sub_23559E73C);
}

unint64_t sub_23559E2AC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2562490D8;
  if (!qword_2562490D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2562490E0);
    v2[0] = sub_23559FC60(&qword_2562490E8, &qword_2562490F0, (uint64_t (*)(void))sub_23559E350, MEMORY[0x24BDEDBB8]);
    v2[1] = sub_23559867C(&qword_2562491C0, &qword_2562491C8, MEMORY[0x24BDF43B0]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2562490D8);
  }
  return result;
}

unint64_t sub_23559E350()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2562490F8;
  if (!qword_2562490F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249100);
    v2 = sub_23559E3D4(&qword_256249108, &qword_256249110, (uint64_t (*)(void))sub_23559E444, (uint64_t (*)(void))sub_23559E614);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2562490F8);
  }
  return result;
}

uint64_t sub_23559E3D4(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4();
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23559E444()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249118;
  if (!qword_256249118)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249120);
    v2[0] = sub_23559FC60(&qword_256249128, &qword_256249130, sub_23559E4E8, MEMORY[0x24BDECC38]);
    v2[1] = sub_23559867C(&qword_256249180, &qword_256249188, MEMORY[0x24BDEDC10]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249118);
  }
  return result;
}

uint64_t sub_23559E4E8()
{
  return sub_23559FC60(&qword_256249138, &qword_256249140, (uint64_t (*)(void))sub_23559E50C, MEMORY[0x24BDEDBB8]);
}

unint64_t sub_23559E50C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_256249148;
  if (!qword_256249148)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249150);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249158);
    v2[3] = type metadata accessor for Style.CapsuleButtonStyle();
    v2[4] = sub_23559867C(&qword_256249160, &qword_256249158, MEMORY[0x24BDF43B0]);
    v2[5] = sub_235598144(&qword_256249168, (uint64_t (*)(uint64_t))type metadata accessor for Style.CapsuleButtonStyle, (uint64_t)&unk_2355CA8A8);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_23559867C(&qword_256249170, &qword_256249178, MEMORY[0x24BDF1248]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249148);
  }
  return result;
}

unint64_t sub_23559E614()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249190;
  if (!qword_256249190)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249198);
    v2[0] = sub_23559E698();
    v2[1] = sub_235598144(&qword_256248EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249190);
  }
  return result;
}

unint64_t sub_23559E698()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2562491A0;
  if (!qword_2562491A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2562491A8);
    v2[0] = sub_23559FC60(&qword_256249128, &qword_256249130, sub_23559E4E8, MEMORY[0x24BDECC38]);
    v2[1] = sub_23559867C(&qword_2562491B0, &qword_2562491B8, MEMORY[0x24BDEDC10]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2562491A0);
  }
  return result;
}

unint64_t sub_23559E73C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_2562491D0;
  if (!qword_2562491D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2562491D8);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249158);
    v2[3] = type metadata accessor for Style.CapsuleButtonStyle();
    v2[4] = sub_23559867C(&qword_256249160, &qword_256249158, MEMORY[0x24BDF43B0]);
    v2[5] = sub_235598144(&qword_256249168, (uint64_t (*)(uint64_t))type metadata accessor for Style.CapsuleButtonStyle, (uint64_t)&unk_2355CA8A8);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = v2[0];
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2562491D0);
  }
  return result;
}

uint64_t sub_23559E824()
{
  return sub_23559E3D4(&qword_2562491E0, &qword_2562491E8, (uint64_t (*)(void))sub_23559E848, (uint64_t (*)(void))sub_23559E938);
}

unint64_t sub_23559E848()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_2562491F0;
  if (!qword_2562491F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2562491F8);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249158);
    v2[3] = type metadata accessor for Style.CapsuleButtonStyle();
    v2[4] = sub_23559867C(&qword_256249160, &qword_256249158, MEMORY[0x24BDF43B0]);
    v2[5] = sub_235598144(&qword_256249168, (uint64_t (*)(uint64_t))type metadata accessor for Style.CapsuleButtonStyle, (uint64_t)&unk_2355CA8A8);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2562491F0);
  }
  return result;
}

unint64_t sub_23559E938()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249200;
  if (!qword_256249200)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249208);
    v2[0] = sub_23559E50C();
    v2[1] = sub_23559867C(&qword_256248F98, &qword_256248FA0, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249200);
  }
  return result;
}

unint64_t sub_23559E9BC()
{
  unint64_t result;

  result = qword_256249220;
  if (!qword_256249220)
  {
    result = MEMORY[0x23B7CFBF8](&unk_2355CA3C0, &_s28__Key_reportOfferButtonFrameVN);
    atomic_store(result, (unint64_t *)&qword_256249220);
  }
  return result;
}

uint64_t sub_23559EA00()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23559EA2C(double a1, double a2, double a3, double a4)
{
  uint64_t v4;
  uint64_t (*v5)(_QWORD *);
  _QWORD v7[4];

  v5 = *(uint64_t (**)(_QWORD *))(v4 + 16);
  *(double *)v7 = a1;
  *(double *)&v7[1] = a2;
  *(double *)&v7[2] = a3;
  *(double *)&v7[3] = a4;
  return v5(v7);
}

uint64_t sub_23559EA60(double *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(double, double, double, double))(v1 + 16))(*a1, a1[1], a1[2], a1[3]);
}

unint64_t sub_23559EA8C()
{
  unint64_t result;

  result = qword_256249228;
  if (!qword_256249228)
  {
    result = MEMORY[0x23B7CFBF8](&protocol conformance descriptor for OfferView.Space, &type metadata for OfferView.Space);
    atomic_store(result, (unint64_t *)&qword_256249228);
  }
  return result;
}

uint64_t sub_23559EAD0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t initializeBufferWithCopyOfBuffer for OfferView(unint64_t a1, uint64_t a2, int *a3)
{
  int v5;
  uint64_t v7;
  char v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, uint64_t);

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = v13 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = *(_QWORD *)a2;
    v8 = *(_BYTE *)(a2 + 8);
    sub_23558C900(*(_QWORD *)a2, v8);
    *(_QWORD *)a1 = v7;
    *(_BYTE *)(a1 + 8) = v8;
    v9 = a3[5];
    v10 = (_QWORD *)(a1 + v9);
    v11 = (_QWORD *)(a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256249078);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_2355C8994();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v14 = a3[6];
    v15 = a1 + v14;
    v16 = (uint64_t *)(a2 + v14);
    v17 = *v16;
    v18 = v16[1];
    v19 = *((_BYTE *)v16 + 16);
    sub_23559EC88();
    *(_QWORD *)v15 = v17;
    *(_QWORD *)(v15 + 8) = v18;
    *(_BYTE *)(v15 + 16) = v19;
    v20 = a3[7];
    v21 = a3[8];
    v22 = (_QWORD *)(a1 + v20);
    v23 = (_QWORD *)(a2 + v20);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    v25 = a1 + v21;
    v26 = a2 + v21;
    *(_BYTE *)v25 = *(_BYTE *)v26;
    *(_QWORD *)(v25 + 8) = *(_QWORD *)(v26 + 8);
    v27 = a3[9];
    v28 = a1 + v27;
    v29 = a2 + v27;
    swift_retain();
    swift_retain();
    v30 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
    v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 16);
    v31(v28, v29, v30);
    v31(a1 + a3[10], a2 + a3[10], v30);
  }
  return a1;
}

uint64_t sub_23559EC88()
{
  return swift_retain();
}

uint64_t destroy for OfferView(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v9)(uint64_t, uint64_t);

  sub_23558CA44(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  v4 = a1 + a2[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249078);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_2355C8994();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  sub_23559E0F0();
  swift_release();
  swift_release();
  v6 = a1 + a2[9];
  v7 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v9(v6, v7);
  return ((uint64_t (*)(uint64_t, uint64_t))v9)(a1 + a2[10], v7);
}

uint64_t initializeWithCopy for OfferView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t);

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_23558C900(*(_QWORD *)a2, v7);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  v8 = a3[5];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249078);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_2355C8994();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  else
  {
    *v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = (uint64_t *)(a2 + v12);
  v15 = *v14;
  v16 = v14[1];
  v17 = *((_BYTE *)v14 + 16);
  sub_23559EC88();
  *(_QWORD *)v13 = v15;
  *(_QWORD *)(v13 + 8) = v16;
  *(_BYTE *)(v13 + 16) = v17;
  v18 = a3[7];
  v19 = a3[8];
  v20 = (_QWORD *)(a1 + v18);
  v21 = (_QWORD *)(a2 + v18);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  v23 = a1 + v19;
  v24 = a2 + v19;
  *(_BYTE *)v23 = *(_BYTE *)v24;
  *(_QWORD *)(v23 + 8) = *(_QWORD *)(v24 + 8);
  v25 = a3[9];
  v26 = a1 + v25;
  v27 = a2 + v25;
  swift_retain();
  swift_retain();
  v28 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 16);
  v29(v26, v27, v28);
  v29(a1 + a3[10], a2 + a3[10], v28);
  return a1;
}

uint64_t assignWithCopy for OfferView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, uint64_t);

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_23558C900(*(_QWORD *)a2, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_23558CA44(v8, v9);
  if (a1 != a2)
  {
    v10 = a3[5];
    v11 = (_QWORD *)(a1 + v10);
    v12 = (_QWORD *)(a2 + v10);
    sub_23558E470(a1 + v10, &qword_256249078);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256249078);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v13 = sub_2355C8994();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v14 = a3[6];
  v15 = a1 + v14;
  v16 = (uint64_t *)(a2 + v14);
  v17 = *v16;
  v18 = v16[1];
  v19 = *((_BYTE *)v16 + 16);
  sub_23559EC88();
  *(_QWORD *)v15 = v17;
  *(_QWORD *)(v15 + 8) = v18;
  *(_BYTE *)(v15 + 16) = v19;
  sub_23559E0F0();
  v20 = a3[7];
  v21 = (_QWORD *)(a1 + v20);
  v22 = (_QWORD *)(a2 + v20);
  *v21 = *v22;
  v21[1] = v22[1];
  swift_retain();
  swift_release();
  v23 = a3[8];
  v24 = a1 + v23;
  v25 = a2 + v23;
  *(_BYTE *)v24 = *(_BYTE *)v25;
  *(_QWORD *)(v24 + 8) = *(_QWORD *)(v25 + 8);
  swift_retain();
  swift_release();
  v26 = a3[9];
  v27 = a1 + v26;
  v28 = a2 + v26;
  v29 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 24);
  v30(v27, v28, v29);
  v30(a1 + a3[10], a2 + a3[10], v29);
  return a1;
}

uint64_t initializeWithTake for OfferView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 *v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = a3[5];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249078);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_2355C8994();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v11 = a3[6];
  v12 = a3[7];
  v13 = a1 + v11;
  v14 = (__int128 *)(a2 + v11);
  v15 = *v14;
  *(_BYTE *)(v13 + 16) = *((_BYTE *)v14 + 16);
  *(_OWORD *)v13 = v15;
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  v16 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32);
  v20(v17, v18, v19);
  v20(a1 + a3[10], a2 + a3[10], v19);
  return a1;
}

uint64_t assignWithTake for OfferView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, uint64_t);

  v6 = *a2;
  v7 = *((_BYTE *)a2 + 8);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_23558CA44(v8, v9);
  if ((uint64_t *)a1 != a2)
  {
    v10 = a3[5];
    v11 = (void *)(a1 + v10);
    v12 = (char *)a2 + v10;
    sub_23558E470(a1 + v10, &qword_256249078);
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249078);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v14 = sub_2355C8994();
      (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
  }
  v15 = a3[6];
  v16 = a1 + v15;
  v17 = (uint64_t)a2 + v15;
  v18 = *(_BYTE *)(v17 + 16);
  *(_OWORD *)v16 = *(_OWORD *)v17;
  *(_BYTE *)(v16 + 16) = v18;
  sub_23559E0F0();
  v19 = a3[7];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (uint64_t *)((char *)a2 + v19);
  v23 = *v21;
  v22 = v21[1];
  *v20 = v23;
  v20[1] = v22;
  swift_release();
  v24 = a3[8];
  v25 = a1 + v24;
  v26 = (uint64_t)a2 + v24;
  *(_BYTE *)v25 = *(_BYTE *)v26;
  *(_QWORD *)(v25 + 8) = *(_QWORD *)(v26 + 8);
  swift_release();
  v27 = a3[9];
  v28 = a1 + v27;
  v29 = (uint64_t)a2 + v27;
  v30 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 40);
  v31(v28, v29, v30);
  v31(a1 + a3[10], (uint64_t)a2 + a3[10], v30);
  return a1;
}

uint64_t getEnumTagSinglePayload for OfferView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23559F3C4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249230);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
    v7 = *(_QWORD *)(v8 - 8);
    v9 = a3[9];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v10 = *(_QWORD *)(a1 + a3[7] + 8);
  if (v10 >= 0xFFFFFFFF)
    LODWORD(v10) = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for OfferView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23559F480(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256249230);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = a4[5];
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + a4[7] + 8) = (a2 - 1);
      return result;
    }
    v10 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
    v9 = *(_QWORD *)(v10 - 8);
    v11 = a4[9];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
}

void sub_23559F52C()
{
  unint64_t v0;
  unint64_t v1;

  sub_23559F5D8();
  if (v0 <= 0x3F)
  {
    sub_235593E30();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_23559F5D8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256248EA8)
  {
    sub_2355C8994();
    v0 = sub_2355C8718();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256248EA8);
  }
}

uint64_t getEnumTagSinglePayload for OfferView.Space(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for OfferView.Space(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23559F6C0 + 4 * byte_2355CA1CA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23559F6E0 + 4 * byte_2355CA1CF[v4]))();
}

_BYTE *sub_23559F6C0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23559F6E0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23559F6E8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23559F6F0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23559F6F8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23559F700(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23559F70C()
{
  return 0;
}

ValueMetadata *type metadata accessor for OfferView.Space()
{
  return &type metadata for OfferView.Space;
}

unint64_t sub_23559F728()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2562492E0;
  if (!qword_2562492E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2562492E8);
    v2[0] = sub_23559E180();
    v2[1] = sub_235598144(&qword_256248EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2562492E0);
  }
  return result;
}

ValueMetadata *_s28__Key_reportOfferButtonFrameVMa()
{
  return &_s28__Key_reportOfferButtonFrameVN;
}

unint64_t sub_23559F7BC()
{
  unint64_t result;

  result = qword_2562492F8;
  if (!qword_2562492F8)
  {
    result = MEMORY[0x23B7CFBF8](&protocol conformance descriptor for OfferView.Space, &type metadata for OfferView.Space);
    atomic_store(result, (unint64_t *)&qword_2562492F8);
  }
  return result;
}

uint64_t sub_23559F800@<X0>(uint64_t a1@<X8>)
{
  return sub_23559D158(a1);
}

unint64_t sub_23559F808()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256249340;
  if (!qword_256249340)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249338);
    v2 = sub_23559867C(&qword_256248EF0, &qword_256248EE8, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256249340);
  }
  return result;
}

uint64_t sub_23559F894(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Style.CapsuleButtonStyle();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23559F8D0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2355C88BC();
  *a1 = result & 1;
  return result;
}

uint64_t sub_23559F8FC()
{
  return sub_2355C88C8();
}

uint64_t sub_23559F920()
{
  return swift_deallocObject();
}

_BYTE *sub_23559F930(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_23559F948@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2355C88EC();
  *a1 = result;
  return result;
}

uint64_t sub_23559F970()
{
  swift_retain();
  return sub_2355C88F8();
}

uint64_t sub_23559F998@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23559C6E0(*(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_23559F9A0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249350;
  if (!qword_256249350)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249348);
    v2[0] = sub_23559FA24();
    v2[1] = sub_235598144(&qword_256248EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249350);
  }
  return result;
}

unint64_t sub_23559FA24()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249358;
  if (!qword_256249358)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249360);
    v2[0] = sub_23559FAA8();
    v2[1] = sub_23559867C(&qword_256249388, &qword_256249390, MEMORY[0x24BDEDC10]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249358);
  }
  return result;
}

unint64_t sub_23559FAA8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249368;
  if (!qword_256249368)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249370);
    v2[0] = sub_23559FC60(&qword_256249128, &qword_256249130, sub_23559E4E8, MEMORY[0x24BDECC38]);
    v2[1] = sub_23559867C(&qword_256249378, &qword_256249380, MEMORY[0x24BDEFB18]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249368);
  }
  return result;
}

uint64_t sub_23559FB4C()
{
  return swift_deallocObject();
}

unint64_t sub_23559FB5C()
{
  unint64_t result;

  result = qword_2562493A0;
  if (!qword_2562493A0)
  {
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2562493A0);
  }
  return result;
}

uint64_t sub_23559FBA0()
{
  return swift_deallocObject();
}

uint64_t sub_23559FBB0()
{
  uint64_t v0;

  return sub_23559B754(*(double *)(v0 + 24));
}

unint64_t sub_23559FBBC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2562493B0;
  if (!qword_2562493B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2562493A8);
    v2[0] = sub_23559FC60(&qword_2562493B8, &qword_2562493C0, (uint64_t (*)(void))sub_23559FCC8, MEMORY[0x24BDEBEE0]);
    v2[1] = sub_235598144(&qword_256248EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2562493B0);
  }
  return result;
}

uint64_t sub_23559FC60(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4;
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23559FCC8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2562493C8;
  if (!qword_2562493C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2562493D0);
    v2[0] = sub_23559867C(&qword_2562493D8, &qword_2562493E0, MEMORY[0x24BDF4750]);
    v2[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2562493C8);
  }
  return result;
}

unint64_t sub_23559FD4C()
{
  unint64_t result;

  result = qword_2562493F0;
  if (!qword_2562493F0)
  {
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2562493F0);
  }
  return result;
}

uint64_t sub_23559FD90(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 112);
  v12 = *(_QWORD *)(a1 + 104);
  v9 = *(_QWORD *)(a1 + 128);
  v10 = *(_QWORD *)(a1 + 120);
  v16 = *(_QWORD *)(a1 + 208);
  v17 = *(_QWORD *)(a1 + 200);
  v15 = *(_QWORD *)(a1 + 216);
  v14 = *(_QWORD *)(a1 + 224);
  v6 = *(_BYTE *)(a1 + 40);
  v7 = *(_BYTE *)(a1 + 136);
  v13 = *(_BYTE *)(a1 + 232);
  swift_release();
  sub_23559FECC(v2, v3, v4, v5, v6);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_23559FECC(v12, v11, v10, v9, v7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_23559FECC(v17, v16, v15, v14, v13);
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_23559FECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 - 2 <= 3)
    return swift_release();
  return result;
}

uint64_t sub_23559FEE4()
{
  return sub_23559C06C();
}

uint64_t sub_23559FEF4()
{
  return sub_23559C0BC();
}

uint64_t sub_23559FF00()
{
  return sub_23559C114();
}

uint64_t sub_23559FF08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 - 2 <= 3)
    return swift_retain();
  return result;
}

uint64_t sub_23559FF20()
{
  return sub_23559C5C4();
}

uint64_t sub_23559FF2C()
{
  return sub_2355A007C((uint64_t (*)(uint64_t))sub_23559C614);
}

uint64_t objectdestroy_61Tm()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);

  v1 = (int *)type metadata accessor for OfferView();
  v2 = v0
     + ((*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80));
  sub_23558CA44(*(_QWORD *)v2, *(_BYTE *)(v2 + 8));
  v3 = v2 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249078);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_2355C8994();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  }
  else
  {
    swift_release();
  }
  sub_23559E0F0();
  swift_release();
  swift_release();
  v5 = v2 + v1[9];
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(v2 + v1[10], v6);
  return swift_deallocObject();
}

uint64_t sub_2355A0070()
{
  return sub_2355A007C((uint64_t (*)(uint64_t))sub_23559C67C);
}

uint64_t sub_2355A007C(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for OfferView() - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_2355A00B8()
{
  return swift_deallocObject();
}

unint64_t sub_2355A00D8()
{
  unint64_t result;

  result = qword_256249400;
  if (!qword_256249400)
  {
    result = MEMORY[0x23B7CFBF8](&unk_2355CB9E4, &type metadata for ManagedContentStyleEnvironmentKey);
    atomic_store(result, (unint64_t *)&qword_256249400);
  }
  return result;
}

uint64_t ViewServiceContext.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ViewServiceContext.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ViewServiceContext()
{
  return objc_opt_self();
}

uint64_t method lookup function for ViewServiceContext()
{
  return swift_lookUpClassMethod();
}

uint64_t ManagedAppCellViewModel.name.getter()
{
  return sub_2355A035C();
}

uint64_t sub_2355A018C@<X0>(_QWORD *a1@<X8>)
{
  return sub_2355A03D8(a1);
}

uint64_t sub_2355A01A4()
{
  return sub_2355A0468();
}

uint64_t ManagedAppCellViewModel.name.setter()
{
  return sub_2355A04FC();
}

void (*ManagedAppCellViewModel.name.modify(_QWORD *a1))(_QWORD *)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2355C8670();
  return sub_2355A0248;
}

uint64_t ManagedAppCellViewModel.$name.getter()
{
  return sub_2355A13DC((uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__name, &qword_2562494C0);
}

uint64_t ManagedAppCellViewModel.$name.setter(uint64_t a1)
{
  return sub_2355A15E0(a1, &qword_2562494C8, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__name, &qword_2562494C0);
}

void (*ManagedAppCellViewModel.$name.modify(_QWORD *a1))(uint64_t, char)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562494C8);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__name;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2562494C0);
  sub_2355C8658();
  swift_endAccess();
  return sub_2355A0344;
}

uint64_t ManagedAppCellViewModel.subtitle.getter()
{
  return sub_2355A035C();
}

uint64_t sub_2355A035C()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2355C867C();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2355A03C4@<X0>(_QWORD *a1@<X8>)
{
  return sub_2355A03D8(a1);
}

uint64_t sub_2355A03D8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2355C867C();
  swift_release();
  result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_2355A0454()
{
  return sub_2355A0468();
}

uint64_t sub_2355A0468()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_2355C8688();
}

uint64_t ManagedAppCellViewModel.subtitle.setter()
{
  return sub_2355A04FC();
}

uint64_t sub_2355A04FC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_2355C8688();
}

void (*ManagedAppCellViewModel.subtitle.modify(_QWORD *a1))(_QWORD *)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2355C8670();
  return sub_2355A0248;
}

uint64_t ManagedAppCellViewModel.$subtitle.getter()
{
  return sub_2355A13DC((uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__subtitle, &qword_2562494C0);
}

uint64_t ManagedAppCellViewModel.$subtitle.setter(uint64_t a1)
{
  return sub_2355A15E0(a1, &qword_2562494C8, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__subtitle, &qword_2562494C0);
}

void (*ManagedAppCellViewModel.$subtitle.modify(_QWORD *a1))(uint64_t, char)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562494C8);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__subtitle;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2562494C0);
  sub_2355C8658();
  swift_endAccess();
  return sub_2355A0344;
}

uint64_t ManagedAppCellViewModel.iconImageURL.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2355C867C();
  swift_release();
  return swift_release();
}

uint64_t sub_2355A0744()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2355C867C();
  swift_release();
  return swift_release();
}

uint64_t sub_2355A07B0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248EA0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v9 - v6;
  sub_2355986BC(a1, (uint64_t)&v9 - v6, &qword_256248EA0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2355986BC((uint64_t)v7, (uint64_t)v5, &qword_256248EA0);
  swift_retain();
  sub_2355C8688();
  return sub_23558E470((uint64_t)v7, &qword_256248EA0);
}

uint64_t ManagedAppCellViewModel.iconImageURL.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248EA0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2355986BC(a1, (uint64_t)v4, &qword_256248EA0);
  swift_retain();
  sub_2355C8688();
  return sub_23558E470(a1, &qword_256248EA0);
}

void (*ManagedAppCellViewModel.iconImageURL.modify(_QWORD *a1))(_QWORD *)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2355C8670();
  return sub_2355A0248;
}

uint64_t ManagedAppCellViewModel.$iconImageURL.getter()
{
  return sub_2355A13DC((uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__iconImageURL, &qword_2562494E0);
}

uint64_t ManagedAppCellViewModel.$iconImageURL.setter(uint64_t a1)
{
  return sub_2355A15E0(a1, &qword_2562494E8, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__iconImageURL, &qword_2562494E0);
}

void (*ManagedAppCellViewModel.$iconImageURL.modify(_QWORD *a1))(uint64_t, char)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562494E8);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__iconImageURL;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2562494E0);
  sub_2355C8658();
  swift_endAccess();
  return sub_2355A0344;
}

uint64_t ManagedAppCellViewModel.style.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2355C867C();
  swift_release();
  return swift_release();
}

uint64_t sub_2355A0B44@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2355C867C();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2355A0BC4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_2355C8688();
}

uint64_t ManagedAppCellViewModel.style.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_2355C8688();
}

void (*ManagedAppCellViewModel.style.modify(_QWORD *a1))(_QWORD *)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2355C8670();
  return sub_2355A0248;
}

uint64_t ManagedAppCellViewModel.$style.getter()
{
  return sub_2355A13DC((uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__style, &qword_2562494F8);
}

uint64_t ManagedAppCellViewModel.$style.setter(uint64_t a1)
{
  return sub_2355A15E0(a1, &qword_256249500, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__style, &qword_2562494F8);
}

void (*ManagedAppCellViewModel.$style.modify(_QWORD *a1))(uint64_t, char)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249500);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__style;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2562494F8);
  sub_2355C8658();
  swift_endAccess();
  return sub_2355A0344;
}

uint64_t ManagedAppCellViewModel.offerState.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2355C867C();
  swift_release();
  return swift_release();
}

double sub_2355A0E78@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  char v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2355C867C();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_BYTE *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_2355A0F00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  v1 = *(_QWORD *)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_BYTE *)(a1 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235591504(v1, v2, v3);
  swift_retain();
  return sub_2355C8688();
}

uint64_t ManagedAppCellViewModel.offerState.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_2355C8688();
}

void (*ManagedAppCellViewModel.offerState.modify(_QWORD *a1))(_QWORD *)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2355C8670();
  return sub_2355A0248;
}

uint64_t ManagedAppCellViewModel.$offerState.getter()
{
  return sub_2355A13DC((uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__offerState, &qword_256249510);
}

uint64_t ManagedAppCellViewModel.$offerState.setter(uint64_t a1)
{
  return sub_2355A15E0(a1, &qword_256249518, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__offerState, &qword_256249510);
}

void (*ManagedAppCellViewModel.$offerState.modify(_QWORD *a1))(uint64_t, char)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249518);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__offerState;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_256249510);
  sub_2355C8658();
  swift_endAccess();
  return sub_2355A0344;
}

uint64_t ManagedAppCellViewModel.isInitial.getter()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2355C867C();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2355A11F0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2355C867C();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2355A1270()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_2355C8688();
}

uint64_t ManagedAppCellViewModel.isInitial.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_2355C8688();
}

void (*ManagedAppCellViewModel.isInitial.modify(_QWORD *a1))(_QWORD *)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2355C8670();
  return sub_2355A0248;
}

uint64_t ManagedAppCellViewModel.$isInitial.getter()
{
  return sub_2355A13DC((uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__isInitial, &qword_256249528);
}

uint64_t sub_2355A13DC(uint64_t a1, uint64_t *a2)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  sub_2355C8658();
  return swift_endAccess();
}

uint64_t sub_2355A1440(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a5);
  sub_2355C8658();
  return swift_endAccess();
}

uint64_t sub_2355A14AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v18 - v14;
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_2355C8664();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t ManagedAppCellViewModel.$isInitial.setter(uint64_t a1)
{
  return sub_2355A15E0(a1, &qword_256249530, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__isInitial, &qword_256249528);
}

uint64_t sub_2355A15E0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_2355C8664();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

void (*ManagedAppCellViewModel.$isInitial.modify(_QWORD *a1))(uint64_t, char)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249530);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__isInitial;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_256249528);
  sub_2355C8658();
  swift_endAccess();
  return sub_2355A0344;
}

uint64_t ManagedAppCellViewModel.offerAction.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel_offerAction);
  swift_retain();
  return v1;
}

uint64_t sub_2355A17B8()
{
  uint64_t result;
  uint64_t v1;

  v1 = 0;
  result = MEMORY[0x23B7CFC94](&v1, 8);
  qword_2562494A0 = v1 << 32;
  qword_2562494A8 = 0;
  byte_2562494B0 = 0;
  return result;
}

uint64_t ManagedAppCellViewModel.__allocating_init(exportedObject:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  ManagedAppCellViewModel.init(exportedObject:)(a1);
  return v2;
}

char *ManagedAppCellViewModel.init(exportedObject:)(uint64_t a1)
{
  char *v1;
  char *v2;
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
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  void (*v44)(_QWORD, _QWORD, _QWORD);
  char *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t (**v60)();
  char *v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  char *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  _QWORD *v94;
  uint64_t v95;
  char *v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  char *v102;
  char *v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  char *v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  unint64_t v138;
  uint64_t v139;
  char *v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  _QWORD *v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  char *v168;
  char *v169;
  __int128 v170;
  char v171;

  v2 = (char *)v1;
  v164 = *v1;
  v165 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249538);
  v4 = *(_QWORD *)(v3 - 8);
  v152 = v3;
  v153 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v150 = (char *)&v112 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249540);
  v7 = *(_QWORD *)(v6 - 8);
  v154 = v6;
  v155 = v7;
  MEMORY[0x24BDAC7A8](v6);
  v151 = (char *)&v112 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249548);
  v149 = *(_QWORD *)(v148 - 8);
  MEMORY[0x24BDAC7A8](v148);
  v147 = (char *)&v112 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249550);
  MEMORY[0x24BDAC7A8](v10);
  v163 = (char *)&v112 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v166 = sub_2355C90CC();
  v144 = *(_QWORD *)(v166 - 8);
  MEMORY[0x24BDAC7A8](v166);
  v162 = (char *)&v112 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v142 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249558);
  v143 = *(_QWORD *)(v142 - 8);
  MEMORY[0x24BDAC7A8](v142);
  v140 = (char *)&v112 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249560);
  v146 = *(_QWORD *)(v145 - 8);
  MEMORY[0x24BDAC7A8](v145);
  v141 = (char *)&v112 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249518);
  v138 = *(_QWORD *)(v139 - 8);
  v15 = MEMORY[0x24BDAC7A8](v139);
  v137 = (char *)&v112 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v132 = (char *)&v112 - v17;
  v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249568);
  v135 = *(_QWORD *)(v134 - 8);
  MEMORY[0x24BDAC7A8](v134);
  v131 = (char *)&v112 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249570);
  v130 = *(_QWORD *)(v129 - 8);
  MEMORY[0x24BDAC7A8](v129);
  v128 = (char *)&v112 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249500);
  v126 = *(_QWORD *)(v127 - 8);
  v20 = MEMORY[0x24BDAC7A8](v127);
  v125 = (char *)&v112 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v124 = (char *)&v112 - v22;
  v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248C60);
  v118 = *(_QWORD *)(v159 - 8);
  MEMORY[0x24BDAC7A8](v159);
  v158 = (char *)&v112 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249578);
  v123 = *(_QWORD *)(v121 - 8);
  MEMORY[0x24BDAC7A8](v121);
  v117 = (char *)&v112 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249580);
  MEMORY[0x24BDAC7A8](v25);
  v167 = (char *)&v112 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249588);
  MEMORY[0x24BDAC7A8](v27);
  v168 = (char *)&v112 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v161 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249528);
  v136 = *(_QWORD *)(v161 - 8);
  MEMORY[0x24BDAC7A8](v161);
  v133 = (char *)&v112 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v160 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249510);
  v122 = *(_QWORD *)(v160 - 8);
  MEMORY[0x24BDAC7A8](v160);
  v120 = (char *)&v112 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v157 = (_QWORD *)__swift_instantiateConcreteTypeFromMangledName(&qword_2562494F8);
  v119 = *(v157 - 1);
  MEMORY[0x24BDAC7A8](v157);
  v116 = (char *)&v112 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562494E0);
  v114 = *(_QWORD *)(v115 - 8);
  MEMORY[0x24BDAC7A8](v115);
  v33 = (char *)&v112 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248EA0);
  v34 = MEMORY[0x24BDAC7A8](v113);
  v36 = (char *)&v112 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v34);
  v38 = (char *)&v112 - v37;
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562494C0);
  v40 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v42 = (char *)&v112 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = &v2[OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__name];
  *(_QWORD *)&v170 = 0;
  *((_QWORD *)&v170 + 1) = 0xE000000000000000;
  sub_2355C864C();
  v44 = *(void (**)(_QWORD, _QWORD, _QWORD))(v40 + 32);
  v44(v43, v42, v39);
  v45 = &v2[OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__subtitle];
  *(_QWORD *)&v170 = 0;
  *((_QWORD *)&v170 + 1) = 0xE000000000000000;
  sub_2355C864C();
  v44(v45, v42, v39);
  v46 = &v2[OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__iconImageURL];
  v47 = sub_2355C8400();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v38, 1, 1, v47);
  sub_2355986BC((uint64_t)v38, (uint64_t)v36, &qword_256248EA0);
  sub_2355C864C();
  sub_23558E470((uint64_t)v38, &qword_256248EA0);
  (*(void (**)(char *, char *, uint64_t))(v114 + 32))(v46, v33, v115);
  v48 = &v2[OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__style];
  LOBYTE(v170) = 1;
  v49 = v116;
  sub_2355C864C();
  (*(void (**)(char *, char *, _QWORD *))(v119 + 32))(v48, v49, v157);
  v50 = &v2[OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__offerState];
  v170 = xmmword_2355CA560;
  v171 = 2;
  v51 = v120;
  sub_2355C864C();
  (*(void (**)(char *, char *, uint64_t))(v122 + 32))(v50, v51, v160);
  v52 = &v2[OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__isInitial];
  LOBYTE(v170) = 1;
  v53 = v133;
  sub_2355C864C();
  (*(void (**)(char *, char *, uint64_t))(v136 + 32))(v52, v53, v161);
  *(_QWORD *)&v2[OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel_appStateSubscription] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel_subscriptions] = MEMORY[0x24BEE4B08];
  v54 = OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel_viewBoundsSubject;
  v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562495A8);
  swift_allocObject();
  *(_QWORD *)&v2[v54] = sub_2355C861C();
  v55 = OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel_offerFrameSubject;
  v133 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_2562495B8);
  swift_allocObject();
  *(_QWORD *)&v2[v55] = sub_2355C861C();
  v56 = v2;
  v57 = sub_2355C8520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(v168, 1, 1, v57);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562495C0);
  swift_allocObject();
  v168 = (char *)sub_2355C8640();
  v58 = sub_2355C84B4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56))(v167, 1, 1, v58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562495C8);
  swift_allocObject();
  v167 = (char *)sub_2355C8640();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562495D0);
  swift_allocObject();
  v59 = sub_2355C861C();
  v60 = (uint64_t (**)())&v2[OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel_offerAction];
  *v60 = sub_2355A2D74;
  v60[1] = (uint64_t (*)())v59;
  v161 = v59;
  v120 = (char *)(v165 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject__managedAppViewConfiguration);
  swift_beginAccess();
  swift_retain();
  v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248C58);
  v61 = v158;
  sub_2355C8658();
  swift_endAccess();
  v119 = sub_23559867C(&qword_2562495D8, &qword_256248C60, MEMORY[0x24BDB9EE8]);
  v62 = v117;
  v63 = v159;
  sub_2355C86AC();
  v118 = *(_QWORD *)(v118 + 8);
  ((void (*)(char *, uint64_t))v118)(v61, v63);
  swift_beginAccess();
  v64 = v124;
  sub_2355C8658();
  swift_endAccess();
  sub_23559867C(&qword_2562495E0, &qword_256249578, MEMORY[0x24BDB96C0]);
  v65 = v121;
  sub_2355C86D0();
  (*(void (**)(char *, uint64_t))(v123 + 8))(v62, v65);
  v66 = v126;
  v67 = v127;
  (*(void (**)(char *, char *, uint64_t))(v126 + 16))(v125, v64, v127);
  swift_beginAccess();
  sub_2355C8664();
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v64, v67);
  v169 = v168;
  swift_beginAccess();
  swift_retain();
  sub_2355C8658();
  swift_endAccess();
  v68 = MEMORY[0x24BDB9D10];
  sub_23559867C(&qword_2562495E8, &qword_2562495C0, MEMORY[0x24BDB9D10]);
  sub_23559867C(&qword_2562495F0, &qword_256249500, MEMORY[0x24BDB9EE8]);
  v69 = v128;
  sub_2355C85D4();
  v70 = swift_allocObject();
  swift_weakInit();
  v71 = swift_allocObject();
  *(_QWORD *)(v71 + 16) = sub_2355A31A0;
  *(_QWORD *)(v71 + 24) = v70;
  sub_23559867C(&qword_2562495F8, &qword_256249570, MEMORY[0x24BDB9450]);
  v72 = v129;
  sub_2355C86C4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v130 + 8))(v69, v72);
  v156 = v56;
  swift_beginAccess();
  sub_2355C85E0();
  swift_endAccess();
  swift_release();
  v73 = v167;
  *(_QWORD *)&v170 = v167;
  sub_23559867C(&qword_256249600, &qword_2562495C8, v68);
  v74 = v131;
  sub_2355C86A0();
  swift_beginAccess();
  v75 = v132;
  sub_2355C8658();
  swift_endAccess();
  sub_23559867C(&qword_256249608, &qword_256249568, MEMORY[0x24BDB94C8]);
  v76 = v134;
  sub_2355C86D0();
  (*(void (**)(char *, uint64_t))(v135 + 8))(v74, v76);
  v77 = v138;
  v78 = v139;
  (*(void (**)(char *, char *, uint64_t))(v138 + 16))(v137, v75, v139);
  swift_beginAccess();
  sub_2355C8664();
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v77 + 8))(v75, v78);
  *(_QWORD *)&v170 = v161;
  v79 = swift_allocObject();
  *(_QWORD *)(v79 + 16) = v168;
  *(_QWORD *)(v79 + 24) = v73;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249610);
  sub_23559867C(&qword_256249618, &qword_2562495D0, MEMORY[0x24BDB9CB0]);
  v80 = v140;
  sub_2355C86A0();
  swift_release();
  v81 = v162;
  sub_2355C90C0();
  v138 = sub_2355905A8();
  *(_QWORD *)&v170 = sub_2355C90D8();
  v160 = sub_2355C90A8();
  v157 = *(_QWORD **)(*(_QWORD *)(v160 - 8) + 56);
  v82 = (uint64_t)v163;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v157)(v163, 1, 1, v160);
  sub_23559867C(&qword_256249620, &qword_256249558, MEMORY[0x24BDB94C8]);
  v139 = sub_235598144(&qword_256249628, (uint64_t (*)(uint64_t))sub_2355905A8, MEMORY[0x24BEE5670]);
  v83 = v141;
  v84 = v142;
  sub_2355C86B8();
  sub_23558E470(v82, &qword_256249550);

  v144 = *(_QWORD *)(v144 + 8);
  ((void (*)(char *, uint64_t))v144)(v81, v166);
  (*(void (**)(char *, uint64_t))(v143 + 8))(v80, v84);
  v85 = swift_allocObject();
  v86 = v164;
  *(_QWORD *)(v85 + 16) = v164;
  sub_23559867C(&qword_256249630, &qword_256249560, MEMORY[0x24BDB9920]);
  v87 = v145;
  sub_2355C86C4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v146 + 8))(v83, v87);
  swift_beginAccess();
  sub_2355C85E0();
  swift_endAccess();
  swift_release();
  v88 = swift_allocObject();
  *(_QWORD *)(v88 + 16) = 0;
  swift_beginAccess();
  v89 = v158;
  sub_2355C8658();
  swift_endAccess();
  v90 = v147;
  v91 = v159;
  sub_2355C86A0();
  ((void (*)(char *, uint64_t))v118)(v89, v91);
  v92 = swift_allocObject();
  v93 = v156;
  swift_weakInit();
  v94 = (_QWORD *)swift_allocObject();
  v94[2] = v88;
  v94[3] = v92;
  v95 = v165;
  v96 = v167;
  v97 = v168;
  v94[4] = v165;
  v94[5] = v97;
  v94[6] = v96;
  v94[7] = v86;
  sub_23559867C(&qword_256249638, &qword_256249548, MEMORY[0x24BDB94C8]);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v98 = v148;
  sub_2355C86C4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v149 + 8))(v90, v98);
  swift_beginAccess();
  sub_2355C85E0();
  swift_endAccess();
  swift_release();
  v99 = *(_QWORD *)&v93[OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel_viewBoundsSubject];
  v169 = *(char **)&v93[OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel_offerFrameSubject];
  *(_QWORD *)&v170 = v99;
  v100 = MEMORY[0x24BDB9CB0];
  sub_23559867C(&qword_256249640, &qword_2562495A8, MEMORY[0x24BDB9CB0]);
  sub_23559867C(&qword_256249648, &qword_2562495B8, v100);
  swift_retain();
  swift_retain();
  v101 = v150;
  sub_2355C85D4();
  v102 = v162;
  sub_2355C90B4();
  *(_QWORD *)&v170 = sub_2355C90D8();
  v103 = v163;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v157)(v163, 1, 1, v160);
  sub_23559867C(&qword_256249650, &qword_256249538, MEMORY[0x24BDB9450]);
  v104 = v151;
  v105 = (uint64_t)v103;
  v106 = v152;
  sub_2355C86B8();
  sub_23558E470(v105, &qword_256249550);

  ((void (*)(char *, uint64_t))v144)(v102, v166);
  (*(void (**)(char *, uint64_t))(v153 + 8))(v101, v106);
  v107 = swift_allocObject();
  v108 = v164;
  *(_QWORD *)(v107 + 16) = v95;
  *(_QWORD *)(v107 + 24) = v108;
  v109 = swift_allocObject();
  *(_QWORD *)(v109 + 16) = sub_2355A75B4;
  *(_QWORD *)(v109 + 24) = v107;
  sub_23559867C(&qword_256249658, &qword_256249540, MEMORY[0x24BDB9920]);
  swift_retain();
  v110 = v154;
  sub_2355C86C4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v155 + 8))(v104, v110);
  swift_beginAccess();
  sub_2355C85E0();
  swift_endAccess();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v156;
}

uint64_t sub_2355A2D74()
{
  return sub_2355C8610();
}

uint64_t sub_2355A2DA4@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  if (*(_QWORD *)(result + 8))
    *a2 = *(_BYTE *)(result + 16);
  else
    *a2 = 1;
  return result;
}

uint64_t sub_2355A2DC4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2355A2DE8(uint64_t a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248EA0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v29 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249588);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2355C8520();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *a2;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_2355986BC(a1, (uint64_t)v12, &qword_256249588);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
    {
      swift_release();
      return sub_23558E470((uint64_t)v12, &qword_256249588);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
      v19 = sub_2355C84CC();
      v21 = v20;
      swift_getKeyPath();
      v29 = v17;
      swift_getKeyPath();
      v30 = v19;
      v31 = v21;
      swift_retain();
      sub_2355C8688();
      if ((_DWORD)v29 == 2)
        v22 = sub_2355C84FC();
      else
        v22 = sub_2355C8514();
      if (v23)
        v24 = v22;
      else
        v24 = 0;
      if (v23)
        v25 = v23;
      else
        v25 = 0xE000000000000000;
      v26 = HIBYTE(v25) & 0xF;
      if ((v25 & 0x2000000000000000) == 0)
        v26 = v24 & 0xFFFFFFFFFFFFLL;
      if (!v26)
      {
        swift_bridgeObjectRelease();
        v27 = *(_QWORD *)(sub_2355C84F0() + 16);
        swift_bridgeObjectRelease();
        if (v27)
        {
          v30 = sub_2355C84F0();
          __swift_instantiateConcreteTypeFromMangledName(&qword_256249800);
          sub_23559867C(&qword_256249808, &qword_256249800, MEMORY[0x24BEE12C8]);
          v24 = sub_2355C8F58();
          v25 = v28;
          swift_bridgeObjectRelease();
        }
        else
        {
          v25 = 0xE100000000000000;
          v24 = 32;
        }
      }
      swift_getKeyPath();
      swift_getKeyPath();
      v30 = v24;
      v31 = v25;
      swift_retain();
      sub_2355C8688();
      sub_2355C8508();
      swift_getKeyPath();
      swift_getKeyPath();
      sub_2355986BC((uint64_t)v9, (uint64_t)v7, &qword_256248EA0);
      swift_retain();
      sub_2355C8688();
      sub_23558E470((uint64_t)v9, &qword_256248EA0);
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v30) = 0;
      sub_2355C8688();
      return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    }
  }
  return result;
}

uint64_t sub_2355A31A0(uint64_t a1, char *a2)
{
  return sub_2355A2DE8(a1, a2);
}

uint64_t sub_2355A31A8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2355A31CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;

  v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562497F8);
  return v3(a1, a1 + *(int *)(v4 + 48));
}

uint64_t sub_2355A3210@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  uint64_t v15;

  v4 = sub_2355C84B4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v15 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249580);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2355986BC(a1, (uint64_t)v13, &qword_256249580);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4);
  if ((_DWORD)result == 1)
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_BYTE *)(a2 + 16) = -1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v13, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
    ManagedContentOfferState.init(appState:)((uint64_t)v8, a2);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  return result;
}

uint64_t sub_2355A335C@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  char *v23;
  _QWORD v24[2];

  v24[1] = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249580);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2355C84B4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249588);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2355C8520();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2355C8634();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_23558E470((uint64_t)v12, &qword_256249588);
LABEL_5:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249610);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(a2, 1, 1, v18);
  }
  v24[0] = a2;
  v17 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  v17(v16, v12, v13);
  sub_2355C8634();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    sub_23558E470((uint64_t)v5, &qword_256249580);
    a2 = v24[0];
    goto LABEL_5;
  }
  v20 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v20(v9, v5, v6);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249610);
  v22 = v24[0];
  v23 = (char *)(v24[0] + *(int *)(v21 + 48));
  v17((char *)v24[0], v16, v13);
  v20(v23, v9, v6);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v22, 0, 1, v21);
}

uint64_t sub_2355A35B8()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2355A35E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2355A335C(*(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_2355A35EC(uint64_t a1, uint64_t a2)
{
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
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  char *v41;
  void (*v42)(char *, char *, uint64_t);
  char *v43;
  char *v44;
  void (*v45)(char *, char *, uint64_t);
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;

  v47 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248B68);
  MEMORY[0x24BDAC7A8](v3);
  v49 = (uint64_t)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249610);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_2355C84B4();
  v8 = *(_QWORD *)(v39 - 8);
  v46 = *(_QWORD *)(v8 + 64);
  v9 = MEMORY[0x24BDAC7A8](v39);
  v44 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v48 = (char *)&v36 - v11;
  v12 = sub_2355C8520();
  v13 = *(_QWORD **)(v12 - 8);
  v14 = v13[8];
  v15 = MEMORY[0x24BDAC7A8](v12);
  v41 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v36 - v16;
  v18 = *(int *)(v5 + 48);
  v19 = &v7[v18];
  v20 = a1 + v18;
  v37 = (void (*)(char *, uint64_t, uint64_t))v13[2];
  v40 = v13;
  v37(v7, a1, v12);
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v22 = v39;
  v21(v19, v20, v39);
  v45 = (void (*)(char *, char *, uint64_t))v13[4];
  v43 = v17;
  v45(v17, v7, v12);
  v42 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v38 = v8;
  v23 = v48;
  v42(v48, v19, v22);
  v24 = sub_2355C8FDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v49, 1, 1, v24);
  v25 = v44;
  v26 = v22;
  v21(v44, (uint64_t)v23, v22);
  v27 = v41;
  v37(v41, (uint64_t)v17, v12);
  sub_2355C8FB8();
  v28 = sub_2355C8FAC();
  v29 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v30 = v40;
  v31 = (v46 + *((unsigned __int8 *)v40 + 80) + v29) & ~(unint64_t)*((unsigned __int8 *)v40 + 80);
  v32 = (v14 + v31 + 7) & 0xFFFFFFFFFFFFFFF8;
  v33 = swift_allocObject();
  v34 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v33 + 16) = v28;
  *(_QWORD *)(v33 + 24) = v34;
  v42((char *)(v33 + v29), v25, v26);
  v45((char *)(v33 + v31), v27, v12);
  *(_QWORD *)(v33 + v32) = v47;
  sub_23558BAE0(v49, (uint64_t)&unk_2562497F0, v33);
  swift_release();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v48, v26);
  return ((uint64_t (*)(char *, uint64_t))v30[1])(v43, v12);
}

uint64_t sub_2355A390C()
{
  return swift_deallocObject();
}

uint64_t sub_2355A391C(uint64_t a1)
{
  uint64_t v1;

  return sub_2355A35EC(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2355A3924()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2355A3948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[16] = a4;
  v5[17] = a5;
  v6 = sub_2355C8520();
  v5[18] = v6;
  v5[19] = *(_QWORD *)(v6 - 8);
  v5[20] = swift_task_alloc();
  v5[21] = swift_task_alloc();
  v5[22] = swift_task_alloc();
  v7 = sub_2355C84B4();
  v5[23] = v7;
  v5[24] = *(_QWORD *)(v7 - 8);
  v5[25] = swift_task_alloc();
  v5[26] = swift_task_alloc();
  v5[27] = swift_task_alloc();
  v5[28] = swift_task_alloc();
  sub_2355C8FB8();
  v5[29] = sub_2355C8FAC();
  v5[30] = sub_2355C8F94();
  v5[31] = v8;
  return swift_task_switch();
}

uint64_t sub_2355A3A48()
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
  void (*v9)(uint64_t, uint64_t, uint64_t);
  void (*v10)(os_log_t, uint64_t, uint64_t);
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t, uint64_t);
  _DWORD *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  _QWORD *v37;
  int v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(uint64_t, uint64_t);
  uint64_t v69;
  void (*v70)(uint64_t, uint64_t);
  uint64_t v71;
  os_log_type_t v72;
  void (*v73)(uint64_t, uint64_t, uint64_t);
  uint64_t v74;
  os_log_t logb;
  NSObject *log;
  os_log_type_t loga;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;

  if (qword_256248820 != -1)
    swift_once();
  v1 = v0[16];
  v2 = v0[28];
  v3 = v0[23];
  v4 = v0[24];
  logb = (os_log_t)v0[22];
  v6 = v0[18];
  v5 = v0[19];
  v7 = v0[17];
  v8 = sub_2355C85C8();
  v0[32] = __swift_project_value_buffer(v8, (uint64_t)qword_25624C3A0);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[33] = v9;
  v9(v2, v1, v3);
  v10 = *(void (**)(os_log_t, uint64_t, uint64_t))(v5 + 16);
  v0[34] = v10;
  v10(logb, v7, v6);
  v11 = sub_2355C85B0();
  v12 = sub_2355C909C();
  if (os_log_type_enabled(v11, v12))
  {
    log = v11;
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    v78 = v14;
    *(_DWORD *)v13 = 136315650;
    v15 = v0;
    if (qword_256248800 != -1)
      swift_once();
    v16 = qword_2562494A0;
    v73 = v9;
    v72 = v12;
    v71 = v14;
    if (byte_2562494B0 == 1)
    {
      v17 = qword_2562494A8;
      swift_bridgeObjectRetain();
    }
    else
    {
      v23 = v0 + 45;
      v24 = HIDWORD(qword_2562494A0);
      v79 = 0;
      v80 = 0xE000000000000000;
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      *v23 = v24;
      sub_23558E07C();
      sub_2355C8F4C();
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      v16 = v79;
      v17 = v80;
    }
    v25 = v15[28];
    v27 = v15[23];
    v26 = v15[24];
    v0 = v15;
    v28 = v15[22];
    v66 = v15[19];
    v67 = v15[18];
    v15[15] = sub_23558FF68(v16, v17, &v78);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    sub_235598144(&qword_2562497E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAC28], MEMORY[0x24BDDAC38]);
    v29 = sub_2355C9228();
    v15[8] = sub_23558FF68(v29, v30, &v78);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    v21 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v21(v25, v27);
    *(_WORD *)(v13 + 22) = 2080;
    v31 = sub_2355C84CC();
    v15[11] = sub_23558FF68(v31, v32, &v78);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    v22 = *(void (**)(uint64_t, uint64_t))(v66 + 8);
    v22(v28, v67);
    _os_log_impl(&dword_235588000, log, v72, "[%s] Receieved offer action for:%s on %s.", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x23B7CFC88](v71, -1, -1);
    MEMORY[0x23B7CFC88](v13, -1, -1);

    v9 = v73;
  }
  else
  {
    v18 = v0[22];
    v19 = v0[18];
    v20 = v0[19];
    v21 = *(void (**)(uint64_t, uint64_t))(v0[24] + 8);
    v21(v0[28], v0[23]);
    v22 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    v22(v18, v19);

  }
  v0[35] = v22;
  v0[36] = v21;
  v33 = v0[27];
  v34 = v0[23];
  v35 = v0[24];
  v9(v33, v0[16], v34);
  v36 = (*(uint64_t (**)(uint64_t, uint64_t))(v35 + 88))(v33, v34);
  if (v36 == *MEMORY[0x24BDDAC18])
  {
    (*(void (**)(_QWORD, _QWORD))(v0[24] + 96))(v0[27], v0[23]);
    swift_release();
    sub_2355C858C();
    v0[39] = sub_2355C8568();
    v37 = (_QWORD *)swift_task_alloc();
    v0[40] = v37;
    *v37 = v0;
    v37[1] = sub_2355A4798;
    return sub_2355C8580();
  }
  v39 = v36;
  if (v36 == *MEMORY[0x24BDDABC8])
  {
    (*(void (**)(_QWORD, _QWORD))(v0[24] + 96))(v0[27], v0[23]);
    swift_release();
    sub_2355C858C();
    v0[42] = sub_2355C8568();
    v40 = (_QWORD *)swift_task_alloc();
    v0[43] = v40;
    *v40 = v0;
    v40[1] = sub_2355A4804;
    return sub_2355C8574();
  }
  if (v36 == *MEMORY[0x24BDDAC00])
  {
    v41 = v0[27];
    v42 = v0[23];
    v43 = v0[24];
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v43 + 96))(v41, v42);
LABEL_18:
    swift_release();
    goto LABEL_19;
  }
  if (v36 == *MEMORY[0x24BDDAC20])
    goto LABEL_18;
  if (v36 == *MEMORY[0x24BDDAC08])
  {
    v56 = (_QWORD *)swift_task_alloc();
    v0[37] = v56;
    *v56 = v0;
    v56[1] = sub_2355A439C;
    return sub_2355C84D8();
  }
  v65 = *MEMORY[0x24BDDAC10];
  swift_release();
  if (v39 != v65)
    v21(v0[27], v0[23]);
LABEL_19:
  v44 = (void (*)(uint64_t, uint64_t, uint64_t))v0[34];
  v45 = v0[21];
  v47 = v0[17];
  v46 = v0[18];
  ((void (*)(_QWORD, _QWORD, _QWORD))v0[33])(v0[26], v0[16], v0[23]);
  v44(v45, v47, v46);
  v48 = sub_2355C85B0();
  v49 = sub_2355C909C();
  if (os_log_type_enabled(v48, v49))
  {
    v50 = swift_slowAlloc();
    v74 = swift_slowAlloc();
    v78 = v74;
    *(_DWORD *)v50 = 136315650;
    if (qword_256248800 != -1)
      swift_once();
    loga = v49;
    v51 = qword_2562494A0;
    if (byte_2562494B0 == 1)
    {
      v52 = qword_2562494A8;
      swift_bridgeObjectRetain();
    }
    else
    {
      v57 = HIDWORD(qword_2562494A0);
      v79 = 0;
      v80 = 0xE000000000000000;
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      *((_DWORD *)v0 + 92) = v57;
      sub_23558E07C();
      sub_2355C8F4C();
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      v51 = v79;
      v52 = v80;
    }
    v70 = (void (*)(uint64_t, uint64_t))v0[35];
    v58 = v0[26];
    v59 = v0[23];
    v60 = v0[21];
    v68 = (void (*)(uint64_t, uint64_t))v0[36];
    v69 = v0[18];
    v0[5] = sub_23558FF68(v51, v52, &v78);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v50 + 12) = 2080;
    sub_235598144(&qword_2562497E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAC28], MEMORY[0x24BDDAC38]);
    v61 = sub_2355C9228();
    v0[6] = sub_23558FF68(v61, v62, &v78);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    v68(v58, v59);
    *(_WORD *)(v50 + 22) = 2080;
    v63 = sub_2355C84CC();
    v0[7] = sub_23558FF68(v63, v64, &v78);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    v70(v60, v69);
    _os_log_impl(&dword_235588000, v48, loga, "[%s] Offer action for:%s on %s completed.", (uint8_t *)v50, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x23B7CFC88](v74, -1, -1);
    MEMORY[0x23B7CFC88](v50, -1, -1);
  }
  else
  {
    v53 = (void (*)(uint64_t, uint64_t))v0[35];
    v54 = v0[21];
    v55 = v0[18];
    ((void (*)(_QWORD, _QWORD))v0[36])(v0[26], v0[23]);
    v53(v54, v55);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_2355A439C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 304) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2355A43FC()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;

  swift_release();
  v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 272);
  v2 = *(_QWORD *)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 144);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 264))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 184));
  v1(v2, v4, v3);
  v5 = sub_2355C85B0();
  v6 = sub_2355C909C();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v25 = swift_slowAlloc();
    v27 = v25;
    *(_DWORD *)v7 = 136315650;
    if (qword_256248800 != -1)
      swift_once();
    v26 = v6;
    v8 = qword_2562494A0;
    if (byte_2562494B0 == 1)
    {
      v9 = qword_2562494A8;
      swift_bridgeObjectRetain();
    }
    else
    {
      v13 = HIDWORD(qword_2562494A0);
      v28 = 0;
      v29 = 0xE000000000000000;
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      *(_DWORD *)(v0 + 368) = v13;
      sub_23558E07C();
      sub_2355C8F4C();
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      v8 = v28;
      v9 = v29;
    }
    v24 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v14 = *(_QWORD *)(v0 + 208);
    v15 = *(_QWORD *)(v0 + 184);
    v16 = *(_QWORD *)(v0 + 168);
    v22 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
    v23 = *(_QWORD *)(v0 + 144);
    *(_QWORD *)(v0 + 40) = sub_23558FF68(v8, v9, &v27);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    sub_235598144(&qword_2562497E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAC28], MEMORY[0x24BDDAC38]);
    v17 = sub_2355C9228();
    *(_QWORD *)(v0 + 48) = sub_23558FF68(v17, v18, &v27);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    v22(v14, v15);
    *(_WORD *)(v7 + 22) = 2080;
    v19 = sub_2355C84CC();
    *(_QWORD *)(v0 + 56) = sub_23558FF68(v19, v20, &v27);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    v24(v16, v23);
    _os_log_impl(&dword_235588000, v5, v26, "[%s] Offer action for:%s on %s completed.", (uint8_t *)v7, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x23B7CFC88](v25, -1, -1);
    MEMORY[0x23B7CFC88](v7, -1, -1);
  }
  else
  {
    v10 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v11 = *(_QWORD *)(v0 + 168);
    v12 = *(_QWORD *)(v0 + 144);
    (*(void (**)(_QWORD, _QWORD))(v0 + 288))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 184));
    v10(v11, v12);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2355A4798()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 328) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_2355A4804()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 352) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_2355A4870()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  os_log_type_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;

  v1 = *(void **)(v0 + 304);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 264);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 272);
  v4 = *(_QWORD *)(v0 + 200);
  v5 = *(_QWORD *)(v0 + 184);
  v6 = *(_QWORD *)(v0 + 160);
  v8 = *(_QWORD *)(v0 + 136);
  v7 = *(_QWORD *)(v0 + 144);
  v9 = *(_QWORD *)(v0 + 128);
  swift_release();
  v2(v4, v9, v5);
  v10 = v8;
  v11 = v1;
  v3(v6, v10, v7);
  v12 = v1;
  v13 = v1;
  v14 = sub_2355C85B0();
  v15 = sub_2355C9084();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v39 = swift_slowAlloc();
    v42 = v39;
    *(_DWORD *)v16 = 136315906;
    if (qword_256248800 != -1)
      swift_once();
    v40 = v15;
    v17 = qword_2562494A0;
    v41 = v11;
    if (byte_2562494B0 == 1)
    {
      v18 = qword_2562494A8;
      swift_bridgeObjectRetain();
    }
    else
    {
      v25 = HIDWORD(qword_2562494A0);
      v43 = 0;
      v44 = 0xE000000000000000;
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      *(_DWORD *)(v0 + 364) = v25;
      sub_23558E07C();
      sub_2355C8F4C();
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      v17 = v43;
      v18 = v44;
    }
    v26 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
    v27 = *(_QWORD *)(v0 + 200);
    v28 = *(_QWORD *)(v0 + 184);
    v29 = *(_QWORD *)(v0 + 160);
    v37 = *(_QWORD *)(v0 + 144);
    v38 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    *(_QWORD *)(v0 + 72) = sub_23558FF68(v17, v18, &v42);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    sub_235598144(&qword_2562497E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAC28], MEMORY[0x24BDDAC38]);
    v30 = sub_2355C9228();
    *(_QWORD *)(v0 + 80) = sub_23558FF68(v30, v31, &v42);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    v26(v27, v28);
    *(_WORD *)(v16 + 22) = 2080;
    v32 = sub_2355C84CC();
    *(_QWORD *)(v0 + 104) = sub_23558FF68(v32, v33, &v42);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    v38(v29, v37);
    *(_WORD *)(v16 + 32) = 2080;
    swift_getErrorValue();
    v34 = sub_2355C9270();
    *(_QWORD *)(v0 + 112) = sub_23558FF68(v34, v35, &v42);
    sub_2355C9120();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_235588000, v14, v40, "[%s] Offer action for:%s on %s failed. %s", (uint8_t *)v16, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x23B7CFC88](v39, -1, -1);
    MEMORY[0x23B7CFC88](v16, -1, -1);

  }
  else
  {
    v20 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v19 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
    v21 = *(_QWORD *)(v0 + 200);
    v22 = *(_QWORD *)(v0 + 184);
    v23 = *(_QWORD *)(v0 + 160);
    v24 = *(_QWORD *)(v0 + 144);

    v19(v21, v22);
    v20(v23, v24);

  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2355A4CD4()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  os_log_type_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;

  swift_release();
  v1 = *(void **)(v0 + 328);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 264);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 272);
  v4 = *(_QWORD *)(v0 + 200);
  v5 = *(_QWORD *)(v0 + 184);
  v6 = *(_QWORD *)(v0 + 160);
  v8 = *(_QWORD *)(v0 + 136);
  v7 = *(_QWORD *)(v0 + 144);
  v9 = *(_QWORD *)(v0 + 128);
  swift_release();
  v2(v4, v9, v5);
  v10 = v8;
  v11 = v1;
  v3(v6, v10, v7);
  v12 = v1;
  v13 = v1;
  v14 = sub_2355C85B0();
  v15 = sub_2355C9084();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v39 = swift_slowAlloc();
    v42 = v39;
    *(_DWORD *)v16 = 136315906;
    if (qword_256248800 != -1)
      swift_once();
    v40 = v15;
    v17 = qword_2562494A0;
    v41 = v11;
    if (byte_2562494B0 == 1)
    {
      v18 = qword_2562494A8;
      swift_bridgeObjectRetain();
    }
    else
    {
      v25 = HIDWORD(qword_2562494A0);
      v43 = 0;
      v44 = 0xE000000000000000;
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      *(_DWORD *)(v0 + 364) = v25;
      sub_23558E07C();
      sub_2355C8F4C();
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      v17 = v43;
      v18 = v44;
    }
    v26 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
    v27 = *(_QWORD *)(v0 + 200);
    v28 = *(_QWORD *)(v0 + 184);
    v29 = *(_QWORD *)(v0 + 160);
    v37 = *(_QWORD *)(v0 + 144);
    v38 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    *(_QWORD *)(v0 + 72) = sub_23558FF68(v17, v18, &v42);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    sub_235598144(&qword_2562497E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAC28], MEMORY[0x24BDDAC38]);
    v30 = sub_2355C9228();
    *(_QWORD *)(v0 + 80) = sub_23558FF68(v30, v31, &v42);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    v26(v27, v28);
    *(_WORD *)(v16 + 22) = 2080;
    v32 = sub_2355C84CC();
    *(_QWORD *)(v0 + 104) = sub_23558FF68(v32, v33, &v42);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    v38(v29, v37);
    *(_WORD *)(v16 + 32) = 2080;
    swift_getErrorValue();
    v34 = sub_2355C9270();
    *(_QWORD *)(v0 + 112) = sub_23558FF68(v34, v35, &v42);
    sub_2355C9120();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_235588000, v14, v40, "[%s] Offer action for:%s on %s failed. %s", (uint8_t *)v16, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x23B7CFC88](v39, -1, -1);
    MEMORY[0x23B7CFC88](v16, -1, -1);

  }
  else
  {
    v20 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v19 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
    v21 = *(_QWORD *)(v0 + 200);
    v22 = *(_QWORD *)(v0 + 184);
    v23 = *(_QWORD *)(v0 + 160);
    v24 = *(_QWORD *)(v0 + 144);

    v19(v21, v22);
    v20(v23, v24);

  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2355A5140()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  os_log_type_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;

  swift_release();
  v1 = *(void **)(v0 + 352);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 264);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 272);
  v4 = *(_QWORD *)(v0 + 200);
  v5 = *(_QWORD *)(v0 + 184);
  v6 = *(_QWORD *)(v0 + 160);
  v8 = *(_QWORD *)(v0 + 136);
  v7 = *(_QWORD *)(v0 + 144);
  v9 = *(_QWORD *)(v0 + 128);
  swift_release();
  v2(v4, v9, v5);
  v10 = v8;
  v11 = v1;
  v3(v6, v10, v7);
  v12 = v1;
  v13 = v1;
  v14 = sub_2355C85B0();
  v15 = sub_2355C9084();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v39 = swift_slowAlloc();
    v42 = v39;
    *(_DWORD *)v16 = 136315906;
    if (qword_256248800 != -1)
      swift_once();
    v40 = v15;
    v17 = qword_2562494A0;
    v41 = v11;
    if (byte_2562494B0 == 1)
    {
      v18 = qword_2562494A8;
      swift_bridgeObjectRetain();
    }
    else
    {
      v25 = HIDWORD(qword_2562494A0);
      v43 = 0;
      v44 = 0xE000000000000000;
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      *(_DWORD *)(v0 + 364) = v25;
      sub_23558E07C();
      sub_2355C8F4C();
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      v17 = v43;
      v18 = v44;
    }
    v26 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
    v27 = *(_QWORD *)(v0 + 200);
    v28 = *(_QWORD *)(v0 + 184);
    v29 = *(_QWORD *)(v0 + 160);
    v37 = *(_QWORD *)(v0 + 144);
    v38 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    *(_QWORD *)(v0 + 72) = sub_23558FF68(v17, v18, &v42);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    sub_235598144(&qword_2562497E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAC28], MEMORY[0x24BDDAC38]);
    v30 = sub_2355C9228();
    *(_QWORD *)(v0 + 80) = sub_23558FF68(v30, v31, &v42);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    v26(v27, v28);
    *(_WORD *)(v16 + 22) = 2080;
    v32 = sub_2355C84CC();
    *(_QWORD *)(v0 + 104) = sub_23558FF68(v32, v33, &v42);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    v38(v29, v37);
    *(_WORD *)(v16 + 32) = 2080;
    swift_getErrorValue();
    v34 = sub_2355C9270();
    *(_QWORD *)(v0 + 112) = sub_23558FF68(v34, v35, &v42);
    sub_2355C9120();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_235588000, v14, v40, "[%s] Offer action for:%s on %s failed. %s", (uint8_t *)v16, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x23B7CFC88](v39, -1, -1);
    MEMORY[0x23B7CFC88](v16, -1, -1);

  }
  else
  {
    v20 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v19 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
    v21 = *(_QWORD *)(v0 + 200);
    v22 = *(_QWORD *)(v0 + 184);
    v23 = *(_QWORD *)(v0 + 160);
    v24 = *(_QWORD *)(v0 + 144);

    v19(v21, v22);
    v20(v23, v24);

  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2355A55AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a2 = *(_QWORD *)a1;
  *(_QWORD *)(a2 + 8) = v2;
  *(_BYTE *)(a2 + 16) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2355A55C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v22[24];

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248B68);
  MEMORY[0x24BDAC7A8](v12);
  v14 = &v22[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = sub_2355C8FDC();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  v16 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  sub_2355C8FB8();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v17 = sub_2355C8FAC();
  v18 = (_QWORD *)swift_allocObject();
  v19 = MEMORY[0x24BEE6930];
  v18[2] = v17;
  v18[3] = v19;
  v18[4] = a4;
  v18[5] = a5;
  v18[6] = v16;
  v18[7] = a6;
  v18[8] = a7;
  swift_release();
  sub_2355A70A4((uint64_t)v14, (uint64_t)&unk_256249798, (uint64_t)v18);
  sub_2355C85EC();
  swift_allocObject();
  v20 = sub_2355C85F8();
  swift_beginAccess();
  *(_QWORD *)(a2 + 16) = v20;
  return swift_release();
}

uint64_t sub_2355A57A4()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2355A57E8(uint64_t a1)
{
  uint64_t *v1;

  return sub_2355A55C4(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_2355A57F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8[19] = a7;
  v8[20] = a8;
  v8[17] = a5;
  v8[18] = a6;
  v8[16] = a4;
  v9 = sub_2355C8598();
  v8[21] = v9;
  v8[22] = *(_QWORD *)(v9 - 8);
  v8[23] = swift_task_alloc();
  v8[24] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256248B68);
  v8[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249588);
  v8[26] = swift_task_alloc();
  v8[27] = swift_task_alloc();
  v10 = sub_2355C8520();
  v8[28] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v8[29] = v11;
  v8[30] = *(_QWORD *)(v11 + 64);
  v8[31] = swift_task_alloc();
  v8[32] = swift_task_alloc();
  v8[33] = swift_task_alloc();
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562497A8);
  v8[34] = v12;
  v8[35] = *(_QWORD *)(v12 - 8);
  v8[36] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562497B0);
  v8[37] = swift_task_alloc();
  v13 = sub_2355C8550();
  v8[38] = v13;
  v8[39] = *(_QWORD *)(v13 - 8);
  v8[40] = swift_task_alloc();
  v14 = sub_2355C8538();
  v8[41] = v14;
  v8[42] = *(_QWORD *)(v14 - 8);
  v8[43] = swift_task_alloc();
  v8[44] = sub_2355C8FB8();
  v8[45] = sub_2355C8FAC();
  v8[46] = sub_2355C8F94();
  v8[47] = v15;
  return swift_task_switch();
}

uint64_t sub_2355A59E8()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  if (qword_256248820 != -1)
    swift_once();
  v1 = sub_2355C85C8();
  *(_QWORD *)(v0 + 384) = __swift_project_value_buffer(v1, (uint64_t)qword_25624C3A0);
  v2 = sub_2355C85B0();
  v3 = sub_2355C909C();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v14 = v5;
    *(_DWORD *)v4 = 136315138;
    if (qword_256248800 != -1)
      swift_once();
    v6 = qword_2562494A0;
    if (byte_2562494B0 == 1)
    {
      v7 = qword_2562494A8;
      swift_bridgeObjectRetain();
    }
    else
    {
      v8 = HIDWORD(qword_2562494A0);
      v15 = 0;
      v16 = 0xE000000000000000;
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      *(_DWORD *)(v0 + 408) = v8;
      sub_23558E07C();
      sub_2355C8F4C();
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      v6 = v15;
      v7 = v16;
    }
    *(_QWORD *)(v0 + 120) = sub_23558FF68(v6, v7, &v14);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235588000, v2, v3, "[%s] Awaiting apps", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7CFC88](v5, -1, -1);
    MEMORY[0x23B7CFC88](v4, -1, -1);
  }

  v10 = *(_QWORD *)(v0 + 312);
  v9 = *(_QWORD *)(v0 + 320);
  v11 = *(_QWORD *)(v0 + 304);
  sub_2355C858C();
  sub_2355C8568();
  MEMORY[0x23B7CEA64]();
  swift_release();
  sub_2355C8544();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  swift_beginAccess();
  *(_QWORD *)(v0 + 392) = sub_2355C8FAC();
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 400) = v12;
  *v12 = v0;
  v12[1] = sub_2355A5CDC;
  return sub_2355C852C();
}

uint64_t sub_2355A5CDC()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2355A5D30()
{
  uint64_t v0;
  uint64_t v1;
  int EnumCaseMultiPayload;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(_QWORD, uint64_t, _QWORD);
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(unint64_t, uint64_t, uint64_t);
  void (*v53)(uint64_t, uint64_t, uint64_t);
  uint64_t Strong;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(unint64_t, uint64_t, uint64_t);
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;

  v1 = *(_QWORD *)(v0 + 296);
  if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 280) + 48))(v1, 1, *(_QWORD *)(v0 + 272)) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 336) + 8))(*(_QWORD *)(v0 + 344), *(_QWORD *)(v0 + 328));
    swift_release();
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
  sub_2355A7F7C(v1, *(_QWORD *)(v0 + 288));
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v4 = *(uint64_t **)(v0 + 288);
  if (EnumCaseMultiPayload == 1)
  {
    v6 = *(_QWORD *)(v0 + 184);
    v5 = *(_QWORD *)(v0 + 192);
    v7 = *(_QWORD *)(v0 + 168);
    v8 = *(_QWORD *)(v0 + 176);
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(v8 + 32))(v5, v4, v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v5, v7);
    v9 = sub_2355C85B0();
    v10 = sub_2355C9084();
    v11 = os_log_type_enabled(v9, v10);
    v12 = *(_QWORD *)(v0 + 184);
    v13 = *(_QWORD *)(v0 + 192);
    v14 = *(_QWORD *)(v0 + 168);
    v15 = *(_QWORD *)(v0 + 176);
    if (v11)
    {
      v16 = swift_slowAlloc();
      v17 = swift_slowAlloc();
      v85 = v17;
      *(_DWORD *)v16 = 136315138;
      sub_235598144(&qword_2562497B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAD00], MEMORY[0x24BDDAD10]);
      v18 = sub_2355C9270();
      *(_QWORD *)(v16 + 4) = sub_23558FF68(v18, v19, &v85);
      swift_bridgeObjectRelease();
      v20 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
      v20(v12, v14);
      _os_log_impl(&dword_235588000, v9, v10, "%s", (uint8_t *)v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7CFC88](v17, -1, -1);
      MEMORY[0x23B7CFC88](v16, -1, -1);

      v20(v13, v14);
    }
    else
    {

      v28 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
      v28(v12, v14);
      v28(v13, v14);
    }
    goto LABEL_39;
  }
  v21 = *v4;
  swift_bridgeObjectRetain_n();
  v22 = sub_2355C85B0();
  v23 = sub_2355C909C();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = swift_slowAlloc();
    v25 = swift_slowAlloc();
    *(_QWORD *)(v0 + 112) = v25;
    *(_DWORD *)v24 = 136315394;
    if (qword_256248800 != -1)
      swift_once();
    v26 = qword_2562494A0;
    if (byte_2562494B0 == 1)
    {
      v27 = qword_2562494A8;
      swift_bridgeObjectRetain();
    }
    else
    {
      v30 = HIDWORD(qword_2562494A0);
      *(_QWORD *)(v0 + 96) = 0;
      *(_QWORD *)(v0 + 104) = 0xE000000000000000;
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      *(_DWORD *)(v0 + 92) = v30;
      sub_23558E07C();
      sub_2355C8F4C();
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      v26 = *(_QWORD *)(v0 + 96);
      v27 = *(_QWORD *)(v0 + 104);
    }
    *(_QWORD *)(v24 + 4) = sub_23558FF68(v26, v27, (uint64_t *)(v0 + 112));
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2048;
    v31 = *(_QWORD *)(v21 + 16);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v24 + 14) = v31;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235588000, v22, v23, "[%s] Receieved %ld app(s)", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7CFC88](v25, -1, -1);
    MEMORY[0x23B7CFC88](v24, -1, -1);

    v29 = *(_QWORD *)(v21 + 16);
    if (v29)
      goto LABEL_16;
LABEL_25:
    v40 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 232) + 56);
    v40(*(_QWORD *)(v0 + 216), 1, 1, *(_QWORD *)(v0 + 224));
    goto LABEL_27;
  }

  swift_bridgeObjectRelease_n();
  v29 = *(_QWORD *)(v21 + 16);
  if (!v29)
    goto LABEL_25;
LABEL_16:
  v32 = *(_QWORD *)(v0 + 232);
  v33 = v21 + ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80));
  v83 = *(_QWORD *)(v32 + 72);
  v34 = *(void (**)(_QWORD, uint64_t, _QWORD))(v32 + 16);
  swift_bridgeObjectRetain();
  while (1)
  {
    v34(*(_QWORD *)(v0 + 256), v33, *(_QWORD *)(v0 + 224));
    v36 = sub_2355C84C0();
    v38 = v37;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2355C867C();
    swift_release();
    swift_release();
    v39 = *(_QWORD *)(v0 + 80);
    if (!v39)
    {
      swift_bridgeObjectRelease();
      goto LABEL_18;
    }
    if (v36 == *(_QWORD *)(v0 + 72) && v38 == v39)
      break;
    v35 = sub_2355C9234();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v35 & 1) != 0)
      goto LABEL_26;
LABEL_18:
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 232) + 8))(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 224));
    v33 += v83;
    if (!--v29)
    {
      swift_bridgeObjectRelease();
      goto LABEL_25;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_26:
  v41 = *(_QWORD *)(v0 + 256);
  v42 = *(_QWORD *)(v0 + 224);
  v43 = *(_QWORD *)(v0 + 232);
  v44 = *(_QWORD *)(v0 + 216);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 32))(v44, v41, v42);
  v40 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v43 + 56);
  v40(v44, 0, 1, v42);
LABEL_27:
  v46 = *(_QWORD *)(v0 + 224);
  v45 = *(_QWORD *)(v0 + 232);
  v47 = *(_QWORD *)(v0 + 216);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v47, 1, v46) == 1)
  {
    sub_23558E470(*(_QWORD *)(v0 + 216), &qword_256249588);
    goto LABEL_39;
  }
  v48 = *(_QWORD *)(v0 + 264);
  v49 = *(_QWORD *)(v0 + 224);
  v50 = *(_QWORD *)(v0 + 232);
  v51 = *(_QWORD *)(v0 + 208);
  v52 = *(void (**)(unint64_t, uint64_t, uint64_t))(v50 + 32);
  v52(v48, *(_QWORD *)(v0 + 216), v49);
  v53 = *(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16);
  v53(v51, v48, v49);
  v40(v51, 0, 1, v49);
  sub_2355C8628();
  sub_23558E470(v51, &qword_256249588);
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v55 = *(_QWORD *)(v0 + 264);
    v56 = *(_QWORD *)(v0 + 248);
    v80 = v56;
    v81 = *(_QWORD *)(v0 + 240);
    v57 = *(_QWORD *)(v0 + 224);
    v78 = Strong;
    v79 = *(_QWORD *)(v0 + 232);
    v58 = *(_QWORD *)(v0 + 200);
    v82 = v52;
    v59 = *(_QWORD *)(v0 + 152);
    v84 = *(_QWORD *)(v0 + 160);
    v60 = sub_2355C8FDC();
    v61 = *(_QWORD *)(v60 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v61 + 56))(v58, 1, 1, v60);
    v53(v56, v55, v57);
    swift_retain();
    v62 = sub_2355C8FAC();
    v63 = (*(unsigned __int8 *)(v79 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v79 + 80);
    v64 = (v81 + v63 + 7) & 0xFFFFFFFFFFFFFFF8;
    v65 = swift_allocObject();
    v66 = MEMORY[0x24BEE6930];
    *(_QWORD *)(v65 + 16) = v62;
    *(_QWORD *)(v65 + 24) = v66;
    v82(v65 + v63, v80, v57);
    *(_QWORD *)(v65 + v64) = v59;
    *(_QWORD *)(v65 + ((v64 + 15) & 0xFFFFFFFFFFFFFFF8)) = v84;
    v67 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v61 + 48))(v58, 1, v60);
    v68 = *(_QWORD *)(v0 + 200);
    if (v67 == 1)
    {
      sub_23558E470(*(_QWORD *)(v0 + 200), &qword_256248B68);
      if (*(_QWORD *)(v65 + 16))
        goto LABEL_32;
LABEL_35:
      v69 = 0;
      v71 = 0;
    }
    else
    {
      sub_2355C8FD0();
      (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v68, v60);
      if (!*(_QWORD *)(v65 + 16))
        goto LABEL_35;
LABEL_32:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v69 = sub_2355C8F94();
      v71 = v70;
      swift_unknownObjectRelease();
    }
    v72 = swift_allocObject();
    *(_QWORD *)(v72 + 16) = &unk_2562497C8;
    *(_QWORD *)(v72 + 24) = v65;
    if (v71 | v69)
    {
      *(_QWORD *)(v0 + 16) = 0;
      *(_QWORD *)(v0 + 24) = 0;
      *(_QWORD *)(v0 + 32) = v69;
      *(_QWORD *)(v0 + 40) = v71;
    }
    v73 = *(_QWORD *)(v0 + 264);
    v75 = *(_QWORD *)(v0 + 224);
    v74 = *(_QWORD *)(v0 + 232);
    swift_task_create();
    sub_2355C85EC();
    swift_allocObject();
    v76 = sub_2355C85F8();
    (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v73, v75);
    *(_QWORD *)(v78 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel_appStateSubscription) = v76;
    swift_release();
    swift_release();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 232) + 8))(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 224));
  }
LABEL_39:
  *(_QWORD *)(v0 + 392) = sub_2355C8FAC();
  v77 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 400) = v77;
  *v77 = v0;
  v77[1] = sub_2355A5CDC;
  return sub_2355C852C();
}

uint64_t sub_2355A66E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5[7] = a4;
  v5[8] = a5;
  v6 = sub_2355C84B4();
  v5[9] = v6;
  v5[10] = *(_QWORD *)(v6 - 8);
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249580);
  v5[13] = swift_task_alloc();
  v5[14] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562497D0);
  v5[15] = v7;
  v5[16] = *(_QWORD *)(v7 - 8);
  v5[17] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562497D8);
  v5[18] = v8;
  v5[19] = *(_QWORD *)(v8 - 8);
  v5[20] = swift_task_alloc();
  v9 = sub_2355C8520();
  v5[21] = v9;
  v5[22] = *(_QWORD *)(v9 - 8);
  v5[23] = swift_task_alloc();
  v5[24] = swift_task_alloc();
  v5[25] = sub_2355C8FB8();
  v5[26] = sub_2355C8FAC();
  v5[27] = sub_2355C8F94();
  v5[28] = v10;
  return swift_task_switch();
}

uint64_t sub_2355A684C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;

  if (qword_256248820 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 176);
  v5 = sub_2355C85C8();
  *(_QWORD *)(v0 + 232) = __swift_project_value_buffer(v5, (uint64_t)qword_25624C3A0);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  *(_QWORD *)(v0 + 240) = v6;
  v6(v2, v1, v3);
  v7 = sub_2355C85B0();
  v8 = sub_2355C909C();
  if (os_log_type_enabled(v7, v8))
  {
    v25 = v8;
    v9 = swift_slowAlloc();
    v24 = swift_slowAlloc();
    v26 = v24;
    *(_DWORD *)v9 = 136315394;
    if (qword_256248800 != -1)
      swift_once();
    v10 = qword_2562494A0;
    if (byte_2562494B0 == 1)
    {
      v11 = qword_2562494A8;
      swift_bridgeObjectRetain();
    }
    else
    {
      v13 = HIDWORD(qword_2562494A0);
      v27 = 0;
      v28 = 0xE000000000000000;
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      *(_DWORD *)(v0 + 284) = v13;
      sub_23558E07C();
      sub_2355C8F4C();
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      v10 = v27;
      v11 = v28;
    }
    v14 = *(_QWORD *)(v0 + 192);
    v16 = *(_QWORD *)(v0 + 168);
    v15 = *(_QWORD *)(v0 + 176);
    *(_QWORD *)(v0 + 40) = sub_23558FF68(v10, v11, &v26);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    v17 = sub_2355C84CC();
    *(_QWORD *)(v0 + 48) = sub_23558FF68(v17, v18, &v26);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    v12 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v12(v14, v16);
    _os_log_impl(&dword_235588000, v7, v25, "[%s] Awaiting state for %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7CFC88](v24, -1, -1);
    MEMORY[0x23B7CFC88](v9, -1, -1);
  }
  else
  {
    v12 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 176) + 8);
    v12(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 168));
  }

  *(_QWORD *)(v0 + 248) = v12;
  v20 = *(_QWORD *)(v0 + 128);
  v19 = *(_QWORD *)(v0 + 136);
  v21 = *(_QWORD *)(v0 + 120);
  sub_2355C84E4();
  sub_2355C8FE8();
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  *(_QWORD *)(v0 + 256) = v12;
  *(_QWORD *)(v0 + 264) = sub_2355C8FAC();
  v22 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 272) = v22;
  *v22 = v0;
  v22[1] = sub_2355A6BC8;
  return sub_2355C8FF4();
}

uint64_t sub_2355A6BC8()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2355A6C1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t *v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  uint64_t v40;
  os_log_type_t v41;
  void (*v42)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  v5 = *(_QWORD *)(v0 + 184);
  if (v4 == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));
    swift_release();
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
  else
  {
    v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 240);
    v8 = *(_QWORD *)(v0 + 168);
    v10 = *(_QWORD *)(v0 + 88);
    v9 = *(_QWORD *)(v0 + 96);
    v11 = *(_QWORD *)(v0 + 56);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v9, v1, v2);
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v12(v10, v9, v2);
    v7(v5, v11, v8);
    v13 = sub_2355C85B0();
    v14 = sub_2355C909C();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = swift_slowAlloc();
      v40 = swift_slowAlloc();
      *(_QWORD *)(v0 + 32) = v40;
      *(_DWORD *)v15 = 136315650;
      if (qword_256248800 != -1)
        swift_once();
      v41 = v14;
      v16 = qword_2562494A0;
      v42 = v12;
      if (byte_2562494B0 == 1)
      {
        v17 = qword_2562494A8;
        swift_bridgeObjectRetain();
      }
      else
      {
        v23 = HIDWORD(qword_2562494A0);
        *(_QWORD *)(v0 + 16) = 0;
        *(_QWORD *)(v0 + 24) = 0xE000000000000000;
        sub_2355C8F34();
        swift_bridgeObjectRelease();
        *(_DWORD *)(v0 + 280) = v23;
        sub_23558E07C();
        sub_2355C8F4C();
        sub_2355C8F34();
        swift_bridgeObjectRelease();
        v16 = *(_QWORD *)(v0 + 16);
        v17 = *(_QWORD *)(v0 + 24);
      }
      v18 = (uint64_t *)(v0 + 248);
      v24 = *(_QWORD *)(v0 + 184);
      v38 = *(_QWORD *)(v0 + 168);
      v39 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
      v25 = *(_QWORD *)(v0 + 80);
      v26 = *(_QWORD *)(v0 + 88);
      v27 = *(_QWORD *)(v0 + 72);
      *(_QWORD *)(v15 + 4) = sub_23558FF68(v16, v17, (uint64_t *)(v0 + 32));
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2080;
      sub_235598144(&qword_2562497E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAC28], MEMORY[0x24BDDAC38]);
      v28 = sub_2355C9228();
      *(_QWORD *)(v15 + 14) = sub_23558FF68(v28, v29, (uint64_t *)(v0 + 32));
      swift_bridgeObjectRelease();
      v22 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
      v22(v26, v27);
      *(_WORD *)(v15 + 22) = 2080;
      v30 = sub_2355C84CC();
      *(_QWORD *)(v15 + 24) = sub_23558FF68(v30, v31, (uint64_t *)(v0 + 32));
      swift_bridgeObjectRelease();
      v39(v24, v38);
      _os_log_impl(&dword_235588000, v13, v41, "[%s] Received state %s for %s", (uint8_t *)v15, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x23B7CFC88](v40, -1, -1);
      MEMORY[0x23B7CFC88](v15, -1, -1);

      v12 = v42;
    }
    else
    {
      v18 = (uint64_t *)(v0 + 256);
      v19 = *(void (**)(uint64_t, uint64_t))(v0 + 256);
      v20 = *(_QWORD *)(v0 + 184);
      v21 = *(_QWORD *)(v0 + 168);
      v22 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 80) + 8);
      v22(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
      v19(v20, v21);

    }
    v32 = *v18;
    v34 = *(_QWORD *)(v0 + 96);
    v33 = *(_QWORD *)(v0 + 104);
    v35 = *(_QWORD *)(v0 + 72);
    v36 = *(_QWORD *)(v0 + 80);
    v12(v33, v34, v35);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
    sub_2355C8628();
    sub_23558E470(v33, &qword_256249580);
    v22(v34, v35);
    *(_QWORD *)(v0 + 256) = v32;
    *(_QWORD *)(v0 + 264) = sub_2355C8FAC();
    v37 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 272) = v37;
    *v37 = v0;
    v37[1] = sub_2355A6BC8;
    return sub_2355C8FF4();
  }
}

uint64_t sub_2355A70A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_2355C8FDC();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_2355C8FD0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_23558E470(a1, &qword_256248B68);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2355C8F94();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_2355A71D8(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void (*v25)(uint64_t, unint64_t);
  uint64_t v26;
  unint64_t v27;
  uint64_t v29[2];
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;

  sub_2355C83C4();
  swift_allocObject();
  sub_2355C83B8();
  v30 = *(_QWORD *)&a3;
  v31 = a4;
  v32 = a5;
  v33 = a6;
  v34 = a7;
  sub_2355A7DAC();
  v13 = sub_2355C83AC();
  v15 = v14;
  swift_release();
  if (qword_256248820 != -1)
    swift_once();
  v16 = sub_2355C85C8();
  __swift_project_value_buffer(v16, (uint64_t)qword_25624C3A0);
  v17 = sub_2355C85B0();
  v18 = sub_2355C9078();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc();
    v20 = swift_slowAlloc();
    v29[0] = v20;
    *(_DWORD *)v19 = 136315394;
    if (qword_256248800 != -1)
      swift_once();
    v21 = qword_2562494A0;
    if (byte_2562494B0 == 1)
    {
      v22 = qword_2562494A8;
      swift_bridgeObjectRetain();
    }
    else
    {
      v30 = 0;
      v31 = -2.68156159e154;
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      sub_23558E07C();
      sub_2355C8F4C();
      sub_2355C8F34();
      swift_bridgeObjectRelease();
      v21 = 0;
      v22 = 0xE000000000000000;
    }
    v30 = sub_23558FF68(v21, v22, v29);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    v30 = *(_QWORD *)&a3;
    v31 = a4;
    v32 = a5;
    v33 = a6;
    v34 = a7;
    v23 = sub_2355C8F10();
    v30 = sub_23558FF68(v23, v24, v29);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235588000, v17, v18, "[%s] Replying bounds %s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7CFC88](v20, -1, -1);
    MEMORY[0x23B7CFC88](v19, -1, -1);
  }

  v25 = *(void (**)(uint64_t, unint64_t))(a1
                                                         + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI14ExportedObject_reply);
  if (!v25)
    return sub_2355A7DF0(v13, v15);
  if (v15 >> 60 == 15)
    v26 = 0;
  else
    v26 = v13;
  if (v15 >> 60 == 15)
    v27 = 0xC000000000000000;
  else
    v27 = v15;
  sub_2355A7E04((uint64_t)v25);
  sub_2355A7E14(v13, v15);
  v25(v26, v27);
  sub_2355A7DF0(v13, v15);
  sub_23558FF58((uint64_t)v25);
  return sub_23558E374(v26, v27);
}

uint64_t sub_2355A7590()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2355A75B4(double a1, double a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6;

  return sub_2355A71D8(*(_QWORD *)(v6 + 16), a1, a2, a3, a4, a5, a6);
}

uint64_t sub_2355A75BC(double *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(double, double, double, double, double, double))(v1 + 16))(*a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
}

Swift::Void __swiftcall ManagedAppCellViewModel.report(viewSize:)(CGSize viewSize)
{
  sub_2355C8610();
}

Swift::Void __swiftcall ManagedAppCellViewModel.report(buttonFrame:)(__C::CGRect buttonFrame)
{
  sub_2355C8610();
}

uint64_t static ManagedAppCellViewModel.color(for:in:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  double v13;
  CGColorRef GenericGray;
  double v15;
  uint64_t v17;

  v4 = sub_2355C870C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2355C8910();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2355C8904();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  sub_2355C8850();
  sub_2355C8CF4();
  v12 = (void *)sub_2355C8D00();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDEB400], v4);
  LOBYTE(a2) = sub_2355C8700();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v13 = 0.0;
  if ((a2 & 1) != 0)
    v13 = 1.0;
  GenericGray = CGColorCreateGenericGray(v13, 1.0);
  AXSSContrastRatioForColor();
  if (v15 >= 3.0)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

    swift_retain();
  }
  else
  {
    a1 = sub_2355C8CE8();

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return a1;
}

uint64_t ManagedAppCellViewModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__name;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562494C0);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__subtitle, v2);
  v4 = v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__iconImageURL;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562494E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__style;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562494F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__offerState;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249510);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = v0 + OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__isInitial;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249528);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t ManagedAppCellViewModel.__deallocating_deinit()
{
  ManagedAppCellViewModel.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2355A798C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2355A1440(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__name, &qword_2562494C0);
}

uint64_t sub_2355A79B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2355A14AC(a1, a2, a3, a4, &qword_2562494C8, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__name, &qword_2562494C0);
}

uint64_t sub_2355A79DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2355A1440(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__subtitle, &qword_2562494C0);
}

uint64_t sub_2355A7A00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2355A14AC(a1, a2, a3, a4, &qword_2562494C8, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__subtitle, &qword_2562494C0);
}

uint64_t sub_2355A7A2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2355A1440(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__iconImageURL, &qword_2562494E0);
}

uint64_t sub_2355A7A50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2355A14AC(a1, a2, a3, a4, &qword_2562494E8, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__iconImageURL, &qword_2562494E0);
}

uint64_t sub_2355A7A7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2355A1440(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__style, &qword_2562494F8);
}

uint64_t sub_2355A7AA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2355A14AC(a1, a2, a3, a4, &qword_256249500, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__style, &qword_2562494F8);
}

uint64_t sub_2355A7ACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2355A1440(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__offerState, &qword_256249510);
}

uint64_t sub_2355A7AF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2355A14AC(a1, a2, a3, a4, &qword_256249518, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__offerState, &qword_256249510);
}

uint64_t sub_2355A7B1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2355A1440(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__isInitial, &qword_256249528);
}

uint64_t sub_2355A7B40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2355A14AC(a1, a2, a3, a4, &qword_256249530, (uint64_t)&OBJC_IVAR____TtC31_ManagedAppDistribution_SwiftUI23ManagedAppCellViewModel__isInitial, &qword_256249528);
}

uint64_t sub_2355A7B6C()
{
  return type metadata accessor for ManagedAppCellViewModel();
}

uint64_t type metadata accessor for ManagedAppCellViewModel()
{
  uint64_t result;

  result = qword_256249688;
  if (!qword_256249688)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2355A7BB0()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  sub_2355A7D68(319, &qword_256249698);
  if (v0 <= 0x3F)
  {
    sub_2355A7D10();
    if (v1 <= 0x3F)
    {
      sub_2355A7D68(319, &qword_2562496A8);
      if (v2 <= 0x3F)
      {
        sub_2355A7D68(319, &qword_2562496B0);
        if (v3 <= 0x3F)
        {
          sub_2355A7D68(319, qword_2562496B8);
          if (v4 <= 0x3F)
            swift_updateClassMetadata2();
        }
      }
    }
  }
}

uint64_t method lookup function for ManagedAppCellViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ManagedAppCellViewModel.__allocating_init(exportedObject:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

void sub_2355A7D10()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2562496A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EA0);
    v0 = sub_2355C8694();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2562496A0);
  }
}

void sub_2355A7D68(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_2355C8694();
    if (!v4)
      atomic_store(v3, a2);
  }
}

unint64_t sub_2355A7DAC()
{
  unint64_t result;

  result = qword_256249788;
  if (!qword_256249788)
  {
    result = MEMORY[0x23B7CFBF8](&protocol conformance descriptor for ManagedAppReply, &type metadata for ManagedAppReply);
    atomic_store(result, &qword_256249788);
  }
  return result;
}

uint64_t sub_2355A7DF0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23558E374(a1, a2);
  return a1;
}

uint64_t sub_2355A7E04(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_2355A7E14(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2355A7E28(a1, a2);
  return a1;
}

uint64_t sub_2355A7E28(uint64_t a1, unint64_t a2)
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

uint64_t sub_2355A7E6C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2355A7EB0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_23558E1F8;
  return sub_2355A57F8(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2355A7F44()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562497A0);
  return sub_2355C900C();
}

uint64_t sub_2355A7F7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562497A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2355A7FCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_2355C8520();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2355A8064(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(sub_2355C8520() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = *(_QWORD *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_2355A82D4;
  return sub_2355A66E0(a1, v6, v7, v8, v9);
}

uint64_t sub_2355A8118()
{
  return sub_2355C900C();
}

uint64_t sub_2355A813C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = sub_2355C84B4();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_2355C8520();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_2355A8204(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(sub_2355C84B4() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = *(_QWORD *)(sub_2355C8520() - 8);
  v8 = (v5 + v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v1 + 16);
  v10 = *(_QWORD *)(v1 + 24);
  v11 = v1 + v8;
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_23558E1F8;
  return sub_2355A3948(a1, v9, v10, v1 + v5, v11);
}

ValueMetadata *type metadata accessor for Style()
{
  return &type metadata for Style;
}

_QWORD *sub_2355A82F0(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256249088);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_2355C870C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    v10 = (_OWORD *)((char *)a1 + v9);
    v11 = (_OWORD *)((char *)a2 + v9);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = a3[8];
    *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
    *(_QWORD *)((char *)a1 + v13) = *(_QWORD *)((char *)a2 + v13);
  }
  return a1;
}

uint64_t sub_2355A83EC(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256249088);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v2 = sub_2355C870C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

_QWORD *sub_2355A8450(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  __int128 v10;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256249088);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_2355C870C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = a3[6];
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
  v8 = (_OWORD *)((char *)a1 + v7);
  v9 = (_OWORD *)((char *)a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v11 = a3[8];
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + v11) = *(_QWORD *)((char *)a2 + v11);
  return a1;
}

_QWORD *sub_2355A8520(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  if (a1 != a2)
  {
    sub_23558E470((uint64_t)a1, &qword_256249088);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256249088);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_2355C870C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
  v7 = a3[6];
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  return a1;
}

char *sub_2355A8628(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  __int128 v11;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249088);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_2355C870C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = *((_OWORD *)v10 + 1);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *((_OWORD *)v9 + 1) = v11;
  v12 = a3[8];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  *(_QWORD *)&a1[v12] = *(_QWORD *)&a2[v12];
  return a1;
}

char *sub_2355A86F4(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  __int128 v11;
  uint64_t v12;

  if (a1 != a2)
  {
    sub_23558E470((uint64_t)a1, &qword_256249088);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249088);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_2355C870C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = *((_OWORD *)v10 + 1);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *((_OWORD *)v9 + 1) = v11;
  v12 = a3[8];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  *(_QWORD *)&a1[v12] = *(_QWORD *)&a2[v12];
  return a1;
}

uint64_t sub_2355A87D8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2355A87E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249068);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 2)
    return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t sub_2355A8874()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2355A8880(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256249068);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  return result;
}

uint64_t type metadata accessor for Style.CapsuleButtonStyle()
{
  uint64_t result;

  result = qword_256249868;
  if (!qword_256249868)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2355A8938()
{
  unint64_t v0;

  sub_2355A89C4();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_2355A89C4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256248E90)
  {
    sub_2355C870C();
    v0 = sub_2355C8718();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256248E90);
  }
}

uint64_t sub_2355A8A18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2355A8A28()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_2355C8CC4();
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD))(v3 + 104))(v2, *MEMORY[0x24BDF3C28]);
  result = MEMORY[0x23B7CF220](v2, 0.949019608, 0.949019608, 0.968627451, 1.0);
  qword_25624C390 = result;
  return result;
}

uint64_t sub_2355A8ABC()
{
  uint64_t v0;
  uint64_t result;

  sub_2355C8CD0();
  v0 = sub_2355C8CDC();
  result = swift_release();
  qword_25624C398 = v0;
  return result;
}

uint64_t sub_2355A8AFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
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
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  char v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t KeyPath;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  __int128 *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _OWORD *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  __int128 v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;

  v116 = a2;
  v117 = a1;
  v3 = sub_2355C8DFC();
  MEMORY[0x24BDAC7A8](v3);
  v115 = (char *)&v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v114 = sub_2355C87F0();
  v113 = *(_QWORD *)(v114 - 8);
  MEMORY[0x24BDAC7A8](v114);
  v112 = (char *)&v84 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562498B0);
  MEMORY[0x24BDAC7A8](v104);
  v111 = (uint64_t)&v84 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562498B8);
  MEMORY[0x24BDAC7A8](v109);
  v85 = (uint64_t)&v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v90 = sub_2355C8A0C();
  v88 = *(_QWORD *)(v90 - 8);
  MEMORY[0x24BDAC7A8](v90);
  v9 = (char *)&v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562498C0);
  MEMORY[0x24BDAC7A8](v89);
  v11 = (char *)&v84 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562498C8);
  v91 = *(_QWORD *)(v92 - 8);
  MEMORY[0x24BDAC7A8](v92);
  v13 = (char *)&v84 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562498D0);
  MEMORY[0x24BDAC7A8](v87);
  v15 = (char *)&v84 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562498D8);
  MEMORY[0x24BDAC7A8](v96);
  v98 = (uint64_t)&v84 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562498E0);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v95 = (char *)&v84 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v99 = (uint64_t)&v84 - v20;
  v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562498E8);
  MEMORY[0x24BDAC7A8](v94);
  v101 = (char *)&v84 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562498F0);
  MEMORY[0x24BDAC7A8](v97);
  v102 = (uint64_t)&v84 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562498F8);
  MEMORY[0x24BDAC7A8](v100);
  v106 = (char *)&v84 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249900);
  MEMORY[0x24BDAC7A8](v103);
  v110 = (uint64_t)&v84 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249908);
  MEMORY[0x24BDAC7A8](v107);
  v108 = (uint64_t)&v84 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_2355C870C();
  v27 = *(_QWORD *)(v26 - 8);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v84 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v84 - v31;
  v33 = type metadata accessor for Style.CapsuleButtonStyle();
  v86 = *(int *)(v33 + 20);
  v34 = *(_BYTE *)(v2 + v86) == 1;
  v105 = v2;
  if (v34)
  {
    v35 = (uint64_t)v15;
    v93 = sub_2355C8CB8();
  }
  else
  {
    sub_23559D9BC((uint64_t)v32);
    (*(void (**)(char *, _QWORD, uint64_t))(v27 + 104))(v30, *MEMORY[0x24BDEB400], v26);
    v36 = sub_2355C8700();
    v37 = *(void (**)(char *, uint64_t))(v27 + 8);
    v37(v30, v26);
    v37(v32, v26);
    v35 = (uint64_t)v15;
    if ((v36 & 1) != 0)
    {
      if (qword_256248808 != -1)
        swift_once();
      v38 = qword_25624C390;
    }
    else
    {
      if (qword_256248810 != -1)
        swift_once();
      v38 = qword_25624C398;
    }
    v93 = v38;
    swift_retain();
  }
  sub_2355C8A18();
  v39 = sub_2355C8B08();
  KeyPath = swift_getKeyPath();
  v41 = v88;
  v42 = v90;
  (*(void (**)(char *, char *, _QWORD))(v88 + 16))(v11, v9, v90);
  v43 = (uint64_t *)&v11[*(int *)(v89 + 36)];
  *v43 = KeyPath;
  v43[1] = v39;
  (*(void (**)(char *, uint64_t))(v41 + 8))(v9, v42);
  sub_2355C8B2C();
  sub_2355A97A8();
  sub_2355C8BF8();
  sub_23558E470((uint64_t)v11, &qword_2562498C0);
  v44 = v105;
  v45 = (__int128 *)(v105 + *(int *)(v33 + 24));
  v90 = *v45;
  v46 = *((_QWORD *)v45 + 2);
  v47 = *((_QWORD *)v45 + 3);
  LOBYTE(v39) = sub_2355C8AD8();
  v48 = v91;
  v49 = v92;
  (*(void (**)(uint64_t, char *, uint64_t))(v91 + 16))(v35, v13, v92);
  v50 = v35 + *(int *)(v87 + 36);
  *(_BYTE *)v50 = v39;
  *(_OWORD *)(v50 + 8) = v90;
  *(_QWORD *)(v50 + 24) = v46;
  *(_QWORD *)(v50 + 32) = v47;
  *(_BYTE *)(v50 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v48 + 8))(v13, v49);
  sub_2355C8E14();
  sub_2355C8838();
  v51 = v98;
  sub_2355986BC(v35, v98, &qword_2562498D0);
  v52 = (_OWORD *)(v51 + *(int *)(v96 + 36));
  v53 = v123;
  v52[4] = v122;
  v52[5] = v53;
  v52[6] = v124;
  v54 = v119;
  *v52 = v118;
  v52[1] = v54;
  v55 = v121;
  v52[2] = v120;
  v52[3] = v55;
  sub_23558E470(v35, &qword_2562498D0);
  if ((*(_BYTE *)(v44 + v86) & 1) != 0)
  {
    v56 = sub_2355C8CD0();
    v57 = v85;
    sub_2355986BC(v51, v85, &qword_2562498D8);
    *(_QWORD *)(v57 + *(int *)(v109 + 36)) = v56;
    sub_2355986BC(v57, v111, &qword_2562498B8);
    swift_storeEnumTagMultiPayload();
    sub_2355A9874();
    sub_23559FC60(&qword_256249928, &qword_2562498D8, (uint64_t (*)(void))sub_2355A9918, MEMORY[0x24BDEDBB8]);
    v58 = (uint64_t)v95;
    sub_2355C89C4();
    sub_23558E470(v57, &qword_2562498B8);
  }
  else
  {
    sub_2355986BC(v51, v111, &qword_2562498D8);
    swift_storeEnumTagMultiPayload();
    sub_2355A9874();
    sub_23559FC60(&qword_256249928, &qword_2562498D8, (uint64_t (*)(void))sub_2355A9918, MEMORY[0x24BDEDBB8]);
    v58 = (uint64_t)v95;
    sub_2355C89C4();
  }
  v59 = v99;
  sub_235598700(v58, v99, &qword_2562498E0);
  sub_23558E470(v51, &qword_2562498D8);
  v60 = v112;
  sub_2355C87E4();
  v61 = (uint64_t)v101;
  v62 = v113;
  v63 = v114;
  (*(void (**)(char *, char *, uint64_t))(v113 + 16))(&v101[*(int *)(v94 + 36)], v60, v114);
  sub_2355986BC(v59, v61, &qword_2562498E0);
  (*(void (**)(char *, uint64_t))(v62 + 8))(v60, v63);
  sub_23558E470(v59, &qword_2562498E0);
  v64 = sub_2355C8AD8();
  v65 = v102;
  sub_2355986BC(v61, v102, &qword_2562498E8);
  v66 = v65 + *(int *)(v97 + 36);
  *(_QWORD *)v66 = v93;
  *(_BYTE *)(v66 + 8) = v64;
  swift_retain();
  sub_23558E470(v61, &qword_2562498E8);
  v67 = *MEMORY[0x24BDEEB68];
  v68 = sub_2355C8964();
  v69 = (uint64_t)v115;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v68 - 8) + 104))(v115, v67, v68);
  v70 = (uint64_t)v106;
  v71 = (uint64_t)&v106[*(int *)(v100 + 36)];
  sub_2355A99AC(v69, v71);
  *(_WORD *)(v71 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256249948) + 36)) = 256;
  sub_2355986BC(v65, v70, &qword_2562498F0);
  sub_2355A99F0(v69);
  sub_23558E470(v65, &qword_2562498F0);
  if ((sub_2355C8A24() & 1) != 0)
    v72 = 0.8;
  else
    v72 = 1.0;
  sub_2355C8E80();
  v74 = v73;
  v76 = v75;
  v77 = v110;
  sub_2355986BC(v70, v110, &qword_2562498F8);
  v78 = v77 + *(int *)(v103 + 36);
  *(double *)v78 = v72;
  *(double *)(v78 + 8) = v72;
  *(_QWORD *)(v78 + 16) = v74;
  *(_QWORD *)(v78 + 24) = v76;
  sub_23558E470(v70, &qword_2562498F8);
  v79 = sub_2355C8E44();
  v80 = sub_2355C8A24();
  swift_release();
  v81 = v108;
  sub_2355986BC(v77, v108, &qword_256249900);
  v82 = v81 + *(int *)(v107 + 36);
  *(_QWORD *)v82 = v79;
  *(_BYTE *)(v82 + 8) = v80 & 1;
  sub_23558E470(v77, &qword_256249900);
  return sub_235598700(v81, v116, &qword_256249908);
}

uint64_t sub_2355A9708@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2355C88A4();
  *a1 = result;
  return result;
}

uint64_t sub_2355A9730@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2355C88A4();
  *a1 = result;
  return result;
}

uint64_t sub_2355A9758()
{
  swift_retain();
  return sub_2355C88B0();
}

uint64_t sub_2355A9780()
{
  swift_retain();
  return sub_2355C88B0();
}

unint64_t sub_2355A97A8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249910;
  if (!qword_256249910)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2562498C0);
    v2[0] = sub_2355A982C();
    v2[1] = sub_23559867C(&qword_256248F88, &qword_256248F90, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249910);
  }
  return result;
}

unint64_t sub_2355A982C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256249918;
  if (!qword_256249918)
  {
    v1 = sub_2355C8A0C();
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF0438], v1);
    atomic_store(result, (unint64_t *)&qword_256249918);
  }
  return result;
}

unint64_t sub_2355A9874()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249920;
  if (!qword_256249920)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2562498B8);
    v2[0] = sub_23559FC60(&qword_256249928, &qword_2562498D8, (uint64_t (*)(void))sub_2355A9918, MEMORY[0x24BDEDBB8]);
    v2[1] = sub_23559867C(&qword_256249938, &qword_256249940, MEMORY[0x24BDF0710]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249920);
  }
  return result;
}

unint64_t sub_2355A9918()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_256249930;
  if (!qword_256249930)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2562498D0);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2562498C0);
    v2[3] = sub_2355A97A8();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249930);
  }
  return result;
}

uint64_t sub_2355A99AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2355C8DFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2355A99F0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2355C8DFC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2355A9A30()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249950;
  if (!qword_256249950)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249908);
    v2[0] = sub_23559FC60(&qword_256249958, &qword_256249900, (uint64_t (*)(void))sub_2355A9AD4, MEMORY[0x24BDEBF50]);
    v2[1] = sub_23559867C(&qword_2562499A8, &qword_2562499B0, MEMORY[0x24BDEEC10]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249950);
  }
  return result;
}

unint64_t sub_2355A9AD4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249960;
  if (!qword_256249960)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2562498F8);
    v2[0] = sub_2355A9B58();
    v2[1] = sub_23559867C(&qword_2562499A0, &qword_256249948, MEMORY[0x24BDEB950]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249960);
  }
  return result;
}

unint64_t sub_2355A9B58()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249968;
  if (!qword_256249968)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2562498F0);
    v2[0] = sub_2355A9BDC();
    v2[1] = sub_23559867C(&qword_256249990, &qword_256249998, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249968);
  }
  return result;
}

unint64_t sub_2355A9BDC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249970;
  if (!qword_256249970)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2562498E8);
    v2[0] = sub_2355A9C60();
    v2[1] = sub_23559867C(&qword_256249980, &qword_256249988, MEMORY[0x24BDF0710]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249970);
  }
  return result;
}

unint64_t sub_2355A9C60()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249978;
  if (!qword_256249978)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2562498E0);
    v2[0] = sub_2355A9874();
    v2[1] = sub_23559FC60(&qword_256249928, &qword_2562498D8, (uint64_t (*)(void))sub_2355A9918, MEMORY[0x24BDEDBB8]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249978);
  }
  return result;
}

void static ManagedContentStyle.automatic.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

void static ManagedContentStyle.compact.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void static ManagedContentStyle.header.getter(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

_ManagedAppDistribution_SwiftUI::ManagedContentStyle::Style_optional __swiftcall ManagedContentStyle.Style.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 4;
  if ((unint64_t)rawValue < 4)
    v2 = rawValue;
  *v1 = v2;
  return (_ManagedAppDistribution_SwiftUI::ManagedContentStyle::Style_optional)rawValue;
}

uint64_t ManagedContentStyle.Style.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_2355A9D28(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_2355A9D40()
{
  unint64_t result;

  result = qword_2562499B8;
  if (!qword_2562499B8)
  {
    result = MEMORY[0x23B7CFBF8](&protocol conformance descriptor for ManagedContentStyle.Style, &type metadata for ManagedContentStyle.Style);
    atomic_store(result, (unint64_t *)&qword_2562499B8);
  }
  return result;
}

uint64_t sub_2355A9D84()
{
  sub_2355C927C();
  sub_2355C9288();
  return sub_2355C92AC();
}

uint64_t sub_2355A9DC8()
{
  return sub_2355C9288();
}

uint64_t sub_2355A9DF0()
{
  sub_2355C927C();
  sub_2355C9288();
  return sub_2355C92AC();
}

_ManagedAppDistribution_SwiftUI::ManagedContentStyle::Style_optional sub_2355A9E30(Swift::Int *a1)
{
  return ManagedContentStyle.Style.init(rawValue:)(*a1);
}

void sub_2355A9E38(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_2355A9E44()
{
  sub_2355AA07C();
  return sub_2355C8F88();
}

uint64_t sub_2355A9EA0()
{
  sub_2355AA07C();
  return sub_2355C8F7C();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for ManagedContentStyle()
{
  return &type metadata for ManagedContentStyle;
}

uint64_t _s31_ManagedAppDistribution_SwiftUI19ManagedContentStyleV5StyleOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s31_ManagedAppDistribution_SwiftUI19ManagedContentStyleV5StyleOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2355A9FEC + 4 * byte_2355CA925[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2355AA020 + 4 * byte_2355CA920[v4]))();
}

uint64_t sub_2355AA020(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2355AA028(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2355AA030);
  return result;
}

uint64_t sub_2355AA03C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2355AA044);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2355AA048(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2355AA050(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2355AA05C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2355AA064(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ManagedContentStyle.Style()
{
  return &type metadata for ManagedContentStyle.Style;
}

unint64_t sub_2355AA07C()
{
  unint64_t result;

  result = qword_2562499C0;
  if (!qword_2562499C0)
  {
    result = MEMORY[0x23B7CFBF8](&protocol conformance descriptor for ManagedContentStyle.Style, &type metadata for ManagedContentStyle.Style);
    atomic_store(result, (unint64_t *)&qword_2562499C0);
  }
  return result;
}

uint64_t ManagedContentOfferState.init(appState:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  int v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  int v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  char v22;
  int v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  int v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  uint64_t v28;

  v4 = sub_2355C84A8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v28 - v9;
  v11 = sub_2355C84B4();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  v15 = (*(uint64_t (**)(char *, uint64_t))(v12 + 88))(v14, v11);
  if (v15 != *MEMORY[0x24BDDAC18])
  {
    v23 = v15;
    if (v15 == *MEMORY[0x24BDDABC8])
    {
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
      (*(void (**)(char *, uint64_t))(v12 + 96))(v14, v11);
      v20 = *(_QWORD *)(*(_QWORD *)v14 + 16);
      result = swift_release();
      v21 = 0;
      v22 = 0;
      goto LABEL_21;
    }
    if (v15 == *MEMORY[0x24BDDAC00])
    {
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
      (*(void (**)(char *, uint64_t))(v12 + 96))(v14, v11);
      result = swift_release();
    }
    else
    {
      if (v15 == *MEMORY[0x24BDDAC20])
      {
        result = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
        v21 = 0;
        v22 = 2;
        v20 = 4;
        goto LABEL_21;
      }
      if (v15 == *MEMORY[0x24BDDAC08])
      {
        result = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
        v21 = 0;
        v20 = 2;
        v22 = 2;
        goto LABEL_21;
      }
      v26 = *MEMORY[0x24BDDAC10];
      v27 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8);
      result = v27(a1, v11);
      if (v23 != v26)
      {
        result = v27((uint64_t)v14, v11);
        goto LABEL_20;
      }
    }
    v20 = 0;
    v22 = 0;
    v21 = 1;
    goto LABEL_21;
  }
  (*(void (**)(char *, uint64_t))(v12 + 96))(v14, v11);
  v16 = swift_projectBox();
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v17(v10, v16, v4);
  v17(v8, (uint64_t)v10, v4);
  v18 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v8, v4);
  if (v18 != *MEMORY[0x24BDDABF0])
  {
    if (v18 == *MEMORY[0x24BDDABE0])
    {
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      result = swift_release();
      v21 = 0;
      v22 = 2;
      v20 = 1;
      goto LABEL_21;
    }
    if (v18 == *MEMORY[0x24BDDABE8])
    {
      v20 = sub_2355AAE1C();
      v21 = v24;
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      result = swift_release();
      v22 = 1;
      goto LABEL_21;
    }
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
    v25 = *(void (**)(char *, uint64_t))(v5 + 8);
    v25(v10, v4);
    v25(v8, v4);
    result = swift_release();
LABEL_20:
    v21 = 0;
    v22 = 2;
    v20 = 3;
    goto LABEL_21;
  }
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  result = swift_release();
  v20 = 0;
  v21 = 0;
  v22 = 2;
LABEL_21:
  *(_QWORD *)a2 = v20;
  *(_QWORD *)(a2 + 8) = v21;
  *(_BYTE *)(a2 + 16) = v22;
  return result;
}

void static ManagedContentOfferState.neverInstalled.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 2;
}

double static ManagedContentOfferState.notInstalled.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 1;
  *(_OWORD *)a1 = xmmword_2355CAA50;
  *(_BYTE *)(a1 + 16) = 2;
  return result;
}

double static ManagedContentOfferState.installed.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 2;
  *(_OWORD *)a1 = xmmword_2355CAA60;
  *(_BYTE *)(a1 + 16) = 2;
  return result;
}

double static ManagedContentOfferState.noninteractive.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 3;
  *(_OWORD *)a1 = xmmword_2355CA560;
  *(_BYTE *)(a1 + 16) = 2;
  return result;
}

uint64_t static ManagedContentOfferState.installing(progress:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = a2 & 1;
  *(_BYTE *)(a3 + 16) = 0;
  return result;
}

uint64_t static ManagedContentOfferState.custom(title:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = a1;
  *(_QWORD *)(a3 + 8) = a2;
  *(_BYTE *)(a3 + 16) = 1;
  return swift_bridgeObjectRetain();
}

uint64_t ManagedContentOfferState.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  if (*(_BYTE *)(v0 + 16))
  {
    if (*(_BYTE *)(v0 + 16) != 1)
      __asm { BR              X9 }
    sub_2355C9288();
    return sub_2355C8F1C();
  }
  else
  {
    sub_2355C9288();
    if ((v1 & 1) != 0)
    {
      return sub_2355C9294();
    }
    else
    {
      sub_2355C9294();
      return sub_2355C92A0();
    }
  }
}

uint64_t static ManagedContentOfferState.== infix(_:_:)(__int128 *a1, __int128 *a2)
{
  char v2;
  char v3;
  __int128 v5;
  char v6;
  __int128 v7;
  char v8;

  v2 = *((_BYTE *)a1 + 16);
  v3 = *((_BYTE *)a2 + 16);
  v7 = *a1;
  v8 = v2;
  v5 = *a2;
  v6 = v3;
  return _s31_ManagedAppDistribution_SwiftUI0A17ContentOfferStateV0G0O2eeoiySbAE_AEtFZ_0((uint64_t)&v7, (uint64_t)&v5) & 1;
}

uint64_t ManagedContentOfferState.hashValue.getter()
{
  sub_2355C927C();
  ManagedContentOfferState.Offer.hash(into:)();
  return sub_2355C92AC();
}

uint64_t sub_2355AA688()
{
  sub_2355C927C();
  ManagedContentOfferState.Offer.hash(into:)();
  return sub_2355C92AC();
}

uint64_t sub_2355AA6E4()
{
  sub_2355C927C();
  ManagedContentOfferState.Offer.hash(into:)();
  return sub_2355C92AC();
}

uint64_t sub_2355AA738(__int128 *a1, __int128 *a2)
{
  char v2;
  char v3;
  __int128 v5;
  char v6;
  __int128 v7;
  char v8;

  v2 = *((_BYTE *)a1 + 16);
  v3 = *((_BYTE *)a2 + 16);
  v7 = *a1;
  v8 = v2;
  v5 = *a2;
  v6 = v3;
  return _s31_ManagedAppDistribution_SwiftUI0A17ContentOfferStateV0G0O2eeoiySbAE_AEtFZ_0((uint64_t)&v7, (uint64_t)&v5) & 1;
}

uint64_t ManagedContentOfferState.Offer.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  if (*(_BYTE *)(v0 + 16))
  {
    if (*(_BYTE *)(v0 + 16) != 1)
      __asm { BR              X9 }
    sub_2355C9288();
    return sub_2355C8F1C();
  }
  else
  {
    sub_2355C9288();
    if ((v1 & 1) != 0)
    {
      return sub_2355C9294();
    }
    else
    {
      sub_2355C9294();
      return sub_2355C92A0();
    }
  }
}

uint64_t ManagedContentOfferState.Offer.hashValue.getter()
{
  sub_2355C927C();
  ManagedContentOfferState.Offer.hash(into:)();
  return sub_2355C92AC();
}

uint64_t sub_2355AA8A0()
{
  sub_2355C927C();
  ManagedContentOfferState.Offer.hash(into:)();
  return sub_2355C92AC();
}

uint64_t sub_2355AA8F4()
{
  sub_2355C927C();
  ManagedContentOfferState.Offer.hash(into:)();
  return sub_2355C92AC();
}

uint64_t _s31_ManagedAppDistribution_SwiftUI0A17ContentOfferStateV0G0O2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char v9;

  v2 = *(uint64_t *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(unsigned __int8 *)(a1 + 16);
  v5 = *(uint64_t *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(unsigned __int8 *)(a2 + 16);
  if (!*(_BYTE *)(a1 + 16))
  {
    if (!*(_BYTE *)(a2 + 16))
    {
      sub_23558A9F8(*(_QWORD *)a1, v3, 0);
      sub_23558A9F8(v5, v6, 0);
      if ((v3 & 1) != 0)
      {
        if ((v6 & 1) == 0)
          goto LABEL_19;
      }
      else if ((v6 & 1) != 0 || *(double *)&v2 != *(double *)&v5)
      {
        goto LABEL_19;
      }
      v9 = 1;
      return v9 & 1;
    }
LABEL_18:
    sub_235591504(v5, v6, v7);
    sub_23558A9F8(v2, v3, v4);
    sub_23558A9F8(v5, v6, v7);
LABEL_19:
    v9 = 0;
    return v9 & 1;
  }
  if (v4 != 1)
    __asm { BR              X9 }
  if (v7 != 1)
  {
    swift_bridgeObjectRetain();
    goto LABEL_18;
  }
  if (v2 == v5 && v3 == v6)
    v9 = 1;
  else
    v9 = sub_2355C9234();
  sub_235591504(v5, v6, 1);
  sub_235591504(v2, v3, 1);
  sub_23558A9F8(v2, v3, 1);
  sub_23558A9F8(v5, v6, 1);
  return v9 & 1;
}

unint64_t sub_2355AAB98()
{
  unint64_t result;

  result = qword_2562499C8;
  if (!qword_2562499C8)
  {
    result = MEMORY[0x23B7CFBF8](&protocol conformance descriptor for ManagedContentOfferState, &type metadata for ManagedContentOfferState);
    atomic_store(result, (unint64_t *)&qword_2562499C8);
  }
  return result;
}

unint64_t sub_2355AABE0()
{
  unint64_t result;

  result = qword_2562499D0;
  if (!qword_2562499D0)
  {
    result = MEMORY[0x23B7CFBF8](&protocol conformance descriptor for ManagedContentOfferState.Offer, &type metadata for ManagedContentOfferState.Offer);
    atomic_store(result, (unint64_t *)&qword_2562499D0);
  }
  return result;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for ManagedContentOfferState()
{
  return &type metadata for ManagedContentOfferState;
}

uint64_t destroy for ManagedContentOfferState.Offer(uint64_t a1)
{
  return sub_23558A9F8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s31_ManagedAppDistribution_SwiftUI24ManagedContentOfferStateVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_235591504(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s31_ManagedAppDistribution_SwiftUI24ManagedContentOfferStateVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_235591504(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_23558A9F8(v6, v7, v8);
  return a1;
}

uint64_t _s31_ManagedAppDistribution_SwiftUI24ManagedContentOfferStateVwta_0(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_23558A9F8(v4, v5, v6);
  return a1;
}

uint64_t _s31_ManagedAppDistribution_SwiftUI24ManagedContentOfferStateVwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s31_ManagedAppDistribution_SwiftUI24ManagedContentOfferStateVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_2355AADD8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_2355AADF0(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ManagedContentOfferState.Offer()
{
  return &type metadata for ManagedContentOfferState.Offer;
}

uint64_t sub_2355AAE1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v10;

  v0 = sub_2355C8400();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2355C83E8();
  v4 = objc_allocWithZone(MEMORY[0x24BDD1488]);
  v5 = (void *)sub_2355C83F4();
  v6 = objc_msgSend(v4, sel_initWithURL_, v5);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = sub_2355C83D0();

  return v8;
}

BOOL sub_2355AAF78(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2355AAF98()
{
  _BYTE *v0;

  if (*v0)
    return 0x656C797473;
  else
    return 0x4449707061;
}

uint64_t sub_2355AAFC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2355ABE64(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2355AAFE8()
{
  return 0;
}

void sub_2355AAFF4(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2355AB000()
{
  sub_2355AB1BC();
  return sub_2355C92E8();
}

uint64_t sub_2355AB028()
{
  sub_2355AB1BC();
  return sub_2355C92F4();
}

uint64_t ManagedAppViewConfiguration.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char v11;
  char v12;
  char v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562499D8);
  v9 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(unsigned __int8 *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2355AB1BC();
  sub_2355C92DC();
  v13 = 0;
  sub_2355C9210();
  if (!v2)
  {
    v12 = v10;
    v11 = 1;
    sub_2355AB200();
    sub_2355C921C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v6, v4);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2355AB1BC()
{
  unint64_t result;

  result = qword_2562499E0;
  if (!qword_2562499E0)
  {
    result = MEMORY[0x23B7CFBF8](&unk_2355CAE48, &type metadata for ManagedAppViewConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2562499E0);
  }
  return result;
}

unint64_t sub_2355AB200()
{
  unint64_t result;

  result = qword_2562499E8;
  if (!qword_2562499E8)
  {
    result = MEMORY[0x23B7CFBF8](&protocol conformance descriptor for ManagedContentStyle.Style, &type metadata for ManagedContentStyle.Style);
    atomic_store(result, (unint64_t *)&qword_2562499E8);
  }
  return result;
}

uint64_t ManagedAppViewConfiguration.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v14;
  char v15;
  char v16;
  char v17;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562499F0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2355AB1BC();
  sub_2355C92C4();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v17 = 0;
  v9 = sub_2355C91F8();
  v11 = v10;
  v15 = 1;
  sub_2355AB3E4();
  swift_bridgeObjectRetain();
  sub_2355C9204();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v12 = v16;
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  *(_BYTE *)(a2 + 16) = v12;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_2355AB3E4()
{
  unint64_t result;

  result = qword_2562499F8;
  if (!qword_2562499F8)
  {
    result = MEMORY[0x23B7CFBF8](&protocol conformance descriptor for ManagedContentStyle.Style, &type metadata for ManagedContentStyle.Style);
    atomic_store(result, (unint64_t *)&qword_2562499F8);
  }
  return result;
}

uint64_t sub_2355AB428@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ManagedAppViewConfiguration.init(from:)(a1, a2);
}

uint64_t sub_2355AB43C(_QWORD *a1)
{
  return ManagedAppViewConfiguration.encode(to:)(a1);
}

uint64_t sub_2355AB450()
{
  _BYTE *v0;

  if (*v0)
    return 0x617246726566666FLL;
  else
    return 0x6769654877656976;
}

uint64_t sub_2355AB490@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2355ABF44(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2355AB4B4()
{
  sub_2355AB67C();
  return sub_2355C92E8();
}

uint64_t sub_2355AB4DC()
{
  sub_2355AB67C();
  return sub_2355C92F4();
}

uint64_t ManagedAppReply.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];
  char v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249A00);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v8 = v1[1];
  v10 = v1[2];
  v11 = v1[3];
  v12 = v1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2355AB67C();
  sub_2355C92DC();
  v14[0] = v9;
  v15 = 0;
  sub_2355AB6C0();
  sub_2355C921C();
  if (!v2)
  {
    v14[0] = v8;
    v14[1] = v10;
    v14[2] = v11;
    v14[3] = v12;
    v15 = 1;
    type metadata accessor for CGRect(0);
    sub_2355AB8EC(&qword_256249A18, MEMORY[0x24BDBD828]);
    sub_2355C921C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_2355AB67C()
{
  unint64_t result;

  result = qword_256249A08;
  if (!qword_256249A08)
  {
    result = MEMORY[0x23B7CFBF8](&unk_2355CADF8, &type metadata for ManagedAppReply.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256249A08);
  }
  return result;
}

unint64_t sub_2355AB6C0()
{
  unint64_t result;

  result = qword_256249A10;
  if (!qword_256249A10)
  {
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BEE50C0], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_256249A10);
  }
  return result;
}

uint64_t ManagedAppReply.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _OWORD v13[2];
  char v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249A20);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2355AB67C();
  sub_2355C92C4();
  if (!v2)
  {
    v14 = 0;
    sub_2355AB8A8();
    sub_2355C9204();
    v9 = *(_QWORD *)&v13[0];
    type metadata accessor for CGRect(0);
    v14 = 1;
    sub_2355AB8EC(&qword_256249A30, MEMORY[0x24BDBD838]);
    sub_2355C9204();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v10 = v13[0];
    v11 = v13[1];
    *(_QWORD *)a2 = v9;
    *(_OWORD *)(a2 + 8) = v10;
    *(_OWORD *)(a2 + 24) = v11;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

unint64_t sub_2355AB8A8()
{
  unint64_t result;

  result = qword_256249A28;
  if (!qword_256249A28)
  {
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BEE50E8], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_256249A28);
  }
  return result;
}

uint64_t sub_2355AB8EC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CGRect(255);
    result = MEMORY[0x23B7CFBF8](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2355AB92C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ManagedAppReply.init(from:)(a1, a2);
}

uint64_t sub_2355AB940(_QWORD *a1)
{
  return ManagedAppReply.encode(to:)(a1);
}

uint64_t destroy for ManagedAppViewConfiguration()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s31_ManagedAppDistribution_SwiftUI27ManagedAppViewConfigurationVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ManagedAppViewConfiguration(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for ManagedAppViewConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for ManagedAppViewConfiguration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ManagedAppViewConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
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
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ManagedAppViewConfiguration()
{
  return &type metadata for ManagedAppViewConfiguration;
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

uint64_t getEnumTagSinglePayload for ManagedAppReply(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ManagedAppReply(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
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
  *(_BYTE *)(result + 40) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ManagedAppReply()
{
  return &type metadata for ManagedAppReply;
}

ValueMetadata *type metadata accessor for ManagedAppReply.CodingKeys()
{
  return &type metadata for ManagedAppReply.CodingKeys;
}

uint64_t getEnumTagSinglePayload for LogKey.Prefix(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s31_ManagedAppDistribution_SwiftUI15ManagedAppReplyV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2355ABC28 + 4 * byte_2355CABA5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2355ABC5C + 4 * byte_2355CABA0[v4]))();
}

uint64_t sub_2355ABC5C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2355ABC64(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2355ABC6CLL);
  return result;
}

uint64_t sub_2355ABC78(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2355ABC80);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2355ABC84(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2355ABC8C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2355ABC98(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ManagedAppViewConfiguration.CodingKeys()
{
  return &type metadata for ManagedAppViewConfiguration.CodingKeys;
}

unint64_t sub_2355ABCB8()
{
  unint64_t result;

  result = qword_256249A38;
  if (!qword_256249A38)
  {
    result = MEMORY[0x23B7CFBF8](&unk_2355CAD18, &type metadata for ManagedAppViewConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256249A38);
  }
  return result;
}

unint64_t sub_2355ABD00()
{
  unint64_t result;

  result = qword_256249A40;
  if (!qword_256249A40)
  {
    result = MEMORY[0x23B7CFBF8](&unk_2355CADD0, &type metadata for ManagedAppReply.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256249A40);
  }
  return result;
}

unint64_t sub_2355ABD48()
{
  unint64_t result;

  result = qword_256249A48;
  if (!qword_256249A48)
  {
    result = MEMORY[0x23B7CFBF8](&unk_2355CAD40, &type metadata for ManagedAppReply.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256249A48);
  }
  return result;
}

unint64_t sub_2355ABD90()
{
  unint64_t result;

  result = qword_256249A50;
  if (!qword_256249A50)
  {
    result = MEMORY[0x23B7CFBF8](&unk_2355CAD68, &type metadata for ManagedAppReply.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256249A50);
  }
  return result;
}

unint64_t sub_2355ABDD8()
{
  unint64_t result;

  result = qword_256249A58;
  if (!qword_256249A58)
  {
    result = MEMORY[0x23B7CFBF8](&unk_2355CAC88, &type metadata for ManagedAppViewConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256249A58);
  }
  return result;
}

unint64_t sub_2355ABE20()
{
  unint64_t result;

  result = qword_256249A60[0];
  if (!qword_256249A60[0])
  {
    result = MEMORY[0x23B7CFBF8](&unk_2355CACB0, &type metadata for ManagedAppViewConfiguration.CodingKeys);
    atomic_store(result, qword_256249A60);
  }
  return result;
}

uint64_t sub_2355ABE64(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x4449707061 && a2 == 0xE500000000000000;
  if (v2 || (sub_2355C9234() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C797473 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2355C9234();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2355ABF44(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0x6769654877656976 && a2 == 0xEA00000000007468 || (sub_2355C9234() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x617246726566666FLL && a2 == 0xEA0000000000656DLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_2355C9234();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2355AC058()
{
  return swift_allocateGenericValueMetadata();
}

void sub_2355AC060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  type metadata accessor for ManagedAppCellContext(319, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a4);
  if (v4 <= 0x3F)
  {
    sub_235593DE4(319, (unint64_t *)&qword_256248E90, (void (*)(uint64_t))MEMORY[0x24BDEB418]);
    if (v5 <= 0x3F)
    {
      sub_235593D8C();
      if (v6 <= 0x3F)
      {
        sub_235593DE4(319, (unint64_t *)&qword_256248EA8, (void (*)(uint64_t))MEMORY[0x24BDEEEA0]);
        if (v7 <= 0x3F)
        {
          sub_235593E30();
          if (v8 <= 0x3F)
            swift_initStructMetadata();
        }
      }
    }
  }
}

_QWORD *sub_2355AC164(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unsigned int v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  __int128 v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  __int128 v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  _QWORD *v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  _QWORD *v73;
  _QWORD *v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  _QWORD *v79;
  _QWORD *v80;
  unsigned int v81;
  uint64_t v82;
  char v83;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  size_t __n;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = sub_2355C870C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_DWORD *)(v8 + 80);
  v95 = v8;
  v96 = v7;
  v10 = *(_QWORD *)(v8 + 64);
  if (v10 <= 8)
    v10 = 8;
  v100 = v10;
  v99 = sub_2355C8400();
  v11 = *(_QWORD *)(v99 - 8);
  v12 = *(_DWORD *)(v11 + 80);
  if (*(_DWORD *)(v11 + 84))
    v13 = *(_QWORD *)(v11 + 64);
  else
    v13 = *(_QWORD *)(v11 + 64) + 1;
  __n = v13;
  if (v13 <= 8)
    v13 = 8;
  v101 = v13;
  v14 = sub_2355C8994();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_DWORD *)(v15 + 80);
  v97 = v15;
  v98 = v14;
  v17 = *(_QWORD *)(v15 + 64);
  if (v17 <= 8)
    v17 = 8;
  v102 = v17;
  v18 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(_DWORD *)(v19 + 80);
  v21 = v12 | v9 | v16 | *(_DWORD *)(v5 + 80);
  v22 = v21 & 0xF8 | v20;
  if (v22 > 7
    || ((v21 | *(_DWORD *)(v19 + 80)) & 0x100000) != 0
    || (v23 = (((((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
             + 63) & 0xFFFFFFFFFFFFFFF8,
        v24 = v9 & 0xF8,
        v25 = ~v24 & 0xFFFFFFFFFFFFFFF8,
        v26 = v24 + 16,
        v27 = v12 & 0xF8 | 7,
        v28 = v16 & 0xF8 | 7,
        ((v102
        + v20
        + 1
        + ((v101 + v28 + 1 + ((v100 + v27 + 1 + ((v24 + 16 + ((v23 + 23) & 0xFFFFFFFFFFFFFFF8)) & v25)) & ~v27)) & ~v28)) & ~v20)
      + *(_QWORD *)(v19 + 64) > 0x18))
  {
    v40 = *a2;
    *a1 = *a2;
    v41 = v40 + (((v22 | 7) + 16) & ~(unint64_t)(v22 | 7));
    swift_retain();
  }
  else
  {
    v86 = v12 & 0xF8 | 7;
    v87 = v100 + v27 + 1;
    v88 = v16 & 0xF8 | 7;
    v89 = v101 + v28 + 1;
    v90 = v102 + v20 + 1;
    v91 = *(_DWORD *)(v19 + 80);
    v92 = *(_QWORD *)(v18 - 8);
    v93 = v18;
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v5 + 16))(a1, a2, v4);
    v29 = ((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    v85 = (char *)a2 + 7;
    v30 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    v31 = *(_QWORD *)v30;
    v32 = *(_QWORD *)(v30 + 8);
    v33 = *(_BYTE *)(v30 + 16);
    sub_2355914F4(*(_QWORD *)v30, v32, v33);
    *(_QWORD *)v29 = v31;
    *(_QWORD *)(v29 + 8) = v32;
    *(_BYTE *)(v29 + 16) = v33;
    *(_QWORD *)(v29 + 24) = *(_QWORD *)(v30 + 24);
    v34 = (v29 + 39) & 0xFFFFFFFFFFFFFFF8;
    v35 = (v30 + 39) & 0xFFFFFFFFFFFFFFF8;
    v36 = *(_QWORD *)(v35 + 24);
    swift_bridgeObjectRetain();
    if (v36 < 0xFFFFFFFF)
    {
      v42 = *(_OWORD *)(v35 + 16);
      *(_OWORD *)v34 = *(_OWORD *)v35;
      *(_OWORD *)(v34 + 16) = v42;
    }
    else
    {
      v37 = *(_QWORD *)v35;
      v38 = *(_QWORD *)(v35 + 8);
      v39 = *(_BYTE *)(v35 + 16);
      sub_2355914F4(*(_QWORD *)v35, v38, v39);
      *(_QWORD *)v34 = v37;
      *(_QWORD *)(v34 + 8) = v38;
      *(_BYTE *)(v34 + 16) = v39;
      *(_QWORD *)(v34 + 24) = *(_QWORD *)(v35 + 24);
      swift_bridgeObjectRetain();
    }
    v43 = (v34 + 39) & 0xFFFFFFFFFFFFFFF8;
    v44 = (v35 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)(v44 + 24) < 0xFFFFFFFFuLL)
    {
      v48 = *(_OWORD *)(v44 + 16);
      *(_OWORD *)v43 = *(_OWORD *)v44;
      *(_OWORD *)(v43 + 16) = v48;
    }
    else
    {
      v45 = *(_QWORD *)v44;
      v46 = *(_QWORD *)(v44 + 8);
      v47 = *(_BYTE *)(v44 + 16);
      sub_2355914F4(*(_QWORD *)v44, v46, v47);
      *(_QWORD *)v43 = v45;
      *(_QWORD *)(v43 + 8) = v46;
      *(_BYTE *)(v43 + 16) = v47;
      *(_QWORD *)(v43 + 24) = *(_QWORD *)(v44 + 24);
      swift_bridgeObjectRetain();
    }
    v49 = v23 + 16;
    v50 = (v43 + 39) & 0xFFFFFFFFFFFFFFF8;
    v51 = (v44 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)(v51 + 24) < 0xFFFFFFFFuLL)
    {
      v55 = *(_OWORD *)(v51 + 16);
      *(_OWORD *)v50 = *(_OWORD *)v51;
      *(_OWORD *)(v50 + 16) = v55;
    }
    else
    {
      v52 = *(_QWORD *)v51;
      v53 = *(_QWORD *)(v51 + 8);
      v54 = *(_BYTE *)(v51 + 16);
      sub_2355914F4(*(_QWORD *)v51, v53, v54);
      *(_QWORD *)v50 = v52;
      *(_QWORD *)(v50 + 8) = v53;
      *(_BYTE *)(v50 + 16) = v54;
      *(_QWORD *)(v50 + 24) = *(_QWORD *)(v51 + 24);
      swift_bridgeObjectRetain();
    }
    v56 = (v50 + 39) & 0xFFFFFFFFFFFFFFF8;
    v57 = (v51 + 39) & 0xFFFFFFFFFFFFFFF8;
    v58 = *(_QWORD *)v57;
    v59 = *(_QWORD *)(v57 + 8);
    v60 = *(_BYTE *)(v57 + 16);
    sub_235591504(*(_QWORD *)v57, v59, v60);
    *(_QWORD *)v56 = v58;
    *(_QWORD *)(v56 + 8) = v59;
    *(_BYTE *)(v56 + 16) = v60;
    v61 = (_QWORD *)((v50 + 63) & 0xFFFFFFFFFFFFFFF8);
    v62 = (_QWORD *)((v51 + 63) & 0xFFFFFFFFFFFFFFF8);
    v63 = v62[1];
    *v61 = *v62;
    v61[1] = v63;
    v64 = ((unint64_t)a1 + v49 + 7) & 0xFFFFFFFFFFFFFFF8;
    v65 = (unint64_t)&v85[v49] & 0xFFFFFFFFFFFFFFF8;
    v66 = *(_QWORD *)v65;
    LOBYTE(v59) = *(_BYTE *)(v65 + 8);
    swift_retain();
    sub_23558C900(v66, v59);
    *(_QWORD *)v64 = v66;
    *(_BYTE *)(v64 + 8) = v59;
    v67 = (_QWORD *)((v26 + v64) & v25);
    v68 = (_QWORD *)((v26 + v65) & v25);
    v69 = *((unsigned __int8 *)v68 + v100);
    if (v69 >= 2)
    {
      if (v100 <= 3)
        v70 = v100;
      else
        v70 = 4;
      __asm { BR              X12 }
    }
    v71 = ~v86;
    if (v69 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v95 + 16))(v67, v68, v96);
      v72 = 1;
    }
    else
    {
      *v67 = *v68;
      swift_retain();
      v72 = 0;
    }
    *((_BYTE *)v67 + v100) = v72;
    v73 = (_QWORD *)(((unint64_t)v67 + v87) & v71);
    v74 = (_QWORD *)(((unint64_t)v68 + v87) & v71);
    v75 = *((unsigned __int8 *)v74 + v101);
    if (v75 >= 2)
    {
      if (v101 <= 3)
        v76 = v101;
      else
        v76 = 4;
      __asm { BR              X12 }
    }
    v77 = ~v88;
    if (v75 == 1)
    {
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v11 + 48))(v74, 1, v99))
      {
        memcpy(v73, v74, __n);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v11 + 16))(v73, v74, v99);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v73, 0, 1, v99);
      }
      v78 = v102;
      *((_BYTE *)v73 + v101) = 1;
    }
    else
    {
      *v73 = *v74;
      *((_BYTE *)v73 + v101) = 0;
      swift_retain();
      v78 = v102;
    }
    v79 = (_QWORD *)(((unint64_t)v73 + v89) & v77);
    v80 = (_QWORD *)(((unint64_t)v74 + v89) & v77);
    v81 = *((unsigned __int8 *)v80 + v78);
    if (v81 >= 2)
    {
      if (v78 <= 3)
        v82 = v78;
      else
        v82 = 4;
      __asm { BR              X12 }
    }
    if (v81 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v97 + 16))(v79, v80, v98);
      v83 = 1;
    }
    else
    {
      *v79 = *v80;
      swift_retain();
      v83 = 0;
    }
    *((_BYTE *)v79 + v78) = v83;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v92 + 16))(((unint64_t)v79 + v90) & ~v91, ((unint64_t)v80 + v90) & ~v91, v93);
    return a1;
  }
  return (_QWORD *)v41;
}

uint64_t sub_2355AC858(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v3 + 8))();
  v4 = *(_QWORD *)(v3 + 64);
  v5 = (a1 + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_235591958(*(_QWORD *)v5, *(_QWORD *)(v5 + 8), *(_BYTE *)(v5 + 16));
  swift_bridgeObjectRelease();
  v6 = (v5 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v6 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_235591958(*(_QWORD *)v6, *(_QWORD *)(v6 + 8), *(_BYTE *)(v6 + 16));
    swift_bridgeObjectRelease();
  }
  v7 = (v6 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v7 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_235591958(*(_QWORD *)v7, *(_QWORD *)(v7 + 8), *(_BYTE *)(v7 + 16));
    swift_bridgeObjectRelease();
  }
  v8 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v8 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_235591958(*(_QWORD *)v8, *(_QWORD *)(v8 + 8), *(_BYTE *)(v8 + 16));
    swift_bridgeObjectRelease();
  }
  sub_23558A9F8(*(_QWORD *)((v8 + 39) & 0xFFFFFFFFFFFFFFF8), *(_QWORD *)(((v8 + 39) & 0xFFFFFFFFFFFFFFF8) + 8), *(_BYTE *)(((v8 + 39) & 0xFFFFFFFFFFFFFFF8) + 16));
  swift_release();
  v9 = (a1
      + ((((((((((v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 23) & 0xFFFFFFFFFFFFFFF8;
  sub_23558CA44(*(_QWORD *)v9, *(_BYTE *)(v9 + 8));
  v10 = sub_2355C870C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_DWORD *)(v11 + 80) & 0xF8 | 7;
  v13 = (v9 + v12 + 9) & ~v12;
  if (*(_QWORD *)(v11 + 64) <= 8uLL)
    v14 = 8;
  else
    v14 = *(_QWORD *)(v11 + 64);
  v15 = *(unsigned __int8 *)(v13 + v14);
  if (v15 >= 2)
  {
    if (v14 <= 3)
      v16 = v14;
    else
      v16 = 4;
    __asm { BR              X13 }
  }
  if (v15 == 1)
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v13, v10);
  else
    swift_release();
  v17 = v14 + v13;
  v18 = sub_2355C8400();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(_DWORD *)(v19 + 80) & 0xF8 | 7;
  v21 = (v17 + v20 + 1) & ~v20;
  v22 = *(_QWORD *)(v19 + 64);
  if (!*(_DWORD *)(v19 + 84))
    ++v22;
  if (v22 <= 8)
    v23 = 8;
  else
    v23 = v22;
  v24 = *(unsigned __int8 *)(v21 + v23);
  if (v24 >= 2)
  {
    if (v23 <= 3)
      v25 = v23;
    else
      v25 = 4;
    __asm { BR              X12 }
  }
  if (v24 == 1)
  {
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v21, 1, v18))
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v21, v18);
  }
  else
  {
    swift_release();
  }
  v26 = sub_2355C8994();
  v27 = *(_QWORD *)(v26 - 8);
  v28 = *(_DWORD *)(v27 + 80) & 0xF8 | 7;
  v29 = (v23 + v21 + v28 + 1) & ~v28;
  if (*(_QWORD *)(v27 + 64) <= 8uLL)
    v30 = 8;
  else
    v30 = *(_QWORD *)(v27 + 64);
  v31 = *(unsigned __int8 *)(v29 + v30);
  if (v31 >= 2)
  {
    if (v30 <= 3)
      v32 = v30;
    else
      v32 = 4;
    __asm { BR              X13 }
  }
  if (v31 == 1)
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v29, v26);
  else
    swift_release();
  v33 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  return (*(uint64_t (**)(unint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 8))((v30 + v29 + *(unsigned __int8 *)(*(_QWORD *)(v33 - 8) + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v33 - 8) + 80), v33);
}

uint64_t sub_2355ACC48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  __int128 v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  _QWORD *v61;
  size_t v62;
  uint64_t v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  _QWORD *v71;
  uint64_t v72;
  unsigned int v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t v77;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_QWORD *)v8;
  v10 = *(_QWORD *)(v8 + 8);
  v11 = *(_BYTE *)(v8 + 16);
  sub_2355914F4(*(_QWORD *)v8, v10, v11);
  *(_QWORD *)v7 = v9;
  *(_QWORD *)(v7 + 8) = v10;
  *(_BYTE *)(v7 + 16) = v11;
  *(_QWORD *)(v7 + 24) = *(_QWORD *)(v8 + 24);
  v12 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  v13 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  v14 = *(_QWORD *)(v13 + 24);
  swift_bridgeObjectRetain();
  if (v14 < 0xFFFFFFFF)
  {
    v18 = *(_OWORD *)(v13 + 16);
    *(_OWORD *)v12 = *(_OWORD *)v13;
    *(_OWORD *)(v12 + 16) = v18;
  }
  else
  {
    v15 = *(_QWORD *)v13;
    v16 = *(_QWORD *)(v13 + 8);
    v17 = *(_BYTE *)(v13 + 16);
    sub_2355914F4(*(_QWORD *)v13, v16, v17);
    *(_QWORD *)v12 = v15;
    *(_QWORD *)(v12 + 8) = v16;
    *(_BYTE *)(v12 + 16) = v17;
    *(_QWORD *)(v12 + 24) = *(_QWORD *)(v13 + 24);
    swift_bridgeObjectRetain();
  }
  v19 = (v12 + 39) & 0xFFFFFFFFFFFFFFF8;
  v20 = (v13 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v20 + 24) < 0xFFFFFFFFuLL)
  {
    v24 = *(_OWORD *)(v20 + 16);
    *(_OWORD *)v19 = *(_OWORD *)v20;
    *(_OWORD *)(v19 + 16) = v24;
  }
  else
  {
    v21 = *(_QWORD *)v20;
    v22 = *(_QWORD *)(v20 + 8);
    v23 = *(_BYTE *)(v20 + 16);
    sub_2355914F4(*(_QWORD *)v20, v22, v23);
    *(_QWORD *)v19 = v21;
    *(_QWORD *)(v19 + 8) = v22;
    *(_BYTE *)(v19 + 16) = v23;
    *(_QWORD *)(v19 + 24) = *(_QWORD *)(v20 + 24);
    swift_bridgeObjectRetain();
  }
  v25 = (v19 + 39) & 0xFFFFFFFFFFFFFFF8;
  v26 = (v20 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v26 + 24) < 0xFFFFFFFFuLL)
  {
    v30 = *(_OWORD *)(v26 + 16);
    *(_OWORD *)v25 = *(_OWORD *)v26;
    *(_OWORD *)(v25 + 16) = v30;
  }
  else
  {
    v27 = *(_QWORD *)v26;
    v28 = *(_QWORD *)(v26 + 8);
    v29 = *(_BYTE *)(v26 + 16);
    sub_2355914F4(*(_QWORD *)v26, v28, v29);
    *(_QWORD *)v25 = v27;
    *(_QWORD *)(v25 + 8) = v28;
    *(_BYTE *)(v25 + 16) = v29;
    *(_QWORD *)(v25 + 24) = *(_QWORD *)(v26 + 24);
    swift_bridgeObjectRetain();
  }
  v31 = (v25 + 39) & 0xFFFFFFFFFFFFFFF8;
  v32 = (v26 + 39) & 0xFFFFFFFFFFFFFFF8;
  v33 = *(_QWORD *)v32;
  v34 = *(_QWORD *)(v32 + 8);
  v35 = *(_BYTE *)(v32 + 16);
  sub_235591504(*(_QWORD *)v32, v34, v35);
  *(_QWORD *)v31 = v33;
  *(_QWORD *)(v31 + 8) = v34;
  *(_BYTE *)(v31 + 16) = v35;
  v36 = (_QWORD *)((v25 + 63) & 0xFFFFFFFFFFFFFFF8);
  v37 = (_QWORD *)((v26 + 63) & 0xFFFFFFFFFFFFFFF8);
  v38 = v37[1];
  *v36 = *v37;
  v36[1] = v38;
  v39 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  v40 = (a1 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
  v41 = (a2 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
  v42 = *(_QWORD *)v41;
  LOBYTE(v33) = *(_BYTE *)(v41 + 8);
  swift_retain();
  sub_23558C900(v42, v33);
  *(_QWORD *)v40 = v42;
  *(_BYTE *)(v40 + 8) = v33;
  v43 = sub_2355C870C();
  v44 = *(_QWORD *)(v43 - 8);
  v45 = *(_DWORD *)(v44 + 80) & 0xF8;
  v46 = v45 + 16;
  v47 = v45 + 16 + v40;
  v48 = ~v45 & 0xFFFFFFFFFFFFFFF8;
  v49 = (_QWORD *)(v47 & v48);
  v50 = (_QWORD *)((v46 + v41) & v48);
  if (*(_QWORD *)(v44 + 64) <= 8uLL)
    v51 = 8;
  else
    v51 = *(_QWORD *)(v44 + 64);
  v52 = *((unsigned __int8 *)v50 + v51);
  if (v52 >= 2)
  {
    if (v51 <= 3)
      v53 = v51;
    else
      v53 = 4;
    __asm { BR              X13 }
  }
  if (v52 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v44 + 16))(v49, v50, v43);
    v54 = 1;
  }
  else
  {
    *v49 = *v50;
    swift_retain();
    v54 = 0;
  }
  *((_BYTE *)v49 + v51) = v54;
  v55 = v51 + 1;
  v56 = sub_2355C8400();
  v57 = *(_QWORD *)(v56 - 8);
  v58 = *(_DWORD *)(v57 + 80) & 0xF8 | 7;
  v59 = v55 + v58;
  v60 = (_QWORD *)(((unint64_t)v49 + v55 + v58) & ~v58);
  v61 = (_QWORD *)(((unint64_t)v50 + v59) & ~v58);
  if (*(_DWORD *)(v57 + 84))
    v62 = *(_QWORD *)(v57 + 64);
  else
    v62 = *(_QWORD *)(v57 + 64) + 1;
  if (v62 <= 8)
    v63 = 8;
  else
    v63 = v62;
  v64 = *((unsigned __int8 *)v61 + v63);
  if (v64 >= 2)
  {
    if (v63 <= 3)
      v65 = v63;
    else
      v65 = 4;
    __asm { BR              X12 }
  }
  if (v64 == 1)
  {
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v57 + 48))(v61, 1, v56))
    {
      memcpy(v60, v61, v62);
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v57 + 16))(v60, v61, v56);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v57 + 56))(v60, 0, 1, v56);
    }
    *((_BYTE *)v60 + v63) = 1;
  }
  else
  {
    *v60 = *v61;
    *((_BYTE *)v60 + v63) = 0;
    swift_retain();
  }
  v66 = sub_2355C8994();
  v67 = *(_QWORD *)(v66 - 8);
  v68 = *(_DWORD *)(v67 + 80) & 0xF8 | 7;
  v69 = v63 + v68 + 1;
  v70 = (_QWORD *)(((unint64_t)v60 + v69) & ~v68);
  v71 = (_QWORD *)(((unint64_t)v61 + v69) & ~v68);
  if (*(_QWORD *)(v67 + 64) <= 8uLL)
    v72 = 8;
  else
    v72 = *(_QWORD *)(v67 + 64);
  v73 = *((unsigned __int8 *)v71 + v72);
  if (v73 >= 2)
  {
    if (v72 <= 3)
      v74 = v72;
    else
      v74 = 4;
    __asm { BR              X13 }
  }
  if (v73 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v67 + 16))(v70, v71, v66);
    v75 = 1;
  }
  else
  {
    *v70 = *v71;
    swift_retain();
    v75 = 0;
  }
  *((_BYTE *)v70 + v72) = v75;
  v76 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v77 = *(_QWORD *)(v76 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v77 + 16))(((unint64_t)v70 + v72 + *(unsigned __int8 *)(v77 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80), ((unint64_t)v71 + v72 + *(unsigned __int8 *)(v77 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80), v76);
  return a1;
}

uint64_t sub_2355AD1D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  __int128 v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  __int128 v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  __int128 v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  _QWORD *v62;
  _QWORD *v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  _QWORD *v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t v80;
  unsigned int v81;
  uint64_t v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  _QWORD *v91;
  unint64_t v92;
  uint64_t v93;
  size_t v94;
  uint64_t v95;
  unsigned int v96;
  uint64_t v97;
  unsigned int v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD *v107;
  _QWORD *v108;
  uint64_t v109;
  unsigned int v110;
  uint64_t v111;
  unsigned int v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_QWORD *)v8;
  v10 = *(_QWORD *)(v8 + 8);
  v11 = *(_BYTE *)(v8 + 16);
  sub_2355914F4(*(_QWORD *)v8, v10, v11);
  v12 = *(_QWORD *)v7;
  v13 = *(_QWORD *)(v7 + 8);
  v14 = *(_BYTE *)(v7 + 16);
  *(_QWORD *)v7 = v9;
  *(_QWORD *)(v7 + 8) = v10;
  *(_BYTE *)(v7 + 16) = v11;
  sub_235591958(v12, v13, v14);
  *(_QWORD *)(v7 + 24) = *(_QWORD *)(v8 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  v16 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  v17 = *(_QWORD *)(v16 + 24);
  if (*(_QWORD *)(v15 + 24) < 0xFFFFFFFFuLL)
  {
    if (v17 >= 0xFFFFFFFF)
    {
      v24 = *(_QWORD *)v16;
      v25 = *(_QWORD *)(v16 + 8);
      v26 = *(_BYTE *)(v16 + 16);
      sub_2355914F4(*(_QWORD *)v16, v25, v26);
      *(_QWORD *)v15 = v24;
      *(_QWORD *)(v15 + 8) = v25;
      *(_BYTE *)(v15 + 16) = v26;
      *(_QWORD *)(v15 + 24) = *(_QWORD *)(v16 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
  }
  else
  {
    if (v17 >= 0xFFFFFFFF)
    {
      v18 = *(_QWORD *)v16;
      v19 = *(_QWORD *)(v16 + 8);
      v20 = *(_BYTE *)(v16 + 16);
      sub_2355914F4(*(_QWORD *)v16, v19, v20);
      v21 = *(_QWORD *)v15;
      v22 = *(_QWORD *)(v15 + 8);
      v23 = *(_BYTE *)(v15 + 16);
      *(_QWORD *)v15 = v18;
      *(_QWORD *)(v15 + 8) = v19;
      *(_BYTE *)(v15 + 16) = v20;
      sub_235591958(v21, v22, v23);
      *(_QWORD *)(v15 + 24) = *(_QWORD *)(v16 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    sub_235591958(*(_QWORD *)v15, *(_QWORD *)(v15 + 8), *(_BYTE *)(v15 + 16));
    swift_bridgeObjectRelease();
  }
  v27 = *(_OWORD *)(v16 + 16);
  *(_OWORD *)v15 = *(_OWORD *)v16;
  *(_OWORD *)(v15 + 16) = v27;
LABEL_8:
  v28 = (v15 + 39) & 0xFFFFFFFFFFFFFFF8;
  v29 = (v16 + 39) & 0xFFFFFFFFFFFFFFF8;
  v30 = *(_QWORD *)(v29 + 24);
  if (*(_QWORD *)(v28 + 24) < 0xFFFFFFFFuLL)
  {
    if (v30 >= 0xFFFFFFFF)
    {
      v37 = *(_QWORD *)v29;
      v38 = *(_QWORD *)(v29 + 8);
      v39 = *(_BYTE *)(v29 + 16);
      sub_2355914F4(*(_QWORD *)v29, v38, v39);
      *(_QWORD *)v28 = v37;
      *(_QWORD *)(v28 + 8) = v38;
      *(_BYTE *)(v28 + 16) = v39;
      *(_QWORD *)(v28 + 24) = *(_QWORD *)(v29 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_15;
    }
  }
  else
  {
    if (v30 >= 0xFFFFFFFF)
    {
      v31 = *(_QWORD *)v29;
      v32 = *(_QWORD *)(v29 + 8);
      v33 = *(_BYTE *)(v29 + 16);
      sub_2355914F4(*(_QWORD *)v29, v32, v33);
      v34 = *(_QWORD *)v28;
      v35 = *(_QWORD *)(v28 + 8);
      v36 = *(_BYTE *)(v28 + 16);
      *(_QWORD *)v28 = v31;
      *(_QWORD *)(v28 + 8) = v32;
      *(_BYTE *)(v28 + 16) = v33;
      sub_235591958(v34, v35, v36);
      *(_QWORD *)(v28 + 24) = *(_QWORD *)(v29 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    sub_235591958(*(_QWORD *)v28, *(_QWORD *)(v28 + 8), *(_BYTE *)(v28 + 16));
    swift_bridgeObjectRelease();
  }
  v40 = *(_OWORD *)(v29 + 16);
  *(_OWORD *)v28 = *(_OWORD *)v29;
  *(_OWORD *)(v28 + 16) = v40;
LABEL_15:
  v41 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
  v42 = (v29 + 39) & 0xFFFFFFFFFFFFFFF8;
  v43 = *(_QWORD *)(v42 + 24);
  if (*(_QWORD *)(v41 + 24) < 0xFFFFFFFFuLL)
  {
    if (v43 >= 0xFFFFFFFF)
    {
      v50 = *(_QWORD *)v42;
      v51 = *(_QWORD *)(v42 + 8);
      v52 = *(_BYTE *)(v42 + 16);
      sub_2355914F4(*(_QWORD *)v42, v51, v52);
      *(_QWORD *)v41 = v50;
      *(_QWORD *)(v41 + 8) = v51;
      *(_BYTE *)(v41 + 16) = v52;
      *(_QWORD *)(v41 + 24) = *(_QWORD *)(v42 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_22;
    }
  }
  else
  {
    if (v43 >= 0xFFFFFFFF)
    {
      v44 = *(_QWORD *)v42;
      v45 = *(_QWORD *)(v42 + 8);
      v46 = *(_BYTE *)(v42 + 16);
      sub_2355914F4(*(_QWORD *)v42, v45, v46);
      v47 = *(_QWORD *)v41;
      v48 = *(_QWORD *)(v41 + 8);
      v49 = *(_BYTE *)(v41 + 16);
      *(_QWORD *)v41 = v44;
      *(_QWORD *)(v41 + 8) = v45;
      *(_BYTE *)(v41 + 16) = v46;
      sub_235591958(v47, v48, v49);
      *(_QWORD *)(v41 + 24) = *(_QWORD *)(v42 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_22;
    }
    sub_235591958(*(_QWORD *)v41, *(_QWORD *)(v41 + 8), *(_BYTE *)(v41 + 16));
    swift_bridgeObjectRelease();
  }
  v53 = *(_OWORD *)(v42 + 16);
  *(_OWORD *)v41 = *(_OWORD *)v42;
  *(_OWORD *)(v41 + 16) = v53;
LABEL_22:
  v54 = (v41 + 39) & 0xFFFFFFFFFFFFFFF8;
  v55 = (v42 + 39) & 0xFFFFFFFFFFFFFFF8;
  v56 = *(_QWORD *)v55;
  v57 = *(_QWORD *)(v55 + 8);
  v58 = *(_BYTE *)(v55 + 16);
  sub_235591504(*(_QWORD *)v55, v57, v58);
  v59 = *(_QWORD *)v54;
  v60 = *(_QWORD *)(v54 + 8);
  *(_QWORD *)v54 = v56;
  *(_QWORD *)(v54 + 8) = v57;
  v61 = *(_BYTE *)(v54 + 16);
  *(_BYTE *)(v54 + 16) = v58;
  sub_23558A9F8(v59, v60, v61);
  v62 = (_QWORD *)((v41 + 63) & 0xFFFFFFFFFFFFFFF8);
  v63 = (_QWORD *)((v42 + 63) & 0xFFFFFFFFFFFFFFF8);
  v64 = v63[1];
  *v62 = *v63;
  v62[1] = v64;
  swift_retain();
  swift_release();
  v65 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  v66 = (a1 + v65 + 7) & 0xFFFFFFFFFFFFFFF8;
  v67 = (a2 + v65 + 7) & 0xFFFFFFFFFFFFFFF8;
  v68 = *(_QWORD *)v67;
  LOBYTE(v56) = *(_BYTE *)(v67 + 8);
  sub_23558C900(*(_QWORD *)v67, v56);
  v69 = *(_QWORD *)v66;
  v70 = *(_BYTE *)(v66 + 8);
  *(_QWORD *)v66 = v68;
  *(_BYTE *)(v66 + 8) = v56;
  sub_23558CA44(v69, v70);
  v71 = sub_2355C870C();
  v72 = *(_QWORD *)(v71 - 8);
  v73 = *(_DWORD *)(v72 + 80) & 0xF8;
  v74 = v73 + 16;
  v75 = v73 + 16 + v66;
  v76 = ~v73 & 0xFFFFFFFFFFFFFFF8;
  v77 = (_QWORD *)(v75 & v76);
  v78 = (_QWORD *)((v74 + v67) & v76);
  if (*(_QWORD *)(v72 + 64) <= 8uLL)
    v79 = 8;
  else
    v79 = *(_QWORD *)(v72 + 64);
  if (v77 != v78)
  {
    v80 = v71;
    v81 = *((unsigned __int8 *)v77 + v79);
    if (v81 >= 2)
    {
      if (v79 <= 3)
        v82 = v79;
      else
        v82 = 4;
      __asm { BR              X12 }
    }
    if (v81 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v72 + 8))(v77, v71);
    else
      swift_release();
    v83 = *((unsigned __int8 *)v78 + v79);
    if (v83 >= 2)
    {
      if (v79 <= 3)
        v84 = v79;
      else
        v84 = 4;
      __asm { BR              X12 }
    }
    if (v83 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v72 + 16))(v77, v78, v80);
      *((_BYTE *)v77 + v79) = 1;
    }
    else
    {
      *v77 = *v78;
      *((_BYTE *)v77 + v79) = 0;
      swift_retain();
    }
  }
  v85 = sub_2355C8400();
  v86 = *(_QWORD *)(v85 - 8);
  v87 = *(_DWORD *)(v86 + 84);
  v88 = *(_DWORD *)(v86 + 80) & 0xF8 | 7;
  v89 = v79 + v88 + 1;
  v90 = (_QWORD *)(((unint64_t)v77 + v89) & ~v88);
  v91 = (_QWORD *)(((unint64_t)v78 + v89) & ~v88);
  v92 = *(_QWORD *)(v86 + 64);
  if (v90 != v91)
  {
    v93 = v85;
    if (v87)
      v94 = *(_QWORD *)(v86 + 64);
    else
      v94 = v92 + 1;
    if (v94 <= 8)
      v95 = 8;
    else
      v95 = v94;
    v96 = *((unsigned __int8 *)v90 + v95);
    if (v96 >= 2)
    {
      if (v95 <= 3)
        v97 = v95;
      else
        v97 = 4;
      __asm { BR              X12 }
    }
    if (v96 == 1)
    {
      if (!(*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v86 + 48))(v90, 1, v85))
        (*(void (**)(_QWORD *, uint64_t))(v86 + 8))(v90, v93);
    }
    else
    {
      swift_release();
    }
    v98 = *((unsigned __int8 *)v91 + v95);
    if (v98 >= 2)
    {
      if (v95 <= 3)
        v99 = v95;
      else
        v99 = 4;
      __asm { BR              X12 }
    }
    if (v98 == 1)
    {
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v86 + 48))(v91, 1, v93))
      {
        memcpy(v90, v91, v94);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v86 + 16))(v90, v91, v93);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v86 + 56))(v90, 0, 1, v93);
      }
      *((_BYTE *)v90 + v95) = 1;
    }
    else
    {
      *v90 = *v91;
      *((_BYTE *)v90 + v95) = 0;
      swift_retain();
    }
  }
  if (v87)
    v100 = v92;
  else
    v100 = v92 + 1;
  v101 = 8;
  if (v100 <= 8)
    v102 = 8;
  else
    v102 = v100;
  v103 = sub_2355C8994();
  v104 = *(_QWORD *)(v103 - 8);
  v105 = *(_DWORD *)(v104 + 80) & 0xF8 | 7;
  v106 = v102 + v105 + 1;
  v107 = (_QWORD *)(((unint64_t)v90 + v106) & ~v105);
  v108 = (_QWORD *)(((unint64_t)v91 + v106) & ~v105);
  if (*(_QWORD *)(v104 + 64) > 8uLL)
    v101 = *(_QWORD *)(v104 + 64);
  if (v107 != v108)
  {
    v109 = v103;
    v110 = *((unsigned __int8 *)v107 + v101);
    if (v110 >= 2)
    {
      if (v101 <= 3)
        v111 = v101;
      else
        v111 = 4;
      __asm { BR              X12 }
    }
    if (v110 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v104 + 8))(v107, v103);
    else
      swift_release();
    v112 = *((unsigned __int8 *)v108 + v101);
    if (v112 >= 2)
    {
      if (v101 <= 3)
        v113 = v101;
      else
        v113 = 4;
      __asm { BR              X12 }
    }
    if (v112 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v104 + 16))(v107, v108, v109);
      *((_BYTE *)v107 + v101) = 1;
    }
    else
    {
      *v107 = *v108;
      *((_BYTE *)v107 + v101) = 0;
      swift_retain();
    }
  }
  v114 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v115 = *(_QWORD *)(v114 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v115 + 24))(((unint64_t)v107 + v101 + *(unsigned __int8 *)(v115 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v115 + 80), ((unint64_t)v108 + v101 + *(unsigned __int8 *)(v115 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v115 + 80), v114);
  return a1;
}

uint64_t sub_2355ADB70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  __int128 v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;
  _OWORD *v13;
  _OWORD *v14;
  __int128 v15;
  _OWORD *v16;
  _OWORD *v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  size_t v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  unsigned int v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  v10 = (_OWORD *)(((unint64_t)v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  v11 = (_OWORD *)(((unint64_t)v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  v13 = (_OWORD *)(((unint64_t)v10 + 39) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_OWORD *)(((unint64_t)v11 + 39) & 0xFFFFFFFFFFFFFFF8);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = (_OWORD *)(((unint64_t)v13 + 39) & 0xFFFFFFFFFFFFFFF8);
  v17 = (_OWORD *)(((unint64_t)v14 + 39) & 0xFFFFFFFFFFFFFFF8);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = ((unint64_t)v16 + 39) & 0xFFFFFFFFFFFFFFF8;
  v20 = ((unint64_t)v17 + 39) & 0xFFFFFFFFFFFFFFF8;
  v21 = *(_BYTE *)(v20 + 16);
  *(_OWORD *)v19 = *(_OWORD *)v20;
  *(_BYTE *)(v19 + 16) = v21;
  *(_OWORD *)(((unint64_t)v16 + 63) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v17 + 63) & 0xFFFFFFFFFFFFF8);
  v22 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  v23 = (a1 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  v24 = (a2 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  LOBYTE(v22) = *(_BYTE *)(v24 + 8);
  *(_QWORD *)v23 = *(_QWORD *)v24;
  *(_BYTE *)(v23 + 8) = v22;
  v25 = sub_2355C870C();
  v26 = *(_QWORD *)(v25 - 8);
  v27 = *(_DWORD *)(v26 + 80) & 0xF8;
  v28 = v27 + 16;
  v29 = v27 + 16 + v23;
  v30 = ~v27 & 0xFFFFFFFFFFFFFFF8;
  v31 = (_QWORD *)(v29 & v30);
  v32 = (_QWORD *)((v28 + v24) & v30);
  if (*(_QWORD *)(v26 + 64) <= 8uLL)
    v33 = 8;
  else
    v33 = *(_QWORD *)(v26 + 64);
  v34 = *((unsigned __int8 *)v32 + v33);
  if (v34 >= 2)
  {
    if (v33 <= 3)
      v35 = v33;
    else
      v35 = 4;
    __asm { BR              X13 }
  }
  if (v34 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v26 + 32))(v31, v32, v25);
    v36 = 1;
  }
  else
  {
    v36 = 0;
    *v31 = *v32;
  }
  *((_BYTE *)v31 + v33) = v36;
  v37 = v33 + 1;
  v38 = sub_2355C8400();
  v39 = *(_QWORD *)(v38 - 8);
  v40 = *(_DWORD *)(v39 + 80) & 0xF8 | 7;
  v41 = v37 + v40;
  v42 = (_QWORD *)(((unint64_t)v31 + v37 + v40) & ~v40);
  v43 = (_QWORD *)(((unint64_t)v32 + v41) & ~v40);
  if (*(_DWORD *)(v39 + 84))
    v44 = *(_QWORD *)(v39 + 64);
  else
    v44 = *(_QWORD *)(v39 + 64) + 1;
  if (v44 <= 8)
    v45 = 8;
  else
    v45 = v44;
  v46 = *((unsigned __int8 *)v43 + v45);
  if (v46 >= 2)
  {
    if (v45 <= 3)
      v47 = v45;
    else
      v47 = 4;
    __asm { BR              X12 }
  }
  if (v46 == 1)
  {
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v39 + 48))(v43, 1, v38))
    {
      memcpy(v42, v43, v44);
      v48 = 1;
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v39 + 32))(v42, v43, v38);
      v48 = 1;
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v39 + 56))(v42, 0, 1, v38);
    }
  }
  else
  {
    v48 = 0;
    *v42 = *v43;
  }
  *((_BYTE *)v42 + v45) = v48;
  v49 = sub_2355C8994();
  v50 = *(_QWORD *)(v49 - 8);
  v51 = *(_DWORD *)(v50 + 80) & 0xF8 | 7;
  v52 = v45 + v51 + 1;
  v53 = (_QWORD *)(((unint64_t)v42 + v52) & ~v51);
  v54 = (_QWORD *)(((unint64_t)v43 + v52) & ~v51);
  if (*(_QWORD *)(v50 + 64) <= 8uLL)
    v55 = 8;
  else
    v55 = *(_QWORD *)(v50 + 64);
  v56 = *((unsigned __int8 *)v54 + v55);
  if (v56 >= 2)
  {
    if (v55 <= 3)
      v57 = v55;
    else
      v57 = 4;
    __asm { BR              X13 }
  }
  if (v56 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v50 + 32))(v53, v54, v49);
    v58 = 1;
  }
  else
  {
    v58 = 0;
    *v53 = *v54;
  }
  *((_BYTE *)v53 + v55) = v58;
  v59 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v60 = *(_QWORD *)(v59 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v60 + 32))(((unint64_t)v53 + v55 + *(unsigned __int8 *)(v60 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80), ((unint64_t)v54 + v55 + *(unsigned __int8 *)(v60 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80), v59);
  return a1;
}

uint64_t sub_2355ADFE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  unint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  _QWORD *v67;
  unint64_t v68;
  uint64_t v69;
  size_t v70;
  uint64_t v71;
  unsigned int v72;
  uint64_t v73;
  unsigned int v74;
  uint64_t v75;
  char v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  _QWORD *v85;
  uint64_t v86;
  unsigned int v87;
  uint64_t v88;
  unsigned int v89;
  uint64_t v90;
  char v91;
  uint64_t v92;
  uint64_t v93;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_BYTE *)(v8 + 16);
  v10 = *(_QWORD *)v7;
  v11 = *(_QWORD *)(v7 + 8);
  v12 = *(_BYTE *)(v7 + 16);
  *(_OWORD *)v7 = *(_OWORD *)v8;
  *(_BYTE *)(v7 + 16) = v9;
  sub_235591958(v10, v11, v12);
  *(_QWORD *)(v7 + 24) = *(_QWORD *)(v8 + 24);
  swift_bridgeObjectRelease();
  v13 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  v14 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v13 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(_QWORD *)(v14 + 24) >= 0xFFFFFFFFuLL)
    {
      v15 = *(_BYTE *)(v14 + 16);
      v16 = *(_QWORD *)v13;
      v17 = *(_QWORD *)(v13 + 8);
      v18 = *(_BYTE *)(v13 + 16);
      *(_OWORD *)v13 = *(_OWORD *)v14;
      *(_BYTE *)(v13 + 16) = v15;
      sub_235591958(v16, v17, v18);
      *(_QWORD *)(v13 + 24) = *(_QWORD *)(v14 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_235591958(*(_QWORD *)v13, *(_QWORD *)(v13 + 8), *(_BYTE *)(v13 + 16));
    swift_bridgeObjectRelease();
  }
  v19 = *(_OWORD *)(v14 + 16);
  *(_OWORD *)v13 = *(_OWORD *)v14;
  *(_OWORD *)(v13 + 16) = v19;
LABEL_6:
  v20 = (v13 + 39) & 0xFFFFFFFFFFFFFFF8;
  v21 = (v14 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v20 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(_QWORD *)(v21 + 24) >= 0xFFFFFFFFuLL)
    {
      v22 = *(_BYTE *)(v21 + 16);
      v23 = *(_QWORD *)v20;
      v24 = *(_QWORD *)(v20 + 8);
      v25 = *(_BYTE *)(v20 + 16);
      *(_OWORD *)v20 = *(_OWORD *)v21;
      *(_BYTE *)(v20 + 16) = v22;
      sub_235591958(v23, v24, v25);
      *(_QWORD *)(v20 + 24) = *(_QWORD *)(v21 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    sub_235591958(*(_QWORD *)v20, *(_QWORD *)(v20 + 8), *(_BYTE *)(v20 + 16));
    swift_bridgeObjectRelease();
  }
  v26 = *(_OWORD *)(v21 + 16);
  *(_OWORD *)v20 = *(_OWORD *)v21;
  *(_OWORD *)(v20 + 16) = v26;
LABEL_11:
  v27 = (v20 + 39) & 0xFFFFFFFFFFFFFFF8;
  v28 = (v21 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v27 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(_QWORD *)(v28 + 24) >= 0xFFFFFFFFuLL)
    {
      v29 = *(_BYTE *)(v28 + 16);
      v30 = *(_QWORD *)v27;
      v31 = *(_QWORD *)(v27 + 8);
      v32 = *(_BYTE *)(v27 + 16);
      *(_OWORD *)v27 = *(_OWORD *)v28;
      *(_BYTE *)(v27 + 16) = v29;
      sub_235591958(v30, v31, v32);
      *(_QWORD *)(v27 + 24) = *(_QWORD *)(v28 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_16;
    }
    sub_235591958(*(_QWORD *)v27, *(_QWORD *)(v27 + 8), *(_BYTE *)(v27 + 16));
    swift_bridgeObjectRelease();
  }
  v33 = *(_OWORD *)(v28 + 16);
  *(_OWORD *)v27 = *(_OWORD *)v28;
  *(_OWORD *)(v27 + 16) = v33;
LABEL_16:
  v34 = (v27 + 39) & 0xFFFFFFFFFFFFFFF8;
  v35 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
  v36 = *(_BYTE *)(v35 + 16);
  v37 = *(_QWORD *)v34;
  v38 = *(_QWORD *)(v34 + 8);
  *(_OWORD *)v34 = *(_OWORD *)v35;
  v39 = *(_BYTE *)(v34 + 16);
  *(_BYTE *)(v34 + 16) = v36;
  sub_23558A9F8(v37, v38, v39);
  *(_OWORD *)((v27 + 63) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v28 + 63) & 0xFFFFFFFFFFFFF8);
  swift_release();
  v40 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  v41 = (a1 + v40 + 7) & 0xFFFFFFFFFFFFFFF8;
  v42 = (a2 + v40 + 7) & 0xFFFFFFFFFFFFFFF8;
  v43 = *(_BYTE *)(v42 + 8);
  v44 = *(_QWORD *)v41;
  v45 = *(_BYTE *)(v41 + 8);
  *(_QWORD *)v41 = *(_QWORD *)v42;
  *(_BYTE *)(v41 + 8) = v43;
  sub_23558CA44(v44, v45);
  v46 = sub_2355C870C();
  v47 = *(_QWORD *)(v46 - 8);
  v48 = *(_DWORD *)(v47 + 80) & 0xF8;
  v49 = v48 + 16;
  v50 = v48 + 16 + v41;
  v51 = ~v48 & 0xFFFFFFFFFFFFFFF8;
  v52 = (_QWORD *)(v50 & v51);
  v53 = (_QWORD *)((v49 + v42) & v51);
  if (*(_QWORD *)(v47 + 64) <= 8uLL)
    v54 = 8;
  else
    v54 = *(_QWORD *)(v47 + 64);
  if (v52 != v53)
  {
    v55 = v46;
    v56 = *((unsigned __int8 *)v52 + v54);
    if (v56 >= 2)
    {
      if (v54 <= 3)
        v57 = v54;
      else
        v57 = 4;
      __asm { BR              X12 }
    }
    if (v56 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v47 + 8))(v52, v46);
    else
      swift_release();
    v58 = *((unsigned __int8 *)v53 + v54);
    if (v58 >= 2)
    {
      if (v54 <= 3)
        v59 = v54;
      else
        v59 = 4;
      __asm { BR              X12 }
    }
    if (v58 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v47 + 32))(v52, v53, v55);
      v60 = 1;
    }
    else
    {
      v60 = 0;
      *v52 = *v53;
    }
    *((_BYTE *)v52 + v54) = v60;
  }
  v61 = sub_2355C8400();
  v62 = *(_QWORD *)(v61 - 8);
  v63 = *(_DWORD *)(v62 + 84);
  v64 = *(_DWORD *)(v62 + 80) & 0xF8 | 7;
  v65 = v54 + v64 + 1;
  v66 = (_QWORD *)(((unint64_t)v52 + v65) & ~v64);
  v67 = (_QWORD *)(((unint64_t)v53 + v65) & ~v64);
  v68 = *(_QWORD *)(v62 + 64);
  if (v66 != v67)
  {
    v69 = v61;
    if (v63)
      v70 = *(_QWORD *)(v62 + 64);
    else
      v70 = v68 + 1;
    if (v70 <= 8)
      v71 = 8;
    else
      v71 = v70;
    v72 = *((unsigned __int8 *)v66 + v71);
    if (v72 >= 2)
    {
      if (v71 <= 3)
        v73 = v71;
      else
        v73 = 4;
      __asm { BR              X12 }
    }
    if (v72 == 1)
    {
      if (!(*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v62 + 48))(v66, 1, v61))
        (*(void (**)(_QWORD *, uint64_t))(v62 + 8))(v66, v69);
    }
    else
    {
      swift_release();
    }
    v74 = *((unsigned __int8 *)v67 + v71);
    if (v74 >= 2)
    {
      if (v71 <= 3)
        v75 = v71;
      else
        v75 = 4;
      __asm { BR              X12 }
    }
    if (v74 == 1)
    {
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v62 + 48))(v67, 1, v69))
      {
        memcpy(v66, v67, v70);
        v76 = 1;
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v62 + 32))(v66, v67, v69);
        v76 = 1;
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v62 + 56))(v66, 0, 1, v69);
      }
    }
    else
    {
      v76 = 0;
      *v66 = *v67;
    }
    *((_BYTE *)v66 + v71) = v76;
  }
  if (v63)
    v77 = v68;
  else
    v77 = v68 + 1;
  v78 = 8;
  if (v77 <= 8)
    v79 = 8;
  else
    v79 = v77;
  v80 = sub_2355C8994();
  v81 = *(_QWORD *)(v80 - 8);
  v82 = *(_DWORD *)(v81 + 80) & 0xF8 | 7;
  v83 = v79 + v82 + 1;
  v84 = (_QWORD *)(((unint64_t)v66 + v83) & ~v82);
  v85 = (_QWORD *)(((unint64_t)v67 + v83) & ~v82);
  if (*(_QWORD *)(v81 + 64) > 8uLL)
    v78 = *(_QWORD *)(v81 + 64);
  if (v84 != v85)
  {
    v86 = v80;
    v87 = *((unsigned __int8 *)v84 + v78);
    if (v87 >= 2)
    {
      if (v78 <= 3)
        v88 = v78;
      else
        v88 = 4;
      __asm { BR              X12 }
    }
    if (v87 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v81 + 8))(v84, v80);
    else
      swift_release();
    v89 = *((unsigned __int8 *)v85 + v78);
    if (v89 >= 2)
    {
      if (v78 <= 3)
        v90 = v78;
      else
        v90 = 4;
      __asm { BR              X12 }
    }
    if (v89 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v81 + 32))(v84, v85, v86);
      v91 = 1;
    }
    else
    {
      v91 = 0;
      *v84 = *v85;
    }
    *((_BYTE *)v84 + v78) = v91;
  }
  v92 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v93 = *(_QWORD *)(v92 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v93 + 40))(((unint64_t)v84 + v78 + *(unsigned __int8 *)(v93 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v93 + 80), ((unint64_t)v85 + v78 + *(unsigned __int8 *)(v93 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v93 + 80), v92);
  return a1;
}

uint64_t sub_2355AE7D4(unint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  int v32;
  unsigned int v34;
  int v35;
  int v36;
  uint64_t (*v37)(unint64_t);
  unint64_t v38;
  unsigned int v39;
  unint64_t v40;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v39 = *(_DWORD *)(v4 + 84);
  if (v39 <= 0x7FFFFFFF)
    v5 = 0x7FFFFFFF;
  else
    v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(sub_2355C870C() - 8);
  v7 = *(_QWORD *)(v6 + 64);
  if (v7 <= 8)
    v7 = 8;
  v40 = v7;
  v8 = *(_QWORD *)(sub_2355C8400() - 8);
  v9 = *(_DWORD *)(v8 + 84);
  v10 = *(_QWORD *)(v8 + 64);
  v11 = *(_QWORD *)(sub_2355C8994() - 8);
  if (*(_QWORD *)(v11 + 64) <= 8uLL)
    v12 = 8;
  else
    v12 = *(_QWORD *)(v11 + 64);
  v13 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_256248E08) - 8);
  v14 = *(_DWORD *)(v13 + 84);
  if (v14 <= v5)
    v15 = v5;
  else
    v15 = *(_DWORD *)(v13 + 84);
  if (v9)
    v16 = v10;
  else
    v16 = v10 + 1;
  if (v16 <= 8)
    v17 = 8;
  else
    v17 = v16;
  if (!a2)
    return 0;
  v18 = *(_QWORD *)(v4 + 64);
  v19 = (((((((((v18 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
       + 63) & 0xFFFFFFFFFFFFFFF8;
  v20 = *(_DWORD *)(v6 + 80) & 0xF8;
  v21 = ~v20 & 0xFFFFFFFFFFFFFFF8;
  v22 = v20 + 16;
  v23 = *(_DWORD *)(v8 + 80) & 0xF8 | 7;
  v24 = a1;
  v25 = v40 + v23 + 1;
  v26 = *(_DWORD *)(v11 + 80) & 0xF8 | 7;
  v27 = v17 + v26 + 1;
  v28 = *(unsigned __int8 *)(v13 + 80);
  v29 = v12 + v28 + 1;
  if (a2 <= v15)
    goto LABEL_38;
  v30 = ((v29 + ((v27 + ((v25 + ((v22 + ((v19 + 23) & 0xFFFFFFFFFFFFFFF8)) & v21)) & ~v23)) & ~v26)) & ~v28)
      + *(_QWORD *)(v13 + 64);
  v31 = 8 * v30;
  if (v30 > 3)
    goto LABEL_21;
  v34 = ((a2 - v15 + ~(-1 << v31)) >> v31) + 1;
  if (HIWORD(v34))
  {
    v32 = *(_DWORD *)(a1 + v30);
    if (v32)
      goto LABEL_29;
  }
  else
  {
    if (v34 <= 0xFF)
    {
      if (v34 < 2)
        goto LABEL_38;
LABEL_21:
      v32 = *(unsigned __int8 *)(a1 + v30);
      if (!*(_BYTE *)(a1 + v30))
        goto LABEL_38;
LABEL_29:
      v35 = (v32 - 1) << v31;
      if (v30 > 3)
        v35 = 0;
      if ((_DWORD)v30)
      {
        if (v30 <= 3)
          v36 = v30;
        else
          v36 = 4;
        __asm { BR              X12 }
      }
      return v15 + v35 + 1;
    }
    v32 = *(unsigned __int16 *)(a1 + v30);
    if (*(_WORD *)(a1 + v30))
      goto LABEL_29;
  }
LABEL_38:
  if (v5 < v14)
  {
    v24 = (v29 + ((v27 + ((v25 + ((v22 + ((a1 + v19 + 23) & 0xFFFFFFFFFFFFFFF8)) & v21)) & ~v23)) & ~v26)) & ~v28;
    v37 = *(uint64_t (**)(unint64_t))(v13 + 48);
    return v37(v24);
  }
  if (v39 >= 0x7FFFFFFF)
  {
    v37 = *(uint64_t (**)(unint64_t))(v4 + 48);
    return v37(v24);
  }
  v38 = *(_QWORD *)(((a1 + v18 + 7) & 0xFFFFFFFFFFFFF8) + 0x18);
  if (v38 >= 0xFFFFFFFF)
    LODWORD(v38) = -1;
  return (v38 + 1);
}

void sub_2355AEAE8(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  size_t v19;
  _BYTE *v20;
  unsigned int v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  int v25;

  v4 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v4 + 84) <= 0x7FFFFFFFu)
    v5 = 0x7FFFFFFF;
  else
    v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(sub_2355C870C() - 8);
  if (*(_QWORD *)(v6 + 64) <= 8uLL)
    v7 = 8;
  else
    v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(sub_2355C8400() - 8);
  v9 = *(_DWORD *)(v8 + 84);
  v10 = *(_QWORD *)(v8 + 64);
  v11 = *(_QWORD *)(sub_2355C8994() - 8);
  if (*(_QWORD *)(v11 + 64) <= 8uLL)
    v12 = 8;
  else
    v12 = *(_QWORD *)(v11 + 64);
  v13 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_256248E08) - 8);
  if (*(_DWORD *)(v13 + 84) <= v5)
    v14 = v5;
  else
    v14 = *(_DWORD *)(v13 + 84);
  if (v9)
    v17 = v10;
  else
    v17 = v10 + 1;
  if (v17 <= 8)
    v17 = 8;
  v18 = *(_DWORD *)(v11 + 80) & 0xF8 | 7;
  v15 = *(_DWORD *)(v6 + 80) & 0xF8;
  v16 = *(_DWORD *)(v8 + 80) & 0xF8 | 7;
  v19 = ((v12
        + *(unsigned __int8 *)(v13 + 80)
        + 1
        + ((v17
          + v18
          + 1
          + ((v7
            + v16
            + 1
            + ((v15
              + 16
              + ((((((((((((*(_QWORD *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
                    + 39) & 0xFFFFFFFFFFFFFFF8)
                  + 63) & 0xFFFFFFFFFFFFFFF8)
                + 23) & 0xFFFFFFFFFFFFFFF8)) & ~v15 & 0xFFFFFFFFFFFFFFF8)) & ~v16)) & ~v18)) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))
      + *(_QWORD *)(v13 + 64);
  if (a3 <= v14)
  {
    v22 = 0;
    v20 = a1;
    v21 = a2;
  }
  else
  {
    v20 = a1;
    v21 = a2;
    if (v19 <= 3)
    {
      v24 = ((a3 - v14 + ~(-1 << (8 * v19))) >> (8 * v19)) + 1;
      if (HIWORD(v24))
      {
        v22 = 4u;
      }
      else if (v24 >= 0x100)
      {
        v22 = 2;
      }
      else
      {
        v22 = v24 > 1;
      }
    }
    else
    {
      v22 = 1u;
    }
  }
  if (v14 < v21)
  {
    v23 = ~v14 + v21;
    if (v19 < 4)
    {
      if ((_DWORD)v19)
      {
        v25 = v23 & ~(-1 << (8 * v19));
        bzero(v20, v19);
        if ((_DWORD)v19 == 3)
        {
          *(_WORD *)v20 = v25;
          v20[2] = BYTE2(v25);
        }
        else if ((_DWORD)v19 == 2)
        {
          *(_WORD *)v20 = v25;
        }
        else
        {
          *v20 = v25;
        }
      }
    }
    else
    {
      bzero(v20, v19);
      *(_DWORD *)v20 = v23;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X5 }
}

uint64_t type metadata accessor for HeaderManagedAppCell(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for HeaderManagedAppCell);
}

uint64_t sub_2355AEEC0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2355AEEF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  uint64_t OpaqueTypeConformance2;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
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
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v50 = a2;
  sub_2355C8AB4();
  sub_2355C8820();
  sub_2355C8820();
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  sub_2355C8820();
  sub_2355C89D0();
  v3 = sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249AE8);
  swift_getTupleTypeMetadata3();
  v4 = sub_2355C8E50();
  v5 = MEMORY[0x24BDF5428];
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDF5428], v4);
  v6 = sub_2355C8D90();
  v7 = MEMORY[0x24BDF4498];
  v49 = v6;
  v58 = v6;
  v59 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF4498], v6);
  v53 = v59;
  v8 = MEMORY[0x24BDF2F10];
  MEMORY[0x23B7CFBA4](255, &v58, MEMORY[0x24BDF2F10], 0);
  v9 = sub_2355C8820();
  v43 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v45 = (uint64_t)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v44 = (uint64_t)&v42 - v12;
  v58 = v3;
  v59 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249AF0);
  v60 = type metadata accessor for OfferView();
  v61 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249AF8);
  swift_getTupleTypeMetadata();
  v13 = sub_2355C8E50();
  MEMORY[0x23B7CFBF8](v5, v13);
  sub_2355C8DE4();
  sub_2355C8820();
  swift_getTupleTypeMetadata2();
  v14 = sub_2355C8E50();
  MEMORY[0x23B7CFBF8](v5, v14);
  v15 = sub_2355C8D90();
  v16 = MEMORY[0x23B7CFBF8](v7, v15);
  v48 = v15;
  v58 = v15;
  v59 = v16;
  v52 = v16;
  v17 = MEMORY[0x23B7CFBA4](0, &v58, v8, 0);
  v42 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v42 - v21;
  v23 = sub_2355C8994();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v42 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_2355C89D0();
  v46 = *(_QWORD *)(v27 - 8);
  v47 = v27;
  MEMORY[0x24BDAC7A8](v27);
  v51 = (uint64_t)&v42 - v28;
  sub_23559D9EC((uint64_t)v26);
  v29 = sub_2355C8988();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
  v30 = MEMORY[0x24BDECC60];
  if ((v29 & 1) != 0)
  {
    sub_2355AF570(a1, (uint64_t)v20);
    v31 = v48;
    v58 = v48;
    v59 = v52;
    swift_getOpaqueTypeConformance2();
    sub_2355C82E4((uint64_t)v20, v17, (uint64_t)v22);
    v32 = *(void (**)(char *, uint64_t))(v42 + 8);
    v32(v20, v17);
    sub_2355C4BF4((uint64_t)v22, v17, (uint64_t)v20);
    v33 = v49;
    v58 = v49;
    v59 = v53;
    v54[0] = swift_getOpaqueTypeConformance2();
    v54[1] = v30;
    MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v9, v54);
    sub_2355C4C0C((uint64_t)v20, v17);
    v32(v20, v17);
    v32(v22, v17);
  }
  else
  {
    v34 = v45;
    sub_2355AF908(a1, v45);
    v33 = v49;
    v58 = v49;
    v59 = v53;
    v57[0] = swift_getOpaqueTypeConformance2();
    v57[1] = v30;
    MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v9, v57);
    v35 = v44;
    sub_2355C82E4(v34, v9, v44);
    v36 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
    v36(v34, v9);
    sub_2355C4BF4(v35, v9, v34);
    v31 = v48;
    v58 = v48;
    v59 = v52;
    swift_getOpaqueTypeConformance2();
    sub_2355C4CD0(v34, v17, v9);
    v36(v34, v9);
    v36(v35, v9);
  }
  v58 = v31;
  v59 = v52;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v58 = v33;
  v59 = v53;
  v56[0] = swift_getOpaqueTypeConformance2();
  v56[1] = v30;
  v38 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v9, v56);
  v55[0] = OpaqueTypeConformance2;
  v55[1] = v38;
  v39 = v47;
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v47, v55);
  v40 = v51;
  sub_2355C4BF4(v51, v39, v50);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v46 + 8))(v40, v39);
}

uint64_t sub_2355AF570@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
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

  v26 = a1;
  v31 = a2;
  v3 = sub_2355C8A48();
  v29 = *(_QWORD *)(v3 - 8);
  v30 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v28 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = *(_QWORD *)(a1 + 16);
  sub_2355C8AB4();
  sub_2355C8820();
  sub_2355C8820();
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  sub_2355C8820();
  sub_2355C89D0();
  v35 = sub_2355C8820();
  v36 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249AF0);
  v37 = type metadata accessor for OfferView();
  v38 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249AF8);
  swift_getTupleTypeMetadata();
  v5 = sub_2355C8E50();
  v6 = MEMORY[0x24BDF5428];
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDF5428], v5);
  sub_2355C8DE4();
  sub_2355C8820();
  swift_getTupleTypeMetadata2();
  v7 = sub_2355C8E50();
  MEMORY[0x23B7CFBF8](v6, v7);
  v8 = sub_2355C8D90();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v24 - v10;
  v12 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF4498], v8);
  v35 = v8;
  v36 = v12;
  v13 = MEMORY[0x23B7CFBA4](0, &v35, MEMORY[0x24BDF2F10], 0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v24 - v18;
  v20 = *(_QWORD *)(v26 + 24);
  v32 = v25;
  v33 = v20;
  v34 = v27;
  sub_2355C8940();
  sub_2355C8D84();
  v21 = v28;
  sub_2355C8A3C();
  sub_2355C8C4C();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v21, v30);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v35 = v8;
  v36 = v12;
  swift_getOpaqueTypeConformance2();
  sub_2355C82E4((uint64_t)v17, v13, (uint64_t)v19);
  v22 = *(void (**)(char *, uint64_t))(v14 + 8);
  v22(v17, v13);
  sub_2355C4BF4((uint64_t)v19, v13, v31);
  return ((uint64_t (*)(char *, uint64_t))v22)(v19, v13);
}

uint64_t sub_2355AF908@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
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

  v19 = a1;
  v23 = a2;
  v3 = sub_2355C8A48();
  v21 = *(_QWORD *)(v3 - 8);
  v22 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *(_QWORD *)(a1 + 16);
  sub_2355C8AB4();
  sub_2355C8820();
  sub_2355C8820();
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  sub_2355C8820();
  sub_2355C89D0();
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249AE8);
  swift_getTupleTypeMetadata3();
  v6 = sub_2355C8E50();
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDF5428], v6);
  v7 = sub_2355C8D90();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v18 - v9;
  v11 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF4498], v7);
  v27 = v7;
  v28 = v11;
  v12 = MEMORY[0x23B7CFBA4](0, &v27, MEMORY[0x24BDF2F10], 0);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v18 - v14;
  sub_2355C8934();
  v16 = *(_QWORD *)(v19 + 24);
  v24 = v18;
  v25 = v16;
  v26 = v20;
  sub_2355C8D84();
  sub_2355C8A3C();
  sub_2355C8C4C();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v22);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_2355C8AF0();
  v27 = v7;
  v28 = v11;
  swift_getOpaqueTypeConformance2();
  sub_2355C8C94();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_2355AFBEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47[16];
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[3];

  v46 = a2;
  v3 = *(_QWORD *)(a1 + 16);
  sub_2355C8AB4();
  v37 = v3;
  v4 = sub_2355C8820();
  v39 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v35 - v5;
  v7 = sub_2355C8820();
  v40 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v35 - v8;
  v10 = sub_2355C8820();
  v45 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v38 = (char *)&v35 - v11;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  v41 = sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  v42 = sub_2355C8820();
  v12 = sub_2355C89D0();
  v13 = *(_QWORD *)(v12 - 8);
  v43 = v12;
  v44 = v13;
  MEMORY[0x24BDAC7A8](v12);
  v36 = (uint64_t)&v35 - v14;
  v15 = *(_QWORD *)(a1 + 24);
  sub_2355C8C40();
  v16 = sub_235598144(&qword_256248EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
  v56[0] = v15;
  v56[1] = v16;
  v17 = MEMORY[0x24BDED308];
  v18 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v4, v56);
  sub_2355C8C64();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v6, v4);
  sub_2355C8E14();
  v19 = sub_235597B84();
  v55[0] = v18;
  v55[1] = v19;
  v20 = MEMORY[0x23B7CFBF8](v17, v7, v55);
  v21 = v38;
  sub_2355C8C70();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v9, v7);
  v22 = v35;
  v23 = v35 + *(int *)(a1 + 36);
  v24 = *(_QWORD *)v23;
  LOBYTE(v9) = *(_BYTE *)(v23 + 8);
  sub_23558C900(*(_QWORD *)v23, (char)v9);
  v25 = sub_23559D804(v24, (char)v9);
  sub_23558CA44(v24, (char)v9);
  v48 = v37;
  v49 = v15;
  v50 = v22;
  v54[0] = v20;
  v54[1] = MEMORY[0x24BDEBEE0];
  v26 = MEMORY[0x23B7CFBF8](v17, v10, v54);
  v27 = sub_23559867C(&qword_256248F08, &qword_256248EC0, MEMORY[0x24BDEB950]);
  v53[0] = v26;
  v53[1] = v27;
  v28 = MEMORY[0x23B7CFBF8](v17, v41, v53);
  v29 = sub_23559867C(&qword_256248F10, &qword_256248EC8, MEMORY[0x24BDEDC10]);
  v52[0] = v28;
  v52[1] = v29;
  v30 = v42;
  v31 = MEMORY[0x23B7CFBF8](v17, v42, v52);
  v32 = v36;
  sub_2355BF7EC(v25 & 1, (void (*)(uint64_t))sub_2355B4174, (uint64_t)v47, v10, v30, v26, v31, v36);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v21, v10);
  sub_2355C8AFC();
  v51[0] = v31;
  v51[1] = v26;
  v33 = v43;
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v43, v51);
  sub_2355C8C94();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v44 + 8))(v32, v33);
}

uint64_t sub_2355B0044@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64x2_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int8 *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(__int8 *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(void);
  char *v33;
  uint64_t v34;
  uint64_t (*v35)(void);
  int64x2_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  void (*v44)(char *, uint64_t);
  void *v45;
  char **v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(uint64_t, uint64_t);
  uint64_t v66;
  uint64_t v67;
  int64x2_t v68;
  char *v69;
  uint64_t v70;
  int64x2_t *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  __int128 v92;
  __int128 v93;
  uint64_t v94;

  v67 = a4;
  v70 = a3;
  v76 = a2;
  v72 = a1;
  v86 = a5;
  v77 = sub_2355C870C();
  v75 = *(_QWORD *)(v77 - 8);
  v6 = MEMORY[0x24BDAC7A8](v77);
  v74 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v73 = (uint64_t)&v66 - v8;
  v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248FD0);
  MEMORY[0x24BDAC7A8](v85);
  v78 = (uint64_t)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2355C882C();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v71 = (int64x2_t *)((char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v11);
  v14 = (int64x2_t *)((char *)&v66 - v13);
  sub_2355C8AB4();
  v15 = sub_2355C8820();
  v16 = sub_2355C8820();
  v17 = sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  v18 = sub_2355C8820();
  v83 = *(_QWORD *)(v18 - 8);
  v80 = v18;
  MEMORY[0x24BDAC7A8](v18);
  v69 = (char *)&v66 - v19;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  v82 = sub_2355C8820();
  v84 = *(_QWORD *)(v82 - 8);
  v20 = MEMORY[0x24BDAC7A8](v82);
  v79 = (char *)&v66 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v81 = (uint64_t)&v66 - v22;
  v23 = &v14->i8[*(int *)(v10 + 20)];
  v24 = *MEMORY[0x24BDEEB68];
  v25 = sub_2355C8964();
  v26 = *(void (**)(__int8 *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 104);
  v26(v23, v24, v25);
  v68 = vdupq_n_s64(0x4039D00000000000uLL);
  *v14 = v68;
  v27 = sub_235598144(&qword_256248EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
  v91[0] = a4;
  v91[1] = v27;
  v28 = MEMORY[0x24BDED308];
  v29 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v15, v91);
  v30 = sub_235597B84();
  v90[0] = v29;
  v90[1] = v30;
  v89[0] = MEMORY[0x23B7CFBF8](v28, v16, v90);
  v89[1] = MEMORY[0x24BDEBEE0];
  v31 = MEMORY[0x23B7CFBF8](v28, v17, v89);
  v32 = MEMORY[0x24BDED998];
  sub_235598144(&qword_256248FD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDED998], MEMORY[0x24BDED990]);
  v33 = v69;
  sub_2355C8CA0();
  v34 = (uint64_t)v14;
  v35 = v32;
  sub_23558DF78(v34, (uint64_t (*)(_QWORD))v32);
  v36 = v71;
  v26(&v71->i8[*(int *)(v10 + 20)], v24, v25);
  *v36 = v68;
  v37 = (uint64_t)v36;
  type metadata accessor for HeaderManagedAppCell(0, v70, v67, v38);
  v39 = v73;
  sub_23559D9BC(v73);
  v40 = v75;
  v41 = v74;
  v42 = v77;
  (*(void (**)(char *, _QWORD, uint64_t))(v75 + 104))(v74, *MEMORY[0x24BDEB400], v77);
  v43 = v41;
  LOBYTE(v41) = sub_2355C8700();
  v44 = *(void (**)(char *, uint64_t))(v40 + 8);
  v44(v43, v42);
  v44((char *)v39, v42);
  v45 = (void *)objc_opt_self();
  v46 = &selRef_systemGray6Color;
  if ((v41 & 1) == 0)
    v46 = &selRef_secondarySystemFillColor;
  v47 = MEMORY[0x23B7CF22C](objc_msgSend(v45, *v46));
  sub_2355C8724();
  v48 = v78;
  sub_235598184(v37, v78, (uint64_t (*)(_QWORD))v35);
  v49 = v48 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256248FE0) + 36);
  v50 = v93;
  *(_OWORD *)v49 = v92;
  *(_OWORD *)(v49 + 16) = v50;
  *(_QWORD *)(v49 + 32) = v94;
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248FE8);
  *(_QWORD *)(v48 + *(int *)(v51 + 52)) = v47;
  *(_WORD *)(v48 + *(int *)(v51 + 56)) = 256;
  v52 = sub_2355C8E14();
  v54 = v53;
  v55 = (uint64_t *)(v48 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256248FF0) + 36));
  *v55 = v52;
  v55[1] = v54;
  sub_23558DF78(v37, (uint64_t (*)(_QWORD))v35);
  sub_2355C8E14();
  v56 = sub_23559867C(&qword_256248F08, &qword_256248EC0, MEMORY[0x24BDEB950]);
  v88[0] = v31;
  v88[1] = v56;
  v57 = MEMORY[0x24BDED308];
  v58 = v80;
  v59 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v80, v88);
  sub_23559867C(&qword_256248FF8, &qword_256248FD0, MEMORY[0x24BDED500]);
  v60 = (uint64_t)v79;
  sub_2355C8C88();
  sub_23558E470(v48, &qword_256248FD0);
  (*(void (**)(char *, uint64_t))(v83 + 8))(v33, v58);
  v61 = sub_23559867C(&qword_256248F10, &qword_256248EC8, MEMORY[0x24BDEDC10]);
  v87[0] = v59;
  v87[1] = v61;
  v62 = v82;
  MEMORY[0x23B7CFBF8](v57, v82, v87);
  v63 = v81;
  sub_2355C82E4(v60, v62, v81);
  v64 = *(void (**)(uint64_t, uint64_t))(v84 + 8);
  v64(v60, v62);
  sub_2355C4BF4(v63, v62, v86);
  return ((uint64_t (*)(uint64_t, uint64_t))v64)(v63, v62);
}

uint64_t sub_2355B06FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;

  type metadata accessor for ManagedAppCellContext(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a4);
  sub_2355C8B50();
  v4 = sub_2355C8BBC();
  v6 = v5;
  v8 = v7;
  swift_release();
  swift_getKeyPath();
  sub_2355C8B2C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249338);
  sub_23559F808();
  sub_2355C8BF8();
  sub_235591958(v4, v6, v8 & 1);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2355B0818@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t KeyPath;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;

  v5 = (uint64_t *)(v3
                 + *(int *)(type metadata accessor for ManagedAppCellContext(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2)+ 40));
  v6 = *v5;
  v7 = v5[1];
  v8 = v5[2];
  v9 = v5[3];
  sub_235597D54(*v5, v7, v8, v9);
  v10 = sub_2355C8B08();
  KeyPath = swift_getKeyPath();
  v12 = swift_getKeyPath();
  v13 = sub_2355C8AE4();
  sub_2355C86F4();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  result = sub_2355C89F4();
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v7;
  *(_QWORD *)(a3 + 16) = v8;
  *(_QWORD *)(a3 + 24) = v9;
  *(_QWORD *)(a3 + 32) = KeyPath;
  *(_QWORD *)(a3 + 40) = v10;
  *(_QWORD *)(a3 + 48) = v12;
  *(_QWORD *)(a3 + 56) = 2;
  *(_BYTE *)(a3 + 64) = 0;
  *(_BYTE *)(a3 + 72) = v13;
  *(_QWORD *)(a3 + 80) = v15;
  *(_QWORD *)(a3 + 88) = v17;
  *(_QWORD *)(a3 + 96) = v19;
  *(_QWORD *)(a3 + 104) = v21;
  *(_BYTE *)(a3 + 112) = 0;
  *(_DWORD *)(a3 + 116) = result;
  return result;
}

__n128 sub_2355B090C@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  void (*v20)(_BYTE *, uint64_t);
  uint64_t v21;
  uint64_t KeyPath;
  int v23;
  char v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __n128 result;
  _BYTE v35[12];
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _OWORD v40[10];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248FA8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v35[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_2355C8994();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = (uint64_t *)(v2
                  + *(int *)(type metadata accessor for ManagedAppCellContext(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), v12)+ 44));
  v14 = v13[1];
  v15 = v13[2];
  v16 = v13[3];
  v39 = *v13;
  v38 = v14;
  v17 = v15;
  v18 = v16;
  sub_235597D54(v39, v14, v15, v16);
  sub_23559D9EC((uint64_t)v11);
  v19 = sub_2355C8988();
  v20 = *(void (**)(_BYTE *, uint64_t))(v9 + 8);
  v20(v11, v8);
  if ((v19 & 1) != 0)
  {
    v37 = sub_2355C8B74();
  }
  else
  {
    v21 = sub_2355C8B20();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v7, 1, 1, v21);
    v37 = sub_2355C8B44();
    sub_23558E470((uint64_t)v7, &qword_256248FA8);
  }
  KeyPath = swift_getKeyPath();
  v23 = sub_2355C89F4();
  sub_23559D9EC((uint64_t)v11);
  v24 = sub_2355C8988();
  v20(v11, v8);
  v36 = v24 & 1;
  if ((v24 & 1) != 0)
    v25 = 0.0;
  else
    v25 = 80.0;
  v26 = v39;
  v27 = v38;
  v42 = v39;
  v43 = v38;
  v44 = v17;
  v45 = v18;
  v46 = KeyPath;
  v47 = v37;
  v48 = v23;
  sub_2355C8E14();
  sub_2355BFBF8(0.0, 1, 0.0, 1, v25, v36, 0.0, 1, (uint64_t)v40, 0.0, 1, 0.0, 1);
  sub_235597C94(v26, v27, v17, v18);
  swift_release();
  swift_release();
  v28 = swift_getKeyPath();
  v29 = v40[9];
  *(_OWORD *)(a2 + 128) = v40[8];
  *(_OWORD *)(a2 + 144) = v29;
  v30 = v41;
  v31 = v40[5];
  *(_OWORD *)(a2 + 64) = v40[4];
  *(_OWORD *)(a2 + 80) = v31;
  v32 = v40[7];
  *(_OWORD *)(a2 + 96) = v40[6];
  *(_OWORD *)(a2 + 112) = v32;
  v33 = v40[1];
  *(_OWORD *)a2 = v40[0];
  *(_OWORD *)(a2 + 16) = v33;
  result = (__n128)v40[3];
  *(_OWORD *)(a2 + 32) = v40[2];
  *(__n128 *)(a2 + 48) = result;
  *(_QWORD *)(a2 + 160) = v30;
  *(_QWORD *)(a2 + 168) = v28;
  *(_QWORD *)(a2 + 176) = 2;
  *(_BYTE *)(a2 + 184) = 0;
  return result;
}

uint64_t sub_2355B0BEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t KeyPath;
  uint64_t result;

  v5 = (uint64_t *)(v3
                 + *(int *)(type metadata accessor for ManagedAppCellContext(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2)+ 48));
  v6 = *v5;
  v7 = v5[1];
  v8 = v5[2];
  v9 = v5[3];
  sub_235597D54(*v5, v7, v8, v9);
  v10 = sub_2355C8B14();
  KeyPath = swift_getKeyPath();
  result = sub_2355C89E8();
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v7;
  *(_QWORD *)(a3 + 16) = v8;
  *(_QWORD *)(a3 + 24) = v9;
  *(_QWORD *)(a3 + 32) = KeyPath;
  *(_QWORD *)(a3 + 40) = v10;
  *(_DWORD *)(a3 + 48) = result;
  return result;
}

uint64_t sub_2355B0C7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  char *v39;
  uint64_t v40;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  _QWORD v55[3];
  uint64_t v56;
  char v57;
  uint64_t v58[3];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[2];

  v51 = a1;
  v50 = a4;
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249AE8);
  v6 = MEMORY[0x24BDAC7A8](v49);
  v48 = (uint64_t)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v47 = (char **)((char *)&v42 - v8);
  sub_2355C8AB4();
  v45 = a2;
  v9 = sub_2355C8820();
  v10 = sub_2355C8820();
  v11 = sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  v12 = sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  v13 = sub_2355C8820();
  v44 = sub_2355C89D0();
  v14 = sub_2355C8820();
  v46 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v42 - v18;
  v42 = (char *)&v42 - v18;
  v43 = a3;
  v21 = type metadata accessor for HeaderManagedAppCell(0, a2, a3, v20);
  sub_2355AFBEC(v21, (uint64_t)v17);
  v22 = sub_235598144(&qword_256248EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
  v65[0] = a3;
  v65[1] = v22;
  v23 = MEMORY[0x24BDED308];
  v24 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v9, v65);
  v25 = sub_235597B84();
  v64[0] = v24;
  v64[1] = v25;
  v63[0] = MEMORY[0x23B7CFBF8](v23, v10, v64);
  v63[1] = MEMORY[0x24BDEBEE0];
  v26 = MEMORY[0x23B7CFBF8](v23, v11, v63);
  v27 = sub_23559867C(&qword_256248F08, &qword_256248EC0, MEMORY[0x24BDEB950]);
  v62[0] = v26;
  v62[1] = v27;
  v28 = MEMORY[0x23B7CFBF8](v23, v12, v62);
  v29 = sub_23559867C(&qword_256248F10, &qword_256248EC8, MEMORY[0x24BDEDC10]);
  v61[0] = v28;
  v61[1] = v29;
  v60[0] = MEMORY[0x23B7CFBF8](v23, v13, v61);
  v60[1] = v26;
  v59[0] = MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v44, v60);
  v59[1] = MEMORY[0x24BDECC60];
  v30 = MEMORY[0x23B7CFBF8](v23, v14, v59);
  sub_2355C82E4((uint64_t)v17, v14, (uint64_t)v19);
  v31 = v46;
  v32 = *(void (**)(char *, uint64_t))(v46 + 8);
  v32(v17, v14);
  v33 = (_QWORD *)swift_allocObject();
  v34 = v45;
  v35 = v43;
  v33[2] = v45;
  v33[3] = v35;
  v33[4] = 0x405D800000000000;
  v36 = (uint64_t)v47;
  *v47 = 0x405D800000000000;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249AE8);
  sub_2355B111C(v51, v34, v35, v36 + *(int *)(v37 + 44));
  swift_release();
  v38 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
  v39 = v42;
  v38(v17, v42, v14);
  v58[0] = (uint64_t)v17;
  v40 = v48;
  sub_2355986BC(v36, v48, &qword_256249AE8);
  v56 = 0;
  v57 = 1;
  v58[1] = v40;
  v58[2] = (uint64_t)&v56;
  v55[0] = v14;
  v55[1] = v49;
  v55[2] = MEMORY[0x24BDF4638];
  v52 = v30;
  v53 = sub_2355B418C();
  v54 = MEMORY[0x24BDF4610];
  sub_2355B91C0(v58, 3uLL, (uint64_t)v55);
  sub_23558E470(v36, &qword_256249AE8);
  v32(v39, v14);
  sub_23558E470(v40, &qword_256249AE8);
  return ((uint64_t (*)(char *, uint64_t))v32)(v17, v14);
}

uint64_t sub_2355B111C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
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
  uint64_t v46;

  v45 = a2;
  v46 = a3;
  v43 = a4;
  v44 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249B98);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v42 = (uint64_t)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v39 - v7;
  v9 = sub_2355C8A48();
  v40 = *(_QWORD *)(v9 - 8);
  v41 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249BA0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249BA8);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249BB0);
  v19 = MEMORY[0x24BDAC7A8](v39);
  v21 = (char *)&v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v39 - v22;
  *(_QWORD *)v14 = sub_2355C89AC();
  *((_QWORD *)v14 + 1) = 0;
  v14[16] = 0;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249BB8);
  sub_2355B148C(v45, v46, &v14[*(int *)(v24 + 44)]);
  sub_2355C8A30();
  sub_23559867C(&qword_256249BC0, &qword_256249BA0, MEMORY[0x24BDF4700]);
  sub_2355C8C4C();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v41);
  sub_23558E470((uint64_t)v14, &qword_256249BA0);
  LOBYTE(v14) = sub_2355C8AF0();
  sub_2355C86F4();
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v21, v18, v15);
  v33 = &v21[*(int *)(v39 + 36)];
  *v33 = (char)v14;
  *((_QWORD *)v33 + 1) = v26;
  *((_QWORD *)v33 + 2) = v28;
  *((_QWORD *)v33 + 3) = v30;
  *((_QWORD *)v33 + 4) = v32;
  v33[40] = 0;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  sub_235598700((uint64_t)v21, (uint64_t)v23, &qword_256249BB0);
  *(_QWORD *)v8 = sub_2355C8940();
  *((_QWORD *)v8 + 1) = 0x4020000000000000;
  v8[16] = 0;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249BC8);
  sub_2355B1854(v45, v46, (uint64_t)&v8[*(int *)(v34 + 44)]);
  sub_2355986BC((uint64_t)v23, (uint64_t)v21, &qword_256249BB0);
  v35 = v42;
  sub_2355986BC((uint64_t)v8, v42, &qword_256249B98);
  v36 = v43;
  sub_2355986BC((uint64_t)v21, v43, &qword_256249BB0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249BD0);
  sub_2355986BC(v35, v36 + *(int *)(v37 + 48), &qword_256249B98);
  sub_23558E470((uint64_t)v8, &qword_256249B98);
  sub_23558E470((uint64_t)v23, &qword_256249BB0);
  sub_23558E470(v35, &qword_256249B98);
  return sub_23558E470((uint64_t)v21, &qword_256249BB0);
}

uint64_t sub_2355B148C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char *a3@<X8>)
{
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  int v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
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
  unsigned __int8 v78;
  unsigned __int8 v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unsigned __int8 v84;
  int v85;

  v62 = a3;
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249B60);
  v5 = *(_QWORD *)(v68 - 8);
  v6 = MEMORY[0x24BDAC7A8](v68);
  v66 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v46 - v8;
  v11 = type metadata accessor for HeaderManagedAppCell(0, a1, a2, v10);
  v12 = v9;
  sub_2355B06FC(v11, v13, v14, v15);
  sub_2355B0818(v11, v16, (uint64_t)&v70);
  v63 = v70;
  v17 = v73;
  v64 = v71;
  v65 = v72;
  v69 = v74;
  v67 = v75;
  v60 = v76;
  v58 = v77;
  v57 = v78;
  v56 = v79;
  v55 = v80;
  v54 = v81;
  v53 = v82;
  v52 = v83;
  v51 = v84;
  v50 = v85;
  v19 = type metadata accessor for ManagedAppCellContext(0, a1, a2, v18);
  if (sub_2355BF64C(v19))
  {
    sub_2355B0BEC(v11, v20, (uint64_t)&v70);
    v21 = v71;
    v61 = v70;
    v23 = v72;
    v22 = v73;
    v25 = v74;
    v24 = v75;
    v59 = v76;
  }
  else
  {
    v61 = 0;
    v21 = 0;
    v23 = 0;
    v22 = 0;
    v25 = 0;
    v24 = 0;
    v59 = 0;
  }
  v49 = v5;
  v26 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v27 = v66;
  v48 = v12;
  v28 = v12;
  v29 = v68;
  v26(v66, v28, v68);
  v30 = v62;
  v26(v62, v27, v29);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249BE0);
  v32 = &v30[*(int *)(v31 + 48)];
  v33 = v63;
  v34 = v64;
  *(_QWORD *)v32 = v63;
  *((_QWORD *)v32 + 1) = v34;
  v35 = v34;
  LOBYTE(v34) = v65;
  *((_QWORD *)v32 + 2) = v65;
  *((_QWORD *)v32 + 3) = v17;
  v36 = v34;
  v47 = v17;
  v37 = v67;
  *((_QWORD *)v32 + 4) = v69;
  *((_QWORD *)v32 + 5) = v37;
  v38 = v58;
  *((_QWORD *)v32 + 6) = v60;
  *((_QWORD *)v32 + 7) = v38;
  v32[64] = v57;
  v32[72] = v56;
  v39 = v54;
  *((_QWORD *)v32 + 10) = v55;
  *((_QWORD *)v32 + 11) = v39;
  v40 = v52;
  *((_QWORD *)v32 + 12) = v53;
  *((_QWORD *)v32 + 13) = v40;
  v32[112] = v51;
  *((_DWORD *)v32 + 29) = v50;
  v41 = &v30[*(int *)(v31 + 64)];
  v42 = v61;
  *(_QWORD *)v41 = v61;
  *((_QWORD *)v41 + 1) = v21;
  *((_QWORD *)v41 + 2) = v23;
  *((_QWORD *)v41 + 3) = v22;
  *((_QWORD *)v41 + 4) = v25;
  *((_QWORD *)v41 + 5) = v24;
  *((_DWORD *)v41 + 12) = v59;
  sub_235597D54(v33, v35, v36, v17);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2355B4104(v42, v21, v23, v22, v25);
  v43 = *(void (**)(char *, uint64_t))(v49 + 8);
  v44 = v68;
  v43(v48, v68);
  sub_2355B413C(v42, v21, v23, v22, v25);
  sub_235597C94(v63, v64, v65, v47);
  swift_release();
  swift_release();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v43)(v66, v44);
}

uint64_t sub_2355B1854@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[192];
  _OWORD v25[10];
  _OWORD v26[2];
  _OWORD v27[10];
  _OWORD v28[2];
  _BYTE v29[200];

  v23 = a3;
  v5 = type metadata accessor for OfferView();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249058);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v22 - v12;
  v15 = type metadata accessor for HeaderManagedAppCell(0, a1, a2, v14);
  sub_235595CA8(v15, v16, (uint64_t)v7);
  sub_235598184((uint64_t)v7, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for OfferView);
  *(_QWORD *)&v11[*(int *)(v8 + 36)] = 0x3FF0000000000000;
  sub_23558DF78((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for OfferView);
  sub_235598700((uint64_t)v11, (uint64_t)v13, &qword_256249058);
  v18 = type metadata accessor for ManagedAppCellContext(0, a1, a2, v17);
  if (sub_2355BF664(v18))
  {
    sub_2355B090C(v15, (uint64_t)v25);
    v27[8] = v25[8];
    v27[9] = v25[9];
    v28[0] = v26[0];
    *(_OWORD *)((char *)v28 + 9) = *(_OWORD *)((char *)v26 + 9);
    v27[4] = v25[4];
    v27[5] = v25[5];
    v27[6] = v25[6];
    v27[7] = v25[7];
    v27[0] = v25[0];
    v27[1] = v25[1];
    v27[2] = v25[2];
    v27[3] = v25[3];
    nullsub_1(v27);
  }
  else
  {
    sub_2355B3DEC(v27);
  }
  sub_235598700((uint64_t)v27, (uint64_t)v29, &qword_256249AF8);
  sub_2355986BC((uint64_t)v13, (uint64_t)v11, &qword_256249058);
  sub_235598700((uint64_t)v29, (uint64_t)v24, &qword_256249AF8);
  v19 = v23;
  sub_2355986BC((uint64_t)v11, v23, &qword_256249058);
  v20 = v19 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256249BD8) + 48);
  sub_235598700((uint64_t)v24, (uint64_t)v25, &qword_256249AF8);
  sub_235598700((uint64_t)v25, v20, &qword_256249AF8);
  sub_2355B4034((uint64_t)v25, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2355B3E10);
  sub_23558E470((uint64_t)v13, &qword_256249058);
  sub_235598700((uint64_t)v24, (uint64_t)v27, &qword_256249AF8);
  sub_2355B4034((uint64_t)v27, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2355B40A8);
  return sub_23558E470((uint64_t)v11, &qword_256249058);
}

uint64_t sub_2355B1AE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
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
  _QWORD v34[2];
  uint64_t v35;
  char v36;
  _QWORD v37[2];
  char *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  v27 = a3;
  v28 = a4;
  sub_2355C8AB4();
  sub_2355C8820();
  sub_2355C8820();
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  sub_2355C8820();
  sub_2355C89D0();
  v38 = (char *)sub_2355C8820();
  v39 = (uint64_t *)__swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249AF0);
  v40 = type metadata accessor for OfferView();
  v41 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249AF8);
  swift_getTupleTypeMetadata();
  v6 = sub_2355C8E50();
  v23 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF5428], v6);
  v7 = sub_2355C8DE4();
  v25 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v23 - v8;
  v10 = sub_2355C8820();
  v26 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v24 = (uint64_t)&v23 - v14;
  sub_2355C89AC();
  v15 = v27;
  type metadata accessor for HeaderManagedAppCell(0, a2, v27, v16);
  __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  sub_2355C8748();
  v29 = a2;
  v30 = v15;
  v31 = a1;
  sub_2355C8DD8();
  sub_2355C8AF0();
  v17 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF4700], v7);
  sub_2355C8C94();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v7);
  v37[0] = v17;
  v37[1] = MEMORY[0x24BDECC60];
  v18 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v10, v37);
  v19 = v24;
  sub_2355C82E4((uint64_t)v13, v10, v24);
  v20 = v26;
  v21 = *(void (**)(char *, uint64_t))(v26 + 8);
  v21(v13, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v13, v19, v10);
  v35 = 0;
  v36 = 0;
  v38 = v13;
  v39 = &v35;
  v34[0] = v10;
  v34[1] = MEMORY[0x24BDF4638];
  v32 = v18;
  v33 = MEMORY[0x24BDF4610];
  sub_2355B91C0((uint64_t *)&v38, 2uLL, (uint64_t)v34);
  v21((char *)v19, v10);
  return ((uint64_t (*)(char *, uint64_t))v21)(v13, v10);
}

uint64_t sub_2355B1E68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(char *, char *, uint64_t);
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t);
  uint64_t (*v69)(uint64_t, uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t *v78;
  char *v79;
  char *v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t OpaqueTypeConformance2;
  uint64_t v99;
  unint64_t v100;
  _QWORD v101[4];
  _OWORD v102[10];
  _OWORD v103[2];
  uint64_t v104[4];
  _OWORD v105[10];
  _OWORD v106[2];
  _QWORD v107[2];
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[2];
  _QWORD v113[2];
  uint64_t v114[2];
  char v115;

  v93 = a1;
  v89 = a4;
  v87 = type metadata accessor for OfferView();
  v6 = MEMORY[0x24BDAC7A8](v87);
  v90 = (uint64_t)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v76 = (char *)&v71 - v8;
  v9 = sub_2355C8A48();
  v83 = *(_QWORD *)(v9 - 8);
  v84 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v80 = (char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249B00);
  MEMORY[0x24BDAC7A8](v95);
  v78 = (uint64_t *)((char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249AF0);
  v92 = *(_QWORD *)(v96 - 8);
  v12 = MEMORY[0x24BDAC7A8](v96);
  v88 = (char *)&v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v79 = (char *)&v71 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v91 = (char *)&v71 - v16;
  sub_2355C8AB4();
  v74 = a2;
  v17 = sub_2355C8820();
  v82 = sub_2355C8820();
  v18 = sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  v85 = sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  v86 = sub_2355C8820();
  v94 = sub_2355C89D0();
  v19 = sub_2355C8820();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v71 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v71 - v24;
  v73 = a3;
  v27 = type metadata accessor for HeaderManagedAppCell(0, a2, a3, v26);
  sub_2355AFBEC(v27, (uint64_t)v23);
  v28 = sub_235598144(&qword_256248EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
  v113[0] = a3;
  v113[1] = v28;
  v29 = MEMORY[0x24BDED308];
  v30 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v17, v113);
  v31 = sub_235597B84();
  v112[0] = v30;
  v112[1] = v31;
  v111[0] = MEMORY[0x23B7CFBF8](v29, v82, v112);
  v111[1] = MEMORY[0x24BDEBEE0];
  v32 = v18;
  v33 = (uint64_t)v76;
  v34 = MEMORY[0x23B7CFBF8](v29, v32, v111);
  v35 = sub_23559867C(&qword_256248F08, &qword_256248EC0, MEMORY[0x24BDEB950]);
  v110[0] = v34;
  v110[1] = v35;
  v36 = MEMORY[0x23B7CFBF8](v29, v85, v110);
  v37 = sub_23559867C(&qword_256248F10, &qword_256248EC8, MEMORY[0x24BDEDC10]);
  v109[0] = v36;
  v109[1] = v37;
  v108[0] = MEMORY[0x23B7CFBF8](v29, v86, v109);
  v108[1] = v34;
  v107[0] = MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v94, v108);
  v107[1] = MEMORY[0x24BDECC60];
  v38 = MEMORY[0x23B7CFBF8](v29, v19, v107);
  v94 = (uint64_t)v25;
  v77 = v38;
  sub_2355C82E4((uint64_t)v23, v19, (uint64_t)v25);
  v39 = *(uint64_t (**)(uint64_t, uint64_t))(v20 + 8);
  v85 = (uint64_t)v23;
  v86 = v19;
  v81 = v39;
  v82 = v20;
  v39((uint64_t)v23, v19);
  v40 = sub_2355C89AC();
  v72 = v27;
  v41 = v93;
  __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  sub_2355C8748();
  v42 = v114[0];
  v43 = (uint64_t)v78;
  *v78 = v40;
  *(_QWORD *)(v43 + 8) = v42;
  *(_BYTE *)(v43 + 16) = 0;
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249B08);
  v45 = v41;
  v47 = v73;
  v46 = v74;
  sub_2355B2610(v74, v73, v43 + *(int *)(v44 + 44));
  v48 = v80;
  sub_2355C8A30();
  v49 = sub_23559867C(&qword_256249B10, &qword_256249B00, MEMORY[0x24BDF4700]);
  v50 = v79;
  v75 = v49;
  sub_2355C8C4C();
  (*(void (**)(char *, uint64_t))(v83 + 8))(v48, v84);
  sub_23558E470(v43, &qword_256249B00);
  v51 = v92;
  (*(void (**)(char *, char *, uint64_t))(v92 + 32))(v91, v50, v96);
  v53 = type metadata accessor for ManagedAppCellContext(0, v46, v47, v52);
  v54 = *(int *)(v53 + 56);
  v55 = v45 + *(int *)(v53 + 52);
  v56 = *(_QWORD *)(v55 + 8);
  v57 = *(_BYTE *)(v55 + 16);
  v114[0] = *(_QWORD *)v55;
  v114[1] = v56;
  v115 = v57;
  v58 = *(_QWORD *)(v45 + v54);
  v59 = *(_QWORD *)(v45 + v54 + 8);
  sub_235591504(v114[0], v56, v57);
  swift_retain();
  v60 = v33;
  OfferView.init(offerState:action:)((uint64_t)v114, v58, v59, v33);
  if (sub_2355BF664(v53))
  {
    sub_2355B090C(v72, (uint64_t)v102);
    v105[8] = v102[8];
    v105[9] = v102[9];
    v106[0] = v103[0];
    *(_OWORD *)((char *)v106 + 9) = *(_OWORD *)((char *)v103 + 9);
    v105[4] = v102[4];
    v105[5] = v102[5];
    v105[6] = v102[6];
    v105[7] = v102[7];
    v105[0] = v102[0];
    v105[1] = v102[1];
    v105[2] = v102[2];
    v105[3] = v102[3];
    nullsub_1(v105);
  }
  else
  {
    sub_2355B3DEC(v105);
  }
  sub_235598700((uint64_t)v105, (uint64_t)v114, &qword_256249AF8);
  v62 = v85;
  v61 = v86;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v82 + 16))(v85, v94, v86);
  v104[0] = v62;
  v63 = *(void (**)(char *, char *, uint64_t))(v51 + 16);
  v64 = (uint64_t)v88;
  v65 = v91;
  v66 = v96;
  v63(v88, v91, v96);
  v104[1] = v64;
  v67 = v90;
  sub_235598184(v60, v90, (uint64_t (*)(_QWORD))type metadata accessor for OfferView);
  v104[2] = v67;
  sub_235598700((uint64_t)v114, (uint64_t)v102, &qword_256249AF8);
  v104[3] = (uint64_t)v102;
  sub_2355B4034((uint64_t)v114, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2355B3E10);
  v101[0] = v61;
  v101[1] = v66;
  v101[2] = v87;
  v101[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_256249AF8);
  v97 = v77;
  *(_QWORD *)&v105[0] = v95;
  *((_QWORD *)&v105[0] + 1) = v75;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v99 = sub_235598144(&qword_256248F28, (uint64_t (*)(uint64_t))type metadata accessor for OfferView, (uint64_t)&protocol conformance descriptor for OfferView);
  v100 = sub_2355B3E5C();
  sub_2355B91C0(v104, 4uLL, (uint64_t)v101);
  sub_2355B4034((uint64_t)v114, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2355B40A8);
  sub_23558DF78(v60, (uint64_t (*)(_QWORD))type metadata accessor for OfferView);
  v68 = *(void (**)(char *, uint64_t))(v92 + 8);
  v68(v65, v66);
  v69 = v81;
  v81(v94, v61);
  sub_235598700((uint64_t)v102, (uint64_t)v105, &qword_256249AF8);
  sub_2355B4034((uint64_t)v105, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2355B40A8);
  sub_23558DF78(v67, (uint64_t (*)(_QWORD))type metadata accessor for OfferView);
  v68((char *)v64, v66);
  return v69(v62, v61);
}

uint64_t sub_2355B2610@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  char *v24;
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
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  _DWORD v42[4];
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  int v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
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
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unsigned __int8 v74;
  unsigned __int8 v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  unsigned __int8 v79;
  int v80;

  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249B60);
  v6 = *(_QWORD *)(v58 - 8);
  v7 = MEMORY[0x24BDAC7A8](v58);
  v59 = (char *)v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v42 - v9;
  v12 = type metadata accessor for ManagedAppCellContext(0, a1, a2, v11);
  if (sub_2355BF64C(v12))
  {
    v14 = type metadata accessor for HeaderManagedAppCell(0, a1, a2, v13);
    sub_2355B0BEC(v14, v15, (uint64_t)&v66);
    v64 = v67;
    v65 = v66;
    v62 = v69;
    v63 = v68;
    v60 = v71;
    v61 = v70;
    v19 = v72;
  }
  else
  {
    v14 = type metadata accessor for HeaderManagedAppCell(0, a1, a2, v13);
    v64 = 0;
    v65 = 0;
    v62 = 0;
    v63 = 0;
    v60 = 0;
    v61 = 0;
    v19 = 0;
  }
  sub_2355B06FC(v14, v16, v17, v18);
  sub_2355B0818(v14, v20, (uint64_t)&v66);
  v45 = v66;
  v44 = v67;
  v21 = v69;
  v43 = v68;
  v47 = v70;
  v22 = v72;
  v46 = v71;
  v55 = v73;
  v54 = v74;
  v53 = v75;
  v52 = v76;
  v51 = v77;
  v50 = v78;
  v49 = v79;
  v48 = v80;
  v57 = v10;
  v56 = v6;
  v23 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v24 = v59;
  v25 = v58;
  v23(v59, v10, v58);
  v26 = v64;
  v27 = v65;
  *(_QWORD *)a3 = v65;
  *(_QWORD *)(a3 + 8) = v26;
  v65 = v27;
  v28 = v62;
  *(_QWORD *)(a3 + 16) = v63;
  *(_QWORD *)(a3 + 24) = v28;
  v29 = v60;
  v30 = v61;
  *(_QWORD *)(a3 + 32) = v61;
  *(_QWORD *)(a3 + 40) = v29;
  v61 = v30;
  v62 = v28;
  v42[3] = v19;
  *(_DWORD *)(a3 + 48) = v19;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249B68);
  v23((char *)(a3 + *(int *)(v31 + 48)), v24, v25);
  v32 = a3 + *(int *)(v31 + 64);
  v33 = v45;
  v34 = v44;
  *(_QWORD *)v32 = v45;
  *(_QWORD *)(v32 + 8) = v34;
  LOBYTE(v25) = v43;
  *(_QWORD *)(v32 + 16) = v43;
  *(_QWORD *)(v32 + 24) = v21;
  v35 = v46;
  *(_QWORD *)(v32 + 32) = v47;
  *(_QWORD *)(v32 + 40) = v35;
  v36 = v55;
  *(_QWORD *)(v32 + 48) = v22;
  *(_QWORD *)(v32 + 56) = v36;
  *(_BYTE *)(v32 + 64) = v54;
  *(_BYTE *)(v32 + 72) = v53;
  *(_OWORD *)(v32 + 80) = v52;
  v37 = v50;
  *(_QWORD *)(v32 + 96) = v51;
  *(_QWORD *)(v32 + 104) = v37;
  *(_BYTE *)(v32 + 112) = v49;
  *(_DWORD *)(v32 + 116) = v48;
  sub_2355B4104(v27, v64, v63, v28, v30);
  v38 = v33;
  sub_235597D54(v33, v34, v25, v21);
  v39 = *(void (**)(char *, uint64_t))(v56 + 8);
  swift_retain();
  swift_retain();
  swift_retain();
  v40 = v58;
  v39(v57, v58);
  sub_235597C94(v38, v34, v25, v21);
  swift_release();
  swift_release();
  swift_release();
  v39(v59, v40);
  return sub_2355B413C(v65, v64, v63, v62, v61);
}

uint64_t sub_2355B29E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;

  v9 = type metadata accessor for ManagedAppCellContext(0, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a5, a1, v9);
  v11 = (int *)type metadata accessor for HeaderManagedAppCell(0, a2, a3, v10);
  v12 = a5 + v11[9];
  *(_QWORD *)v12 = swift_getKeyPath();
  *(_BYTE *)(v12 + 8) = 0;
  v13 = (uint64_t *)(a5 + v11[10]);
  *v13 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249088);
  swift_storeEnumTagMultiPayload();
  v14 = (uint64_t *)(a5 + v11[11]);
  *v14 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249080);
  swift_storeEnumTagMultiPayload();
  v15 = (uint64_t *)(a5 + v11[12]);
  *v15 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249078);
  swift_storeEnumTagMultiPayload();
  sub_235593E88();
  return sub_2355C873C();
}

uint64_t sub_2355B2B3C(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  char v15;
  void (*v16)(_BYTE *, _QWORD);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double *v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t v32;
  double *v33;
  double v34;
  double v35;
  uint64_t v36;
  double *v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  _BYTE v46[32];
  uint64_t v47;

  v43 = a1;
  v44 = a3;
  v8 = sub_2355C879C();
  v42 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2355C87CC();
  sub_235598144(&qword_256249C10, (uint64_t (*)(uint64_t))MEMORY[0x24BDEC778], MEMORY[0x24BDEC7A0]);
  v11 = sub_2355C903C();
  v12 = MEMORY[0x24BEE4AF8];
  if (!v11)
    goto LABEL_9;
  v13 = v11;
  v47 = MEMORY[0x24BEE4AF8];
  sub_2355B4668(0, v11 & ~(v11 >> 63), 0);
  result = sub_2355C9030();
  if ((v13 & 0x8000000000000000) == 0)
  {
    v15 = a2 & 1;
    HIDWORD(v40) = a4 & 1;
    v41 = a5;
    do
    {
      v16 = (void (*)(_BYTE *, _QWORD))sub_2355C906C();
      v17 = v42;
      (*(void (**)(char *))(v42 + 16))(v10);
      v16(v46, 0);
      v46[0] = v15;
      v45 = BYTE4(v40);
      sub_2355C8784();
      v19 = v18;
      v21 = v20;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v8);
      v12 = v47;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2355B4668(0, *(_QWORD *)(v12 + 16) + 1, 1);
        v12 = v47;
      }
      v23 = *(_QWORD *)(v12 + 16);
      v22 = *(_QWORD *)(v12 + 24);
      if (v23 >= v22 >> 1)
      {
        sub_2355B4668(v22 > 1, v23 + 1, 1);
        v12 = v47;
      }
      *(_QWORD *)(v12 + 16) = v23 + 1;
      v24 = v12 + 16 * v23;
      *(_QWORD *)(v24 + 32) = v19;
      *(_QWORD *)(v24 + 40) = v21;
      sub_2355C9060();
      --v13;
    }
    while (v13);
LABEL_9:
    v25 = *(_QWORD *)(v12 + 16);
    if (!v25)
      return swift_bridgeObjectRelease();
    if (v25 == 1)
    {
      v26 = 0;
      v27 = 0.0;
    }
    else
    {
      v26 = v25 & 0x7FFFFFFFFFFFFFFELL;
      v28 = (double *)(v12 + 56);
      v27 = 0.0;
      v29 = v25 & 0x7FFFFFFFFFFFFFFELL;
      do
      {
        v30 = *(v28 - 2);
        v31 = *v28;
        v28 += 4;
        v27 = v27 + v30 + v31;
        v29 -= 2;
      }
      while (v29);
      if (v25 == v26)
      {
LABEL_18:
        v35 = *(double *)(v12 + 32);
        v36 = v25 - 1;
        if (v36)
        {
          v37 = (double *)(v12 + 48);
          do
          {
            v38 = *v37;
            v37 += 2;
            v39 = v38;
            if (v35 < v38)
              v35 = v39;
            --v36;
          }
          while (v36);
        }
        return swift_bridgeObjectRelease();
      }
    }
    v32 = v25 - v26;
    v33 = (double *)(v12 + 16 * v26 + 40);
    do
    {
      v34 = *v33;
      v33 += 2;
      v27 = v27 + v34;
      --v32;
    }
    while (v32);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_2355B2E18(uint64_t a1, int a2, char *a3, int a4, uint64_t a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, double a10)
{
  uint64_t v18;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(_BYTE *, _QWORD);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double *v54;
  uint64_t v55;
  double v56;
  double v57;
  uint64_t v58;
  double *v59;
  double v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  char v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  char v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(_BYTE *, _QWORD);
  char *v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  double v84;
  double v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  char *v92;
  char *v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  char *v99;
  char v100;
  _BYTE v101[32];
  uint64_t v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;

  v98 = a4;
  v94 = a2;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249BF8);
  MEMORY[0x24BDAC7A8](v18);
  v92 = (char *)&v84 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249C00);
  v89 = *(_QWORD *)(v88 - 8);
  MEMORY[0x24BDAC7A8](v88);
  v99 = (char *)&v84 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249C08);
  MEMORY[0x24BDAC7A8](v91);
  v90 = (char *)&v84 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = sub_2355C879C();
  v22 = *(_QWORD *)(v97 - 8);
  v23 = MEMORY[0x24BDAC7A8](v97);
  v87 = (char *)&v84 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v84 - v25;
  v27 = sub_2355C87CC();
  v28 = sub_235598144(&qword_256249C10, (uint64_t (*)(uint64_t))MEMORY[0x24BDEC778], MEMORY[0x24BDEC7A0]);
  v29 = sub_2355C903C();
  v30 = MEMORY[0x24BEE4AF8];
  v95 = v22;
  v96 = a1;
  if (v29)
  {
    v31 = v29;
    v102 = MEMORY[0x24BEE4AF8];
    sub_2355B4668(0, v29 & ~(v29 >> 63), 0);
    result = sub_2355C9030();
    if (v31 < 0)
    {
      __break(1u);
      return result;
    }
    v33 = a9;
    v34 = a5;
    v93 = a3;
    v35 = v95;
    do
    {
      v36 = v27;
      v37 = v34;
      v38 = v28;
      v39 = v36;
      v40 = v38;
      v41 = (void (*)(_BYTE *, _QWORD))sub_2355C906C();
      v42 = v97;
      (*(void (**)(char *))(v35 + 16))(v26);
      v41(v101, 0);
      v101[0] = v94 & 1;
      v100 = v98 & 1;
      sub_2355C8784();
      v44 = v43;
      v46 = v45;
      (*(void (**)(char *, uint64_t))(v35 + 8))(v26, v42);
      v30 = v102;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2355B4668(0, *(_QWORD *)(v30 + 16) + 1, 1);
        v30 = v102;
      }
      v48 = *(_QWORD *)(v30 + 16);
      v47 = *(_QWORD *)(v30 + 24);
      if (v48 >= v47 >> 1)
      {
        sub_2355B4668(v47 > 1, v48 + 1, 1);
        v30 = v102;
      }
      *(_QWORD *)(v30 + 16) = v48 + 1;
      v49 = v30 + 16 * v48;
      *(_QWORD *)(v49 + 32) = v44;
      *(_QWORD *)(v49 + 40) = v46;
      v34 = v37;
      v27 = v39;
      v28 = v40;
      sub_2355C9060();
      --v31;
    }
    while (v31);
    a9 = v33;
    a5 = v34;
  }
  v50 = *(_QWORD *)(v30 + 16);
  if (!v50)
  {
    v53 = 0.0;
    v51 = v95;
    goto LABEL_19;
  }
  v51 = v95;
  if (v50 == 1)
  {
    v52 = 0;
    v53 = 0.0;
LABEL_17:
    v58 = v50 - v52;
    v59 = (double *)(v30 + 16 * v52 + 40);
    do
    {
      v60 = *v59;
      v59 += 2;
      v53 = v53 + v60;
      --v58;
    }
    while (v58);
    goto LABEL_19;
  }
  v52 = v50 & 0x7FFFFFFFFFFFFFFELL;
  v54 = (double *)(v30 + 56);
  v53 = 0.0;
  v55 = v50 & 0x7FFFFFFFFFFFFFFELL;
  do
  {
    v56 = *(v54 - 2);
    v57 = *v54;
    v54 += 4;
    v53 = v53 + v56 + v57;
    v55 -= 2;
  }
  while (v55);
  if (v50 != v52)
    goto LABEL_17;
LABEL_19:
  v84 = v53;
  v85 = a10;
  v61 = v90;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v90, a5, v27);
  *(_QWORD *)&v61[*(int *)(v91 + 52)] = v30;
  v62 = sub_2355B35A0(1);
  v63 = *(_QWORD *)(v62 + 16);
  if (v63)
  {
    v86 = v28;
    v90 = (char *)v27;
    v91 = a5;
    v64 = (uint64_t)v99;
    v93 = &v99[*(int *)(v88 + 48)];
    v65 = (*(unsigned __int8 *)(v89 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v89 + 80);
    v88 = v62;
    v66 = v62 + v65;
    v67 = *(_QWORD *)(v89 + 72);
    v68 = 0.0;
    v69 = v94;
    v70 = v98;
    v71 = v51;
    v72 = v97;
    do
    {
      sub_2355986BC(v66, v64, &qword_256249C00);
      v73 = *((double *)v93 + 1);
      v103.origin.x = a6;
      v103.origin.y = a7;
      v103.size.width = a8;
      v103.size.height = a9;
      CGRectGetMinX(v103);
      v104.origin.x = a6;
      v104.origin.y = a7;
      v104.size.width = a8;
      v104.size.height = a9;
      CGRectGetMinY(v104);
      sub_2355C8E68();
      v101[0] = v69 & 1;
      LOBYTE(v102) = v70 & 1;
      sub_2355C8790();
      v64 = (uint64_t)v99;
      (*(void (**)(char *, uint64_t))(v71 + 8))(v99, v72);
      v68 = v68 + v73;
      v66 += v67;
      --v63;
    }
    while (v63);
    swift_bridgeObjectRelease();
    v51 = v71;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v74 = sub_2355C9048();
  v75 = v98;
  v76 = v97;
  v77 = (uint64_t)v92;
  if ((v74 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v51 + 56))(v92, 1, 1, v97);
    return sub_23558E470(v77, &qword_256249BF8);
  }
  sub_2355C9054();
  sub_235598144(&qword_256249C18, (uint64_t (*)(uint64_t))MEMORY[0x24BDEC778], MEMORY[0x24BDEC788]);
  sub_2355C8EBC();
  v78 = (void (*)(_BYTE *, _QWORD))sub_2355C906C();
  (*(void (**)(uint64_t))(v51 + 16))(v77);
  v78(v101, 0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v51 + 56))(v77, 0, 1, v76);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v51 + 48))(v77, 1, v76) == 1)
    return sub_23558E470(v77, &qword_256249BF8);
  v79 = v87;
  (*(void (**)(char *, uint64_t, uint64_t))(v51 + 32))(v87, v77, v76);
  v105.origin.x = a6;
  v105.origin.y = a7;
  v105.size.width = a8;
  v105.size.height = a9;
  CGRectGetMinX(v105);
  v80 = a6;
  v81 = a7;
  v82 = a8;
  v83 = a9;
  if (v84 >= v85)
  {
    CGRectGetMinY(*(CGRect *)&v80);
    sub_2355C8E68();
  }
  else
  {
    CGRectGetMaxY(*(CGRect *)&v80);
    sub_2355C8E74();
  }
  v101[0] = v94 & 1;
  LOBYTE(v102) = v75 & 1;
  sub_2355C8790();
  return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v79, v76);
}

uint64_t sub_2355B35A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  uint64_t result;
  uint64_t v18;
  char *v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t *, _QWORD);
  uint64_t v37;
  char *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t (*v43)(char *, char *, uint64_t);
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  void (*v62)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  unint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79[4];
  _QWORD *v80;
  uint64_t v81;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249BF8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2355C879C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v78 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249C00);
  v66 = *(_QWORD *)(v68 - 8);
  v9 = MEMORY[0x24BDAC7A8](v68);
  v65 = (uint64_t)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v77 = (uint64_t)&v59 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v67 = (char *)&v59 - v13;
  v14 = sub_2355C87CC();
  v73 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v72 = (char *)&v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249C20);
  result = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v59 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 0x8000000000000000) == 0)
  {
    if (!a1)
    {
      v30 = sub_2355B4A40(v1);
      sub_23558E470(v1, &qword_256249C08);
      return v30;
    }
    v71 = v7;
    v80 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v81 = MEMORY[0x24BEE4AF8];
    (*(void (**)(char *, uint64_t, uint64_t))(v73 + 32))(v72, v1, v14);
    v74 = v14;
    v20 = (uint64_t (*)(uint64_t))MEMORY[0x24BDEC778];
    sub_235598144(&qword_256249C28, (uint64_t (*)(uint64_t))MEMORY[0x24BDEC778], MEMORY[0x24BDEC798]);
    sub_2355C8F64();
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249C08);
    v22 = &v19[*(int *)(v16 + 52)];
    *(_QWORD *)v22 = *(_QWORD *)(v1 + *(int *)(v21 + 52));
    *((_QWORD *)v22 + 1) = 0;
    v70 = *(int *)(v16 + 56);
    v19[v70] = 0;
    v23 = &v19[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256249C30) + 36)];
    v24 = v74;
    v25 = sub_235598144(&qword_256249C10, v20, MEMORY[0x24BDEC7A0]);
    *(_QWORD *)&v75 = v23;
    v26 = *(_QWORD *)v23;
    sub_2355C9054();
    v69 = v19;
    if (v26 == v79[0])
    {
      v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v71 + 56);
LABEL_5:
      v28 = (uint64_t)v5;
      v27(v5, 1, 1, v6);
LABEL_6:
      sub_23558E470(v28, &qword_256249BF8);
LABEL_7:
      v29 = (uint64_t)v69;
      v69[v70] = 1;
LABEL_8:
      sub_23558E470(v29, &qword_256249C20);
      v30 = v81;
      swift_release();
      return v30;
    }
    v76 = 0;
    v31 = v71;
    v64 = v22;
    v32 = (_QWORD *)v75;
    v61 = v5;
    v60 = a1;
    v59 = v6;
    v63 = v25;
    while (1)
    {
      v36 = (void (*)(uint64_t *, _QWORD))sub_2355C906C();
      (*(void (**)(char *))(v31 + 16))(v5);
      v36(v79, 0);
      v38 = v72;
      v37 = v73;
      (*(void (**)(char *, char *, uint64_t))(v73 + 16))(v72, v19, v24);
      v39 = v32;
      v40 = v6;
      sub_2355C9060();
      v41 = v24;
      v28 = (uint64_t)v5;
      (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v41);
      v42 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56);
      v42(v5, 0, 1, v6);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v5, 1, v6) == 1)
        goto LABEL_6;
      v43 = *(uint64_t (**)(char *, char *, uint64_t))(v31 + 32);
      result = v43(v78, v5, v6);
      v45 = *(_QWORD *)v64;
      v44 = *((_QWORD *)v64 + 1);
      v46 = *(_QWORD *)(*(_QWORD *)v64 + 16);
      if (v44 == v46)
      {
        (*(void (**)(char *, uint64_t))(v31 + 8))(v78, v6);
        goto LABEL_7;
      }
      if (v44 >= v46)
      {
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        break;
      }
      v62 = v42;
      v75 = *(_OWORD *)(v45 + 16 * v44 + 32);
      *((_QWORD *)v64 + 1) = v44 + 1;
      v47 = (uint64_t)v67;
      v48 = *(int *)(v68 + 48);
      v43(v67, v78, v6);
      *(_OWORD *)(v47 + v48) = v75;
      result = sub_235598700(v47, v77, &qword_256249C00);
      v58 = v80;
      v49 = v80[2];
      if ((uint64_t)v49 >= a1)
      {
        v52 = v76;
        if (v76 >= v49)
          goto LABEL_37;
        v53 = (*(unsigned __int8 *)(v66 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80);
        v54 = *(_QWORD *)(v66 + 72);
        sub_2355986BC((uint64_t)v80 + v53 + v54 * v76, v65, &qword_256249C00);
        v55 = v81;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2355B4684(0, *(_QWORD *)(v55 + 16) + 1, 1);
          v55 = v81;
        }
        v57 = *(_QWORD *)(v55 + 16);
        v56 = *(_QWORD *)(v55 + 24);
        if (v57 >= v56 >> 1)
        {
          sub_2355B4684(v56 > 1, v57 + 1, 1);
          v55 = v81;
        }
        *(_QWORD *)(v55 + 16) = v57 + 1;
        sub_235598700(v65, v55 + v53 + v57 * v54, &qword_256249C00);
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = sub_2355B49E4(v58);
          v58 = (_QWORD *)result;
          v80 = (_QWORD *)result;
        }
        if (v52 >= v58[2])
          goto LABEL_38;
        sub_2355B49F8(v77, (uint64_t)v58 + v53 + v54 * v52);
        v51 = v52 + 1;
        a1 = v60;
        v28 = (uint64_t)v61;
        v40 = v59;
        if (v51 >= v60)
        {
          v29 = (uint64_t)v69;
          v31 = v71;
          if ((v69[v70] & 1) != 0)
            goto LABEL_8;
          v51 = 0;
          goto LABEL_16;
        }
      }
      else
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v51 = v76;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_2355B4684(0, v49 + 1, 1);
          v58 = v80;
        }
        v34 = v58[2];
        v33 = v58[3];
        if (v34 >= v33 >> 1)
        {
          sub_2355B4684(v33 > 1, v34 + 1, 1);
          v58 = v80;
        }
        v58[2] = v34 + 1;
        sub_235598700(v77, (uint64_t)v58+ ((*(unsigned __int8 *)(v66 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80))+ *(_QWORD *)(v66 + 72) * v34, &qword_256249C00);
      }
      v29 = (uint64_t)v69;
      v31 = v71;
      if ((v69[v70] & 1) != 0)
        goto LABEL_8;
LABEL_16:
      v76 = v51;
      v6 = v40;
      v5 = (char *)v28;
      v32 = v39;
      v35 = *v39;
      v24 = v74;
      sub_2355C9054();
      v19 = (char *)v29;
      if (v35 == v79[0])
      {
        v27 = v62;
        goto LABEL_5;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2355B3C7C(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5)
{
  return sub_2355B2B3C(a1, a2 & 1, a3, a4 & 1, a5);
}

uint64_t sub_2355B3C98(uint64_t a1, char a2, char *a3, char a4, uint64_t a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  double *v9;

  return sub_2355B2E18(a1, a2 & 1, a3, a4 & 1, a5, a6, a7, a8, a9, *v9);
}

uint64_t sub_2355B3CB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_2355B3D0C(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x24BDF44F8]);
}

uint64_t sub_2355B3CE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_2355B3D0C(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x24BDF4500]);
}

uint64_t sub_2355B3D0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t))
{
  return a10(a1);
}

void (*sub_2355B3D48(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_2355C86DC();
  return sub_2355B3DA4;
}

void sub_2355B3DA4(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_2355B3DD4@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_2355B1AE0(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_2355B3DE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_2355B1E68(v1[4], v1[2], v1[3], a1);
}

double sub_2355B3DEC(_OWORD *a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)((char *)a1 + 169) = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_2355B3E10(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    sub_235597D54(result, a2, a3, a4);
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

unint64_t sub_2355B3E5C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_256249B18;
  if (!qword_256249B18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249AF8);
    v2 = sub_2355B3EC0();
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256249B18);
  }
  return result;
}

unint64_t sub_2355B3EC0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249B20;
  if (!qword_256249B20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249B28);
    v2[0] = sub_2355B3F44();
    v2[1] = sub_23559867C(&qword_256248EF0, &qword_256248EE8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249B20);
  }
  return result;
}

unint64_t sub_2355B3F44()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249B30;
  if (!qword_256249B30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249B38);
    v2[0] = sub_2355B3FB0();
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249B30);
  }
  return result;
}

unint64_t sub_2355B3FB0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249B40;
  if (!qword_256249B40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249B48);
    v2[0] = sub_235597F5C();
    v2[1] = sub_23559867C(&qword_256249B50, &qword_256249B58, MEMORY[0x24BDF0710]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249B40);
  }
  return result;
}

uint64_t sub_2355B4034(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 184);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    v4);
  return a1;
}

uint64_t sub_2355B40A8(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    sub_235597C94(result, a2, a3, a4);
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2355B4104(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    sub_235597D54(result, a2, a3, a4);
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_2355B413C(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    sub_235597C94(result, a2, a3, a4);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2355B4174@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return sub_2355B0044(a1, v2[4], v2[2], v2[3], a2);
}

uint64_t sub_2355B4180@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_2355B0C7C(v1[4], v1[2], v1[3], a1);
}

unint64_t sub_2355B418C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249B70;
  if (!qword_256249B70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249AE8);
    v2[0] = sub_23559867C(&qword_256249B78, &qword_256249B80, MEMORY[0x24BDEB9A8]);
    v2[1] = sub_23559867C(&qword_256249B88, &qword_256249B90, MEMORY[0x24BDF5428]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDEC550], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249B70);
  }
  return result;
}

uint64_t sub_2355B4228()
{
  return swift_deallocObject();
}

ValueMetadata *type metadata accessor for HeaderLayout()
{
  return &type metadata for HeaderLayout;
}

uint64_t sub_2355B4268()
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
  uint64_t OpaqueTypeConformance2;
  _QWORD v14[2];
  _QWORD v15[2];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  sub_2355C8AB4();
  sub_2355C8820();
  sub_2355C8820();
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  sub_2355C8820();
  sub_2355C89D0();
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249AF0);
  v18 = type metadata accessor for OfferView();
  v19 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249AF8);
  swift_getTupleTypeMetadata();
  v0 = sub_2355C8E50();
  v1 = MEMORY[0x24BDF5428];
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDF5428], v0);
  sub_2355C8DE4();
  sub_2355C8820();
  swift_getTupleTypeMetadata2();
  v2 = sub_2355C8E50();
  MEMORY[0x23B7CFBF8](v1, v2);
  v3 = sub_2355C8D90();
  v4 = MEMORY[0x24BDF4498];
  v5 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF4498], v3);
  v16 = v3;
  v17 = v5;
  v6 = MEMORY[0x24BDF2F10];
  MEMORY[0x23B7CFBA4](255, &v16, MEMORY[0x24BDF2F10], 0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  sub_2355C8820();
  sub_2355C89D0();
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249AE8);
  swift_getTupleTypeMetadata3();
  v7 = sub_2355C8E50();
  MEMORY[0x23B7CFBF8](v1, v7);
  v8 = sub_2355C8D90();
  v9 = MEMORY[0x23B7CFBF8](v4, v8);
  v16 = v8;
  v17 = v9;
  MEMORY[0x23B7CFBA4](255, &v16, v6, 0);
  v10 = sub_2355C8820();
  v11 = sub_2355C89D0();
  v16 = v3;
  v17 = v5;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v16 = v8;
  v17 = v9;
  v15[0] = swift_getOpaqueTypeConformance2();
  v15[1] = MEMORY[0x24BDECC60];
  v14[0] = OpaqueTypeConformance2;
  v14[1] = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v10, v15);
  return MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v11, v14);
}

unint64_t sub_2355B45DC()
{
  unint64_t result;

  result = qword_256249BE8;
  if (!qword_256249BE8)
  {
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDEEF18], MEMORY[0x24BDEEF38]);
    atomic_store(result, (unint64_t *)&qword_256249BE8);
  }
  return result;
}

unint64_t sub_2355B4624()
{
  unint64_t result;

  result = qword_256249BF0;
  if (!qword_256249BF0)
  {
    result = MEMORY[0x23B7CFBF8](&unk_2355CB0E0, &type metadata for HeaderLayout);
    atomic_store(result, (unint64_t *)&qword_256249BF0);
  }
  return result;
}

uint64_t sub_2355B4668(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2355B46A0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2355B4684(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2355B47FC(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_2355B46A0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256249C40);
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
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2355C9180();
  __break(1u);
  return result;
}

uint64_t sub_2355B47FC(char a1, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249C38);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256249C00) - 8);
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
  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256249C00) - 8);
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
  result = sub_2355C9180();
  __break(1u);
  return result;
}

uint64_t sub_2355B49E4(_QWORD *a1)
{
  return sub_2355B47FC(0, a1[2], 0, a1);
}

uint64_t sub_2355B49F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2355B4A40(uint64_t a1)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  size_t v32;
  unint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t *v39;
  uint64_t v40;
  void (*v41)(_QWORD *, _QWORD);
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t *v45;
  void (*v46)(char *, uint64_t);
  void (*v47)(char *, uint64_t, uint64_t);
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(_QWORD *, _QWORD);
  char *v59;
  uint64_t v60;
  void (*v61)(char *, uint64_t, uint64_t);
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  char *v65;
  unint64_t v66;
  int64_t v67;
  uint64_t v68;
  uint64_t v69;
  size_t v70;
  int64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  BOOL v78;
  char v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t result;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  char *v89;
  unint64_t v90;
  char *v91;
  char *v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  __int128 v100;
  uint64_t v101;
  char *v102;
  __int128 v103;
  uint64_t v104;
  _QWORD v105[5];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249BF8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (uint64_t)&v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v85 = (char *)&v84 - v6;
  v7 = sub_2355C879C();
  v94 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  *(_QWORD *)&v103 = (char *)&v84 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v89 = (char *)&v84 - v10;
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249C00);
  v11 = *(_QWORD *)(v95 - 8);
  v12 = MEMORY[0x24BDAC7A8](v95);
  v92 = (char *)&v84 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v87 = (char *)&v84 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v88 = (uint64_t)&v84 - v16;
  v17 = sub_2355C87CC();
  v18 = (uint64_t (*)(uint64_t))MEMORY[0x24BDEC778];
  v98 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v97 = (char *)&v84 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249C08);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v84 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249C20);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v84 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_235598144(&qword_256249C28, v18, MEMORY[0x24BDEC798]);
  v104 = v17;
  v102 = (char *)v26;
  v27 = sub_2355C8F70();
  if (*(_QWORD *)(*(_QWORD *)(a1 + *(int *)(v20 + 52)) + 16) >= v27)
    v28 = v27;
  else
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + *(int *)(v20 + 52)) + 16);
  v99 = v11;
  if (v28 <= 0)
  {
    v36 = *(unsigned __int8 *)(v11 + 80);
    v91 = (char *)MEMORY[0x24BEE4AF8];
    v34 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 24);
    v84 = v36;
    v86 = (v36 + 32) & ~v36;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256249C38);
    v29 = *(_QWORD *)(v11 + 72);
    v30 = *(unsigned __int8 *)(v11 + 80);
    v31 = (v30 + 32) & ~v30;
    v84 = v30;
    v91 = (char *)swift_allocObject();
    v32 = _swift_stdlib_malloc_size(v91);
    if (!v29)
    {
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if (v32 - v31 == 0x8000000000000000 && v29 == -1)
      goto LABEL_70;
    v86 = v31;
    v34 = 2 * ((uint64_t)(v32 - v31) / v29);
    v35 = v91;
    *((_QWORD *)v91 + 2) = v28;
    *((_QWORD *)v35 + 3) = v34;
  }
  sub_2355986BC(a1, (uint64_t)v22, &qword_256249C08);
  v31 = v104;
  (*(void (**)(char *, char *, uint64_t))(v98 + 32))(v97, v22, v104);
  sub_2355C8F64();
  v37 = &v25[*(int *)(v23 + 52)];
  *(_QWORD *)v37 = *(_QWORD *)&v22[*(int *)(v20 + 52)];
  *((_QWORD *)v37 + 1) = 0;
  v96 = *(int *)(v23 + 56);
  v25[v96] = 0;
  if (v28 < 0)
  {
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  v93 = v37;
  v38 = &v91[v86];
  if (!v28)
  {
    v90 = v34 >> 1;
    goto LABEL_24;
  }
  v39 = (uint64_t *)&v25[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256249C30) + 36)];
  v90 = (v34 >> 1) - v28;
  do
  {
    if ((v25[v96] & 1) != 0)
    {
      __break(1u);
LABEL_61:
      __break(1u);
LABEL_62:
      __break(1u);
LABEL_63:
      __break(1u);
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
      goto LABEL_66;
    }
    v101 = v28;
    v102 = v38;
    v31 = *v39;
    sub_235598144(&qword_256249C10, (uint64_t (*)(uint64_t))MEMORY[0x24BDEC778], MEMORY[0x24BDEC7A0]);
    sub_2355C9054();
    if (v31 == v105[0])
      goto LABEL_71;
    v40 = v104;
    v41 = (void (*)(_QWORD *, _QWORD))sub_2355C906C();
    v31 = v94;
    (*(void (**)(uint64_t))(v94 + 16))(v5);
    v41(v105, 0);
    v42 = v7;
    v44 = v97;
    v43 = v98;
    (*(void (**)(char *, char *, uint64_t))(v98 + 16))(v97, v25, v40);
    v45 = v39;
    sub_2355C9060();
    v46 = *(void (**)(char *, uint64_t))(v43 + 8);
    v7 = v42;
    v46(v44, v40);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v31 + 56))(v5, 0, 1, v42);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v5, 1, v42) == 1)
    {
LABEL_72:
      sub_23558E470(v5, &qword_256249BF8);
      __break(1u);
LABEL_73:
      result = (*(uint64_t (**)(_QWORD, uint64_t))(v31 + 8))(v103, v7);
      __break(1u);
      return result;
    }
    v47 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 32);
    v47((char *)v103, v5, v42);
    v48 = *((_QWORD *)v93 + 1);
    v49 = *(_QWORD *)(*(_QWORD *)v93 + 16);
    v51 = v101;
    v50 = (uint64_t)v102;
    if (v48 == v49)
      goto LABEL_73;
    if (v48 >= v49)
      goto LABEL_61;
    v100 = *(_OWORD *)(*(_QWORD *)v93 + 16 * v48 + 32);
    *((_QWORD *)v93 + 1) = v48 + 1;
    v31 = *(int *)(v95 + 48);
    v52 = (uint64_t)v92;
    v47(v92, v103, v7);
    *(_OWORD *)(v52 + v31) = v100;
    sub_235598700(v52, v50, &qword_256249C00);
    v38 = (char *)(v50 + *(_QWORD *)(v99 + 72));
    v28 = v51 - 1;
    v39 = v45;
  }
  while (v28);
  if ((v25[v96] & 1) != 0)
    goto LABEL_55;
LABEL_24:
  v53 = sub_235598144(&qword_256249C10, (uint64_t (*)(uint64_t))MEMORY[0x24BDEC778], MEMORY[0x24BDEC7A0]);
  v101 = v84 | 7;
  v54 = (uint64_t)v85;
  v55 = v90;
  v102 = (char *)v53;
  v56 = v98;
  while (2)
  {
    v90 = v55;
    v5 = *(_QWORD *)&v25[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256249C30) + 36)];
    sub_2355C9054();
    if (v5 == v105[0])
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v94 + 56))(v54, 1, 1, v7);
LABEL_52:
      sub_23558E470(v54, &qword_256249BF8);
      goto LABEL_54;
    }
    v31 = v54;
    v57 = v104;
    v58 = (void (*)(_QWORD *, _QWORD))sub_2355C906C();
    v5 = v94;
    (*(void (**)(uint64_t))(v94 + 16))(v31);
    v58(v105, 0);
    v59 = v97;
    (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v97, v25, v57);
    sub_2355C9060();
    v60 = v57;
    v54 = v31;
    (*(void (**)(char *, uint64_t))(v56 + 8))(v59, v60);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v31, 0, 1, v7);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v31, 1, v7) == 1)
      goto LABEL_52;
    v61 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 32);
    v61(v89, v31, v7);
    v62 = *((_QWORD *)v93 + 1);
    v63 = *(_QWORD *)(*(_QWORD *)v93 + 16);
    v31 = (uint64_t)&qword_256249C00;
    if (v62 != v63)
    {
      if (v62 >= v63)
        goto LABEL_62;
      v103 = *(_OWORD *)(*(_QWORD *)v93 + 16 * v62 + 32);
      *((_QWORD *)v93 + 1) = v62 + 1;
      v64 = *(int *)(v95 + 48);
      v5 = (uint64_t)v87;
      v61(v87, (uint64_t)v89, v7);
      *(_OWORD *)(v5 + v64) = v103;
      sub_235598700(v5, v88, &qword_256249C00);
      if (v90)
      {
        v65 = v91;
        v55 = v90 - 1;
        if (__OFSUB__(v90, 1))
          goto LABEL_63;
        goto LABEL_49;
      }
      v66 = *((_QWORD *)v91 + 3);
      if ((uint64_t)((v66 >> 1) + 0x4000000000000000) < 0)
        goto LABEL_64;
      v67 = v66 & 0xFFFFFFFFFFFFFFFELL;
      if (v67 <= 1)
        v68 = 1;
      else
        v68 = v67;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256249C38);
      v5 = *(_QWORD *)(v99 + 72);
      v69 = v86;
      v65 = (char *)swift_allocObject();
      v70 = _swift_stdlib_malloc_size(v65);
      if (!v5)
        goto LABEL_65;
      v71 = v70 - v69;
      v72 = v69;
      if (v70 - v69 == 0x8000000000000000 && v5 == -1)
        goto LABEL_67;
      v73 = v71 / v5;
      *((_QWORD *)v65 + 2) = v68;
      *((_QWORD *)v65 + 3) = 2 * (v71 / v5);
      v74 = &v65[v69];
      v75 = v91;
      v76 = *((_QWORD *)v91 + 3) >> 1;
      v5 *= v76;
      if (*((_QWORD *)v91 + 2))
      {
        if (v65 < v91 || v74 >= &v91[v72 + v5])
        {
          swift_arrayInitWithTakeFrontToBack();
LABEL_46:
          v75 = v91;
        }
        else if (v65 != v91)
        {
          swift_arrayInitWithTakeBackToFront();
          goto LABEL_46;
        }
        *((_QWORD *)v75 + 2) = 0;
      }
      v38 = &v74[v5];
      v77 = (v73 & 0x7FFFFFFFFFFFFFFFLL) - v76;
      swift_release();
      v54 = (uint64_t)v85;
      v78 = __OFSUB__(v77, 1);
      v55 = v77 - 1;
      if (v78)
        goto LABEL_63;
LABEL_49:
      sub_235598700(v88, (uint64_t)v38, &qword_256249C00);
      v38 += *(_QWORD *)(v99 + 72);
      v79 = v25[v96];
      v91 = v65;
      if ((v79 & 1) != 0)
        goto LABEL_56;
      continue;
    }
    break;
  }
  (*(void (**)(char *, uint64_t))(v94 + 8))(v89, v7);
LABEL_54:
  v25[v96] = 1;
LABEL_55:
  v55 = v90;
  v65 = v91;
LABEL_56:
  sub_23558E470((uint64_t)v25, &qword_256249C20);
  v80 = *((_QWORD *)v65 + 3);
  if (v80 >= 2)
  {
    v81 = v80 >> 1;
    v78 = __OFSUB__(v81, v55);
    v82 = v81 - v55;
    if (!v78)
    {
      *((_QWORD *)v65 + 2) = v82;
      return (uint64_t)v65;
    }
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v94 + 56))(v5, 1, 1, v7);
    goto LABEL_72;
  }
  return (uint64_t)v65;
}

uint64_t sub_2355B53D4(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  if ((a1 & 1) != 0)
    v2 = 4144959;
  else
    v2 = 5527621;
  if ((a2 & 1) != 0)
    v3 = 4144959;
  else
    v3 = 5527621;
  if (v2 == v3)
    v4 = 1;
  else
    v4 = sub_2355C9234();
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_2355B5440(char *a1, char *a2)
{
  return sub_2355B53D4(*a1, *a2);
}

uint64_t sub_2355B544C()
{
  sub_2355C927C();
  sub_2355C8F1C();
  swift_bridgeObjectRelease();
  return sub_2355C92AC();
}

uint64_t sub_2355B54B0()
{
  sub_2355C8F1C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2355B54E8()
{
  sub_2355C927C();
  sub_2355C8F1C();
  swift_bridgeObjectRelease();
  return sub_2355C92AC();
}

uint64_t sub_2355B5548@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_2355C91EC();
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

void sub_2355B55A4(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;

  v2 = 5527621;
  if (*v1)
    v2 = 4144959;
  *a1 = v2;
  a1[1] = 0xE300000000000000;
}

uint64_t sub_2355B55CC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_2355C8F34();
    swift_bridgeObjectRelease();
    sub_23558E07C();
    sub_2355C8F4C();
    sub_2355C8F34();
    swift_bridgeObjectRelease();
    return 0;
  }
  return a1;
}

uint64_t sub_2355B5688()
{
  uint64_t v0;

  return sub_2355B55CC(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

uint64_t sub_2355B5694@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _QWORD v9[4];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2355C92B8();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  v5 = sub_2355C9240();
  v7 = v6;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  result = __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  *(_QWORD *)a2 = v5;
  *(_QWORD *)(a2 + 8) = v7;
  *(_BYTE *)(a2 + 16) = 1;
  return result;
}

uint64_t sub_2355B5764(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  _BYTE v6[24];
  uint64_t v7;

  v2 = *(_QWORD *)v1;
  v3 = *(_QWORD *)(v1 + 8);
  v4 = *(_BYTE *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2355C92D0();
  sub_2355B55CC(v2, v3, v4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v6, v7);
  sub_2355C9258();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
}

ValueMetadata *type metadata accessor for LogKey()
{
  return &type metadata for LogKey;
}

uint64_t destroy for LogKey.Representation(uint64_t a1)
{
  return sub_23558E2FC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s31_ManagedAppDistribution_SwiftUI6LogKeyV14RepresentationOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23558E460(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s31_ManagedAppDistribution_SwiftUI6LogKeyV14RepresentationOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23558E460(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_23558E2FC(v6, v7, v8);
  return a1;
}

uint64_t _s31_ManagedAppDistribution_SwiftUI6LogKeyV14RepresentationOwta_0(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_23558E2FC(v4, v5, v6);
  return a1;
}

uint64_t _s31_ManagedAppDistribution_SwiftUI6LogKeyV14RepresentationOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s31_ManagedAppDistribution_SwiftUI6LogKeyV14RepresentationOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_2355B59C8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_2355B59D0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LogKey.Representation()
{
  return &type metadata for LogKey.Representation;
}

_QWORD *sub_2355B59EC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;
  char v6;

  result = sub_2355B5AD0(a1);
  if (!v2)
  {
    *(_QWORD *)a2 = result;
    *(_QWORD *)(a2 + 8) = v5;
    *(_BYTE *)(a2 + 16) = v6 & 1;
  }
  return result;
}

uint64_t sub_2355B5A1C(_QWORD *a1)
{
  _BYTE v2[24];
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2355C92D0();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_2355B5C20();
  sub_2355C9264();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
}

_QWORD *sub_2355B5AD0(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *v5;
  _QWORD v6[4];

  v3 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2355C92B8();
  if (!v1)
  {
    __swift_project_boxed_opaque_existential_1(v6, v6[3]);
    sub_2355B5BB4();
    sub_2355C924C();
    v3 = v5;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v3;
}

unint64_t sub_2355B5BB4()
{
  unint64_t result;

  result = qword_256249C48;
  if (!qword_256249C48)
  {
    result = MEMORY[0x23B7CFBF8](&unk_2355CB200, &type metadata for LogKey.Representation);
    atomic_store(result, (unint64_t *)&qword_256249C48);
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

unint64_t sub_2355B5C20()
{
  unint64_t result;

  result = qword_256249C50;
  if (!qword_256249C50)
  {
    result = MEMORY[0x23B7CFBF8](&unk_2355CB1D8, &type metadata for LogKey.Representation);
    atomic_store(result, (unint64_t *)&qword_256249C50);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for LogKey.Prefix(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2355B5CB0 + 4 * byte_2355CB1B5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2355B5CE4 + 4 * byte_2355CB1B0[v4]))();
}

uint64_t sub_2355B5CE4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2355B5CEC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2355B5CF4);
  return result;
}

uint64_t sub_2355B5D00(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2355B5D08);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2355B5D0C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2355B5D14(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LogKey.Prefix()
{
  return &type metadata for LogKey.Prefix;
}

unint64_t sub_2355B5D34()
{
  unint64_t result;

  result = qword_256249C58;
  if (!qword_256249C58)
  {
    result = MEMORY[0x23B7CFBF8](&unk_2355CB348, &type metadata for LogKey.Prefix);
    atomic_store(result, (unint64_t *)&qword_256249C58);
  }
  return result;
}

void sub_2355B5D80(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_2355B5D88()
{
  return sub_2355C87C0();
}

uint64_t sub_2355B5D94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248EA0);
  __swift_allocate_value_buffer(v0, qword_256249C60);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_256249C60);
  v2 = sub_2355C8400();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
}

uint64_t sub_2355B5DFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256248818 != -1)
    swift_once();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248EA0);
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256249C60);
  return sub_2355B6140(v3, a1);
}

uint64_t sub_2355B5E5C()
{
  sub_2355B6094();
  return sub_2355C87C0();
}

uint64_t sub_2355B5EAC()
{
  sub_2355B6040();
  return sub_2355C891C();
}

uint64_t EnvironmentValues.isViewService.getter()
{
  unsigned __int8 v1;

  sub_2355B5F18();
  sub_2355C891C();
  return v1;
}

unint64_t sub_2355B5F18()
{
  unint64_t result;

  result = qword_256249C78;
  if (!qword_256249C78)
  {
    result = MEMORY[0x23B7CFBF8](&unk_2355CB380, &type metadata for ViewServiceKey);
    atomic_store(result, (unint64_t *)&qword_256249C78);
  }
  return result;
}

uint64_t EnvironmentValues.isViewService.setter()
{
  sub_2355B5F18();
  return sub_2355C8928();
}

uint64_t (*EnvironmentValues.isViewService.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = sub_2355B5F18();
  sub_2355C891C();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a1 + 17);
  return sub_2355B5FF4;
}

uint64_t sub_2355B5FF4(uint64_t a1)
{
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a1 + 16);
  return sub_2355C8928();
}

ValueMetadata *type metadata accessor for ViewServiceKey()
{
  return &type metadata for ViewServiceKey;
}

unint64_t sub_2355B6040()
{
  unint64_t result;

  result = qword_256249C80;
  if (!qword_256249C80)
  {
    result = MEMORY[0x23B7CFBF8](&unk_2355CB3C0, &type metadata for IconKey);
    atomic_store(result, (unint64_t *)&qword_256249C80);
  }
  return result;
}

ValueMetadata *type metadata accessor for IconKey()
{
  return &type metadata for IconKey;
}

unint64_t sub_2355B6094()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_256249C88;
  if (!qword_256249C88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EA0);
    v2 = sub_2355B60F8();
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BEE4AB8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256249C88);
  }
  return result;
}

unint64_t sub_2355B60F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256249C90[0];
  if (!qword_256249C90[0])
  {
    v1 = sub_2355C8400();
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDCDB00], v1);
    atomic_store(result, qword_256249C90);
  }
  return result;
}

uint64_t sub_2355B6140(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248EA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
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

void sub_2355B61C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  type metadata accessor for ManagedAppCellContext(319, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a4);
  if (v4 <= 0x3F)
  {
    sub_235593DE4(319, (unint64_t *)&qword_256248E90, (void (*)(uint64_t))MEMORY[0x24BDEB418]);
    if (v5 <= 0x3F)
    {
      sub_235593D8C();
      if (v6 <= 0x3F)
      {
        sub_235593DE4(319, (unint64_t *)&qword_256248EA8, (void (*)(uint64_t))MEMORY[0x24BDEEEA0]);
        if (v7 <= 0x3F)
        {
          sub_235593E30();
          if (v8 <= 0x3F)
            swift_initStructMetadata();
        }
      }
    }
  }
}

_QWORD *sub_2355B62CC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unsigned int v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  __int128 v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  __int128 v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  _QWORD *v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  _QWORD *v73;
  _QWORD *v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  _QWORD *v79;
  unsigned int v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  unint64_t v84;
  unint64_t v85;
  void (*v86)(unint64_t, unint64_t, uint64_t);
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  size_t __n;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = sub_2355C870C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_DWORD *)(v8 + 80);
  v99 = v8;
  v100 = v7;
  v10 = *(_QWORD *)(v8 + 64);
  if (v10 <= 8)
    v10 = 8;
  v104 = v10;
  v103 = sub_2355C8400();
  v11 = *(_QWORD *)(v103 - 8);
  v12 = *(_DWORD *)(v11 + 80);
  if (*(_DWORD *)(v11 + 84))
    v13 = *(_QWORD *)(v11 + 64);
  else
    v13 = *(_QWORD *)(v11 + 64) + 1;
  __n = v13;
  if (v13 <= 8)
    v13 = 8;
  v105 = v13;
  v14 = sub_2355C8994();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_DWORD *)(v15 + 80);
  v101 = v15;
  v102 = v14;
  v17 = *(_QWORD *)(v15 + 64);
  if (v17 <= 8)
    v17 = 8;
  v106 = v17;
  v18 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(_DWORD *)(v19 + 80);
  v21 = v12 | v9 | v16 | *(_DWORD *)(v5 + 80);
  v22 = v21 & 0xF8 | v20;
  if (v22 > 7
    || ((v21 | *(_DWORD *)(v19 + 80)) & 0x100000) != 0
    || (v23 = (((((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
             + 63) & 0xFFFFFFFFFFFFFFF8,
        v24 = ~(unint64_t)(v9 & 0xF8) & 0xFFFFFFFFFFFFFFF8,
        v25 = (v9 & 0xF8) + 16,
        v26 = v12 & 0xF8 | 7,
        v27 = v16 & 0xF8 | 7,
        v28 = *(_QWORD *)(v19 + 64),
        ((v28
        + v20
        + ((v106
          + v20
          + 1
          + ((v105 + v27 + 1 + ((v104 + v26 + 1 + ((v25 + ((v23 + 23) & 0xFFFFFFFFFFFFFFF8)) & v24)) & ~v26)) & ~v27)) & ~v20)) & ~v20)
      + v28 > 0x18))
  {
    v40 = *a2;
    *a1 = *a2;
    v41 = v40 + (((v22 | 7) + 16) & ~(unint64_t)(v22 | 7));
    swift_retain();
  }
  else
  {
    v89 = v12 & 0xF8 | 7;
    v90 = v104 + v26 + 1;
    v91 = v16 & 0xF8 | 7;
    v92 = v105 + v27 + 1;
    v93 = v106 + v20 + 1;
    v94 = v28 + v20;
    v95 = *(_DWORD *)(v19 + 80);
    v96 = *(_QWORD *)(v18 - 8);
    v97 = v18;
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v5 + 16))(a1, a2, v4);
    v29 = ((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    v88 = (char *)a2 + 7;
    v30 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    v31 = *(_QWORD *)v30;
    v32 = *(_QWORD *)(v30 + 8);
    v33 = *(_BYTE *)(v30 + 16);
    sub_2355914F4(*(_QWORD *)v30, v32, v33);
    *(_QWORD *)v29 = v31;
    *(_QWORD *)(v29 + 8) = v32;
    *(_BYTE *)(v29 + 16) = v33;
    *(_QWORD *)(v29 + 24) = *(_QWORD *)(v30 + 24);
    v34 = (v29 + 39) & 0xFFFFFFFFFFFFFFF8;
    v35 = (v30 + 39) & 0xFFFFFFFFFFFFFFF8;
    v36 = *(_QWORD *)(v35 + 24);
    swift_bridgeObjectRetain();
    if (v36 < 0xFFFFFFFF)
    {
      v42 = *(_OWORD *)(v35 + 16);
      *(_OWORD *)v34 = *(_OWORD *)v35;
      *(_OWORD *)(v34 + 16) = v42;
    }
    else
    {
      v37 = *(_QWORD *)v35;
      v38 = *(_QWORD *)(v35 + 8);
      v39 = *(_BYTE *)(v35 + 16);
      sub_2355914F4(*(_QWORD *)v35, v38, v39);
      *(_QWORD *)v34 = v37;
      *(_QWORD *)(v34 + 8) = v38;
      *(_BYTE *)(v34 + 16) = v39;
      *(_QWORD *)(v34 + 24) = *(_QWORD *)(v35 + 24);
      swift_bridgeObjectRetain();
    }
    v43 = (v34 + 39) & 0xFFFFFFFFFFFFFFF8;
    v44 = (v35 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)(v44 + 24) < 0xFFFFFFFFuLL)
    {
      v48 = *(_OWORD *)(v44 + 16);
      *(_OWORD *)v43 = *(_OWORD *)v44;
      *(_OWORD *)(v43 + 16) = v48;
    }
    else
    {
      v45 = *(_QWORD *)v44;
      v46 = *(_QWORD *)(v44 + 8);
      v47 = *(_BYTE *)(v44 + 16);
      sub_2355914F4(*(_QWORD *)v44, v46, v47);
      *(_QWORD *)v43 = v45;
      *(_QWORD *)(v43 + 8) = v46;
      *(_BYTE *)(v43 + 16) = v47;
      *(_QWORD *)(v43 + 24) = *(_QWORD *)(v44 + 24);
      swift_bridgeObjectRetain();
    }
    v49 = v23 + 16;
    v50 = (v43 + 39) & 0xFFFFFFFFFFFFFFF8;
    v51 = (v44 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)(v51 + 24) < 0xFFFFFFFFuLL)
    {
      v55 = *(_OWORD *)(v51 + 16);
      *(_OWORD *)v50 = *(_OWORD *)v51;
      *(_OWORD *)(v50 + 16) = v55;
    }
    else
    {
      v52 = *(_QWORD *)v51;
      v53 = *(_QWORD *)(v51 + 8);
      v54 = *(_BYTE *)(v51 + 16);
      sub_2355914F4(*(_QWORD *)v51, v53, v54);
      *(_QWORD *)v50 = v52;
      *(_QWORD *)(v50 + 8) = v53;
      *(_BYTE *)(v50 + 16) = v54;
      *(_QWORD *)(v50 + 24) = *(_QWORD *)(v51 + 24);
      swift_bridgeObjectRetain();
    }
    v56 = (v50 + 39) & 0xFFFFFFFFFFFFFFF8;
    v57 = (v51 + 39) & 0xFFFFFFFFFFFFFFF8;
    v58 = *(_QWORD *)v57;
    v59 = *(_QWORD *)(v57 + 8);
    v60 = *(_BYTE *)(v57 + 16);
    sub_235591504(*(_QWORD *)v57, v59, v60);
    *(_QWORD *)v56 = v58;
    *(_QWORD *)(v56 + 8) = v59;
    *(_BYTE *)(v56 + 16) = v60;
    v61 = (_QWORD *)((v50 + 63) & 0xFFFFFFFFFFFFFFF8);
    v62 = (_QWORD *)((v51 + 63) & 0xFFFFFFFFFFFFFFF8);
    v63 = v62[1];
    *v61 = *v62;
    v61[1] = v63;
    v64 = ((unint64_t)a1 + v49 + 7) & 0xFFFFFFFFFFFFFFF8;
    v65 = (unint64_t)&v88[v49] & 0xFFFFFFFFFFFFFFF8;
    v66 = *(_QWORD *)v65;
    LOBYTE(v59) = *(_BYTE *)(v65 + 8);
    swift_retain();
    sub_23558C900(v66, v59);
    *(_QWORD *)v64 = v66;
    *(_BYTE *)(v64 + 8) = v59;
    v67 = (_QWORD *)((v25 + v64) & v24);
    v68 = (_QWORD *)((v25 + v65) & v24);
    v69 = *((unsigned __int8 *)v68 + v104);
    if (v69 >= 2)
    {
      if (v104 <= 3)
        v70 = v104;
      else
        v70 = 4;
      __asm { BR              X12 }
    }
    v71 = ~v89;
    if (v69 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v99 + 16))(v67, v68, v100);
      v72 = 1;
    }
    else
    {
      *v67 = *v68;
      swift_retain();
      v72 = 0;
    }
    *((_BYTE *)v67 + v104) = v72;
    v73 = (_QWORD *)(((unint64_t)v67 + v90) & v71);
    v74 = (_QWORD *)(((unint64_t)v68 + v90) & v71);
    v75 = *((unsigned __int8 *)v74 + v105);
    if (v75 >= 2)
    {
      if (v105 <= 3)
        v76 = v105;
      else
        v76 = 4;
      __asm { BR              X12 }
    }
    v77 = ~v91;
    if (v75 == 1)
    {
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v11 + 48))(v74, 1, v103))
      {
        memcpy(v73, v74, __n);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v11 + 16))(v73, v74, v103);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v73, 0, 1, v103);
      }
      *((_BYTE *)v73 + v105) = 1;
    }
    else
    {
      *v73 = *v74;
      *((_BYTE *)v73 + v105) = 0;
      swift_retain();
    }
    v78 = (_QWORD *)(((unint64_t)v73 + v92) & v77);
    v79 = (_QWORD *)(((unint64_t)v74 + v92) & v77);
    v80 = *((unsigned __int8 *)v79 + v106);
    if (v80 >= 2)
    {
      if (v106 <= 3)
        v81 = v106;
      else
        v81 = 4;
      __asm { BR              X12 }
    }
    v82 = ~v95;
    if (v80 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v101 + 16))(v78, v79, v102);
      v83 = 1;
    }
    else
    {
      *v78 = *v79;
      swift_retain();
      v83 = 0;
    }
    *((_BYTE *)v78 + v106) = v83;
    v84 = ((unint64_t)v78 + v93) & v82;
    v85 = ((unint64_t)v79 + v93) & v82;
    v86 = *(void (**)(unint64_t, unint64_t, uint64_t))(v96 + 16);
    v86(v84, v85, v97);
    v86((v94 + v84) & v82, (v94 + v85) & v82, v97);
    return a1;
  }
  return (_QWORD *)v41;
}

uint64_t sub_2355B69F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v39)(uint64_t, uint64_t);

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v3 + 8))();
  v4 = *(_QWORD *)(v3 + 64);
  v5 = (a1 + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_235591958(*(_QWORD *)v5, *(_QWORD *)(v5 + 8), *(_BYTE *)(v5 + 16));
  swift_bridgeObjectRelease();
  v6 = (v5 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v6 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_235591958(*(_QWORD *)v6, *(_QWORD *)(v6 + 8), *(_BYTE *)(v6 + 16));
    swift_bridgeObjectRelease();
  }
  v7 = (v6 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v7 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_235591958(*(_QWORD *)v7, *(_QWORD *)(v7 + 8), *(_BYTE *)(v7 + 16));
    swift_bridgeObjectRelease();
  }
  v8 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v8 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_235591958(*(_QWORD *)v8, *(_QWORD *)(v8 + 8), *(_BYTE *)(v8 + 16));
    swift_bridgeObjectRelease();
  }
  sub_23558A9F8(*(_QWORD *)((v8 + 39) & 0xFFFFFFFFFFFFFFF8), *(_QWORD *)(((v8 + 39) & 0xFFFFFFFFFFFFFFF8) + 8), *(_BYTE *)(((v8 + 39) & 0xFFFFFFFFFFFFFFF8) + 16));
  swift_release();
  v9 = (a1
      + ((((((((((v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 23) & 0xFFFFFFFFFFFFFFF8;
  sub_23558CA44(*(_QWORD *)v9, *(_BYTE *)(v9 + 8));
  v10 = sub_2355C870C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_DWORD *)(v11 + 80) & 0xF8 | 7;
  v13 = (v9 + v12 + 9) & ~v12;
  if (*(_QWORD *)(v11 + 64) <= 8uLL)
    v14 = 8;
  else
    v14 = *(_QWORD *)(v11 + 64);
  v15 = *(unsigned __int8 *)(v13 + v14);
  if (v15 >= 2)
  {
    if (v14 <= 3)
      v16 = v14;
    else
      v16 = 4;
    __asm { BR              X13 }
  }
  if (v15 == 1)
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v13, v10);
  else
    swift_release();
  v17 = v14 + v13;
  v18 = sub_2355C8400();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(_DWORD *)(v19 + 80) & 0xF8 | 7;
  v21 = (v17 + v20 + 1) & ~v20;
  v22 = *(_QWORD *)(v19 + 64);
  if (!*(_DWORD *)(v19 + 84))
    ++v22;
  if (v22 <= 8)
    v23 = 8;
  else
    v23 = v22;
  v24 = *(unsigned __int8 *)(v21 + v23);
  if (v24 >= 2)
  {
    if (v23 <= 3)
      v25 = v23;
    else
      v25 = 4;
    __asm { BR              X12 }
  }
  if (v24 == 1)
  {
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v21, 1, v18))
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v21, v18);
  }
  else
  {
    swift_release();
  }
  v26 = sub_2355C8994();
  v27 = *(_QWORD *)(v26 - 8);
  v28 = *(_DWORD *)(v27 + 80) & 0xF8 | 7;
  v29 = (v23 + v21 + v28 + 1) & ~v28;
  if (*(_QWORD *)(v27 + 64) <= 8uLL)
    v30 = 8;
  else
    v30 = *(_QWORD *)(v27 + 64);
  v31 = *(unsigned __int8 *)(v29 + v30);
  if (v31 >= 2)
  {
    if (v30 <= 3)
      v32 = v30;
    else
      v32 = 4;
    __asm { BR              X13 }
  }
  if (v31 == 1)
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v29, v26);
  else
    swift_release();
  v33 = v30 + v29;
  v34 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v35 = *(_QWORD *)(v34 - 8);
  v36 = *(unsigned __int8 *)(v35 + 80);
  v37 = (v33 + v36 + 1) & ~v36;
  v39 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
  v39(v37, v34);
  return ((uint64_t (*)(uint64_t, uint64_t))v39)((*(_QWORD *)(v35 + 64) + v36 + v37) & ~v36, v34);
}

uint64_t sub_2355B6E14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  __int128 v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  _QWORD *v61;
  size_t v62;
  uint64_t v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  _QWORD *v71;
  uint64_t v72;
  unsigned int v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  void (*v82)(unint64_t, unint64_t, uint64_t);

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_QWORD *)v8;
  v10 = *(_QWORD *)(v8 + 8);
  v11 = *(_BYTE *)(v8 + 16);
  sub_2355914F4(*(_QWORD *)v8, v10, v11);
  *(_QWORD *)v7 = v9;
  *(_QWORD *)(v7 + 8) = v10;
  *(_BYTE *)(v7 + 16) = v11;
  *(_QWORD *)(v7 + 24) = *(_QWORD *)(v8 + 24);
  v12 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  v13 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  v14 = *(_QWORD *)(v13 + 24);
  swift_bridgeObjectRetain();
  if (v14 < 0xFFFFFFFF)
  {
    v18 = *(_OWORD *)(v13 + 16);
    *(_OWORD *)v12 = *(_OWORD *)v13;
    *(_OWORD *)(v12 + 16) = v18;
  }
  else
  {
    v15 = *(_QWORD *)v13;
    v16 = *(_QWORD *)(v13 + 8);
    v17 = *(_BYTE *)(v13 + 16);
    sub_2355914F4(*(_QWORD *)v13, v16, v17);
    *(_QWORD *)v12 = v15;
    *(_QWORD *)(v12 + 8) = v16;
    *(_BYTE *)(v12 + 16) = v17;
    *(_QWORD *)(v12 + 24) = *(_QWORD *)(v13 + 24);
    swift_bridgeObjectRetain();
  }
  v19 = (v12 + 39) & 0xFFFFFFFFFFFFFFF8;
  v20 = (v13 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v20 + 24) < 0xFFFFFFFFuLL)
  {
    v24 = *(_OWORD *)(v20 + 16);
    *(_OWORD *)v19 = *(_OWORD *)v20;
    *(_OWORD *)(v19 + 16) = v24;
  }
  else
  {
    v21 = *(_QWORD *)v20;
    v22 = *(_QWORD *)(v20 + 8);
    v23 = *(_BYTE *)(v20 + 16);
    sub_2355914F4(*(_QWORD *)v20, v22, v23);
    *(_QWORD *)v19 = v21;
    *(_QWORD *)(v19 + 8) = v22;
    *(_BYTE *)(v19 + 16) = v23;
    *(_QWORD *)(v19 + 24) = *(_QWORD *)(v20 + 24);
    swift_bridgeObjectRetain();
  }
  v25 = (v19 + 39) & 0xFFFFFFFFFFFFFFF8;
  v26 = (v20 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v26 + 24) < 0xFFFFFFFFuLL)
  {
    v30 = *(_OWORD *)(v26 + 16);
    *(_OWORD *)v25 = *(_OWORD *)v26;
    *(_OWORD *)(v25 + 16) = v30;
  }
  else
  {
    v27 = *(_QWORD *)v26;
    v28 = *(_QWORD *)(v26 + 8);
    v29 = *(_BYTE *)(v26 + 16);
    sub_2355914F4(*(_QWORD *)v26, v28, v29);
    *(_QWORD *)v25 = v27;
    *(_QWORD *)(v25 + 8) = v28;
    *(_BYTE *)(v25 + 16) = v29;
    *(_QWORD *)(v25 + 24) = *(_QWORD *)(v26 + 24);
    swift_bridgeObjectRetain();
  }
  v31 = (v25 + 39) & 0xFFFFFFFFFFFFFFF8;
  v32 = (v26 + 39) & 0xFFFFFFFFFFFFFFF8;
  v33 = *(_QWORD *)v32;
  v34 = *(_QWORD *)(v32 + 8);
  v35 = *(_BYTE *)(v32 + 16);
  sub_235591504(*(_QWORD *)v32, v34, v35);
  *(_QWORD *)v31 = v33;
  *(_QWORD *)(v31 + 8) = v34;
  *(_BYTE *)(v31 + 16) = v35;
  v36 = (_QWORD *)((v25 + 63) & 0xFFFFFFFFFFFFFFF8);
  v37 = (_QWORD *)((v26 + 63) & 0xFFFFFFFFFFFFFFF8);
  v38 = v37[1];
  *v36 = *v37;
  v36[1] = v38;
  v39 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  v40 = (a1 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
  v41 = (a2 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
  v42 = *(_QWORD *)v41;
  LOBYTE(v33) = *(_BYTE *)(v41 + 8);
  swift_retain();
  sub_23558C900(v42, v33);
  *(_QWORD *)v40 = v42;
  *(_BYTE *)(v40 + 8) = v33;
  v43 = sub_2355C870C();
  v44 = *(_QWORD *)(v43 - 8);
  v45 = *(_DWORD *)(v44 + 80) & 0xF8;
  v46 = v45 + 16;
  v47 = v45 + 16 + v40;
  v48 = ~v45 & 0xFFFFFFFFFFFFFFF8;
  v49 = (_QWORD *)(v47 & v48);
  v50 = (_QWORD *)((v46 + v41) & v48);
  if (*(_QWORD *)(v44 + 64) <= 8uLL)
    v51 = 8;
  else
    v51 = *(_QWORD *)(v44 + 64);
  v52 = *((unsigned __int8 *)v50 + v51);
  if (v52 >= 2)
  {
    if (v51 <= 3)
      v53 = v51;
    else
      v53 = 4;
    __asm { BR              X13 }
  }
  if (v52 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v44 + 16))(v49, v50, v43);
    v54 = 1;
  }
  else
  {
    *v49 = *v50;
    swift_retain();
    v54 = 0;
  }
  *((_BYTE *)v49 + v51) = v54;
  v55 = v51 + 1;
  v56 = sub_2355C8400();
  v57 = *(_QWORD *)(v56 - 8);
  v58 = *(_DWORD *)(v57 + 80) & 0xF8 | 7;
  v59 = v55 + v58;
  v60 = (_QWORD *)(((unint64_t)v49 + v55 + v58) & ~v58);
  v61 = (_QWORD *)(((unint64_t)v50 + v59) & ~v58);
  if (*(_DWORD *)(v57 + 84))
    v62 = *(_QWORD *)(v57 + 64);
  else
    v62 = *(_QWORD *)(v57 + 64) + 1;
  if (v62 <= 8)
    v63 = 8;
  else
    v63 = v62;
  v64 = *((unsigned __int8 *)v61 + v63);
  if (v64 >= 2)
  {
    if (v63 <= 3)
      v65 = v63;
    else
      v65 = 4;
    __asm { BR              X12 }
  }
  if (v64 == 1)
  {
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v57 + 48))(v61, 1, v56))
    {
      memcpy(v60, v61, v62);
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v57 + 16))(v60, v61, v56);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v57 + 56))(v60, 0, 1, v56);
    }
    *((_BYTE *)v60 + v63) = 1;
  }
  else
  {
    *v60 = *v61;
    *((_BYTE *)v60 + v63) = 0;
    swift_retain();
  }
  v66 = sub_2355C8994();
  v67 = *(_QWORD *)(v66 - 8);
  v68 = *(_DWORD *)(v67 + 80) & 0xF8 | 7;
  v69 = v63 + v68 + 1;
  v70 = (_QWORD *)(((unint64_t)v60 + v69) & ~v68);
  v71 = (_QWORD *)(((unint64_t)v61 + v69) & ~v68);
  if (*(_QWORD *)(v67 + 64) <= 8uLL)
    v72 = 8;
  else
    v72 = *(_QWORD *)(v67 + 64);
  v73 = *((unsigned __int8 *)v71 + v72);
  if (v73 >= 2)
  {
    if (v72 <= 3)
      v74 = v72;
    else
      v74 = 4;
    __asm { BR              X13 }
  }
  if (v73 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v67 + 16))(v70, v71, v66);
    v75 = 1;
  }
  else
  {
    *v70 = *v71;
    swift_retain();
    v75 = 0;
  }
  *((_BYTE *)v70 + v72) = v75;
  v76 = v72 + 1;
  v77 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v78 = *(_QWORD *)(v77 - 8);
  v79 = *(unsigned __int8 *)(v78 + 80);
  v80 = ((unint64_t)v70 + v76 + v79) & ~v79;
  v81 = ((unint64_t)v71 + v76 + v79) & ~v79;
  v82 = *(void (**)(unint64_t, unint64_t, uint64_t))(v78 + 16);
  v82(v80, v81, v77);
  v82((*(_QWORD *)(v78 + 64) + v79 + v80) & ~v79, (*(_QWORD *)(v78 + 64) + v79 + v81) & ~v79, v77);
  return a1;
}

uint64_t sub_2355B73C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  __int128 v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  __int128 v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  __int128 v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  _QWORD *v62;
  _QWORD *v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  _QWORD *v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t v80;
  unsigned int v81;
  uint64_t v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  _QWORD *v91;
  unint64_t v92;
  uint64_t v93;
  size_t v94;
  uint64_t v95;
  unsigned int v96;
  uint64_t v97;
  unsigned int v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD *v107;
  _QWORD *v108;
  uint64_t v109;
  unsigned int v110;
  uint64_t v111;
  unsigned int v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  unint64_t v119;
  void (*v120)(unint64_t, unint64_t, uint64_t);

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_QWORD *)v8;
  v10 = *(_QWORD *)(v8 + 8);
  v11 = *(_BYTE *)(v8 + 16);
  sub_2355914F4(*(_QWORD *)v8, v10, v11);
  v12 = *(_QWORD *)v7;
  v13 = *(_QWORD *)(v7 + 8);
  v14 = *(_BYTE *)(v7 + 16);
  *(_QWORD *)v7 = v9;
  *(_QWORD *)(v7 + 8) = v10;
  *(_BYTE *)(v7 + 16) = v11;
  sub_235591958(v12, v13, v14);
  *(_QWORD *)(v7 + 24) = *(_QWORD *)(v8 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  v16 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  v17 = *(_QWORD *)(v16 + 24);
  if (*(_QWORD *)(v15 + 24) < 0xFFFFFFFFuLL)
  {
    if (v17 >= 0xFFFFFFFF)
    {
      v24 = *(_QWORD *)v16;
      v25 = *(_QWORD *)(v16 + 8);
      v26 = *(_BYTE *)(v16 + 16);
      sub_2355914F4(*(_QWORD *)v16, v25, v26);
      *(_QWORD *)v15 = v24;
      *(_QWORD *)(v15 + 8) = v25;
      *(_BYTE *)(v15 + 16) = v26;
      *(_QWORD *)(v15 + 24) = *(_QWORD *)(v16 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
  }
  else
  {
    if (v17 >= 0xFFFFFFFF)
    {
      v18 = *(_QWORD *)v16;
      v19 = *(_QWORD *)(v16 + 8);
      v20 = *(_BYTE *)(v16 + 16);
      sub_2355914F4(*(_QWORD *)v16, v19, v20);
      v21 = *(_QWORD *)v15;
      v22 = *(_QWORD *)(v15 + 8);
      v23 = *(_BYTE *)(v15 + 16);
      *(_QWORD *)v15 = v18;
      *(_QWORD *)(v15 + 8) = v19;
      *(_BYTE *)(v15 + 16) = v20;
      sub_235591958(v21, v22, v23);
      *(_QWORD *)(v15 + 24) = *(_QWORD *)(v16 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    sub_235591958(*(_QWORD *)v15, *(_QWORD *)(v15 + 8), *(_BYTE *)(v15 + 16));
    swift_bridgeObjectRelease();
  }
  v27 = *(_OWORD *)(v16 + 16);
  *(_OWORD *)v15 = *(_OWORD *)v16;
  *(_OWORD *)(v15 + 16) = v27;
LABEL_8:
  v28 = (v15 + 39) & 0xFFFFFFFFFFFFFFF8;
  v29 = (v16 + 39) & 0xFFFFFFFFFFFFFFF8;
  v30 = *(_QWORD *)(v29 + 24);
  if (*(_QWORD *)(v28 + 24) < 0xFFFFFFFFuLL)
  {
    if (v30 >= 0xFFFFFFFF)
    {
      v37 = *(_QWORD *)v29;
      v38 = *(_QWORD *)(v29 + 8);
      v39 = *(_BYTE *)(v29 + 16);
      sub_2355914F4(*(_QWORD *)v29, v38, v39);
      *(_QWORD *)v28 = v37;
      *(_QWORD *)(v28 + 8) = v38;
      *(_BYTE *)(v28 + 16) = v39;
      *(_QWORD *)(v28 + 24) = *(_QWORD *)(v29 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_15;
    }
  }
  else
  {
    if (v30 >= 0xFFFFFFFF)
    {
      v31 = *(_QWORD *)v29;
      v32 = *(_QWORD *)(v29 + 8);
      v33 = *(_BYTE *)(v29 + 16);
      sub_2355914F4(*(_QWORD *)v29, v32, v33);
      v34 = *(_QWORD *)v28;
      v35 = *(_QWORD *)(v28 + 8);
      v36 = *(_BYTE *)(v28 + 16);
      *(_QWORD *)v28 = v31;
      *(_QWORD *)(v28 + 8) = v32;
      *(_BYTE *)(v28 + 16) = v33;
      sub_235591958(v34, v35, v36);
      *(_QWORD *)(v28 + 24) = *(_QWORD *)(v29 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    sub_235591958(*(_QWORD *)v28, *(_QWORD *)(v28 + 8), *(_BYTE *)(v28 + 16));
    swift_bridgeObjectRelease();
  }
  v40 = *(_OWORD *)(v29 + 16);
  *(_OWORD *)v28 = *(_OWORD *)v29;
  *(_OWORD *)(v28 + 16) = v40;
LABEL_15:
  v41 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
  v42 = (v29 + 39) & 0xFFFFFFFFFFFFFFF8;
  v43 = *(_QWORD *)(v42 + 24);
  if (*(_QWORD *)(v41 + 24) < 0xFFFFFFFFuLL)
  {
    if (v43 >= 0xFFFFFFFF)
    {
      v50 = *(_QWORD *)v42;
      v51 = *(_QWORD *)(v42 + 8);
      v52 = *(_BYTE *)(v42 + 16);
      sub_2355914F4(*(_QWORD *)v42, v51, v52);
      *(_QWORD *)v41 = v50;
      *(_QWORD *)(v41 + 8) = v51;
      *(_BYTE *)(v41 + 16) = v52;
      *(_QWORD *)(v41 + 24) = *(_QWORD *)(v42 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_22;
    }
  }
  else
  {
    if (v43 >= 0xFFFFFFFF)
    {
      v44 = *(_QWORD *)v42;
      v45 = *(_QWORD *)(v42 + 8);
      v46 = *(_BYTE *)(v42 + 16);
      sub_2355914F4(*(_QWORD *)v42, v45, v46);
      v47 = *(_QWORD *)v41;
      v48 = *(_QWORD *)(v41 + 8);
      v49 = *(_BYTE *)(v41 + 16);
      *(_QWORD *)v41 = v44;
      *(_QWORD *)(v41 + 8) = v45;
      *(_BYTE *)(v41 + 16) = v46;
      sub_235591958(v47, v48, v49);
      *(_QWORD *)(v41 + 24) = *(_QWORD *)(v42 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_22;
    }
    sub_235591958(*(_QWORD *)v41, *(_QWORD *)(v41 + 8), *(_BYTE *)(v41 + 16));
    swift_bridgeObjectRelease();
  }
  v53 = *(_OWORD *)(v42 + 16);
  *(_OWORD *)v41 = *(_OWORD *)v42;
  *(_OWORD *)(v41 + 16) = v53;
LABEL_22:
  v54 = (v41 + 39) & 0xFFFFFFFFFFFFFFF8;
  v55 = (v42 + 39) & 0xFFFFFFFFFFFFFFF8;
  v56 = *(_QWORD *)v55;
  v57 = *(_QWORD *)(v55 + 8);
  v58 = *(_BYTE *)(v55 + 16);
  sub_235591504(*(_QWORD *)v55, v57, v58);
  v59 = *(_QWORD *)v54;
  v60 = *(_QWORD *)(v54 + 8);
  *(_QWORD *)v54 = v56;
  *(_QWORD *)(v54 + 8) = v57;
  v61 = *(_BYTE *)(v54 + 16);
  *(_BYTE *)(v54 + 16) = v58;
  sub_23558A9F8(v59, v60, v61);
  v62 = (_QWORD *)((v41 + 63) & 0xFFFFFFFFFFFFFFF8);
  v63 = (_QWORD *)((v42 + 63) & 0xFFFFFFFFFFFFFFF8);
  v64 = v63[1];
  *v62 = *v63;
  v62[1] = v64;
  swift_retain();
  swift_release();
  v65 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  v66 = (a1 + v65 + 7) & 0xFFFFFFFFFFFFFFF8;
  v67 = (a2 + v65 + 7) & 0xFFFFFFFFFFFFFFF8;
  v68 = *(_QWORD *)v67;
  LOBYTE(v56) = *(_BYTE *)(v67 + 8);
  sub_23558C900(*(_QWORD *)v67, v56);
  v69 = *(_QWORD *)v66;
  v70 = *(_BYTE *)(v66 + 8);
  *(_QWORD *)v66 = v68;
  *(_BYTE *)(v66 + 8) = v56;
  sub_23558CA44(v69, v70);
  v71 = sub_2355C870C();
  v72 = *(_QWORD *)(v71 - 8);
  v73 = *(_DWORD *)(v72 + 80) & 0xF8;
  v74 = v73 + 16;
  v75 = v73 + 16 + v66;
  v76 = ~v73 & 0xFFFFFFFFFFFFFFF8;
  v77 = (_QWORD *)(v75 & v76);
  v78 = (_QWORD *)((v74 + v67) & v76);
  if (*(_QWORD *)(v72 + 64) <= 8uLL)
    v79 = 8;
  else
    v79 = *(_QWORD *)(v72 + 64);
  if (v77 != v78)
  {
    v80 = v71;
    v81 = *((unsigned __int8 *)v77 + v79);
    if (v81 >= 2)
    {
      if (v79 <= 3)
        v82 = v79;
      else
        v82 = 4;
      __asm { BR              X12 }
    }
    if (v81 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v72 + 8))(v77, v71);
    else
      swift_release();
    v83 = *((unsigned __int8 *)v78 + v79);
    if (v83 >= 2)
    {
      if (v79 <= 3)
        v84 = v79;
      else
        v84 = 4;
      __asm { BR              X12 }
    }
    if (v83 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v72 + 16))(v77, v78, v80);
      *((_BYTE *)v77 + v79) = 1;
    }
    else
    {
      *v77 = *v78;
      *((_BYTE *)v77 + v79) = 0;
      swift_retain();
    }
  }
  v85 = sub_2355C8400();
  v86 = *(_QWORD *)(v85 - 8);
  v87 = *(_DWORD *)(v86 + 84);
  v88 = *(_DWORD *)(v86 + 80) & 0xF8 | 7;
  v89 = v79 + v88 + 1;
  v90 = (_QWORD *)(((unint64_t)v77 + v89) & ~v88);
  v91 = (_QWORD *)(((unint64_t)v78 + v89) & ~v88);
  v92 = *(_QWORD *)(v86 + 64);
  if (v90 != v91)
  {
    v93 = v85;
    if (v87)
      v94 = *(_QWORD *)(v86 + 64);
    else
      v94 = v92 + 1;
    if (v94 <= 8)
      v95 = 8;
    else
      v95 = v94;
    v96 = *((unsigned __int8 *)v90 + v95);
    if (v96 >= 2)
    {
      if (v95 <= 3)
        v97 = v95;
      else
        v97 = 4;
      __asm { BR              X12 }
    }
    if (v96 == 1)
    {
      if (!(*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v86 + 48))(v90, 1, v85))
        (*(void (**)(_QWORD *, uint64_t))(v86 + 8))(v90, v93);
    }
    else
    {
      swift_release();
    }
    v98 = *((unsigned __int8 *)v91 + v95);
    if (v98 >= 2)
    {
      if (v95 <= 3)
        v99 = v95;
      else
        v99 = 4;
      __asm { BR              X12 }
    }
    if (v98 == 1)
    {
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v86 + 48))(v91, 1, v93))
      {
        memcpy(v90, v91, v94);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v86 + 16))(v90, v91, v93);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v86 + 56))(v90, 0, 1, v93);
      }
      *((_BYTE *)v90 + v95) = 1;
    }
    else
    {
      *v90 = *v91;
      *((_BYTE *)v90 + v95) = 0;
      swift_retain();
    }
  }
  if (v87)
    v100 = v92;
  else
    v100 = v92 + 1;
  v101 = 8;
  if (v100 <= 8)
    v102 = 8;
  else
    v102 = v100;
  v103 = sub_2355C8994();
  v104 = *(_QWORD *)(v103 - 8);
  v105 = *(_DWORD *)(v104 + 80) & 0xF8 | 7;
  v106 = v102 + v105 + 1;
  v107 = (_QWORD *)(((unint64_t)v90 + v106) & ~v105);
  v108 = (_QWORD *)(((unint64_t)v91 + v106) & ~v105);
  if (*(_QWORD *)(v104 + 64) > 8uLL)
    v101 = *(_QWORD *)(v104 + 64);
  if (v107 != v108)
  {
    v109 = v103;
    v110 = *((unsigned __int8 *)v107 + v101);
    if (v110 >= 2)
    {
      if (v101 <= 3)
        v111 = v101;
      else
        v111 = 4;
      __asm { BR              X12 }
    }
    if (v110 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v104 + 8))(v107, v103);
    else
      swift_release();
    v112 = *((unsigned __int8 *)v108 + v101);
    if (v112 >= 2)
    {
      if (v101 <= 3)
        v113 = v101;
      else
        v113 = 4;
      __asm { BR              X12 }
    }
    if (v112 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v104 + 16))(v107, v108, v109);
      *((_BYTE *)v107 + v101) = 1;
    }
    else
    {
      *v107 = *v108;
      *((_BYTE *)v107 + v101) = 0;
      swift_retain();
    }
  }
  v114 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v115 = *(_QWORD *)(v114 - 8);
  v116 = *(unsigned __int8 *)(v115 + 80);
  v117 = v101 + v116 + 1;
  v118 = ((unint64_t)v107 + v117) & ~v116;
  v119 = ((unint64_t)v108 + v117) & ~v116;
  v120 = *(void (**)(unint64_t, unint64_t, uint64_t))(v115 + 24);
  v120(v118, v119, v114);
  v120((*(_QWORD *)(v115 + 64) + v116 + v118) & ~v116, (*(_QWORD *)(v115 + 64) + v116 + v119) & ~v116, v114);
  return a1;
}

uint64_t sub_2355B7DCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  __int128 v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;
  _OWORD *v13;
  _OWORD *v14;
  __int128 v15;
  _OWORD *v16;
  _OWORD *v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  size_t v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  unsigned int v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  void (*v65)(unint64_t, unint64_t, uint64_t);

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  v10 = (_OWORD *)(((unint64_t)v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  v11 = (_OWORD *)(((unint64_t)v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  v13 = (_OWORD *)(((unint64_t)v10 + 39) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_OWORD *)(((unint64_t)v11 + 39) & 0xFFFFFFFFFFFFFFF8);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = (_OWORD *)(((unint64_t)v13 + 39) & 0xFFFFFFFFFFFFFFF8);
  v17 = (_OWORD *)(((unint64_t)v14 + 39) & 0xFFFFFFFFFFFFFFF8);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = ((unint64_t)v16 + 39) & 0xFFFFFFFFFFFFFFF8;
  v20 = ((unint64_t)v17 + 39) & 0xFFFFFFFFFFFFFFF8;
  v21 = *(_BYTE *)(v20 + 16);
  *(_OWORD *)v19 = *(_OWORD *)v20;
  *(_BYTE *)(v19 + 16) = v21;
  *(_OWORD *)(((unint64_t)v16 + 63) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v17 + 63) & 0xFFFFFFFFFFFFF8);
  v22 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  v23 = (a1 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  v24 = (a2 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  LOBYTE(v22) = *(_BYTE *)(v24 + 8);
  *(_QWORD *)v23 = *(_QWORD *)v24;
  *(_BYTE *)(v23 + 8) = v22;
  v25 = sub_2355C870C();
  v26 = *(_QWORD *)(v25 - 8);
  v27 = *(_DWORD *)(v26 + 80) & 0xF8;
  v28 = v27 + 16;
  v29 = v27 + 16 + v23;
  v30 = ~v27 & 0xFFFFFFFFFFFFFFF8;
  v31 = (_QWORD *)(v29 & v30);
  v32 = (_QWORD *)((v28 + v24) & v30);
  if (*(_QWORD *)(v26 + 64) <= 8uLL)
    v33 = 8;
  else
    v33 = *(_QWORD *)(v26 + 64);
  v34 = *((unsigned __int8 *)v32 + v33);
  if (v34 >= 2)
  {
    if (v33 <= 3)
      v35 = v33;
    else
      v35 = 4;
    __asm { BR              X13 }
  }
  if (v34 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v26 + 32))(v31, v32, v25);
    v36 = 1;
  }
  else
  {
    v36 = 0;
    *v31 = *v32;
  }
  *((_BYTE *)v31 + v33) = v36;
  v37 = v33 + 1;
  v38 = sub_2355C8400();
  v39 = *(_QWORD *)(v38 - 8);
  v40 = *(_DWORD *)(v39 + 80) & 0xF8 | 7;
  v41 = v37 + v40;
  v42 = (_QWORD *)(((unint64_t)v31 + v37 + v40) & ~v40);
  v43 = (_QWORD *)(((unint64_t)v32 + v41) & ~v40);
  if (*(_DWORD *)(v39 + 84))
    v44 = *(_QWORD *)(v39 + 64);
  else
    v44 = *(_QWORD *)(v39 + 64) + 1;
  if (v44 <= 8)
    v45 = 8;
  else
    v45 = v44;
  v46 = *((unsigned __int8 *)v43 + v45);
  if (v46 >= 2)
  {
    if (v45 <= 3)
      v47 = v45;
    else
      v47 = 4;
    __asm { BR              X12 }
  }
  if (v46 == 1)
  {
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v39 + 48))(v43, 1, v38))
    {
      memcpy(v42, v43, v44);
      v48 = 1;
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v39 + 32))(v42, v43, v38);
      v48 = 1;
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v39 + 56))(v42, 0, 1, v38);
    }
  }
  else
  {
    v48 = 0;
    *v42 = *v43;
  }
  *((_BYTE *)v42 + v45) = v48;
  v49 = sub_2355C8994();
  v50 = *(_QWORD *)(v49 - 8);
  v51 = *(_DWORD *)(v50 + 80) & 0xF8 | 7;
  v52 = v45 + v51 + 1;
  v53 = (_QWORD *)(((unint64_t)v42 + v52) & ~v51);
  v54 = (_QWORD *)(((unint64_t)v43 + v52) & ~v51);
  if (*(_QWORD *)(v50 + 64) <= 8uLL)
    v55 = 8;
  else
    v55 = *(_QWORD *)(v50 + 64);
  v56 = *((unsigned __int8 *)v54 + v55);
  if (v56 >= 2)
  {
    if (v55 <= 3)
      v57 = v55;
    else
      v57 = 4;
    __asm { BR              X13 }
  }
  if (v56 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v50 + 32))(v53, v54, v49);
    v58 = 1;
  }
  else
  {
    v58 = 0;
    *v53 = *v54;
  }
  *((_BYTE *)v53 + v55) = v58;
  v59 = v55 + 1;
  v60 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v61 = *(_QWORD *)(v60 - 8);
  v62 = *(unsigned __int8 *)(v61 + 80);
  v63 = ((unint64_t)v53 + v59 + v62) & ~v62;
  v64 = ((unint64_t)v54 + v59 + v62) & ~v62;
  v65 = *(void (**)(unint64_t, unint64_t, uint64_t))(v61 + 32);
  v65(v63, v64, v60);
  v65((*(_QWORD *)(v61 + 64) + v62 + v63) & ~v62, (*(_QWORD *)(v61 + 64) + v62 + v64) & ~v62, v60);
  return a1;
}

uint64_t sub_2355B826C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  unint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  _QWORD *v67;
  unint64_t v68;
  uint64_t v69;
  size_t v70;
  uint64_t v71;
  unsigned int v72;
  uint64_t v73;
  unsigned int v74;
  uint64_t v75;
  char v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  _QWORD *v85;
  uint64_t v86;
  unsigned int v87;
  uint64_t v88;
  unsigned int v89;
  uint64_t v90;
  char v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  void (*v98)(unint64_t, unint64_t, uint64_t);

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_BYTE *)(v8 + 16);
  v10 = *(_QWORD *)v7;
  v11 = *(_QWORD *)(v7 + 8);
  v12 = *(_BYTE *)(v7 + 16);
  *(_OWORD *)v7 = *(_OWORD *)v8;
  *(_BYTE *)(v7 + 16) = v9;
  sub_235591958(v10, v11, v12);
  *(_QWORD *)(v7 + 24) = *(_QWORD *)(v8 + 24);
  swift_bridgeObjectRelease();
  v13 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  v14 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v13 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(_QWORD *)(v14 + 24) >= 0xFFFFFFFFuLL)
    {
      v15 = *(_BYTE *)(v14 + 16);
      v16 = *(_QWORD *)v13;
      v17 = *(_QWORD *)(v13 + 8);
      v18 = *(_BYTE *)(v13 + 16);
      *(_OWORD *)v13 = *(_OWORD *)v14;
      *(_BYTE *)(v13 + 16) = v15;
      sub_235591958(v16, v17, v18);
      *(_QWORD *)(v13 + 24) = *(_QWORD *)(v14 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_235591958(*(_QWORD *)v13, *(_QWORD *)(v13 + 8), *(_BYTE *)(v13 + 16));
    swift_bridgeObjectRelease();
  }
  v19 = *(_OWORD *)(v14 + 16);
  *(_OWORD *)v13 = *(_OWORD *)v14;
  *(_OWORD *)(v13 + 16) = v19;
LABEL_6:
  v20 = (v13 + 39) & 0xFFFFFFFFFFFFFFF8;
  v21 = (v14 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v20 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(_QWORD *)(v21 + 24) >= 0xFFFFFFFFuLL)
    {
      v22 = *(_BYTE *)(v21 + 16);
      v23 = *(_QWORD *)v20;
      v24 = *(_QWORD *)(v20 + 8);
      v25 = *(_BYTE *)(v20 + 16);
      *(_OWORD *)v20 = *(_OWORD *)v21;
      *(_BYTE *)(v20 + 16) = v22;
      sub_235591958(v23, v24, v25);
      *(_QWORD *)(v20 + 24) = *(_QWORD *)(v21 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    sub_235591958(*(_QWORD *)v20, *(_QWORD *)(v20 + 8), *(_BYTE *)(v20 + 16));
    swift_bridgeObjectRelease();
  }
  v26 = *(_OWORD *)(v21 + 16);
  *(_OWORD *)v20 = *(_OWORD *)v21;
  *(_OWORD *)(v20 + 16) = v26;
LABEL_11:
  v27 = (v20 + 39) & 0xFFFFFFFFFFFFFFF8;
  v28 = (v21 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v27 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(_QWORD *)(v28 + 24) >= 0xFFFFFFFFuLL)
    {
      v29 = *(_BYTE *)(v28 + 16);
      v30 = *(_QWORD *)v27;
      v31 = *(_QWORD *)(v27 + 8);
      v32 = *(_BYTE *)(v27 + 16);
      *(_OWORD *)v27 = *(_OWORD *)v28;
      *(_BYTE *)(v27 + 16) = v29;
      sub_235591958(v30, v31, v32);
      *(_QWORD *)(v27 + 24) = *(_QWORD *)(v28 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_16;
    }
    sub_235591958(*(_QWORD *)v27, *(_QWORD *)(v27 + 8), *(_BYTE *)(v27 + 16));
    swift_bridgeObjectRelease();
  }
  v33 = *(_OWORD *)(v28 + 16);
  *(_OWORD *)v27 = *(_OWORD *)v28;
  *(_OWORD *)(v27 + 16) = v33;
LABEL_16:
  v34 = (v27 + 39) & 0xFFFFFFFFFFFFFFF8;
  v35 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
  v36 = *(_BYTE *)(v35 + 16);
  v37 = *(_QWORD *)v34;
  v38 = *(_QWORD *)(v34 + 8);
  *(_OWORD *)v34 = *(_OWORD *)v35;
  v39 = *(_BYTE *)(v34 + 16);
  *(_BYTE *)(v34 + 16) = v36;
  sub_23558A9F8(v37, v38, v39);
  *(_OWORD *)((v27 + 63) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v28 + 63) & 0xFFFFFFFFFFFFF8);
  swift_release();
  v40 = (((((((((v6 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  v41 = (a1 + v40 + 7) & 0xFFFFFFFFFFFFFFF8;
  v42 = (a2 + v40 + 7) & 0xFFFFFFFFFFFFFFF8;
  v43 = *(_BYTE *)(v42 + 8);
  v44 = *(_QWORD *)v41;
  v45 = *(_BYTE *)(v41 + 8);
  *(_QWORD *)v41 = *(_QWORD *)v42;
  *(_BYTE *)(v41 + 8) = v43;
  sub_23558CA44(v44, v45);
  v46 = sub_2355C870C();
  v47 = *(_QWORD *)(v46 - 8);
  v48 = *(_DWORD *)(v47 + 80) & 0xF8;
  v49 = v48 + 16;
  v50 = v48 + 16 + v41;
  v51 = ~v48 & 0xFFFFFFFFFFFFFFF8;
  v52 = (_QWORD *)(v50 & v51);
  v53 = (_QWORD *)((v49 + v42) & v51);
  if (*(_QWORD *)(v47 + 64) <= 8uLL)
    v54 = 8;
  else
    v54 = *(_QWORD *)(v47 + 64);
  if (v52 != v53)
  {
    v55 = v46;
    v56 = *((unsigned __int8 *)v52 + v54);
    if (v56 >= 2)
    {
      if (v54 <= 3)
        v57 = v54;
      else
        v57 = 4;
      __asm { BR              X12 }
    }
    if (v56 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v47 + 8))(v52, v46);
    else
      swift_release();
    v58 = *((unsigned __int8 *)v53 + v54);
    if (v58 >= 2)
    {
      if (v54 <= 3)
        v59 = v54;
      else
        v59 = 4;
      __asm { BR              X12 }
    }
    if (v58 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v47 + 32))(v52, v53, v55);
      v60 = 1;
    }
    else
    {
      v60 = 0;
      *v52 = *v53;
    }
    *((_BYTE *)v52 + v54) = v60;
  }
  v61 = sub_2355C8400();
  v62 = *(_QWORD *)(v61 - 8);
  v63 = *(_DWORD *)(v62 + 84);
  v64 = *(_DWORD *)(v62 + 80) & 0xF8 | 7;
  v65 = v54 + v64 + 1;
  v66 = (_QWORD *)(((unint64_t)v52 + v65) & ~v64);
  v67 = (_QWORD *)(((unint64_t)v53 + v65) & ~v64);
  v68 = *(_QWORD *)(v62 + 64);
  if (v66 != v67)
  {
    v69 = v61;
    if (v63)
      v70 = *(_QWORD *)(v62 + 64);
    else
      v70 = v68 + 1;
    if (v70 <= 8)
      v71 = 8;
    else
      v71 = v70;
    v72 = *((unsigned __int8 *)v66 + v71);
    if (v72 >= 2)
    {
      if (v71 <= 3)
        v73 = v71;
      else
        v73 = 4;
      __asm { BR              X12 }
    }
    if (v72 == 1)
    {
      if (!(*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v62 + 48))(v66, 1, v61))
        (*(void (**)(_QWORD *, uint64_t))(v62 + 8))(v66, v69);
    }
    else
    {
      swift_release();
    }
    v74 = *((unsigned __int8 *)v67 + v71);
    if (v74 >= 2)
    {
      if (v71 <= 3)
        v75 = v71;
      else
        v75 = 4;
      __asm { BR              X12 }
    }
    if (v74 == 1)
    {
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v62 + 48))(v67, 1, v69))
      {
        memcpy(v66, v67, v70);
        v76 = 1;
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v62 + 32))(v66, v67, v69);
        v76 = 1;
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v62 + 56))(v66, 0, 1, v69);
      }
    }
    else
    {
      v76 = 0;
      *v66 = *v67;
    }
    *((_BYTE *)v66 + v71) = v76;
  }
  if (v63)
    v77 = v68;
  else
    v77 = v68 + 1;
  v78 = 8;
  if (v77 <= 8)
    v79 = 8;
  else
    v79 = v77;
  v80 = sub_2355C8994();
  v81 = *(_QWORD *)(v80 - 8);
  v82 = *(_DWORD *)(v81 + 80) & 0xF8 | 7;
  v83 = v79 + v82 + 1;
  v84 = (_QWORD *)(((unint64_t)v66 + v83) & ~v82);
  v85 = (_QWORD *)(((unint64_t)v67 + v83) & ~v82);
  if (*(_QWORD *)(v81 + 64) > 8uLL)
    v78 = *(_QWORD *)(v81 + 64);
  if (v84 != v85)
  {
    v86 = v80;
    v87 = *((unsigned __int8 *)v84 + v78);
    if (v87 >= 2)
    {
      if (v78 <= 3)
        v88 = v78;
      else
        v88 = 4;
      __asm { BR              X12 }
    }
    if (v87 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v81 + 8))(v84, v80);
    else
      swift_release();
    v89 = *((unsigned __int8 *)v85 + v78);
    if (v89 >= 2)
    {
      if (v78 <= 3)
        v90 = v78;
      else
        v90 = 4;
      __asm { BR              X12 }
    }
    if (v89 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v81 + 32))(v84, v85, v86);
      v91 = 1;
    }
    else
    {
      v91 = 0;
      *v84 = *v85;
    }
    *((_BYTE *)v84 + v78) = v91;
  }
  v92 = __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  v93 = *(_QWORD *)(v92 - 8);
  v94 = *(unsigned __int8 *)(v93 + 80);
  v95 = v78 + v94 + 1;
  v96 = ((unint64_t)v84 + v95) & ~v94;
  v97 = ((unint64_t)v85 + v95) & ~v94;
  v98 = *(void (**)(unint64_t, unint64_t, uint64_t))(v93 + 40);
  v98(v96, v97, v92);
  v98((*(_QWORD *)(v93 + 64) + v94 + v96) & ~v94, (*(_QWORD *)(v93 + 64) + v94 + v97) & ~v94, v92);
  return a1;
}

uint64_t sub_2355B8A88(unint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  int v32;
  unsigned int v34;
  int v35;
  int v36;
  uint64_t (*v37)(unint64_t);
  unint64_t v38;
  unsigned int v39;
  unint64_t v40;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v39 = *(_DWORD *)(v4 + 84);
  if (v39 <= 0x7FFFFFFF)
    v5 = 0x7FFFFFFF;
  else
    v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(sub_2355C870C() - 8);
  v7 = *(_QWORD *)(v6 + 64);
  if (v7 <= 8)
    v7 = 8;
  v40 = v7;
  v8 = *(_QWORD *)(sub_2355C8400() - 8);
  v9 = *(_DWORD *)(v8 + 84);
  v10 = *(_QWORD *)(v8 + 64);
  v11 = *(_QWORD *)(sub_2355C8994() - 8);
  if (*(_QWORD *)(v11 + 64) <= 8uLL)
    v12 = 8;
  else
    v12 = *(_QWORD *)(v11 + 64);
  v13 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_256248E08) - 8);
  v14 = *(_DWORD *)(v13 + 84);
  if (v14 <= v5)
    v15 = v5;
  else
    v15 = *(_DWORD *)(v13 + 84);
  if (v9)
    v16 = v10;
  else
    v16 = v10 + 1;
  if (v16 <= 8)
    v17 = 8;
  else
    v17 = v16;
  if (!a2)
    return 0;
  v18 = *(_QWORD *)(v4 + 64);
  v19 = (((((((((v18 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
       + 63) & 0xFFFFFFFFFFFFFFF8;
  v20 = *(_DWORD *)(v6 + 80) & 0xF8;
  v21 = ~v20 & 0xFFFFFFFFFFFFFFF8;
  v22 = v20 + 16;
  v23 = *(_DWORD *)(v8 + 80) & 0xF8 | 7;
  v24 = a1;
  v25 = v40 + v23 + 1;
  v26 = *(_DWORD *)(v11 + 80) & 0xF8 | 7;
  v27 = v17 + v26 + 1;
  v28 = *(unsigned __int8 *)(v13 + 80);
  v29 = v12 + v28 + 1;
  if (a2 <= v15)
    goto LABEL_38;
  v30 = ((*(_QWORD *)(v13 + 64)
        + v28
        + ((v29 + ((v27 + ((v25 + ((v22 + ((v19 + 23) & 0xFFFFFFFFFFFFFFF8)) & v21)) & ~v23)) & ~v26)) & ~v28)) & ~v28)
      + *(_QWORD *)(v13 + 64);
  v31 = 8 * v30;
  if (v30 > 3)
    goto LABEL_21;
  v34 = ((a2 - v15 + ~(-1 << v31)) >> v31) + 1;
  if (HIWORD(v34))
  {
    v32 = *(_DWORD *)(a1 + v30);
    if (v32)
      goto LABEL_29;
  }
  else
  {
    if (v34 <= 0xFF)
    {
      if (v34 < 2)
        goto LABEL_38;
LABEL_21:
      v32 = *(unsigned __int8 *)(a1 + v30);
      if (!*(_BYTE *)(a1 + v30))
        goto LABEL_38;
LABEL_29:
      v35 = (v32 - 1) << v31;
      if (v30 > 3)
        v35 = 0;
      if ((_DWORD)v30)
      {
        if (v30 <= 3)
          v36 = v30;
        else
          v36 = 4;
        __asm { BR              X12 }
      }
      return v15 + v35 + 1;
    }
    v32 = *(unsigned __int16 *)(a1 + v30);
    if (*(_WORD *)(a1 + v30))
      goto LABEL_29;
  }
LABEL_38:
  if (v5 < v14)
  {
    v24 = (v29 + ((v27 + ((v25 + ((v22 + ((a1 + v19 + 23) & 0xFFFFFFFFFFFFFFF8)) & v21)) & ~v23)) & ~v26)) & ~v28;
    v37 = *(uint64_t (**)(unint64_t))(v13 + 48);
    return v37(v24);
  }
  if (v39 >= 0x7FFFFFFF)
  {
    v37 = *(uint64_t (**)(unint64_t))(v4 + 48);
    return v37(v24);
  }
  v38 = *(_QWORD *)(((a1 + v18 + 7) & 0xFFFFFFFFFFFFF8) + 0x18);
  if (v38 >= 0xFFFFFFFF)
    LODWORD(v38) = -1;
  return (v38 + 1);
}

void sub_2355B8DA8(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  size_t v19;
  _BYTE *v20;
  unsigned int v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  int v25;

  v4 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v4 + 84) <= 0x7FFFFFFFu)
    v5 = 0x7FFFFFFF;
  else
    v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(sub_2355C870C() - 8);
  if (*(_QWORD *)(v6 + 64) <= 8uLL)
    v7 = 8;
  else
    v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(sub_2355C8400() - 8);
  v9 = *(_DWORD *)(v8 + 84);
  v10 = *(_QWORD *)(v8 + 64);
  v11 = *(_QWORD *)(sub_2355C8994() - 8);
  if (*(_QWORD *)(v11 + 64) <= 8uLL)
    v12 = 8;
  else
    v12 = *(_QWORD *)(v11 + 64);
  v13 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_256248E08) - 8);
  if (*(_DWORD *)(v13 + 84) <= v5)
    v14 = v5;
  else
    v14 = *(_DWORD *)(v13 + 84);
  if (v9)
    v17 = v10;
  else
    v17 = v10 + 1;
  if (v17 <= 8)
    v17 = 8;
  v18 = *(_DWORD *)(v11 + 80) & 0xF8 | 7;
  v15 = *(_DWORD *)(v6 + 80) & 0xF8;
  v16 = *(_DWORD *)(v8 + 80) & 0xF8 | 7;
  v19 = ((*(_QWORD *)(v13 + 64)
        + *(unsigned __int8 *)(v13 + 80)
        + ((v12
          + *(unsigned __int8 *)(v13 + 80)
          + 1
          + ((v17
            + v18
            + 1
            + ((v7
              + v16
              + 1
              + ((v15
                + 16
                + ((((((((((((*(_QWORD *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
                      + 39) & 0xFFFFFFFFFFFFFFF8)
                    + 63) & 0xFFFFFFFFFFFFFFF8)
                  + 23) & 0xFFFFFFFFFFFFFFF8)) & ~v15 & 0xFFFFFFFFFFFFFFF8)) & ~v16)) & ~v18)) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))
      + *(_QWORD *)(v13 + 64);
  if (a3 <= v14)
  {
    v22 = 0;
    v20 = a1;
    v21 = a2;
  }
  else
  {
    v20 = a1;
    v21 = a2;
    if (v19 <= 3)
    {
      v24 = ((a3 - v14 + ~(-1 << (8 * v19))) >> (8 * v19)) + 1;
      if (HIWORD(v24))
      {
        v22 = 4u;
      }
      else if (v24 >= 0x100)
      {
        v22 = 2;
      }
      else
      {
        v22 = v24 > 1;
      }
    }
    else
    {
      v22 = 1u;
    }
  }
  if (v14 < v21)
  {
    v23 = ~v14 + v21;
    if (v19 < 4)
    {
      if ((_DWORD)v19)
      {
        v25 = v23 & ~(-1 << (8 * v19));
        bzero(v20, v19);
        if ((_DWORD)v19 == 3)
        {
          *(_WORD *)v20 = v25;
          v20[2] = BYTE2(v25);
        }
        else if ((_DWORD)v19 == 2)
        {
          *(_WORD *)v20 = v25;
        }
        else
        {
          *v20 = v25;
        }
      }
    }
    else
    {
      bzero(v20, v19);
      *(_DWORD *)v20 = v23;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X5 }
}

uint64_t type metadata accessor for CompactManagedAppCell(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CompactManagedAppCell);
}

uint64_t sub_2355B918C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2355B91C0(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t TupleTypeMetadata;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  __int128 *v12;
  _OWORD *v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  v4 = a1;
  v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    TupleTypeMetadata = *v5;
    MEMORY[0x24BDAC7A8](a1);
    v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
LABEL_12:
    v22 = 32;
    v23 = a2;
    do
    {
      if (a2 == 1)
        v24 = 0;
      else
        v24 = *(_DWORD *)(TupleTypeMetadata + v22);
      v26 = *v5++;
      v25 = v26;
      v27 = *v4++;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(&v8[v24], v27);
      v22 += 16;
      --v23;
    }
    while (v23);
    return sub_2355C8E5C();
  }
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v11 = 0;
    if (a2 < 4)
      goto LABEL_9;
    if ((unint64_t)(v10 - (char *)v5) < 0x20)
      goto LABEL_9;
    v11 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    v12 = (__int128 *)(v5 + 2);
    v13 = v10 + 16;
    v14 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      v15 = *v12;
      *(v13 - 1) = *(v12 - 1);
      *v13 = v15;
      v12 += 2;
      v13 += 2;
      v14 -= 4;
    }
    while (v14);
    if (v11 != a2)
    {
LABEL_9:
      v16 = a2 - v11;
      v17 = v11;
      v18 = &v10[8 * v11];
      v19 = &v5[v17];
      do
      {
        v20 = *v19++;
        *(_QWORD *)v18 = v20;
        v18 += 8;
        --v16;
      }
      while (v16);
    }
  }
  TupleTypeMetadata = swift_getTupleTypeMetadata();
  MEMORY[0x24BDAC7A8](TupleTypeMetadata);
  v8 = (char *)&v29 - v21;
  if (a2)
    goto LABEL_12;
  return sub_2355C8E5C();
}

uint64_t sub_2355B9374()
{
  return sub_2355C8844();
}

uint64_t sub_2355B9394(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_2355C870C();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2355C8850();
}

uint64_t sub_2355B9410@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  uint64_t OpaqueTypeConformance2;
  uint64_t v36;
  uint64_t v37;
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
  _QWORD v51[2];
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v48 = a2;
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  sub_2355C8820();
  sub_2355C89D0();
  sub_2355C8AB4();
  sub_2355C8820();
  sub_2355C8820();
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D18);
  v54 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D20);
  v55 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D28);
  swift_getTupleTypeMetadata();
  v3 = sub_2355C8E50();
  v4 = MEMORY[0x24BDF5428];
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDF5428], v3);
  v5 = sub_2355C8D90();
  v46 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF4498], v5);
  v47 = v5;
  v52 = v5;
  v53 = v46;
  v6 = MEMORY[0x24BDF2F10];
  v7 = MEMORY[0x23B7CFBA4](0, &v52, MEMORY[0x24BDF2F10], 0);
  v40 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v42 = (uint64_t)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v41 = (uint64_t)&v39 - v10;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  sub_2355C8820();
  sub_2355C89D0();
  sub_2355C8820();
  sub_2355C8820();
  v52 = sub_2355C8820();
  v53 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D30);
  v54 = type metadata accessor for OfferView();
  v55 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D38);
  swift_getTupleTypeMetadata();
  v11 = sub_2355C8E50();
  MEMORY[0x23B7CFBF8](v4, v11);
  sub_2355C8DE4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EE8);
  sub_2355C8820();
  swift_getTupleTypeMetadata2();
  v12 = sub_2355C8E50();
  MEMORY[0x23B7CFBF8](v4, v12);
  v13 = sub_2355C8D90();
  v49 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF4498], v13);
  v50 = v13;
  v52 = v13;
  v53 = v49;
  v14 = MEMORY[0x23B7CFBA4](0, &v52, v6, 0);
  v39 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v39 - v18;
  v20 = sub_2355C8994();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v39 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = v7;
  v24 = sub_2355C89D0();
  v43 = *(_QWORD *)(v24 - 8);
  v44 = v24;
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v39 - v25;
  sub_23559D9EC((uint64_t)v23);
  v27 = sub_2355C8988();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  if ((v27 & 1) != 0)
  {
    sub_2355B9AB4(a1, (uint64_t)v17);
    v52 = v50;
    v53 = v49;
    swift_getOpaqueTypeConformance2();
    sub_2355C82E4((uint64_t)v17, v14, (uint64_t)v19);
    v28 = *(void (**)(char *, uint64_t))(v39 + 8);
    v28(v17, v14);
    sub_2355C4BF4((uint64_t)v19, v14, (uint64_t)v17);
    v30 = v46;
    v29 = v47;
    v52 = v47;
    v53 = v46;
    swift_getOpaqueTypeConformance2();
    sub_2355C4C0C((uint64_t)v17, v14);
    v28(v17, v14);
    v28(v19, v14);
  }
  else
  {
    v31 = v42;
    sub_2355B9D78(a1, v42);
    v30 = v46;
    v29 = v47;
    v52 = v47;
    v53 = v46;
    swift_getOpaqueTypeConformance2();
    v32 = v41;
    v33 = v45;
    sub_2355C82E4(v31, v45, v41);
    v34 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
    v34(v31, v33);
    sub_2355C4BF4(v32, v33, v31);
    v52 = v50;
    v53 = v49;
    swift_getOpaqueTypeConformance2();
    sub_2355C4CD0(v31, v14, v33);
    v34(v31, v33);
    v34(v32, v33);
  }
  v52 = v50;
  v53 = v49;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v52 = v29;
  v53 = v30;
  v36 = swift_getOpaqueTypeConformance2();
  v51[0] = OpaqueTypeConformance2;
  v51[1] = v36;
  v37 = v44;
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v44, v51);
  sub_2355C4BF4((uint64_t)v26, v37, v48);
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v26, v37);
}

uint64_t sub_2355B9AB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v17 = a2;
  v18 = sub_2355C8A48();
  v4 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 16);
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  sub_2355C8820();
  sub_2355C89D0();
  sub_2355C8AB4();
  sub_2355C8820();
  sub_2355C8820();
  v22 = sub_2355C8820();
  v23 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D30);
  v24 = type metadata accessor for OfferView();
  v25 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D38);
  swift_getTupleTypeMetadata();
  v8 = sub_2355C8E50();
  v9 = MEMORY[0x24BDF5428];
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDF5428], v8);
  sub_2355C8DE4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EE8);
  sub_2355C8820();
  swift_getTupleTypeMetadata2();
  v10 = sub_2355C8E50();
  MEMORY[0x23B7CFBF8](v9, v10);
  v11 = sub_2355C8D90();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v17 - v13;
  v15 = *(_QWORD *)(a1 + 24);
  v19 = v7;
  v20 = v15;
  v21 = v2;
  sub_2355C8940();
  sub_2355C8D84();
  sub_2355C8A3C();
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDF4498], v11);
  sub_2355C8C4C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_2355B9D78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v15 = a2;
  v16 = sub_2355C8A48();
  v4 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 16);
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  sub_2355C8820();
  sub_2355C89D0();
  sub_2355C8AB4();
  sub_2355C8820();
  sub_2355C8820();
  v20 = sub_2355C8820();
  v21 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D18);
  v22 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D20);
  v23 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D28);
  swift_getTupleTypeMetadata();
  v8 = sub_2355C8E50();
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDF5428], v8);
  v9 = sub_2355C8D90();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v15 - v11;
  sub_2355C8940();
  v13 = *(_QWORD *)(a1 + 24);
  v17 = v7;
  v18 = v13;
  v19 = v2;
  sub_2355C8D84();
  sub_2355C8A3C();
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDF4498], v9);
  sub_2355C8C4C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v16);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_2355B9FD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v13;
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
  char *v29;
  id v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44[16];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[3];

  v3 = a1;
  v43 = a2;
  v4 = *(_QWORD *)(a1 + 16);
  v5 = sub_2355C8820();
  v40 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v34 - v6;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  v35 = sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  v36 = sub_2355C8820();
  v8 = sub_2355C89D0();
  v38 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v34 - v9;
  sub_2355C8AB4();
  v11 = sub_2355C8820();
  v39 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v34 - v12;
  v14 = sub_2355C8820();
  v15 = *(_QWORD *)(v14 - 8);
  v41 = v14;
  v42 = v15;
  MEMORY[0x24BDAC7A8](v14);
  v37 = (char *)&v34 - v16;
  sub_2355C8E14();
  v17 = *(_QWORD *)(v3 + 24);
  sub_2355C8C70();
  LOBYTE(v3) = sub_235593F00(v3);
  v34 = (uint64_t)&v34;
  v45 = v4;
  v46 = v17;
  v47 = v2;
  v53[0] = v17;
  v53[1] = MEMORY[0x24BDEBEE0];
  v18 = MEMORY[0x24BDED308];
  v19 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v5, v53);
  v20 = sub_23559867C(&qword_256248F08, &qword_256248EC0, MEMORY[0x24BDEB950]);
  v52[0] = v19;
  v52[1] = v20;
  v21 = MEMORY[0x23B7CFBF8](v18, v35, v52);
  v22 = sub_23559867C(&qword_256248F10, &qword_256248EC8, MEMORY[0x24BDEDC10]);
  v51[0] = v21;
  v51[1] = v22;
  v23 = v36;
  v24 = MEMORY[0x23B7CFBF8](v18, v36, v51);
  sub_2355BF7EC(v3 & 1, (void (*)(uint64_t))sub_2355BDB48, (uint64_t)v44, v5, v23, v19, v24, (uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v5);
  v50[0] = v24;
  v50[1] = v19;
  v25 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v8, v50);
  sub_2355C8C40();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v10, v8);
  v26 = sub_235598144(&qword_256248EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
  v49[0] = v25;
  v49[1] = v26;
  v27 = MEMORY[0x24BDED308];
  v28 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v11, v49);
  v29 = v37;
  sub_2355C8C64();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v11);
  sub_2355C8AFC();
  v30 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  objc_msgSend(v30, sel_userInterfaceIdiom);

  v31 = sub_235597B84();
  v48[0] = v28;
  v48[1] = v31;
  v32 = v41;
  MEMORY[0x23B7CFBF8](v27, v41, v48);
  sub_2355C8C94();
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v29, v32);
}

uint64_t sub_2355BA420@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64x2_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int8 *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(__int8 *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t (*v26)(void);
  int64x2_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int8 *v32;
  uint64_t v33;
  __int8 *v34;
  void (*v35)(__int8 *, uint64_t);
  void *v36;
  char **v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int8 *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t, uint64_t);
  int64x2_t v58;
  uint64_t v59;
  __int8 *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int8 *v64;
  __int8 *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __int8 *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[2];
  __int128 v80;
  __int128 v81;
  uint64_t v82;

  v59 = a3;
  v67 = a2;
  v61 = a1;
  v76 = a5;
  v68 = sub_2355C870C();
  v66 = *(_QWORD *)(v68 - 8);
  v6 = MEMORY[0x24BDAC7A8](v68);
  v64 = &v58.i8[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v62 = (uint64_t)v58.i64 - v8;
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248FD0);
  MEMORY[0x24BDAC7A8](v75);
  v63 = (uint64_t)v58.i64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2355C882C();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v60 = &v58.i8[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v11);
  v14 = (int64x2_t *)((char *)&v58 - v13);
  v15 = sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  v16 = sub_2355C8820();
  v73 = *(_QWORD *)(v16 - 8);
  v70 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v65 = &v58.i8[-v17];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  v72 = sub_2355C8820();
  v74 = *(_QWORD *)(v72 - 8);
  v18 = MEMORY[0x24BDAC7A8](v72);
  v69 = &v58.i8[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v18);
  v71 = (uint64_t)v58.i64 - v20;
  v21 = &v14->i8[*(int *)(v10 + 20)];
  v22 = *MEMORY[0x24BDEEB68];
  v23 = sub_2355C8964();
  v24 = *(void (**)(__int8 *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 104);
  v24(v21, v22, v23);
  v58 = vdupq_n_s64(0x402A400000000000uLL);
  *v14 = v58;
  v79[0] = a4;
  v79[1] = MEMORY[0x24BDEBEE0];
  v25 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v15, v79);
  v26 = MEMORY[0x24BDED998];
  sub_235598144(&qword_256248FD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDED998], MEMORY[0x24BDED990]);
  sub_2355C8CA0();
  sub_23558DF78((uint64_t)v14, (uint64_t (*)(_QWORD))v26);
  v27 = (int64x2_t *)v60;
  v24(&v60[*(int *)(v10 + 20)], v22, v23);
  *v27 = v58;
  v28 = (uint64_t)v27;
  type metadata accessor for CompactManagedAppCell(0, v59, a4, v29);
  v30 = v62;
  sub_23559D9BC(v62);
  v31 = v66;
  v32 = v64;
  v33 = v68;
  (*(void (**)(__int8 *, _QWORD, uint64_t))(v66 + 104))(v64, *MEMORY[0x24BDEB400], v68);
  v34 = v32;
  LOBYTE(v32) = sub_2355C8700();
  v35 = *(void (**)(__int8 *, uint64_t))(v31 + 8);
  v35(v34, v33);
  v35((__int8 *)v30, v33);
  v36 = (void *)objc_opt_self();
  v37 = &selRef_systemGray6Color;
  if ((v32 & 1) == 0)
    v37 = &selRef_secondarySystemFillColor;
  v38 = MEMORY[0x23B7CF22C](objc_msgSend(v36, *v37));
  sub_2355C8724();
  v39 = v63;
  sub_235598184(v28, v63, (uint64_t (*)(_QWORD))v26);
  v40 = v39 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256248FE0) + 36);
  v41 = v81;
  *(_OWORD *)v40 = v80;
  *(_OWORD *)(v40 + 16) = v41;
  *(_QWORD *)(v40 + 32) = v82;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248FE8);
  *(_QWORD *)(v39 + *(int *)(v42 + 52)) = v38;
  *(_WORD *)(v39 + *(int *)(v42 + 56)) = 256;
  v43 = sub_2355C8E14();
  v45 = v44;
  v46 = (uint64_t *)(v39 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256248FF0) + 36));
  *v46 = v43;
  v46[1] = v45;
  sub_23558DF78(v28, (uint64_t (*)(_QWORD))v26);
  sub_2355C8E14();
  v47 = sub_23559867C(&qword_256248F08, &qword_256248EC0, MEMORY[0x24BDEB950]);
  v78[0] = v25;
  v78[1] = v47;
  v48 = MEMORY[0x24BDED308];
  v49 = v70;
  v50 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v70, v78);
  sub_23559867C(&qword_256248FF8, &qword_256248FD0, MEMORY[0x24BDED500]);
  v51 = (uint64_t)v69;
  v52 = v65;
  sub_2355C8C88();
  sub_23558E470(v39, &qword_256248FD0);
  (*(void (**)(__int8 *, uint64_t))(v73 + 8))(v52, v49);
  v53 = sub_23559867C(&qword_256248F10, &qword_256248EC8, MEMORY[0x24BDEDC10]);
  v77[0] = v50;
  v77[1] = v53;
  v54 = v72;
  MEMORY[0x23B7CFBF8](v48, v72, v77);
  v55 = v71;
  sub_2355C82E4(v51, v54, v71);
  v56 = *(void (**)(uint64_t, uint64_t))(v74 + 8);
  v56(v51, v54);
  sub_2355C4BF4(v55, v54, v76);
  return ((uint64_t (*)(uint64_t, uint64_t))v56)(v55, v54);
}

uint64_t sub_2355BAA20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t result;

  v5 = (uint64_t *)(v3
                 + *(int *)(type metadata accessor for ManagedAppCellContext(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2)+ 40));
  v6 = *v5;
  v7 = v5[1];
  v8 = v5[2];
  v9 = v5[3];
  sub_235597D54(*v5, v7, v8, v9);
  v10 = sub_2355C89F4();
  v11 = sub_2355C8B80();
  result = swift_getKeyPath();
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v7;
  *(_QWORD *)(a3 + 16) = v8;
  *(_QWORD *)(a3 + 24) = v9;
  *(_DWORD *)(a3 + 32) = v10;
  *(_QWORD *)(a3 + 40) = result;
  *(_QWORD *)(a3 + 48) = v11;
  return result;
}

double sub_2355BAAB0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t KeyPath;
  char v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  double result;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _OWORD v38[10];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248FA8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2355C8994();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (uint64_t *)(v2
                  + *(int *)(type metadata accessor for ManagedAppCellContext(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), v12)+ 44));
  v14 = v13[1];
  v15 = v13[2];
  v16 = v13[3];
  v37 = *v13;
  v36 = v14;
  sub_235597D54(v37, v14, v15, v16);
  sub_23559D9EC((uint64_t)v11);
  v17 = sub_2355C8988();
  v18 = *(void (**)(char *, uint64_t))(v9 + 8);
  v18(v11, v8);
  if ((v17 & 1) != 0)
  {
    v19 = sub_2355C8B74();
  }
  else
  {
    v20 = sub_2355C8B20();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v7, 1, 1, v20);
    v19 = sub_2355C8B44();
    sub_23558E470((uint64_t)v7, &qword_256248FA8);
  }
  KeyPath = swift_getKeyPath();
  sub_23559D9EC((uint64_t)v11);
  v22 = sub_2355C8988();
  v18(v11, v8);
  if ((v22 & 1) != 0)
    v23 = 0.0;
  else
    v23 = 62.0;
  v24 = v37;
  v25 = v36;
  v39 = v37;
  v40 = v36;
  v41 = v15;
  v42 = v16;
  v43 = KeyPath;
  v44 = v19;
  sub_2355C8E14();
  sub_2355BFE00(0.0, 1, 0.0, 1, v23, v22 & 1, 0.0, 1, v38, 0.0, 1, 0.0, 1);
  sub_235597C94(v24, v25, v15, v16);
  swift_release();
  swift_release();
  v26 = sub_2355C8D0C();
  v27 = swift_getKeyPath();
  v28 = swift_getKeyPath();
  v29 = v38[7];
  *(_OWORD *)(a2 + 96) = v38[6];
  *(_OWORD *)(a2 + 112) = v29;
  v30 = v38[9];
  *(_OWORD *)(a2 + 128) = v38[8];
  *(_OWORD *)(a2 + 144) = v30;
  v31 = v38[3];
  *(_OWORD *)(a2 + 32) = v38[2];
  *(_OWORD *)(a2 + 48) = v31;
  v32 = v38[5];
  *(_OWORD *)(a2 + 64) = v38[4];
  *(_OWORD *)(a2 + 80) = v32;
  result = *(double *)v38;
  v34 = v38[1];
  *(_OWORD *)a2 = v38[0];
  *(_OWORD *)(a2 + 16) = v34;
  *(_QWORD *)(a2 + 160) = v27;
  *(_QWORD *)(a2 + 168) = v26;
  *(_QWORD *)(a2 + 176) = v28;
  *(_QWORD *)(a2 + 184) = 2;
  *(_BYTE *)(a2 + 192) = 0;
  return result;
}

uint64_t sub_2355BAD78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t KeyPath;
  uint64_t v12;
  uint64_t result;

  v5 = (uint64_t *)(v3
                 + *(int *)(type metadata accessor for ManagedAppCellContext(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2)+ 48));
  v6 = *v5;
  v7 = v5[1];
  v8 = v5[2];
  v9 = v5[3];
  sub_235597D54(*v5, v7, v8, v9);
  v10 = sub_2355C8D0C();
  KeyPath = swift_getKeyPath();
  v12 = sub_2355C8B80();
  result = swift_getKeyPath();
  *a3 = v6;
  a3[1] = v7;
  a3[2] = v8;
  a3[3] = v9;
  a3[4] = KeyPath;
  a3[5] = v10;
  a3[6] = result;
  a3[7] = v12;
  return result;
}

uint64_t sub_2355BAE18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  BOOL v63;
  void (*v64)(uint64_t, uint64_t);
  uint64_t KeyPath;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
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
  uint64_t (*v83)(uint64_t, uint64_t);
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  uint64_t v93;
  char *v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  unint64_t v119;
  uint64_t v120;
  _QWORD v121[4];
  __int128 v122;
  _OWORD v123[14];
  _QWORD v124[2];
  _QWORD v125[2];
  _QWORD v126[2];
  _QWORD v127[2];
  _QWORD v128[2];
  _QWORD v129[2];
  _QWORD v130[2];
  _OWORD v131[13];
  __int16 v132;
  _OWORD v133[14];
  char v134;
  _OWORD v135[13];
  _OWORD v136[3];

  v112 = a1;
  v109 = a4;
  v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249D28);
  v6 = MEMORY[0x24BDAC7A8](v106);
  v110 = (uint64_t)&v85 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v107 = (uint64_t *)((char *)&v85 - v8);
  v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249D20);
  v9 = MEMORY[0x24BDAC7A8](v104);
  v108 = (uint64_t)&v85 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v105 = (char *)&v85 - v11;
  v12 = sub_2355C8994();
  v87 = *(_QWORD *)(v12 - 8);
  v88 = v12;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v86 = (char *)&v85 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v85 = (uint64_t)&v85 - v15;
  v114 = a2;
  v111 = type metadata accessor for CompactManagedAppCell(0, a2, a3, v16);
  v95 = *(_QWORD *)(v111 - 8);
  MEMORY[0x24BDAC7A8](v111);
  v94 = (char *)&v85 - v17;
  v97 = sub_2355C8A48();
  v91 = *(_QWORD *)(v97 - 8);
  MEMORY[0x24BDAC7A8](v97);
  v90 = (char *)&v85 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249D90);
  v99 = *(_QWORD *)(v19 - 8);
  v100 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v113 = (char *)&v85 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249D18);
  v21 = MEMORY[0x24BDAC7A8](v115);
  v103 = (uint64_t)&v85 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v96 = (char *)&v85 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v116 = (uint64_t)&v85 - v25;
  v26 = sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  v27 = sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  v98 = sub_2355C8820();
  v93 = sub_2355C89D0();
  sub_2355C8AB4();
  v101 = sub_2355C8820();
  v102 = sub_2355C8820();
  v28 = sub_2355C8820();
  v29 = *(_QWORD *)(v28 - 8);
  v30 = MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v85 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&v85 - v33;
  sub_2355B9FD4(v111, (uint64_t)v32);
  v130[0] = a3;
  v130[1] = MEMORY[0x24BDEBEE0];
  v35 = MEMORY[0x24BDED308];
  v36 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v26, v130);
  v37 = sub_23559867C(&qword_256248F08, &qword_256248EC0, MEMORY[0x24BDEB950]);
  v129[0] = v36;
  v129[1] = v37;
  v38 = MEMORY[0x23B7CFBF8](v35, v27, v129);
  v39 = sub_23559867C(&qword_256248F10, &qword_256248EC8, MEMORY[0x24BDEDC10]);
  v128[0] = v38;
  v128[1] = v39;
  v127[0] = MEMORY[0x23B7CFBF8](v35, v98, v128);
  v127[1] = v36;
  v40 = a3;
  v41 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v93, v127);
  v42 = sub_235598144(&qword_256248EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
  v126[0] = v41;
  v126[1] = v42;
  v43 = MEMORY[0x23B7CFBF8](v35, v101, v126);
  v44 = sub_235597B84();
  v125[0] = v43;
  v125[1] = v44;
  v124[0] = MEMORY[0x23B7CFBF8](v35, v102, v125);
  v124[1] = MEMORY[0x24BDECC60];
  v45 = MEMORY[0x23B7CFBF8](v35, v28, v124);
  v98 = (uint64_t)v34;
  v89 = v45;
  sub_2355C82E4((uint64_t)v32, v28, (uint64_t)v34);
  v46 = *(uint64_t (**)(uint64_t, uint64_t))(v29 + 8);
  v101 = (uint64_t)v32;
  v102 = v28;
  v47 = v28;
  v48 = v111;
  v92 = v46;
  v93 = v29;
  v46((uint64_t)v32, v47);
  v49 = sub_2355C89AC();
  v50 = v112;
  v51 = v114;
  sub_2355BB81C(v114, v40, v52, (uint64_t)v131);
  *(_OWORD *)((char *)&v133[10] + 7) = v131[10];
  *(_OWORD *)((char *)&v133[11] + 7) = v131[11];
  *(_OWORD *)((char *)&v133[12] + 7) = v131[12];
  *(_WORD *)((char *)&v133[13] + 7) = v132;
  *(_OWORD *)((char *)&v133[6] + 7) = v131[6];
  *(_OWORD *)((char *)&v133[7] + 7) = v131[7];
  *(_OWORD *)((char *)&v133[8] + 7) = v131[8];
  *(_OWORD *)((char *)&v133[9] + 7) = v131[9];
  *(_OWORD *)((char *)&v133[2] + 7) = v131[2];
  *(_OWORD *)((char *)&v133[3] + 7) = v131[3];
  *(_OWORD *)((char *)&v133[4] + 7) = v131[4];
  *(_OWORD *)((char *)&v133[5] + 7) = v131[5];
  *(_OWORD *)((char *)v133 + 7) = v131[0];
  *(_OWORD *)((char *)&v133[1] + 7) = v131[1];
  *(_OWORD *)((char *)&v123[10] + 1) = v133[10];
  *(_OWORD *)((char *)&v123[11] + 1) = v133[11];
  *(_OWORD *)((char *)&v123[12] + 1) = v133[12];
  *(_OWORD *)((char *)&v123[12] + 10) = *(_OWORD *)((char *)&v133[12] + 9);
  *(_OWORD *)((char *)&v123[6] + 1) = v133[6];
  *(_OWORD *)((char *)&v123[7] + 1) = v133[7];
  *(_OWORD *)((char *)&v123[8] + 1) = v133[8];
  *(_OWORD *)((char *)&v123[9] + 1) = v133[9];
  *(_OWORD *)((char *)&v123[2] + 1) = v133[2];
  *(_OWORD *)((char *)&v123[3] + 1) = v133[3];
  *(_OWORD *)((char *)&v123[4] + 1) = v133[4];
  *(_OWORD *)((char *)&v123[5] + 1) = v133[5];
  *(_OWORD *)((char *)v123 + 1) = v133[0];
  v134 = 0;
  *(_QWORD *)&v122 = v49;
  *((_QWORD *)&v122 + 1) = 0x3FF0000000000000;
  LOBYTE(v123[0]) = 0;
  *(_OWORD *)((char *)&v123[1] + 1) = v133[1];
  v53 = v90;
  sub_2355C8A30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249D98);
  sub_23559867C(&qword_256249DA0, &qword_256249D98, MEMORY[0x24BDF4700]);
  sub_2355C8C4C();
  (*(void (**)(char *, uint64_t))(v91 + 8))(v53, v97);
  v135[12] = v123[11];
  v136[0] = v123[12];
  *(_OWORD *)((char *)v136 + 10) = *(_OWORD *)((char *)&v123[12] + 10);
  v135[8] = v123[7];
  v135[9] = v123[8];
  v135[11] = v123[10];
  v135[10] = v123[9];
  v135[4] = v123[3];
  v135[5] = v123[4];
  v135[7] = v123[6];
  v135[6] = v123[5];
  v135[0] = v122;
  v135[1] = v123[0];
  v135[3] = v123[2];
  v135[2] = v123[1];
  sub_2355BDB60((uint64_t)v135);
  v97 = v40;
  v55 = type metadata accessor for ManagedAppCellContext(0, v51, v40, v54);
  v56 = v94;
  LOBYTE(v49) = sub_2355BF64C(v55);
  v57 = v95;
  (*(void (**)(char *, uint64_t, uint64_t))(v95 + 16))(v56, v50, v48);
  if ((v49 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t))(v57 + 8))(v56, v48);
    v58 = 1;
  }
  else
  {
    v59 = v85;
    sub_23559D9EC(v85);
    v61 = (uint64_t)v86;
    v60 = v87;
    v62 = v88;
    (*(void (**)(char *, _QWORD, uint64_t))(v87 + 104))(v86, *MEMORY[0x24BDEEE88], v88);
    v63 = sub_2355BDCE8(v59, v61);
    v64 = *(void (**)(uint64_t, uint64_t))(v60 + 8);
    v64(v61, v62);
    v64(v59, v62);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v56, v48);
    if (v63)
      v58 = 1;
    else
      v58 = 2;
  }
  KeyPath = swift_getKeyPath();
  v67 = v99;
  v66 = v100;
  v68 = (uint64_t)v96;
  v69 = v113;
  (*(void (**)(char *, char *, uint64_t))(v99 + 16))(v96, v113, v100);
  v70 = v68 + *(int *)(v115 + 36);
  *(_QWORD *)v70 = KeyPath;
  *(_QWORD *)(v70 + 8) = v58;
  *(_BYTE *)(v70 + 16) = 0;
  (*(void (**)(char *, uint64_t))(v67 + 8))(v69, v66);
  v71 = v116;
  sub_235598700(v68, v116, &qword_256249D18);
  *(_QWORD *)&v122 = 0x4030000000000000;
  BYTE8(v122) = 0;
  v72 = (uint64_t)v105;
  sub_2355C8C40();
  v73 = sub_2355C89A0();
  v74 = (uint64_t)v107;
  *v107 = v73;
  *(_QWORD *)(v74 + 8) = 0;
  *(_BYTE *)(v74 + 16) = 1;
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249DA8);
  sub_2355BC0D4(v114, v97, v74 + *(int *)(v75 + 44));
  v77 = v101;
  v76 = v102;
  v78 = v98;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v93 + 16))(v101, v98, v102);
  *(_QWORD *)&v122 = v77;
  v79 = v103;
  sub_2355986BC(v71, v103, &qword_256249D18);
  *((_QWORD *)&v122 + 1) = v79;
  v80 = v108;
  sub_2355986BC(v72, v108, &qword_256249D20);
  *(_QWORD *)&v123[0] = v80;
  v81 = v110;
  sub_2355986BC(v74, v110, &qword_256249D28);
  *((_QWORD *)&v123[0] + 1) = v81;
  v121[0] = v76;
  v121[1] = v115;
  v121[2] = v104;
  v121[3] = v106;
  v117 = v89;
  v118 = sub_2355BE070();
  v119 = sub_2355BE13C();
  v120 = sub_23559867C(&qword_256249DC0, &qword_256249D28, MEMORY[0x24BDF4700]);
  sub_2355B91C0((uint64_t *)&v122, 4uLL, (uint64_t)v121);
  sub_23558E470(v74, &qword_256249D28);
  sub_23558E470(v72, &qword_256249D20);
  sub_23558E470(v116, &qword_256249D18);
  v82 = v78;
  v83 = v92;
  v92(v82, v76);
  sub_23558E470(v81, &qword_256249D28);
  sub_23558E470(v80, &qword_256249D20);
  sub_23558E470(v79, &qword_256249D18);
  return v83(v77, v76);
}

double sub_2355BB81C@<D0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
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
  __int128 v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  double result;
  __int128 v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  int v62;
  char v63;
  uint64_t v64;
  uint64_t KeyPath;
  uint64_t v66;
  uint64_t v67;
  _BYTE v68[7];
  _BYTE v69[7];
  _OWORD v70[4];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  char v75;
  char v76;
  _DWORD v77[2];
  _DWORD v78[2];
  char v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  uint64_t v89[4];
  __int128 v90;
  __int128 v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  _BYTE v95[7];
  char v96;
  _BYTE v97[7];
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int16 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  char v128;
  _BYTE v129[7];
  uint64_t v130;
  char v131;
  _BYTE v132[7];
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int16 v149;

  v7 = type metadata accessor for ManagedAppCellContext(0, a1, a2, a3);
  if (sub_2355BF64C(v7))
  {
    v9 = type metadata accessor for CompactManagedAppCell(0, a1, a2, v8);
    sub_2355BAD78(v9, v10, (uint64_t *)&v138);
    v11 = *((_QWORD *)&v138 + 1);
    v12 = v139;
    v58 = *((_QWORD *)&v139 + 1);
    v60 = *((_QWORD *)&v138 + 1);
    v13 = v140;
    v67 = v138;
    v14 = v141;
    KeyPath = swift_getKeyPath();
    v61 = sub_2355C8AF0();
    __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
    sub_2355C8748();
    sub_2355C86F4();
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    sub_235595730(v9, (uint64_t)&v138);
    v54 = *((_QWORD *)&v138 + 1);
    LOBYTE(v9) = v139;
    v56 = v138;
    v57 = *((_QWORD *)&v139 + 1);
    v55 = sub_2355C8AF0();
    sub_2355C8748();
    sub_2355C86F4();
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    *(_QWORD *)&v70[0] = v67;
    *((_QWORD *)&v70[0] + 1) = v11;
    v70[1] = v12;
    v70[2] = v13;
    v70[3] = v14;
    *(_QWORD *)&v71 = KeyPath;
    *((_QWORD *)&v71 + 1) = 1;
    LOBYTE(v72) = 0;
    DWORD1(v72) = *(_DWORD *)&v69[3];
    *(_DWORD *)((char *)&v72 + 1) = *(_DWORD *)v69;
    BYTE8(v72) = v61;
    HIDWORD(v72) = *(_DWORD *)&v68[3];
    *(_DWORD *)((char *)&v72 + 9) = *(_DWORD *)v68;
    *(_QWORD *)&v73 = v16;
    *((_QWORD *)&v73 + 1) = v18;
    *(_QWORD *)&v74 = v20;
    *((_QWORD *)&v74 + 1) = v22;
    v75 = 0;
    LOBYTE(v88) = 0;
    v86 = v73;
    v87 = v74;
    v84 = v71;
    v85 = v72;
    v82 = v13;
    v83 = v14;
    v80 = v70[0];
    v81 = v12;
    v79 = v9;
    v76 = 0;
    sub_2355BE1CC((uint64_t *)v70);
    sub_2355914F4(v56, v54, v9);
    swift_bridgeObjectRetain();
    sub_235597D54(v67, v60, v12, v58);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_2355914F4(v56, v54, v9);
    swift_bridgeObjectRetain();
    sub_235591958(v56, v54, v9);
    swift_bridgeObjectRelease();
    v89[0] = v67;
    v89[1] = v60;
    v89[2] = v12;
    v89[3] = v58;
    v90 = v13;
    v91 = v14;
    v92 = KeyPath;
    v93 = 1;
    v94 = 0;
    *(_DWORD *)v95 = *(_DWORD *)v69;
    *(_DWORD *)&v95[3] = *(_DWORD *)&v69[3];
    v96 = v61;
    *(_DWORD *)v97 = *(_DWORD *)v68;
    *(_DWORD *)&v97[3] = *(_DWORD *)&v68[3];
    v98 = v16;
    v99 = v18;
    v100 = v20;
    v101 = v22;
    v102 = 0;
    sub_2355BE23C(v89);
    v123 = v86;
    v124 = v87;
    v119 = v82;
    v120 = v83;
    v121 = v84;
    v122 = v85;
    v117 = v80;
    v118 = v81;
    v125 = v88;
    v126 = v56;
    v127 = v54;
    v128 = v9;
    *(_DWORD *)v129 = v78[0];
    *(_DWORD *)&v129[3] = *(_DWORD *)((char *)v78 + 3);
    v130 = v57;
    v131 = v55;
    *(_DWORD *)v132 = v77[0];
    *(_DWORD *)&v132[3] = *(_DWORD *)((char *)v77 + 3);
    v133 = v24;
    v134 = v26;
    v135 = v28;
    v136 = v30;
    v137 = 0;
    sub_2355BE2AC((uint64_t)&v117);
    sub_235598700((uint64_t)&v117, (uint64_t)&v138, &qword_256249DD0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256249DD8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256249DE0);
    v31 = MEMORY[0x24BDF5428];
    sub_23559867C(&qword_256249DE8, &qword_256249DD8, MEMORY[0x24BDF5428]);
    sub_23559867C(qword_256249DF0, &qword_256249DE0, v31);
    sub_2355C89C4();
    sub_235591958(v56, v54, v9);
    swift_bridgeObjectRelease();
    sub_235597C94(v67, v60, v12, v58);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    v32 = type metadata accessor for CompactManagedAppCell(0, a1, a2, v8);
    sub_235595730(v32, (uint64_t)&v138);
    v33 = v138;
    v34 = v139;
    v66 = *((_QWORD *)&v139 + 1);
    v63 = sub_2355C8AF0();
    __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
    sub_2355C8748();
    sub_2355C86F4();
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;
    sub_2355BAA20(v32, v43, (uint64_t)&v138);
    v44 = v138;
    v45 = v139;
    v62 = v140;
    v64 = *((_QWORD *)&v140 + 1);
    v59 = v141;
    LOBYTE(v78[0]) = v34;
    LOBYTE(v77[0]) = 0;
    sub_2355914F4(v33, *((uint64_t *)&v33 + 1), v34);
    swift_bridgeObjectRetain();
    sub_235597D54(v44, *((uint64_t *)&v44 + 1), v45, *((uint64_t *)&v45 + 1));
    swift_retain();
    swift_retain();
    sub_2355914F4(v33, *((uint64_t *)&v33 + 1), v34);
    swift_bridgeObjectRetain();
    sub_235597D54(v44, *((uint64_t *)&v44 + 1), v45, *((uint64_t *)&v45 + 1));
    swift_retain();
    swift_retain();
    sub_235597C94(v44, *((uint64_t *)&v44 + 1), v45, *((uint64_t *)&v45 + 1));
    swift_release();
    swift_release();
    sub_235591958(v33, *((uint64_t *)&v33 + 1), v34);
    swift_bridgeObjectRelease();
    v117 = v33;
    LOBYTE(v118) = v34;
    *(_DWORD *)((char *)&v118 + 1) = v80;
    DWORD1(v118) = *(_DWORD *)((char *)&v80 + 3);
    *((_QWORD *)&v118 + 1) = v66;
    LOBYTE(v119) = v63;
    *(_DWORD *)((char *)&v119 + 1) = v89[0];
    DWORD1(v119) = *(_DWORD *)((char *)v89 + 3);
    *((_QWORD *)&v119 + 1) = v36;
    *(_QWORD *)&v120 = v38;
    *((_QWORD *)&v120 + 1) = v40;
    *(_QWORD *)&v121 = v42;
    BYTE8(v121) = 0;
    *(_DWORD *)((char *)&v121 + 9) = v70[0];
    HIDWORD(v121) = *(_DWORD *)((char *)v70 + 3);
    v122 = v44;
    v123 = v45;
    LODWORD(v124) = v62;
    *((_QWORD *)&v124 + 1) = v64;
    v125 = v59;
    sub_2355BE1C0((uint64_t)&v117);
    sub_235598700((uint64_t)&v117, (uint64_t)&v138, &qword_256249DD0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256249DD8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256249DE0);
    v46 = MEMORY[0x24BDF5428];
    sub_23559867C(&qword_256249DE8, &qword_256249DD8, MEMORY[0x24BDF5428]);
    sub_23559867C(qword_256249DF0, &qword_256249DE0, v46);
    sub_2355C89C4();
    sub_235597C94(v44, *((uint64_t *)&v44 + 1), v45, *((uint64_t *)&v45 + 1));
    swift_release();
    swift_release();
    sub_235591958(v33, *((uint64_t *)&v33 + 1), v34);
    swift_bridgeObjectRelease();
  }
  v148 = v115;
  v149 = v116;
  v144 = v109;
  v145 = v110;
  v146 = v111;
  v147 = v112;
  v140 = v105;
  v141 = v106;
  v142 = v107;
  v143 = v108;
  v138 = v103;
  v139 = v104;
  v47 = v114;
  *(_OWORD *)(a4 + 160) = v113;
  *(_OWORD *)(a4 + 176) = v47;
  *(_OWORD *)(a4 + 192) = v148;
  *(_WORD *)(a4 + 208) = v149;
  v48 = v145;
  *(_OWORD *)(a4 + 96) = v144;
  *(_OWORD *)(a4 + 112) = v48;
  v49 = v147;
  *(_OWORD *)(a4 + 128) = v146;
  *(_OWORD *)(a4 + 144) = v49;
  v50 = v141;
  *(_OWORD *)(a4 + 32) = v140;
  *(_OWORD *)(a4 + 48) = v50;
  v51 = v143;
  *(_OWORD *)(a4 + 64) = v142;
  *(_OWORD *)(a4 + 80) = v51;
  result = *(double *)&v138;
  v53 = v139;
  *(_OWORD *)a4 = v138;
  *(_OWORD *)(a4 + 16) = v53;
  return result;
}

uint64_t sub_2355BC0D4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[200];
  _OWORD v25[12];
  char v26;
  _OWORD v27[12];
  char v28;
  _BYTE v29[216];

  v23 = a3;
  v5 = type metadata accessor for OfferView();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249058);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v22 - v12;
  v15 = type metadata accessor for CompactManagedAppCell(0, a1, a2, v14);
  sub_235595CA8(v15, v16, (uint64_t)v7);
  sub_235598184((uint64_t)v7, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for OfferView);
  *(_QWORD *)&v11[*(int *)(v8 + 36)] = 0x3FF0000000000000;
  sub_23558DF78((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for OfferView);
  sub_235598700((uint64_t)v11, (uint64_t)v13, &qword_256249058);
  v18 = type metadata accessor for ManagedAppCellContext(0, a1, a2, v17);
  if (sub_2355BF664(v18))
  {
    sub_2355BAAB0(v15, (uint64_t)v25);
    v27[10] = v25[10];
    v27[11] = v25[11];
    v28 = v26;
    v27[6] = v25[6];
    v27[7] = v25[7];
    v27[8] = v25[8];
    v27[9] = v25[9];
    v27[2] = v25[2];
    v27[3] = v25[3];
    v27[4] = v25[4];
    v27[5] = v25[5];
    v27[0] = v25[0];
    v27[1] = v25[1];
    nullsub_1(v27);
  }
  else
  {
    sub_235597CC4((uint64_t)v27);
  }
  sub_235598700((uint64_t)v27, (uint64_t)v29, &qword_256249D38);
  sub_2355986BC((uint64_t)v13, (uint64_t)v11, &qword_256249058);
  sub_235598700((uint64_t)v29, (uint64_t)v24, &qword_256249D38);
  v19 = v23;
  sub_2355986BC((uint64_t)v11, v23, &qword_256249058);
  v20 = v19 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256249DC8) + 48);
  sub_235598700((uint64_t)v24, (uint64_t)v25, &qword_256249D38);
  sub_235598700((uint64_t)v25, v20, &qword_256249D38);
  sub_23559803C((uint64_t)v25, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2355BD654);
  sub_23558E470((uint64_t)v13, &qword_256249058);
  sub_235598700((uint64_t)v24, (uint64_t)v27, &qword_256249D38);
  sub_23559803C((uint64_t)v27, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2355BD894);
  return sub_23558E470((uint64_t)v11, &qword_256249058);
}

uint64_t sub_2355BC35C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
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
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  _QWORD v30[2];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[2];
  uint64_t v43;
  char v44;
  _QWORD v45[2];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;

  v35 = a1;
  v36 = a4;
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  sub_2355C8820();
  sub_2355C89D0();
  sub_2355C8AB4();
  sub_2355C8820();
  sub_2355C8820();
  v46 = sub_2355C8820();
  v47 = (uint64_t *)__swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D30);
  v48 = type metadata accessor for OfferView();
  v49 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D38);
  swift_getTupleTypeMetadata();
  v6 = sub_2355C8E50();
  v30[1] = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF5428], v6);
  v7 = sub_2355C8DE4();
  v32 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v30 - v8;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EE8);
  v10 = sub_2355C8820();
  v33 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v34 = (char *)v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v30 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v31 = (uint64_t)v30 - v16;
  sub_2355C89AC();
  v17 = a3;
  type metadata accessor for CompactManagedAppCell(0, a2, a3, v18);
  v19 = v35;
  __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  sub_2355C8748();
  v37 = a2;
  v38 = v17;
  v39 = v19;
  sub_2355C8DD8();
  v21 = type metadata accessor for ManagedAppCellContext(0, a2, v17, v20);
  sub_2355BF64C(v21);
  v22 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF4700], v7);
  sub_2355C8CAC();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v9, v7);
  v23 = sub_23559867C(&qword_256248EF0, &qword_256248EE8, MEMORY[0x24BDF1028]);
  v45[0] = v22;
  v45[1] = v23;
  v24 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v10, v45);
  v25 = v31;
  sub_2355C82E4((uint64_t)v15, v10, v31);
  v26 = v33;
  v27 = *(void (**)(char *, uint64_t))(v33 + 8);
  v27(v15, v10);
  v28 = (uint64_t)v34;
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v34, v25, v10);
  v43 = 0;
  v44 = 0;
  v46 = v28;
  v47 = &v43;
  v42[0] = v10;
  v42[1] = MEMORY[0x24BDF4638];
  v40 = v24;
  v41 = MEMORY[0x24BDF4610];
  sub_2355B91C0(&v46, 2uLL, (uint64_t)v42);
  v27((char *)v25, v10);
  return ((uint64_t (*)(uint64_t, uint64_t))v27)(v28, v10);
}

uint64_t sub_2355BC748@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t);
  uint64_t (*v60)(uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t OpaqueTypeConformance2;
  uint64_t v89;
  unint64_t v90;
  _QWORD v91[4];
  _OWORD v92[12];
  char v93;
  uint64_t v94[4];
  _OWORD v95[12];
  char v96;
  _QWORD v97[37];
  _QWORD v98[2];
  _QWORD v99[2];
  _QWORD v100[2];
  _QWORD v101[2];
  _QWORD v102[2];
  _QWORD v103[2];
  _QWORD v104[2];
  _BYTE v105[272];
  _BYTE v106[288];
  _QWORD v107[39];

  v83 = a1;
  v81 = a4;
  v79 = type metadata accessor for OfferView();
  v6 = MEMORY[0x24BDAC7A8](v79);
  v82 = (uint64_t)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v78 = (uint64_t)&v62 - v8;
  v9 = sub_2355C8A48();
  v75 = *(_QWORD *)(v9 - 8);
  v76 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v72 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249D30);
  v85 = *(_QWORD *)(v77 - 8);
  v11 = MEMORY[0x24BDAC7A8](v77);
  v80 = (char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v71 = (char *)&v62 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v84 = (char *)&v62 - v15;
  v65 = a2;
  v16 = sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  v17 = sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  v18 = sub_2355C8820();
  v73 = (uint64_t (*)(uint64_t, uint64_t))sub_2355C89D0();
  sub_2355C8AB4();
  v74 = sub_2355C8820();
  v86 = sub_2355C8820();
  v19 = sub_2355C8820();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v62 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v62 - v24;
  v64 = a3;
  v63 = type metadata accessor for CompactManagedAppCell(0, a2, a3, v26);
  sub_2355B9FD4(v63, (uint64_t)v23);
  v104[0] = a3;
  v104[1] = MEMORY[0x24BDEBEE0];
  v27 = MEMORY[0x24BDED308];
  v28 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v16, v104);
  v29 = sub_23559867C(&qword_256248F08, &qword_256248EC0, MEMORY[0x24BDEB950]);
  v103[0] = v28;
  v103[1] = v29;
  v30 = MEMORY[0x23B7CFBF8](v27, v17, v103);
  v31 = sub_23559867C(&qword_256248F10, &qword_256248EC8, MEMORY[0x24BDEDC10]);
  v102[0] = v30;
  v102[1] = v31;
  v101[0] = MEMORY[0x23B7CFBF8](v27, v18, v102);
  v101[1] = v28;
  v32 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v73, v101);
  v33 = sub_235598144(&qword_256248EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
  v100[0] = v32;
  v100[1] = v33;
  v34 = MEMORY[0x23B7CFBF8](v27, v74, v100);
  v35 = sub_235597B84();
  v99[0] = v34;
  v99[1] = v35;
  v98[0] = MEMORY[0x23B7CFBF8](v27, v86, v99);
  v98[1] = MEMORY[0x24BDECC60];
  v36 = MEMORY[0x23B7CFBF8](v27, v19, v98);
  v86 = (uint64_t)v25;
  v69 = v36;
  sub_2355C82E4((uint64_t)v23, v19, (uint64_t)v25);
  v37 = *(uint64_t (**)(uint64_t, uint64_t))(v20 + 8);
  v68 = v23;
  v70 = v19;
  v73 = v37;
  v74 = v20;
  v37((uint64_t)v23, v19);
  v38 = sub_2355C89AC();
  v39 = v63;
  __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  sub_2355C8748();
  v40 = v107[0];
  v42 = v64;
  v41 = v65;
  sub_2355BCEF4(v65, v64, v43, v105);
  v106[280] = 0;
  memcpy(&v106[7], v105, 0x110uLL);
  v97[0] = v38;
  v97[1] = v40;
  LOBYTE(v97[2]) = 0;
  memcpy((char *)&v97[2] + 1, v106, 0x117uLL);
  v44 = v72;
  sub_2355C8A30();
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249D40);
  v46 = sub_23559867C(&qword_256249D48, &qword_256249D40, MEMORY[0x24BDF4700]);
  v47 = v71;
  v66 = v46;
  v67 = v45;
  sub_2355C8C4C();
  (*(void (**)(char *, uint64_t))(v75 + 8))(v44, v76);
  memcpy(v107, v97, 0x128uLL);
  sub_2355BD50C((uint64_t)v107);
  v48 = v85;
  v49 = v77;
  (*(void (**)(char *, char *))(v85 + 32))(v84, v47);
  v50 = v78;
  sub_235595CA8(v39, v51, v78);
  v53 = type metadata accessor for ManagedAppCellContext(0, v41, v42, v52);
  if (sub_2355BF664(v53))
  {
    sub_2355BAAB0(v39, (uint64_t)v92);
    v95[10] = v92[10];
    v95[11] = v92[11];
    v96 = v93;
    v95[6] = v92[6];
    v95[7] = v92[7];
    v95[8] = v92[8];
    v95[9] = v92[9];
    v95[2] = v92[2];
    v95[3] = v92[3];
    v95[4] = v92[4];
    v95[5] = v92[5];
    v95[0] = v92[0];
    v95[1] = v92[1];
    nullsub_1(v95);
  }
  else
  {
    sub_235597CC4((uint64_t)v95);
  }
  sub_235598700((uint64_t)v95, (uint64_t)v97, &qword_256249D38);
  v54 = (uint64_t)v68;
  v55 = v70;
  (*(void (**)(char *, uint64_t, uint64_t))(v74 + 16))(v68, v86, v70);
  v94[0] = v54;
  v56 = (uint64_t)v80;
  v57 = v84;
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v80, v84, v49);
  v94[1] = v56;
  v58 = v82;
  sub_235598184(v50, v82, (uint64_t (*)(_QWORD))type metadata accessor for OfferView);
  v94[2] = v58;
  sub_235598700((uint64_t)v97, (uint64_t)v92, &qword_256249D38);
  v94[3] = (uint64_t)v92;
  sub_23559803C((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2355BD654);
  v91[0] = v55;
  v91[1] = v49;
  v91[2] = v79;
  v91[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_256249D38);
  v87 = v69;
  *(_QWORD *)&v95[0] = v67;
  *((_QWORD *)&v95[0] + 1) = v66;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v89 = sub_235598144(&qword_256248F28, (uint64_t (*)(uint64_t))type metadata accessor for OfferView, (uint64_t)&protocol conformance descriptor for OfferView);
  v90 = sub_2355BD6BC();
  sub_2355B91C0(v94, 4uLL, (uint64_t)v91);
  sub_23559803C((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2355BD894);
  sub_23558DF78(v50, (uint64_t (*)(_QWORD))type metadata accessor for OfferView);
  v59 = *(void (**)(char *, uint64_t))(v85 + 8);
  v59(v57, v49);
  v60 = v73;
  v73(v86, v55);
  sub_235598700((uint64_t)v92, (uint64_t)v95, &qword_256249D38);
  sub_23559803C((uint64_t)v95, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2355BD894);
  sub_23558DF78(v58, (uint64_t (*)(_QWORD))type metadata accessor for OfferView);
  v59((char *)v56, v49);
  return v60(v54, v55);
}

uint64_t sub_2355BCEF4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, void *a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t KeyPath;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  char v19;
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
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  int v37;
  __int128 v38;
  char v39;
  _BYTE v41[136];
  _BYTE v42[133];
  _OWORD __src[17];
  _DWORD v44[34];
  _BYTE v45[144];

  v6 = type metadata accessor for ManagedAppCellContext(0, a1, a2, a3);
  if (sub_2355BF64C(v6))
  {
    v8 = type metadata accessor for CompactManagedAppCell(0, a1, a2, v7);
    sub_2355BAD78(v8, v9, (uint64_t *)__src);
    v36 = __src[1];
    v38 = __src[0];
    v34 = __src[2];
    v10 = __src[3];
    KeyPath = swift_getKeyPath();
    v12 = sub_2355C8AF0();
    __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
    sub_2355C8748();
    sub_2355C86F4();
    v41[0] = 0;
    __src[0] = v38;
    __src[1] = v36;
    __src[2] = v34;
    __src[3] = v10;
    *(_QWORD *)&__src[4] = KeyPath;
    *((_QWORD *)&__src[4] + 1) = 1;
    LOBYTE(__src[5]) = 0;
    DWORD1(__src[5]) = *(_DWORD *)((char *)v44 + 3);
    *(_DWORD *)((char *)&__src[5] + 1) = v44[0];
    BYTE8(__src[5]) = v12;
    HIDWORD(__src[5]) = *(_DWORD *)&v42[3];
    *(_DWORD *)((char *)&__src[5] + 9) = *(_DWORD *)v42;
    *(_QWORD *)&__src[6] = v13;
    *((_QWORD *)&__src[6] + 1) = v14;
    *(_QWORD *)&__src[7] = v15;
    *((_QWORD *)&__src[7] + 1) = v16;
    LOBYTE(__src[8]) = 0;
    nullsub_1(__src);
    sub_235598700((uint64_t)__src, (uint64_t)v45, &qword_256249D88);
  }
  else
  {
    sub_2355BDA5C((uint64_t)__src);
    sub_235598700((uint64_t)__src, (uint64_t)v45, &qword_256249D88);
    v8 = type metadata accessor for CompactManagedAppCell(0, a1, a2, v17);
  }
  sub_235595730(v8, (uint64_t)__src);
  v18 = __src[0];
  v19 = __src[1];
  v20 = *((_QWORD *)&__src[1] + 1);
  v39 = sub_2355C8AF0();
  __swift_instantiateConcreteTypeFromMangledName(qword_256248E08);
  sub_2355C8748();
  sub_2355C86F4();
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  sub_2355BAA20(v8, v29, (uint64_t)__src);
  v30 = __src[0];
  v31 = __src[1];
  v37 = __src[2];
  v32 = *(_QWORD *)&__src[3];
  v35 = *((_QWORD *)&__src[2] + 1);
  sub_235598700((uint64_t)v45, (uint64_t)v41, &qword_256249D88);
  sub_235598700((uint64_t)v41, (uint64_t)v42, &qword_256249D88);
  sub_235598700((uint64_t)v42, (uint64_t)__src, &qword_256249D88);
  *(_OWORD *)((char *)&__src[8] + 8) = v18;
  BYTE8(__src[9]) = v19;
  *(_QWORD *)&__src[10] = v20;
  BYTE8(__src[10]) = v39;
  *(_QWORD *)&__src[11] = v22;
  *((_QWORD *)&__src[11] + 1) = v24;
  *(_QWORD *)&__src[12] = v26;
  *((_QWORD *)&__src[12] + 1) = v28;
  LOBYTE(__src[13]) = 0;
  *(_OWORD *)((char *)&__src[13] + 8) = v30;
  *(_OWORD *)((char *)&__src[14] + 8) = v31;
  DWORD2(__src[15]) = v37;
  *(_QWORD *)&__src[16] = v35;
  *((_QWORD *)&__src[16] + 1) = v32;
  memcpy(a4, __src, 0x110uLL);
  sub_2355BDAE4((uint64_t)v42, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2355BDA78);
  sub_2355914F4(v18, *((uint64_t *)&v18 + 1), v19);
  swift_bridgeObjectRetain();
  sub_235597D54(v30, *((uint64_t *)&v30 + 1), v31, *((uint64_t *)&v31 + 1));
  swift_retain();
  swift_retain();
  sub_235597C94(v30, *((uint64_t *)&v30 + 1), v31, *((uint64_t *)&v31 + 1));
  swift_release();
  swift_release();
  sub_235591958(v18, *((uint64_t *)&v18 + 1), v19);
  swift_bridgeObjectRelease();
  sub_235598700((uint64_t)v41, (uint64_t)v44, &qword_256249D88);
  return sub_2355BDAE4((uint64_t)v44, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2355BD5E8);
}

uint64_t sub_2355BD258@<X0>(uint64_t *a1@<X8>)
{
  return sub_235597988(&qword_256249088, a1);
}

uint64_t sub_2355BD26C@<X0>(uint64_t *a1@<X8>)
{
  return sub_235597988(&qword_256249080, a1);
}

uint64_t sub_2355BD280@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  uint64_t *v20;

  v16 = type metadata accessor for ManagedAppCellContext(0, a6, a7, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(a8, a1, v16);
  v18 = (int *)type metadata accessor for CompactManagedAppCell(0, a6, a7, v17);
  v19 = a8 + v18[9];
  *(_QWORD *)v19 = a2;
  *(_BYTE *)(v19 + 8) = a3 & 1;
  sub_235598700(a4, a8 + v18[10], &qword_256249068);
  sub_235598700(a5, a8 + v18[11], &qword_256249070);
  v20 = (uint64_t *)(a8 + v18[12]);
  *v20 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249078);
  swift_storeEnumTagMultiPayload();
  sub_235593E88();
  sub_2355C873C();
  return sub_2355C873C();
}

uint64_t sub_2355BD3E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_2355BC35C(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_2355BD3F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_2355BC748(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_2355BD3FC()
{
  sub_2355B6040();
  return sub_2355C891C();
}

uint64_t sub_2355BD438(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248EA0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v9 - v6;
  sub_2355986BC(a1, (uint64_t)&v9 - v6, &qword_256248EA0);
  sub_2355986BC((uint64_t)v7, (uint64_t)v5, &qword_256248EA0);
  sub_2355B6040();
  sub_2355C8928();
  return sub_23558E470((uint64_t)v7, &qword_256248EA0);
}

uint64_t sub_2355BD50C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 160);
  v3 = *(_QWORD *)(a1 + 168);
  v4 = *(_BYTE *)(a1 + 176);
  v5 = *(_QWORD *)(a1 + 240);
  v6 = *(_QWORD *)(a1 + 248);
  v7 = *(_QWORD *)(a1 + 256);
  v8 = *(_QWORD *)(a1 + 264);
  sub_2355BD5E8(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  sub_235591958(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_235597C94(v5, v6, v7, v8);
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_2355BD5E8(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    sub_235597C94(result, a2, a3, a4);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2355BD654(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    sub_235597D54(result, a2, a3, a4);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

unint64_t sub_2355BD6BC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_256249D50;
  if (!qword_256249D50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D38);
    v2 = sub_2355BD720();
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256249D50);
  }
  return result;
}

unint64_t sub_2355BD720()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249D58;
  if (!qword_256249D58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D60);
    v2[0] = sub_2355BD7A4();
    v2[1] = sub_23559867C(&qword_256248EF0, &qword_256248EE8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249D58);
  }
  return result;
}

unint64_t sub_2355BD7A4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249D68;
  if (!qword_256249D68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D70);
    v2[0] = sub_2355BD828();
    v2[1] = sub_23559867C(&qword_256248F98, &qword_256248FA0, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249D68);
  }
  return result;
}

unint64_t sub_2355BD828()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249D78;
  if (!qword_256249D78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D80);
    v2[0] = sub_235597F5C();
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249D78);
  }
  return result;
}

uint64_t sub_2355BD894(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    sub_235597C94(result, a2, a3, a4);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2355BD904@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2355C888C();
  *a1 = result;
  return result;
}

uint64_t sub_2355BD92C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2355C888C();
  *a1 = result;
  return result;
}

uint64_t sub_2355BD954()
{
  swift_retain();
  return sub_2355C8898();
}

uint64_t sub_2355BD97C()
{
  swift_retain();
  return sub_2355C8898();
}

uint64_t sub_2355BD9A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_2355C88D4();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_2355BD9D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_2355C88D4();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_2355BDA04()
{
  return sub_2355C88E0();
}

uint64_t sub_2355BDA30()
{
  return sub_2355C88E0();
}

double sub_2355BDA5C(uint64_t a1)
{
  double result;

  *(_BYTE *)(a1 + 128) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_2355BDA78(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    sub_235597D54(result, a2, a3, a4);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_2355BDAE4(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 128);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), v4);
  return a1;
}

uint64_t sub_2355BDB48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return sub_2355BA420(a1, v2[4], v2[2], v2[3], a2);
}

uint64_t sub_2355BDB54@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_2355BAE18(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_2355BDB60(uint64_t a1)
{
  sub_2355BDBE8(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_OWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    *(_QWORD *)(a1 + 208),
    *(_QWORD *)(a1 + 216),
    *(_QWORD *)(a1 + 224),
    *(_BYTE *)(a1 + 232),
    *(_BYTE *)(a1 + 233));
  return a1;
}

uint64_t sub_2355BDBE8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,char a28)
{
  if ((a28 & 1) != 0)
  {
    sub_235591958(a1, a2, a3 & 1);
    swift_bridgeObjectRelease();
    sub_235597C94(a11, a12, a13, a14);
    swift_release();
    return swift_release();
  }
  else
  {
    sub_235597C94(a1, a2, a3, a4);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    sub_235591958(a18, a19, a20 & 1);
    return swift_bridgeObjectRelease();
  }
}

BOOL sub_2355BDCE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t (*v12)(char *, uint64_t);
  int v13;
  unint64_t v14;
  int v15;
  _DWORD *v16;
  int v17;
  unint64_t v18;
  uint64_t v20;

  v4 = sub_2355C8994();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v20 - v9;
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)&v20 - v9, a2, v4);
  v12 = *(uint64_t (**)(char *, uint64_t))(v5 + 88);
  v13 = v12(v10, v4);
  v14 = 0;
  v15 = *MEMORY[0x24BDEEE58];
  v16 = (_DWORD *)MEMORY[0x24BDEEE90];
  if (v13 != *MEMORY[0x24BDEEE58])
  {
    if (v13 == *MEMORY[0x24BDEEE90])
    {
      v14 = 1;
      goto LABEL_24;
    }
    if (v13 == *MEMORY[0x24BDEEE98])
    {
      v14 = 2;
      goto LABEL_24;
    }
    if (v13 == *MEMORY[0x24BDEEE88])
      goto LABEL_7;
    if (v13 == *MEMORY[0x24BDEEE50])
    {
      v14 = 4;
    }
    else if (v13 == *MEMORY[0x24BDEEE60])
    {
      v14 = 5;
    }
    else if (v13 == *MEMORY[0x24BDEEE30])
    {
      v14 = 6;
    }
    else if (v13 == *MEMORY[0x24BDEEE70])
    {
      v14 = 7;
    }
    else if (v13 == *MEMORY[0x24BDEEE68])
    {
      v14 = 8;
    }
    else if (v13 == *MEMORY[0x24BDEEE78])
    {
      v14 = 9;
    }
    else if (v13 == *MEMORY[0x24BDEEE40])
    {
      v14 = 10;
    }
    else
    {
      if (v13 != *MEMORY[0x24BDEEE48])
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
LABEL_7:
        v14 = 3;
        goto LABEL_24;
      }
      v14 = 11;
    }
  }
LABEL_24:
  v11(v8, a1, v4);
  v17 = v12(v8, v4);
  if (v17 == v15)
  {
    v18 = 0;
  }
  else if (v17 == *v16)
  {
    v18 = 1;
  }
  else if (v17 == *MEMORY[0x24BDEEE98])
  {
    v18 = 2;
  }
  else
  {
    if (v17 != *MEMORY[0x24BDEEE88])
    {
      if (v17 == *MEMORY[0x24BDEEE50])
      {
        v18 = 4;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE60])
      {
        v18 = 5;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE30])
      {
        v18 = 6;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE70])
      {
        v18 = 7;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE68])
      {
        v18 = 8;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE78])
      {
        v18 = 9;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE40])
      {
        v18 = 10;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE48])
      {
        v18 = 11;
        return v14 < v18;
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    v18 = 3;
  }
  return v14 < v18;
}

unint64_t sub_2355BE070()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_256249DB0;
  if (!qword_256249DB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D18);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D98);
    v2[3] = sub_23559867C(&qword_256249DA0, &qword_256249D98, MEMORY[0x24BDF4700]);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_23559867C(&qword_256248EF0, &qword_256248EE8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249DB0);
  }
  return result;
}

unint64_t sub_2355BE13C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256249DB8;
  if (!qword_256249DB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D20);
    v2 = sub_235598144(&qword_256248EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    v3[0] = MEMORY[0x24BDF4610];
    v3[1] = v2;
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256249DB8);
  }
  return result;
}

uint64_t sub_2355BE1C0(uint64_t result)
{
  *(_BYTE *)(result + 209) = 1;
  return result;
}

uint64_t *sub_2355BE1CC(uint64_t *a1)
{
  sub_235597D54(*a1, a1[1], a1[2], a1[3]);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t *sub_2355BE23C(uint64_t *a1)
{
  sub_235597C94(*a1, a1[1], a1[2], a1[3]);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_2355BE2AC(uint64_t result)
{
  *(_BYTE *)(result + 209) = 0;
  return result;
}

uint64_t sub_2355BE2BC()
{
  sub_2355B6040();
  return sub_2355C891C();
}

uint64_t sub_2355BE2FC()
{
  return sub_2355C8844();
}

uint64_t sub_2355BE320()
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
  uint64_t OpaqueTypeConformance2;
  _QWORD v13[2];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  sub_2355C8820();
  sub_2355C89D0();
  sub_2355C8AB4();
  sub_2355C8820();
  sub_2355C8820();
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D30);
  v16 = type metadata accessor for OfferView();
  v17 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D38);
  swift_getTupleTypeMetadata();
  v0 = sub_2355C8E50();
  v1 = MEMORY[0x24BDF5428];
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDF5428], v0);
  sub_2355C8DE4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EE8);
  sub_2355C8820();
  swift_getTupleTypeMetadata2();
  v2 = sub_2355C8E50();
  MEMORY[0x23B7CFBF8](v1, v2);
  v3 = sub_2355C8D90();
  v4 = MEMORY[0x24BDF4498];
  v5 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF4498], v3);
  v14 = v3;
  v15 = v5;
  v6 = MEMORY[0x24BDF2F10];
  MEMORY[0x23B7CFBA4](255, &v14, MEMORY[0x24BDF2F10], 0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC0);
  sub_2355C8820();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256248EC8);
  sub_2355C8820();
  sub_2355C89D0();
  sub_2355C8820();
  sub_2355C8820();
  v14 = sub_2355C8820();
  v15 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D18);
  v16 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D20);
  v17 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249D28);
  swift_getTupleTypeMetadata();
  v7 = sub_2355C8E50();
  MEMORY[0x23B7CFBF8](v1, v7);
  v8 = sub_2355C8D90();
  v9 = MEMORY[0x23B7CFBF8](v4, v8);
  v14 = v8;
  v15 = v9;
  MEMORY[0x23B7CFBA4](255, &v14, v6, 0);
  v10 = sub_2355C89D0();
  v14 = v3;
  v15 = v5;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v14 = v8;
  v15 = v9;
  v13[0] = OpaqueTypeConformance2;
  v13[1] = swift_getOpaqueTypeConformance2();
  return MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v10, v13);
}

uint64_t sub_2355BE6B0()
{
  uint64_t v0;

  v0 = sub_2355C85C8();
  __swift_allocate_value_buffer(v0, qword_25624C3A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_25624C3A0);
  return sub_2355C85BC();
}

uint64_t sub_2355BE718()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_2355BE7B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  __int128 v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  __int128 v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0
    || ((((((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
       + 63) & 0xFFFFFFFFFFFFFFF8)
     + 16 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = ((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    v12 = *(_QWORD *)v11;
    v13 = *(_QWORD *)(v11 + 8);
    v14 = *(_BYTE *)(v11 + 16);
    sub_2355914F4(*(_QWORD *)v11, v13, v14);
    *(_QWORD *)v10 = v12;
    *(_QWORD *)(v10 + 8) = v13;
    *(_BYTE *)(v10 + 16) = v14;
    *(_QWORD *)(v10 + 24) = *(_QWORD *)(v11 + 24);
    v15 = (v10 + 39) & 0xFFFFFFFFFFFFFFF8;
    v16 = (v11 + 39) & 0xFFFFFFFFFFFFFFF8;
    v17 = *(_QWORD *)(v16 + 24);
    swift_bridgeObjectRetain();
    if (v17 < 0xFFFFFFFF)
    {
      v21 = *(_OWORD *)(v16 + 16);
      *(_OWORD *)v15 = *(_OWORD *)v16;
      *(_OWORD *)(v15 + 16) = v21;
    }
    else
    {
      v18 = *(_QWORD *)v16;
      v19 = *(_QWORD *)(v16 + 8);
      v20 = *(_BYTE *)(v16 + 16);
      sub_2355914F4(*(_QWORD *)v16, v19, v20);
      *(_QWORD *)v15 = v18;
      *(_QWORD *)(v15 + 8) = v19;
      *(_BYTE *)(v15 + 16) = v20;
      *(_QWORD *)(v15 + 24) = *(_QWORD *)(v16 + 24);
      swift_bridgeObjectRetain();
    }
    v22 = (v15 + 39) & 0xFFFFFFFFFFFFFFF8;
    v23 = (v16 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)(v23 + 24) < 0xFFFFFFFFuLL)
    {
      v27 = *(_OWORD *)(v23 + 16);
      *(_OWORD *)v22 = *(_OWORD *)v23;
      *(_OWORD *)(v22 + 16) = v27;
    }
    else
    {
      v24 = *(_QWORD *)v23;
      v25 = *(_QWORD *)(v23 + 8);
      v26 = *(_BYTE *)(v23 + 16);
      sub_2355914F4(*(_QWORD *)v23, v25, v26);
      *(_QWORD *)v22 = v24;
      *(_QWORD *)(v22 + 8) = v25;
      *(_BYTE *)(v22 + 16) = v26;
      *(_QWORD *)(v22 + 24) = *(_QWORD *)(v23 + 24);
      swift_bridgeObjectRetain();
    }
    v28 = (v22 + 39) & 0xFFFFFFFFFFFFFFF8;
    v29 = (v23 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)(v29 + 24) < 0xFFFFFFFFuLL)
    {
      v33 = *(_OWORD *)(v29 + 16);
      *(_OWORD *)v28 = *(_OWORD *)v29;
      *(_OWORD *)(v28 + 16) = v33;
    }
    else
    {
      v30 = *(_QWORD *)v29;
      v31 = *(_QWORD *)(v29 + 8);
      v32 = *(_BYTE *)(v29 + 16);
      sub_2355914F4(*(_QWORD *)v29, v31, v32);
      *(_QWORD *)v28 = v30;
      *(_QWORD *)(v28 + 8) = v31;
      *(_BYTE *)(v28 + 16) = v32;
      *(_QWORD *)(v28 + 24) = *(_QWORD *)(v29 + 24);
      swift_bridgeObjectRetain();
    }
    v34 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
    v35 = (v29 + 39) & 0xFFFFFFFFFFFFFFF8;
    v36 = *(_QWORD *)v35;
    v37 = *(_QWORD *)(v35 + 8);
    v38 = *(_BYTE *)(v35 + 16);
    sub_235591504(*(_QWORD *)v35, v37, v38);
    *(_QWORD *)v34 = v36;
    *(_QWORD *)(v34 + 8) = v37;
    *(_BYTE *)(v34 + 16) = v38;
    v39 = (_QWORD *)((v28 + 63) & 0xFFFFFFFFFFFFFFF8);
    v40 = (_QWORD *)((v29 + 63) & 0xFFFFFFFFFFFFFFF8);
    v41 = v40[1];
    *v39 = *v40;
    v39[1] = v41;
  }
  swift_retain();
  return v4;
}

uint64_t sub_2355BEA08(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v3 + 8))();
  v4 = (a1 + *(_QWORD *)(v3 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_235591958(*(_QWORD *)v4, *(_QWORD *)(v4 + 8), *(_BYTE *)(v4 + 16));
  swift_bridgeObjectRelease();
  v5 = (v4 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v5 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_235591958(*(_QWORD *)v5, *(_QWORD *)(v5 + 8), *(_BYTE *)(v5 + 16));
    swift_bridgeObjectRelease();
  }
  v6 = (v5 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v6 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_235591958(*(_QWORD *)v6, *(_QWORD *)(v6 + 8), *(_BYTE *)(v6 + 16));
    swift_bridgeObjectRelease();
  }
  v7 = (v6 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v7 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_235591958(*(_QWORD *)v7, *(_QWORD *)(v7 + 8), *(_BYTE *)(v7 + 16));
    swift_bridgeObjectRelease();
  }
  sub_23558A9F8(*(_QWORD *)((v7 + 39) & 0xFFFFFFFFFFFFFFF8), *(_QWORD *)(((v7 + 39) & 0xFFFFFFFFFFFFFFF8) + 8), *(_BYTE *)(((v7 + 39) & 0xFFFFFFFFFFFFFFF8) + 16));
  return swift_release();
}

uint64_t sub_2355BEAFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  __int128 v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_QWORD *)v8;
  v10 = *(_QWORD *)(v8 + 8);
  v11 = *(_BYTE *)(v8 + 16);
  sub_2355914F4(*(_QWORD *)v8, v10, v11);
  *(_QWORD *)v7 = v9;
  *(_QWORD *)(v7 + 8) = v10;
  *(_BYTE *)(v7 + 16) = v11;
  *(_QWORD *)(v7 + 24) = *(_QWORD *)(v8 + 24);
  v12 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  v13 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  v14 = *(_QWORD *)(v13 + 24);
  swift_bridgeObjectRetain();
  if (v14 < 0xFFFFFFFF)
  {
    v18 = *(_OWORD *)(v13 + 16);
    *(_OWORD *)v12 = *(_OWORD *)v13;
    *(_OWORD *)(v12 + 16) = v18;
  }
  else
  {
    v15 = *(_QWORD *)v13;
    v16 = *(_QWORD *)(v13 + 8);
    v17 = *(_BYTE *)(v13 + 16);
    sub_2355914F4(*(_QWORD *)v13, v16, v17);
    *(_QWORD *)v12 = v15;
    *(_QWORD *)(v12 + 8) = v16;
    *(_BYTE *)(v12 + 16) = v17;
    *(_QWORD *)(v12 + 24) = *(_QWORD *)(v13 + 24);
    swift_bridgeObjectRetain();
  }
  v19 = (v12 + 39) & 0xFFFFFFFFFFFFFFF8;
  v20 = (v13 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v20 + 24) < 0xFFFFFFFFuLL)
  {
    v24 = *(_OWORD *)(v20 + 16);
    *(_OWORD *)v19 = *(_OWORD *)v20;
    *(_OWORD *)(v19 + 16) = v24;
  }
  else
  {
    v21 = *(_QWORD *)v20;
    v22 = *(_QWORD *)(v20 + 8);
    v23 = *(_BYTE *)(v20 + 16);
    sub_2355914F4(*(_QWORD *)v20, v22, v23);
    *(_QWORD *)v19 = v21;
    *(_QWORD *)(v19 + 8) = v22;
    *(_BYTE *)(v19 + 16) = v23;
    *(_QWORD *)(v19 + 24) = *(_QWORD *)(v20 + 24);
    swift_bridgeObjectRetain();
  }
  v25 = (v19 + 39) & 0xFFFFFFFFFFFFFFF8;
  v26 = (v20 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v26 + 24) < 0xFFFFFFFFuLL)
  {
    v30 = *(_OWORD *)(v26 + 16);
    *(_OWORD *)v25 = *(_OWORD *)v26;
    *(_OWORD *)(v25 + 16) = v30;
  }
  else
  {
    v27 = *(_QWORD *)v26;
    v28 = *(_QWORD *)(v26 + 8);
    v29 = *(_BYTE *)(v26 + 16);
    sub_2355914F4(*(_QWORD *)v26, v28, v29);
    *(_QWORD *)v25 = v27;
    *(_QWORD *)(v25 + 8) = v28;
    *(_BYTE *)(v25 + 16) = v29;
    *(_QWORD *)(v25 + 24) = *(_QWORD *)(v26 + 24);
    swift_bridgeObjectRetain();
  }
  v31 = (v25 + 39) & 0xFFFFFFFFFFFFFFF8;
  v32 = (v26 + 39) & 0xFFFFFFFFFFFFFFF8;
  v33 = *(_QWORD *)v32;
  v34 = *(_QWORD *)(v32 + 8);
  v35 = *(_BYTE *)(v32 + 16);
  sub_235591504(*(_QWORD *)v32, v34, v35);
  *(_QWORD *)v31 = v33;
  *(_QWORD *)(v31 + 8) = v34;
  *(_BYTE *)(v31 + 16) = v35;
  v36 = (_QWORD *)((v25 + 63) & 0xFFFFFFFFFFFFFFF8);
  v37 = (_QWORD *)((v26 + 63) & 0xFFFFFFFFFFFFFFF8);
  v38 = v37[1];
  *v36 = *v37;
  v36[1] = v38;
  swift_retain();
  return a1;
}

uint64_t sub_2355BECE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  __int128 v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  __int128 v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  __int128 v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  _QWORD *v62;
  _QWORD *v63;
  uint64_t v64;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_QWORD *)v8;
  v10 = *(_QWORD *)(v8 + 8);
  v11 = *(_BYTE *)(v8 + 16);
  sub_2355914F4(*(_QWORD *)v8, v10, v11);
  v12 = *(_QWORD *)v7;
  v13 = *(_QWORD *)(v7 + 8);
  v14 = *(_BYTE *)(v7 + 16);
  *(_QWORD *)v7 = v9;
  *(_QWORD *)(v7 + 8) = v10;
  *(_BYTE *)(v7 + 16) = v11;
  sub_235591958(v12, v13, v14);
  *(_QWORD *)(v7 + 24) = *(_QWORD *)(v8 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  v16 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  v17 = *(_QWORD *)(v16 + 24);
  if (*(_QWORD *)(v15 + 24) < 0xFFFFFFFFuLL)
  {
    if (v17 >= 0xFFFFFFFF)
    {
      v24 = *(_QWORD *)v16;
      v25 = *(_QWORD *)(v16 + 8);
      v26 = *(_BYTE *)(v16 + 16);
      sub_2355914F4(*(_QWORD *)v16, v25, v26);
      *(_QWORD *)v15 = v24;
      *(_QWORD *)(v15 + 8) = v25;
      *(_BYTE *)(v15 + 16) = v26;
      *(_QWORD *)(v15 + 24) = *(_QWORD *)(v16 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
  }
  else
  {
    if (v17 >= 0xFFFFFFFF)
    {
      v18 = *(_QWORD *)v16;
      v19 = *(_QWORD *)(v16 + 8);
      v20 = *(_BYTE *)(v16 + 16);
      sub_2355914F4(*(_QWORD *)v16, v19, v20);
      v21 = *(_QWORD *)v15;
      v22 = *(_QWORD *)(v15 + 8);
      v23 = *(_BYTE *)(v15 + 16);
      *(_QWORD *)v15 = v18;
      *(_QWORD *)(v15 + 8) = v19;
      *(_BYTE *)(v15 + 16) = v20;
      sub_235591958(v21, v22, v23);
      *(_QWORD *)(v15 + 24) = *(_QWORD *)(v16 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    sub_235591958(*(_QWORD *)v15, *(_QWORD *)(v15 + 8), *(_BYTE *)(v15 + 16));
    swift_bridgeObjectRelease();
  }
  v27 = *(_OWORD *)(v16 + 16);
  *(_OWORD *)v15 = *(_OWORD *)v16;
  *(_OWORD *)(v15 + 16) = v27;
LABEL_8:
  v28 = (v15 + 39) & 0xFFFFFFFFFFFFFFF8;
  v29 = (v16 + 39) & 0xFFFFFFFFFFFFFFF8;
  v30 = *(_QWORD *)(v29 + 24);
  if (*(_QWORD *)(v28 + 24) < 0xFFFFFFFFuLL)
  {
    if (v30 >= 0xFFFFFFFF)
    {
      v37 = *(_QWORD *)v29;
      v38 = *(_QWORD *)(v29 + 8);
      v39 = *(_BYTE *)(v29 + 16);
      sub_2355914F4(*(_QWORD *)v29, v38, v39);
      *(_QWORD *)v28 = v37;
      *(_QWORD *)(v28 + 8) = v38;
      *(_BYTE *)(v28 + 16) = v39;
      *(_QWORD *)(v28 + 24) = *(_QWORD *)(v29 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_15;
    }
  }
  else
  {
    if (v30 >= 0xFFFFFFFF)
    {
      v31 = *(_QWORD *)v29;
      v32 = *(_QWORD *)(v29 + 8);
      v33 = *(_BYTE *)(v29 + 16);
      sub_2355914F4(*(_QWORD *)v29, v32, v33);
      v34 = *(_QWORD *)v28;
      v35 = *(_QWORD *)(v28 + 8);
      v36 = *(_BYTE *)(v28 + 16);
      *(_QWORD *)v28 = v31;
      *(_QWORD *)(v28 + 8) = v32;
      *(_BYTE *)(v28 + 16) = v33;
      sub_235591958(v34, v35, v36);
      *(_QWORD *)(v28 + 24) = *(_QWORD *)(v29 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    sub_235591958(*(_QWORD *)v28, *(_QWORD *)(v28 + 8), *(_BYTE *)(v28 + 16));
    swift_bridgeObjectRelease();
  }
  v40 = *(_OWORD *)(v29 + 16);
  *(_OWORD *)v28 = *(_OWORD *)v29;
  *(_OWORD *)(v28 + 16) = v40;
LABEL_15:
  v41 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
  v42 = (v29 + 39) & 0xFFFFFFFFFFFFFFF8;
  v43 = *(_QWORD *)(v42 + 24);
  if (*(_QWORD *)(v41 + 24) < 0xFFFFFFFFuLL)
  {
    if (v43 >= 0xFFFFFFFF)
    {
      v50 = *(_QWORD *)v42;
      v51 = *(_QWORD *)(v42 + 8);
      v52 = *(_BYTE *)(v42 + 16);
      sub_2355914F4(*(_QWORD *)v42, v51, v52);
      *(_QWORD *)v41 = v50;
      *(_QWORD *)(v41 + 8) = v51;
      *(_BYTE *)(v41 + 16) = v52;
      *(_QWORD *)(v41 + 24) = *(_QWORD *)(v42 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_22;
    }
LABEL_21:
    v53 = *(_OWORD *)(v42 + 16);
    *(_OWORD *)v41 = *(_OWORD *)v42;
    *(_OWORD *)(v41 + 16) = v53;
    goto LABEL_22;
  }
  if (v43 < 0xFFFFFFFF)
  {
    sub_235591958(*(_QWORD *)v41, *(_QWORD *)(v41 + 8), *(_BYTE *)(v41 + 16));
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  v44 = *(_QWORD *)v42;
  v45 = *(_QWORD *)(v42 + 8);
  v46 = *(_BYTE *)(v42 + 16);
  sub_2355914F4(*(_QWORD *)v42, v45, v46);
  v47 = *(_QWORD *)v41;
  v48 = *(_QWORD *)(v41 + 8);
  v49 = *(_BYTE *)(v41 + 16);
  *(_QWORD *)v41 = v44;
  *(_QWORD *)(v41 + 8) = v45;
  *(_BYTE *)(v41 + 16) = v46;
  sub_235591958(v47, v48, v49);
  *(_QWORD *)(v41 + 24) = *(_QWORD *)(v42 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_22:
  v54 = (v41 + 39) & 0xFFFFFFFFFFFFFFF8;
  v55 = (v42 + 39) & 0xFFFFFFFFFFFFFFF8;
  v56 = *(_QWORD *)v55;
  v57 = *(_QWORD *)(v55 + 8);
  v58 = *(_BYTE *)(v55 + 16);
  sub_235591504(*(_QWORD *)v55, v57, v58);
  v59 = *(_QWORD *)v54;
  v60 = *(_QWORD *)(v54 + 8);
  *(_QWORD *)v54 = v56;
  *(_QWORD *)(v54 + 8) = v57;
  v61 = *(_BYTE *)(v54 + 16);
  *(_BYTE *)(v54 + 16) = v58;
  sub_23558A9F8(v59, v60, v61);
  v62 = (_QWORD *)((v41 + 63) & 0xFFFFFFFFFFFFFFF8);
  v63 = (_QWORD *)((v42 + 63) & 0xFFFFFFFFFFFFFFF8);
  v64 = v63[1];
  *v62 = *v63;
  v62[1] = v64;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_2355BF05C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  __int128 v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;
  _OWORD *v13;
  _OWORD *v14;
  __int128 v15;
  _OWORD *v16;
  _OWORD *v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  char v21;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  v10 = (_OWORD *)(((unint64_t)v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  v11 = (_OWORD *)(((unint64_t)v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  v13 = (_OWORD *)(((unint64_t)v10 + 39) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_OWORD *)(((unint64_t)v11 + 39) & 0xFFFFFFFFFFFFFFF8);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = (_OWORD *)(((unint64_t)v13 + 39) & 0xFFFFFFFFFFFFFFF8);
  v17 = (_OWORD *)(((unint64_t)v14 + 39) & 0xFFFFFFFFFFFFFFF8);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = ((unint64_t)v16 + 39) & 0xFFFFFFFFFFFFFFF8;
  v20 = ((unint64_t)v17 + 39) & 0xFFFFFFFFFFFFFFF8;
  v21 = *(_BYTE *)(v20 + 16);
  *(_OWORD *)v19 = *(_OWORD *)v20;
  *(_BYTE *)(v19 + 16) = v21;
  *(_OWORD *)(((unint64_t)v16 + 63) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v17 + 63) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_2355BF138(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  __int128 v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  __int128 v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char v38;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  LOBYTE(v6) = *(_BYTE *)(v8 + 16);
  v9 = *(_QWORD *)v7;
  v10 = *(_QWORD *)(v7 + 8);
  v11 = *(_BYTE *)(v7 + 16);
  *(_OWORD *)v7 = *(_OWORD *)v8;
  *(_BYTE *)(v7 + 16) = v6;
  sub_235591958(v9, v10, v11);
  *(_QWORD *)(v7 + 24) = *(_QWORD *)(v8 + 24);
  swift_bridgeObjectRelease();
  v12 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  v13 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v12 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(_QWORD *)(v13 + 24) >= 0xFFFFFFFFuLL)
    {
      v14 = *(_BYTE *)(v13 + 16);
      v15 = *(_QWORD *)v12;
      v16 = *(_QWORD *)(v12 + 8);
      v17 = *(_BYTE *)(v12 + 16);
      *(_OWORD *)v12 = *(_OWORD *)v13;
      *(_BYTE *)(v12 + 16) = v14;
      sub_235591958(v15, v16, v17);
      *(_QWORD *)(v12 + 24) = *(_QWORD *)(v13 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_235591958(*(_QWORD *)v12, *(_QWORD *)(v12 + 8), *(_BYTE *)(v12 + 16));
    swift_bridgeObjectRelease();
  }
  v18 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)v12 = *(_OWORD *)v13;
  *(_OWORD *)(v12 + 16) = v18;
LABEL_6:
  v19 = (v12 + 39) & 0xFFFFFFFFFFFFFFF8;
  v20 = (v13 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v19 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(_QWORD *)(v20 + 24) >= 0xFFFFFFFFuLL)
    {
      v21 = *(_BYTE *)(v20 + 16);
      v22 = *(_QWORD *)v19;
      v23 = *(_QWORD *)(v19 + 8);
      v24 = *(_BYTE *)(v19 + 16);
      *(_OWORD *)v19 = *(_OWORD *)v20;
      *(_BYTE *)(v19 + 16) = v21;
      sub_235591958(v22, v23, v24);
      *(_QWORD *)(v19 + 24) = *(_QWORD *)(v20 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    sub_235591958(*(_QWORD *)v19, *(_QWORD *)(v19 + 8), *(_BYTE *)(v19 + 16));
    swift_bridgeObjectRelease();
  }
  v25 = *(_OWORD *)(v20 + 16);
  *(_OWORD *)v19 = *(_OWORD *)v20;
  *(_OWORD *)(v19 + 16) = v25;
LABEL_11:
  v26 = (v19 + 39) & 0xFFFFFFFFFFFFFFF8;
  v27 = (v20 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v26 + 24) < 0xFFFFFFFFuLL)
  {
LABEL_15:
    v32 = *(_OWORD *)(v27 + 16);
    *(_OWORD *)v26 = *(_OWORD *)v27;
    *(_OWORD *)(v26 + 16) = v32;
    goto LABEL_16;
  }
  if (*(_QWORD *)(v27 + 24) < 0xFFFFFFFFuLL)
  {
    sub_235591958(*(_QWORD *)v26, *(_QWORD *)(v26 + 8), *(_BYTE *)(v26 + 16));
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  v28 = *(_BYTE *)(v27 + 16);
  v29 = *(_QWORD *)v26;
  v30 = *(_QWORD *)(v26 + 8);
  v31 = *(_BYTE *)(v26 + 16);
  *(_OWORD *)v26 = *(_OWORD *)v27;
  *(_BYTE *)(v26 + 16) = v28;
  sub_235591958(v29, v30, v31);
  *(_QWORD *)(v26 + 24) = *(_QWORD *)(v27 + 24);
  swift_bridgeObjectRelease();
LABEL_16:
  v33 = (v26 + 39) & 0xFFFFFFFFFFFFFFF8;
  v34 = (v27 + 39) & 0xFFFFFFFFFFFFFFF8;
  v35 = *(_BYTE *)(v34 + 16);
  v36 = *(_QWORD *)v33;
  v37 = *(_QWORD *)(v33 + 8);
  *(_OWORD *)v33 = *(_OWORD *)v34;
  v38 = *(_BYTE *)(v33 + 16);
  *(_BYTE *)(v33 + 16) = v35;
  sub_23558A9F8(v36, v37, v38);
  *(_OWORD *)((v26 + 63) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v27 + 63) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_2355BF378(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      v12 = *(_QWORD *)(((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8) + 0x18);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((((((((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
           + 63) & 0xFFFFFFFFFFFFFFF8)
         + 16) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_2355BF414 + 4 * byte_2355CB640[v10]))();
  }
}

void sub_2355BF498(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((((((((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8)
         + 63) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((((((((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 63) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((((((((((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)+ 39) & 0xFFFFFFFFFFFFFFF8)+ 63) & 0xFFFFFFFFFFFFFFF8)+ 16);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_2355BF5AC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x2355BF628);
}

void sub_2355BF5B4(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x2355BF5BCLL);
  JUMPOUT(0x2355BF628);
}

void sub_2355BF600()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x2355BF628);
}

void sub_2355BF608()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x2355BF628);
}

uint64_t sub_2355BF610(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!a2)
    goto LABEL_6;
  if (a3 < 0x7FFFFFFF)
  {
    if (a2 < 0)
      JUMPOUT(0x2355BF61CLL);
    *(_QWORD *)(((v6 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 24) = (a2 - 1);
LABEL_6:
    JUMPOUT(0x2355BF628);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v6);
}

uint64_t type metadata accessor for ManagedAppCellContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ManagedAppCellContext);
}

BOOL sub_2355BF64C(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 48) + 24) != 0;
}

BOOL sub_2355BF664(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 44) + 24) != 0;
}

__n128 sub_2355BF67C@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, __int128 a11, uint64_t a12, uint64_t a13, __n128 a14, unint64_t a15, unint64_t a16, uint64_t *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v26;
  int *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  __n128 *v31;
  __n128 result;
  uint64_t v33;
  _QWORD *v34;
  char v35;
  uint64_t v36;
  uint64_t v37;

  v36 = a17[1];
  v37 = *a17;
  v35 = *((_BYTE *)a17 + 16);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a20 - 8) + 32))(a9, a1, a20);
  v27 = (int *)type metadata accessor for ManagedAppCellContext(0, a20, a21, v26);
  v28 = a9 + v27[9];
  *(_QWORD *)v28 = a2;
  *(_QWORD *)(v28 + 8) = a3;
  *(_BYTE *)(v28 + 16) = a4 & 1;
  *(_QWORD *)(v28 + 24) = a5;
  v29 = (_QWORD *)(a9 + v27[10]);
  *v29 = a6;
  v29[1] = a7;
  v29[2] = a8;
  v29[3] = a10;
  v30 = a9 + v27[11];
  *(_OWORD *)v30 = a11;
  *(_QWORD *)(v30 + 16) = a12;
  *(_QWORD *)(v30 + 24) = a13;
  v31 = (__n128 *)(a9 + v27[12]);
  result = a14;
  *v31 = a14;
  v31[1].n128_u64[0] = a15;
  v31[1].n128_u64[1] = a16;
  v33 = a9 + v27[13];
  *(_QWORD *)v33 = v37;
  *(_QWORD *)(v33 + 8) = v36;
  *(_BYTE *)(v33 + 16) = v35;
  v34 = (_QWORD *)(a9 + v27[14]);
  *v34 = a18;
  v34[1] = a19;
  return result;
}

uint64_t sub_2355BF7EC@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  char v10;
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
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  uint64_t v31;
  void (*v32)(uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];

  v37 = a8;
  v38 = a7;
  v36 = a6;
  v31 = a3;
  v32 = a2;
  v10 = a1;
  v33 = *(_QWORD *)(a4 - 8);
  v11 = MEMORY[0x24BDAC7A8](a1);
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v31 - v15;
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v14);
  v21 = (char *)&v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v31 - v22;
  v24 = sub_2355C89D0();
  v35 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v31 - v25;
  if ((v10 & 1) != 0)
  {
    v32(v34);
    sub_2355C82E4((uint64_t)v21, a5, (uint64_t)v23);
    v27 = *(void (**)(char *, uint64_t))(v18 + 8);
    v27(v21, a5);
    sub_2355C4BF4((uint64_t)v23, a5, (uint64_t)v21);
    v28 = v36;
    sub_2355C4C0C((uint64_t)v21, a5);
    v27(v21, a5);
    v27(v23, a5);
  }
  else
  {
    v28 = v36;
    sub_2355C82E4(v34, a4, (uint64_t)v16);
    sub_2355C4BF4((uint64_t)v16, a4, (uint64_t)v13);
    sub_2355C4CD0((uint64_t)v13, a5, a4);
    v29 = *(void (**)(char *, uint64_t))(v33 + 8);
    v29(v13, a4);
    v29(v16, a4);
  }
  v39[0] = v38;
  v39[1] = v28;
  MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v24, v39);
  sub_2355C4BF4((uint64_t)v26, v24, v37);
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v26, v24);
}

uint64_t *sub_2355BFA54@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_2355C9090();
    v23 = (void *)sub_2355C8ACC();
    sub_2355C85A4();

  }
  sub_2355C8838();
  v24 = *(_OWORD *)(v13 + 16);
  *a9 = *(_OWORD *)v13;
  a9[1] = v24;
  v25 = *(_OWORD *)(v13 + 48);
  a9[2] = *(_OWORD *)(v13 + 32);
  a9[3] = v25;
  a9[8] = v31;
  a9[9] = v32;
  a9[10] = v33;
  a9[4] = v27;
  a9[5] = v28;
  a9[6] = v29;
  a9[7] = v30;
  return sub_2355C4778((uint64_t *)v13);
}

uint64_t sub_2355BFBF8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _OWORD v34[2];
  __int128 v35;
  __int128 v36;
  _BYTE v37[8];
  uint64_t v38[5];

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_2355C9090();
    v23 = (void *)sub_2355C8ACC();
    sub_2355C85A4();

  }
  sub_2355C8838();
  v24 = *(_OWORD *)(v13 + 16);
  v34[0] = *(_OWORD *)v13;
  v34[1] = v24;
  v35 = *(_OWORD *)(v13 + 32);
  sub_235598700((uint64_t)v34, (uint64_t)v38, &qword_256248F80);
  v36 = v35;
  sub_235598700((uint64_t)&v36 + 8, (uint64_t)v37, &qword_25624A110);
  v25 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v25;
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a9 + 104) = v30;
  *(_OWORD *)(a9 + 120) = v31;
  *(_OWORD *)(a9 + 136) = v32;
  *(_OWORD *)(a9 + 152) = v33;
  *(_OWORD *)(a9 + 56) = v27;
  *(_OWORD *)(a9 + 72) = v28;
  *(_DWORD *)(a9 + 48) = *(_DWORD *)(v13 + 48);
  *(_OWORD *)(a9 + 88) = v29;
  sub_2355C4720(v38);
  swift_retain();
  return sub_2355C4750((uint64_t)v37);
}

uint64_t sub_2355BFE00@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  _OWORD *v13;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[8];
  uint64_t v36[5];

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_2355C9090();
    v23 = (void *)sub_2355C8ACC();
    sub_2355C85A4();

  }
  sub_2355C8838();
  sub_235598700((uint64_t)v13, (uint64_t)v36, &qword_256248F80);
  v34 = v13[2];
  sub_235598700((uint64_t)&v34 + 8, (uint64_t)v35, &qword_25624A110);
  v24 = v13[1];
  *a9 = *v13;
  a9[1] = v24;
  v25 = v13[2];
  a9[6] = v30;
  a9[7] = v31;
  a9[8] = v32;
  a9[9] = v33;
  a9[2] = v25;
  a9[3] = v27;
  a9[4] = v28;
  a9[5] = v29;
  sub_2355C4720(v36);
  swift_retain();
  return sub_2355C4750((uint64_t)v35);
}

__n128 sub_2355BFFE0@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  _OWORD *v24;
  __n128 result;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __n128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_2355C9090();
    v23 = (void *)sub_2355C8ACC();
    sub_2355C85A4();

  }
  sub_2355C8838();
  sub_2355986BC(v13, a9, &qword_256249E90);
  v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256249E98) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *v24 = v26;
  v24[1] = v27;
  result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t ManagedAppView.init(app:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  int *v10;
  uint64_t *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD v21[2];
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_256248A00);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v21 - v8;
  *(_QWORD *)a2 = swift_getKeyPath();
  *(_BYTE *)(a2 + 8) = 0;
  v10 = (int *)type metadata accessor for ManagedAppView(0);
  v11 = (uint64_t *)(a2 + v10[5]);
  *v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562492F0);
  swift_storeEnumTagMultiPayload();
  v12 = type metadata accessor for AppExtensionHostView.Configuration(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  sub_2355986BC((uint64_t)v9, (uint64_t)v7, qword_256248A00);
  sub_2355C8D3C();
  sub_23558E470((uint64_t)v9, qword_256248A00);
  v13 = (_QWORD *)(a2 + v10[7]);
  *(_QWORD *)&v21[0] = 0;
  sub_2355C8D3C();
  v14 = *((_QWORD *)&v22 + 1);
  *v13 = v22;
  v13[1] = v14;
  v15 = a2 + v10[8];
  type metadata accessor for CGRect(0);
  memset(v21, 0, sizeof(v21));
  sub_2355C8D3C();
  v16 = v24;
  v17 = v23;
  *(_OWORD *)v15 = v22;
  *(_OWORD *)(v15 + 16) = v17;
  *(_QWORD *)(v15 + 32) = v16;
  v18 = a2 + v10[9];
  v19 = sub_2355C8520();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18, a1, v19);
}

uint64_t ManagedAppView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  _OWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  char *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(char *);
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;
  uint64_t v102;

  v2 = (uint64_t)v1;
  v95 = a1;
  v94 = type metadata accessor for MaskView(0);
  MEMORY[0x24BDAC7A8](v94);
  v93 = (char *)&v68 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = sub_2355C8FDC();
  v89 = *(_QWORD *)(v90 - 8);
  MEMORY[0x24BDAC7A8](v90);
  v88 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (int *)type metadata accessor for ManagedAppView(0);
  v85 = *((_QWORD *)v5 - 1);
  v86 = *(_QWORD *)(v85 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v84 = (uint64_t)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(qword_256248A00);
  MEMORY[0x24BDAC7A8](v7);
  v77 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2355C8520();
  v70 = *(_QWORD *)(v9 - 8);
  v10 = v70;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = v12;
  v13 = (int *)type metadata accessor for AppExtensionHostView(0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249E88);
  MEMORY[0x24BDAC7A8](v80);
  v79 = (char *)&v68 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249E90);
  MEMORY[0x24BDAC7A8](v17);
  v83 = (char *)&v68 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249E98);
  MEMORY[0x24BDAC7A8](v19);
  v87 = (uint64_t)&v68 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249EA0);
  MEMORY[0x24BDAC7A8](v92);
  v91 = (char *)&v68 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = *v1;
  v23 = *(_BYTE *)(v2 + 8);
  sub_23558C900(v22, v23);
  sub_23559D63C(v22, v23, &v99);
  sub_23558CA44(v22, v23);
  v24 = dbl_2355CB8A8[(char)v99];
  v74 = sub_2355C0B88(v2);
  v73 = v25;
  v81 = v2 + v5[9];
  v82 = *(void (**)(char *))(v10 + 16);
  v72 = v9;
  v82(v12);
  v76 = (_QWORD *)(v2 + v5[7]);
  v26 = v76[1];
  *(_QWORD *)&v96 = *v76;
  *((_QWORD *)&v96 + 1) = v26;
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249EA8);
  sub_2355C8D60();
  v27 = *((_QWORD *)&v99 + 1);
  v69 = v99;
  v28 = v100;
  v29 = v2 + v5[8];
  v30 = *(_QWORD *)(v29 + 32);
  v31 = *(_OWORD *)(v29 + 16);
  v96 = *(_OWORD *)v29;
  v97 = v31;
  v98 = v30;
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249EB0);
  sub_2355C8D60();
  v32 = v99;
  v68 = v100;
  v33 = v101;
  v34 = v102;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249EB8);
  v35 = (uint64_t)v77;
  sub_2355C8D48();
  *(_QWORD *)v15 = swift_getKeyPath();
  v15[8] = 0;
  (*(void (**)(char *, char *, uint64_t))(v70 + 32))(&v15[v13[5]], v71, v9);
  v36 = &v15[v13[6]];
  *(_QWORD *)v36 = v69;
  *((_QWORD *)v36 + 1) = v27;
  *((_QWORD *)v36 + 2) = v28;
  v37 = &v15[v13[7]];
  *(_OWORD *)v37 = v32;
  *((_OWORD *)v37 + 1) = v68;
  *((_QWORD *)v37 + 4) = v33;
  *((_QWORD *)v37 + 5) = v34;
  sub_235598700(v35, (uint64_t)&v15[v13[8]], qword_256248A00);
  v38 = v84;
  sub_235598184(v2, v84, type metadata accessor for ManagedAppView);
  v39 = (*(unsigned __int8 *)(v85 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80);
  v40 = swift_allocObject();
  sub_2355C48B8(v38, v40 + v39, type metadata accessor for ManagedAppView);
  v41 = v88;
  sub_2355C8FC4();
  v42 = (uint64_t)v79;
  v43 = &v79[*(int *)(v80 + 36)];
  v44 = sub_2355C87A8();
  v45 = v89;
  v46 = v90;
  (*(void (**)(char *, char *, uint64_t))(v89 + 16))(&v43[*(int *)(v44 + 20)], v41, v90);
  *(_QWORD *)v43 = &unk_256249EC8;
  *((_QWORD *)v43 + 1) = v40;
  sub_235598184((uint64_t)v15, v42, type metadata accessor for AppExtensionHostView);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v41, v46);
  sub_23558DF78((uint64_t)v15, type metadata accessor for AppExtensionHostView);
  *(_QWORD *)&v99 = v74;
  *((_QWORD *)&v99 + 1) = v73;
  sub_2355C2C74();
  sub_23559FB5C();
  v47 = (uint64_t)v83;
  sub_2355C8C28();
  sub_23558E470(v42, &qword_256249E88);
  swift_bridgeObjectRelease();
  v48 = v76[1];
  *(_QWORD *)&v99 = *v76;
  *((_QWORD *)&v99 + 1) = v48;
  sub_2355C8D48();
  if (v24 > *(double *)&v96)
    v49 = v24;
  else
    v49 = *(double *)&v96;
  sub_2355C8E20();
  v50 = v87;
  sub_2355BFFE0(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, v87, v49, 0, 0.0, 1);
  sub_23558E470(v47, &qword_256249E90);
  v51 = (uint64_t)v93;
  ((void (*)(char *, uint64_t, uint64_t))v82)(v93, v81, v72);
  v52 = *(_QWORD *)(v29 + 32);
  v53 = *(_OWORD *)(v29 + 16);
  v99 = *(_OWORD *)v29;
  v100 = v53;
  v101 = v52;
  sub_2355C8D48();
  v54 = v96;
  v55 = v97;
  v56 = v94;
  *(double *)(v51 + *(int *)(v94 + 20)) = v24;
  v57 = (_OWORD *)(v51 + *(int *)(v56 + 24));
  *v57 = v54;
  v57[1] = v55;
  v58 = v56;
  v59 = v51 + *(int *)(v56 + 28);
  *(_QWORD *)v59 = swift_getKeyPath();
  *(_BYTE *)(v59 + 8) = 0;
  v60 = (uint64_t *)(v51 + *(int *)(v58 + 32));
  *v60 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562492F0);
  swift_storeEnumTagMultiPayload();
  v61 = sub_2355C8E14();
  v63 = v62;
  v64 = (uint64_t)v91;
  v65 = (uint64_t)&v91[*(int *)(v92 + 36)];
  sub_235598184(v51, v65, type metadata accessor for MaskView);
  v66 = (uint64_t *)(v65 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256249EE0) + 36));
  *v66 = v61;
  v66[1] = v63;
  sub_2355986BC(v50, v64, &qword_256249E98);
  sub_23558DF78(v51, type metadata accessor for MaskView);
  sub_23558E470(v50, &qword_256249E98);
  return sub_235598700(v64, v95, &qword_256249EA0);
}

uint64_t sub_2355C0B88(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  type metadata accessor for ManagedAppView(0);
  v2 = sub_2355C84CC();
  v4 = v3;
  v5 = *(_QWORD *)a1;
  LOBYTE(a1) = *(_BYTE *)(a1 + 8);
  sub_23558C900(v5, a1);
  sub_23559D63C(v5, a1, &v15);
  sub_23558CA44(v5, a1);
  if (v15 == 2)
    v6 = sub_2355C84FC();
  else
    v6 = sub_2355C8514();
  if (v7)
    v8 = v6;
  else
    v8 = 0;
  if (v7)
    v9 = v7;
  else
    v9 = 0xE000000000000000;
  v10 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0)
    v10 = v8 & 0xFFFFFFFFFFFFLL;
  if (!v10)
  {
    swift_bridgeObjectRelease();
    v8 = *(_QWORD *)(sub_2355C84F0() + 16);
    swift_bridgeObjectRelease();
    if (v8)
    {
      v15 = sub_2355C84F0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256249800);
      sub_23559867C(&qword_256249808, &qword_256249800, MEMORY[0x24BEE12C8]);
      v8 = sub_2355C8F58();
      v9 = v11;
      swift_bridgeObjectRelease();
    }
    else
    {
      v9 = 0xE000000000000000;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256248950);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_2355CB6C0;
  *(_QWORD *)(v12 + 32) = v2;
  *(_QWORD *)(v12 + 40) = v4;
  *(_QWORD *)(v12 + 48) = v8;
  *(_QWORD *)(v12 + 56) = v9;
  v15 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249800);
  sub_23559867C(&qword_25624A1B8, &qword_256249800, MEMORY[0x24BEE12B0]);
  v13 = sub_2355C8EC8();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_2355C0D4C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[9] = a1;
  v1[10] = __swift_instantiateConcreteTypeFromMangledName(qword_256248A00);
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  sub_2355C8FB8();
  v1[14] = sub_2355C8FAC();
  v1[15] = sub_2355C8F94();
  v1[16] = v2;
  return swift_task_switch();
}

uint64_t sub_2355C0DFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 104);
  *(_DWORD *)(v0 + 172) = *(_DWORD *)(type metadata accessor for ManagedAppView(0) + 24);
  *(_QWORD *)(v0 + 136) = __swift_instantiateConcreteTypeFromMangledName(&qword_256249EB8);
  sub_2355C8D48();
  v2 = type metadata accessor for AppExtensionHostView.Configuration(0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    sub_23558E470(*(_QWORD *)(v0 + 104), qword_256248A00);
    if (qword_256248828 != -1)
      swift_once();
    *(_QWORD *)(v0 + 144) = qword_256249E78;
    return swift_task_switch();
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 104);
    swift_release();
    sub_23558E470(v4, qword_256248A00);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2355C0F14()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562497A0);
  *v1 = v0;
  v1[1] = sub_2355C0F8C;
  return sub_2355C9000();
}

uint64_t sub_2355C0F8C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2355C0FEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  swift_release();
  sub_2355986BC(v1, v2, qword_256248A00);
  sub_2355C8D54();
  sub_23558E470(v1, qword_256248A00);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2355C108C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  swift_release();
  *(_QWORD *)(v0 + 40) = 0;
  MEMORY[0x23B7CFC94](v0 + 40, 8);
  v1 = *(_QWORD *)(v0 + 40);
  if (qword_256248820 != -1)
    swift_once();
  v2 = *(void **)(v0 + 160);
  v3 = sub_2355C85C8();
  __swift_project_value_buffer(v3, (uint64_t)qword_25624C3A0);
  v4 = v2;
  v5 = v2;
  v6 = sub_2355C85B0();
  v7 = sub_2355C9084();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(void **)(v0 + 160);
  if (v8)
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    *(_DWORD *)v10 = 136315394;
    v15 = v11;
    v16 = 5527621;
    v17 = 0xE300000000000000;
    *(_DWORD *)(v0 + 168) = v1;
    sub_23558E07C();
    sub_2355C8F4C();
    sub_2355C8F34();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 48) = sub_23558FF68(v16, v17, &v15);
    sub_2355C9120();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    swift_getErrorValue();
    v12 = sub_2355C9270();
    *(_QWORD *)(v0 + 64) = sub_23558FF68(v12, v13, &v15);
    sub_2355C9120();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_235588000, v6, v7, "[%s] Configuration error: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7CFC88](v11, -1, -1);
    MEMORY[0x23B7CFC88](v10, -1, -1);

  }
  else
  {

  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2355C1344()
{
  uint64_t result;

  type metadata accessor for ConfigurationCache();
  swift_allocObject();
  result = sub_2355C1380();
  qword_256249E78 = result;
  return result;
}

uint64_t sub_2355C1380()
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
  _QWORD v12[4];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256248B68);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  v5 = sub_2355C8FDC();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = 0;
  *(_QWORD *)(v7 + 24) = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_23558E470((uint64_t)v4, &qword_256248B68);
    v8 = 0;
    v9 = 0;
  }
  else
  {
    sub_2355C8FD0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (*(_QWORD *)(v7 + 16))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v8 = sub_2355C8F94();
      v9 = v10;
      swift_unknownObjectRelease();
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_256248A00);
  if (v9 | v8)
  {
    v12[0] = 0;
    v12[1] = 0;
    v12[2] = v8;
    v12[3] = v9;
  }
  *(_QWORD *)(v1 + 112) = swift_task_create();
  return v1;
}

uint64_t sub_2355C1538(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1[2] = a1;
  v2 = sub_2355C849C();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256248BC0);
  v1[6] = swift_task_alloc();
  v1[7] = swift_task_alloc();
  sub_2355C846C();
  v1[8] = swift_task_alloc();
  v1[9] = sub_2355C8478();
  v1[10] = swift_task_alloc();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624A190);
  v1[11] = v3;
  v1[12] = *(_QWORD *)(v3 - 8);
  v1[13] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624A198);
  v1[14] = v4;
  v1[15] = *(_QWORD *)(v4 - 8);
  v1[16] = swift_task_alloc();
  v5 = sub_2355C8490();
  v1[17] = v5;
  v1[18] = *(_QWORD *)(v5 - 8);
  v1[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2355C1690()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t);

  v2 = v0[12];
  v1 = v0[13];
  v3 = v0[11];
  sub_2355C8460();
  sub_2355C8484();
  sub_235598144(&qword_25624A1A0, (uint64_t (*)(uint64_t))MEMORY[0x24BDC7820], MEMORY[0x24BDC7830]);
  sub_2355C91D4();
  sub_2355C918C();
  sub_2355C9018();
  sub_2355C9198();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_2355C91C8();
  v6 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_25624A1A8 + dword_25624A1A8);
  v4 = (_QWORD *)swift_task_alloc();
  v0[20] = v4;
  *v4 = v0;
  v4[1] = sub_2355C17E4;
  return v6(0, 0);
}

uint64_t sub_2355C17E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 168) = a1;
  *(_QWORD *)(v3 + 176) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2355C1850()
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
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(v0 + 168);
  if (v1)
  {
    if (*(_QWORD *)(v1 + 16))
    {
      (*(void (**)(_QWORD, unint64_t, _QWORD))(*(_QWORD *)(v0 + 32) + 16))(*(_QWORD *)(v0 + 56), v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v0 + 32) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v0 + 32) + 80)), *(_QWORD *)(v0 + 24));
      v2 = 0;
    }
    else
    {
      v2 = 1;
    }
    v9 = *(_QWORD *)(v0 + 48);
    v8 = *(_QWORD *)(v0 + 56);
    v10 = *(_QWORD *)(v0 + 24);
    v11 = *(_QWORD *)(v0 + 32);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(v8, v2, 1, v10);
    swift_bridgeObjectRelease();
    sub_2355986BC(v8, v9, (uint64_t *)&unk_256248BC0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
    {
      v12 = type metadata accessor for AppExtensionHostView.Configuration(0);
      v13 = 1;
    }
    else
    {
      v14 = *(_QWORD *)(v0 + 40);
      v15 = *(_QWORD *)(v0 + 24);
      v16 = *(_QWORD *)(v0 + 32);
      v17 = *(_QWORD *)(v0 + 16);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v16 + 32))(v14, *(_QWORD *)(v0 + 48), v15);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v17, v14, v15);
      v12 = type metadata accessor for AppExtensionHostView.Configuration(0);
      v18 = (_QWORD *)(v17 + *(int *)(v12 + 20));
      *v18 = 0xD000000000000014;
      v18[1] = 0x80000002355CBC50;
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
      v13 = 0;
    }
    v20 = *(_QWORD *)(v0 + 144);
    v19 = *(_QWORD *)(v0 + 152);
    v22 = *(_QWORD *)(v0 + 128);
    v21 = *(_QWORD *)(v0 + 136);
    v23 = *(_QWORD *)(v0 + 112);
    v24 = *(_QWORD *)(v0 + 120);
    v25 = *(_QWORD *)(v0 + 56);
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(*(_QWORD *)(v0 + 16), v13, 1, v12);
    sub_23558E470(v25, (uint64_t *)&unk_256248BC0);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 144);
    v3 = *(_QWORD *)(v0 + 152);
    v5 = *(_QWORD *)(v0 + 136);
    v6 = *(_QWORD *)(v0 + 16);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 112));
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    v7 = type metadata accessor for AppExtensionHostView.Configuration(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  }
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

uint64_t sub_2355C1AA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 144);
  v1 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 136);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 112));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
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

uint64_t sub_2355C1B70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[13] = a2;
  v3[14] = v2;
  v3[12] = a1;
  if (a1)
  {
    swift_getObjectType();
    v4 = sub_2355C8F94();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v3[15] = v4;
  v3[16] = v6;
  return swift_task_switch();
}

uint64_t sub_2355C1BE4()
{
  uint64_t v0;
  void (*v1)(uint64_t, _QWORD);
  _QWORD *v2;
  _QWORD *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25624A198);
  if (!sub_2355C9198())
    return (*(uint64_t (**)(void))(v0 + 8))();
  v1 = (void (*)(uint64_t, _QWORD))sub_2355C91B0();
  --*v2;
  v1(v0 + 16, 0);
  *(_QWORD *)(v0 + 136) = sub_2355C91A4();
  sub_2355C846C();
  sub_235598144(&qword_25624A1B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDC7808], MEMORY[0x24BDC7810]);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v3;
  *v3 = v0;
  v3[1] = sub_2355C1D0C;
  return sub_2355C8FA0();
}

uint64_t sub_2355C1D0C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (!v0)
    (*(void (**)(uint64_t, _QWORD))(v2 + 136))(v2 + 48, 0);
  return swift_task_switch();
}

uint64_t sub_2355C1D7C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 80));
}

uint64_t sub_2355C1D8C()
{
  uint64_t v0;

  (*(void (**)(uint64_t, uint64_t))(v0 + 136))(v0 + 48, 1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2355C1DC8()
{
  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_2355C1DEC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_2355C1DF8()
{
  uint64_t v0;
  uint64_t result;

  sub_2355C8CD0();
  v0 = sub_2355C8CDC();
  result = swift_release();
  qword_256249E80 = v0;
  return result;
}

__n128 sub_2355C1E38@<Q0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __n128 result;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  char v24;
  uint64_t v25;
  char v26;
  __int128 v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  _OWORD v34[7];
  _BYTE v35[19];

  v4 = sub_2355C8808();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MaskView(0);
  sub_23559DE34((uint64_t)v7);
  v9 = sub_2355C87FC();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((v9 & 1) == 0)
  {
    v14 = a1 + *(int *)(v8 + 28);
    v15 = *(_QWORD *)v14;
    v16 = *(_BYTE *)(v14 + 8);
    sub_23558C900(*(_QWORD *)v14, v16);
    sub_23559D63C(v15, v16, &v28);
    sub_23558CA44(v15, v16);
    __asm { BR              X10 }
  }
  v10 = a1 + *(int *)(v8 + 28);
  v11 = *(_QWORD *)v10;
  v12 = *(_BYTE *)(v10 + 8);
  sub_23558C900(*(_QWORD *)v10, v12);
  sub_23559D63C(v11, v12, v34);
  sub_23558CA44(v11, v12);
  if (qword_256248830 != -1)
    swift_once();
  v13 = qword_256249E80;
  swift_retain();
  sub_2355C876C();
  sub_2355C876C();
  CGRectGetHeight(*(CGRect *)(a1 + *(int *)(v8 + 24)));
  sub_2355C8E14();
  sub_2355C8760();
  v23[0] = v13;
  v23[1] = v29;
  v24 = v30;
  v25 = v31;
  v26 = v32;
  v27 = v33;
  sub_2355C4B34((uint64_t)v23);
  sub_235598700((uint64_t)v23, (uint64_t)&v22, &qword_25624A160);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25624A118);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25624A168);
  sub_2355C4948();
  sub_2355C4AAC();
  sub_2355C89C4();
  v17 = *(_OWORD *)v35;
  *(_OWORD *)(a2 + 96) = v34[6];
  *(_OWORD *)(a2 + 112) = v17;
  *(_DWORD *)(a2 + 127) = *(_DWORD *)&v35[15];
  v18 = v34[3];
  *(_OWORD *)(a2 + 32) = v34[2];
  *(_OWORD *)(a2 + 48) = v18;
  v19 = v34[5];
  *(_OWORD *)(a2 + 64) = v34[4];
  *(_OWORD *)(a2 + 80) = v19;
  result = (__n128)v34[1];
  *(_OWORD *)a2 = v34[0];
  *(__n128 *)(a2 + 16) = result;
  return result;
}

double sub_2355C2620@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  double result;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  __int128 v14;

  if (qword_256248830 != -1)
    swift_once();
  v2 = qword_256249E80;
  swift_retain();
  sub_2355C876C();
  sub_2355C8E14();
  sub_2355C8760();
  sub_2355C876C();
  type metadata accessor for MaskView(0);
  sub_2355C876C();
  swift_retain();
  sub_2355C876C();
  sub_2355C8E14();
  sub_2355C8760();
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v2;
  *(_QWORD *)(a1 + 64) = v10;
  *(_BYTE *)(a1 + 72) = v11;
  *(_QWORD *)(a1 + 80) = v12;
  *(_BYTE *)(a1 + 88) = v13;
  result = *(double *)&v14;
  *(_OWORD *)(a1 + 96) = v14;
  return result;
}

double sub_2355C27A4@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  double result;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  __int128 v14;

  if (qword_256248830 != -1)
    swift_once();
  v2 = qword_256249E80;
  swift_retain();
  sub_2355C876C();
  sub_2355C8E14();
  sub_2355C8760();
  sub_2355C876C();
  type metadata accessor for MaskView(0);
  swift_retain();
  sub_2355C876C();
  sub_2355C8E14();
  sub_2355C8760();
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v2;
  *(_QWORD *)(a1 + 64) = v10;
  *(_BYTE *)(a1 + 72) = v11;
  *(_QWORD *)(a1 + 80) = v12;
  *(_BYTE *)(a1 + 88) = v13;
  result = *(double *)&v14;
  *(_OWORD *)(a1 + 96) = v14;
  return result;
}

uint64_t type metadata accessor for ManagedAppView(uint64_t a1)
{
  return sub_23558C920(a1, (uint64_t *)&unk_256249F48);
}

uint64_t sub_2355C292C()
{
  return sub_2355C8874();
}

uint64_t sub_2355C294C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_2355C8808();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2355C8880();
}

uint64_t type metadata accessor for MaskView(uint64_t a1)
{
  return sub_23558C920(a1, qword_25624A0C8);
}

uint64_t sub_2355C29E0@<X0>(uint64_t a1@<X0>, double (**a2)@<D0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](a1);
  sub_235598184(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for MaskView);
  v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v7 = swift_allocObject();
  result = sub_2355C48B8((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, type metadata accessor for MaskView);
  *a2 = sub_2355C48FC;
  a2[1] = (double (*)@<D0>(uint64_t@<X8>))v7;
  return result;
}

uint64_t sub_2355C2A94()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = (int *)type metadata accessor for ManagedAppView(0);
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  sub_23558CA44(*(_QWORD *)v3, *(_BYTE *)(v3 + 8));
  v4 = v3 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562492F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_2355C8808();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  v6 = v3 + v1[6];
  v7 = type metadata accessor for AppExtensionHostView.Configuration(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7))
  {
    v8 = sub_2355C849C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249EB8);
  swift_release();
  swift_release();
  swift_release();
  v9 = v3 + v1[9];
  v10 = sub_2355C8520();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  return swift_deallocObject();
}

uint64_t sub_2355C2C10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ManagedAppView(0) - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_23558E1F8;
  return sub_2355C0D4C(v3);
}

unint64_t sub_2355C2C74()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256249ED0;
  if (!qword_256249ED0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249E88);
    v2[0] = sub_235598144(&qword_256248B40, type metadata accessor for AppExtensionHostView, (uint64_t)&unk_2355C9D10);
    v2[1] = sub_235598144(&qword_256249ED8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEC4E0], MEMORY[0x24BDEC4C8]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256249ED0);
  }
  return result;
}

uint64_t sub_2355C2D10()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t initializeBufferWithCopyOfBuffer for ManagedAppView(unint64_t a1, uint64_t a2, int *a3)
{
  int v5;
  uint64_t v7;
  char v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t);

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = v13 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = *(_QWORD *)a2;
    v8 = *(_BYTE *)(a2 + 8);
    sub_23558C900(*(_QWORD *)a2, v8);
    *(_QWORD *)a1 = v7;
    *(_BYTE *)(a1 + 8) = v8;
    v9 = a3[5];
    v10 = (_QWORD *)(a1 + v9);
    v11 = (_QWORD *)(a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2562492F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_2355C8808();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v14 = a3[6];
    v15 = (char *)(a1 + v14);
    v16 = (char *)(a2 + v14);
    v17 = type metadata accessor for AppExtensionHostView.Configuration(0);
    v18 = *(_QWORD *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(qword_256248A00);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      v20 = sub_2355C849C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v15, v16, v20);
      v21 = *(int *)(v17 + 20);
      v22 = &v15[v21];
      v23 = &v16[v21];
      v24 = *((_QWORD *)v23 + 1);
      *(_QWORD *)v22 = *(_QWORD *)v23;
      *((_QWORD *)v22 + 1) = v24;
      v25 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56);
      swift_bridgeObjectRetain();
      v25(v15, 0, 1, v17);
    }
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249EB8);
    *(_QWORD *)&v15[*(int *)(v26 + 28)] = *(_QWORD *)&v16[*(int *)(v26 + 28)];
    v27 = a3[7];
    v28 = a3[8];
    v29 = (_QWORD *)(a1 + v27);
    v30 = (_QWORD *)(a2 + v27);
    v31 = v30[1];
    *v29 = *v30;
    v29[1] = v31;
    v32 = a1 + v28;
    v33 = a2 + v28;
    v34 = *(_OWORD *)(v33 + 16);
    *(_OWORD *)v32 = *(_OWORD *)v33;
    *(_OWORD *)(v32 + 16) = v34;
    *(_QWORD *)(v32 + 32) = *(_QWORD *)(v33 + 32);
    v35 = a3[9];
    v36 = a1 + v35;
    v37 = a2 + v35;
    v38 = sub_2355C8520();
    v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    v39(v36, v37, v38);
  }
  return a1;
}

uint64_t destroy for ManagedAppView(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_23558CA44(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  v4 = a1 + a2[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562492F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_2355C8808();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  v6 = a1 + a2[6];
  v7 = type metadata accessor for AppExtensionHostView.Configuration(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7))
  {
    v8 = sub_2355C849C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256249EB8);
  swift_release();
  swift_release();
  swift_release();
  v9 = a1 + a2[9];
  v10 = sub_2355C8520();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
}

uint64_t initializeWithCopy for ManagedAppView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t, uint64_t);

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_23558C900(*(_QWORD *)a2, v7);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  v8 = a3[5];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562492F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_2355C8808();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  else
  {
    *v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v12 = a3[6];
  v13 = (char *)(a1 + v12);
  v14 = (char *)(a2 + v12);
  v15 = type metadata accessor for AppExtensionHostView.Configuration(0);
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(qword_256248A00);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    v18 = sub_2355C849C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v13, v14, v18);
    v19 = *(int *)(v15 + 20);
    v20 = &v13[v19];
    v21 = &v14[v19];
    v22 = *((_QWORD *)v21 + 1);
    *(_QWORD *)v20 = *(_QWORD *)v21;
    *((_QWORD *)v20 + 1) = v22;
    v23 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56);
    swift_bridgeObjectRetain();
    v23(v13, 0, 1, v15);
  }
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249EB8);
  *(_QWORD *)&v13[*(int *)(v24 + 28)] = *(_QWORD *)&v14[*(int *)(v24 + 28)];
  v25 = a3[7];
  v26 = a3[8];
  v27 = (_QWORD *)(a1 + v25);
  v28 = (_QWORD *)(a2 + v25);
  v29 = v28[1];
  *v27 = *v28;
  v27[1] = v29;
  v30 = a1 + v26;
  v31 = a2 + v26;
  v32 = *(_OWORD *)(v31 + 16);
  *(_OWORD *)v30 = *(_OWORD *)v31;
  *(_OWORD *)(v30 + 16) = v32;
  *(_QWORD *)(v30 + 32) = *(_QWORD *)(v31 + 32);
  v33 = a3[9];
  v34 = a1 + v33;
  v35 = a2 + v33;
  v36 = sub_2355C8520();
  v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 16);
  swift_retain();
  swift_retain();
  swift_retain();
  v37(v34, v35, v36);
  return a1;
}

uint64_t assignWithCopy for ManagedAppView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(char *, uint64_t, uint64_t);
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  void (*v26)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_23558C900(*(_QWORD *)a2, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_23558CA44(v8, v9);
  if (a1 != a2)
  {
    v10 = a3[5];
    v11 = (_QWORD *)(a1 + v10);
    v12 = (_QWORD *)(a2 + v10);
    sub_23558E470(a1 + v10, &qword_2562492F0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2562492F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v13 = sub_2355C8808();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v14 = a3[6];
  v15 = (char *)(a1 + v14);
  v16 = (char *)(a2 + v14);
  v17 = type metadata accessor for AppExtensionHostView.Configuration(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  v20 = v19(v15, 1, v17);
  v21 = v19(v16, 1, v17);
  if (!v20)
  {
    if (!v21)
    {
      v40 = sub_2355C849C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v40 - 8) + 24))(v15, v16, v40);
      v41 = *(int *)(v17 + 20);
      v42 = &v15[v41];
      v43 = &v16[v41];
      *(_QWORD *)v42 = *(_QWORD *)v43;
      *((_QWORD *)v42 + 1) = *((_QWORD *)v43 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
    sub_23558DF78((uint64_t)v15, type metadata accessor for AppExtensionHostView.Configuration);
    goto LABEL_11;
  }
  if (v21)
  {
LABEL_11:
    v27 = __swift_instantiateConcreteTypeFromMangledName(qword_256248A00);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    goto LABEL_12;
  }
  v22 = sub_2355C849C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v15, v16, v22);
  v23 = *(int *)(v17 + 20);
  v24 = &v15[v23];
  v25 = &v16[v23];
  *(_QWORD *)v24 = *(_QWORD *)v25;
  *((_QWORD *)v24 + 1) = *((_QWORD *)v25 + 1);
  v26 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56);
  swift_bridgeObjectRetain();
  v26(v15, 0, 1, v17);
LABEL_12:
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249EB8);
  *(_QWORD *)&v15[*(int *)(v28 + 28)] = *(_QWORD *)&v16[*(int *)(v28 + 28)];
  swift_retain();
  swift_release();
  v29 = a3[7];
  v30 = (_QWORD *)(a1 + v29);
  v31 = (_QWORD *)(a2 + v29);
  *v30 = *v31;
  v30[1] = v31[1];
  swift_retain();
  swift_release();
  v32 = a3[8];
  v33 = (_QWORD *)(a1 + v32);
  v34 = (_QWORD *)(a2 + v32);
  *v33 = *v34;
  v33[1] = v34[1];
  v33[2] = v34[2];
  v33[3] = v34[3];
  v33[4] = v34[4];
  swift_retain();
  swift_release();
  v35 = a3[9];
  v36 = a1 + v35;
  v37 = a2 + v35;
  v38 = sub_2355C8520();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 24))(v36, v37, v38);
  return a1;
}

uint64_t initializeWithTake for ManagedAppView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
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

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = a3[5];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562492F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_2355C8808();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v11 = a3[6];
  v12 = (char *)(a1 + v11);
  v13 = (char *)(a2 + v11);
  v14 = type metadata accessor for AppExtensionHostView.Configuration(0);
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(qword_256248A00);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    v17 = sub_2355C849C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v12, v13, v17);
    *(_OWORD *)&v12[*(int *)(v14 + 20)] = *(_OWORD *)&v13[*(int *)(v14 + 20)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249EB8);
  *(_QWORD *)&v12[*(int *)(v18 + 28)] = *(_QWORD *)&v13[*(int *)(v18 + 28)];
  v19 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = *(_OWORD *)(v21 + 16);
  *(_OWORD *)v20 = *(_OWORD *)v21;
  *(_OWORD *)(v20 + 16) = v22;
  *(_QWORD *)(v20 + 32) = *(_QWORD *)(v21 + 32);
  v23 = a3[9];
  v24 = a1 + v23;
  v25 = a2 + v23;
  v26 = sub_2355C8520();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 32))(v24, v25, v26);
  return a1;
}

uint64_t assignWithTake for ManagedAppView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t);
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;

  v6 = *a2;
  v7 = *((_BYTE *)a2 + 8);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_23558CA44(v8, v9);
  if ((uint64_t *)a1 != a2)
  {
    v10 = a3[5];
    v11 = (void *)(a1 + v10);
    v12 = (char *)a2 + v10;
    sub_23558E470(a1 + v10, &qword_2562492F0);
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562492F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v14 = sub_2355C8808();
      (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
  }
  v15 = a3[6];
  v16 = (char *)(a1 + v15);
  v17 = (char *)a2 + v15;
  v18 = type metadata accessor for AppExtensionHostView.Configuration(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  v21 = v20(v16, 1, v18);
  v22 = v20(v17, 1, v18);
  if (!v21)
  {
    if (!v22)
    {
      v38 = sub_2355C849C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 40))(v16, v17, v38);
      v39 = *(int *)(v18 + 20);
      v40 = &v16[v39];
      v41 = &v17[v39];
      v43 = *(_QWORD *)v41;
      v42 = *((_QWORD *)v41 + 1);
      *(_QWORD *)v40 = v43;
      *((_QWORD *)v40 + 1) = v42;
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    sub_23558DF78((uint64_t)v16, type metadata accessor for AppExtensionHostView.Configuration);
    goto LABEL_10;
  }
  if (v22)
  {
LABEL_10:
    v24 = __swift_instantiateConcreteTypeFromMangledName(qword_256248A00);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    goto LABEL_11;
  }
  v23 = sub_2355C849C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v16, v17, v23);
  *(_OWORD *)&v16[*(int *)(v18 + 20)] = *(_OWORD *)&v17[*(int *)(v18 + 20)];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
LABEL_11:
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249EB8);
  *(_QWORD *)&v16[*(int *)(v25 + 28)] = *(_QWORD *)&v17[*(int *)(v25 + 28)];
  swift_release();
  v26 = a3[7];
  v27 = (_QWORD *)(a1 + v26);
  v28 = (uint64_t *)((char *)a2 + v26);
  *v27 = *v28;
  v27[1] = v28[1];
  swift_release();
  v29 = a3[8];
  v30 = a1 + v29;
  v31 = (uint64_t)a2 + v29;
  v32 = *(_OWORD *)(v31 + 16);
  *(_OWORD *)v30 = *(_OWORD *)v31;
  *(_OWORD *)(v30 + 16) = v32;
  *(_QWORD *)(v30 + 32) = *(_QWORD *)(v31 + 32);
  swift_release();
  v33 = a3[9];
  v34 = a1 + v33;
  v35 = (uint64_t)a2 + v33;
  v36 = sub_2355C8520();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 40))(v34, v35, v36);
  return a1;
}

uint64_t getEnumTagSinglePayload for ManagedAppView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2355C39E0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249EE8);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249EB8);
  v7 = *(_QWORD *)(v10 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v10;
    v9 = a3[6];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  if ((_DWORD)a2 != 2147483646)
  {
    v8 = sub_2355C8520();
    v7 = *(_QWORD *)(v8 - 8);
    v9 = a3[9];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + a3[7] + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  v12 = v11 - 1;
  if (v12 < 0)
    v12 = -1;
  return (v12 + 1);
}

uint64_t storeEnumTagSinglePayload for ManagedAppView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2355C3ACC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249EE8);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = a4[5];
  }
  else
  {
    result = __swift_instantiateConcreteTypeFromMangledName(&qword_256249EB8);
    v9 = *(_QWORD *)(result - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = result;
      v11 = a4[6];
    }
    else
    {
      if (a3 == 2147483646)
      {
        *(_QWORD *)(a1 + a4[7] + 8) = a2;
        return result;
      }
      v10 = sub_2355C8520();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = a4[9];
    }
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
}

void sub_2355C3B9C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_2355C3C5C();
  if (v0 <= 0x3F)
  {
    sub_2355C3CB0();
    if (v1 <= 0x3F)
    {
      sub_2355C8520();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_2355C3C5C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256249F58)
  {
    sub_2355C8808();
    v0 = sub_2355C8718();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256249F58);
  }
}

void sub_2355C3CB0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256249F60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_256248A00);
    v0 = sub_2355C8D6C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256249F60);
  }
}

uint64_t type metadata accessor for ConfigurationCache()
{
  return objc_opt_self();
}

unint64_t sub_2355C3D2C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25624A050;
  if (!qword_25624A050)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249EA0);
    v2[0] = sub_2355C3DB0();
    v2[1] = sub_23559867C(qword_25624A068, &qword_256249EE0, MEMORY[0x24BDEDC10]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25624A050);
  }
  return result;
}

unint64_t sub_2355C3DB0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25624A058;
  if (!qword_25624A058)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249E98);
    v2[0] = sub_2355C3E1C();
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25624A058);
  }
  return result;
}

unint64_t sub_2355C3E1C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25624A060;
  if (!qword_25624A060)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256249E90);
    v2[0] = sub_2355C2C74();
    v2[1] = sub_235598144(&qword_256248EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25624A060);
  }
  return result;
}

uint64_t *sub_2355C3EA0(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_2355C8520();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    v9 = (_OWORD *)((char *)a1 + v8);
    v10 = (_OWORD *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    v12 = a3[7];
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    v15 = *(_QWORD *)v14;
    v16 = v14[8];
    sub_23558C900(*(_QWORD *)v14, v16);
    *(_QWORD *)v13 = v15;
    v13[8] = v16;
    v17 = a3[8];
    v18 = (uint64_t *)((char *)a1 + v17);
    v19 = (uint64_t *)((char *)a2 + v17);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2562492F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v20 = sub_2355C8808();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
    }
    else
    {
      *v18 = *v19;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2355C3FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_2355C8520();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  sub_23558CA44(*(_QWORD *)(a1 + *(int *)(a2 + 28)), *(_BYTE *)(a1 + *(int *)(a2 + 28) + 8));
  v5 = a1 + *(int *)(a2 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562492F0);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v6 = sub_2355C8808();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t sub_2355C4084(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;

  v6 = sub_2355C8520();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v8 = (_OWORD *)(a1 + v7);
  v9 = (_OWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v11 = a3[7];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = *(_QWORD *)v13;
  v15 = *(_BYTE *)(v13 + 8);
  sub_23558C900(*(_QWORD *)v13, v15);
  *(_QWORD *)v12 = v14;
  *(_BYTE *)(v12 + 8) = v15;
  v16 = a3[8];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562492F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v19 = sub_2355C8808();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  }
  else
  {
    *v17 = *v18;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_2355C4194(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;

  v6 = sub_2355C8520();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v7 = a3[6];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  v10 = a3[7];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = *(_QWORD *)v12;
  v14 = *(_BYTE *)(v12 + 8);
  sub_23558C900(*(_QWORD *)v12, v14);
  v15 = *(_QWORD *)v11;
  v16 = *(_BYTE *)(v11 + 8);
  *(_QWORD *)v11 = v13;
  *(_BYTE *)(v11 + 8) = v14;
  sub_23558CA44(v15, v16);
  if (a1 != a2)
  {
    v17 = a3[8];
    v18 = (_QWORD *)(a1 + v17);
    v19 = (_QWORD *)(a2 + v17);
    sub_23558E470(a1 + v17, &qword_2562492F0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2562492F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v20 = sub_2355C8808();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
    }
    else
    {
      *v18 = *v19;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2355C42E4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = sub_2355C8520();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v8 = (_OWORD *)(a1 + v7);
  v9 = (_OWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v11 = a3[7];
  v12 = a3[8];
  v13 = a1 + v11;
  v14 = a2 + v11;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
  v15 = (void *)(a1 + v12);
  v16 = (const void *)(a2 + v12);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562492F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = sub_2355C8808();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v15, v16, v18);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  return a1;
}

uint64_t sub_2355C43E0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  void *v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = sub_2355C8520();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v8 = (_OWORD *)(a1 + v7);
  v9 = (_OWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v11 = a3[7];
  v12 = a1 + v11;
  v13 = (uint64_t *)(a2 + v11);
  v14 = *v13;
  LOBYTE(v13) = *((_BYTE *)v13 + 8);
  v15 = *(_QWORD *)v12;
  v16 = *(_BYTE *)(v12 + 8);
  *(_QWORD *)v12 = v14;
  *(_BYTE *)(v12 + 8) = (_BYTE)v13;
  sub_23558CA44(v15, v16);
  if (a1 != a2)
  {
    v17 = a3[8];
    v18 = (void *)(a1 + v17);
    v19 = (const void *)(a2 + v17);
    sub_23558E470(a1 + v17, &qword_2562492F0);
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562492F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v21 = sub_2355C8808();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v18, v19, v21);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_2355C4504()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2355C4510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;
  uint64_t v10;

  v6 = sub_2355C8520();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  if ((_DWORD)a2 == 254)
  {
    v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 28) + 8);
    if (v9 > 1)
      return (v9 ^ 0xFF) + 1;
    else
      return 0;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249EE8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v10);
  }
}

uint64_t sub_2355C45B8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2355C45C4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = sub_2355C8520();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 254)
    {
      *(_BYTE *)(a1 + *(int *)(a4 + 28) + 8) = -(char)a2;
      return result;
    }
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249EE8);
    v12 = a1 + *(int *)(a4 + 32);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_2355C466C()
{
  unint64_t v0;
  unint64_t v1;

  sub_2355C8520();
  if (v0 <= 0x3F)
  {
    sub_2355C3C5C();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t sub_2355C4710()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_2355C4720(uint64_t *a1)
{
  sub_235597D54(*a1, a1[1], a1[2], a1[3]);
  return a1;
}

uint64_t sub_2355C4750(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t *sub_2355C4778(uint64_t *a1)
{
  sub_235597D54(*a1, a1[1], a1[2], a1[3]);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_2355C47E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for MaskView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = sub_2355C8520();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_23558CA44(*(_QWORD *)(v3 + *(int *)(v1 + 28)), *(_BYTE *)(v3 + *(int *)(v1 + 28) + 8));
  v5 = v3 + *(int *)(v1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562492F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_2355C8808();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_2355C48B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

double sub_2355C48FC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  double result;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MaskView(0) - 8) + 80);
  *(_QWORD *)&result = sub_2355C1E38(v1 + ((v3 + 16) & (unint64_t)~v3), a1).n128_u64[0];
  return result;
}

unint64_t sub_2355C4948()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25624A120;
  if (!qword_25624A120)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25624A118);
    v2[0] = MEMORY[0x24BDF3E20];
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25624A120);
  }
  return result;
}

uint64_t sub_2355C49AC(uint64_t result)
{
  *(_BYTE *)(result + 129) = 1;
  return result;
}

unint64_t sub_2355C49B8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25624A140;
  if (!qword_25624A140)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25624A130);
    v2[0] = sub_23559867C(&qword_25624A148, &qword_25624A150, MEMORY[0x24BDF4750]);
    v2[1] = v2[0];
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25624A140);
  }
  return result;
}

unint64_t sub_2355C4A34()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25624A158;
  if (!qword_25624A158)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25624A138);
    v2[0] = sub_2355C4948();
    v2[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25624A158);
  }
  return result;
}

uint64_t sub_2355C4AA0(uint64_t result)
{
  *(_BYTE *)(result + 130) = 1;
  return result;
}

unint64_t sub_2355C4AAC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25624A170;
  if (!qword_25624A170)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25624A168);
    v2[0] = sub_2355C49B8();
    v2[1] = sub_2355C4A34();
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25624A170);
  }
  return result;
}

uint64_t sub_2355C4B18(uint64_t result)
{
  *(_BYTE *)(result + 128) = 1;
  return result;
}

uint64_t sub_2355C4B24(uint64_t result)
{
  *(_BYTE *)(result + 129) = 0;
  return result;
}

uint64_t sub_2355C4B2C(uint64_t result)
{
  *(_BYTE *)(result + 128) = 0;
  return result;
}

uint64_t sub_2355C4B34(uint64_t result)
{
  *(_BYTE *)(result + 130) = 0;
  return result;
}

uint64_t sub_2355C4B3C()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2355C4B60(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23558E1F8;
  return sub_2355C1538(a1);
}

uint64_t sub_2355C4BC4()
{
  return sub_23559867C(&qword_25624A1C0, qword_25624A1C8, MEMORY[0x24BDEC6F8]);
}

uint64_t sub_2355C4BF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

uint64_t sub_2355C4C0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = sub_2355C89B8();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_2355C89C4();
}

uint64_t sub_2355C4CD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v5 = sub_2355C89B8();
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_2355C89C4();
}

uint64_t sub_2355C4D94@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_2355B5F18();
  result = sub_2355C891C();
  *a1 = v3;
  return result;
}

uint64_t sub_2355C4DE0()
{
  sub_2355B5F18();
  return sub_2355C8928();
}

uint64_t sub_2355C4E28@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  char v4;

  v3 = *(_QWORD *)v1;
  v4 = *(_BYTE *)(v1 + 8);
  sub_23558C900(v3, v4);
  sub_23559D63C(v3, v4, a1);
  return sub_23558CA44(v3, v4);
}

uint64_t ManagedContentView.init(primaryLabel:secondaryLabel:tertiaryLabel:quaternaryLabel:offerState:offerAction:icon:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, unsigned __int8 a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void (*a19)(uint64_t), uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  __n128 v59;
  __int128 v61;
  __n128 v62;
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
  uint64_t (*v79)(void);
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90[2];
  char v91;

  v71 = a6;
  v70 = a5;
  v75 = a4;
  LODWORD(v74) = a3;
  v73 = a2;
  v72 = a1;
  v77 = a12;
  v78 = a13;
  v67 = a11;
  LODWORD(v64) = a10;
  v66 = a9;
  v65 = a8;
  v76 = a15;
  MEMORY[0x24BDAC7A8](a1);
  v24 = (char *)&v63 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for ManagedAppCellContext(255, a21, a22, v25);
  v27 = sub_2355C9114();
  v88 = *(_QWORD *)(v27 - 8);
  v89 = v27;
  MEMORY[0x24BDAC7A8](v27);
  v84 = (uint64_t)&v63 - v28;
  v29 = *(_QWORD *)a16;
  v81 = *(_QWORD *)(a16 + 8);
  v82 = v29;
  v30 = *(_BYTE *)(a16 + 16);
  *(_QWORD *)a7 = swift_getKeyPath();
  *(_BYTE *)(a7 + 8) = 0;
  v86 = a22;
  v87 = a21;
  v32 = a7 + *(int *)(type metadata accessor for ManagedContentView(0, a21, a22, v31) + 36);
  v79 = *(uint64_t (**)(void))(*(_QWORD *)(v26 - 8) + 56);
  v80 = v32;
  v85 = v26;
  v33 = v79();
  v83 = v24;
  a19(v33);
  v34 = sub_2355C8BC8();
  v74 = v35;
  v75 = v34;
  LODWORD(v72) = v36;
  v73 = v37;
  sub_2355C894C();
  v38 = sub_2355C8958();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v38 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v71 = 0;
    v70 = 0;
    v69 = 0;
    v68 = 0;
  }
  else
  {
    v71 = sub_2355C8BC8();
    v70 = v39;
    v68 = v40;
    v69 = v41 & 1;
  }
  sub_2355C894C();
  v42 = sub_2355C8958();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v42 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v67 = 0;
    v66 = 0;
    v64 = 0;
    v65 = 0;
  }
  else
  {
    v67 = sub_2355C8BC8();
    v66 = v43;
    v65 = v44;
    v64 = v45 & 1;
  }
  sub_2355C894C();
  v46 = sub_2355C8958();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v46 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
  }
  else
  {
    v47 = sub_2355C8BC8();
    v48 = v51;
    v50 = v52;
    v49 = v53 & 1;
  }
  v55 = v81;
  v54 = v82;
  v90[0] = v82;
  v90[1] = v81;
  v91 = v30;
  v56 = swift_allocObject();
  *(_QWORD *)(v56 + 16) = a17;
  *(_QWORD *)(v56 + 24) = a18;
  *(_QWORD *)(v56 + 32) = v54;
  *(_QWORD *)(v56 + 40) = v55;
  v57 = v72 & 1;
  *(_BYTE *)(v56 + 48) = v30;
  v62.n128_u64[0] = v47;
  v62.n128_u64[1] = v48;
  *((_QWORD *)&v61 + 1) = v66;
  *(_QWORD *)&v61 = v67;
  v58 = v84;
  v59 = sub_2355BF67C((uint64_t)v83, v75, v74, v57, v73, v71, v70, v69, v84, v68, v61, v64, v65, v62, v49, v50, v90, (uint64_t)sub_2355C545C, v56,
          v87,
          v86);
  ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t, __n128))v79)(v58, 0, 1, v85, v59);
  sub_235591504(v54, v55, v30);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v88 + 40))(v80, v58, v89);
}

uint64_t type metadata accessor for ManagedContentView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ManagedContentView);
}

uint64_t ManagedContentView.init(primaryLabel:secondaryLabel:tertiaryLabel:quaternaryLabel:offerState:offerAction:icon:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X2>, _QWORD *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void (*a8)(uint64_t)@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v17;
  char *v18;
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
  uint64_t (*v30)(void);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __n128 v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v54;
  __n128 v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t (*v65)(void);
  char *v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84[2];
  char v85;

  v74 = a6;
  v75 = a7;
  v77 = a3;
  v82 = a9;
  MEMORY[0x24BDAC7A8](a1);
  v18 = (char *)&v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for ManagedAppCellContext(255, a11, a12, v19);
  v21 = sub_2355C9114();
  v78 = *(_QWORD *)(v21 - 8);
  v79 = v21;
  MEMORY[0x24BDAC7A8](v21);
  v76 = (uint64_t)&v57 - v22;
  v72 = a12;
  v73 = a11;
  v24 = type metadata accessor for ManagedContentView(0, a11, a12, v23);
  v80 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v57 - v25;
  v71 = *(_QWORD *)a5;
  v69 = *(_QWORD *)(a5 + 8);
  v67 = *(unsigned __int8 *)(a5 + 16);
  *(_QWORD *)v26 = swift_getKeyPath();
  v26[8] = 0;
  v81 = v24;
  v27 = v20;
  v28 = (uint64_t)v18;
  v29 = (uint64_t)a2;
  v30 = *(uint64_t (**)(void))(*(_QWORD *)(v27 - 8) + 56);
  v66 = &v26[*(int *)(v24 + 36)];
  v68 = v27;
  v65 = v30;
  v31 = v30();
  v70 = v28;
  a8(v31);
  v32 = a1[3];
  v83 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v32);
  v64 = sub_2355C9228();
  v63 = v33;
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  v34 = sub_2355C9048();
  v35 = 0;
  v36 = 0;
  v37 = 0;
  if ((v34 & 1) == 0)
  {
    __swift_project_boxed_opaque_existential_1(a2, a2[3]);
    v35 = sub_2355C9228();
    v37 = MEMORY[0x24BEE4AF8];
  }
  v60 = v37;
  v61 = v36;
  v62 = v35;
  v38 = v77;
  __swift_project_boxed_opaque_existential_1(v77, v77[3]);
  if ((sub_2355C9048() & 1) != 0)
  {
    v59 = 0;
    v58 = 0;
    v57 = 0;
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v38, v38[3]);
    v59 = sub_2355C9228();
    v58 = v39;
    v57 = MEMORY[0x24BEE4AF8];
  }
  __swift_project_boxed_opaque_existential_1(a4, a4[3]);
  if ((sub_2355C9048() & 1) != 0)
  {
    v40 = 0;
    v41 = 0;
    v42 = 0;
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(a4, a4[3]);
    v40 = sub_2355C9228();
    v41 = v43;
    v42 = MEMORY[0x24BEE4AF8];
  }
  v44 = v71;
  v45 = v69;
  v84[0] = v71;
  v84[1] = v69;
  v46 = v67;
  v85 = v67;
  v47 = swift_allocObject();
  v48 = v75;
  *(_QWORD *)(v47 + 16) = v74;
  *(_QWORD *)(v47 + 24) = v48;
  *(_QWORD *)(v47 + 32) = v44;
  *(_QWORD *)(v47 + 40) = v45;
  *(_BYTE *)(v47 + 48) = v46;
  v56 = v42;
  v55.n128_u64[0] = v40;
  v55.n128_u64[1] = v41;
  *((_QWORD *)&v54 + 1) = v58;
  *(_QWORD *)&v54 = v59;
  v49 = v76;
  v50 = sub_2355BF67C(v70, v64, v63, 0, MEMORY[0x24BEE4AF8], v62, v61, 0, v76, v60, v54, 0, v57, v55, 0, v56, v84, (uint64_t)sub_2355C545C, v47,
          v73,
          v72);
  ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t, __n128))v65)(v49, 0, 1, v68, v50);
  sub_235591504(v44, v45, v46);
  (*(void (**)(char *, uint64_t, uint64_t))(v78 + 40))(v66, v49, v79);
  v52 = v80;
  v51 = v81;
  (*(void (**)(uint64_t, char *, uint64_t))(v80 + 16))(v82, v26, v81);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v38);
  __swift_destroy_boxed_opaque_existential_0(v29);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v83);
  return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v26, v51);
}

uint64_t ManagedContentView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
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
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
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
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD v72[28];
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unsigned __int8 v81;
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[3];

  v76 = a3;
  v5 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v6 = type metadata accessor for HeaderManagedAppCell(0, v5, v4, a2);
  v72[7] = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v72[8] = (char *)v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v72[14] = (char *)v72 - v9;
  v11 = type metadata accessor for DefaultManagedAppCell(255, v5, v4, v10);
  v73 = v6;
  v12 = sub_2355C89D0();
  v72[16] = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v72[15] = (char *)v72 - v14;
  v72[12] = *(_QWORD *)(v11 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v72[13] = (char *)v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v72[22] = (char *)v72 - v17;
  v19 = type metadata accessor for CompactManagedAppCell(255, v5, v4, v18);
  v80 = v11;
  v20 = sub_2355C89D0();
  v72[11] = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v72[10] = (char *)v72 - v21;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249070);
  MEMORY[0x24BDAC7A8](v22);
  v72[18] = (char *)v72 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256249068);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v72[17] = (char *)v72 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = v19;
  v72[5] = *(_QWORD *)(v19 - 8);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v72[6] = (char *)v72 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v72[9] = (char *)v72 - v29;
  v77 = v12;
  v78 = v20;
  v30 = sub_2355C89D0();
  v72[26] = *(_QWORD *)(v30 - 8);
  v31 = MEMORY[0x24BDAC7A8](v30);
  v72[25] = (char *)v72 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v31);
  v72[23] = (char *)v72 - v33;
  v72[20] = v5;
  v72[21] = v4;
  v35 = type metadata accessor for ManagedAppCellContext(255, v5, v4, v34);
  v36 = sub_2355C9114();
  v37 = *(_QWORD *)(v36 - 8);
  v38 = MEMORY[0x24BDAC7A8](v36);
  v40 = (char *)v72 - v39;
  v41 = *(_QWORD *)(v35 - 8);
  v42 = MEMORY[0x24BDAC7A8](v38);
  v72[19] = (char *)v72 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v42);
  v45 = (char *)v72 - v44;
  v46 = sub_2355C89D0();
  v74 = *(_QWORD *)(v46 - 8);
  v75 = v46;
  MEMORY[0x24BDAC7A8](v46);
  v48 = (char *)v72 - v47;
  v72[24] = a1;
  (*(void (**)(char *, _QWORD, uint64_t))(v37 + 16))(v40, v72[27] + *(int *)(a1 + 36), v36);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v40, 1, v35) != 1)
  {
    v72[4] = v48;
    v72[0] = v30;
    (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v45, v40, v35);
    sub_2355C4E28(&v81);
    v61 = (char *)&loc_2355C5E48 + 4 * word_2355CB8D0[v81];
    v72[2] = v41;
    v72[3] = v45;
    v72[1] = v35;
    __asm { BR              X10 }
  }
  (*(void (**)(char *, uint64_t))(v37 + 8))(v40, v36);
  v49 = MEMORY[0x23B7CFBF8](&unk_2355CB4D0, v79);
  v50 = MEMORY[0x23B7CFBF8](&unk_2355CA050, v80);
  v88[0] = v49;
  v88[1] = v50;
  v51 = MEMORY[0x24BDEF3E0];
  v52 = v78;
  v53 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v78, v88);
  v54 = v73;
  v55 = MEMORY[0x23B7CFBF8](&unk_2355CAF70, v73);
  v87[0] = v50;
  v87[1] = v55;
  v56 = v77;
  v57 = MEMORY[0x23B7CFBF8](v51, v77, v87);
  v86[0] = v53;
  v86[1] = v57;
  v58 = MEMORY[0x23B7CFBF8](v51, v30, v86);
  sub_2355C4CD0(v58, v30, MEMORY[0x24BDF5158]);
  v59 = v76;
  v60 = v80;
  v62 = MEMORY[0x23B7CFBF8](&unk_2355CB4D0, v79);
  v63 = MEMORY[0x23B7CFBF8](&unk_2355CA050, v60);
  v85[0] = v62;
  v85[1] = v63;
  v64 = MEMORY[0x24BDEF3E0];
  v65 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v52, v85);
  v66 = MEMORY[0x23B7CFBF8](&unk_2355CAF70, v54);
  v84[0] = v63;
  v84[1] = v66;
  v67 = MEMORY[0x23B7CFBF8](v64, v56, v84);
  v83[0] = v65;
  v83[1] = v67;
  v82[0] = MEMORY[0x23B7CFBF8](v64, v30, v83);
  v82[1] = MEMORY[0x24BDF5138];
  v68 = v64;
  v69 = v75;
  MEMORY[0x23B7CFBF8](v68, v75, v82);
  v70 = v74;
  (*(void (**)(uint64_t, char *, uint64_t))(v74 + 16))(v59, v48, v69);
  return (*(uint64_t (**)(char *, uint64_t))(v70 + 8))(v48, v69);
}

uint64_t View.managedContentStyle(_:)()
{
  swift_getKeyPath();
  sub_2355C8C10();
  return swift_release();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_release();
  sub_23558A9F8(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_BYTE *)(v0 + 48));
  return swift_deallocObject();
}

uint64_t sub_2355C6774()
{
  uint64_t v0;
  uint64_t (*v1)(__int128 *);
  char v2;
  __int128 v4;
  char v5;

  v1 = *(uint64_t (**)(__int128 *))(v0 + 16);
  v2 = *(_BYTE *)(v0 + 48);
  v4 = *(_OWORD *)(v0 + 32);
  v5 = v2;
  return v1(&v4);
}

uint64_t sub_2355C67B4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_2355B5F18();
  result = sub_2355C891C();
  *a1 = v3;
  return result;
}

uint64_t sub_2355C6800()
{
  sub_2355B5F18();
  return sub_2355C8928();
}

uint64_t sub_2355C6848()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2355C687C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v5;

  type metadata accessor for ManagedAppCellContext(255, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a4);
  result = sub_2355C9114();
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2355C6900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  const void *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  __int128 v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  __int128 v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  __int128 v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  v8 = v7 & 0xF8 | 7;
  v9 = ~v8;
  v10 = *(_QWORD *)(v6 + 64) + 7;
  if ((v7 & 0x1000F8) != 0
    || (((((((((v10 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
       + 63) & 0xFFFFFFFFFFFFFFF8)
     + 16
     + (((v7 & 0xF8) + 16) & ~v8) > 0x18)
  {
    v12 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = v12 + ((v8 + 16) & v9);
LABEL_23:
    swift_retain();
    return a1;
  }
  v13 = *(unsigned int *)(v6 + 84);
  v14 = *(_QWORD *)a2;
  v15 = *(_BYTE *)(a2 + 8);
  sub_23558C900(*(_QWORD *)a2, v15);
  *(_QWORD *)a1 = v14;
  *(_BYTE *)(a1 + 8) = v15;
  v16 = (const void *)((a2 + 16) & v9);
  if (v13 < 0x7FFFFFFF)
  {
    v17 = *(_QWORD *)((((unint64_t)v16 + v10) & 0xFFFFFFFFFFFFF8) + 0x18);
    if (v17 >= 0xFFFFFFFF)
      LODWORD(v17) = -1;
    if ((_DWORD)v17 != -1)
      goto LABEL_9;
    goto LABEL_13;
  }
  if (!(*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(v16, v13, v5))
  {
LABEL_13:
    (*(void (**)(uint64_t, const void *, uint64_t))(v6 + 16))((a1 + 16) & v9, v16, v5);
    v18 = (v10 + ((a1 + 16) & v9)) & 0xFFFFFFFFFFFFFFF8;
    v19 = ((unint64_t)v16 + v10) & 0xFFFFFFFFFFFFFFF8;
    v20 = *(_QWORD *)v19;
    v21 = *(_QWORD *)(v19 + 8);
    v22 = *(_BYTE *)(v19 + 16);
    sub_2355914F4(*(_QWORD *)v19, v21, v22);
    *(_QWORD *)v18 = v20;
    *(_QWORD *)(v18 + 8) = v21;
    *(_BYTE *)(v18 + 16) = v22;
    *(_QWORD *)(v18 + 24) = *(_QWORD *)(v19 + 24);
    v23 = (v18 + 39) & 0xFFFFFFFFFFFFFFF8;
    v24 = (v19 + 39) & 0xFFFFFFFFFFFFFFF8;
    v25 = *(_QWORD *)(v24 + 24);
    swift_bridgeObjectRetain();
    if (v25 < 0xFFFFFFFF)
    {
      v29 = *(_OWORD *)(v24 + 16);
      *(_OWORD *)v23 = *(_OWORD *)v24;
      *(_OWORD *)(v23 + 16) = v29;
    }
    else
    {
      v26 = *(_QWORD *)v24;
      v27 = *(_QWORD *)(v24 + 8);
      v28 = *(_BYTE *)(v24 + 16);
      sub_2355914F4(*(_QWORD *)v24, v27, v28);
      *(_QWORD *)v23 = v26;
      *(_QWORD *)(v23 + 8) = v27;
      *(_BYTE *)(v23 + 16) = v28;
      *(_QWORD *)(v23 + 24) = *(_QWORD *)(v24 + 24);
      swift_bridgeObjectRetain();
    }
    v30 = (v23 + 39) & 0xFFFFFFFFFFFFFFF8;
    v31 = (v24 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)(v31 + 24) < 0xFFFFFFFFuLL)
    {
      v35 = *(_OWORD *)(v31 + 16);
      *(_OWORD *)v30 = *(_OWORD *)v31;
      *(_OWORD *)(v30 + 16) = v35;
    }
    else
    {
      v32 = *(_QWORD *)v31;
      v33 = *(_QWORD *)(v31 + 8);
      v34 = *(_BYTE *)(v31 + 16);
      sub_2355914F4(*(_QWORD *)v31, v33, v34);
      *(_QWORD *)v30 = v32;
      *(_QWORD *)(v30 + 8) = v33;
      *(_BYTE *)(v30 + 16) = v34;
      *(_QWORD *)(v30 + 24) = *(_QWORD *)(v31 + 24);
      swift_bridgeObjectRetain();
    }
    v36 = (v30 + 39) & 0xFFFFFFFFFFFFFFF8;
    v37 = (v31 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)(v37 + 24) < 0xFFFFFFFFuLL)
    {
      v41 = *(_OWORD *)(v37 + 16);
      *(_OWORD *)v36 = *(_OWORD *)v37;
      *(_OWORD *)(v36 + 16) = v41;
    }
    else
    {
      v38 = *(_QWORD *)v37;
      v39 = *(_QWORD *)(v37 + 8);
      v40 = *(_BYTE *)(v37 + 16);
      sub_2355914F4(*(_QWORD *)v37, v39, v40);
      *(_QWORD *)v36 = v38;
      *(_QWORD *)(v36 + 8) = v39;
      *(_BYTE *)(v36 + 16) = v40;
      *(_QWORD *)(v36 + 24) = *(_QWORD *)(v37 + 24);
      swift_bridgeObjectRetain();
    }
    v42 = (v36 + 39) & 0xFFFFFFFFFFFFFFF8;
    v43 = (v37 + 39) & 0xFFFFFFFFFFFFFFF8;
    v44 = *(_QWORD *)v43;
    v45 = *(_QWORD *)(v43 + 8);
    v46 = *(_BYTE *)(v43 + 16);
    sub_235591504(*(_QWORD *)v43, v45, v46);
    *(_QWORD *)v42 = v44;
    *(_QWORD *)(v42 + 8) = v45;
    *(_BYTE *)(v42 + 16) = v46;
    v47 = (_QWORD *)((v36 + 63) & 0xFFFFFFFFFFFFFFF8);
    v48 = (_QWORD *)((v37 + 63) & 0xFFFFFFFFFFFFFFF8);
    v49 = v48[1];
    *v47 = *v48;
    v47[1] = v49;
    goto LABEL_23;
  }
LABEL_9:
  memcpy((void *)((a1 + 16) & v9), v16, (((((((((v10 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)+ 63) & 0xFFFFFFFFFFFFFFF8)+ 16);
  return a1;
}

uint64_t sub_2355C6BF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  sub_23558CA44(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80) & 0xF8 | 7;
  v7 = (a1 + v6 + 9) & ~v6;
  v8 = *(_QWORD *)(v5 + 64);
  if (*(_DWORD *)(v5 + 84) >= 0x7FFFFFFFu)
  {
    result = (*(uint64_t (**)(uint64_t))(v5 + 48))(v7);
    if ((_DWORD)result)
      return result;
    goto LABEL_7;
  }
  v10 = *(_QWORD *)(((v8 + v7 + 7) & 0xFFFFFFFFFFFFF8) + 0x18);
  if (v10 >= 0xFFFFFFFF)
    LODWORD(v10) = -1;
  result = (v10 + 1);
  if ((_DWORD)v10 == -1)
  {
LABEL_7:
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v4);
    v11 = (v8 + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
    sub_235591958(*(_QWORD *)v11, *(_QWORD *)(v11 + 8), *(_BYTE *)(v11 + 16));
    swift_bridgeObjectRelease();
    v12 = (v11 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)(v12 + 24) >= 0xFFFFFFFFuLL)
    {
      sub_235591958(*(_QWORD *)v12, *(_QWORD *)(v12 + 8), *(_BYTE *)(v12 + 16));
      swift_bridgeObjectRelease();
    }
    v13 = (v12 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)(v13 + 24) >= 0xFFFFFFFFuLL)
    {
      sub_235591958(*(_QWORD *)v13, *(_QWORD *)(v13 + 8), *(_BYTE *)(v13 + 16));
      swift_bridgeObjectRelease();
    }
    v14 = (v13 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)(v14 + 24) >= 0xFFFFFFFFuLL)
    {
      sub_235591958(*(_QWORD *)v14, *(_QWORD *)(v14 + 8), *(_BYTE *)(v14 + 16));
      swift_bridgeObjectRelease();
    }
    sub_23558A9F8(*(_QWORD *)((v14 + 39) & 0xFFFFFFFFFFFFFFF8), *(_QWORD *)(((v14 + 39) & 0xFFFFFFFFFFFFFFF8) + 8), *(_BYTE *)(((v14 + 39) & 0xFFFFFFFFFFFFFFF8) + 16));
    return swift_release();
  }
  return result;
}

uint64_t sub_2355C6D70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  const void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  __int128 v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  __int128 v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  __int128 v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  _QWORD *v46;
  _QWORD *v47;
  uint64_t v48;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_23558C900(*(_QWORD *)a2, v7);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  v8 = *(_QWORD *)(a3 + 16);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_DWORD *)(v9 + 80) & 0xF8;
  v11 = v10 + 16;
  v12 = ~v10 & 0xFFFFFFFFFFFFFFF8;
  v13 = (void *)((v11 + a1) & v12);
  v14 = (const void *)((v11 + a2) & v12);
  v15 = *(_QWORD *)(v9 + 64) + 7;
  if (*(_DWORD *)(v9 + 84) < 0x7FFFFFFFu)
  {
    v16 = *(_QWORD *)((((unint64_t)v14 + v15) & 0xFFFFFFFFFFFFF8) + 0x18);
    if (v16 >= 0xFFFFFFFF)
      LODWORD(v16) = -1;
    if ((_DWORD)v16 != -1)
      goto LABEL_3;
  }
  else if ((*(unsigned int (**)(const void *))(v9 + 48))(v14))
  {
LABEL_3:
    memcpy(v13, v14, (((((((((v15 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)+ 63) & 0xFFFFFFFFFFFFFFF8)+ 16);
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(v9 + 16))(v13, v14, v8);
  v17 = ((unint64_t)v13 + v15) & 0xFFFFFFFFFFFFFFF8;
  v18 = ((unint64_t)v14 + v15) & 0xFFFFFFFFFFFFFFF8;
  v19 = *(_QWORD *)v18;
  v20 = *(_QWORD *)(v18 + 8);
  v21 = *(_BYTE *)(v18 + 16);
  sub_2355914F4(*(_QWORD *)v18, v20, v21);
  *(_QWORD *)v17 = v19;
  *(_QWORD *)(v17 + 8) = v20;
  *(_BYTE *)(v17 + 16) = v21;
  *(_QWORD *)(v17 + 24) = *(_QWORD *)(v18 + 24);
  v22 = (v17 + 39) & 0xFFFFFFFFFFFFFFF8;
  v23 = (v18 + 39) & 0xFFFFFFFFFFFFFFF8;
  v24 = *(_QWORD *)(v23 + 24);
  swift_bridgeObjectRetain();
  if (v24 < 0xFFFFFFFF)
  {
    v28 = *(_OWORD *)(v23 + 16);
    *(_OWORD *)v22 = *(_OWORD *)v23;
    *(_OWORD *)(v22 + 16) = v28;
  }
  else
  {
    v25 = *(_QWORD *)v23;
    v26 = *(_QWORD *)(v23 + 8);
    v27 = *(_BYTE *)(v23 + 16);
    sub_2355914F4(*(_QWORD *)v23, v26, v27);
    *(_QWORD *)v22 = v25;
    *(_QWORD *)(v22 + 8) = v26;
    *(_BYTE *)(v22 + 16) = v27;
    *(_QWORD *)(v22 + 24) = *(_QWORD *)(v23 + 24);
    swift_bridgeObjectRetain();
  }
  v29 = (v22 + 39) & 0xFFFFFFFFFFFFFFF8;
  v30 = (v23 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v30 + 24) < 0xFFFFFFFFuLL)
  {
    v34 = *(_OWORD *)(v30 + 16);
    *(_OWORD *)v29 = *(_OWORD *)v30;
    *(_OWORD *)(v29 + 16) = v34;
  }
  else
  {
    v31 = *(_QWORD *)v30;
    v32 = *(_QWORD *)(v30 + 8);
    v33 = *(_BYTE *)(v30 + 16);
    sub_2355914F4(*(_QWORD *)v30, v32, v33);
    *(_QWORD *)v29 = v31;
    *(_QWORD *)(v29 + 8) = v32;
    *(_BYTE *)(v29 + 16) = v33;
    *(_QWORD *)(v29 + 24) = *(_QWORD *)(v30 + 24);
    swift_bridgeObjectRetain();
  }
  v35 = (v29 + 39) & 0xFFFFFFFFFFFFFFF8;
  v36 = (v30 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v36 + 24) < 0xFFFFFFFFuLL)
  {
    v40 = *(_OWORD *)(v36 + 16);
    *(_OWORD *)v35 = *(_OWORD *)v36;
    *(_OWORD *)(v35 + 16) = v40;
  }
  else
  {
    v37 = *(_QWORD *)v36;
    v38 = *(_QWORD *)(v36 + 8);
    v39 = *(_BYTE *)(v36 + 16);
    sub_2355914F4(*(_QWORD *)v36, v38, v39);
    *(_QWORD *)v35 = v37;
    *(_QWORD *)(v35 + 8) = v38;
    *(_BYTE *)(v35 + 16) = v39;
    *(_QWORD *)(v35 + 24) = *(_QWORD *)(v36 + 24);
    swift_bridgeObjectRetain();
  }
  v41 = (v35 + 39) & 0xFFFFFFFFFFFFFFF8;
  v42 = (v36 + 39) & 0xFFFFFFFFFFFFFFF8;
  v43 = *(_QWORD *)v42;
  v44 = *(_QWORD *)(v42 + 8);
  v45 = *(_BYTE *)(v42 + 16);
  sub_235591504(*(_QWORD *)v42, v44, v45);
  *(_QWORD *)v41 = v43;
  *(_QWORD *)(v41 + 8) = v44;
  *(_BYTE *)(v41 + 16) = v45;
  v46 = (_QWORD *)((v35 + 63) & 0xFFFFFFFFFFFFFFF8);
  v47 = (_QWORD *)((v36 + 63) & 0xFFFFFFFFFFFFFFF8);
  v48 = v47[1];
  *v46 = *v47;
  v46[1] = v48;
  swift_retain();
  return a1;
}

uint64_t sub_2355C701C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t (*v20)(void *, uint64_t, uint64_t);
  int v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  __int128 v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  __int128 v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  __int128 v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  _QWORD *v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  __int128 v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  __int128 v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char v98;
  uint64_t v99;
  uint64_t v100;
  char v101;
  uint64_t v102;
  uint64_t v103;
  char v104;
  __int128 v105;
  unint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char v110;
  uint64_t v111;
  uint64_t v112;
  char v113;
  _QWORD *v114;
  _QWORD *v115;
  uint64_t v116;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_23558C900(*(_QWORD *)a2, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_23558CA44(v8, v9);
  v10 = *(_QWORD *)(a3 + 16);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int *)(v11 + 84);
  v13 = *(_DWORD *)(v11 + 80) & 0xF8;
  v14 = v13 + 16;
  v15 = v13 + 16 + a1;
  v16 = ~v13 & 0xFFFFFFFFFFFFFFF8;
  v17 = (void *)(v15 & v16);
  v18 = (void *)((v14 + a2) & v16);
  v19 = *(_QWORD *)(v11 + 64) + 7;
  if (v12 >= 0x7FFFFFFF)
  {
    v20 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
    v21 = v20(v17, *(unsigned int *)(v11 + 84), v10);
    v22 = v20(v18, v12, v10);
    if (v21)
      goto LABEL_3;
LABEL_9:
    v35 = ((unint64_t)v17 + v19) & 0xFFFFFFFFFFFFFFF8;
    if (v22)
    {
      (*(void (**)(void *, uint64_t))(v11 + 8))(v17, v10);
      sub_235591958(*(_QWORD *)v35, *(_QWORD *)(v35 + 8), *(_BYTE *)(v35 + 16));
      swift_bridgeObjectRelease();
      v36 = (v35 + 39) & 0xFFFFFFFFFFFFFFF8;
      if (*(_QWORD *)(v36 + 24) >= 0xFFFFFFFFuLL)
      {
        sub_235591958(*(_QWORD *)v36, *(_QWORD *)(v36 + 8), *(_BYTE *)(v36 + 16));
        swift_bridgeObjectRelease();
      }
      v37 = (v36 + 39) & 0xFFFFFFFFFFFFFFF8;
      if (*(_QWORD *)(v37 + 24) >= 0xFFFFFFFFuLL)
      {
        sub_235591958(*(_QWORD *)v37, *(_QWORD *)(v37 + 8), *(_BYTE *)(v37 + 16));
        swift_bridgeObjectRelease();
      }
      v38 = (v37 + 39) & 0xFFFFFFFFFFFFFFF8;
      if (*(_QWORD *)(v38 + 24) >= 0xFFFFFFFFuLL)
      {
        sub_235591958(*(_QWORD *)v38, *(_QWORD *)(v38 + 8), *(_BYTE *)(v38 + 16));
        swift_bridgeObjectRelease();
      }
      sub_23558A9F8(*(_QWORD *)((v38 + 39) & 0xFFFFFFFFFFFFFFF8), *(_QWORD *)(((v38 + 39) & 0xFFFFFFFFFFFFFFF8) + 8), *(_BYTE *)(((v38 + 39) & 0xFFFFFFFFFFFFFFF8) + 16));
      swift_release();
      goto LABEL_17;
    }
    (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v17, v18, v10);
    v39 = ((unint64_t)v18 + v19) & 0xFFFFFFFFFFFFFFF8;
    v40 = *(_QWORD *)v39;
    v41 = *(_QWORD *)(v39 + 8);
    v42 = *(_BYTE *)(v39 + 16);
    sub_2355914F4(*(_QWORD *)v39, v41, v42);
    v43 = *(_QWORD *)v35;
    v44 = *(_QWORD *)(v35 + 8);
    v45 = *(_BYTE *)(v35 + 16);
    *(_QWORD *)v35 = v40;
    *(_QWORD *)(v35 + 8) = v41;
    *(_BYTE *)(v35 + 16) = v42;
    sub_235591958(v43, v44, v45);
    *(_QWORD *)(v35 + 24) = *(_QWORD *)(v39 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v46 = (v35 + 39) & 0xFFFFFFFFFFFFFFF8;
    v47 = (v39 + 39) & 0xFFFFFFFFFFFFFFF8;
    v48 = *(_QWORD *)(v47 + 24);
    if (*(_QWORD *)(v46 + 24) < 0xFFFFFFFFuLL)
    {
      if (v48 >= 0xFFFFFFFF)
      {
        v76 = *(_QWORD *)v47;
        v77 = *(_QWORD *)(v47 + 8);
        v78 = *(_BYTE *)(v47 + 16);
        sub_2355914F4(*(_QWORD *)v47, v77, v78);
        *(_QWORD *)v46 = v76;
        *(_QWORD *)(v46 + 8) = v77;
        *(_BYTE *)(v46 + 16) = v78;
        *(_QWORD *)(v46 + 24) = *(_QWORD *)(v47 + 24);
        swift_bridgeObjectRetain();
        goto LABEL_33;
      }
    }
    else
    {
      if (v48 >= 0xFFFFFFFF)
      {
        v49 = *(_QWORD *)v47;
        v50 = *(_QWORD *)(v47 + 8);
        v51 = *(_BYTE *)(v47 + 16);
        sub_2355914F4(*(_QWORD *)v47, v50, v51);
        v52 = *(_QWORD *)v46;
        v53 = *(_QWORD *)(v46 + 8);
        v54 = *(_BYTE *)(v46 + 16);
        *(_QWORD *)v46 = v49;
        *(_QWORD *)(v46 + 8) = v50;
        *(_BYTE *)(v46 + 16) = v51;
        sub_235591958(v52, v53, v54);
        *(_QWORD *)(v46 + 24) = *(_QWORD *)(v47 + 24);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_33;
      }
      sub_235591958(*(_QWORD *)v46, *(_QWORD *)(v46 + 8), *(_BYTE *)(v46 + 16));
      swift_bridgeObjectRelease();
    }
    v79 = *(_OWORD *)(v47 + 16);
    *(_OWORD *)v46 = *(_OWORD *)v47;
    *(_OWORD *)(v46 + 16) = v79;
LABEL_33:
    v80 = (v46 + 39) & 0xFFFFFFFFFFFFFFF8;
    v81 = (v47 + 39) & 0xFFFFFFFFFFFFFFF8;
    v82 = *(_QWORD *)(v81 + 24);
    if (*(_QWORD *)(v80 + 24) < 0xFFFFFFFFuLL)
    {
      if (v82 >= 0xFFFFFFFF)
      {
        v89 = *(_QWORD *)v81;
        v90 = *(_QWORD *)(v81 + 8);
        v91 = *(_BYTE *)(v81 + 16);
        sub_2355914F4(*(_QWORD *)v81, v90, v91);
        *(_QWORD *)v80 = v89;
        *(_QWORD *)(v80 + 8) = v90;
        *(_BYTE *)(v80 + 16) = v91;
        *(_QWORD *)(v80 + 24) = *(_QWORD *)(v81 + 24);
        swift_bridgeObjectRetain();
        goto LABEL_40;
      }
    }
    else
    {
      if (v82 >= 0xFFFFFFFF)
      {
        v83 = *(_QWORD *)v81;
        v84 = *(_QWORD *)(v81 + 8);
        v85 = *(_BYTE *)(v81 + 16);
        sub_2355914F4(*(_QWORD *)v81, v84, v85);
        v86 = *(_QWORD *)v80;
        v87 = *(_QWORD *)(v80 + 8);
        v88 = *(_BYTE *)(v80 + 16);
        *(_QWORD *)v80 = v83;
        *(_QWORD *)(v80 + 8) = v84;
        *(_BYTE *)(v80 + 16) = v85;
        sub_235591958(v86, v87, v88);
        *(_QWORD *)(v80 + 24) = *(_QWORD *)(v81 + 24);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_40;
      }
      sub_235591958(*(_QWORD *)v80, *(_QWORD *)(v80 + 8), *(_BYTE *)(v80 + 16));
      swift_bridgeObjectRelease();
    }
    v92 = *(_OWORD *)(v81 + 16);
    *(_OWORD *)v80 = *(_OWORD *)v81;
    *(_OWORD *)(v80 + 16) = v92;
LABEL_40:
    v93 = (v80 + 39) & 0xFFFFFFFFFFFFFFF8;
    v94 = (v81 + 39) & 0xFFFFFFFFFFFFFFF8;
    v95 = *(_QWORD *)(v94 + 24);
    if (*(_QWORD *)(v93 + 24) < 0xFFFFFFFFuLL)
    {
      if (v95 >= 0xFFFFFFFF)
      {
        v102 = *(_QWORD *)v94;
        v103 = *(_QWORD *)(v94 + 8);
        v104 = *(_BYTE *)(v94 + 16);
        sub_2355914F4(*(_QWORD *)v94, v103, v104);
        *(_QWORD *)v93 = v102;
        *(_QWORD *)(v93 + 8) = v103;
        *(_BYTE *)(v93 + 16) = v104;
        *(_QWORD *)(v93 + 24) = *(_QWORD *)(v94 + 24);
        swift_bridgeObjectRetain();
        goto LABEL_47;
      }
    }
    else
    {
      if (v95 >= 0xFFFFFFFF)
      {
        v96 = *(_QWORD *)v94;
        v97 = *(_QWORD *)(v94 + 8);
        v98 = *(_BYTE *)(v94 + 16);
        sub_2355914F4(*(_QWORD *)v94, v97, v98);
        v99 = *(_QWORD *)v93;
        v100 = *(_QWORD *)(v93 + 8);
        v101 = *(_BYTE *)(v93 + 16);
        *(_QWORD *)v93 = v96;
        *(_QWORD *)(v93 + 8) = v97;
        *(_BYTE *)(v93 + 16) = v98;
        sub_235591958(v99, v100, v101);
        *(_QWORD *)(v93 + 24) = *(_QWORD *)(v94 + 24);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
LABEL_47:
        v106 = (v93 + 39) & 0xFFFFFFFFFFFFFFF8;
        v107 = (v94 + 39) & 0xFFFFFFFFFFFFFFF8;
        v108 = *(_QWORD *)v107;
        v109 = *(_QWORD *)(v107 + 8);
        v110 = *(_BYTE *)(v107 + 16);
        sub_235591504(*(_QWORD *)v107, v109, v110);
        v111 = *(_QWORD *)v106;
        v112 = *(_QWORD *)(v106 + 8);
        *(_QWORD *)v106 = v108;
        *(_QWORD *)(v106 + 8) = v109;
        v113 = *(_BYTE *)(v106 + 16);
        *(_BYTE *)(v106 + 16) = v110;
        sub_23558A9F8(v111, v112, v113);
        v114 = (_QWORD *)((v93 + 63) & 0xFFFFFFFFFFFFFFF8);
        v115 = (_QWORD *)((v94 + 63) & 0xFFFFFFFFFFFFFFF8);
        v116 = v115[1];
        *v114 = *v115;
        v114[1] = v116;
        swift_retain();
        swift_release();
        return a1;
      }
      sub_235591958(*(_QWORD *)v93, *(_QWORD *)(v93 + 8), *(_BYTE *)(v93 + 16));
      swift_bridgeObjectRelease();
    }
    v105 = *(_OWORD *)(v94 + 16);
    *(_OWORD *)v93 = *(_OWORD *)v94;
    *(_OWORD *)(v93 + 16) = v105;
    goto LABEL_47;
  }
  v34 = *(_QWORD *)((((unint64_t)v18 + v19) & 0xFFFFFFFFFFFFF8) + 0x18);
  if (v34 >= 0xFFFFFFFF)
    LODWORD(v34) = -1;
  v22 = v34 + 1;
  if (*(_QWORD *)((((unint64_t)v17 + v19) & 0xFFFFFFFFFFFFF8) + 0x18) >= 0xFFFFFFFFuLL)
    goto LABEL_9;
LABEL_3:
  if (v22)
  {
LABEL_17:
    memcpy(v17, v18, (((((((((v19 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)+ 63) & 0xFFFFFFFFFFFFFFF8)+ 16);
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v17, v18, v10);
  v23 = ((unint64_t)v17 + v19) & 0xFFFFFFFFFFFFFFF8;
  v24 = ((unint64_t)v18 + v19) & 0xFFFFFFFFFFFFFFF8;
  v25 = *(_QWORD *)v24;
  v26 = *(_QWORD *)(v24 + 8);
  v27 = *(_BYTE *)(v24 + 16);
  sub_2355914F4(*(_QWORD *)v24, v26, v27);
  *(_QWORD *)v23 = v25;
  *(_QWORD *)(v23 + 8) = v26;
  *(_BYTE *)(v23 + 16) = v27;
  *(_QWORD *)(v23 + 24) = *(_QWORD *)(v24 + 24);
  v28 = (v23 + 39) & 0xFFFFFFFFFFFFFFF8;
  v29 = (v24 + 39) & 0xFFFFFFFFFFFFFFF8;
  v30 = *(_QWORD *)(v29 + 24);
  swift_bridgeObjectRetain();
  if (v30 < 0xFFFFFFFF)
  {
    v55 = *(_OWORD *)(v29 + 16);
    *(_OWORD *)v28 = *(_OWORD *)v29;
    *(_OWORD *)(v28 + 16) = v55;
  }
  else
  {
    v31 = *(_QWORD *)v29;
    v32 = *(_QWORD *)(v29 + 8);
    v33 = *(_BYTE *)(v29 + 16);
    sub_2355914F4(*(_QWORD *)v29, v32, v33);
    *(_QWORD *)v28 = v31;
    *(_QWORD *)(v28 + 8) = v32;
    *(_BYTE *)(v28 + 16) = v33;
    *(_QWORD *)(v28 + 24) = *(_QWORD *)(v29 + 24);
    swift_bridgeObjectRetain();
  }
  v56 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
  v57 = (v29 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v57 + 24) < 0xFFFFFFFFuLL)
  {
    v61 = *(_OWORD *)(v57 + 16);
    *(_OWORD *)v56 = *(_OWORD *)v57;
    *(_OWORD *)(v56 + 16) = v61;
  }
  else
  {
    v58 = *(_QWORD *)v57;
    v59 = *(_QWORD *)(v57 + 8);
    v60 = *(_BYTE *)(v57 + 16);
    sub_2355914F4(*(_QWORD *)v57, v59, v60);
    *(_QWORD *)v56 = v58;
    *(_QWORD *)(v56 + 8) = v59;
    *(_BYTE *)(v56 + 16) = v60;
    *(_QWORD *)(v56 + 24) = *(_QWORD *)(v57 + 24);
    swift_bridgeObjectRetain();
  }
  v62 = (v56 + 39) & 0xFFFFFFFFFFFFFFF8;
  v63 = (v57 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v63 + 24) < 0xFFFFFFFFuLL)
  {
    v67 = *(_OWORD *)(v63 + 16);
    *(_OWORD *)v62 = *(_OWORD *)v63;
    *(_OWORD *)(v62 + 16) = v67;
  }
  else
  {
    v64 = *(_QWORD *)v63;
    v65 = *(_QWORD *)(v63 + 8);
    v66 = *(_BYTE *)(v63 + 16);
    sub_2355914F4(*(_QWORD *)v63, v65, v66);
    *(_QWORD *)v62 = v64;
    *(_QWORD *)(v62 + 8) = v65;
    *(_BYTE *)(v62 + 16) = v66;
    *(_QWORD *)(v62 + 24) = *(_QWORD *)(v63 + 24);
    swift_bridgeObjectRetain();
  }
  v68 = (v62 + 39) & 0xFFFFFFFFFFFFFFF8;
  v69 = (v63 + 39) & 0xFFFFFFFFFFFFFFF8;
  v70 = *(_QWORD *)v69;
  v71 = *(_QWORD *)(v69 + 8);
  v72 = *(_BYTE *)(v69 + 16);
  sub_235591504(*(_QWORD *)v69, v71, v72);
  *(_QWORD *)v68 = v70;
  *(_QWORD *)(v68 + 8) = v71;
  *(_BYTE *)(v68 + 16) = v72;
  v73 = (_QWORD *)((v62 + 63) & 0xFFFFFFFFFFFFFFF8);
  v74 = (_QWORD *)((v63 + 63) & 0xFFFFFFFFFFFFFFF8);
  v75 = v74[1];
  *v73 = *v74;
  v73[1] = v75;
  swift_retain();
  return a1;
}

uint64_t sub_2355C771C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  unint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  __int128 v15;
  _OWORD *v16;
  _OWORD *v17;
  __int128 v18;
  _OWORD *v19;
  _OWORD *v20;
  __int128 v21;
  _OWORD *v22;
  _OWORD *v23;
  __int128 v24;
  unint64_t v25;
  unint64_t v26;
  char v27;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80) & 0xF8;
  v7 = v6 + 16;
  v8 = ~v6 & 0xFFFFFFFFFFFFFFF8;
  v9 = (void *)((v7 + a1) & v8);
  v10 = (const void *)((v7 + a2) & v8);
  v11 = *(_QWORD *)(v5 + 64) + 7;
  if (*(_DWORD *)(v5 + 84) < 0x7FFFFFFFu)
  {
    v12 = *(_QWORD *)((((unint64_t)v10 + v11) & 0xFFFFFFFFFFFFF8) + 0x18);
    if (v12 >= 0xFFFFFFFF)
      LODWORD(v12) = -1;
    if ((_DWORD)v12 != -1)
      goto LABEL_3;
LABEL_7:
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(v9, v10, v4);
    v13 = (_OWORD *)(((unint64_t)v9 + v11) & 0xFFFFFFFFFFFFFFF8);
    v14 = (_OWORD *)(((unint64_t)v10 + v11) & 0xFFFFFFFFFFFFFFF8);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    v16 = (_OWORD *)(((unint64_t)v13 + 39) & 0xFFFFFFFFFFFFFFF8);
    v17 = (_OWORD *)(((unint64_t)v14 + 39) & 0xFFFFFFFFFFFFFFF8);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v19 = (_OWORD *)(((unint64_t)v16 + 39) & 0xFFFFFFFFFFFFFFF8);
    v20 = (_OWORD *)(((unint64_t)v17 + 39) & 0xFFFFFFFFFFFFFFF8);
    v21 = v20[1];
    *v19 = *v20;
    v19[1] = v21;
    v22 = (_OWORD *)(((unint64_t)v19 + 39) & 0xFFFFFFFFFFFFFFF8);
    v23 = (_OWORD *)(((unint64_t)v20 + 39) & 0xFFFFFFFFFFFFFFF8);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    v25 = ((unint64_t)v22 + 39) & 0xFFFFFFFFFFFFFFF8;
    v26 = ((unint64_t)v23 + 39) & 0xFFFFFFFFFFFFFFF8;
    v27 = *(_BYTE *)(v26 + 16);
    *(_OWORD *)v25 = *(_OWORD *)v26;
    *(_BYTE *)(v25 + 16) = v27;
    *(_OWORD *)(((unint64_t)v22 + 63) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v23 + 63) & 0xFFFFFFFFFFFFF8);
    return a1;
  }
  if (!(*(unsigned int (**)(const void *))(v5 + 48))(v10))
    goto LABEL_7;
LABEL_3:
  memcpy(v9, v10, (((((((((v11 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)+ 63) & 0xFFFFFFFFFFFFFFF8)+ 16);
  return a1;
}

uint64_t sub_2355C78B8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t (*v20)(void *, uint64_t, uint64_t);
  int v21;
  int v22;
  _OWORD *v23;
  _OWORD *v24;
  __int128 v25;
  _OWORD *v26;
  _OWORD *v27;
  __int128 v28;
  _OWORD *v29;
  _OWORD *v30;
  __int128 v31;
  _OWORD *v32;
  _OWORD *v33;
  __int128 v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  unint64_t v48;
  unint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  __int128 v54;
  unint64_t v55;
  unint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  __int128 v61;
  unint64_t v62;
  unint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  __int128 v68;
  unint64_t v69;
  unint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  char v74;

  v6 = *a2;
  v7 = *((_BYTE *)a2 + 8);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_23558CA44(v8, v9);
  v10 = *(_QWORD *)(a3 + 16);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int *)(v11 + 84);
  v13 = *(_DWORD *)(v11 + 80) & 0xF8;
  v14 = v13 + 16;
  v15 = v13 + 16 + a1;
  v16 = ~v13 & 0xFFFFFFFFFFFFFFF8;
  v17 = (void *)(v15 & v16);
  v18 = (void *)(((unint64_t)a2 + v14) & v16);
  v19 = *(_QWORD *)(v11 + 64) + 7;
  if (v12 >= 0x7FFFFFFF)
  {
    v20 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
    v21 = v20(v17, *(unsigned int *)(v11 + 84), v10);
    v22 = v20(v18, v12, v10);
    if (v21)
      goto LABEL_3;
LABEL_8:
    v39 = ((unint64_t)v17 + v19) & 0xFFFFFFFFFFFFFFF8;
    if (v22)
    {
      (*(void (**)(void *, uint64_t))(v11 + 8))(v17, v10);
      sub_235591958(*(_QWORD *)v39, *(_QWORD *)(v39 + 8), *(_BYTE *)(v39 + 16));
      swift_bridgeObjectRelease();
      v40 = (v39 + 39) & 0xFFFFFFFFFFFFFFF8;
      if (*(_QWORD *)(v40 + 24) >= 0xFFFFFFFFuLL)
      {
        sub_235591958(*(_QWORD *)v40, *(_QWORD *)(v40 + 8), *(_BYTE *)(v40 + 16));
        swift_bridgeObjectRelease();
      }
      v41 = (v40 + 39) & 0xFFFFFFFFFFFFFFF8;
      if (*(_QWORD *)(v41 + 24) >= 0xFFFFFFFFuLL)
      {
        sub_235591958(*(_QWORD *)v41, *(_QWORD *)(v41 + 8), *(_BYTE *)(v41 + 16));
        swift_bridgeObjectRelease();
      }
      v42 = (v41 + 39) & 0xFFFFFFFFFFFFFFF8;
      if (*(_QWORD *)(v42 + 24) >= 0xFFFFFFFFuLL)
      {
        sub_235591958(*(_QWORD *)v42, *(_QWORD *)(v42 + 8), *(_BYTE *)(v42 + 16));
        swift_bridgeObjectRelease();
      }
      sub_23558A9F8(*(_QWORD *)((v42 + 39) & 0xFFFFFFFFFFFFFFF8), *(_QWORD *)(((v42 + 39) & 0xFFFFFFFFFFFFFFF8) + 8), *(_BYTE *)(((v42 + 39) & 0xFFFFFFFFFFFFFFF8) + 16));
      swift_release();
      goto LABEL_16;
    }
    (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v17, v18, v10);
    v43 = ((unint64_t)v18 + v19) & 0xFFFFFFFFFFFFFFF8;
    v44 = *(_BYTE *)(v43 + 16);
    v45 = *(_QWORD *)v39;
    v46 = *(_QWORD *)(v39 + 8);
    v47 = *(_BYTE *)(v39 + 16);
    *(_OWORD *)v39 = *(_OWORD *)v43;
    *(_BYTE *)(v39 + 16) = v44;
    sub_235591958(v45, v46, v47);
    *(_QWORD *)(v39 + 24) = *(_QWORD *)(v43 + 24);
    swift_bridgeObjectRelease();
    v48 = (v39 + 39) & 0xFFFFFFFFFFFFFFF8;
    v49 = (v43 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)(v48 + 24) >= 0xFFFFFFFFuLL)
    {
      if (*(_QWORD *)(v49 + 24) >= 0xFFFFFFFFuLL)
      {
        v50 = *(_BYTE *)(v49 + 16);
        v51 = *(_QWORD *)v48;
        v52 = *(_QWORD *)(v48 + 8);
        v53 = *(_BYTE *)(v48 + 16);
        *(_OWORD *)v48 = *(_OWORD *)v49;
        *(_BYTE *)(v48 + 16) = v50;
        sub_235591958(v51, v52, v53);
        *(_QWORD *)(v48 + 24) = *(_QWORD *)(v49 + 24);
        swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      sub_235591958(*(_QWORD *)v48, *(_QWORD *)(v48 + 8), *(_BYTE *)(v48 + 16));
      swift_bridgeObjectRelease();
    }
    v54 = *(_OWORD *)(v49 + 16);
    *(_OWORD *)v48 = *(_OWORD *)v49;
    *(_OWORD *)(v48 + 16) = v54;
LABEL_22:
    v55 = (v48 + 39) & 0xFFFFFFFFFFFFFFF8;
    v56 = (v49 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)(v55 + 24) >= 0xFFFFFFFFuLL)
    {
      if (*(_QWORD *)(v56 + 24) >= 0xFFFFFFFFuLL)
      {
        v57 = *(_BYTE *)(v56 + 16);
        v58 = *(_QWORD *)v55;
        v59 = *(_QWORD *)(v55 + 8);
        v60 = *(_BYTE *)(v55 + 16);
        *(_OWORD *)v55 = *(_OWORD *)v56;
        *(_BYTE *)(v55 + 16) = v57;
        sub_235591958(v58, v59, v60);
        *(_QWORD *)(v55 + 24) = *(_QWORD *)(v56 + 24);
        swift_bridgeObjectRelease();
        goto LABEL_27;
      }
      sub_235591958(*(_QWORD *)v55, *(_QWORD *)(v55 + 8), *(_BYTE *)(v55 + 16));
      swift_bridgeObjectRelease();
    }
    v61 = *(_OWORD *)(v56 + 16);
    *(_OWORD *)v55 = *(_OWORD *)v56;
    *(_OWORD *)(v55 + 16) = v61;
LABEL_27:
    v62 = (v55 + 39) & 0xFFFFFFFFFFFFFFF8;
    v63 = (v56 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)(v62 + 24) >= 0xFFFFFFFFuLL)
    {
      if (*(_QWORD *)(v63 + 24) >= 0xFFFFFFFFuLL)
      {
        v64 = *(_BYTE *)(v63 + 16);
        v65 = *(_QWORD *)v62;
        v66 = *(_QWORD *)(v62 + 8);
        v67 = *(_BYTE *)(v62 + 16);
        *(_OWORD *)v62 = *(_OWORD *)v63;
        *(_BYTE *)(v62 + 16) = v64;
        sub_235591958(v65, v66, v67);
        *(_QWORD *)(v62 + 24) = *(_QWORD *)(v63 + 24);
        swift_bridgeObjectRelease();
LABEL_32:
        v69 = (v62 + 39) & 0xFFFFFFFFFFFFFFF8;
        v70 = (v63 + 39) & 0xFFFFFFFFFFFFFFF8;
        v71 = *(_BYTE *)(v70 + 16);
        v72 = *(_QWORD *)v69;
        v73 = *(_QWORD *)(v69 + 8);
        *(_OWORD *)v69 = *(_OWORD *)v70;
        v74 = *(_BYTE *)(v69 + 16);
        *(_BYTE *)(v69 + 16) = v71;
        sub_23558A9F8(v72, v73, v74);
        *(_OWORD *)((v62 + 63) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v63 + 63) & 0xFFFFFFFFFFFFF8);
        swift_release();
        return a1;
      }
      sub_235591958(*(_QWORD *)v62, *(_QWORD *)(v62 + 8), *(_BYTE *)(v62 + 16));
      swift_bridgeObjectRelease();
    }
    v68 = *(_OWORD *)(v63 + 16);
    *(_OWORD *)v62 = *(_OWORD *)v63;
    *(_OWORD *)(v62 + 16) = v68;
    goto LABEL_32;
  }
  v38 = *(_QWORD *)((((unint64_t)v18 + v19) & 0xFFFFFFFFFFFFF8) + 0x18);
  if (v38 >= 0xFFFFFFFF)
    LODWORD(v38) = -1;
  v22 = v38 + 1;
  if (*(_QWORD *)((((unint64_t)v17 + v19) & 0xFFFFFFFFFFFFF8) + 0x18) >= 0xFFFFFFFFuLL)
    goto LABEL_8;
LABEL_3:
  if (v22)
  {
LABEL_16:
    memcpy(v17, v18, (((((((((v19 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)+ 63) & 0xFFFFFFFFFFFFFFF8)+ 16);
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v17, v18, v10);
  v23 = (_OWORD *)(((unint64_t)v17 + v19) & 0xFFFFFFFFFFFFFFF8);
  v24 = (_OWORD *)(((unint64_t)v18 + v19) & 0xFFFFFFFFFFFFFFF8);
  v25 = v24[1];
  *v23 = *v24;
  v23[1] = v25;
  v26 = (_OWORD *)(((unint64_t)v23 + 39) & 0xFFFFFFFFFFFFFFF8);
  v27 = (_OWORD *)(((unint64_t)v24 + 39) & 0xFFFFFFFFFFFFFFF8);
  v28 = v27[1];
  *v26 = *v27;
  v26[1] = v28;
  v29 = (_OWORD *)(((unint64_t)v26 + 39) & 0xFFFFFFFFFFFFFFF8);
  v30 = (_OWORD *)(((unint64_t)v27 + 39) & 0xFFFFFFFFFFFFFFF8);
  v31 = v30[1];
  *v29 = *v30;
  v29[1] = v31;
  v32 = (_OWORD *)(((unint64_t)v29 + 39) & 0xFFFFFFFFFFFFFFF8);
  v33 = (_OWORD *)(((unint64_t)v30 + 39) & 0xFFFFFFFFFFFFFFF8);
  v34 = v33[1];
  *v32 = *v33;
  v32[1] = v34;
  v35 = ((unint64_t)v32 + 39) & 0xFFFFFFFFFFFFFFF8;
  v36 = ((unint64_t)v33 + 39) & 0xFFFFFFFFFFFFFFF8;
  v37 = *(_BYTE *)(v36 + 16);
  *(_OWORD *)v35 = *(_OWORD *)v36;
  *(_BYTE *)(v35 + 16) = v37;
  *(_OWORD *)(((unint64_t)v32 + 63) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v33 + 63) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_2355C7D88(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;
  int v12;
  int v13;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_DWORD *)(v4 + 80) & 0xF8;
  v8 = v7 | 7;
  v9 = *(_QWORD *)(v4 + 64) + 7;
  v10 = a2 - (v6 - 1);
  if (a2 <= v6 - 1)
    goto LABEL_19;
  v11 = ((v7 + 16) & ~v8)
      + (((((((((v9 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  v12 = v11;
  if ((_DWORD)v11)
    goto LABEL_7;
  v15 = v10 + 1;
  if (HIWORD(v15))
  {
    v13 = *(_DWORD *)((char *)a1 + v11);
    if (v13)
      goto LABEL_15;
LABEL_19:
    v17 = ((unint64_t)a1 + v8 + 9) & ~v8;
    if (v5 < 0x7FFFFFFF)
    {
      v19 = *(_QWORD *)(((v9 + v17) & 0xFFFFFFFFFFFFF8) + 0x18);
      if (v19 >= 0xFFFFFFFF)
        LODWORD(v19) = -1;
      v18 = v19 + 1;
    }
    else
    {
      v18 = (*(uint64_t (**)(uint64_t))(v4 + 48))(v17);
    }
    if (v18 >= 2)
      return v18 - 1;
    else
      return 0;
  }
  if (v15 > 0xFF)
  {
    v13 = *(unsigned __int16 *)((char *)a1 + v11);
    if (*(_WORD *)((char *)a1 + v11))
      goto LABEL_15;
    goto LABEL_19;
  }
  if (v15 < 2)
    goto LABEL_19;
LABEL_7:
  v13 = *((unsigned __int8 *)a1 + v11);
  if (!*((_BYTE *)a1 + v11))
    goto LABEL_19;
LABEL_15:
  v16 = v13 - 1;
  if ((_DWORD)v11)
  {
    v16 = 0;
    v12 = *a1;
  }
  return (v12 | v16) + v6;
}

void sub_2355C7ED0(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  _DWORD *v22;
  unsigned int v23;
  _QWORD *v24;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF)
    v8 = 0x7FFFFFFF;
  else
    v8 = *(_DWORD *)(v6 + 84);
  v9 = v8 - 1;
  v10 = *(_DWORD *)(v6 + 80) & 0xF8;
  v11 = v10 | 7;
  v12 = *(_QWORD *)(v6 + 64) + 7;
  v13 = (((((((((v12 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 63) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  v14 = (v10 + 16) & ~(v10 | 7);
  v15 = v13 + v14;
  v16 = a3 >= v8 - 1;
  v17 = a3 - (v8 - 1);
  if (v17 == 0 || !v16)
  {
    v18 = 0;
    if (v9 < a2)
    {
LABEL_10:
      v19 = a2 - v8;
      if ((_DWORD)v15)
      {
        bzero(a1, v13 + v14);
        *(_DWORD *)a1 = v19;
        LOWORD(v20) = 1;
        if (!v18)
          return;
LABEL_32:
        if (v18 == 2)
          *(_WORD *)&a1[v15] = v20;
        else
          a1[v15] = v20;
        return;
      }
LABEL_31:
      v20 = (v19 >> (8 * v15)) + 1;
      if (!v18)
        return;
      goto LABEL_32;
    }
    goto LABEL_17;
  }
  if ((_DWORD)v15)
  {
    v18 = 1;
    if (v9 < a2)
      goto LABEL_10;
    goto LABEL_17;
  }
  v21 = v17 + 1;
  if (HIWORD(v21))
  {
    if (v9 < a2)
    {
      *(_DWORD *)&a1[v15] = a2 - v8 + 1;
      return;
    }
    *(_DWORD *)&a1[v15] = 0;
    goto LABEL_19;
  }
  if (v21 < 0x100)
  {
    v18 = v21 > 1;
    if (v9 < a2)
    {
      v19 = a2 - v8;
      goto LABEL_31;
    }
LABEL_17:
    if (v18)
      a1[v15] = 0;
    goto LABEL_19;
  }
  if (v9 < a2)
  {
    v19 = a2 - v8;
    v18 = 2;
    goto LABEL_31;
  }
  *(_WORD *)&a1[v15] = 0;
LABEL_19:
  if (a2)
  {
    v22 = (_DWORD *)((unint64_t)&a1[v11 + 9] & ~v11);
    if (v9 >= a2 && a2 + 1 <= v8)
    {
      if (a2 != -1)
      {
        if (v7 < 0x7FFFFFFF)
        {
          v24 = (_QWORD *)(((unint64_t)v22 + v12) & 0xFFFFFFFFFFFFFFF8);
          if (((a2 + 1) & 0x80000000) != 0)
          {
            v24[2] = 0;
            v24[3] = 0;
            *v24 = a2 - 0x7FFFFFFF;
            v24[1] = 0;
          }
          else
          {
            v24[3] = a2;
          }
        }
        else
        {
          (*(void (**)(unint64_t, _QWORD))(v6 + 56))((unint64_t)&a1[v11 + 9] & ~v11, a2 + 1);
        }
      }
    }
    else if ((((((((((v12 & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 63) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      v23 = a2 - v8;
      bzero(v22, (((((((((v12 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)+ 63) & 0xFFFFFFFFFFFFFFF8)+ 16);
      *v22 = v23;
    }
  }
}

uint64_t sub_2355C80D0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];

  v4 = *a1;
  v5 = a1[1];
  v6 = type metadata accessor for CompactManagedAppCell(255, *a1, v5, a4);
  v8 = type metadata accessor for DefaultManagedAppCell(255, v4, v5, v7);
  v9 = sub_2355C89D0();
  v11 = type metadata accessor for HeaderManagedAppCell(255, v4, v5, v10);
  v12 = sub_2355C89D0();
  v13 = sub_2355C89D0();
  v14 = sub_2355C89D0();
  v15 = MEMORY[0x23B7CFBF8](&unk_2355CB4D0, v6);
  v16 = MEMORY[0x23B7CFBF8](&unk_2355CA050, v8);
  v23[0] = v15;
  v23[1] = v16;
  v17 = MEMORY[0x24BDEF3E0];
  v18 = MEMORY[0x23B7CFBF8](MEMORY[0x24BDEF3E0], v9, v23);
  v22[0] = v16;
  v22[1] = MEMORY[0x23B7CFBF8](&unk_2355CAF70, v11);
  v21[0] = v18;
  v21[1] = MEMORY[0x23B7CFBF8](v17, v12, v22);
  v20[0] = MEMORY[0x23B7CFBF8](v17, v13, v21);
  v20[1] = MEMORY[0x24BDF5138];
  return MEMORY[0x23B7CFBF8](v17, v14, v20);
}

uint64_t sub_2355C8238(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25624A250);
  v2 = sub_2355C8820();
  v4[0] = v1;
  v4[1] = sub_2355C8298();
  return MEMORY[0x23B7CFBF8](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_2355C8298()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25624A258;
  if (!qword_25624A258)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25624A250);
    result = MEMORY[0x23B7CFBF8](MEMORY[0x24BDF1028], v1);
    atomic_store(result, (unint64_t *)&qword_25624A258);
  }
  return result;
}

uint64_t sub_2355C82E8()
{
  sub_2355A00D8();
  return sub_2355C891C();
}

ValueMetadata *type metadata accessor for ManagedContentStyleEnvironmentKey()
{
  return &type metadata for ManagedContentStyleEnvironmentKey;
}

void sub_2355C832C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2355C8338()
{
  sub_2355A9D40();
  return sub_2355C87C0();
}

uint64_t sub_2355C8388()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_2355C8394()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_2355C83A0()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_2355C83AC()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_2355C83B8()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_2355C83C4()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_2355C83D0()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_2355C83DC()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2355C83E8()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_2355C83F4()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2355C8400()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2355C840C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2355C8418()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2355C8424()
{
  return MEMORY[0x24BDC7A48]();
}

uint64_t sub_2355C8430()
{
  return MEMORY[0x24BDC7A80]();
}

uint64_t sub_2355C843C()
{
  return MEMORY[0x24BDC7A90]();
}

uint64_t sub_2355C8448()
{
  return MEMORY[0x24BDC7AD0]();
}

uint64_t sub_2355C8454()
{
  return MEMORY[0x24BDC7AD8]();
}

uint64_t sub_2355C8460()
{
  return MEMORY[0x24BDC77F0]();
}

uint64_t sub_2355C846C()
{
  return MEMORY[0x24BDC7808]();
}

uint64_t sub_2355C8478()
{
  return MEMORY[0x24BDC7820]();
}

uint64_t sub_2355C8484()
{
  return MEMORY[0x24BDC7838]();
}

uint64_t sub_2355C8490()
{
  return MEMORY[0x24BDC7840]();
}

uint64_t sub_2355C849C()
{
  return MEMORY[0x24BDC7920]();
}

uint64_t sub_2355C84A8()
{
  return MEMORY[0x24BDDABF8]();
}

uint64_t sub_2355C84B4()
{
  return MEMORY[0x24BDDAC28]();
}

uint64_t sub_2355C84C0()
{
  return MEMORY[0x24BDDAC40]();
}

uint64_t sub_2355C84CC()
{
  return MEMORY[0x24BDDAC48]();
}

uint64_t sub_2355C84D8()
{
  return MEMORY[0x24BDDAC50]();
}

uint64_t sub_2355C84E4()
{
  return MEMORY[0x24BDDAC60]();
}

uint64_t sub_2355C84F0()
{
  return MEMORY[0x24BDDAC68]();
}

uint64_t sub_2355C84FC()
{
  return MEMORY[0x24BDDAC70]();
}

uint64_t sub_2355C8508()
{
  return MEMORY[0x24BDDAC78]();
}

uint64_t sub_2355C8514()
{
  return MEMORY[0x24BDDAC80]();
}

uint64_t sub_2355C8520()
{
  return MEMORY[0x24BDDAC88]();
}

uint64_t sub_2355C852C()
{
  return MEMORY[0x24BDDAC98]();
}

uint64_t sub_2355C8538()
{
  return MEMORY[0x24BDDACA8]();
}

uint64_t sub_2355C8544()
{
  return MEMORY[0x24BDDACB0]();
}

uint64_t sub_2355C8550()
{
  return MEMORY[0x24BDDACB8]();
}

uint64_t sub_2355C855C()
{
  return MEMORY[0x24BDDACC0]();
}

uint64_t sub_2355C8568()
{
  return MEMORY[0x24BDDACC8]();
}

uint64_t sub_2355C8574()
{
  return MEMORY[0x24BDDACD0]();
}

uint64_t sub_2355C8580()
{
  return MEMORY[0x24BDDACE0]();
}

uint64_t sub_2355C858C()
{
  return MEMORY[0x24BDDACF0]();
}

uint64_t sub_2355C8598()
{
  return MEMORY[0x24BDDAD00]();
}

uint64_t sub_2355C85A4()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_2355C85B0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2355C85BC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2355C85C8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2355C85D4()
{
  return MEMORY[0x24BDB9448]();
}

uint64_t sub_2355C85E0()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_2355C85EC()
{
  return MEMORY[0x24BDB9B60]();
}

uint64_t sub_2355C85F8()
{
  return MEMORY[0x24BDB9B90]();
}

uint64_t sub_2355C8604()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_2355C8610()
{
  return MEMORY[0x24BDB9C78]();
}

uint64_t sub_2355C861C()
{
  return MEMORY[0x24BDB9C90]();
}

uint64_t sub_2355C8628()
{
  return MEMORY[0x24BDB9CC0]();
}

uint64_t sub_2355C8634()
{
  return MEMORY[0x24BDB9CD0]();
}

uint64_t sub_2355C8640()
{
  return MEMORY[0x24BDB9D00]();
}

uint64_t sub_2355C864C()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_2355C8658()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_2355C8664()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_2355C8670()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_2355C867C()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_2355C8688()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_2355C8694()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_2355C86A0()
{
  return MEMORY[0x24BDB9F30]();
}

uint64_t sub_2355C86AC()
{
  return MEMORY[0x24BDB9F90]();
}

uint64_t sub_2355C86B8()
{
  return MEMORY[0x24BDBA0A0]();
}

uint64_t sub_2355C86C4()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_2355C86D0()
{
  return MEMORY[0x24BDBA120]();
}

uint64_t sub_2355C86DC()
{
  return MEMORY[0x24BDEAE98]();
}

uint64_t sub_2355C86E8()
{
  return MEMORY[0x24BDEAEB0]();
}

uint64_t sub_2355C86F4()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_2355C8700()
{
  return MEMORY[0x24BDEB3E0]();
}

uint64_t sub_2355C870C()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_2355C8718()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_2355C8724()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_2355C8730()
{
  return MEMORY[0x24BDEBC10]();
}

uint64_t sub_2355C873C()
{
  return MEMORY[0x24BDEBC28]();
}

uint64_t sub_2355C8748()
{
  return MEMORY[0x24BDEBC38]();
}

uint64_t sub_2355C8754()
{
  return MEMORY[0x24BDEBC40]();
}

uint64_t sub_2355C8760()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_2355C876C()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_2355C8778()
{
  return MEMORY[0x24BDEC138]();
}

uint64_t sub_2355C8784()
{
  return MEMORY[0x24BDEC260]();
}

uint64_t sub_2355C8790()
{
  return MEMORY[0x24BDEC268]();
}

uint64_t sub_2355C879C()
{
  return MEMORY[0x24BDEC280]();
}

uint64_t sub_2355C87A8()
{
  return MEMORY[0x24BDEC4E0]();
}

uint64_t sub_2355C87B4()
{
  return MEMORY[0x24BDEC638]();
}

uint64_t sub_2355C87C0()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_2355C87CC()
{
  return MEMORY[0x24BDEC778]();
}

uint64_t sub_2355C87D8()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_2355C87E4()
{
  return MEMORY[0x24BDECB98]();
}

uint64_t sub_2355C87F0()
{
  return MEMORY[0x24BDECBA0]();
}

uint64_t sub_2355C87FC()
{
  return MEMORY[0x24BDECE88]();
}

uint64_t sub_2355C8808()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_2355C8814()
{
  return MEMORY[0x24BDED1E0]();
}

uint64_t sub_2355C8820()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_2355C882C()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_2355C8838()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_2355C8844()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_2355C8850()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_2355C885C()
{
  return MEMORY[0x24BDEDF90]();
}

uint64_t sub_2355C8868()
{
  return MEMORY[0x24BDEDF98]();
}

uint64_t sub_2355C8874()
{
  return MEMORY[0x24BDEE020]();
}

uint64_t sub_2355C8880()
{
  return MEMORY[0x24BDEE028]();
}

uint64_t sub_2355C888C()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_2355C8898()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_2355C88A4()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_2355C88B0()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_2355C88BC()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_2355C88C8()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_2355C88D4()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_2355C88E0()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_2355C88EC()
{
  return MEMORY[0x24BDEE4C0]();
}

uint64_t sub_2355C88F8()
{
  return MEMORY[0x24BDEE4D8]();
}

uint64_t sub_2355C8904()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_2355C8910()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_2355C891C()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_2355C8928()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_2355C8934()
{
  return MEMORY[0x24BDEE718]();
}

uint64_t sub_2355C8940()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_2355C894C()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_2355C8958()
{
  return MEMORY[0x24BDEEA70]();
}

uint64_t sub_2355C8964()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_2355C8970()
{
  return MEMORY[0x24BDEED20]();
}

uint64_t sub_2355C897C()
{
  return MEMORY[0x24BDEED88]();
}

uint64_t sub_2355C8988()
{
  return MEMORY[0x24BDEEE38]();
}

uint64_t sub_2355C8994()
{
  return MEMORY[0x24BDEEEA0]();
}

uint64_t sub_2355C89A0()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_2355C89AC()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_2355C89B8()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_2355C89C4()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_2355C89D0()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_2355C89DC()
{
  return MEMORY[0x24BDEF560]();
}

uint64_t sub_2355C89E8()
{
  return MEMORY[0x24BDEFCB8]();
}

uint64_t sub_2355C89F4()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_2355C8A00()
{
  return MEMORY[0x24BDF0150]();
}

uint64_t sub_2355C8A0C()
{
  return MEMORY[0x24BDF0440]();
}

uint64_t sub_2355C8A18()
{
  return MEMORY[0x24BDF0468]();
}

uint64_t sub_2355C8A24()
{
  return MEMORY[0x24BDF0478]();
}

uint64_t sub_2355C8A30()
{
  return MEMORY[0x24BDF0A10]();
}

uint64_t sub_2355C8A3C()
{
  return MEMORY[0x24BDF0A18]();
}

uint64_t sub_2355C8A48()
{
  return MEMORY[0x24BDF0A20]();
}

uint64_t sub_2355C8A54()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_2355C8A60()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_2355C8A6C()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_2355C8A78()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_2355C8A84()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_2355C8A90()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_2355C8A9C()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_2355C8AA8()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_2355C8AB4()
{
  return MEMORY[0x24BDF1088]();
}

uint64_t sub_2355C8AC0()
{
  return MEMORY[0x24BDF13A0]();
}

uint64_t sub_2355C8ACC()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_2355C8AD8()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_2355C8AE4()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_2355C8AF0()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_2355C8AFC()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_2355C8B08()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_2355C8B14()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_2355C8B20()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_2355C8B2C()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_2355C8B38()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_2355C8B44()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_2355C8B50()
{
  return MEMORY[0x24BDF1778]();
}

uint64_t sub_2355C8B5C()
{
  return MEMORY[0x24BDF17D8]();
}

uint64_t sub_2355C8B68()
{
  return MEMORY[0x24BDF1818]();
}

uint64_t sub_2355C8B74()
{
  return MEMORY[0x24BDF1820]();
}

uint64_t sub_2355C8B80()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_2355C8B8C()
{
  return MEMORY[0x24BDF1900]();
}

uint64_t sub_2355C8B98()
{
  return MEMORY[0x24BDF1AE0]();
}

uint64_t sub_2355C8BA4()
{
  return MEMORY[0x24BDF1B10]();
}

uint64_t sub_2355C8BB0()
{
  return MEMORY[0x24BDF1BD0]();
}

uint64_t sub_2355C8BBC()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_2355C8BC8()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_2355C8BD4()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_2355C8BE0()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_2355C8BEC()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_2355C8BF8()
{
  return MEMORY[0x24BDF2138]();
}

uint64_t sub_2355C8C04()
{
  return MEMORY[0x24BDF22C8]();
}

uint64_t sub_2355C8C10()
{
  return MEMORY[0x24BDF2370]();
}

uint64_t sub_2355C8C1C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_2355C8C28()
{
  return MEMORY[0x24BDF2B50]();
}

uint64_t sub_2355C8C34()
{
  return MEMORY[0x24BDF2B70]();
}

uint64_t sub_2355C8C40()
{
  return MEMORY[0x24BDF2DB8]();
}

uint64_t sub_2355C8C4C()
{
  return MEMORY[0x24BDF2F08]();
}

uint64_t sub_2355C8C58()
{
  return MEMORY[0x24BDF30D8]();
}

uint64_t sub_2355C8C64()
{
  return MEMORY[0x24BDF33E0]();
}

uint64_t sub_2355C8C70()
{
  return MEMORY[0x24BDF3628]();
}

uint64_t sub_2355C8C7C()
{
  return MEMORY[0x24BDF3630]();
}

uint64_t sub_2355C8C88()
{
  return MEMORY[0x24BDF37C8]();
}

uint64_t sub_2355C8C94()
{
  return MEMORY[0x24BDF37E0]();
}

uint64_t sub_2355C8CA0()
{
  return MEMORY[0x24BDF3980]();
}

uint64_t sub_2355C8CAC()
{
  return MEMORY[0x24BDF3A40]();
}

uint64_t sub_2355C8CB8()
{
  return MEMORY[0x24BDF3BF8]();
}

uint64_t sub_2355C8CC4()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_2355C8CD0()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_2355C8CDC()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_2355C8CE8()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_2355C8CF4()
{
  return MEMORY[0x24BDF3D90]();
}

uint64_t sub_2355C8D00()
{
  return MEMORY[0x24BDF3DA0]();
}

uint64_t sub_2355C8D0C()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_2355C8D18()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_2355C8D24()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_2355C8D30()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_2355C8D3C()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_2355C8D48()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_2355C8D54()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_2355C8D60()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_2355C8D6C()
{
  return MEMORY[0x24BDF42C0]();
}

uint64_t sub_2355C8D78()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_2355C8D84()
{
  return MEMORY[0x24BDF4470]();
}

uint64_t sub_2355C8D90()
{
  return MEMORY[0x24BDF4480]();
}

uint64_t sub_2355C8D9C()
{
  return MEMORY[0x24BDF44E0]();
}

uint64_t sub_2355C8DA8()
{
  return MEMORY[0x24BDF44E8]();
}

uint64_t sub_2355C8DB4()
{
  return MEMORY[0x24BDF44F0]();
}

uint64_t sub_2355C8DC0()
{
  return MEMORY[0x24BDF4508]();
}

uint64_t sub_2355C8DCC()
{
  return MEMORY[0x24BDF4510]();
}

uint64_t sub_2355C8DD8()
{
  return MEMORY[0x24BDF46D8]();
}

uint64_t sub_2355C8DE4()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t sub_2355C8DF0()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_2355C8DFC()
{
  return MEMORY[0x24BDF48E8]();
}

uint64_t sub_2355C8E08()
{
  return MEMORY[0x24BDF4EC0]();
}

uint64_t sub_2355C8E14()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_2355C8E20()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_2355C8E2C()
{
  return MEMORY[0x24BDF4F70]();
}

uint64_t sub_2355C8E38()
{
  return MEMORY[0x24BDF4FB8]();
}

uint64_t sub_2355C8E44()
{
  return MEMORY[0x24BDF4FF0]();
}

uint64_t sub_2355C8E50()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_2355C8E5C()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_2355C8E68()
{
  return MEMORY[0x24BDF5448]();
}

uint64_t sub_2355C8E74()
{
  return MEMORY[0x24BDF5458]();
}

uint64_t sub_2355C8E80()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_2355C8E8C()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2355C8E98()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2355C8EA4()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2355C8EB0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2355C8EBC()
{
  return MEMORY[0x24BEE0740]();
}

uint64_t sub_2355C8EC8()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_2355C8ED4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2355C8EE0()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_2355C8EEC()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2355C8EF8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2355C8F04()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_2355C8F10()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2355C8F1C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2355C8F28()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_2355C8F34()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2355C8F40()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2355C8F4C()
{
  return MEMORY[0x24BEE0D58]();
}

uint64_t sub_2355C8F58()
{
  return MEMORY[0x24BDCFB80]();
}

uint64_t sub_2355C8F64()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_2355C8F70()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t sub_2355C8F7C()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_2355C8F88()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_2355C8F94()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2355C8FA0()
{
  return MEMORY[0x24BEE68D8]();
}

uint64_t sub_2355C8FAC()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_2355C8FB8()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_2355C8FC4()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_2355C8FD0()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2355C8FDC()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2355C8FE8()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_2355C8FF4()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_2355C9000()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_2355C900C()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_2355C9018()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_2355C9024()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_2355C9030()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_2355C903C()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_2355C9048()
{
  return MEMORY[0x24BEE1900]();
}

uint64_t sub_2355C9054()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_2355C9060()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_2355C906C()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_2355C9078()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2355C9084()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2355C9090()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2355C909C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2355C90A8()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_2355C90B4()
{
  return MEMORY[0x24BEE5710]();
}

uint64_t sub_2355C90C0()
{
  return MEMORY[0x24BEE5718]();
}

uint64_t sub_2355C90CC()
{
  return MEMORY[0x24BEE5728]();
}

uint64_t sub_2355C90D8()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_2355C90E4()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2355C90F0()
{
  return MEMORY[0x24BDC7B18]();
}

uint64_t sub_2355C90FC()
{
  return MEMORY[0x24BDC7B30]();
}

uint64_t sub_2355C9108()
{
  return MEMORY[0x24BDC7B48]();
}

uint64_t sub_2355C9114()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2355C9120()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2355C912C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2355C9138()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2355C9144()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2355C9150()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2355C915C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2355C9168()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2355C9174()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2355C9180()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2355C918C()
{
  return MEMORY[0x24BEE6F60]();
}

uint64_t sub_2355C9198()
{
  return MEMORY[0x24BEE6F68]();
}

uint64_t sub_2355C91A4()
{
  return MEMORY[0x24BEE6F70]();
}

uint64_t sub_2355C91B0()
{
  return MEMORY[0x24BEE6F78]();
}

uint64_t sub_2355C91BC()
{
  return MEMORY[0x24BEE6F80]();
}

uint64_t sub_2355C91C8()
{
  return MEMORY[0x24BEE6F90]();
}

uint64_t sub_2355C91D4()
{
  return MEMORY[0x24BEE6FA0]();
}

uint64_t sub_2355C91E0()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2355C91EC()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2355C91F8()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2355C9204()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2355C9210()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2355C921C()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2355C9228()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2355C9234()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2355C9240()
{
  return MEMORY[0x24BEE3A58]();
}

uint64_t sub_2355C924C()
{
  return MEMORY[0x24BEE3A88]();
}

uint64_t sub_2355C9258()
{
  return MEMORY[0x24BEE3AF0]();
}

uint64_t sub_2355C9264()
{
  return MEMORY[0x24BEE3B20]();
}

uint64_t sub_2355C9270()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2355C927C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2355C9288()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2355C9294()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2355C92A0()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_2355C92AC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2355C92B8()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_2355C92C4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2355C92D0()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t sub_2355C92DC()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2355C92E8()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2355C92F4()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AXSSContrastRatioForColor()
{
  return MEMORY[0x24BDFF748]();
}

CGColorRef CGColorCreateGenericGray(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDA98](gray, alpha);
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

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x24BDE8D78](allocator, token);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
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

