uint64_t LSKObservationsSequence.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t result;

  v12 = *(_QWORD *)(a4 - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = (char *)swift_allocObject();
  *((_QWORD *)v14 + 2) = a2;
  *((_QWORD *)v14 + 3) = a3;
  *((_QWORD *)v14 + 4) = a4;
  *((_QWORD *)v14 + 5) = a5;
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 32))(&v14[v13], a1, a4);
  *a6 = sub_240AF7C98;
  a6[1] = v14;
  return result;
}

_QWORD *sub_240AF7B40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD *result;
  uint64_t v17;

  v12 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  v15 = swift_allocBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, a4);
  sub_240B0E5F8();
  result = (_QWORD *)swift_allocObject();
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = a5;
  result[6] = v15;
  *a6 = &unk_2570836C0;
  a6[1] = result;
  return result;
}

uint64_t sub_240AF7C40()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8) + 80)));
  return swift_deallocObject();
}

_QWORD *sub_240AF7C98@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1[4];
  v3 = *(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80);
  return sub_240AF7B40((uint64_t)v1 + ((v3 + 48) & ~v3), v1[2], v1[3], v2, v1[5], a1);
}

uint64_t sub_240AF7CB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = a6;
  v6[5] = a1;
  v6[8] = swift_getAssociatedTypeWitness();
  v6[9] = swift_projectBox();
  return swift_task_switch();
}

uint64_t sub_240AF7D28()
{
  uint64_t v0;
  _QWORD *v1;

  swift_beginAccess();
  swift_getAssociatedConformanceWitness();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  *v1 = v0;
  v1[1] = sub_240AF7DC4;
  return sub_240B0E5E0();
}

uint64_t sub_240AF7DC4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 88) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_endAccess();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_240AF7E38()
{
  uint64_t v0;

  swift_endAccess();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_240AF7E6C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t LSKObservationsSequence.AsyncIterator.next()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_240AF7E8C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(_QWORD);

  v3 = (uint64_t (*)(_QWORD))(***(int ***)(v0 + 24) + **(_QWORD **)(v0 + 24));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_240AF7EEC;
  return v3(*(_QWORD *)(v0 + 16));
}

uint64_t sub_240AF7EEC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_240AF7F34(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_240AF7F94;
  v4[2] = a1;
  v4[3] = v1;
  return swift_task_switch();
}

uint64_t sub_240AF7F94()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_240AF7FDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  *(_QWORD *)(v4 + 24) = a4;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 32) = v5;
  *v5 = v4;
  v5[1] = sub_240AF8074;
  return sub_240B0E5EC();
}

uint64_t sub_240AF8074()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  v3 = *v1;
  swift_task_dealloc();
  if (v0)
    **(_QWORD **)(v2 + 24) = *(_QWORD *)(v2 + 16);
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t LSKObservationsSequence.makeAsyncIterator()()
{
  uint64_t (**v0)(void);

  return (*v0)();
}

uint64_t sub_240AF80F0()
{
  return MEMORY[0x24BEE3F20];
}

void sub_240AF80FC()
{
  JUMPOUT(0x2426893C4);
}

uint64_t sub_240AF810C()
{
  LSKObservationsSequence.makeAsyncIterator()();
  return swift_release();
}

uint64_t sub_240AF8124()
{
  return swift_allocateGenericValueMetadata();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t type metadata accessor for LSKObservationsSequence(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LSKObservationsSequence);
}

_QWORD *sub_240AF8150(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_240AF817C()
{
  return swift_release();
}

_QWORD *sub_240AF8184(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_240AF81BC(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_240AF81EC(uint64_t *a1, int a2)
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

uint64_t sub_240AF8234(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for LSKObservationsSequence.AsyncIterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LSKObservationsSequence.AsyncIterator);
}

uint64_t sub_240AF827C()
{
  sub_240B0E838();
  sub_240B0E844();
  return sub_240B0E850();
}

uint64_t sub_240AF82C0()
{
  return sub_240B0E844();
}

uint64_t sub_240AF82E8()
{
  sub_240B0E838();
  sub_240B0E844();
  return sub_240B0E850();
}

BOOL sub_240AF8328(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_240AF833C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_240AF834C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_240AF8358()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_240AF837C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_240AF7F94;
  return sub_240AF7CB8(a1, v8, v4, v5, v6, v7);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x242689358](a1, v6, a5);
}

void type metadata accessor for IDSDeviceType()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_25435B6D0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_25435B6D0);
  }
}

unint64_t sub_240AF8480()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2570836C8;
  if (!qword_2570836C8)
  {
    type metadata accessor for IDSDeviceType();
    result = MEMORY[0x2426893C4](&unk_240B0ED84, v1);
    atomic_store(result, (unint64_t *)&qword_2570836C8);
  }
  return result;
}

uint64_t LSKError.errorDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  if ((*(_BYTE *)(v0 + 16) & 1) != 0)
    v1 = 0x7463657078656E75;
  else
    v1 = 543975790;
  v3 = v1;
  sub_240B0E568();
  return v3;
}

unint64_t sub_240AF8550()
{
  unint64_t result;

  result = qword_2570836D0;
  if (!qword_2570836D0)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for LSKError, &type metadata for LSKError);
    atomic_store(result, (unint64_t *)&qword_2570836D0);
  }
  return result;
}

uint64_t sub_240AF8594()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  if ((*(_BYTE *)(v0 + 16) & 1) != 0)
    v1 = 0x7463657078656E75;
  else
    v1 = 543975790;
  v3 = v1;
  sub_240B0E568();
  return v3;
}

uint64_t sub_240AF860C()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for LSKError()
{
  return sub_240AF8624();
}

uint64_t sub_240AF8624()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s14LocalStatusKit8LSKErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_240AF860C();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for LSKError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_240AF860C();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_240AF8624();
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

uint64_t assignWithTake for LSKError(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_240AF8624();
  return a1;
}

uint64_t getEnumTagSinglePayload for LSKError(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for LSKError(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_240AF87AC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_240AF87B8(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LSKError()
{
  return &type metadata for LSKError;
}

uint64_t sub_240AF87D4()
{
  uint64_t v0;

  v0 = sub_240B0E49C();
  __swift_allocate_value_buffer(v0, qword_25435B798);
  __swift_project_value_buffer(v0, (uint64_t)qword_25435B798);
  return sub_240B0E490();
}

uint64_t static Logger.localStatus.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_25435B7F8 != -1)
    swift_once();
  v2 = sub_240B0E49C();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_25435B798);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
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

void LSKKey.domain.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t LSKKey.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

_BYTE *LSKKey.init(domain:name:)@<X0>(_BYTE *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_BYTE *)a4 = *result;
  *(_QWORD *)(a4 + 8) = a2;
  *(_QWORD *)(a4 + 16) = a3;
  return result;
}

uint64_t static LSKKey.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  sub_240AF89D8(*(_BYTE *)a1);
  if ((v6 & 1) == 0)
    return 0;
  if (v2 == v4 && v3 == v5)
    return 1;
  else
    return sub_240B0E7F0();
}

void sub_240AF89D8(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_240AF8A24(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_240AF8A88 + 4 * byte_240B0EE94[a2]))(0xD000000000000010);
}

uint64_t sub_240AF8A88(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0xD000000000000010 && v1 == 0x8000000240B11BD0)
    v2 = 1;
  else
    v2 = sub_240B0E7F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void LSKKey.hash(into:)()
{
  __asm { BR              X11 }
}

uint64_t sub_240AF8B6C()
{
  sub_240B0E550();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_240B0E550();
  return swift_bridgeObjectRelease();
}

BOOL sub_240AF8BEC(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_240AF8BFC()
{
  return sub_240B0E844();
}

uint64_t sub_240AF8C20(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E69616D6F64 && a2 == 0xE600000000000000;
  if (v2 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_240B0E7F0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_240AF8CF8()
{
  sub_240B0E838();
  sub_240B0E844();
  return sub_240B0E850();
}

uint64_t sub_240AF8D3C(char a1)
{
  if ((a1 & 1) != 0)
    return 1701667182;
  else
    return 0x6E69616D6F64;
}

BOOL sub_240AF8D68(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_240AF8BEC(*a1, *a2);
}

uint64_t sub_240AF8D80()
{
  return sub_240AF8CF8();
}

uint64_t sub_240AF8D94()
{
  return sub_240AF8BFC();
}

uint64_t sub_240AF8DA8()
{
  sub_240B0E838();
  sub_240AF8BFC();
  return sub_240B0E850();
}

uint64_t sub_240AF8DF0()
{
  char *v0;

  return sub_240AF8D3C(*v0);
}

uint64_t sub_240AF8E04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_240AF8C20(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_240AF8E34()
{
  return 0;
}

uint64_t sub_240AF8E40@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_240AF98AC();
  *a1 = result;
  return result;
}

uint64_t sub_240AF8E70(uint64_t a1)
{
  MEMORY[0x2426893C4](&unk_240B0F0E8, a1);
  return sub_240B0E874();
}

uint64_t sub_240AF8EA4(uint64_t a1)
{
  MEMORY[0x2426893C4](&unk_240B0F0E8, a1);
  return sub_240B0E880();
}

uint64_t LSKKey.encode(to:)(_QWORD *a1, uint64_t *a2)
{
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  _QWORD v13[2];
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  char v18;

  v4 = type metadata accessor for LSKKey.CodingKeys(255, a2[2], a2[3], a2[4]);
  MEMORY[0x2426893C4](&unk_240B0F0E8, v4);
  v5 = sub_240B0E7CC();
  v14 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v13 - v6;
  v8 = *v2;
  v9 = *((_QWORD *)v2 + 1);
  v13[0] = *((_QWORD *)v2 + 2);
  v13[1] = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B0E868();
  v18 = v8;
  v17 = 0;
  sub_240AF94D8();
  v10 = v15;
  sub_240B0E7C0();
  if (v10)
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v7, v5);
  v12 = v14;
  v16 = 1;
  sub_240B0E7B4();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v7, v5);
}

uint64_t LSKKey.hashValue.getter()
{
  sub_240B0E838();
  LSKKey.hash(into:)();
  return sub_240B0E850();
}

uint64_t LSKKey.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;

  v19 = a5;
  v7 = type metadata accessor for LSKKey.CodingKeys(255, a2, a3, a4);
  MEMORY[0x2426893C4](&unk_240B0F0E8, v7);
  v8 = sub_240B0E790();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v18 - v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B0E85C();
  if (!v5)
  {
    v12 = v19;
    v21 = 0;
    sub_240AF953C();
    sub_240B0E778();
    v13 = v22;
    v20 = 1;
    v15 = sub_240B0E76C();
    v17 = v16;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    *(_BYTE *)v12 = v13;
    *(_QWORD *)(v12 + 8) = v15;
    *(_QWORD *)(v12 + 16) = v17;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_240AF9228@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return LSKKey.init(from:)(a1, a2[2], a2[3], a2[4], a3);
}

uint64_t sub_240AF9248(_QWORD *a1, uint64_t *a2)
{
  return LSKKey.encode(to:)(a1, a2);
}

uint64_t sub_240AF9268()
{
  sub_240B0E838();
  LSKKey.hash(into:)();
  return sub_240B0E850();
}

void LSKKey.id.getter()
{
  __asm { BR              X11 }
}

uint64_t sub_240AF92F8()
{
  uint64_t v1;

  sub_240B0E568();
  swift_bridgeObjectRelease();
  sub_240B0E568();
  swift_bridgeObjectRetain();
  sub_240B0E568();
  swift_bridgeObjectRelease();
  return v1;
}

void sub_240AF9394(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  LSKKey.id.getter();
  *a1 = v2;
  a1[1] = v3;
}

void LSKKey.description.getter()
{
  LSKKey.id.getter();
}

uint64_t sub_240AF93F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 8);
  v2 = *(_QWORD *)(v1 + 16);
  *(_BYTE *)a1 = *(_BYTE *)v1;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v2;
  return swift_bridgeObjectRetain();
}

void sub_240AF9408(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_240AF9450()
{
  sub_240B0E550();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for LSKKey.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LSKKey.CodingKeys);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_240AF94D8()
{
  unint64_t result;

  result = qword_25435BBE0;
  if (!qword_25435BBE0)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for LSKDomain, &type metadata for LSKDomain);
    atomic_store(result, (unint64_t *)&qword_25435BBE0);
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

unint64_t sub_240AF953C()
{
  unint64_t result;

  result = qword_25435BBF0;
  if (!qword_25435BBF0)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for LSKDomain, &type metadata for LSKDomain);
    atomic_store(result, (unint64_t *)&qword_25435BBF0);
  }
  return result;
}

void sub_240AF9580()
{
  JUMPOUT(0x2426893C4);
}

uint64_t sub_240AF9590()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t sub_240AF959C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_240AF95A8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_240AF95B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_240AF95E4(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t sub_240AF9640(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_240AF9678(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_240AF96C0(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for LSKKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LSKKey);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LSKStatusOptions.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_240AF97AC(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_240AF97F8 + 4 * byte_240B0EEA9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_240AF982C + 4 * byte_240B0EEA4[v4]))();
}

uint64_t sub_240AF982C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240AF9834(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240AF983CLL);
  return result;
}

uint64_t sub_240AF9848(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240AF9850);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_240AF9854(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240AF985C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240AF9868(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_240AF9870(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void sub_240AF987C()
{
  JUMPOUT(0x2426893C4);
}

void sub_240AF988C()
{
  JUMPOUT(0x2426893C4);
}

void sub_240AF989C()
{
  JUMPOUT(0x2426893C4);
}

uint64_t sub_240AF98AC()
{
  return 2;
}

uint64_t LSKPublishedStatus.key.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 8);
  v2 = *(_QWORD *)(v1 + 16);
  *(_BYTE *)a1 = *(_BYTE *)v1;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v2;
  return swift_bridgeObjectRetain();
}

uint64_t LSKPublishedStatus.value.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 52);
  v5 = sub_240B0E664();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t LSKPublishedStatus.devices.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t LSKPublishedStatus.pendingDevies.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;

  type metadata accessor for LSKDestinationDevice.Delivery(0);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LSKDestinationDevice(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v28 = (uint64_t)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v24 - v9;
  v11 = *(_QWORD *)(v1 + *(int *)(a1 + 56));
  v12 = MEMORY[0x24BEE4AF8];
  v30 = MEMORY[0x24BEE4AF8];
  v13 = *(_QWORD *)(v11 + 16);
  result = swift_bridgeObjectRetain();
  v27 = v13;
  if (v13)
  {
    v15 = 0;
    v29 = v4;
    v24[1] = v4 + 8;
    v25 = v6;
    v26 = result;
    while (v15 < *(_QWORD *)(result + 16))
    {
      v16 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      v17 = *(_QWORD *)(v6 + 72);
      sub_240AF9B90(result + v16 + v17 * v15, (uint64_t)v10, type metadata accessor for LSKDestinationDevice);
      sub_240AF9B90((uint64_t)&v10[*(int *)(v5 + 28)], (uint64_t)v4, type metadata accessor for LSKDestinationDevice.Delivery);
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
      v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 48))(v4, 3, v18);
      if ((v19 - 2) < 2)
      {
        sub_240AFCC30((uint64_t)v10, type metadata accessor for LSKDestinationDevice);
      }
      else
      {
        if (!v19)
        {
          swift_bridgeObjectRelease();
          v20 = sub_240B0E448();
          (*(void (**)(char *, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v29, v20);
          v12 = v30;
        }
        v21 = v5;
        sub_240AF9C14((uint64_t)v10, v28);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_240AFBA68(0, *(_QWORD *)(v12 + 16) + 1, 1);
        v12 = v30;
        v23 = *(_QWORD *)(v30 + 16);
        v22 = *(_QWORD *)(v30 + 24);
        if (v23 >= v22 >> 1)
        {
          sub_240AFBA68(v22 > 1, v23 + 1, 1);
          v12 = v30;
        }
        *(_QWORD *)(v12 + 16) = v23 + 1;
        sub_240AF9C14(v28, v12 + v16 + v23 * v17);
        v5 = v21;
        v6 = v25;
      }
      ++v15;
      result = v26;
      if (v27 == v15)
      {
        v12 = v30;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v12;
  }
  return result;
}

uint64_t sub_240AF9B90(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426893AC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_240AF9C14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LSKDestinationDevice(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void LSKPublishedStatus.init(key:value:devices:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  *(_BYTE *)a2 = *(_BYTE *)a1;
  *(_QWORD *)(a2 + 8) = v2;
  *(_QWORD *)(a2 + 16) = v3;
  type metadata accessor for LSKPublishedStatus();
}

uint64_t sub_240AF9CA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v5 = v3 + *(int *)(a1 + 52);
  v6 = sub_240B0E664();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, v2, v6);
  *(_QWORD *)(v3 + *(int *)(a1 + 56)) = v1;
  return result;
}

uint64_t static LSKPublishedStatus.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  _QWORD v25[7];
  uint64_t v26;
  uint64_t v27;
  uint64_t TupleTypeMetadata2;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[8];
  uint64_t v36;
  uint64_t v37;

  v29 = a5;
  v10 = *(_QWORD *)(a3 - 8);
  v26 = a6;
  v27 = v10;
  MEMORY[0x24BDAC7A8](a1);
  v25[5] = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_240B0E664();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v13 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v14 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v25[6] = *(_QWORD *)(v12 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  MEMORY[0x24BDAC7A8](v18);
  v19 = *(_QWORD *)(a1 + 8);
  v20 = *(_QWORD *)(a1 + 16);
  LOBYTE(v31) = *(_BYTE *)a1;
  v32 = v19;
  v33 = v20;
  v21 = *(_QWORD *)(a2 + 8);
  v22 = *(_QWORD *)(a2 + 16);
  v35[0] = *(_BYTE *)a2;
  v36 = v21;
  v37 = v22;
  v30 = a3;
  v23 = v29;
  if ((static LSKKey.== infix(_:_:)((uint64_t)&v31, (uint64_t)v35) & 1) != 0)
  {
    v25[3] = v17;
    v25[4] = v13;
    v31 = v30;
    v32 = a4;
    v33 = v23;
    v34 = v26;
    type metadata accessor for LSKPublishedStatus();
  }
  return 0;
}

uint64_t sub_240AFA08C(uint64_t a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  BOOL v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  _QWORD v34[9];
  uint64_t v35;
  char *v36;
  uint64_t v37;

  v2 = sub_240B0E448();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LSKDestinationDevice.Delivery(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083710);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LSKDestinationDevice(0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (_QWORD *)((char *)v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = MEMORY[0x24BDAC7A8](v13);
  v20 = (_QWORD *)((char *)v34 - v18);
  v21 = *(_QWORD *)(a1 + 16);
  if (v21 == *(_QWORD *)(v19 + 16))
  {
    v34[3] = v8;
    if (!v21)
      return 1;
    v22 = v5;
    v23 = v19;
    if (a1 == v19)
      return 1;
    v24 = a1;
    v34[4] = v22;
    v34[5] = v2;
    v35 = v16;
    v25 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
    v34[6] = *(_QWORD *)(v17 + 72);
    v34[7] = v9;
    v34[8] = v19;
    v34[0] = v24;
    v34[1] = v3;
    v36 = v11;
    sub_240AF9B90(v24 + v25, (uint64_t)v34 - v18, type metadata accessor for LSKDestinationDevice);
    sub_240AF9B90(v23 + v25, (uint64_t)v15, type metadata accessor for LSKDestinationDevice);
    v26 = *v20 == *v15 && v20[1] == v15[1];
    if (v26 || (sub_240B0E7F0() & 1) != 0)
    {
      v27 = v20[2] == v15[2] && v20[3] == v15[3];
      if ((v27 || (sub_240B0E7F0() & 1) != 0) && (v20[4] == v15[4] && v20[5] == v15[5] || (sub_240B0E7F0() & 1) != 0))
      {
        v37 = v21;
        v28 = *(int *)(v35 + 28);
        v29 = (uint64_t)v15 + v28;
        v30 = (uint64_t)&v11[*(int *)(v9 + 48)];
        sub_240AF9B90((uint64_t)v20 + v28, (uint64_t)v11, type metadata accessor for LSKDestinationDevice.Delivery);
        sub_240AF9B90(v29, v30, type metadata accessor for LSKDestinationDevice.Delivery);
        v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
        v32 = (char *)&loc_240AFA210
            + 4
            * byte_240B0F140[(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 48))(v11, 3, v31)];
        __asm { BR              X9 }
      }
    }
    sub_240AFCC30((uint64_t)v15, type metadata accessor for LSKDestinationDevice);
    sub_240AFCC30((uint64_t)v20, type metadata accessor for LSKDestinationDevice);
  }
  return 0;
}

BOOL sub_240AFA56C(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_240AFA57C()
{
  return sub_240B0E844();
}

uint64_t sub_240AFA5A0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 7955819 && a2 == 0xE300000000000000;
  if (v2 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x73656369766564 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_240B0E7F0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_240AFA6DC()
{
  sub_240B0E838();
  sub_240B0E844();
  return sub_240B0E850();
}

uint64_t sub_240AFA720(char a1)
{
  if (!a1)
    return 7955819;
  if (a1 == 1)
    return 0x65756C6176;
  return 0x73656369766564;
}

BOOL sub_240AFA76C(char *a1, char *a2)
{
  return sub_240AFA56C(*a1, *a2);
}

uint64_t sub_240AFA784()
{
  return sub_240AFA6DC();
}

uint64_t sub_240AFA794()
{
  return sub_240AFA57C();
}

uint64_t sub_240AFA7A4()
{
  sub_240B0E838();
  sub_240AFA57C();
  return sub_240B0E850();
}

uint64_t sub_240AFA7EC()
{
  char *v0;

  return sub_240AFA720(*v0);
}

uint64_t sub_240AFA7FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_240AFA5A0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_240AFA82C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_240AFBD80();
  *a1 = result;
  return result;
}

uint64_t sub_240AFA85C(uint64_t a1)
{
  MEMORY[0x2426893C4](&unk_240B0F388, a1);
  return sub_240B0E874();
}

uint64_t sub_240AFA890(uint64_t a1)
{
  MEMORY[0x2426893C4](&unk_240B0F388, a1);
  return sub_240B0E880();
}

void LSKPublishedStatus.encode(to:)()
{
  type metadata accessor for LSKPublishedStatus.CodingKeys();
}

uint64_t sub_240AFA914(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  MEMORY[0x2426893C4](&unk_240B0F388, a1);
  v5 = sub_240B0E7CC();
  *(_QWORD *)(v4 - 160) = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v18 - v6;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  v8 = v5;
  v9 = *(_QWORD *)(v4 - 152);
  sub_240B0E868();
  v10 = *(_QWORD *)(v9 + 8);
  v11 = *(_QWORD *)(v9 + 16);
  *(_BYTE *)(v4 - 112) = *(_BYTE *)v9;
  *(_QWORD *)(v4 - 104) = v10;
  *(_QWORD *)(v4 - 96) = v11;
  *(_BYTE *)(v4 - 65) = 0;
  v12 = *(_QWORD *)(v4 - 144);
  *(_QWORD *)(v4 - 144) = v3;
  v13 = type metadata accessor for LSKKey(0, v3, v2, v12);
  MEMORY[0x2426893C4](&protocol conformance descriptor for LSKKey<A>, v13);
  v14 = *(_QWORD *)(v4 - 120);
  sub_240B0E7C0();
  if (v14)
    return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v4 - 160) + 8))(v7, v8);
  v16 = *(_QWORD *)(v4 - 168);
  v17 = *(_QWORD *)(v4 - 160);
  *(_BYTE *)(v4 - 112) = 1;
  sub_240B0E7A8();
  *(_QWORD *)(v4 - 112) = *(_QWORD *)(v9 + *(int *)(v16 + 56));
  *(_BYTE *)(v4 - 65) = 2;
  __swift_instantiateConcreteTypeFromMangledName(qword_25435BC18);
  sub_240AFBAE0(&qword_25435B810, &qword_25435B7E8, (uint64_t)&protocol conformance descriptor for LSKDestinationDevice, MEMORY[0x24BEE12A0]);
  sub_240B0E7C0();
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v7, v8);
}

void LSKPublishedStatus.init(from:)(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[16];

  v11[0] = a5;
  v9 = sub_240B0E664();
  v11[2] = *(_QWORD *)(v9 - 8);
  v11[3] = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11[5] = (char *)v11 - v10;
  v11[12] = a1;
  v11[13] = a2;
  v11[14] = a3;
  v11[15] = a4;
  type metadata accessor for LSKPublishedStatus.CodingKeys();
}

void sub_240AFAB80(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  MEMORY[0x2426893C4](&unk_240B0F388, a1);
  v6 = sub_240B0E790();
  *(_QWORD *)(v5 - 144) = v6;
  *(_QWORD *)(v5 - 176) = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  *(_QWORD *)(v5 - 136) = v3;
  *(_QWORD *)(v5 - 112) = v3;
  *(_QWORD *)(v5 - 104) = v1;
  *(_QWORD *)(v5 - 160) = v4;
  *(_QWORD *)(v5 - 152) = v1;
  *(_QWORD *)(v5 - 96) = v4;
  *(_QWORD *)(v5 - 88) = v2;
  type metadata accessor for LSKPublishedStatus();
}

uint64_t sub_240AFABF4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  *(_QWORD *)(v3 - 200) = a1;
  v4 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v18 - v5;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  *(_QWORD *)(v3 - 128) = v1;
  v7 = *(_QWORD *)(v3 - 120);
  sub_240B0E85C();
  if (v7)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  *(_QWORD *)(v3 - 120) = v4;
  v9 = *(_QWORD *)(v3 - 176);
  v8 = *(_QWORD *)(v3 - 168);
  v10 = type metadata accessor for LSKKey(0, *(_QWORD *)(v3 - 136), *(_QWORD *)(v3 - 152), *(_QWORD *)(v3 - 160));
  *(_BYTE *)(v3 - 65) = 0;
  MEMORY[0x2426893C4](&protocol conformance descriptor for LSKKey<A>, v10);
  sub_240B0E778();
  v11 = *(_QWORD *)(v3 - 104);
  v12 = *(_QWORD *)(v3 - 96);
  *v6 = *(_BYTE *)(v3 - 112);
  *((_QWORD *)v6 + 1) = v11;
  *((_QWORD *)v6 + 2) = v12;
  *(_BYTE *)(v3 - 112) = 1;
  v13 = v8;
  sub_240B0E760();
  v14 = *(_QWORD *)(v3 - 200);
  (*(void (**)(char *, uint64_t, _QWORD))(*(_QWORD *)(v3 - 192) + 32))(&v6[*(int *)(v14 + 52)], v13, *(_QWORD *)(v3 - 184));
  __swift_instantiateConcreteTypeFromMangledName(qword_25435BC18);
  *(_QWORD *)(v3 - 136) = v6;
  *(_BYTE *)(v3 - 65) = 2;
  sub_240AFBAE0(&qword_25435B8C0, &qword_25435B898, (uint64_t)&protocol conformance descriptor for LSKDestinationDevice, MEMORY[0x24BEE12D0]);
  sub_240B0E778();
  (*(void (**)(_QWORD, _QWORD))(v9 + 8))(*(_QWORD *)(v3 - 128), *(_QWORD *)(v3 - 144));
  v15 = *(_QWORD *)(v3 - 120);
  v16 = *(_QWORD *)(v3 - 136);
  *(_QWORD *)(v16 + *(int *)(v14 + 56)) = *(_QWORD *)(v3 - 112);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v15 + 16))(*(_QWORD *)(v3 - 208), v16, v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v16, v14);
}

void sub_240AFAE8C(uint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  LSKPublishedStatus.init(from:)(a1[2], a1[3], a1[4], a1[5], a2);
}

void sub_240AFAEAC()
{
  LSKPublishedStatus.encode(to:)();
}

uint64_t sub_240AFAEC0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return static LSKPublishedStatus.== infix(_:_:)(a1, a2, a3[2], a3[3], a3[4], a3[5]);
}

void LSKPublishedStatus.debugDescription.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD v16[8];
  uint64_t v17;
  unint64_t v18;

  v2 = v1;
  v4 = type metadata accessor for LSKDestinationDevice(0);
  v5 = *(_QWORD *)(v4 - 8);
  v16[2] = v4;
  v16[3] = v5;
  MEMORY[0x24BDAC7A8](v4);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836E0);
  v16[4] = *(_QWORD *)(v6 - 8);
  v16[5] = v6;
  MEMORY[0x24BDAC7A8](v6);
  v7 = *(_QWORD *)(a1 + 16);
  v8 = sub_240B0E664();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v16 - v11;
  v13 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)v16 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v2 + *(int *)(a1 + 52), v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, v7) == 1)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v12, v7);
    v17 = 0;
    v18 = 0xE000000000000000;
    sub_240B0E7E4();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v7);
  }
  v17 = 0;
  v18 = 0xE000000000000000;
  sub_240B0E6D0();
  swift_bridgeObjectRelease();
  v17 = 0x203A6E69616D6F64;
  v18 = 0xE800000000000000;
  __asm { BR              X10 }
}

uint64_t sub_240AFB0D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  uint64_t (*v20)(uint64_t);
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
  unint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  unint64_t v37;
  char *v38;
  unint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  uint64_t v42;

  sub_240B0E568();
  swift_bridgeObjectRelease();
  sub_240B0E568();
  swift_bridgeObjectRetain();
  sub_240B0E568();
  swift_bridgeObjectRelease();
  sub_240B0E568();
  sub_240B0E568();
  swift_bridgeObjectRelease();
  sub_240B0E568();
  v5 = *(_QWORD *)(v4 - 96);
  v6 = *(_QWORD *)(v4 - 88);
  v7 = sub_240AFB95C(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v9 = v7[2];
  v8 = v7[3];
  v10 = v9 + 1;
  if (v9 >= v8 >> 1)
    v7 = sub_240AFB95C((_QWORD *)(v8 > 1), v9 + 1, 1, v7);
  v7[2] = v10;
  v11 = &v7[2 * v9];
  v11[4] = v5;
  v11[5] = v6;
  v12 = *(_QWORD *)(v2 + *(int *)(v3 + 56));
  if (*(_QWORD *)(v12 + 16))
  {
    *(_QWORD *)(v4 - 96) = v12;
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    sub_240B0E3A0();
    __swift_instantiateConcreteTypeFromMangledName(qword_25435BC18);
    sub_240AFBF00(&qword_2570836E8, qword_25435BC18, MEMORY[0x24BEE12C8]);
    sub_240AFBF00(&qword_2570836F0, &qword_2570836E0, MEMORY[0x24BDCC6C8]);
    v13 = *(_QWORD *)(v4 - 120);
    v14 = sub_240B0E58C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 128) + 8))(v1, v13);
    swift_bridgeObjectRelease();
    v15 = *(_QWORD *)(v14 + 16);
    if (v15)
    {
      v16 = *(_QWORD *)(v4 - 136);
      v17 = *(unsigned __int8 *)(v16 + 80);
      *(_QWORD *)(v4 - 152) = v14;
      v18 = v14 + ((v17 + 32) & ~v17);
      *(_QWORD *)(v4 - 128) = v0 + *(int *)(*(_QWORD *)(v4 - 144) + 28);
      *(_QWORD *)(v4 - 120) = *(_QWORD *)(v16 + 72);
      v19 = type metadata accessor for LSKDestinationDevice;
      do
      {
        v20 = v19;
        sub_240AF9B90(v18, v0, v19);
        *(_QWORD *)(v4 - 96) = 8224;
        *(_QWORD *)(v4 - 88) = 0xE200000000000000;
        *(_QWORD *)(v4 - 112) = 0;
        *(_QWORD *)(v4 - 104) = 0xE000000000000000;
        sub_240B0E6D0();
        LSKDestinationDevice.Delivery.description.getter();
        v22 = v21;
        v24 = v23;
        swift_bridgeObjectRelease();
        *(_QWORD *)(v4 - 112) = v22;
        *(_QWORD *)(v4 - 104) = v24;
        sub_240B0E568();
        swift_bridgeObjectRetain();
        v25 = sub_240AFBE78(8);
        v27 = v26;
        v29 = v28;
        v31 = v30;
        swift_bridgeObjectRelease();
        MEMORY[0x242688E0C](v25, v27, v29, v31);
        sub_240B0E568();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_240B0E568();
        swift_bridgeObjectRetain();
        sub_240B0E568();
        swift_bridgeObjectRelease();
        sub_240B0E568();
        swift_bridgeObjectRetain();
        sub_240B0E568();
        swift_bridgeObjectRelease();
        sub_240B0E568();
        swift_bridgeObjectRelease();
        v32 = *(_QWORD *)(v4 - 96);
        v33 = *(_QWORD *)(v4 - 88);
        v35 = v7[2];
        v34 = v7[3];
        if (v35 >= v34 >> 1)
          v7 = sub_240AFB95C((_QWORD *)(v34 > 1), v35 + 1, 1, v7);
        v7[2] = v35 + 1;
        v36 = &v7[2 * v35];
        v36[4] = v32;
        v36[5] = v33;
        v19 = v20;
        sub_240AFCC30(v0, v20);
        v18 += *(_QWORD *)(v4 - 120);
        --v15;
      }
      while (v15);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v37 = v7[3];
    if (v10 >= v37 >> 1)
      v7 = sub_240AFB95C((_QWORD *)(v37 > 1), v9 + 2, 1, v7);
    v7[2] = v9 + 2;
    v38 = (char *)&v7[2 * v10];
    strcpy(v38 + 32, "  <No devices>");
    v38[47] = -18;
  }
  v40 = v7[2];
  v39 = v7[3];
  if (v40 >= v39 >> 1)
    v7 = sub_240AFB95C((_QWORD *)(v39 > 1), v40 + 1, 1, v7);
  v7[2] = v40 + 1;
  v41 = &v7[2 * v40];
  v41[4] = 125;
  v41[5] = 0xE100000000000000;
  *(_QWORD *)(v4 - 96) = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570836F8);
  sub_240AFBF00(&qword_257083700, &qword_2570836F8, MEMORY[0x24BEE12B0]);
  v42 = sub_240B0E514();
  swift_bridgeObjectRelease();
  return v42;
}

void sub_240AFB600(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t (*v5)(_QWORD);
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v2 = type metadata accessor for LSKDestinationDevice.Delivery(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240AF9B90(a1, (uint64_t)v4, v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
  v7 = (char *)sub_240AFB6A8
     + 4
     * byte_240B0F148[(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v4, 3, v6)];
  __asm { BR              X11 }
}

uint64_t sub_240AFB6A8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  swift_bridgeObjectRelease();
  v2 = sub_240B0E448();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  *v0 = 1;
  return result;
}

uint64_t sub_240AFB704@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  unsigned __int8 *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  _BYTE v23[12];
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[8];
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[8];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v29 = a4;
  v30 = a2;
  v9 = sub_240B0E664();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = &v23[-v11];
  v13 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v15 = &v23[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = *((_QWORD *)v5 + 1);
  v16 = *((_QWORD *)v5 + 2);
  v18 = *((_QWORD *)v5 + 4);
  if (v18 >> 60 == 15)
  {
    v31[0] = *v5;
    v32 = v17;
    v33 = v16;
    sub_240AF93F4((uint64_t)v34);
    v31[0] = v34[0];
    v32 = v35;
    v33 = v36;
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v12, 1, 1, a1);
    v19 = a5;
    goto LABEL_5;
  }
  v24 = *v5;
  v25 = v17;
  v26 = v16;
  v27 = a5;
  v28 = a3;
  v20 = *((_QWORD *)v5 + 3);
  sub_240B0E34C();
  swift_allocObject();
  sub_240AFCB50(v20, v18);
  sub_240B0E340();
  v21 = v37;
  sub_240B0E334();
  sub_240AFCB94(v20, v18);
  result = swift_release();
  v37 = v21;
  if (!v21)
  {
    v31[0] = v24;
    v32 = v25;
    v33 = v26;
    sub_240AF93F4((uint64_t)v34);
    v31[0] = v34[0];
    v32 = v35;
    v33 = v36;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v13 + 32))(v12, v15, a1);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v12, 0, 1, a1);
    v19 = v27;
LABEL_5:
    LSKPublishedStatus.init(key:value:devices:)((uint64_t)v31, v19);
  }
  return result;
}

_QWORD *sub_240AFB95C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_257083708);
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
    sub_240AFBD88(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_240AFBA68(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_240AFBBA0(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

void type metadata accessor for LSKPublishedStatus()
{
  JUMPOUT(0x242689358);
}

void type metadata accessor for LSKPublishedStatus.CodingKeys()
{
  JUMPOUT(0x242689358);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426893B8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_240AFBAE0(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_25435BC18);
    v10 = sub_240AFBB5C(a2, a3);
    result = MEMORY[0x2426893C4](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_240AFBB5C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for LSKDestinationDevice(255);
    result = MEMORY[0x2426893C4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_240AFBBA0(char a1, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257083718);
  v10 = *(_QWORD *)(type metadata accessor for LSKDestinationDevice(0) - 8);
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
  v16 = *(_QWORD *)(type metadata accessor for LSKDestinationDevice(0) - 8);
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
  result = sub_240B0E730();
  __break(1u);
  return result;
}

uint64_t sub_240AFBD80()
{
  return 3;
}

uint64_t sub_240AFBD88(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_240B0E730();
  __break(1u);
  return result;
}

uint64_t sub_240AFBE78(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_240B0E55C();
    return sub_240B0E580();
  }
  return result;
}

uint64_t sub_240AFBF00(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2426893C4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_240AFBF40()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_240AFBF48()
{
  uint64_t result;
  unint64_t v1;

  result = sub_240B0E664();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_240AFBFCC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  size_t v8;
  int v9;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  unsigned int (*v16)(const void *, uint64_t, uint64_t);

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
  if (v7 > 7 || v9 != 0 || ((v8 + 7 + ((v7 + 24) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v12 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16)));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v13 = a2[2];
    v3[1] = a2[1];
    v3[2] = v13;
    v14 = (void *)(((unint64_t)v3 + v7 + 24) & ~v7);
    v15 = (const void *)(((unint64_t)a2 + v7 + 24) & ~v7);
    v16 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48);
    swift_bridgeObjectRetain();
    if (v16(v15, 1, v4))
    {
      memcpy(v14, v15, v8);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(v14, v15, v4);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v14, 0, 1, v4);
    }
    *(_QWORD *)(((unint64_t)v14 + v8 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v15 + v8 + 7) & 0xFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  return v3;
}

uint64_t sub_240AFC114(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = (a1 + *(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4))
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v6, v4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_240AFC1A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  unsigned int (*v10)(const void *, uint64_t, uint64_t);
  int v11;
  size_t v12;
  size_t v13;
  size_t v14;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = (void *)((v7 + 24 + a1) & ~v7);
  v9 = (const void *)((v7 + 24 + a2) & ~v7);
  v10 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48);
  swift_bridgeObjectRetain();
  if (v10(v9, 1, v5))
  {
    v11 = *(_DWORD *)(v6 + 84);
    v12 = *(_QWORD *)(v6 + 64);
    if (v11)
      v13 = v12;
    else
      v13 = v12 + 1;
    memcpy(v8, v9, v13);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v8, v9, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v8, 0, 1, v5);
    v11 = *(_DWORD *)(v6 + 84);
    v12 = *(_QWORD *)(v6 + 64);
  }
  if (v11)
    v14 = v12;
  else
    v14 = v12 + 1;
  *(_QWORD *)(((unint64_t)v8 + v14 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v9 + v14 + 7) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_240AFC2A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  size_t v14;
  uint64_t v15;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (void *)((v8 + 24 + a1) & ~v8);
  v10 = (void *)((v8 + 24 + a2) & ~v8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v12 = v11(v9, 1, v6);
  v13 = v11(v10, 1, v6);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 16))(v9, v10, v6);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v6);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(v9, v10, v6);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(v9, v6);
  }
  if (*(_DWORD *)(v7 + 84))
    v14 = *(_QWORD *)(v7 + 64);
  else
    v14 = *(_QWORD *)(v7 + 64) + 1;
  memcpy(v9, v10, v14);
LABEL_10:
  if (*(_DWORD *)(v7 + 84))
    v15 = *(_QWORD *)(v7 + 64);
  else
    v15 = *(_QWORD *)(v7 + 64) + 1;
  *(_QWORD *)(((unint64_t)v9 + v15 + 7) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v10 + v15 + 7) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_240AFC410(uint64_t a1, uint64_t a2, uint64_t a3)
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

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (void *)((v6 + 24 + a1) & ~v6);
  v8 = (const void *)((v6 + 24 + a2) & ~v6);
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

uint64_t sub_240AFC504(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  size_t v15;
  uint64_t v16;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a3 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (void *)((v9 + 24 + a1) & ~v9);
  v11 = (void *)((v9 + 24 + a2) & ~v9);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v8 + 48);
  v13 = v12(v10, 1, v7);
  v14 = v12(v11, 1, v7);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v8 + 32))(v10, v11, v7);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v10, 0, 1, v7);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v8 + 40))(v10, v11, v7);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v8 + 8))(v10, v7);
  }
  if (*(_DWORD *)(v8 + 84))
    v15 = *(_QWORD *)(v8 + 64);
  else
    v15 = *(_QWORD *)(v8 + 64) + 1;
  memcpy(v10, v11, v15);
LABEL_10:
  if (*(_DWORD *)(v8 + 84))
    v16 = *(_QWORD *)(v8 + 64);
  else
    v16 = *(_QWORD *)(v8 + 64) + 1;
  *(_QWORD *)(((unint64_t)v10 + v16 + 7) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v11 + v16 + 7) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_240AFC65C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unint64_t v14;
  unsigned int v15;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5)
    v6 = v5 - 1;
  else
    v6 = 0;
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = v6;
  if (v5)
    v8 = 7;
  else
    v8 = 8;
  if (!a2)
    return 0;
  v9 = *(unsigned __int8 *)(v4 + 80);
  if (v7 < a2)
  {
    if (((((v8 + *(_QWORD *)(v4 + 64) + ((v9 + 24) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v10 = 2;
    else
      v10 = a2 - v7 + 1;
    if (v10 >= 0x10000)
      v11 = 4;
    else
      v11 = 2;
    if (v10 < 0x100)
      v11 = 1;
    if (v10 >= 2)
      v12 = v11;
    else
      v12 = 0;
    __asm { BR              X16 }
  }
  if ((v6 & 0x80000000) != 0)
  {
    v15 = (*(uint64_t (**)(uint64_t))(v4 + 48))((a1 + v9 + 24) & ~v9);
    if (v15 >= 2)
      return v15 - 1;
    else
      return 0;
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 16);
    if (v14 >= 0xFFFFFFFF)
      LODWORD(v14) = -1;
    return (v14 + 1);
  }
}

void sub_240AFC7A4(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
  if (v9 <= 0x7FFFFFFF)
    v10 = 0x7FFFFFFF;
  else
    v10 = v9;
  v11 = *(_QWORD *)(v7 + 64);
  if (!v8)
    ++v11;
  if (v10 < a3)
  {
    v12 = a3 - v10;
    if ((((_DWORD)v11 + ((*(unsigned __int8 *)(v7 + 80) + 24) & ~*(unsigned __int8 *)(v7 + 80)) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
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
    if ((((_DWORD)v11 + ((*(unsigned __int8 *)(v7 + 80) + 24) & ~*(unsigned __int8 *)(v7 + 80)) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      v15 = ~v10 + a2;
      bzero(a1, ((v11 + ((*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8)+ 8);
      *a1 = v15;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X15 }
}

uint64_t sub_240AFC8B0@<X0>(unsigned int a1@<W1>, size_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t result;

  *((_BYTE *)v14 + v15) = 0;
  if (a1)
  {
    if ((v11 & 0x80000000) != 0)
    {
      v16 = (void *)(((unint64_t)v14 + v13 + 24) & v10);
      if (v11 >= a1)
      {
        return (*(uint64_t (**)(void *, _QWORD))(v12 + 56))(v16, a1 + 1);
      }
      else if ((_DWORD)a2)
      {
        if (a2 <= 3)
          v17 = a2;
        else
          v17 = 4;
        bzero(v16, a2);
        __asm { BR              X10 }
      }
    }
    else if ((a1 & 0x80000000) != 0)
    {
      v14[1] = 0;
      v14[2] = 0;
      *v14 = a1 ^ 0x80000000;
    }
    else
    {
      v14[2] = a1 - 1;
    }
  }
  return result;
}

void sub_240AFC9A8()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
}

void sub_240AFC9B0()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
}

void sub_240AFC9C0()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

uint64_t getEnumTagSinglePayload for PublishStatusInvocation.Parameters.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_240AFCA5C(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_240AFCAA8 + 4 * byte_240B0F164[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_240AFCADC + 4 * byte_240B0F15F[v4]))();
}

uint64_t sub_240AFCADC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240AFCAE4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240AFCAECLL);
  return result;
}

uint64_t sub_240AFCAF8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240AFCB00);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_240AFCB04(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240AFCB0C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_240AFCB18(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void sub_240AFCB20()
{
  JUMPOUT(0x2426893C4);
}

void sub_240AFCB30()
{
  JUMPOUT(0x2426893C4);
}

void sub_240AFCB40()
{
  JUMPOUT(0x2426893C4);
}

uint64_t sub_240AFCB50(uint64_t a1, unint64_t a2)
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

uint64_t sub_240AFCB94(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_240AFCBA8(a1, a2);
  return a1;
}

uint64_t sub_240AFCBA8(uint64_t a1, unint64_t a2)
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

uint64_t sub_240AFCBF0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083710);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_240AFCC30(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_BYTE *static FormatStyle<>.oslog(_:)@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *result;
  return result;
}

BOOL static OSLogDateFormatter.Style.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t OSLogDateFormatter.Style.hash(into:)()
{
  return sub_240B0E844();
}

BOOL sub_240AFCCB8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_240AFCCD0()
{
  return sub_240B0E844();
}

uint64_t sub_240AFCCFC()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_240AFCD30 + 4 * byte_240B0F3E0[*v0]))(0xD000000000000010, 0x8000000240B11DB0);
}

uint64_t sub_240AFCD30()
{
  return 1702125924;
}

uint64_t sub_240AFCD40()
{
  return 1701669236;
}

uint64_t sub_240AFCD50()
{
  return 0x69546F4E656D6974;
}

uint64_t sub_240AFCD74()
{
  return 1819047270;
}

uint64_t sub_240AFCD84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_240AFEBC0(a1, a2);
  *a3 = result;
  return result;
}

void sub_240AFCDA8(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_240AFCDB4()
{
  sub_240AFD360();
  return sub_240B0E874();
}

uint64_t sub_240AFCDDC()
{
  sub_240AFD360();
  return sub_240B0E880();
}

uint64_t sub_240AFCE04()
{
  return 0;
}

void sub_240AFCE10(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_240AFCE1C()
{
  sub_240AFD470();
  return sub_240B0E874();
}

uint64_t sub_240AFCE44()
{
  sub_240AFD470();
  return sub_240B0E880();
}

uint64_t sub_240AFCE6C()
{
  sub_240AFD4B4();
  return sub_240B0E874();
}

uint64_t sub_240AFCE94()
{
  sub_240AFD4B4();
  return sub_240B0E880();
}

uint64_t sub_240AFCEBC()
{
  sub_240AFD3A4();
  return sub_240B0E874();
}

uint64_t sub_240AFCEE4()
{
  sub_240AFD3A4();
  return sub_240B0E880();
}

uint64_t sub_240AFCF0C()
{
  sub_240AFD42C();
  return sub_240B0E874();
}

uint64_t sub_240AFCF34()
{
  sub_240AFD42C();
  return sub_240B0E880();
}

uint64_t sub_240AFCF5C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_240AFCF88()
{
  sub_240AFD3E8();
  return sub_240B0E874();
}

uint64_t sub_240AFCFB0()
{
  sub_240AFD3E8();
  return sub_240B0E880();
}

void OSLogDateFormatter.Style.encode(to:)(_QWORD *a1)
{
  unsigned __int8 *v1;
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
  _QWORD v14[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083720);
  v14[11] = *(_QWORD *)(v3 - 8);
  v14[12] = v3;
  MEMORY[0x24BDAC7A8](v3);
  v14[10] = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083728);
  v14[8] = *(_QWORD *)(v5 - 8);
  v14[9] = v5;
  MEMORY[0x24BDAC7A8](v5);
  v14[7] = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083730);
  v14[5] = *(_QWORD *)(v7 - 8);
  v14[6] = v7;
  MEMORY[0x24BDAC7A8](v7);
  v14[4] = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083738);
  v14[2] = *(_QWORD *)(v9 - 8);
  v14[3] = v9;
  MEMORY[0x24BDAC7A8](v9);
  v14[1] = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083740);
  MEMORY[0x24BDAC7A8](v11);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083748);
  v14[14] = *(_QWORD *)(v12 - 8);
  v14[15] = v12;
  MEMORY[0x24BDAC7A8](v12);
  v13 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240AFD360();
  sub_240B0E868();
  __asm { BR              X9 }
}

uint64_t sub_240AFD1CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v4 - 69) = 0;
  sub_240AFD4B4();
  v5 = *(_QWORD *)(v4 - 88);
  sub_240B0E79C();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 96) + 8))(v1, v5);
}

unint64_t sub_240AFD360()
{
  unint64_t result;

  result = qword_257083750;
  if (!qword_257083750)
  {
    result = MEMORY[0x2426893C4](&unk_240B0FD98, &type metadata for OSLogDateFormatter.Style.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083750);
  }
  return result;
}

unint64_t sub_240AFD3A4()
{
  unint64_t result;

  result = qword_257083758;
  if (!qword_257083758)
  {
    result = MEMORY[0x2426893C4](&unk_240B0FD48, &type metadata for OSLogDateFormatter.Style.FullCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083758);
  }
  return result;
}

unint64_t sub_240AFD3E8()
{
  unint64_t result;

  result = qword_257083760;
  if (!qword_257083760)
  {
    result = MEMORY[0x2426893C4](&unk_240B0FCF8, &type metadata for OSLogDateFormatter.Style.TimeNoTimeZoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083760);
  }
  return result;
}

unint64_t sub_240AFD42C()
{
  unint64_t result;

  result = qword_257083768;
  if (!qword_257083768)
  {
    result = MEMORY[0x2426893C4](&unk_240B0FCA8, &type metadata for OSLogDateFormatter.Style.TimeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083768);
  }
  return result;
}

unint64_t sub_240AFD470()
{
  unint64_t result;

  result = qword_257083770;
  if (!qword_257083770)
  {
    result = MEMORY[0x2426893C4](&unk_240B0FC58, &type metadata for OSLogDateFormatter.Style.DateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083770);
  }
  return result;
}

unint64_t sub_240AFD4B4()
{
  unint64_t result;

  result = qword_257083778;
  if (!qword_257083778)
  {
    result = MEMORY[0x2426893C4](&unk_240B0FC08, &type metadata for OSLogDateFormatter.Style.DateWithTimeZoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083778);
  }
  return result;
}

uint64_t OSLogDateFormatter.Style.hashValue.getter()
{
  sub_240B0E838();
  sub_240B0E844();
  return sub_240B0E850();
}

uint64_t OSLogDateFormatter.Style.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  char *v24;
  uint64_t v25;
  _QWORD v27[4];
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;

  v42 = a2;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083780);
  v34 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v40 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083788);
  v35 = *(_QWORD *)(v4 - 8);
  v36 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v39 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083790);
  v32 = *(_QWORD *)(v6 - 8);
  v33 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v38 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083798);
  v30 = *(_QWORD *)(v8 - 8);
  v31 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v37 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570837A0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570837A8);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a1[3];
  v43 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  sub_240AFD360();
  v19 = v44;
  sub_240B0E85C();
  if (!v19)
  {
    v27[2] = v10;
    v27[3] = v13;
    v27[1] = v11;
    v44 = v15;
    v28 = v17;
    v29 = v14;
    v20 = sub_240B0E784();
    if (*(_QWORD *)(v20 + 16) == 1)
      __asm { BR              X9 }
    v21 = sub_240B0E6F4();
    swift_allocError();
    v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2570837B0);
    *v23 = &type metadata for OSLogDateFormatter.Style;
    v24 = v28;
    v25 = v29;
    sub_240B0E754();
    sub_240B0E6E8();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, *MEMORY[0x24BEE26D0], v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v24, v25);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
}

uint64_t sub_240AFDA34()
{
  sub_240B0E838();
  sub_240B0E844();
  return sub_240B0E850();
}

uint64_t sub_240AFDA78()
{
  sub_240B0E838();
  sub_240B0E844();
  return sub_240B0E850();
}

uint64_t sub_240AFDAB8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return OSLogDateFormatter.Style.init(from:)(a1, a2);
}

void sub_240AFDACC(_QWORD *a1)
{
  OSLogDateFormatter.Style.encode(to:)(a1);
}

void OSLogDateFormatter.style.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

void sub_240AFDAEC()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  __asm { BR              X9 }
}

void *sub_240AFDB30()
{
  void *v0;
  void *v1;

  v1 = (void *)sub_240B0E52C();
  objc_msgSend(v0, sel_setDateFormat_, v1);

  return v0;
}

uint64_t OSLogDateFormatter.format(_:)()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  sub_240AFDAEC();
  v1 = v0;
  v2 = (void *)sub_240B0E3B8();
  v3 = objc_msgSend(v1, sel_stringFromDate_, v2);

  v4 = sub_240B0E538();
  return v4;
}

uint64_t OSLogDateFormatter.parse(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _BYTE *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v21 = a3;
  v6 = sub_240B0E448();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570837B8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *v3;
  LOBYTE(v23) = *v3;
  sub_240AFDAEC();
  v15 = v14;
  v22 = a1;
  v24 = a2;
  v16 = (void *)sub_240B0E52C();
  v17 = objc_msgSend(v15, sel_dateFromString_, v16);

  if (!v17)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v12, 1, 1, v6);
LABEL_5:
    sub_240AFDF94((uint64_t)v12);
    __asm { BR              X9 }
  }
  sub_240B0E430();

  v18 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v18(v12, v9, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) == 1)
    goto LABEL_5;
  return ((uint64_t (*)(uint64_t, char *, uint64_t))v18)(v21, v12, v6);
}

uint64_t sub_240AFDF94(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570837B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OSLogDateFormatter.hash(into:)()
{
  return sub_240B0E844();
}

BOOL static OSLogDateFormatter.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_240AFE010()
{
  return 1;
}

uint64_t sub_240AFE018()
{
  sub_240B0E838();
  sub_240B0E844();
  return sub_240B0E850();
}

uint64_t sub_240AFE058()
{
  return sub_240B0E844();
}

uint64_t sub_240AFE07C()
{
  sub_240B0E838();
  sub_240B0E844();
  return sub_240B0E850();
}

uint64_t sub_240AFE0B8()
{
  return 0x656C797473;
}

uint64_t sub_240AFE0CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x656C797473 && a2 == 0xE500000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_240B0E7F0();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_240AFE158()
{
  sub_240AFE2A4();
  return sub_240B0E874();
}

uint64_t sub_240AFE180()
{
  sub_240AFE2A4();
  return sub_240B0E880();
}

uint64_t OSLogDateFormatter.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  uint64_t v9;
  char v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570837C0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240AFE2A4();
  sub_240B0E868();
  v10 = v7;
  sub_240AFE2E8();
  sub_240B0E7C0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_240AFE2A4()
{
  unint64_t result;

  result = qword_2570837C8;
  if (!qword_2570837C8)
  {
    result = MEMORY[0x2426893C4](&unk_240B0FBB8, &type metadata for OSLogDateFormatter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570837C8);
  }
  return result;
}

unint64_t sub_240AFE2E8()
{
  unint64_t result;

  result = qword_2570837D0;
  if (!qword_2570837D0)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for OSLogDateFormatter.Style, &type metadata for OSLogDateFormatter.Style);
    atomic_store(result, (unint64_t *)&qword_2570837D0);
  }
  return result;
}

uint64_t OSLogDateFormatter.hashValue.getter()
{
  sub_240B0E838();
  sub_240B0E844();
  return sub_240B0E850();
}

uint64_t OSLogDateFormatter.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570837D8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240AFE2A4();
  sub_240B0E85C();
  if (!v2)
  {
    sub_240AFE564();
    sub_240B0E778();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void sub_240AFE48C(uint64_t *a1@<X8>)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_240AFDAEC();
  v3 = v2;
  v4 = (void *)sub_240B0E3B8();
  v5 = objc_msgSend(v3, sel_stringFromDate_, v4);

  v6 = sub_240B0E538();
  v8 = v7;

  *a1 = v6;
  a1[1] = v8;
}

uint64_t sub_240AFE520@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return OSLogDateFormatter.parse(_:)(*a1, a1[1], a2);
}

uint64_t sub_240AFE53C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return OSLogDateFormatter.init(from:)(a1, a2);
}

uint64_t sub_240AFE550(_QWORD *a1)
{
  return OSLogDateFormatter.encode(to:)(a1);
}

unint64_t sub_240AFE564()
{
  unint64_t result;

  result = qword_2570837E0;
  if (!qword_2570837E0)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for OSLogDateFormatter.Style, &type metadata for OSLogDateFormatter.Style);
    atomic_store(result, (unint64_t *)&qword_2570837E0);
  }
  return result;
}

uint64_t TinyDateRangeFormatter.format(_:)()
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
  double v9;
  uint64_t v10;
  uint64_t v11;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;

  v0 = sub_240B0E478();
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_240B0E460();
  MEMORY[0x24BDAC7A8](v3);
  v4 = sub_240B0E3D0();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_240B0E418();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570837E8);
  sub_240B0E3AC();
  if (v9 >= 1.0)
  {
    sub_240B0E3C4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2570837F0);
    sub_240B0E400();
    v13 = v2;
    v14 = v6;
    v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_240B0FDF0;
    sub_240B0E3DC();
    sub_240B0E3E8();
    sub_240B0E3F4();
    sub_240AFEDCC(v11);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    sub_240B0E454();
    sub_240B0E46C();
    sub_240B0E40C();
    sub_240AFFB40(&qword_2570837F8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE760], MEMORY[0x24BDCE758]);
    sub_240B0E628();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v5);
    v17 = 32;
    v18 = 0xE100000000000000;
    v15 = 0;
    v16 = 0xE000000000000000;
    sub_240AFF034();
    v10 = sub_240B0E688();
    swift_bridgeObjectRelease();
  }
  else
  {
    v19 = 0;
    v20 = 0xE000000000000000;
    sub_240B0E3AC();
    sub_240B0E61C();
    sub_240B0E568();
    return v19;
  }
  return v10;
}

uint64_t static TinyDateRangeFormatter.== infix(_:_:)()
{
  return 1;
}

uint64_t sub_240AFE8E4()
{
  sub_240AFF078();
  return sub_240B0E874();
}

uint64_t sub_240AFE90C()
{
  sub_240AFF078();
  return sub_240B0E880();
}

uint64_t TinyDateRangeFormatter.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083808);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240AFF078();
  sub_240B0E868();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t TinyDateRangeFormatter.hashValue.getter()
{
  sub_240B0E838();
  return sub_240B0E850();
}

uint64_t TinyDateRangeFormatter.init(from:)(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_240AFEA50@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = TinyDateRangeFormatter.format(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_240AFEA74(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_240AFEA98(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083808);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240AFF078();
  sub_240B0E868();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_240AFEB5C()
{
  sub_240B0E838();
  return sub_240B0E850();
}

uint64_t sub_240AFEB90()
{
  sub_240B0E838();
  return sub_240B0E850();
}

uint64_t sub_240AFEBC0(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x8000000240B11DB0 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1702125924 && a2 == 0xE400000000000000 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1701669236 && a2 == 0xE400000000000000 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x69546F4E656D6974 && a2 == 0xEE00656E6F5A656DLL || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 1819047270 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v5 = sub_240B0E7F0();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_240AFEDCC(uint64_t a1)
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

  v2 = sub_240B0E400();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2570838F0);
    v10 = sub_240B0E6C4();
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
      sub_240AFFB40(&qword_2570838F8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE6C8], MEMORY[0x24BDCE6E0]);
      v14 = sub_240B0E508();
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
          sub_240AFFB40(&qword_257083900, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE6C8], MEMORY[0x24BDCE6E8]);
          v20 = sub_240B0E520();
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

unint64_t sub_240AFF034()
{
  unint64_t result;

  result = qword_257083800;
  if (!qword_257083800)
  {
    result = MEMORY[0x2426893C4](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257083800);
  }
  return result;
}

unint64_t sub_240AFF078()
{
  unint64_t result;

  result = qword_257083810;
  if (!qword_257083810)
  {
    result = MEMORY[0x2426893C4](&unk_240B0FB68, &type metadata for TinyDateRangeFormatter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083810);
  }
  return result;
}

unint64_t sub_240AFF0C0()
{
  unint64_t result;

  result = qword_257083818;
  if (!qword_257083818)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for OSLogDateFormatter.Style, &type metadata for OSLogDateFormatter.Style);
    atomic_store(result, (unint64_t *)&qword_257083818);
  }
  return result;
}

unint64_t sub_240AFF108()
{
  unint64_t result;

  result = qword_257083820;
  if (!qword_257083820)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for OSLogDateFormatter, &type metadata for OSLogDateFormatter);
    atomic_store(result, (unint64_t *)&qword_257083820);
  }
  return result;
}

unint64_t sub_240AFF150()
{
  unint64_t result;

  result = qword_257083828;
  if (!qword_257083828)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for OSLogDateFormatter, &type metadata for OSLogDateFormatter);
    atomic_store(result, (unint64_t *)&qword_257083828);
  }
  return result;
}

unint64_t sub_240AFF198()
{
  unint64_t result;

  result = qword_257083830;
  if (!qword_257083830)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for OSLogDateFormatter, &type metadata for OSLogDateFormatter);
    atomic_store(result, (unint64_t *)&qword_257083830);
  }
  return result;
}

unint64_t sub_240AFF1E0()
{
  unint64_t result;

  result = qword_257083838;
  if (!qword_257083838)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for OSLogDateFormatter, &type metadata for OSLogDateFormatter);
    atomic_store(result, (unint64_t *)&qword_257083838);
  }
  return result;
}

unint64_t sub_240AFF228()
{
  unint64_t result;

  result = qword_257083840;
  if (!qword_257083840)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for TinyDateRangeFormatter, &type metadata for TinyDateRangeFormatter);
    atomic_store(result, (unint64_t *)&qword_257083840);
  }
  return result;
}

unint64_t sub_240AFF270()
{
  unint64_t result;

  result = qword_257083848;
  if (!qword_257083848)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for TinyDateRangeFormatter, &type metadata for TinyDateRangeFormatter);
    atomic_store(result, (unint64_t *)&qword_257083848);
  }
  return result;
}

unint64_t sub_240AFF2B8()
{
  unint64_t result;

  result = qword_257083850;
  if (!qword_257083850)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for TinyDateRangeFormatter, &type metadata for TinyDateRangeFormatter);
    atomic_store(result, (unint64_t *)&qword_257083850);
  }
  return result;
}

unint64_t sub_240AFF300()
{
  unint64_t result;

  result = qword_257083858;
  if (!qword_257083858)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for TinyDateRangeFormatter, &type metadata for TinyDateRangeFormatter);
    atomic_store(result, (unint64_t *)&qword_257083858);
  }
  return result;
}

ValueMetadata *type metadata accessor for OSLogDateFormatter()
{
  return &type metadata for OSLogDateFormatter;
}

ValueMetadata *type metadata accessor for OSLogDateFormatter.Style()
{
  return &type metadata for OSLogDateFormatter.Style;
}

ValueMetadata *type metadata accessor for TinyDateRangeFormatter()
{
  return &type metadata for TinyDateRangeFormatter;
}

ValueMetadata *type metadata accessor for TinyDateRangeFormatter.CodingKeys()
{
  return &type metadata for TinyDateRangeFormatter.CodingKeys;
}

uint64_t getEnumTagSinglePayload for OSLogDateFormatter.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for OSLogDateFormatter.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_240AFF420 + 4 * byte_240B0F3F4[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_240AFF440 + 4 * byte_240B0F3F9[v4]))();
}

_BYTE *sub_240AFF420(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_240AFF440(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_240AFF448(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_240AFF450(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_240AFF458(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_240AFF460(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_240AFF46C()
{
  return 0;
}

ValueMetadata *type metadata accessor for OSLogDateFormatter.CodingKeys()
{
  return &type metadata for OSLogDateFormatter.CodingKeys;
}

uint64_t _s14LocalStatusKit18OSLogDateFormatterV5StyleOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s14LocalStatusKit18OSLogDateFormatterV5StyleOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_240AFF560 + 4 * byte_240B0F403[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_240AFF594 + 4 * byte_240B0F3FE[v4]))();
}

uint64_t sub_240AFF594(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240AFF59C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240AFF5A4);
  return result;
}

uint64_t sub_240AFF5B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240AFF5B8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_240AFF5BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240AFF5C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OSLogDateFormatter.Style.CodingKeys()
{
  return &type metadata for OSLogDateFormatter.Style.CodingKeys;
}

ValueMetadata *type metadata accessor for OSLogDateFormatter.Style.DateWithTimeZoneCodingKeys()
{
  return &type metadata for OSLogDateFormatter.Style.DateWithTimeZoneCodingKeys;
}

ValueMetadata *type metadata accessor for OSLogDateFormatter.Style.DateCodingKeys()
{
  return &type metadata for OSLogDateFormatter.Style.DateCodingKeys;
}

ValueMetadata *type metadata accessor for OSLogDateFormatter.Style.TimeCodingKeys()
{
  return &type metadata for OSLogDateFormatter.Style.TimeCodingKeys;
}

ValueMetadata *type metadata accessor for OSLogDateFormatter.Style.TimeNoTimeZoneCodingKeys()
{
  return &type metadata for OSLogDateFormatter.Style.TimeNoTimeZoneCodingKeys;
}

ValueMetadata *type metadata accessor for OSLogDateFormatter.Style.FullCodingKeys()
{
  return &type metadata for OSLogDateFormatter.Style.FullCodingKeys;
}

unint64_t sub_240AFF634()
{
  unint64_t result;

  result = qword_257083860;
  if (!qword_257083860)
  {
    result = MEMORY[0x2426893C4](&unk_240B0FA38, &type metadata for OSLogDateFormatter.Style.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083860);
  }
  return result;
}

unint64_t sub_240AFF67C()
{
  unint64_t result;

  result = qword_257083868;
  if (!qword_257083868)
  {
    result = MEMORY[0x2426893C4](&unk_240B0FAF0, &type metadata for OSLogDateFormatter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083868);
  }
  return result;
}

unint64_t sub_240AFF6C4()
{
  unint64_t result;

  result = qword_257083870;
  if (!qword_257083870)
  {
    result = MEMORY[0x2426893C4](&unk_240B0FB18, &type metadata for TinyDateRangeFormatter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083870);
  }
  return result;
}

unint64_t sub_240AFF70C()
{
  unint64_t result;

  result = qword_257083878;
  if (!qword_257083878)
  {
    result = MEMORY[0x2426893C4](&unk_240B0FB40, &type metadata for TinyDateRangeFormatter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083878);
  }
  return result;
}

unint64_t sub_240AFF754()
{
  unint64_t result;

  result = qword_257083880;
  if (!qword_257083880)
  {
    result = MEMORY[0x2426893C4](&unk_240B0FA60, &type metadata for OSLogDateFormatter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083880);
  }
  return result;
}

unint64_t sub_240AFF79C()
{
  unint64_t result;

  result = qword_257083888;
  if (!qword_257083888)
  {
    result = MEMORY[0x2426893C4](&unk_240B0FA88, &type metadata for OSLogDateFormatter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083888);
  }
  return result;
}

unint64_t sub_240AFF7E4()
{
  unint64_t result;

  result = qword_257083890;
  if (!qword_257083890)
  {
    result = MEMORY[0x2426893C4](&unk_240B0F958, &type metadata for OSLogDateFormatter.Style.DateWithTimeZoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083890);
  }
  return result;
}

unint64_t sub_240AFF82C()
{
  unint64_t result;

  result = qword_257083898;
  if (!qword_257083898)
  {
    result = MEMORY[0x2426893C4](&unk_240B0F980, &type metadata for OSLogDateFormatter.Style.DateWithTimeZoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083898);
  }
  return result;
}

unint64_t sub_240AFF874()
{
  unint64_t result;

  result = qword_2570838A0;
  if (!qword_2570838A0)
  {
    result = MEMORY[0x2426893C4](&unk_240B0F908, &type metadata for OSLogDateFormatter.Style.DateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570838A0);
  }
  return result;
}

unint64_t sub_240AFF8BC()
{
  unint64_t result;

  result = qword_2570838A8;
  if (!qword_2570838A8)
  {
    result = MEMORY[0x2426893C4](&unk_240B0F930, &type metadata for OSLogDateFormatter.Style.DateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570838A8);
  }
  return result;
}

unint64_t sub_240AFF904()
{
  unint64_t result;

  result = qword_2570838B0;
  if (!qword_2570838B0)
  {
    result = MEMORY[0x2426893C4](&unk_240B0F8B8, &type metadata for OSLogDateFormatter.Style.TimeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570838B0);
  }
  return result;
}

unint64_t sub_240AFF94C()
{
  unint64_t result;

  result = qword_2570838B8;
  if (!qword_2570838B8)
  {
    result = MEMORY[0x2426893C4](&unk_240B0F8E0, &type metadata for OSLogDateFormatter.Style.TimeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570838B8);
  }
  return result;
}

unint64_t sub_240AFF994()
{
  unint64_t result;

  result = qword_2570838C0;
  if (!qword_2570838C0)
  {
    result = MEMORY[0x2426893C4](&unk_240B0F868, &type metadata for OSLogDateFormatter.Style.TimeNoTimeZoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570838C0);
  }
  return result;
}

unint64_t sub_240AFF9DC()
{
  unint64_t result;

  result = qword_2570838C8;
  if (!qword_2570838C8)
  {
    result = MEMORY[0x2426893C4](&unk_240B0F890, &type metadata for OSLogDateFormatter.Style.TimeNoTimeZoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570838C8);
  }
  return result;
}

unint64_t sub_240AFFA24()
{
  unint64_t result;

  result = qword_2570838D0;
  if (!qword_2570838D0)
  {
    result = MEMORY[0x2426893C4](&unk_240B0F818, &type metadata for OSLogDateFormatter.Style.FullCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570838D0);
  }
  return result;
}

unint64_t sub_240AFFA6C()
{
  unint64_t result;

  result = qword_2570838D8;
  if (!qword_2570838D8)
  {
    result = MEMORY[0x2426893C4](&unk_240B0F840, &type metadata for OSLogDateFormatter.Style.FullCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570838D8);
  }
  return result;
}

unint64_t sub_240AFFAB4()
{
  unint64_t result;

  result = qword_2570838E0;
  if (!qword_2570838E0)
  {
    result = MEMORY[0x2426893C4](&unk_240B0F9A8, &type metadata for OSLogDateFormatter.Style.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570838E0);
  }
  return result;
}

unint64_t sub_240AFFAFC()
{
  unint64_t result;

  result = qword_2570838E8;
  if (!qword_2570838E8)
  {
    result = MEMORY[0x2426893C4](&unk_240B0F9D0, &type metadata for OSLogDateFormatter.Style.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570838E8);
  }
  return result;
}

uint64_t sub_240AFFB40(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2426893C4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t LSKDomain.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_240AFFBC8 + 4 * byte_240B0FE00[*v0]))(0xD000000000000021, 0x8000000240B11BA0);
}

unint64_t sub_240AFFBC8()
{
  return 0xD000000000000010;
}

uint64_t sub_240AFFBE4@<X0>(uint64_t a1@<X8>)
{
  return a1 + 9;
}

uint64_t LSKDomain.id.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_240AFFC44 + 4 * byte_240B0FE04[*v0]))(0xD000000000000021, 0x8000000240B11BA0);
}

unint64_t sub_240AFFC44()
{
  return 0xD000000000000010;
}

uint64_t sub_240AFFC60@<X0>(uint64_t a1@<X8>)
{
  return a1 + 9;
}

LocalStatusKit::LSKDomain_optional __swiftcall LSKDomain.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  LocalStatusKit::LSKDomain_optional result;
  char v5;

  v2 = v1;
  v3 = sub_240B0E73C();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

void *static LSKDomain.allCases.getter()
{
  return &unk_2511019D8;
}

void sub_240AFFCEC(char *a1)
{
  sub_240AF89D8(*a1);
}

LocalStatusKit::LSKDomain_optional sub_240AFFCF8(Swift::String *a1)
{
  return LSKDomain.init(rawValue:)(*a1);
}

uint64_t sub_240AFFD04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = LSKDomain.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_240AFFD28@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = LSKDomain.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_240AFFD4C()
{
  sub_240B001A4();
  return sub_240B0E5BC();
}

uint64_t sub_240AFFDA8()
{
  sub_240B001A4();
  return sub_240B0E5A4();
}

unint64_t sub_240AFFDF8()
{
  unint64_t result;

  result = qword_257083908;
  if (!qword_257083908)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for LSKDomain, &type metadata for LSKDomain);
    atomic_store(result, (unint64_t *)&qword_257083908);
  }
  return result;
}

void sub_240AFFE3C()
{
  char *v0;

  sub_240AFFE44(*v0);
}

void sub_240AFFE44(char a1)
{
  sub_240B0E838();
  __asm { BR              X10 }
}

uint64_t sub_240AFFEA0()
{
  sub_240B0E550();
  swift_bridgeObjectRelease();
  return sub_240B0E850();
}

void sub_240AFFF10(uint64_t a1)
{
  char *v1;

  sub_240AF9408(a1, *v1);
}

void sub_240AFFF18(uint64_t a1)
{
  char *v1;

  sub_240AFFF70(a1, *v1);
}

unint64_t sub_240AFFF24()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257083910;
  if (!qword_257083910)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257083918);
    result = MEMORY[0x2426893C4](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_257083910);
  }
  return result;
}

void sub_240AFFF70(uint64_t a1, char a2)
{
  sub_240B0E838();
  __asm { BR              X10 }
}

uint64_t sub_240AFFFC8()
{
  sub_240B0E550();
  swift_bridgeObjectRelease();
  return sub_240B0E850();
}

void sub_240B00038(_QWORD *a1@<X8>)
{
  *a1 = &unk_251101A80;
}

uint64_t getEnumTagSinglePayload for LSKDomain(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for LSKDomain(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_240B00124 + 4 * byte_240B0FE15[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_240B00158 + 4 * byte_240B0FE10[v4]))();
}

uint64_t sub_240B00158(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B00160(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240B00168);
  return result;
}

uint64_t sub_240B00174(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240B0017CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_240B00180(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B00188(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LSKDomain()
{
  return &type metadata for LSKDomain;
}

unint64_t sub_240B001A4()
{
  unint64_t result;

  result = qword_25435BBE8;
  if (!qword_25435BBE8)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for LSKDomain, &type metadata for LSKDomain);
    atomic_store(result, (unint64_t *)&qword_25435BBE8);
  }
  return result;
}

BOOL static LSKStatusOptions.DeviceType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t LSKStatusOptions.DeviceType.hash(into:)()
{
  return sub_240B0E844();
}

uint64_t sub_240B00224()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 6513005;
  if (*v0 != 1)
    v1 = 30324;
  if (*v0)
    return v1;
  else
    return 825242478;
}

uint64_t sub_240B00264@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_240B02444(a1, a2);
  *a3 = result;
  return result;
}

void sub_240B00288(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_240B00294()
{
  sub_240B00638();
  return sub_240B0E874();
}

uint64_t sub_240B002BC()
{
  sub_240B00638();
  return sub_240B0E880();
}

uint64_t sub_240B002E4()
{
  sub_240B006C0();
  return sub_240B0E874();
}

uint64_t sub_240B0030C()
{
  sub_240B006C0();
  return sub_240B0E880();
}

uint64_t sub_240B00334()
{
  sub_240B00704();
  return sub_240B0E874();
}

uint64_t sub_240B0035C()
{
  sub_240B00704();
  return sub_240B0E880();
}

uint64_t sub_240B00384()
{
  sub_240B0067C();
  return sub_240B0E874();
}

uint64_t sub_240B003AC()
{
  sub_240B0067C();
  return sub_240B0E880();
}

uint64_t LSKStatusOptions.DeviceType.encode(to:)(_QWORD *a1)
{
  unsigned __int8 *v1;
  unsigned __int8 *v2;
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
  int v15;
  char *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435B858);
  v22 = *(_QWORD *)(v4 - 8);
  v23 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v21 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435B8E8);
  v19 = *(_QWORD *)(v6 - 8);
  v20 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435B8F0);
  v9 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435B8E0);
  v24 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B00638();
  sub_240B0E868();
  if (v15)
  {
    if (v15 == 1)
    {
      v26 = 1;
      sub_240B006C0();
      sub_240B0E79C();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v20);
    }
    else
    {
      v27 = 2;
      sub_240B0067C();
      v16 = v21;
      sub_240B0E79C();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v23);
    }
  }
  else
  {
    v25 = 0;
    sub_240B00704();
    sub_240B0E79C();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v18);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v14, v12);
}

unint64_t sub_240B00638()
{
  unint64_t result;

  result = qword_25435BAC8;
  if (!qword_25435BAC8)
  {
    result = MEMORY[0x2426893C4](&unk_240B107E8, &type metadata for LSKStatusOptions.DeviceType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BAC8);
  }
  return result;
}

unint64_t sub_240B0067C()
{
  unint64_t result;

  result = qword_25435B770;
  if (!qword_25435B770)
  {
    result = MEMORY[0x2426893C4](&unk_240B10798, &type metadata for LSKStatusOptions.DeviceType.TvCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435B770);
  }
  return result;
}

unint64_t sub_240B006C0()
{
  unint64_t result;

  result = qword_25435BAE0;
  if (!qword_25435BAE0)
  {
    result = MEMORY[0x2426893C4](&unk_240B10748, &type metadata for LSKStatusOptions.DeviceType.MacCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BAE0);
  }
  return result;
}

unint64_t sub_240B00704()
{
  unint64_t result;

  result = qword_257083920;
  if (!qword_257083920)
  {
    result = MEMORY[0x2426893C4](&unk_240B106F8, &type metadata for LSKStatusOptions.DeviceType.N301CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083920);
  }
  return result;
}

uint64_t LSKStatusOptions.DeviceType.hashValue.getter()
{
  sub_240B0E838();
  sub_240B0E844();
  return sub_240B0E850();
}

uint64_t LSKStatusOptions.DeviceType.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  _QWORD *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
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
  _BYTE *v38;
  char *v39;
  char *v40;
  _QWORD *v41;
  char v42;
  char v43;
  char v44;

  v38 = a2;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435B628);
  v34 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v40 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435B830);
  v35 = *(_QWORD *)(v4 - 8);
  v36 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v39 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435B838);
  v6 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435B828);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B00638();
  v13 = v41;
  sub_240B0E85C();
  if (v13)
    goto LABEL_7;
  v31 = v6;
  v32 = v10;
  v14 = v39;
  v15 = v40;
  v41 = a1;
  v16 = v12;
  v17 = sub_240B0E784();
  v18 = v9;
  if (*(_QWORD *)(v17 + 16) != 1)
  {
    v23 = sub_240B0E6F4();
    swift_allocError();
    v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2570837B0);
    *v25 = &type metadata for LSKStatusOptions.DeviceType;
    sub_240B0E754();
    sub_240B0E6E8();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x24BEE26D0], v23);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v9);
    a1 = v41;
LABEL_7:
    v26 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v26);
  }
  v19 = *(unsigned __int8 *)(v17 + 32);
  if (*(_BYTE *)(v17 + 32))
  {
    if (v19 == 1)
    {
      v43 = 1;
      sub_240B006C0();
      v20 = v9;
      sub_240B0E748();
      v21 = v38;
      v22 = v32;
      (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v36);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v20);
    }
    else
    {
      v44 = 2;
      sub_240B0067C();
      v28 = v15;
      sub_240B0E748();
      v21 = v38;
      v29 = v32;
      (*(void (**)(char *, uint64_t))(v34 + 8))(v28, v37);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v16, v18);
    }
  }
  else
  {
    v42 = 0;
    sub_240B00704();
    sub_240B0E748();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v33);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v9);
    v21 = v38;
  }
  *v21 = v19;
  v26 = (uint64_t)v41;
  return __swift_destroy_boxed_opaque_existential_1(v26);
}

uint64_t sub_240B00BD0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return LSKStatusOptions.DeviceType.init(from:)(a1, a2);
}

uint64_t sub_240B00BE4(_QWORD *a1)
{
  return LSKStatusOptions.DeviceType.encode(to:)(a1);
}

uint64_t static LSKStatusOptions.Scope.== infix(_:_:)()
{
  return 1;
}

uint64_t LSKStatusOptions.Scope.hash(into:)()
{
  return sub_240B0E844();
}

uint64_t sub_240B00C2C()
{
  return 0x6F636341656D6173;
}

uint64_t sub_240B00C4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6F636341656D6173 && a2 == 0xEB00000000746E75)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_240B0E7F0();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_240B00CF8()
{
  sub_240B00ED4();
  return sub_240B0E874();
}

uint64_t sub_240B00D20()
{
  sub_240B00ED4();
  return sub_240B0E880();
}

uint64_t sub_240B00D48()
{
  sub_240B00F18();
  return sub_240B0E874();
}

uint64_t sub_240B00D70()
{
  sub_240B00F18();
  return sub_240B0E880();
}

uint64_t LSKStatusOptions.Scope.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435B900);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435B8F8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B00ED4();
  sub_240B0E868();
  sub_240B00F18();
  sub_240B0E79C();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_240B00ED4()
{
  unint64_t result;

  result = qword_25435BB08;
  if (!qword_25435BB08)
  {
    result = MEMORY[0x2426893C4](&unk_240B106A8, &type metadata for LSKStatusOptions.Scope.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BB08);
  }
  return result;
}

unint64_t sub_240B00F18()
{
  unint64_t result;

  result = qword_25435BB20;
  if (!qword_25435BB20)
  {
    result = MEMORY[0x2426893C4](&unk_240B10658, &type metadata for LSKStatusOptions.Scope.SameAccountCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BB20);
  }
  return result;
}

uint64_t LSKStatusOptions.Scope.hashValue.getter()
{
  sub_240B0E838();
  sub_240B0E844();
  return sub_240B0E850();
}

uint64_t LSKStatusOptions.Scope.init(from:)(_QWORD *a1)
{
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435B848);
  v2 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435B840);
  v5 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B00ED4();
  v8 = v23;
  sub_240B0E85C();
  if (v8)
    goto LABEL_7;
  v20 = a1;
  v23 = v5;
  v10 = v21;
  v9 = v22;
  if (*(_QWORD *)(sub_240B0E784() + 16) != 1)
  {
    v14 = sub_240B0E6F4();
    swift_allocError();
    v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2570837B0);
    *v16 = &type metadata for LSKStatusOptions.Scope;
    sub_240B0E754();
    sub_240B0E6E8();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v16, *MEMORY[0x24BEE26D0], v14);
    swift_willThrow();
    v17 = v23;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v9);
    a1 = v20;
LABEL_7:
    v13 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v13);
  }
  sub_240B00F18();
  v11 = v4;
  sub_240B0E748();
  v12 = v23;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v10);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
  v13 = (uint64_t)v20;
  return __swift_destroy_boxed_opaque_existential_1(v13);
}

uint64_t sub_240B011F8(_QWORD *a1)
{
  return LSKStatusOptions.Scope.init(from:)(a1);
}

uint64_t sub_240B0120C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435B900);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435B8F8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B00ED4();
  sub_240B0E868();
  sub_240B00F18();
  sub_240B0E79C();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t LSKStatusOptions.publishToDeviceTypes.getter()
{
  return swift_bridgeObjectRetain();
}

void LSKStatusOptions.init(scope:publishToDeviceTypes:)(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  *a2 = a1;
}

uint64_t LSKStatusOptions.hash(into:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  v1 = *v0;
  sub_240B0E844();
  result = sub_240B0E844();
  v3 = *(_QWORD *)(v1 + 16);
  if (v3)
  {
    v4 = v1 + 32;
    do
    {
      ++v4;
      result = sub_240B0E844();
      --v3;
    }
    while (v3);
  }
  return result;
}

BOOL sub_240B013B8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_240B013D0()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000014;
  else
    return 0x65706F6373;
}

uint64_t sub_240B0140C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_240B02560(a1, a2);
  *a3 = result;
  return result;
}

void sub_240B01430(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_240B0143C()
{
  sub_240B01908();
  return sub_240B0E874();
}

uint64_t sub_240B01464()
{
  sub_240B01908();
  return sub_240B0E880();
}

uint64_t LSKStatusOptions.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v10[2];
  char v11;
  char v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435B8D8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B01908();
  sub_240B0E868();
  v12 = 0;
  sub_240B0194C();
  sub_240B0E7C0();
  if (!v2)
  {
    v10[1] = v8;
    v11 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25435BC10);
    sub_240B01A18(&qword_25435B8B8, (uint64_t (*)(void))sub_240B01990, MEMORY[0x24BEE12A0]);
    sub_240B0E7C0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t LSKStatusOptions.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_240B0E838();
  sub_240B0E844();
  sub_240B0E844();
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = v1 + 32;
    do
    {
      ++v3;
      sub_240B0E844();
      --v2;
    }
    while (v2);
  }
  return sub_240B0E850();
}

uint64_t LSKStatusOptions.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[2];
  char v11;
  char v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435B820);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B01908();
  sub_240B0E85C();
  if (!v2)
  {
    v12 = 0;
    sub_240B019D4();
    sub_240B0E778();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25435BC10);
    v11 = 1;
    sub_240B01A18(&qword_25435B808, (uint64_t (*)(void))sub_240B01A80, MEMORY[0x24BEE12D0]);
    sub_240B0E778();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_240B017FC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return LSKStatusOptions.init(from:)(a1, a2);
}

uint64_t sub_240B01810(_QWORD *a1)
{
  return LSKStatusOptions.encode(to:)(a1);
}

uint64_t sub_240B01830()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_240B0E838();
  sub_240B0E844();
  v2 = *(_QWORD *)(v1 + 16);
  sub_240B0E844();
  if (v2)
  {
    v3 = v1 + 32;
    do
    {
      ++v3;
      sub_240B0E844();
      --v2;
    }
    while (v2);
  }
  return sub_240B0E850();
}

BOOL _s14LocalStatusKit16LSKStatusOptionsV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  BOOL v13;
  _BOOL8 result;

  v2 = *a1;
  v3 = *a2;
  v4 = *(_QWORD *)(*a1 + 16);
  if (v4 != *(_QWORD *)(*a2 + 16))
    return 0;
  if (!v4 || v2 == v3)
    return 1;
  v5 = (unsigned __int8 *)(v2 + 32);
  v6 = (unsigned __int8 *)(v3 + 32);
  v7 = v4 - 1;
  do
  {
    v9 = *v5++;
    v8 = v9;
    v11 = *v6++;
    v10 = v11;
    v13 = v7-- != 0;
    result = v8 == v10;
  }
  while (v8 == v10 && v13);
  return result;
}

unint64_t sub_240B01908()
{
  unint64_t result;

  result = qword_25435BAB0;
  if (!qword_25435BAB0)
  {
    result = MEMORY[0x2426893C4](&unk_240B10608, &type metadata for LSKStatusOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BAB0);
  }
  return result;
}

unint64_t sub_240B0194C()
{
  unint64_t result;

  result = qword_25435B888;
  if (!qword_25435B888)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for LSKStatusOptions.Scope, &type metadata for LSKStatusOptions.Scope);
    atomic_store(result, (unint64_t *)&qword_25435B888);
  }
  return result;
}

unint64_t sub_240B01990()
{
  unint64_t result;

  result = qword_25435B880;
  if (!qword_25435B880)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for LSKStatusOptions.DeviceType, &type metadata for LSKStatusOptions.DeviceType);
    atomic_store(result, (unint64_t *)&qword_25435B880);
  }
  return result;
}

unint64_t sub_240B019D4()
{
  unint64_t result;

  result = qword_25435B7D8;
  if (!qword_25435B7D8)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for LSKStatusOptions.Scope, &type metadata for LSKStatusOptions.Scope);
    atomic_store(result, (unint64_t *)&qword_25435B7D8);
  }
  return result;
}

uint64_t sub_240B01A18(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25435BC10);
    v8 = a2();
    result = MEMORY[0x2426893C4](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_240B01A80()
{
  unint64_t result;

  result = qword_25435B7D0;
  if (!qword_25435B7D0)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for LSKStatusOptions.DeviceType, &type metadata for LSKStatusOptions.DeviceType);
    atomic_store(result, (unint64_t *)&qword_25435B7D0);
  }
  return result;
}

unint64_t sub_240B01AC8()
{
  unint64_t result;

  result = qword_257083928;
  if (!qword_257083928)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for LSKStatusOptions.DeviceType, &type metadata for LSKStatusOptions.DeviceType);
    atomic_store(result, (unint64_t *)&qword_257083928);
  }
  return result;
}

unint64_t sub_240B01B10()
{
  unint64_t result;

  result = qword_257083930;
  if (!qword_257083930)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for LSKStatusOptions.Scope, &type metadata for LSKStatusOptions.Scope);
    atomic_store(result, (unint64_t *)&qword_257083930);
  }
  return result;
}

unint64_t sub_240B01B58()
{
  unint64_t result;

  result = qword_257083938;
  if (!qword_257083938)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for LSKStatusOptions, &type metadata for LSKStatusOptions);
    atomic_store(result, (unint64_t *)&qword_257083938);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for LSKStatusOptions(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LSKStatusOptions()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for LSKStatusOptions(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *assignWithTake for LSKStatusOptions(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LSKStatusOptions(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 8))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LSKStatusOptions(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 8) = 1;
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
    *(_BYTE *)(result + 8) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LSKStatusOptions()
{
  return &type metadata for LSKStatusOptions;
}

ValueMetadata *type metadata accessor for LSKStatusOptions.DeviceType()
{
  return &type metadata for LSKStatusOptions.DeviceType;
}

ValueMetadata *type metadata accessor for LSKStatusOptions.Scope()
{
  return &type metadata for LSKStatusOptions.Scope;
}

uint64_t storeEnumTagSinglePayload for LSKStatusOptions.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_240B01D54 + 4 * byte_240B0FFB5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_240B01D88 + 4 * byte_240B0FFB0[v4]))();
}

uint64_t sub_240B01D88(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B01D90(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240B01D98);
  return result;
}

uint64_t sub_240B01DA4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240B01DACLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_240B01DB0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B01DB8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LSKStatusOptions.CodingKeys()
{
  return &type metadata for LSKStatusOptions.CodingKeys;
}

uint64_t _s14LocalStatusKit16LSKStatusOptionsV5ScopeOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_240B01E14 + 4 * byte_240B0FFBA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_240B01E34 + 4 * byte_240B0FFBF[v4]))();
}

_BYTE *sub_240B01E14(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_240B01E34(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_240B01E3C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_240B01E44(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_240B01E4C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_240B01E54(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for LSKStatusOptions.Scope.CodingKeys()
{
  return &type metadata for LSKStatusOptions.Scope.CodingKeys;
}

ValueMetadata *type metadata accessor for LSKStatusOptions.Scope.SameAccountCodingKeys()
{
  return &type metadata for LSKStatusOptions.Scope.SameAccountCodingKeys;
}

uint64_t _s14LocalStatusKit16LSKStatusOptionsV10DeviceTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_240B01ECC + 4 * byte_240B0FFC9[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_240B01F00 + 4 * byte_240B0FFC4[v4]))();
}

uint64_t sub_240B01F00(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B01F08(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240B01F10);
  return result;
}

uint64_t sub_240B01F1C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240B01F24);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_240B01F28(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B01F30(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LSKStatusOptions.DeviceType.CodingKeys()
{
  return &type metadata for LSKStatusOptions.DeviceType.CodingKeys;
}

ValueMetadata *type metadata accessor for LSKStatusOptions.DeviceType.N301CodingKeys()
{
  return &type metadata for LSKStatusOptions.DeviceType.N301CodingKeys;
}

ValueMetadata *type metadata accessor for LSKStatusOptions.DeviceType.MacCodingKeys()
{
  return &type metadata for LSKStatusOptions.DeviceType.MacCodingKeys;
}

ValueMetadata *type metadata accessor for LSKStatusOptions.DeviceType.TvCodingKeys()
{
  return &type metadata for LSKStatusOptions.DeviceType.TvCodingKeys;
}

unint64_t sub_240B01F80()
{
  unint64_t result;

  result = qword_257083940;
  if (!qword_257083940)
  {
    result = MEMORY[0x2426893C4](&unk_240B10420, &type metadata for LSKStatusOptions.DeviceType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083940);
  }
  return result;
}

unint64_t sub_240B01FC8()
{
  unint64_t result;

  result = qword_257083948;
  if (!qword_257083948)
  {
    result = MEMORY[0x2426893C4](&unk_240B10528, &type metadata for LSKStatusOptions.Scope.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083948);
  }
  return result;
}

unint64_t sub_240B02010()
{
  unint64_t result;

  result = qword_257083950;
  if (!qword_257083950)
  {
    result = MEMORY[0x2426893C4](&unk_240B105E0, &type metadata for LSKStatusOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083950);
  }
  return result;
}

unint64_t sub_240B02058()
{
  unint64_t result;

  result = qword_25435BAC0;
  if (!qword_25435BAC0)
  {
    result = MEMORY[0x2426893C4](&unk_240B10550, &type metadata for LSKStatusOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BAC0);
  }
  return result;
}

unint64_t sub_240B020A0()
{
  unint64_t result;

  result = qword_25435BAB8;
  if (!qword_25435BAB8)
  {
    result = MEMORY[0x2426893C4](&unk_240B10578, &type metadata for LSKStatusOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BAB8);
  }
  return result;
}

unint64_t sub_240B020E8()
{
  unint64_t result;

  result = qword_25435BB30;
  if (!qword_25435BB30)
  {
    result = MEMORY[0x2426893C4](&unk_240B10448, &type metadata for LSKStatusOptions.Scope.SameAccountCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BB30);
  }
  return result;
}

unint64_t sub_240B02130()
{
  unint64_t result;

  result = qword_25435BB28;
  if (!qword_25435BB28)
  {
    result = MEMORY[0x2426893C4](&unk_240B10470, &type metadata for LSKStatusOptions.Scope.SameAccountCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BB28);
  }
  return result;
}

unint64_t sub_240B02178()
{
  unint64_t result;

  result = qword_25435BB18;
  if (!qword_25435BB18)
  {
    result = MEMORY[0x2426893C4](&unk_240B10498, &type metadata for LSKStatusOptions.Scope.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BB18);
  }
  return result;
}

unint64_t sub_240B021C0()
{
  unint64_t result;

  result = qword_25435BB10;
  if (!qword_25435BB10)
  {
    result = MEMORY[0x2426893C4](&unk_240B104C0, &type metadata for LSKStatusOptions.Scope.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BB10);
  }
  return result;
}

unint64_t sub_240B02208()
{
  unint64_t result;

  result = qword_25435BB00;
  if (!qword_25435BB00)
  {
    result = MEMORY[0x2426893C4](&unk_240B10340, &type metadata for LSKStatusOptions.DeviceType.N301CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BB00);
  }
  return result;
}

unint64_t sub_240B02250()
{
  unint64_t result;

  result = qword_25435BAF8;
  if (!qword_25435BAF8)
  {
    result = MEMORY[0x2426893C4](&unk_240B10368, &type metadata for LSKStatusOptions.DeviceType.N301CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BAF8);
  }
  return result;
}

unint64_t sub_240B02298()
{
  unint64_t result;

  result = qword_25435BAF0;
  if (!qword_25435BAF0)
  {
    result = MEMORY[0x2426893C4](&unk_240B102F0, &type metadata for LSKStatusOptions.DeviceType.MacCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BAF0);
  }
  return result;
}

unint64_t sub_240B022E0()
{
  unint64_t result;

  result = qword_25435BAE8;
  if (!qword_25435BAE8)
  {
    result = MEMORY[0x2426893C4](&unk_240B10318, &type metadata for LSKStatusOptions.DeviceType.MacCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BAE8);
  }
  return result;
}

unint64_t sub_240B02328()
{
  unint64_t result;

  result = qword_25435B910;
  if (!qword_25435B910)
  {
    result = MEMORY[0x2426893C4](&unk_240B102A0, &type metadata for LSKStatusOptions.DeviceType.TvCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435B910);
  }
  return result;
}

unint64_t sub_240B02370()
{
  unint64_t result;

  result = qword_25435B918;
  if (!qword_25435B918)
  {
    result = MEMORY[0x2426893C4](&unk_240B102C8, &type metadata for LSKStatusOptions.DeviceType.TvCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435B918);
  }
  return result;
}

unint64_t sub_240B023B8()
{
  unint64_t result;

  result = qword_25435BAD8;
  if (!qword_25435BAD8)
  {
    result = MEMORY[0x2426893C4](&unk_240B10390, &type metadata for LSKStatusOptions.DeviceType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BAD8);
  }
  return result;
}

unint64_t sub_240B02400()
{
  unint64_t result;

  result = qword_25435BAD0;
  if (!qword_25435BAD0)
  {
    result = MEMORY[0x2426893C4](&unk_240B103B8, &type metadata for LSKStatusOptions.DeviceType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BAD0);
  }
  return result;
}

uint64_t sub_240B02444(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 825242478 && a2 == 0xE400000000000000;
  if (v2 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 6513005 && a2 == 0xE300000000000000 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 30324 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_240B0E7F0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_240B02560(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x65706F6373 && a2 == 0xE500000000000000;
  if (v2 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000240B11DF0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_240B0E7F0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_240B0264C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_240B0E49C();
  __swift_allocate_value_buffer(v0, qword_257083958);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_257083958);
  if (qword_25435B7F8 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_25435B798);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

unint64_t static LSKLocalStatusClient.xpcMachServiceName.getter()
{
  return 0xD000000000000019;
}

uint64_t LSKLocalStatusClient.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  LSKLocalStatusClient.init()();
  return v0;
}

uint64_t LSKLocalStatusClient.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[2];

  v0 = sub_240B0E64C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_240B0E640();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v4);
  v6 = sub_240B0E4FC();
  MEMORY[0x24BDAC7A8](v6);
  sub_240B0294C();
  sub_240B0E4F0();
  v11[1] = MEMORY[0x24BEE4AF8];
  sub_240AFFB40(&qword_25435B9D0, v5, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25435B9C0);
  sub_240AFBF00(&qword_25435B9C8, &qword_25435B9C0, MEMORY[0x24BEE12C8]);
  sub_240B0E6A0();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v0);
  v7 = (void *)sub_240B0E658();
  v8 = v11[0];
  *(_QWORD *)(v11[0] + 16) = v7;
  sub_240B0E4CC();
  v9 = v7;
  *(_QWORD *)(v8 + 24) = sub_240B0E4B4();
  swift_retain();
  sub_240B0E4C0();
  swift_release();
  return v8;
}

unint64_t sub_240B0294C()
{
  unint64_t result;

  result = qword_25435B9D8[0];
  if (!qword_25435B9D8[0])
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, qword_25435B9D8);
  }
  return result;
}

void LSKLocalStatusClient.publish<A>(_:for:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  _QWORD *v10;

  v10[18] = a9;
  v10[19] = v9;
  v10[16] = a7;
  v10[17] = a8;
  v10[14] = a3;
  v10[15] = a6;
  v10[12] = a1;
  v10[13] = a2;
  v10[20] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25435BBF8);
  v10[8] = a6;
  v10[9] = a7;
  v10[10] = a8;
  v10[11] = a9;
  type metadata accessor for LSKPublishedStatus();
}

uint64_t sub_240B02A00(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v3 + 168) = a1;
  *(_QWORD *)(v3 + 176) = sub_240AFBF00(&qword_25435B8A8, v2, MEMORY[0x24BE8FCF0]);
  v7 = sub_240B0E7D8();
  *(_QWORD *)(v3 + 184) = v7;
  *(_QWORD *)(v3 + 192) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v3 + 200) = swift_task_alloc();
  *(_QWORD *)(v3 + 208) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25435BC00);
  *(_QWORD *)(v3 + 216) = swift_task_alloc();
  *(_QWORD *)(v3 + 224) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 232) = swift_task_alloc();
  *(_QWORD *)(v3 + 240) = swift_task_alloc();
  *(_QWORD *)(v3 + 248) = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v3 + 256) = swift_task_alloc();
  *(_QWORD *)(v3 + 264) = type metadata accessor for PublishStatusInvocation.Response(0);
  v8 = swift_task_alloc();
  *(_BYTE *)(v3 + 344) = *(_BYTE *)v1;
  v9 = *(_QWORD *)(v1 + 8);
  v10 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v3 + 272) = v8;
  *(_QWORD *)(v3 + 280) = v9;
  v11 = *v5;
  *(_QWORD *)(v3 + 288) = v10;
  *(_QWORD *)(v3 + 296) = v11;
  return swift_task_switch();
}

uint64_t sub_240B02B3C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v16;
  _BYTE v17[8];
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;

  sub_240B0E370();
  swift_allocObject();
  sub_240B0E364();
  v1 = sub_240B0E358();
  *(_QWORD *)(v0 + 304) = v1;
  *(_QWORD *)(v0 + 312) = v2;
  v3 = v1;
  v4 = v2;
  v5 = *(_QWORD *)(v0 + 288);
  v6 = *(_QWORD *)(v0 + 280);
  v7 = *(_BYTE *)(v0 + 344);
  v16 = *(_QWORD *)(v0 + 296);
  v9 = *(_QWORD *)(v0 + 128);
  v8 = *(_QWORD *)(v0 + 136);
  v10 = *(_QWORD *)(v0 + 120);
  swift_release();
  v20 = v7;
  v21 = v6;
  v22 = v5;
  type metadata accessor for LSKKey(0, v10, v9, v8);
  sub_240AF93F4((uint64_t)v17);
  v11 = v17[0];
  v12 = v18;
  v13 = v19;
  *(_QWORD *)(v0 + 320) = v19;
  type metadata accessor for PublishStatusInvocation(0);
  *(_BYTE *)(v0 + 16) = v11;
  *(_QWORD *)(v0 + 24) = v12;
  *(_QWORD *)(v0 + 32) = v13;
  *(_QWORD *)(v0 + 40) = v3;
  *(_QWORD *)(v0 + 48) = v4;
  *(_QWORD *)(v0 + 56) = v16;
  sub_240AFCB50(v3, v4);
  swift_bridgeObjectRetain();
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 328) = v14;
  sub_240AFFB40(&qword_25435B878, type metadata accessor for PublishStatusInvocation, (uint64_t)&protocol conformance descriptor for PublishStatusInvocation);
  *v14 = v0;
  v14[1] = sub_240B02D3C;
  return sub_240B0E4A8();
}

uint64_t sub_240B02D3C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 336) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_240B02DA0()
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
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
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
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;

  v1 = v0[34];
  v2 = v0[32];
  v3 = v0[17];
  v47 = v0[18];
  v48 = v0[42];
  v4 = v0[15];
  v5 = v0[16];
  v6 = *(_QWORD *)(v1 + 8);
  v7 = *(_QWORD *)(v1 + 16);
  v8 = *(_QWORD *)(v1 + 24);
  v9 = *(_QWORD *)(v1 + 32);
  v10 = *(_QWORD *)(v1 + 40);
  LOBYTE(v50) = *(_BYTE *)v1;
  *((_QWORD *)&v50 + 1) = v6;
  v51 = v7;
  v52 = v8;
  v53 = v9;
  v54 = v10;
  swift_bridgeObjectRetain();
  sub_240B032C4(v8, v9);
  swift_bridgeObjectRetain();
  sub_240AFB704(v4, v5, v3, v47, v2);
  if (v48)
  {
    v11 = v0[39];
    v12 = v0[38];
    v13 = v0[34];
    swift_bridgeObjectRelease();
    sub_240AFCB94(v12, v11);
    swift_bridgeObjectRelease();
    sub_240AFCBA8(v12, v11);
    swift_bridgeObjectRelease();
    sub_240AFCB94(v8, v9);
    swift_bridgeObjectRelease();
    sub_240AFCC30(v13, type metadata accessor for PublishStatusInvocation.Response);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v14 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    v16 = v0[33];
    v15 = v0[34];
    v17 = v0[27];
    v18 = v0[28];
    v19 = v0[20];
    swift_bridgeObjectRelease();
    sub_240AFCB94(v8, v9);
    swift_bridgeObjectRelease();
    sub_240B0752C(v15 + *(int *)(v16 + 20), v17, &qword_25435BC00);
    v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v17, 1, v19);
    v21 = v0[39];
    v22 = v0[38];
    v24 = v0[31];
    v23 = v0[32];
    if (v20 == 1)
    {
      v25 = v0[27];
      v26 = v0[21];
      v27 = v0[12];
      sub_240AFCC30(v0[34], type metadata accessor for PublishStatusInvocation.Response);
      sub_240AFCBA8(v22, v21);
      swift_bridgeObjectRelease();
      sub_240AFCB94(v22, v21);
      swift_bridgeObjectRelease();
      sub_240B07570(v25, &qword_25435BC00);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))(v27, v23, v26);
      v28 = 0uLL;
    }
    else
    {
      v29 = v0[29];
      v46 = v0[39];
      v30 = v0[26];
      v45 = v0[25];
      v31 = v0[23];
      v43 = v0[32];
      v44 = v0[24];
      v49 = v0[34];
      v32 = v0[21];
      v33 = v0[20];
      v42 = v0[12];
      v34 = v0[28];
      v40 = *(_OWORD *)(v0 + 17);
      v41 = *(_OWORD *)(v0 + 15);
      v35 = v0[30];
      (*(void (**)(void))(v34 + 32))();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v29, v35, v33);
      v36 = swift_allocObject();
      *(_OWORD *)(v36 + 16) = v41;
      *(_OWORD *)(v36 + 32) = v40;
      sub_240B0E610();
      swift_release();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v42, v43, v32);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 16))(v45, v30, v31);
      v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435B908);
      v38 = MEMORY[0x2426893C4](MEMORY[0x24BEE7090], v31);
      LSKPublishedStatusSequence.init<A>(_:)(v45, v32, v37, v31, v38, &v50);
      swift_bridgeObjectRelease();
      sub_240AFCB94(v22, v46);
      swift_bridgeObjectRelease();
      sub_240AFCBA8(v22, v46);
      (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v30, v31);
      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v33);
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v43, v32);
      sub_240AFCC30(v49, type metadata accessor for PublishStatusInvocation.Response);
      v28 = v50;
    }
    *(_OWORD *)v0[13] = v28;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v14 = (uint64_t (*)(void))v0[1];
  }
  return v14();
}

uint64_t sub_240B031E0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 312);
  v2 = *(_QWORD *)(v0 + 304);
  sub_240AFCBA8(v2, v1);
  swift_bridgeObjectRelease();
  sub_240AFCB94(v2, v1);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for PublishStatusInvocation.Response(uint64_t a1)
{
  return sub_240B04080(a1, (uint64_t *)&unk_25435BAA0);
}

uint64_t type metadata accessor for PublishStatusInvocation(uint64_t a1)
{
  return sub_240B04080(a1, (uint64_t *)&unk_25435B9B0);
}

uint64_t sub_240B032C4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_240AFCB50(a1, a2);
  return a1;
}

uint64_t sub_240B032D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v6 + 32) = a4;
  *(_QWORD *)(v6 + 40) = a5;
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a3;
  *(_BYTE *)(v6 + 96) = *(_BYTE *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(v6 + 48) = a6;
  *(_QWORD *)(v6 + 56) = v7;
  *(_QWORD *)(v6 + 64) = v8;
  *(_OWORD *)(v6 + 72) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(v6 + 88) = *(_QWORD *)(a2 + 40);
  return swift_task_switch();
}

uint64_t sub_240B03318()
{
  return swift_deallocObject();
}

uint64_t sub_240B03328(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v6 = v2[2];
  v7 = v2[3];
  v9 = v2[4];
  v8 = v2[5];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v10;
  *v10 = v3;
  v10[1] = sub_240B0763C;
  return sub_240B032D8(a1, a2, v6, v7, v9, v8);
}

void LSKLocalStatusClient.status<A>(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;

  v8[17] = a7;
  v8[18] = v7;
  v8[15] = a5;
  v8[16] = a6;
  v8[13] = a2;
  v8[14] = a4;
  v8[12] = a1;
  v8[19] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25435BBF8);
  v8[2] = a4;
  v8[3] = a5;
  v8[4] = a6;
  v8[5] = a7;
  type metadata accessor for LSKPublishedStatus();
}

uint64_t sub_240B0341C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v3 + 160) = a1;
  *(_QWORD *)(v3 + 168) = sub_240AFBF00(&qword_25435B8A8, v1, MEMORY[0x24BE8FCF0]);
  v6 = sub_240B0E7D8();
  *(_QWORD *)(v3 + 176) = v6;
  *(_QWORD *)(v3 + 184) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v3 + 192) = swift_task_alloc();
  *(_QWORD *)(v3 + 200) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25435BC00);
  *(_QWORD *)(v3 + 208) = swift_task_alloc();
  *(_QWORD *)(v3 + 216) = *(_QWORD *)(v2 - 8);
  *(_QWORD *)(v3 + 224) = swift_task_alloc();
  *(_QWORD *)(v3 + 232) = swift_task_alloc();
  *(_QWORD *)(v3 + 240) = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v3 + 248) = swift_task_alloc();
  *(_QWORD *)(v3 + 256) = type metadata accessor for LocalStatusInvocation.Response(0);
  v7 = swift_task_alloc();
  *(_BYTE *)(v3 + 312) = *(_BYTE *)v4;
  v8 = *(_QWORD *)(v4 + 8);
  v9 = *(_QWORD *)(v4 + 16);
  *(_QWORD *)(v3 + 264) = v7;
  *(_QWORD *)(v3 + 272) = v8;
  *(_QWORD *)(v3 + 280) = v9;
  return swift_task_switch();
}

uint64_t sub_240B03550()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = *(_QWORD *)(v0 + 120);
  v1 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 112);
  type metadata accessor for LocalStatusInvocation(0);
  type metadata accessor for LSKKey(0, v3, v2, v1);
  sub_240AF93F4(v0 + 48);
  v4 = *(_QWORD *)(v0 + 56);
  v5 = *(_QWORD *)(v0 + 64);
  *(_BYTE *)(v0 + 72) = *(_BYTE *)(v0 + 48);
  *(_QWORD *)(v0 + 288) = v5;
  *(_QWORD *)(v0 + 80) = v4;
  *(_QWORD *)(v0 + 88) = v5;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 296) = v6;
  sub_240AFFB40(&qword_257083990, type metadata accessor for LocalStatusInvocation, (uint64_t)&protocol conformance descriptor for LocalStatusInvocation);
  *v6 = v0;
  v6[1] = sub_240B0365C;
  return sub_240B0E4A8();
}

uint64_t sub_240B0365C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 304) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_240B036D0()
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
  uint64_t (*v12)(void);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;

  v1 = v0[38];
  v2 = v0[33];
  v3 = v0[31];
  v4 = v0[16];
  v5 = v0[17];
  v6 = v0[14];
  v7 = v0[15];
  v8 = *(_QWORD *)(v2 + 8);
  v9 = *(_QWORD *)(v2 + 16);
  v10 = *(_QWORD *)(v2 + 40);
  LOBYTE(v42) = *(_BYTE *)v2;
  *((_QWORD *)&v42 + 1) = v8;
  v43 = v9;
  v44 = *(_OWORD *)(v2 + 24);
  v45 = v10;
  sub_240AFB704(v6, v7, v4, v5, v3);
  v11 = v0[33];
  if (v1)
  {
    sub_240AFCC30(v11, type metadata accessor for LocalStatusInvocation.Response);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v12 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    v13 = v0[26];
    v14 = v0[27];
    v15 = v0[19];
    sub_240B0752C(v11 + *(int *)(v0[32] + 20), v13, &qword_25435BC00);
    v16 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v13, 1, v15);
    v17 = v0[30];
    v18 = v0[31];
    if (v16 == 1)
    {
      v19 = v0[26];
      v20 = v0[20];
      v21 = v0[12];
      sub_240AFCC30(v0[33], type metadata accessor for LocalStatusInvocation.Response);
      sub_240B07570(v19, &qword_25435BC00);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v21, v18, v20);
      v22 = 0uLL;
    }
    else
    {
      v23 = v0[28];
      v24 = v0[29];
      v25 = v0[27];
      v26 = v0[25];
      v38 = v0[30];
      v39 = v0[31];
      v40 = v0[24];
      v28 = v0[22];
      v27 = v0[23];
      v29 = v0[20];
      v30 = v0[19];
      v37 = v0[12];
      v41 = v0[33];
      v35 = *((_OWORD *)v0 + 8);
      v36 = *((_OWORD *)v0 + 7);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v25 + 32))(v24, v0[26], v30);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v23, v24, v30);
      v31 = swift_allocObject();
      *(_OWORD *)(v31 + 16) = v36;
      *(_OWORD *)(v31 + 32) = v35;
      sub_240B0E610();
      swift_release();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v37, v39, v29);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v40, v26, v28);
      v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435B908);
      v33 = MEMORY[0x2426893C4](MEMORY[0x24BEE7090], v28);
      LSKPublishedStatusSequence.init<A>(_:)(v40, v29, v32, v28, v33, &v42);
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v30);
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v39, v29);
      sub_240AFCC30(v41, type metadata accessor for LocalStatusInvocation.Response);
      v22 = v42;
    }
    *(_OWORD *)v0[13] = v22;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v12 = (uint64_t (*)(void))v0[1];
  }
  return v12();
}

uint64_t sub_240B03A00()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for LocalStatusInvocation.Response(uint64_t a1)
{
  return sub_240B04080(a1, (uint64_t *)&unk_2570839E8);
}

uint64_t type metadata accessor for LocalStatusInvocation(uint64_t a1)
{
  return sub_240B04080(a1, (uint64_t *)&unk_25435B7C0);
}

uint64_t sub_240B03AB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v6 + 32) = a4;
  *(_QWORD *)(v6 + 40) = a5;
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a3;
  *(_BYTE *)(v6 + 96) = *(_BYTE *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(v6 + 48) = a6;
  *(_QWORD *)(v6 + 56) = v7;
  *(_QWORD *)(v6 + 64) = v8;
  *(_OWORD *)(v6 + 72) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(v6 + 88) = *(_QWORD *)(a2 + 40);
  return swift_task_switch();
}

uint64_t sub_240B03AF4()
{
  uint64_t v0;

  sub_240AFB704(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_240B03B70()
{
  return swift_deallocObject();
}

uint64_t sub_240B03B80(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v6 = v2[2];
  v7 = v2[3];
  v9 = v2[4];
  v8 = v2[5];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v10;
  *v10 = v3;
  v10[1] = sub_240AF7F94;
  return sub_240B03AB4(a1, a2, v6, v7, v9, v8);
}

uint64_t LSKLocalStatusClient.subscribe<A>(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)(v6 + 64) = a5;
  *(_QWORD *)(v6 + 72) = v5;
  *(_QWORD *)(v6 + 48) = a3;
  *(_QWORD *)(v6 + 56) = a4;
  *(_QWORD *)(v6 + 40) = a1;
  v11 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25435B778);
  *(_QWORD *)(v6 + 80) = v11;
  type metadata accessor for LSKLocalStatusObservation(255, a3, a4, a5);
  *(_QWORD *)(v6 + 88) = sub_240B0E5D4();
  *(_QWORD *)(v6 + 96) = sub_240AFBF00(&qword_25435B6B8, &qword_25435B778, MEMORY[0x24BE8FCF0]);
  v12 = sub_240B0E718();
  *(_QWORD *)(v6 + 104) = v12;
  *(_QWORD *)(v6 + 112) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v6 + 120) = swift_task_alloc();
  *(_QWORD *)(v6 + 128) = swift_task_alloc();
  *(_QWORD *)(v6 + 136) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v6 + 144) = swift_task_alloc();
  v13 = swift_task_alloc();
  *(_BYTE *)(v6 + 200) = *(_BYTE *)a2;
  v14 = *(_QWORD *)(a2 + 8);
  v15 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(v6 + 152) = v13;
  *(_QWORD *)(v6 + 160) = v14;
  *(_QWORD *)(v6 + 168) = v15;
  return swift_task_switch();
}

uint64_t sub_240B03D3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _BYTE v11[8];
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;

  v2 = *(_QWORD *)(v0 + 160);
  v1 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 48);
  v5 = *(_QWORD *)(v0 + 56);
  v14 = *(_BYTE *)(v0 + 200);
  v15 = v2;
  v16 = v1;
  type metadata accessor for LSKKey(0, v4, v5, v3);
  sub_240AF93F4((uint64_t)v11);
  v6 = v11[0];
  v7 = v12;
  v8 = v13;
  *(_QWORD *)(v0 + 176) = v13;
  type metadata accessor for SubscribeStatusInvocation(0);
  *(_BYTE *)(v0 + 16) = v6;
  *(_QWORD *)(v0 + 24) = v7;
  *(_QWORD *)(v0 + 32) = v8;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 184) = v9;
  sub_240AFFB40(qword_25435B630, type metadata accessor for SubscribeStatusInvocation, (uint64_t)&protocol conformance descriptor for SubscribeStatusInvocation);
  *v9 = v0;
  v9[1] = sub_240B03E28;
  return sub_240B0E4A8();
}

uint64_t sub_240B03E28()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 192) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_240B03E94()
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
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 104);
  v12 = *(_QWORD *)(v0 + 112);
  v13 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 88);
  v5 = *(_QWORD *)(v0 + 80);
  v6 = *(_QWORD *)(v0 + 64);
  v14 = *(_QWORD **)(v0 + 40);
  v15 = *(_QWORD *)(v0 + 136);
  v11 = *(_OWORD *)(v0 + 48);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v15 + 16))(*(_QWORD *)(v0 + 144), v1, v5);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = v11;
  *(_QWORD *)(v7 + 32) = v6;
  sub_240B0E604();
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v13, v2, v3);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435B908);
  v9 = MEMORY[0x2426893C4](MEMORY[0x24BEE6F08], v3);
  LSKObservationsSequence.init<A>(_:)(v13, v4, v8, v3, v9, v14);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v2, v3);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v1, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_240B04008()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for SubscribeStatusInvocation(uint64_t a1)
{
  return sub_240B04080(a1, qword_25435B920);
}

uint64_t sub_240B04080(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_240B040B4(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a1;
  v5[4] = a3;
  v5[7] = *a2;
  return swift_task_switch();
}

uint64_t sub_240B040D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  _QWORD *v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  v4 = *(uint64_t **)(v0 + 24);
  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 56);
  v5 = (_QWORD *)swift_task_alloc();
  v5[2] = v3;
  v5[3] = v2;
  v5[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25435B6C0);
  type metadata accessor for LSKLocalStatusObservation(0, v3, v2, v1);
  sub_240AFBF00(&qword_25435B6C8, &qword_25435B6C0, MEMORY[0x24BEE12C8]);
  v6 = sub_240B0E598();
  swift_task_dealloc();
  *v4 = v6;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_240B041BC()
{
  return swift_deallocObject();
}

uint64_t sub_240B041CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v6 = *(_QWORD *)(v2 + 32);
  v7 = swift_task_alloc();
  v8 = *(_OWORD *)(v2 + 16);
  *(_QWORD *)(v3 + 16) = v7;
  *(_QWORD *)v7 = v3;
  *(_QWORD *)(v7 + 8) = sub_240AF7F94;
  *(_OWORD *)(v7 + 32) = v8;
  *(_QWORD *)(v7 + 24) = a1;
  v9 = *a2;
  *(_QWORD *)(v7 + 48) = v6;
  *(_QWORD *)(v7 + 56) = v9;
  return swift_task_switch();
}

uint64_t sub_240B0424C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v32 = a5;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083A20);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for LSKLocalStatusObservation(0, a2, a3, a4);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v28 - v15;
  sub_240B0C204(a2, a3, a4, (char *)&v28 - v15);
  if (v5)
  {
    v30 = v14;
    v31 = v13;
    if (qword_257083698 != -1)
      swift_once();
    v17 = sub_240B0E49C();
    __swift_project_value_buffer(v17, (uint64_t)qword_257083958);
    sub_240B0752C(a1, (uint64_t)v12, &qword_257083A20);
    v18 = sub_240B0E484();
    v19 = sub_240B0E634();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = swift_slowAlloc();
      v29 = swift_slowAlloc();
      v34 = v29;
      *(_DWORD *)v20 = 136315394;
      v21 = sub_240B06A88();
      v33 = sub_240B06C78(v21, v22, &v34);
      sub_240B0E670();
      swift_bridgeObjectRelease();
      sub_240B07570((uint64_t)v12, &qword_257083A20);
      *(_WORD *)(v20 + 12) = 2080;
      v23 = sub_240B0E88C();
      v33 = sub_240B06C78(v23, v24, &v34);
      sub_240B0E670();
      swift_bridgeObjectRelease();
      v25 = v29;
      swift_arrayDestroy();
      MEMORY[0x242689454](v25, -1, -1);
      MEMORY[0x242689454](v20, -1, -1);
      MEMORY[0x24268931C](v5);
    }
    else
    {
      MEMORY[0x24268931C](v5);
      sub_240B07570((uint64_t)v12, &qword_257083A20);
    }

    v26 = 1;
    v14 = v30;
    v13 = v31;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v32, v16, v13);
    v26 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v32, v26, 1, v13);
}

uint64_t LSKLocalStatusClient.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t LSKLocalStatusClient.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_240B04598()
{
  return 1;
}

uint64_t static PublishStatusInvocation.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t PublishStatusInvocation.Parameters.key.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 8);
  v2 = *(_QWORD *)(v1 + 16);
  *(_BYTE *)a1 = *(_BYTE *)v1;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v2;
  return swift_bridgeObjectRetain();
}

uint64_t PublishStatusInvocation.Parameters.payload.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  sub_240B032C4(v1, *(_QWORD *)(v0 + 32));
  return v1;
}

uint64_t PublishStatusInvocation.Parameters.options.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 40);
  return swift_bridgeObjectRetain();
}

uint64_t sub_240B045F8()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x64616F6C796170;
  if (*v0 != 1)
    v1 = 0x736E6F6974706FLL;
  if (*v0)
    return v1;
  else
    return 7955819;
}

uint64_t sub_240B0464C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_240B072B8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_240B04670()
{
  sub_240B0489C();
  return sub_240B0E874();
}

uint64_t sub_240B04698()
{
  sub_240B0489C();
  return sub_240B0E880();
}

uint64_t PublishStatusInvocation.Parameters.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  char v23;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435B8D0);
  v18 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v1;
  v8 = *((_QWORD *)v1 + 1);
  v7 = *((_QWORD *)v1 + 2);
  v9 = *((_QWORD *)v1 + 3);
  v16 = *((_QWORD *)v1 + 4);
  v17 = v9;
  v15 = *((_QWORD *)v1 + 5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B0489C();
  v10 = v3;
  sub_240B0E868();
  LOBYTE(v20) = v6;
  v21 = v8;
  v22 = v7;
  v23 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25435BBD8);
  sub_240AFBF00(&qword_25435B8A0, &qword_25435BBD8, (uint64_t)&protocol conformance descriptor for LSKKey<A>);
  v11 = v19;
  sub_240B0E7C0();
  if (v11)
    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v5, v3);
  v13 = v18;
  v14 = v15;
  v20 = v17;
  v21 = v16;
  v23 = 1;
  sub_240B048E0();
  sub_240B0E7A8();
  v20 = v14;
  v23 = 2;
  sub_240B04924();
  sub_240B0E7C0();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v5, v10);
}

unint64_t sub_240B0489C()
{
  unint64_t result;

  result = qword_25435BA68;
  if (!qword_25435BA68)
  {
    result = MEMORY[0x2426893C4](&unk_240B10E00, &type metadata for PublishStatusInvocation.Parameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BA68);
  }
  return result;
}

unint64_t sub_240B048E0()
{
  unint64_t result;

  result = qword_25435B860;
  if (!qword_25435B860)
  {
    result = MEMORY[0x2426893C4](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_25435B860);
  }
  return result;
}

unint64_t sub_240B04924()
{
  unint64_t result;

  result = qword_25435B890;
  if (!qword_25435B890)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for LSKStatusOptions, &type metadata for LSKStatusOptions);
    atomic_store(result, (unint64_t *)&qword_25435B890);
  }
  return result;
}

uint64_t PublishStatusInvocation.Parameters.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  char v21;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435B818);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B0489C();
  sub_240B0E85C();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25435BBD8);
  v21 = 0;
  sub_240AFBF00(&qword_25435B7F0, &qword_25435BBD8, (uint64_t)&protocol conformance descriptor for LSKKey<A>);
  sub_240B0E778();
  v20 = v17;
  v9 = v19;
  v16 = v18;
  v21 = 1;
  sub_240B04C30();
  swift_bridgeObjectRetain();
  sub_240B0E760();
  v21 = 2;
  v14 = v18;
  v15 = v17;
  sub_240B032C4(v17, v18);
  sub_240B04C74();
  sub_240B0E778();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v10 = v17;
  swift_bridgeObjectRetain();
  v12 = v14;
  v11 = v15;
  sub_240B032C4(v15, v14);
  swift_bridgeObjectRetain();
  sub_240AFCB94(v11, v12);
  swift_bridgeObjectRelease();
  *(_BYTE *)a2 = v20;
  *(_QWORD *)(a2 + 8) = v16;
  *(_QWORD *)(a2 + 16) = v9;
  *(_QWORD *)(a2 + 24) = v11;
  *(_QWORD *)(a2 + 32) = v12;
  *(_QWORD *)(a2 + 40) = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  sub_240AFCB94(v11, v12);
  return swift_bridgeObjectRelease();
}

unint64_t sub_240B04C30()
{
  unint64_t result;

  result = qword_25435B7B0;
  if (!qword_25435B7B0)
  {
    result = MEMORY[0x2426893C4](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_25435B7B0);
  }
  return result;
}

unint64_t sub_240B04C74()
{
  unint64_t result;

  result = qword_25435B7E0;
  if (!qword_25435B7E0)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for LSKStatusOptions, &type metadata for LSKStatusOptions);
    atomic_store(result, (unint64_t *)&qword_25435B7E0);
  }
  return result;
}

uint64_t sub_240B04CB8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return PublishStatusInvocation.Parameters.init(from:)(a1, a2);
}

uint64_t sub_240B04CCC(_QWORD *a1)
{
  return PublishStatusInvocation.Parameters.encode(to:)(a1);
}

uint64_t PublishStatusInvocation.Response.initialStatus.getter@<X0>(uint64_t a1@<X8>)
{
  char *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v2 = *v1;
  v4 = *((_QWORD *)v1 + 1);
  v3 = *((_QWORD *)v1 + 2);
  v5 = *((_QWORD *)v1 + 3);
  v6 = *((_QWORD *)v1 + 4);
  v7 = *((_QWORD *)v1 + 5);
  *(_BYTE *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  swift_bridgeObjectRetain();
  sub_240B032C4(v5, v6);
  return swift_bridgeObjectRetain();
}

uint64_t PublishStatusInvocation.Response.updates.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for PublishStatusInvocation.Response(0);
  return sub_240B0752C(v1 + *(int *)(v3 + 20), a1, &qword_25435BC00);
}

uint64_t PublishStatusInvocation.Response.init(initialStatus:updates:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_240B04FFC(a1, a2, type metadata accessor for PublishStatusInvocation.Response, a3);
}

uint64_t sub_240B04D7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435BC00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_240B04DC4()
{
  _BYTE *v0;

  if (*v0)
    return 0x73657461647075;
  else
    return 0x536C616974696E69;
}

uint64_t sub_240B04E0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_240B073FC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_240B04E30()
{
  sub_240B04EB4();
  return sub_240B0E874();
}

uint64_t sub_240B04E58()
{
  sub_240B04EB4();
  return sub_240B0E880();
}

uint64_t PublishStatusInvocation.Response.encode(to:)(_QWORD *a1)
{
  return sub_240B050D4(a1, &qword_25435B850, (void (*)(void))sub_240B04EB4, (uint64_t)&type metadata for PublishStatusInvocation.Response.CodingKeys, (void (*)(_QWORD))type metadata accessor for PublishStatusInvocation.Response);
}

unint64_t sub_240B04EB4()
{
  unint64_t result;

  result = qword_25435BA80;
  if (!qword_25435BA80)
  {
    result = MEMORY[0x2426893C4](&unk_240B10DB0, &type metadata for PublishStatusInvocation.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BA80);
  }
  return result;
}

uint64_t PublishStatusInvocation.Response.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_240B05310(a1, &qword_25435B8C8, type metadata accessor for PublishStatusInvocation.Response, (void (*)(void))sub_240B04EB4, a2);
}

uint64_t sub_240B04F2C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return PublishStatusInvocation.Response.init(from:)(a1, a2);
}

uint64_t sub_240B04F40(_QWORD *a1)
{
  return PublishStatusInvocation.Response.encode(to:)(a1);
}

id PublishStatusInvocation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t PublishStatusInvocation.__allocating_init(coder:)()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  return _s14LocalStatusKit07PublishB10InvocationC5coderACSgSo7NSCoderC_tcfc_0();
}

uint64_t sub_240B04FB8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  return _s14LocalStatusKit07PublishB10InvocationC5coderACSgSo7NSCoderC_tcfc_0();
}

uint64_t sub_240B04FE0()
{
  return 1;
}

uint64_t static LocalStatusInvocation.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t LocalStatusInvocation.Response.init(initialStatus:updates:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_240B04FFC(a1, a2, type metadata accessor for LocalStatusInvocation.Response, a3);
}

uint64_t sub_240B04FFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_QWORD)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 40);
  *(_BYTE *)a4 = *(_BYTE *)a1;
  *(_QWORD *)(a4 + 8) = v5;
  *(_QWORD *)(a4 + 16) = v6;
  *(_OWORD *)(a4 + 24) = *(_OWORD *)(a1 + 24);
  *(_QWORD *)(a4 + 40) = v7;
  v8 = a4 + *(int *)(a3(0) + 20);
  return sub_240B04D7C(a2, v8);
}

uint64_t sub_240B05050()
{
  sub_240B05298();
  return sub_240B0E874();
}

uint64_t sub_240B05078()
{
  sub_240B05298();
  return sub_240B0E880();
}

uint64_t LocalStatusInvocation.Response.encode(to:)(_QWORD *a1)
{
  return sub_240B050D4(a1, &qword_2570839C0, (void (*)(void))sub_240B05298, (uint64_t)&type metadata for LocalStatusInvocation.Response.CodingKeys, (void (*)(_QWORD))type metadata accessor for LocalStatusInvocation.Response);
}

uint64_t sub_240B050D4(_QWORD *a1, uint64_t *a2, void (*a3)(void), uint64_t a4, void (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v17)(_QWORD);
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  char v24;

  v17 = a5;
  v8 = v5;
  v10 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v18 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_240B0E868();
  v13 = *(_QWORD *)(v8 + 8);
  v14 = *(_QWORD *)(v8 + 16);
  v15 = *(_QWORD *)(v8 + 40);
  v19 = *(_BYTE *)v8;
  v20 = v13;
  v21 = v14;
  v22 = *(_OWORD *)(v8 + 24);
  v23 = v15;
  v24 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25435BA60);
  sub_240AFBF00(&qword_25435B7B8, &qword_25435BA60, (uint64_t)&protocol conformance descriptor for LSKPublishedStatus<A>);
  sub_240B0E7C0();
  if (!v6)
  {
    v17(0);
    v19 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25435BBF8);
    sub_240AFBF00(&qword_25435B800, &qword_25435BBF8, MEMORY[0x24BE8FCE8]);
    sub_240B0E7A8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v12, v10);
}

unint64_t sub_240B05298()
{
  unint64_t result;

  result = qword_2570839C8;
  if (!qword_2570839C8)
  {
    result = MEMORY[0x2426893C4](&unk_240B10D60, &type metadata for LocalStatusInvocation.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570839C8);
  }
  return result;
}

uint64_t LocalStatusInvocation.Response.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_240B05310(a1, &qword_2570839D0, type metadata accessor for LocalStatusInvocation.Response, (void (*)(void))sub_240B05298, a2);
}

uint64_t sub_240B05310@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t (*a3)(_QWORD)@<X2>, void (*a4)(void)@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(void);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(void);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(_QWORD);
  _QWORD v28[2];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(_QWORD);
  char *v33;
  uint64_t v34;
  void (*v35)(void);
  _QWORD *v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;

  v35 = a4;
  v31 = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435BC00);
  MEMORY[0x24BDAC7A8](v8);
  v33 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v10 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v12 = (void (*)(void))((char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v32 = a3;
  v13 = a3(0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v28 - v14;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v35();
  v35 = v12;
  v16 = (uint64_t)v36;
  sub_240B0E85C();
  if (v16)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v29 = v13;
  v30 = v10;
  v17 = (uint64_t)v15;
  v36 = a1;
  v18 = (uint64_t)v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25435BA60);
  v43 = 0;
  sub_240AFBF00(&qword_25435B868, &qword_25435BA60, (uint64_t)&protocol conformance descriptor for LSKPublishedStatus<A>);
  v20 = v34;
  v19 = v35;
  sub_240B0E778();
  v21 = v38;
  v22 = v39;
  v23 = v40;
  v24 = v41;
  v25 = v42;
  *(_BYTE *)v17 = v37;
  *(_QWORD *)(v17 + 8) = v21;
  *(_QWORD *)(v17 + 16) = v22;
  v28[0] = v24;
  v28[1] = v23;
  *(_QWORD *)(v17 + 24) = v23;
  *(_QWORD *)(v17 + 32) = v24;
  *(_QWORD *)(v17 + 40) = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25435BBF8);
  v37 = 1;
  sub_240AFBF00(&qword_25435B8B0, &qword_25435BBF8, MEMORY[0x24BE8FCF8]);
  sub_240B0E760();
  (*(void (**)(void (*)(void), uint64_t))(v30 + 8))(v19, v20);
  sub_240B04D7C(v18, v17 + *(int *)(v29 + 20));
  v26 = v32;
  sub_240AF9B90(v17, v31, v32);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  return sub_240AFCC30(v17, v26);
}

uint64_t sub_240B055E0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return LocalStatusInvocation.Response.init(from:)(a1, a2);
}

uint64_t sub_240B055F4(_QWORD *a1)
{
  return LocalStatusInvocation.Response.encode(to:)(a1);
}

uint64_t sub_240B05618()
{
  return 1;
}

uint64_t static SubscribeStatusInvocation.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t _s14LocalStatusKit07PublishB10InvocationC4nameACSS_tcfC_0()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  return _s14LocalStatusKit07PublishB10InvocationC4nameACSS_tcfc_0();
}

id _s14LocalStatusKit07PublishB10InvocationCACycfc_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_240B056A8(void *a1)
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id _s14LocalStatusKit07PublishB10InvocationCfD_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_240B05720()
{
  unint64_t result;

  result = qword_25435B780;
  if (!qword_25435B780)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for PublishStatusInvocation.Parameters, &type metadata for PublishStatusInvocation.Parameters);
    atomic_store(result, (unint64_t *)&qword_25435B780);
  }
  return result;
}

unint64_t sub_240B05768()
{
  unint64_t result;

  result = qword_25435B870;
  if (!qword_25435B870)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for PublishStatusInvocation.Parameters, &type metadata for PublishStatusInvocation.Parameters);
    atomic_store(result, (unint64_t *)&qword_25435B870);
  }
  return result;
}

uint64_t sub_240B057AC()
{
  return sub_240AFFB40(&qword_25435B788, type metadata accessor for PublishStatusInvocation.Response, (uint64_t)&protocol conformance descriptor for PublishStatusInvocation.Response);
}

uint64_t sub_240B057D8()
{
  return sub_240AFFB40(&qword_25435BA98, type metadata accessor for PublishStatusInvocation.Response, (uint64_t)&protocol conformance descriptor for PublishStatusInvocation.Response);
}

uint64_t sub_240B05804()
{
  return sub_240AFBF00(&qword_25435B7F0, &qword_25435BBD8, (uint64_t)&protocol conformance descriptor for LSKKey<A>);
}

uint64_t sub_240B05830()
{
  return sub_240AFBF00(&qword_25435B8A0, &qword_25435BBD8, (uint64_t)&protocol conformance descriptor for LSKKey<A>);
}

uint64_t sub_240B0585C()
{
  return sub_240AFFB40(&qword_2570839D8, type metadata accessor for LocalStatusInvocation.Response, (uint64_t)&protocol conformance descriptor for LocalStatusInvocation.Response);
}

uint64_t sub_240B05888()
{
  return sub_240AFFB40(&qword_2570839E0, type metadata accessor for LocalStatusInvocation.Response, (uint64_t)&protocol conformance descriptor for LocalStatusInvocation.Response);
}

uint64_t sub_240B058B4()
{
  return sub_240AFBF00(&qword_25435B620, &qword_25435B778, MEMORY[0x24BE8FCF8]);
}

uint64_t sub_240B058E0()
{
  return sub_240AFBF00(&qword_25435B790, &qword_25435B778, MEMORY[0x24BE8FCE8]);
}

uint64_t type metadata accessor for LSKLocalStatusClient()
{
  return objc_opt_self();
}

uint64_t method lookup function for LSKLocalStatusClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LSKLocalStatusClient.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_240B05940()
{
  return sub_240B06610();
}

uint64_t sub_240B0594C()
{
  return type metadata accessor for PublishStatusInvocation(0);
}

uint64_t initializeBufferWithCopyOfBuffer for PublishStatusInvocation.Parameters(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PublishStatusInvocation.Parameters(uint64_t a1)
{
  unint64_t v2;

  swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >> 60 != 15)
    sub_240AFCBA8(*(_QWORD *)(a1 + 24), v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PublishStatusInvocation.Parameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *v5;
  unint64_t v6;
  uint64_t v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = (_OWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  if (v6 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 24) = *v5;
  }
  else
  {
    v7 = *(_QWORD *)v5;
    sub_240AFCB50(v7, v6);
    *(_QWORD *)(a1 + 24) = v7;
    *(_QWORD *)(a1 + 32) = v6;
  }
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PublishStatusInvocation.Parameters(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (uint64_t *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 32) >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      v7 = *v4;
      sub_240AFCB50(*v4, *(_QWORD *)(a2 + 32));
      v8 = *(_QWORD *)(a1 + 24);
      v9 = *(_QWORD *)(a1 + 32);
      *(_QWORD *)(a1 + 24) = v7;
      *(_QWORD *)(a1 + 32) = v5;
      sub_240AFCBA8(v8, v9);
      goto LABEL_8;
    }
    sub_240B05B38(a1 + 24);
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)v4;
    goto LABEL_8;
  }
  v6 = *v4;
  sub_240AFCB50(*v4, *(_QWORD *)(a2 + 32));
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v5;
LABEL_8:
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_240B05B38(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDCDDE8] - 8) + 8))();
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

uint64_t assignWithTake for PublishStatusInvocation.Parameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = (_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6 >> 60 != 15)
  {
    v7 = *(_QWORD *)(a2 + 32);
    if (v7 >> 60 != 15)
    {
      v8 = *(_QWORD *)(a1 + 24);
      *(_QWORD *)(a1 + 24) = *v5;
      *(_QWORD *)(a1 + 32) = v7;
      sub_240AFCBA8(v8, v6);
      goto LABEL_6;
    }
    sub_240B05B38(a1 + 24);
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)v5;
LABEL_6:
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PublishStatusInvocation.Parameters(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PublishStatusInvocation.Parameters(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PublishStatusInvocation.Parameters()
{
  return &type metadata for PublishStatusInvocation.Parameters;
}

uint64_t getEnumTagSinglePayload for PublishStatusInvocation.Response()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for PublishStatusInvocation.Response()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_240B05D00()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25435BC08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25435BBF8);
    v0 = sub_240B0E664();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25435BC08);
  }
}

uint64_t sub_240B05D58()
{
  return sub_240B06610();
}

uint64_t sub_240B05D64()
{
  return type metadata accessor for LocalStatusInvocation(0);
}

_BYTE *_s14LocalStatusKit23PublishStatusInvocationC8ResponseVwCP_0(_BYTE *a1, _QWORD *a2, uint64_t a3)
{
  _BYTE *v4;
  int v5;
  uint64_t v7;
  _OWORD *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = (_BYTE *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_BYTE *)a2;
    v7 = a2[2];
    *((_QWORD *)v4 + 1) = a2[1];
    *((_QWORD *)v4 + 2) = v7;
    v8 = a2 + 3;
    v9 = a2[4];
    swift_bridgeObjectRetain();
    if (v9 >> 60 == 15)
    {
      *(_OWORD *)(v4 + 24) = *v8;
    }
    else
    {
      v11 = *(_QWORD *)v8;
      sub_240AFCB50(v11, v9);
      *((_QWORD *)v4 + 3) = v11;
      *((_QWORD *)v4 + 4) = v9;
    }
    *((_QWORD *)v4 + 5) = a2[5];
    v12 = *(int *)(a3 + 20);
    v13 = &v4[v12];
    v14 = (char *)a2 + v12;
    swift_bridgeObjectRetain();
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435BBF8);
    v16 = *(_QWORD *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435BC00);
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(_BYTE *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    }
  }
  return v4;
}

uint64_t _s14LocalStatusKit23PublishStatusInvocationC8ResponseVwxx_0(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 >> 60 != 15)
    sub_240AFCBA8(*(_QWORD *)(a1 + 24), v4);
  swift_bridgeObjectRelease();
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435BBF8);
  v7 = *(_QWORD *)(v6 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  return result;
}

uint64_t _s14LocalStatusKit23PublishStatusInvocationC8ResponseVwcp_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _OWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  v7 = (_OWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  if (v8 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 24) = *v7;
  }
  else
  {
    v9 = *(_QWORD *)v7;
    sub_240AFCB50(v9, v8);
    *(_QWORD *)(a1 + 24) = v9;
    *(_QWORD *)(a1 + 32) = v8;
  }
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v10 = *(int *)(a3 + 20);
  v11 = (void *)(a1 + v10);
  v12 = (const void *)(a2 + v10);
  swift_bridgeObjectRetain();
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435BBF8);
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435BC00);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v14 + 16))(v11, v12, v13);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  return a1;
}

uint64_t _s14LocalStatusKit23PublishStatusInvocationC8ResponseVwca_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(void *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (uint64_t *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 32) >> 60 == 15)
  {
    if (v7 >> 60 != 15)
    {
      v8 = *v6;
      sub_240AFCB50(*v6, *(_QWORD *)(a2 + 32));
      *(_QWORD *)(a1 + 24) = v8;
      *(_QWORD *)(a1 + 32) = v7;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v7 >> 60 == 15)
  {
    sub_240B05B38(a1 + 24);
LABEL_6:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)v6;
    goto LABEL_8;
  }
  v9 = *v6;
  sub_240AFCB50(*v6, *(_QWORD *)(a2 + 32));
  v10 = *(_QWORD *)(a1 + 24);
  v11 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 32) = v7;
  sub_240AFCBA8(v10, v11);
LABEL_8:
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12 = *(int *)(a3 + 20);
  v13 = (void *)(a1 + v12);
  v14 = (void *)(a2 + v12);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435BBF8);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 24))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_13;
  }
  if (v19)
  {
LABEL_13:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435BC00);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 16))(v13, v14, v15);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

_OWORD *_s14LocalStatusKit23PublishStatusInvocationC8ResponseVwtk_0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435BBF8);
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435BC00);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v6, v7, v8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t _s14LocalStatusKit23PublishStatusInvocationC8ResponseVwta_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _OWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(void *, uint64_t, uint64_t);
  int v17;
  int v18;
  uint64_t v19;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  v7 = (_OWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  if (v8 >> 60 == 15)
    goto LABEL_4;
  v9 = *(_QWORD *)(a2 + 32);
  if (v9 >> 60 == 15)
  {
    sub_240B05B38(a1 + 24);
LABEL_4:
    *(_OWORD *)(a1 + 24) = *v7;
    goto LABEL_6;
  }
  v10 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)v7;
  *(_QWORD *)(a1 + 32) = v9;
  sub_240AFCBA8(v10, v8);
LABEL_6:
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  v11 = *(int *)(a3 + 20);
  v12 = (void *)(a1 + v11);
  v13 = (void *)(a2 + v11);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435BBF8);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  v17 = v16(v12, 1, v14);
  v18 = v16(v13, 1, v14);
  if (!v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 40))(v12, v13, v14);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v15 + 8))(v12, v14);
    goto LABEL_11;
  }
  if (v18)
  {
LABEL_11:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435BC00);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v15 + 32))(v12, v13, v14);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for LocalStatusInvocation.Response()
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435BC00);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for LocalStatusInvocation.Response()
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435BC00);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

void sub_240B06590()
{
  unint64_t v0;

  sub_240B05D00();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_240B06604()
{
  return sub_240B06610();
}

uint64_t sub_240B06610()
{
  return swift_initClassMetadata2();
}

uint64_t sub_240B06648()
{
  return type metadata accessor for SubscribeStatusInvocation(0);
}

ValueMetadata *type metadata accessor for LocalStatusInvocation.Response.CodingKeys()
{
  return &type metadata for LocalStatusInvocation.Response.CodingKeys;
}

uint64_t _s14LocalStatusKit21LocalStatusInvocationC8ResponseV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_240B066B4 + 4 * byte_240B10845[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_240B066E8 + 4 * byte_240B10840[v4]))();
}

uint64_t sub_240B066E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B066F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240B066F8);
  return result;
}

uint64_t sub_240B06704(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240B0670CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_240B06710(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B06718(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PublishStatusInvocation.Response.CodingKeys()
{
  return &type metadata for PublishStatusInvocation.Response.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for PublishStatusInvocation.Parameters.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_240B06780 + 4 * byte_240B1084F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_240B067B4 + 4 * byte_240B1084A[v4]))();
}

uint64_t sub_240B067B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B067BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240B067C4);
  return result;
}

uint64_t sub_240B067D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240B067D8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_240B067DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B067E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PublishStatusInvocation.Parameters.CodingKeys()
{
  return &type metadata for PublishStatusInvocation.Parameters.CodingKeys;
}

unint64_t sub_240B06804()
{
  unint64_t result;

  result = qword_2570839F8;
  if (!qword_2570839F8)
  {
    result = MEMORY[0x2426893C4](&unk_240B10BC8, &type metadata for PublishStatusInvocation.Parameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570839F8);
  }
  return result;
}

unint64_t sub_240B0684C()
{
  unint64_t result;

  result = qword_257083A00;
  if (!qword_257083A00)
  {
    result = MEMORY[0x2426893C4](&unk_240B10C80, &type metadata for PublishStatusInvocation.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083A00);
  }
  return result;
}

unint64_t sub_240B06894()
{
  unint64_t result;

  result = qword_257083A08;
  if (!qword_257083A08)
  {
    result = MEMORY[0x2426893C4](&unk_240B10D38, &type metadata for LocalStatusInvocation.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083A08);
  }
  return result;
}

unint64_t sub_240B068DC()
{
  unint64_t result;

  result = qword_257083A10;
  if (!qword_257083A10)
  {
    result = MEMORY[0x2426893C4](&unk_240B10CA8, &type metadata for LocalStatusInvocation.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083A10);
  }
  return result;
}

unint64_t sub_240B06924()
{
  unint64_t result;

  result = qword_257083A18;
  if (!qword_257083A18)
  {
    result = MEMORY[0x2426893C4](&unk_240B10CD0, &type metadata for LocalStatusInvocation.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083A18);
  }
  return result;
}

unint64_t sub_240B0696C()
{
  unint64_t result;

  result = qword_25435BA90;
  if (!qword_25435BA90)
  {
    result = MEMORY[0x2426893C4](&unk_240B10BF0, &type metadata for PublishStatusInvocation.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BA90);
  }
  return result;
}

unint64_t sub_240B069B4()
{
  unint64_t result;

  result = qword_25435BA88;
  if (!qword_25435BA88)
  {
    result = MEMORY[0x2426893C4](&unk_240B10C18, &type metadata for PublishStatusInvocation.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BA88);
  }
  return result;
}

unint64_t sub_240B069FC()
{
  unint64_t result;

  result = qword_25435BA78;
  if (!qword_25435BA78)
  {
    result = MEMORY[0x2426893C4](&unk_240B10B38, &type metadata for PublishStatusInvocation.Parameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BA78);
  }
  return result;
}

unint64_t sub_240B06A44()
{
  unint64_t result;

  result = qword_25435BA70;
  if (!qword_25435BA70)
  {
    result = MEMORY[0x2426893C4](&unk_240B10B60, &type metadata for PublishStatusInvocation.Parameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25435BA70);
  }
  return result;
}

uint64_t sub_240B06A88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257083A20);
  sub_240B075E8();
  sub_240B0E43C();
  sub_240B0E6D0();
  sub_240B0E568();
  swift_bridgeObjectRelease();
  sub_240B0E568();
  swift_bridgeObjectRetain();
  v0 = sub_240AFBE78(8);
  v2 = v1;
  v4 = v3;
  v6 = v5;
  swift_bridgeObjectRelease();
  MEMORY[0x242688E0C](v0, v2, v4, v6);
  sub_240B0E568();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_240B0E568();
  swift_bridgeObjectRetain();
  sub_240B0E568();
  swift_bridgeObjectRelease();
  sub_240B0E568();
  swift_bridgeObjectRetain();
  sub_240B0E568();
  swift_bridgeObjectRelease();
  sub_240B0E568();
  sub_240B0E70C();
  sub_240B0E568();
  return 0;
}

uint64_t sub_240B06C78(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_240B06D48(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_240B075AC((uint64_t)v12, *a3);
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
      sub_240B075AC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_240B06D48(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_240B0E67C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_240B06F00(a5, a6);
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
  v8 = sub_240B0E700();
  if (!v8)
  {
    sub_240B0E724();
    __break(1u);
LABEL_17:
    result = sub_240B0E730();
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

uint64_t sub_240B06F00(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_240B06F94(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_240B0716C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_240B0716C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_240B06F94(uint64_t a1, unint64_t a2)
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
      v3 = sub_240B07108(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_240B0E6DC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_240B0E724();
      __break(1u);
LABEL_10:
      v2 = sub_240B0E574();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_240B0E730();
    __break(1u);
LABEL_14:
    result = sub_240B0E724();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_240B07108(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257083A28);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_240B0716C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257083A28);
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
  result = sub_240B0E730();
  __break(1u);
  return result;
}

uint64_t sub_240B072B8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 7955819 && a2 == 0xE300000000000000;
  if (v2 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64616F6C796170 && a2 == 0xE700000000000000 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x736E6F6974706FLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_240B0E7F0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_240B073FC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x536C616974696E69 && a2 == 0xED00007375746174;
  if (v2 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73657461647075 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_240B0E7F0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_240B07510@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return sub_240B0424C(a1, v2[2], v2[3], v2[4], a2);
}

uint64_t sub_240B0752C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_240B07570(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_240B075AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_240B075E8()
{
  unint64_t result;

  result = qword_257083A30;
  if (!qword_257083A30)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for OSLogDateFormatter, &type metadata for OSLogDateFormatter);
    atomic_store(result, (unint64_t *)&qword_257083A30);
  }
  return result;
}

uint64_t LSKPublishedStatusSequence.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t result;

  v12 = *(_QWORD *)(a4 - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = (char *)swift_allocObject();
  *((_QWORD *)v14 + 2) = a2;
  *((_QWORD *)v14 + 3) = a3;
  *((_QWORD *)v14 + 4) = a4;
  *((_QWORD *)v14 + 5) = a5;
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 32))(&v14[v13], a1, a4);
  *a6 = sub_240B0786C;
  a6[1] = v14;
  return result;
}

_QWORD *sub_240B07714@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD *result;
  uint64_t v17;

  v12 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  v15 = swift_allocBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, a4);
  sub_240B0E5F8();
  result = (_QWORD *)swift_allocObject();
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = a5;
  result[6] = v15;
  *a6 = &unk_257083AD8;
  a6[1] = result;
  return result;
}

uint64_t sub_240B07814()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8) + 80)));
  return swift_deallocObject();
}

_QWORD *sub_240B0786C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1[4];
  v3 = *(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80);
  return sub_240B07714((uint64_t)v1 + ((v3 + 48) & ~v3), v1[2], v1[3], v2, v1[5], a1);
}

uint64_t LSKPublishedStatusSequence.AsyncIterator.next()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_240B078A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_240AF7F94;
  v4[2] = a1;
  v4[3] = v1;
  return swift_task_switch();
}

uint64_t LSKPublishedStatusSequence.makeAsyncIterator()()
{
  uint64_t (**v0)(void);

  return (*v0)();
}

void sub_240B07924()
{
  JUMPOUT(0x2426893C4);
}

uint64_t sub_240B07934()
{
  LSKPublishedStatusSequence.makeAsyncIterator()();
  return swift_release();
}

uint64_t type metadata accessor for LSKPublishedStatusSequence(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LSKPublishedStatusSequence);
}

uint64_t type metadata accessor for LSKPublishedStatusSequence.AsyncIterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LSKPublishedStatusSequence.AsyncIterator);
}

uint64_t sub_240B07964()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_240B07988(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_240AF7F94;
  return sub_240AF7CB8(a1, v8, v4, v5, v6, v7);
}

uint64_t LSKTargetDeviceFlags.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t LSKTargetDeviceFlags.rawValue.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*LSKTargetDeviceFlags.rawValue.modify())()
{
  return nullsub_1;
}

uint64_t LSKTargetDeviceFlags.init(rawValue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static LSKTargetDeviceFlags.audioAccessory.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static LSKTargetDeviceFlags.iphone.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

void static LSKTargetDeviceFlags.ipad.getter(_QWORD *a1@<X8>)
{
  *a1 = 8;
}

void static LSKTargetDeviceFlags.mac.getter(_QWORD *a1@<X8>)
{
  *a1 = 16;
}

void static LSKTargetDeviceFlags.tv.getter(_QWORD *a1@<X8>)
{
  *a1 = 32;
}

void static LSKTargetDeviceFlags.visionDevice.getter(_QWORD *a1@<X8>)
{
  *a1 = 64;
}

void static LSKTargetDeviceFlags.watch.getter(_QWORD *a1@<X8>)
{
  *a1 = 128;
}

uint64_t sub_240B07A84@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

void static LSKTargetDeviceFlags.none.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void static LSKTargetDeviceFlags.all.getter(_QWORD *a1@<X8>)
{
  *a1 = 253;
}

uint64_t LSKTargetDeviceFlags.idsDeviceTypes.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v1 = *v0;
  v4 = MEMORY[0x24BEE4B08];
  if ((v1 & 0x10) == 0)
  {
    if ((v1 & 0x40) == 0)
      goto LABEL_3;
LABEL_7:
    sub_240B07E08(&v3, 9);
    if ((v1 & 0x20) == 0)
      return v4;
    goto LABEL_4;
  }
  sub_240B07E08(&v3, 1);
  if ((v1 & 0x40) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v1 & 0x20) != 0)
LABEL_4:
    sub_240B07E08(&v3, 5);
  return v4;
}

_QWORD *sub_240B07BC4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_240B07BD0()
{
  sub_240B07F28();
  return sub_240B0E5C8();
}

uint64_t sub_240B07C2C()
{
  sub_240B07F28();
  return sub_240B0E5B0();
}

void sub_240B07C78(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_240B07C80@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_240B07C94@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_240B07CA8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_240B07CBC(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_240B07CEC@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
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

uint64_t *sub_240B07D18@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
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

_QWORD *sub_240B07D3C(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_240B07D50(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_240B07D64(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_240B07D78@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_240B07D8C(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_240B07DA0(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_240B07DB4(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_240B07DC8()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_240B07DD8()
{
  return sub_240B0E694();
}

_QWORD *sub_240B07DF0(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

uint64_t sub_240B07E08(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;

  v5 = *v2;
  sub_240B0E838();
  sub_240B0E844();
  v6 = sub_240B0E850();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v13 = *v2;
    *v2 = 0x8000000000000000;
    sub_240B082FC(a2, v8, isUniquelyReferenced_nonNull_native);
    *v2 = v13;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v9 = *(_QWORD *)(v5 + 48);
  if (*(_QWORD *)(v9 + 8 * v8) != a2)
  {
    v10 = ~v7;
    do
    {
      v8 = (v8 + 1) & v10;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_QWORD *)(v9 + 8 * v8) != a2);
  }
  result = 0;
  a2 = *(_QWORD *)(*(_QWORD *)(*v2 + 48) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

unint64_t sub_240B07F28()
{
  unint64_t result;

  result = qword_257083AE0;
  if (!qword_257083AE0)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for LSKTargetDeviceFlags, &type metadata for LSKTargetDeviceFlags);
    atomic_store(result, (unint64_t *)&qword_257083AE0);
  }
  return result;
}

unint64_t sub_240B07F70()
{
  unint64_t result;

  result = qword_257083AE8;
  if (!qword_257083AE8)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for LSKTargetDeviceFlags, &type metadata for LSKTargetDeviceFlags);
    atomic_store(result, (unint64_t *)&qword_257083AE8);
  }
  return result;
}

unint64_t sub_240B07FB8()
{
  unint64_t result;

  result = qword_25435B6D8;
  if (!qword_25435B6D8)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for LSKTargetDeviceFlags, &type metadata for LSKTargetDeviceFlags);
    atomic_store(result, (unint64_t *)&qword_25435B6D8);
  }
  return result;
}

unint64_t sub_240B08000()
{
  unint64_t result;

  result = qword_25435B6E0;
  if (!qword_25435B6E0)
  {
    result = MEMORY[0x2426893C4](&protocol conformance descriptor for LSKTargetDeviceFlags, &type metadata for LSKTargetDeviceFlags);
    atomic_store(result, (unint64_t *)&qword_25435B6E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for LSKTargetDeviceFlags()
{
  return &type metadata for LSKTargetDeviceFlags;
}

uint64_t sub_240B08054()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_25435B6E8);
  result = sub_240B0E6B8();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (_QWORD *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10)
          goto LABEL_33;
        v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v10)
            goto LABEL_33;
          v16 = v6[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v10)
              goto LABEL_33;
            v16 = v6[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                v26 = 1 << *(_BYTE *)(v2 + 32);
                if (v26 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v26;
                v1 = v0;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v10)
                    goto LABEL_33;
                  v16 = v6[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v9 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
      sub_240B0E838();
      sub_240B0E844();
      result = sub_240B0E850();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_240B082FC(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_240B08054();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_240B08448();
      goto LABEL_14;
    }
    sub_240B085DC();
  }
  v8 = *v3;
  sub_240B0E838();
  sub_240B0E844();
  result = sub_240B0E850();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      type metadata accessor for IDSDeviceType();
      result = sub_240B0E7FC();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_QWORD *)(v10 + 8 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

void *sub_240B08448()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_25435B6E8);
  v2 = *v0;
  v3 = sub_240B0E6AC();
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_240B085DC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_25435B6E8);
  result = sub_240B0E6B8();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v10)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v10)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
    sub_240B0E838();
    sub_240B0E844();
    result = sub_240B0E850();
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v0;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_240B08858()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(_QWORD);
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v1 = type metadata accessor for LSKDestinationDevice.Delivery(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240AF9B90(v0, (uint64_t)v3, v4);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
  v6 = (char *)sub_240B088F8
     + 4
     * byte_240B111A0[(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v3, 3, v5)];
  __asm { BR              X10 }
}

uint64_t sub_240B088F8()
{
  uint64_t v0;
  uint64_t v1;

  swift_bridgeObjectRelease();
  v1 = sub_240B0E448();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
  return 1;
}

uint64_t LSKDestinationDevice.description.getter()
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
  uint64_t v10;

  sub_240B0E6D0();
  type metadata accessor for LSKDestinationDevice(0);
  LSKDestinationDevice.Delivery.description.getter();
  v1 = v0;
  swift_bridgeObjectRelease();
  v10 = v1;
  sub_240B0E568();
  swift_bridgeObjectRetain();
  v2 = sub_240AFBE78(8);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  swift_bridgeObjectRelease();
  MEMORY[0x242688E0C](v2, v4, v6, v8);
  sub_240B0E568();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_240B0E568();
  swift_bridgeObjectRetain();
  sub_240B0E568();
  swift_bridgeObjectRelease();
  sub_240B0E568();
  swift_bridgeObjectRetain();
  sub_240B0E568();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t type metadata accessor for LSKDestinationDevice(uint64_t a1)
{
  return sub_240B04080(a1, qword_25435BB48);
}

uint64_t sub_240B08AC4()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_240B08AF4 + 4 * byte_240B111A4[*v0]))(0x676E69646E6570, 0xE700000000000000);
}

uint64_t sub_240B08AF4()
{
  return 0x65726576696C6564;
}

uint64_t sub_240B08B10()
{
  return 0x64656C696166;
}

uint64_t sub_240B08B24()
{
  return 0x46676E697373696DLL;
}

uint64_t sub_240B08B48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_240B0BD78(a1, a2);
  *a3 = result;
  return result;
}

void sub_240B08B6C(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_240B08B78()
{
  sub_240B0A5DC();
  return sub_240B0E874();
}

uint64_t sub_240B08BA0()
{
  sub_240B0A5DC();
  return sub_240B0E880();
}

uint64_t sub_240B08BC8()
{
  sub_240B0A6A8();
  return sub_240B0E874();
}

uint64_t sub_240B08BF0()
{
  sub_240B0A6A8();
  return sub_240B0E880();
}

unint64_t sub_240B08C18()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000010;
  else
    return 0xD000000000000013;
}

uint64_t sub_240B08C58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_240B0BF58(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_240B08C7C()
{
  sub_240B0A664();
  return sub_240B0E874();
}

uint64_t sub_240B08CA4()
{
  sub_240B0A664();
  return sub_240B0E880();
}

uint64_t sub_240B08CCC()
{
  sub_240B0A620();
  return sub_240B0E874();
}

uint64_t sub_240B08CF4()
{
  sub_240B0A620();
  return sub_240B0E880();
}

uint64_t sub_240B08D1C()
{
  sub_240B0A6EC();
  return sub_240B0E874();
}

uint64_t sub_240B08D44()
{
  sub_240B0A6EC();
  return sub_240B0E880();
}

void LSKDestinationDevice.Delivery.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  _QWORD v13[9];
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083AF0);
  v13[4] = *(_QWORD *)(v2 - 8);
  v13[5] = v2;
  MEMORY[0x24BDAC7A8](v2);
  v13[3] = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083AF8);
  v13[8] = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v13[6] = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_240B0E448();
  v13[7] = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083B00);
  v13[1] = *(_QWORD *)(v6 - 8);
  v13[2] = v6;
  MEMORY[0x24BDAC7A8](v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083B08);
  MEMORY[0x24BDAC7A8](v7);
  v8 = type metadata accessor for LSKDestinationDevice.Delivery(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083B10);
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B0A5DC();
  sub_240B0E868();
  sub_240AF9B90(v19, (uint64_t)v10, type metadata accessor for LSKDestinationDevice.Delivery);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
  v12 = (char *)sub_240B08FD8
      + 4
      * byte_240B111A8[(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v10, 3, v11)];
  __asm { BR              X10 }
}

uint64_t sub_240B08FD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = (uint64_t *)(v2 + *(int *)(v0 + 48));
  v6 = *v4;
  v5 = v4[1];
  *(_QWORD *)(v3 - 168) = v6;
  *(_QWORD *)(v3 - 88) = v5;
  v7 = *(_QWORD *)(v3 - 152);
  v8 = *(_QWORD *)(v3 - 120);
  v9 = *(_QWORD *)(v3 - 136);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v8, v2, v9);
  *(_BYTE *)(v3 - 66) = 2;
  sub_240B0A664();
  v10 = *(_QWORD *)(v3 - 160);
  v11 = *(_QWORD *)(v3 - 112);
  sub_240B0E79C();
  *(_BYTE *)(v3 - 67) = 0;
  sub_240AFFB40(&qword_257083B30, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
  v12 = *(_QWORD *)(v3 - 128);
  v13 = *(_QWORD *)(v3 - 104);
  sub_240B0E7C0();
  if (v13)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 144) + 8))(v10, v12);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  }
  else
  {
    *(_BYTE *)(v3 - 68) = 1;
    sub_240B0E7B4();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 144) + 8))(v10, v12);
    (*(void (**)(_QWORD, uint64_t))(v7 + 8))(*(_QWORD *)(v3 - 120), v9);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 96) + 8))(v1, v11);
}

uint64_t LSKDestinationDevice.Delivery.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;

  v38 = a2;
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083B48);
  v32 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v37 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083B50);
  v33 = *(_QWORD *)(v4 - 8);
  v34 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v39 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083B58);
  v30 = *(_QWORD *)(v6 - 8);
  v31 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v35 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083B60);
  v28 = *(_QWORD *)(v8 - 8);
  v29 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v36 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083B68);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LSKDestinationDevice.Delivery(0);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v26 - v18;
  v20 = a1[3];
  v41 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v20);
  sub_240B0A5DC();
  v21 = v42;
  sub_240B0E85C();
  if (!v21)
  {
    v26[0] = v17;
    v26[1] = v19;
    v27 = v11;
    v42 = sub_240B0E784();
    if (*(_QWORD *)(v42 + 16) == 1)
      __asm { BR              X10 }
    v22 = sub_240B0E6F4();
    swift_allocError();
    v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2570837B0);
    *v24 = v14;
    sub_240B0E754();
    sub_240B0E6E8();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v24, *MEMORY[0x24BEE26D0], v22);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v10);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
}

uint64_t sub_240B098E4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return LSKDestinationDevice.Delivery.init(from:)(a1, a2);
}

void sub_240B098F8(_QWORD *a1)
{
  LSKDestinationDevice.Delivery.encode(to:)(a1);
}

uint64_t LSKDestinationDevice.idsIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LSKDestinationDevice.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LSKDestinationDevice.model.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LSKDestinationDevice.delivery.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for LSKDestinationDevice(0);
  return sub_240AF9B90(v1 + *(int *)(v3 + 28), a1, type metadata accessor for LSKDestinationDevice.Delivery);
}

uint64_t LSKDestinationDevice.init(idsIdentifier:name:model:delivery:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  uint64_t v9;

  *a8 = a1;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = a4;
  a8[4] = a5;
  a8[5] = a6;
  v9 = (uint64_t)a8 + *(int *)(type metadata accessor for LSKDestinationDevice(0) + 28);
  return sub_240B0A730(a7, v9);
}

uint64_t sub_240B09A14()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_240B09A50 + 4 * byte_240B111B0[*v0]))(0x746E656449736469, 0xED00007265696669);
}

uint64_t sub_240B09A50()
{
  return 1701667182;
}

uint64_t sub_240B09A60()
{
  return 0x6C65646F6DLL;
}

uint64_t sub_240B09A74()
{
  return 0x79726576696C6564;
}

uint64_t sub_240B09A8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_240B0C040(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_240B09AB0()
{
  sub_240B0A774();
  return sub_240B0E874();
}

uint64_t sub_240B09AD8()
{
  sub_240B0A774();
  return sub_240B0E880();
}

uint64_t LSKDestinationDevice.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083B78);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B0A774();
  sub_240B0E868();
  v8[15] = 0;
  sub_240B0E7B4();
  if (!v1)
  {
    v8[14] = 1;
    sub_240B0E7B4();
    v8[13] = 2;
    sub_240B0E7B4();
    type metadata accessor for LSKDestinationDevice(0);
    v8[12] = 3;
    type metadata accessor for LSKDestinationDevice.Delivery(0);
    sub_240AFFB40(&qword_257083B88, type metadata accessor for LSKDestinationDevice.Delivery, (uint64_t)&protocol conformance descriptor for LSKDestinationDevice.Delivery);
    sub_240B0E7C0();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t LSKDestinationDevice.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  char v24;
  char v25;
  char v26;
  char v27;

  v19 = a2;
  v21 = type metadata accessor for LSKDestinationDevice.Delivery(0);
  MEMORY[0x24BDAC7A8](v21);
  v20 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083B90);
  v4 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LSKDestinationDevice(0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (uint64_t *)((char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B0A774();
  v10 = (uint64_t)v23;
  sub_240B0E85C();
  if (v10)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v18 = v7;
  v23 = a1;
  v11 = (uint64_t)v20;
  v12 = v4;
  v27 = 0;
  v13 = v22;
  *v9 = sub_240B0E76C();
  v9[1] = v14;
  v26 = 1;
  v9[2] = sub_240B0E76C();
  v9[3] = v15;
  v25 = 2;
  v9[4] = sub_240B0E76C();
  v9[5] = v16;
  v24 = 3;
  sub_240AFFB40(&qword_257083B98, type metadata accessor for LSKDestinationDevice.Delivery, (uint64_t)&protocol conformance descriptor for LSKDestinationDevice.Delivery);
  sub_240B0E778();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v13);
  sub_240B0A730(v11, (uint64_t)v9 + *(int *)(v18 + 28));
  sub_240AF9B90((uint64_t)v9, v19, type metadata accessor for LSKDestinationDevice);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  return sub_240AFCC30((uint64_t)v9, type metadata accessor for LSKDestinationDevice);
}

uint64_t sub_240B09FA0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return LSKDestinationDevice.init(from:)(a1, a2);
}

uint64_t sub_240B09FB4(_QWORD *a1)
{
  return LSKDestinationDevice.encode(to:)(a1);
}

void LSKDestinationDevice.Delivery.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t (*v5)(_QWORD);
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v1 = sub_240B0E448();
  MEMORY[0x24BDAC7A8](v1);
  v2 = type metadata accessor for LSKDestinationDevice.Delivery(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240AF9B90(v0, (uint64_t)v4, v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
  v7 = (char *)sub_240B0A0CC
     + 4
     * byte_240B111B4[(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v4, 3, v6)];
  __asm { BR              X10 }
}

uint64_t sub_240B0A0CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v1, v2, v0);
  *(_QWORD *)(v4 - 80) = 0;
  *(_QWORD *)(v4 - 72) = 0xE000000000000000;
  sub_240B0E6D0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v4 - 80) = 0x5B64656C696146;
  *(_QWORD *)(v4 - 72) = 0xE700000000000000;
  sub_240B0E568();
  swift_bridgeObjectRelease();
  sub_240B0E568();
  *(_BYTE *)(v4 - 97) = 4;
  sub_240B075E8();
  sub_240B0E43C();
  sub_240B0E568();
  swift_bridgeObjectRelease();
  sub_240B0E568();
  v5 = *(_QWORD *)(v4 - 80);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v0);
  return v5;
}

void _s14LocalStatusKit20LSKDestinationDeviceV8DeliveryO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
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

  v4 = sub_240B0E448();
  MEMORY[0x24BDAC7A8](v4);
  v5 = type metadata accessor for LSKDestinationDevice.Delivery(0);
  MEMORY[0x24BDAC7A8](v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083710);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (uint64_t)&v9[*(int *)(v7 + 48)];
  sub_240AF9B90(a1, (uint64_t)v9, type metadata accessor for LSKDestinationDevice.Delivery);
  sub_240AF9B90(a2, v10, type metadata accessor for LSKDestinationDevice.Delivery);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
  v12 = (char *)sub_240B0A34C
      + 4
      * byte_240B111B8[(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v9, 3, v11)];
  __asm { BR              X10 }
}

uint64_t sub_240B0A34C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  void (*v19)(uint64_t, uint64_t);
  char v21;

  *(_QWORD *)(v8 - 88) = v1;
  sub_240AF9B90(v0, v3, type metadata accessor for LSKDestinationDevice.Delivery);
  v9 = *(int *)(v5 + 48);
  v11 = *(_QWORD *)(v3 + v9);
  v10 = *(_QWORD *)(v3 + v9 + 8);
  if (!v6(v4, 3, v5))
  {
    v13 = v10;
    v14 = v4 + v9;
    v16 = *(_QWORD *)(v4 + v9);
    v15 = *(_QWORD *)(v14 + 8);
    v17 = *(_QWORD *)(v8 - 88);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v2, v4, v17);
    v18 = sub_240B0E424();
    v19 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v19(v3, v17);
    if ((v18 & 1) != 0)
    {
      if (v11 == v16 && v13 == v15)
      {
        swift_bridgeObjectRelease_n();
        v19(v2, v17);
      }
      else
      {
        v21 = sub_240B0E7F0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v19(v2, v17);
        if ((v21 & 1) == 0)
          goto LABEL_13;
      }
      sub_240AFCC30(v0, type metadata accessor for LSKDestinationDevice.Delivery);
      return 1;
    }
    v19(v2, v17);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_13:
    sub_240AFCC30(v0, type metadata accessor for LSKDestinationDevice.Delivery);
    return 0;
  }
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, _QWORD))(v7 + 8))(v3, *(_QWORD *)(v8 - 88));
  sub_240B07570(v0, &qword_257083710);
  return 0;
}

void _s14LocalStatusKit20LSKDestinationDeviceV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  BOOL v5;
  uint64_t v6;

  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (sub_240B0E7F0() & 1) != 0)
  {
    v5 = a1[2] == a2[2] && a1[3] == a2[3];
    if ((v5 || (sub_240B0E7F0() & 1) != 0) && (a1[4] == a2[4] && a1[5] == a2[5] || (sub_240B0E7F0() & 1) != 0))
    {
      v6 = *(int *)(type metadata accessor for LSKDestinationDevice(0) + 28);
      _s14LocalStatusKit20LSKDestinationDeviceV8DeliveryO2eeoiySbAE_AEtFZ_0((uint64_t)a1 + v6, (uint64_t)a2 + v6);
    }
  }
}

uint64_t type metadata accessor for LSKDestinationDevice.Delivery(uint64_t a1)
{
  return sub_240B04080(a1, (uint64_t *)&unk_25435BB38);
}

unint64_t sub_240B0A5DC()
{
  unint64_t result;

  result = qword_257083B18;
  if (!qword_257083B18)
  {
    result = MEMORY[0x2426893C4](&unk_240B118C4, &type metadata for LSKDestinationDevice.Delivery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083B18);
  }
  return result;
}

unint64_t sub_240B0A620()
{
  unint64_t result;

  result = qword_257083B20;
  if (!qword_257083B20)
  {
    result = MEMORY[0x2426893C4](&unk_240B11874, &type metadata for LSKDestinationDevice.Delivery.MissingFromIDSCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083B20);
  }
  return result;
}

unint64_t sub_240B0A664()
{
  unint64_t result;

  result = qword_257083B28;
  if (!qword_257083B28)
  {
    result = MEMORY[0x2426893C4](&unk_240B11824, &type metadata for LSKDestinationDevice.Delivery.FailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083B28);
  }
  return result;
}

unint64_t sub_240B0A6A8()
{
  unint64_t result;

  result = qword_257083B38;
  if (!qword_257083B38)
  {
    result = MEMORY[0x2426893C4](&unk_240B117D4, &type metadata for LSKDestinationDevice.Delivery.DeliveredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083B38);
  }
  return result;
}

unint64_t sub_240B0A6EC()
{
  unint64_t result;

  result = qword_257083B40;
  if (!qword_257083B40)
  {
    result = MEMORY[0x2426893C4](&unk_240B11784, &type metadata for LSKDestinationDevice.Delivery.PendingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083B40);
  }
  return result;
}

uint64_t sub_240B0A730(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LSKDestinationDevice.Delivery(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_240B0A774()
{
  unint64_t result;

  result = qword_257083B80;
  if (!qword_257083B80)
  {
    result = MEMORY[0x2426893C4](&unk_240B11734, &type metadata for LSKDestinationDevice.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083B80);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for LSKDestinationDevice(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, _QWORD, uint64_t, uint64_t);

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = a2[5];
    v8 = *(int *)(a3 + 28);
    v9 = (char *)a2 + v8;
    v10 = (char *)a1 + v8;
    a1[4] = a2[4];
    a1[5] = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v9, 3, v11))
    {
      v13 = type metadata accessor for LSKDestinationDevice.Delivery(0);
      memcpy(v10, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      v15 = sub_240B0E448();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v10, v9, v15);
      v16 = *(int *)(v11 + 48);
      v17 = &v10[v16];
      v18 = &v9[v16];
      v19 = *((_QWORD *)v18 + 1);
      *(_QWORD *)v17 = *(_QWORD *)v18;
      *((_QWORD *)v17 + 1) = v19;
      v20 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56);
      swift_bridgeObjectRetain();
      v20(v10, 0, 3, v11);
    }
  }
  return a1;
}

uint64_t destroy for LSKDestinationDevice(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 3, v5);
  if (!(_DWORD)result)
  {
    v7 = sub_240B0E448();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v4, v7);
    return swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *initializeWithCopy for LSKDestinationDevice(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, _QWORD, uint64_t, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  v7 = *(int *)(a3 + 28);
  v8 = (char *)a2 + v7;
  v9 = (char *)a1 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 3, v10))
  {
    v12 = type metadata accessor for LSKDestinationDevice.Delivery(0);
    memcpy(v9, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v13 = sub_240B0E448();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v9, v8, v13);
    v14 = *(int *)(v10 + 48);
    v15 = &v9[v14];
    v16 = &v8[v14];
    v17 = *((_QWORD *)v16 + 1);
    *(_QWORD *)v15 = *(_QWORD *)v16;
    *((_QWORD *)v15 + 1) = v17;
    v18 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56);
    swift_bridgeObjectRetain();
    v18(v9, 0, 3, v10);
  }
  return a1;
}

_QWORD *assignWithCopy for LSKDestinationDevice(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  void (*v18)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;

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
  v6 = *(int *)(a3 + 28);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 3, v9);
  v13 = v11(v8, 3, v9);
  if (!v12)
  {
    if (!v13)
    {
      v21 = sub_240B0E448();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 24))(v7, v8, v21);
      v22 = *(int *)(v9 + 48);
      v23 = &v7[v22];
      v24 = &v8[v22];
      *(_QWORD *)v23 = *(_QWORD *)v24;
      *((_QWORD *)v23 + 1) = *((_QWORD *)v24 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_240B07570((uint64_t)v7, &qword_2570836D8);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v19 = type metadata accessor for LSKDestinationDevice.Delivery(0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    return a1;
  }
  v14 = sub_240B0E448();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v7, v8, v14);
  v15 = *(int *)(v9 + 48);
  v16 = &v7[v15];
  v17 = &v8[v15];
  *(_QWORD *)v16 = *(_QWORD *)v17;
  *((_QWORD *)v16 + 1) = *((_QWORD *)v17 + 1);
  v18 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56);
  swift_bridgeObjectRetain();
  v18(v7, 0, 3, v9);
  return a1;
}

_OWORD *initializeWithTake for LSKDestinationDevice(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = *(int *)(a3 + 28);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 3, v8))
  {
    v10 = type metadata accessor for LSKDestinationDevice.Delivery(0);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    v11 = sub_240B0E448();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v6, v7, v11);
    *(_OWORD *)&v6[*(int *)(v8 + 48)] = *(_OWORD *)&v7[*(int *)(v8 + 48)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 3, v8);
  }
  return a1;
}

_QWORD *assignWithTake for LSKDestinationDevice(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  v9 = *(int *)(a3 + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 3, v12);
  v16 = v14(v11, 3, v12);
  if (!v15)
  {
    if (!v16)
    {
      v20 = sub_240B0E448();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v10, v11, v20);
      v21 = *(int *)(v12 + 48);
      v22 = &v10[v21];
      v23 = &v11[v21];
      v25 = *(_QWORD *)v23;
      v24 = *((_QWORD *)v23 + 1);
      *(_QWORD *)v22 = v25;
      *((_QWORD *)v22 + 1) = v24;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_240B07570((uint64_t)v10, &qword_2570836D8);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v18 = type metadata accessor for LSKDestinationDevice.Delivery(0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    return a1;
  }
  v17 = sub_240B0E448();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v10, v11, v17);
  *(_OWORD *)&v10[*(int *)(v12 + 48)] = *(_OWORD *)&v11[*(int *)(v12 + 48)];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 3, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for LSKDestinationDevice()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_240B0AEB8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for LSKDestinationDevice.Delivery(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for LSKDestinationDevice()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_240B0AF40(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for LSKDestinationDevice.Delivery(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t sub_240B0AFB4()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for LSKDestinationDevice.Delivery(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for LSKDestinationDevice.Delivery(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  void (*v15)(uint64_t *, _QWORD, uint64_t, uint64_t);

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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 3, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v10 = sub_240B0E448();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
      v11 = *(int *)(v7 + 48);
      v12 = (uint64_t *)((char *)a1 + v11);
      v13 = (uint64_t *)((char *)a2 + v11);
      v14 = v13[1];
      *v12 = *v13;
      v12[1] = v14;
      v15 = *(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56);
      swift_bridgeObjectRetain();
      v15(a1, 0, 3, v7);
    }
  }
  return a1;
}

uint64_t destroy for LSKDestinationDevice.Delivery(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 3, v2);
  if (!(_DWORD)result)
  {
    v4 = sub_240B0E448();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

char *initializeWithCopy for LSKDestinationDevice.Delivery(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, _QWORD, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = sub_240B0E448();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    v9 = *(int *)(v6 + 48);
    v10 = &a1[v9];
    v11 = &a2[v9];
    v12 = *((_QWORD *)v11 + 1);
    *(_QWORD *)v10 = *(_QWORD *)v11;
    *((_QWORD *)v10 + 1) = v12;
    v13 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56);
    swift_bridgeObjectRetain();
    v13(a1, 0, 3, v6);
  }
  return a1;
}

char *assignWithCopy for LSKDestinationDevice.Delivery(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  void (*v15)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 3, v6);
  v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      v17 = sub_240B0E448();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(a1, a2, v17);
      v18 = *(int *)(v6 + 48);
      v19 = &a1[v18];
      v20 = &a2[v18];
      *(_QWORD *)v19 = *(_QWORD *)v20;
      *((_QWORD *)v19 + 1) = *((_QWORD *)v20 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_240B07570((uint64_t)a1, &qword_2570836D8);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = sub_240B0E448();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
  v12 = *(int *)(v6 + 48);
  v13 = &a1[v12];
  v14 = &a2[v12];
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *((_QWORD *)v13 + 1) = *((_QWORD *)v14 + 1);
  v15 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56);
  swift_bridgeObjectRetain();
  v15(a1, 0, 3, v6);
  return a1;
}

char *initializeWithTake for LSKDestinationDevice.Delivery(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = sub_240B0E448();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    *(_OWORD *)&a1[*(int *)(v6 + 48)] = *(_OWORD *)&a2[*(int *)(v6 + 48)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

char *assignWithTake for LSKDestinationDevice.Delivery(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 3, v6);
  v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      v13 = sub_240B0E448();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(a1, a2, v13);
      v14 = *(int *)(v6 + 48);
      v15 = &a1[v14];
      v16 = &a2[v14];
      v18 = *(_QWORD *)v16;
      v17 = *((_QWORD *)v16 + 1);
      *(_QWORD *)v15 = v18;
      *((_QWORD *)v15 + 1) = v17;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_240B07570((uint64_t)a1, &qword_2570836D8);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = sub_240B0E448();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
  *(_OWORD *)&a1[*(int *)(v6 + 48)] = *(_OWORD *)&a2[*(int *)(v6 + 48)];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for LSKDestinationDevice.Delivery()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_240B0B5BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 4)
    return v5 - 3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for LSKDestinationDevice.Delivery()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_240B0B618(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 3);
  else
    v5 = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_240B0B670(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 3, v2);
}

uint64_t sub_240B0B6AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570836D8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 3, v4);
}

uint64_t sub_240B0B6F0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_240B0E448();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for LSKDestinationDevice.CodingKeys()
{
  return &type metadata for LSKDestinationDevice.CodingKeys;
}

uint64_t _s14LocalStatusKit20LSKDestinationDeviceV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_240B0B7C4 + 4 * byte_240B111C1[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_240B0B7F8 + 4 * byte_240B111BC[v4]))();
}

uint64_t sub_240B0B7F8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B0B800(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240B0B808);
  return result;
}

uint64_t sub_240B0B814(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240B0B81CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_240B0B820(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B0B828(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LSKDestinationDevice.Delivery.CodingKeys()
{
  return &type metadata for LSKDestinationDevice.Delivery.CodingKeys;
}

ValueMetadata *type metadata accessor for LSKDestinationDevice.Delivery.PendingCodingKeys()
{
  return &type metadata for LSKDestinationDevice.Delivery.PendingCodingKeys;
}

ValueMetadata *type metadata accessor for LSKDestinationDevice.Delivery.DeliveredCodingKeys()
{
  return &type metadata for LSKDestinationDevice.Delivery.DeliveredCodingKeys;
}

uint64_t storeEnumTagSinglePayload for LSKDestinationDevice.Delivery.FailedCodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_240B0B8B0 + 4 * byte_240B111CB[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_240B0B8E4 + 4 * byte_240B111C6[v4]))();
}

uint64_t sub_240B0B8E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B0B8EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240B0B8F4);
  return result;
}

uint64_t sub_240B0B900(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240B0B908);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_240B0B90C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B0B914(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LSKDestinationDevice.Delivery.FailedCodingKeys()
{
  return &type metadata for LSKDestinationDevice.Delivery.FailedCodingKeys;
}

ValueMetadata *type metadata accessor for LSKDestinationDevice.Delivery.MissingFromIDSCodingKeys()
{
  return &type metadata for LSKDestinationDevice.Delivery.MissingFromIDSCodingKeys;
}

unint64_t sub_240B0B944()
{
  unint64_t result;

  result = qword_257083BA0;
  if (!qword_257083BA0)
  {
    result = MEMORY[0x2426893C4](&unk_240B114FC, &type metadata for LSKDestinationDevice.Delivery.FailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083BA0);
  }
  return result;
}

unint64_t sub_240B0B98C()
{
  unint64_t result;

  result = qword_257083BA8;
  if (!qword_257083BA8)
  {
    result = MEMORY[0x2426893C4](&unk_240B11654, &type metadata for LSKDestinationDevice.Delivery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083BA8);
  }
  return result;
}

unint64_t sub_240B0B9D4()
{
  unint64_t result;

  result = qword_257083BB0;
  if (!qword_257083BB0)
  {
    result = MEMORY[0x2426893C4](&unk_240B1170C, &type metadata for LSKDestinationDevice.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083BB0);
  }
  return result;
}

unint64_t sub_240B0BA1C()
{
  unint64_t result;

  result = qword_257083BB8;
  if (!qword_257083BB8)
  {
    result = MEMORY[0x2426893C4](&unk_240B1167C, &type metadata for LSKDestinationDevice.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083BB8);
  }
  return result;
}

unint64_t sub_240B0BA64()
{
  unint64_t result;

  result = qword_257083BC0;
  if (!qword_257083BC0)
  {
    result = MEMORY[0x2426893C4](&unk_240B116A4, &type metadata for LSKDestinationDevice.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083BC0);
  }
  return result;
}

unint64_t sub_240B0BAAC()
{
  unint64_t result;

  result = qword_257083BC8;
  if (!qword_257083BC8)
  {
    result = MEMORY[0x2426893C4](&unk_240B11574, &type metadata for LSKDestinationDevice.Delivery.PendingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083BC8);
  }
  return result;
}

unint64_t sub_240B0BAF4()
{
  unint64_t result;

  result = qword_257083BD0;
  if (!qword_257083BD0)
  {
    result = MEMORY[0x2426893C4](&unk_240B1159C, &type metadata for LSKDestinationDevice.Delivery.PendingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083BD0);
  }
  return result;
}

unint64_t sub_240B0BB3C()
{
  unint64_t result;

  result = qword_257083BD8;
  if (!qword_257083BD8)
  {
    result = MEMORY[0x2426893C4](&unk_240B11524, &type metadata for LSKDestinationDevice.Delivery.DeliveredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083BD8);
  }
  return result;
}

unint64_t sub_240B0BB84()
{
  unint64_t result;

  result = qword_257083BE0;
  if (!qword_257083BE0)
  {
    result = MEMORY[0x2426893C4](&unk_240B1154C, &type metadata for LSKDestinationDevice.Delivery.DeliveredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083BE0);
  }
  return result;
}

unint64_t sub_240B0BBCC()
{
  unint64_t result;

  result = qword_257083BE8;
  if (!qword_257083BE8)
  {
    result = MEMORY[0x2426893C4](&unk_240B1146C, &type metadata for LSKDestinationDevice.Delivery.FailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083BE8);
  }
  return result;
}

unint64_t sub_240B0BC14()
{
  unint64_t result;

  result = qword_257083BF0;
  if (!qword_257083BF0)
  {
    result = MEMORY[0x2426893C4](&unk_240B11494, &type metadata for LSKDestinationDevice.Delivery.FailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083BF0);
  }
  return result;
}

unint64_t sub_240B0BC5C()
{
  unint64_t result;

  result = qword_257083BF8;
  if (!qword_257083BF8)
  {
    result = MEMORY[0x2426893C4](&unk_240B1141C, &type metadata for LSKDestinationDevice.Delivery.MissingFromIDSCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083BF8);
  }
  return result;
}

unint64_t sub_240B0BCA4()
{
  unint64_t result;

  result = qword_257083C00;
  if (!qword_257083C00)
  {
    result = MEMORY[0x2426893C4](&unk_240B11444, &type metadata for LSKDestinationDevice.Delivery.MissingFromIDSCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083C00);
  }
  return result;
}

unint64_t sub_240B0BCEC()
{
  unint64_t result;

  result = qword_257083C08;
  if (!qword_257083C08)
  {
    result = MEMORY[0x2426893C4](&unk_240B115C4, &type metadata for LSKDestinationDevice.Delivery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257083C08);
  }
  return result;
}

unint64_t sub_240B0BD34()
{
  unint64_t result;

  result = qword_257083C10[0];
  if (!qword_257083C10[0])
  {
    result = MEMORY[0x2426893C4](&unk_240B115EC, &type metadata for LSKDestinationDevice.Delivery.CodingKeys);
    atomic_store(result, qword_257083C10);
  }
  return result;
}

uint64_t sub_240B0BD78(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x676E69646E6570 && a2 == 0xE700000000000000;
  if (v2 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65726576696C6564 && a2 == 0xE900000000000064 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64656C696166 && a2 == 0xE600000000000000 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x46676E697373696DLL && a2 == 0xEE005344496D6F72)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_240B0E7F0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_240B0BF58(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000013 && a2 == 0x8000000240B120F0 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000240B12110)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_240B0E7F0();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_240B0C040(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x746E656449736469 && a2 == 0xED00007265696669;
  if (v2 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C65646F6DLL && a2 == 0xE500000000000000 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x79726576696C6564 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_240B0E7F0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_240B0C204@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, char *a4@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char *v20;
  char v21;
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
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char v41[8];
  uint64_t v42;
  uint64_t v43;
  char v44[8];
  uint64_t v45;
  uint64_t v46;
  char *v47;

  v6 = v4;
  v40 = a3;
  v47 = a4;
  v9 = sub_240B0E448();
  v37 = *(_QWORD *)(v9 - 8);
  v38 = v9;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v39 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = *(_QWORD *)(a1 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v31 - v15;
  sub_240B0E34C();
  swift_allocObject();
  sub_240B0E340();
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257083A20);
  v18 = a2;
  sub_240B0E334();
  result = swift_release();
  if (!v5)
  {
    v20 = (char *)v4 + *(int *)(v17 + 60);
    v21 = *v20;
    v23 = *((_QWORD *)v20 + 1);
    v22 = *((_QWORD *)v20 + 2);
    v41[0] = v21;
    v42 = v23;
    v43 = v22;
    v24 = v40;
    sub_240AF93F4((uint64_t)v44);
    v41[0] = v44[0];
    v42 = v45;
    v43 = v46;
    v25 = *v4;
    v26 = v4[1];
    v34 = v6[2];
    v35 = v25;
    v27 = v6[3];
    v33 = v6[4];
    v28 = v6[5];
    v31 = v27;
    v32 = v28;
    v29 = (char *)v6 + *(int *)(v17 + 52);
    v30 = (uint64_t)v39;
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v39, v29, v38);
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v14, v16, a1);
    LSKLocalStatusObservation.init(key:deviceIDSIdentifier:deviceName:deviceModel:timestamp:value:)(v41, v35, v26, v34, v31, v33, v32, v30, v47, (uint64_t)v14, a1, v18, v24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t LSKLocalStatusObservation.deviceIDSIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LSKLocalStatusObservation.deviceName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LSKLocalStatusObservation.deviceModel.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LSKLocalStatusObservation.timestamp.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 52);
  v5 = sub_240B0E448();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t LSKLocalStatusObservation.value.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 56));
}

uint64_t LSKLocalStatusObservation.key.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = v2 + *(int *)(a1 + 60);
  v5 = *(_QWORD *)(v3 + 8);
  v4 = *(_QWORD *)(v3 + 16);
  *(_BYTE *)a2 = *(_BYTE *)v3;
  *(_QWORD *)(a2 + 8) = v5;
  *(_QWORD *)(a2 + 16) = v4;
  return swift_bridgeObjectRetain();
}

uint64_t LSKLocalStatusObservation.init(key:deviceIDSIdentifier:deviceName:deviceModel:timestamp:value:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  char v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  char *v22;
  char *v23;
  uint64_t v24;

  v18 = *a1;
  v19 = *((_QWORD *)a1 + 1);
  v20 = *((_QWORD *)a1 + 2);
  v21 = (int *)type metadata accessor for LSKLocalStatusObservation(0, a11, a12, a13);
  v22 = &a9[v21[15]];
  *v22 = v18;
  *((_QWORD *)v22 + 1) = v19;
  *((_QWORD *)v22 + 2) = v20;
  *(_QWORD *)a9 = a2;
  *((_QWORD *)a9 + 1) = a3;
  *((_QWORD *)a9 + 2) = a4;
  *((_QWORD *)a9 + 3) = a5;
  *((_QWORD *)a9 + 4) = a6;
  *((_QWORD *)a9 + 5) = a7;
  v23 = &a9[v21[13]];
  v24 = sub_240B0E448();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v23, a8, v24);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a11 - 8) + 32))(&a9[v21[14]], a10, a11);
}

uint64_t type metadata accessor for LSKLocalStatusObservation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LSKLocalStatusObservation);
}

uint64_t sub_240B0C62C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000013 && a2 == 0x8000000240B12130 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x614E656369766564 && a2 == 0xEA0000000000656DLL || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F4D656369766564 && a2 == 0xEB000000006C6564 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000 || (sub_240B0E7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 7955819 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v5 = sub_240B0E7F0();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_240B0C8C0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_240B0C8F8 + 4 * byte_240B11920[a1]))(0xD000000000000013, 0x8000000240B12130);
}

uint64_t sub_240B0C8F8()
{
  return 0x614E656369766564;
}

uint64_t sub_240B0C914()
{
  return 0x6F4D656369766564;
}

uint64_t sub_240B0C934()
{
  return 0x6D617473656D6974;
}

uint64_t sub_240B0C950()
{
  return 0x65756C6176;
}

uint64_t sub_240B0C964()
{
  return 7955819;
}

BOOL sub_240B0C974(char *a1, char *a2)
{
  return sub_240AFA56C(*a1, *a2);
}

uint64_t sub_240B0C98C()
{
  return sub_240AFA6DC();
}

uint64_t sub_240B0C99C()
{
  return sub_240AFA57C();
}

uint64_t sub_240B0C9AC()
{
  sub_240B0E838();
  sub_240AFA57C();
  return sub_240B0E850();
}

uint64_t sub_240B0C9F4()
{
  unsigned __int8 *v0;

  return sub_240B0C8C0(*v0);
}

uint64_t sub_240B0CA04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_240B0C62C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_240B0CA34@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_240B0E320();
  *a1 = result;
  return result;
}

uint64_t sub_240B0CA64(uint64_t a1)
{
  MEMORY[0x2426893C4](&unk_240B11B68, a1);
  return sub_240B0E874();
}

uint64_t sub_240B0CA98(uint64_t a1)
{
  MEMORY[0x2426893C4](&unk_240B11B68, a1);
  return sub_240B0E880();
}

uint64_t LSKLocalStatusObservation.encode(to:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char v28;

  v4 = a2[2];
  v5 = a2[3];
  v21 = a2[4];
  v22 = v4;
  v20 = v5;
  v6 = type metadata accessor for LSKLocalStatusObservation.CodingKeys(255, v4, v5, v21);
  MEMORY[0x2426893C4](&unk_240B11B68, v6);
  v7 = sub_240B0E7CC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v20 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B0E868();
  v25 = 0;
  v11 = v23;
  sub_240B0E7B4();
  if (!v11)
  {
    v12 = v21;
    v13 = v22;
    v25 = 1;
    sub_240B0E7B4();
    v25 = 2;
    sub_240B0E7B4();
    v25 = 3;
    sub_240B0E448();
    sub_240B0D224(&qword_257083B30, MEMORY[0x24BDCE920]);
    sub_240B0E7C0();
    v23 = a2;
    v25 = 4;
    sub_240B0E7C0();
    v14 = v24 + *((int *)v23 + 15);
    v15 = *(_BYTE *)v14;
    v17 = *(_QWORD *)(v14 + 8);
    v16 = *(_QWORD *)(v14 + 16);
    v25 = v15;
    v26 = v17;
    v27 = v16;
    v28 = 5;
    v18 = type metadata accessor for LSKKey(0, v13, v20, v12);
    MEMORY[0x2426893C4](&protocol conformance descriptor for LSKKey<A>, v18);
    sub_240B0E7C0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t type metadata accessor for LSKLocalStatusObservation.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LSKLocalStatusObservation.CodingKeys);
}

uint64_t LSKLocalStatusObservation.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int *v33;
  char *v34;
  uint64_t v35;
  _QWORD v37[2];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  _QWORD *v51;
  int *v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  char v56;

  v39 = a5;
  v43 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v47 = (char *)v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = sub_240B0E448();
  v42 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  v45 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for LSKLocalStatusObservation.CodingKeys(255, a2, a3, a4);
  MEMORY[0x2426893C4](&unk_240B11B68, v11);
  v50 = sub_240B0E790();
  v44 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v13 = (char *)v37 - v12;
  v40 = a4;
  v41 = a2;
  v48 = a3;
  v14 = type metadata accessor for LSKLocalStatusObservation(0, a2, a3, a4);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (_QWORD *)((char *)v37 - v16);
  v18 = a1[3];
  v51 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  v49 = v13;
  v19 = v52;
  sub_240B0E85C();
  if (v19)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  v21 = v44;
  v20 = v45;
  v38 = v15;
  v23 = v47;
  v22 = v48;
  v52 = (int *)v14;
  v24 = v46;
  v53 = 0;
  v25 = v17;
  *v17 = sub_240B0E76C();
  v17[1] = v26;
  v53 = 1;
  v17[2] = sub_240B0E76C();
  v17[3] = v27;
  v53 = 2;
  v17[4] = sub_240B0E76C();
  v17[5] = v28;
  v53 = 3;
  sub_240B0D224(&qword_257083B70, MEMORY[0x24BDCE960]);
  v37[1] = 0;
  sub_240B0E778();
  (*(void (**)(char *, char *, uint64_t))(v42 + 32))((char *)v17 + v52[13], v20, v24);
  v53 = 4;
  v29 = v41;
  sub_240B0E778();
  (*(void (**)(char *, char *, uint64_t))(v43 + 32))((char *)v25 + v52[14], v23, v29);
  v30 = type metadata accessor for LSKKey(0, v29, v22, v40);
  v56 = 5;
  MEMORY[0x2426893C4](&protocol conformance descriptor for LSKKey<A>, v30);
  sub_240B0E778();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v49, v50);
  v31 = v54;
  v32 = v55;
  v33 = v52;
  v34 = (char *)v25 + v52[15];
  *v34 = v53;
  *((_QWORD *)v34 + 1) = v31;
  *((_QWORD *)v34 + 2) = v32;
  v35 = v38;
  (*(void (**)(uint64_t, uint64_t *, int *))(v38 + 16))(v39, v25, v33);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  return (*(uint64_t (**)(uint64_t *, int *))(v35 + 8))(v25, v33);
}

uint64_t sub_240B0D224(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_240B0E448();
    result = MEMORY[0x2426893C4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_240B0D264@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return LSKLocalStatusObservation.init(from:)(a1, a2[2], a2[3], a2[4], a3);
}

uint64_t sub_240B0D284(_QWORD *a1, _QWORD *a2)
{
  return LSKLocalStatusObservation.encode(to:)(a1, a2);
}

uint64_t static LSKLocalStatusObservation<>.== infix(_:_:)(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v10;
  char v11;
  char v12;
  BOOL v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v24[8];
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[8];
  uint64_t v28;
  uint64_t v29;

  v10 = *a1 == *a2 && a1[1] == a2[1];
  if (v10 || (v11 = sub_240B0E7F0(), v12 = 0, (v11 & 1) != 0))
  {
    v13 = a1[2] == a2[2] && a1[3] == a2[3];
    if (v13 || (v14 = sub_240B0E7F0(), v12 = 0, (v14 & 1) != 0))
    {
      if (a1[4] == a2[4] && a1[5] == a2[5] || (v15 = sub_240B0E7F0(), v12 = 0, (v15 & 1) != 0))
      {
        v16 = type metadata accessor for LSKLocalStatusObservation(0, a3, a4, a5);
        if ((sub_240B0E424() & 1) != 0 && (sub_240B0E520() & 1) != 0)
        {
          v17 = *(int *)(v16 + 60);
          v19 = *(_QWORD *)((char *)a1 + v17 + 8);
          v18 = *(_QWORD *)((char *)a1 + v17 + 16);
          v27[0] = *((_BYTE *)a1 + v17);
          v28 = v19;
          v29 = v18;
          v20 = (char *)a2 + v17;
          LOBYTE(v18) = *v20;
          v22 = *((_QWORD *)v20 + 1);
          v21 = *((_QWORD *)v20 + 2);
          v24[0] = v18;
          v25 = v22;
          v26 = v21;
          v12 = static LSKKey.== infix(_:_:)((uint64_t)v27, (uint64_t)v24);
        }
        else
        {
          v12 = 0;
        }
      }
    }
  }
  return v12 & 1;
}

uint64_t sub_240B0D400(_QWORD *a1, _QWORD *a2, uint64_t *a3)
{
  return static LSKLocalStatusObservation<>.== infix(_:_:)(a1, a2, a3[2], a3[3], a3[4]);
}

uint64_t LSKLocalStatusObservation.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_240B075E8();
  sub_240B0E43C();
  sub_240B0E6D0();
  sub_240B0E568();
  swift_bridgeObjectRelease();
  sub_240B0E568();
  swift_bridgeObjectRetain();
  v0 = sub_240AFBE78(8);
  v2 = v1;
  v4 = v3;
  v6 = v5;
  swift_bridgeObjectRelease();
  MEMORY[0x242688E0C](v0, v2, v4, v6);
  sub_240B0E568();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_240B0E568();
  swift_bridgeObjectRetain();
  sub_240B0E568();
  swift_bridgeObjectRelease();
  sub_240B0E568();
  swift_bridgeObjectRetain();
  sub_240B0E568();
  swift_bridgeObjectRelease();
  sub_240B0E568();
  sub_240B0E7E4();
  sub_240B0E568();
  return 0;
}

uint64_t sub_240B0D5E0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_240B0E448();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_240B0D680(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void (*v28)(uint64_t, uint64_t, uint64_t);
  uint64_t v29;

  v6 = sub_240B0E448();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = *(_QWORD *)(a3 + 16);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_DWORD *)(v11 + 80);
  v13 = *(_QWORD *)(v11 + 64) + 7;
  if ((v12 | v8) > 7
    || ((*(_DWORD *)(v11 + 80) | *(_DWORD *)(v7 + 80)) & 0x100000) != 0
    || ((v13 + ((v9 + ((v8 + 48) & ~v8) + v12) & ~v12)) & 0xFFFFFFFFFFFFFFF8) != 0
    && ((v13 + ((v9 + ((v8 + 48) & ~v8) + v12) & ~v12)) & 0xFFFFFFFFFFFFFFF8) < 0xFFFFFFFFFFFFFFE8)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + (((v12 | v8) & 0xF8 ^ 0x1F8) & ((v12 | v8) + 16)));
    swift_retain();
  }
  else
  {
    v17 = v6;
    v18 = a2[1];
    *a1 = *a2;
    a1[1] = v18;
    v19 = (_QWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
    v20 = (_QWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
    *v19 = *v20;
    v19[1] = v20[1];
    v21 = (_QWORD *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8);
    v22 = (_QWORD *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
    *v21 = *v22;
    v21[1] = v22[1];
    v23 = ((unint64_t)v21 + v8 + 16) & ~v8;
    v24 = ((unint64_t)v22 + v8 + 16) & ~v8;
    v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    v29 = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v28(v23, v24, v17);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))((v23 + v9 + v12) & ~v12, (v24 + v9 + v12) & ~v12, v29);
    v25 = (v13 + ((v23 + v9 + v12) & ~v12)) & 0xFFFFFFFFFFFFFFF8;
    v26 = (v13 + ((v24 + v9 + v12) & ~v12)) & 0xFFFFFFFFFFFFFFF8;
    *(_BYTE *)v25 = *(_BYTE *)v26;
    *(_QWORD *)(v25 + 8) = *(_QWORD *)(v26 + 8);
    *(_QWORD *)(v25 + 16) = *(_QWORD *)(v26 + 16);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_240B0D858(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = sub_240B0E448();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = (((((a1 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v6, v4);
  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((v6
                                                                                            + *(_QWORD *)(v5 + 64)
                                                                                            + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
  return swift_bridgeObjectRelease();
}

_QWORD *sub_240B0D910(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;

  v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  v6 = (_QWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  v7 = (_QWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v6 = *v7;
  v6[1] = v7[1];
  v8 = (_QWORD *)(((unint64_t)v6 + 23) & 0xFFFFFFFFFFFFFFF8);
  v9 = (_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v8 = *v9;
  v8[1] = v9[1];
  v10 = sub_240B0E448();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned __int8 *)(v11 + 80);
  v13 = ((unint64_t)v8 + v12 + 16) & ~v12;
  v14 = ((unint64_t)v9 + v12 + 16) & ~v12;
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v15(v13, v14, v10);
  v16 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v17 = *(unsigned __int8 *)(v16 + 80);
  v18 = *(_QWORD *)(v11 + 64) + v17;
  v19 = (v18 + v13) & ~v17;
  v20 = (v18 + v14) & ~v17;
  (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v19, v20);
  v21 = *(_QWORD *)(v16 + 64) + 7;
  v22 = (v21 + v19) & 0xFFFFFFFFFFFFFFF8;
  v23 = (v21 + v20) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v22 = *(_BYTE *)v23;
  *(_QWORD *)(v22 + 8) = *(_QWORD *)(v23 + 8);
  *(_QWORD *)(v22 + 16) = *(_QWORD *)(v23 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_240B0DA58(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
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
  unint64_t v21;
  unint64_t v22;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (_QWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  v7 = (_QWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v6 = *v7;
  v6[1] = v7[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = (_QWORD *)(((unint64_t)v6 + 23) & 0xFFFFFFFFFFFFFFF8);
  v9 = (_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = sub_240B0E448();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned __int8 *)(v11 + 80);
  v13 = ((unint64_t)v8 + v12 + 16) & ~v12;
  v14 = ((unint64_t)v9 + v12 + 16) & ~v12;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 24))(v13, v14, v10);
  v15 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v16 = *(unsigned __int8 *)(v15 + 80);
  v17 = *(_QWORD *)(v11 + 64) + v16;
  v18 = (v17 + v13) & ~v16;
  v19 = (v17 + v14) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v15 + 24))(v18, v19);
  v20 = *(_QWORD *)(v15 + 64) + 7;
  v21 = (v20 + v18) & 0xFFFFFFFFFFFFFFF8;
  v22 = (v20 + v19) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v21 = *(_BYTE *)v22;
  *(_QWORD *)(v21 + 8) = *(_QWORD *)(v22 + 8);
  *(_QWORD *)(v21 + 16) = *(_QWORD *)(v22 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_240B0DBBC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  _OWORD *v5;
  _OWORD *v6;
  _OWORD *v7;
  _OWORD *v8;
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
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;

  *a1 = *a2;
  v5 = (_OWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  v6 = (_OWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v5 = *v6;
  v7 = (_OWORD *)(((unint64_t)v5 + 23) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_OWORD *)(((unint64_t)v6 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v9 = sub_240B0E448();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = ((unint64_t)v7 + v11 + 16) & ~v11;
  v13 = ((unint64_t)v8 + v11 + 16) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v12, v13, v9);
  v14 = *(_QWORD *)(v10 + 64);
  v15 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v16 = *(unsigned __int8 *)(v15 + 80);
  v17 = v14 + v16;
  v18 = (v17 + v12) & ~v16;
  v19 = (v17 + v13) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v15 + 32))(v18, v19);
  v20 = *(_QWORD *)(v15 + 64) + 7;
  v21 = (v20 + v18) & 0xFFFFFFFFFFFFFFF8;
  v22 = (v20 + v19) & 0xFFFFFFFFFFFFFFF8;
  v23 = *(_QWORD *)(v22 + 16);
  *(_OWORD *)v21 = *(_OWORD *)v22;
  *(_QWORD *)(v21 + 16) = v23;
  return a1;
}

_QWORD *sub_240B0DCB8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
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
  unint64_t v22;
  unint64_t v23;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = (_QWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  v9 = (_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  v10 = (_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRelease();
  v11 = sub_240B0E448();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned __int8 *)(v12 + 80);
  v14 = ((unint64_t)v9 + v13 + 16) & ~v13;
  v15 = ((unint64_t)v10 + v13 + 16) & ~v13;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 40))(v14, v15, v11);
  v16 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v17 = *(unsigned __int8 *)(v16 + 80);
  v18 = *(_QWORD *)(v12 + 64) + v17;
  v19 = (v18 + v14) & ~v17;
  v20 = (v18 + v15) & ~v17;
  (*(void (**)(uint64_t, uint64_t))(v16 + 40))(v19, v20);
  v21 = *(_QWORD *)(v16 + 64) + 7;
  v22 = (v21 + v19) & 0xFFFFFFFFFFFFFFF8;
  v23 = (v21 + v20) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v22 = *(_BYTE *)v23;
  *(_QWORD *)(v22 + 8) = *(_QWORD *)(v23 + 8);
  *(_QWORD *)(v22 + 16) = *(_QWORD *)(v23 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_240B0DDF4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t v21;
  unint64_t v22;

  v6 = sub_240B0E448();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int *)(v7 + 84);
  v9 = *(_QWORD *)(a3 + 16);
  v10 = *(_QWORD *)(v9 - 8);
  if (v8 <= *(_DWORD *)(v10 + 84))
    v11 = *(_DWORD *)(v10 + 84);
  else
    v11 = *(_DWORD *)(v7 + 84);
  if (v11 <= 0x7FFFFFFF)
    v12 = 0x7FFFFFFF;
  else
    v12 = v11;
  if (!a2)
    return 0;
  v13 = v6;
  v14 = *(unsigned __int8 *)(v7 + 80);
  v15 = *(_QWORD *)(v7 + 64);
  v16 = *(unsigned __int8 *)(v10 + 80);
  if (v12 < a2)
  {
    if (((((*(_QWORD *)(v10 + 64) + ((v15 + ((v14 + 48) & ~v14) + v16) & ~v16) + 7) & 0xFFFFFFFFFFFFFFF8) + 24) & 0xFFFFFFF8) != 0)
      v17 = 2;
    else
      v17 = a2 - v12 + 1;
    if (v17 >= 0x10000)
      v18 = 4;
    else
      v18 = 2;
    if (v17 < 0x100)
      v18 = 1;
    if (v17 >= 2)
      v19 = v18;
    else
      v19 = 0;
    __asm { BR              X5 }
  }
  if ((v11 & 0x80000000) != 0)
  {
    v22 = (((((a1 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + v14 + 16) & ~v14;
    if ((_DWORD)v8 == v12)
      return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 48))(v22, v8, v13);
    else
      return (*(uint64_t (**)(unint64_t, _QWORD, uint64_t))(v10 + 48))((v22 + v15 + v16) & ~v16, *(unsigned int *)(v10 + 84), v9);
  }
  else
  {
    v21 = *(_QWORD *)(a1 + 8);
    if (v21 >= 0xFFFFFFFF)
      LODWORD(v21) = -1;
    return (v21 + 1);
  }
}

void sub_240B0DFA0(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  int v16;
  unsigned int v17;

  v8 = *(_QWORD *)(sub_240B0E448() - 8);
  v9 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v8 + 84) <= *(_DWORD *)(v9 + 84))
    v10 = *(_DWORD *)(v9 + 84);
  else
    v10 = *(_DWORD *)(v8 + 84);
  if (v10 <= 0x7FFFFFFF)
    v11 = 0x7FFFFFFF;
  else
    v11 = v10;
  v12 = *(unsigned __int8 *)(v8 + 80);
  v13 = *(unsigned __int8 *)(v9 + 80);
  if (v11 >= a3)
  {
    v16 = 0;
    if (a2 <= v11)
      goto LABEL_20;
  }
  else
  {
    if (((*(_DWORD *)(v9 + 64)
         + ((*(_DWORD *)(v8 + 64) + (((_DWORD)v12 + 48) & ~(_DWORD)v12) + (_DWORD)v13) & ~(_DWORD)v13)
         + 7) & 0xFFFFFFF8) == 0xFFFFFFE8)
      v14 = a3 - v11 + 1;
    else
      v14 = 2;
    if (v14 >= 0x10000)
      v15 = 4;
    else
      v15 = 2;
    if (v14 < 0x100)
      v15 = 1;
    if (v14 >= 2)
      v16 = v15;
    else
      v16 = 0;
    if (a2 <= v11)
LABEL_20:
      __asm { BR              X5 }
  }
  if (((*(_DWORD *)(v9 + 64)
       + ((*(_DWORD *)(v8 + 64) + (((_DWORD)v12 + 48) & ~(_DWORD)v12) + (_DWORD)v13) & ~(_DWORD)v13)
       + 7) & 0xFFFFFFF8) != 0xFFFFFFE8)
  {
    v17 = ~v11 + a2;
    bzero(a1, ((*(_QWORD *)(v9 + 64) + ((*(_QWORD *)(v8 + 64) + ((v12 + 48) & ~v12) + v13) & ~v13) + 7) & 0xFFFFFFFFFFFFFFF8)+ 24);
    *a1 = v17;
  }
  __asm { BR              X10 }
}

void sub_240B0E0E4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x240B0E160);
}

void sub_240B0E0EC()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  *(_DWORD *)(v0 + v2) = 0;
  if (v1)
    JUMPOUT(0x240B0E0F4);
  JUMPOUT(0x240B0E160);
}

void sub_240B0E108()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x240B0E160);
}

void sub_240B0E110()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x240B0E160);
}

void sub_240B0E118()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  *(_WORD *)(v1 + v3) = 0;
  if (v2)
  {
    if (v0 < 0)
      JUMPOUT(0x240B0E124);
    if (v2 < 0)
      JUMPOUT(0x240B0E158);
    *(_QWORD *)(v1 + 8) = (v2 - 1);
  }
  JUMPOUT(0x240B0E160);
}

uint64_t sub_240B0E1A4(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t sub_240B0E234(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_240B0E280 + 4 * byte_240B1193A[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_240B0E2B4 + 4 * asc_240B11932[v4 + 3]))();
}

uint64_t sub_240B0E2B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B0E2BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240B0E2C4);
  return result;
}

uint64_t sub_240B0E2D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240B0E2D8);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_240B0E2DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B0E2E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_240B0E2F0()
{
  JUMPOUT(0x2426893C4);
}

void sub_240B0E300()
{
  JUMPOUT(0x2426893C4);
}

void sub_240B0E310()
{
  JUMPOUT(0x2426893C4);
}

uint64_t sub_240B0E320()
{
  return 6;
}

uint64_t sub_240B0E328()
{
  return MEMORY[0x24BDCB170]();
}

uint64_t sub_240B0E334()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_240B0E340()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_240B0E34C()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_240B0E358()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_240B0E364()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_240B0E370()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_240B0E37C()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_240B0E388()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_240B0E394()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_240B0E3A0()
{
  return MEMORY[0x24BDCC6B8]();
}

uint64_t sub_240B0E3AC()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_240B0E3B8()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_240B0E3C4()
{
  return MEMORY[0x24BDCE638]();
}

uint64_t sub_240B0E3D0()
{
  return MEMORY[0x24BDCE658]();
}

uint64_t sub_240B0E3DC()
{
  return MEMORY[0x24BDCE698]();
}

uint64_t sub_240B0E3E8()
{
  return MEMORY[0x24BDCE6B8]();
}

uint64_t sub_240B0E3F4()
{
  return MEMORY[0x24BDCE6C0]();
}

uint64_t sub_240B0E400()
{
  return MEMORY[0x24BDCE6C8]();
}

uint64_t sub_240B0E40C()
{
  return MEMORY[0x24BDCE708]();
}

uint64_t sub_240B0E418()
{
  return MEMORY[0x24BDCE760]();
}

uint64_t sub_240B0E424()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_240B0E430()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_240B0E43C()
{
  return MEMORY[0x24BDCE8D8]();
}

uint64_t sub_240B0E448()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_240B0E454()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_240B0E460()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_240B0E46C()
{
  return MEMORY[0x24BDCF0D0]();
}

uint64_t sub_240B0E478()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_240B0E484()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_240B0E490()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_240B0E49C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_240B0E4A8()
{
  return MEMORY[0x24BE8FAF0]();
}

uint64_t sub_240B0E4B4()
{
  return MEMORY[0x24BE8FB00]();
}

uint64_t sub_240B0E4C0()
{
  return MEMORY[0x24BE8FB08]();
}

uint64_t sub_240B0E4CC()
{
  return MEMORY[0x24BE8FB10]();
}

uint64_t _s14LocalStatusKit07PublishB10InvocationC4nameACSS_tcfc_0()
{
  return MEMORY[0x24BE8FB20]();
}

uint64_t _s14LocalStatusKit07PublishB10InvocationC5coderACSgSo7NSCoderC_tcfc_0()
{
  return MEMORY[0x24BE8FB28]();
}

uint64_t sub_240B0E4F0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_240B0E4FC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_240B0E508()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_240B0E514()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_240B0E520()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_240B0E52C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_240B0E538()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_240B0E544()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_240B0E550()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_240B0E55C()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_240B0E568()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_240B0E574()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_240B0E580()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_240B0E58C()
{
  return MEMORY[0x24BDCFB60]();
}

uint64_t sub_240B0E598()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_240B0E5A4()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_240B0E5B0()
{
  return MEMORY[0x24BEE1040]();
}

uint64_t sub_240B0E5BC()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_240B0E5C8()
{
  return MEMORY[0x24BEE10C0]();
}

uint64_t sub_240B0E5D4()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_240B0E5E0()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_240B0E5EC()
{
  return MEMORY[0x24BEE6908]();
}

uint64_t sub_240B0E5F8()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_240B0E604()
{
  return MEMORY[0x24BEE6C20]();
}

uint64_t sub_240B0E610()
{
  return MEMORY[0x24BEE6C28]();
}

uint64_t sub_240B0E61C()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_240B0E628()
{
  return MEMORY[0x24BDCFD68]();
}

uint64_t sub_240B0E634()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_240B0E640()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_240B0E64C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_240B0E658()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_240B0E664()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_240B0E670()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_240B0E67C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_240B0E688()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_240B0E694()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_240B0E6A0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_240B0E6AC()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_240B0E6B8()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_240B0E6C4()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_240B0E6D0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_240B0E6DC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_240B0E6E8()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_240B0E6F4()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_240B0E700()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_240B0E70C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_240B0E718()
{
  return MEMORY[0x24BEE6EF0]();
}

uint64_t sub_240B0E724()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_240B0E730()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_240B0E73C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_240B0E748()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_240B0E754()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_240B0E760()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_240B0E76C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_240B0E778()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_240B0E784()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_240B0E790()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_240B0E79C()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_240B0E7A8()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_240B0E7B4()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_240B0E7C0()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_240B0E7CC()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_240B0E7D8()
{
  return MEMORY[0x24BEE7078]();
}

uint64_t sub_240B0E7E4()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_240B0E7F0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_240B0E7FC()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_240B0E808()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_240B0E814()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_240B0E820()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_240B0E82C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_240B0E838()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_240B0E844()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_240B0E850()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_240B0E85C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_240B0E868()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_240B0E874()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_240B0E880()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_240B0E88C()
{
  return MEMORY[0x24BEE4A98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

