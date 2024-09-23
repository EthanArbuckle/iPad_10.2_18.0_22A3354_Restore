uint64_t DTXPCCoder.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_23A521740();
  swift_allocObject();
  v2 = sub_23A521734();
  sub_23A52171C();
  swift_allocObject();
  result = sub_23A521710();
  *a1 = v2;
  a1[1] = result;
  return result;
}

xpc_object_t DTXPCCoder.encode<A>(_:)()
{
  uint64_t v0;
  xpc_object_t empty;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;

  empty = xpc_dictionary_create_empty();
  v2 = sub_23A521728();
  if (!v0)
  {
    v4 = v2;
    v5 = v3;
    v6 = (void *)sub_23A52186C();
    sub_23A4FBF48(v4, v5);
    xpc_dictionary_set_value(empty, "data", v6);
  }
  swift_unknownObjectRelease();
  return empty;
}

uint64_t sub_23A4FBF48(uint64_t a1, unint64_t a2)
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

uint64_t DTXPCCoder.encode<A>(_:into:)(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;

  result = sub_23A521728();
  if (!v2)
  {
    v6 = result;
    v7 = v5;
    v8 = (void *)sub_23A52186C();
    sub_23A4FBF48(v6, v7);
    xpc_dictionary_set_value(a2, "data", v8);
    return swift_unknownObjectRelease();
  }
  return result;
}

void DTXPCCoder.encode(_:into:)(void *a1, void *a2)
{
  uint64_t v2;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;

  type metadata accessor for DTError();
  v5 = a1;
  v10 = DTError.__allocating_init(_:)(a1);
  sub_23A4FCBFC(&qword_25698ABF0, (uint64_t)&protocol conformance descriptor for DTError);
  v6 = sub_23A521728();
  v8 = v7;

  if (!v2)
  {
    v9 = (void *)sub_23A52186C();
    sub_23A4FBF48(v6, v8);
    xpc_dictionary_set_value(a2, "error", v9);
    swift_unknownObjectRelease();
  }
}

uint64_t DTXPCCoder.encode(data:into:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;

  v4 = (void *)sub_23A52186C();
  xpc_dictionary_set_value(a3, "data", v4);
  return swift_unknownObjectRelease();
}

uint64_t DTXPCCoder.decode<A>(_:)(void *a1)
{
  uint64_t v1;
  _BYTE *data;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;
  _BYTE *v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unsigned int v17;
  size_t length[2];

  length[1] = *MEMORY[0x24BDAC8D0];
  length[0] = 0;
  data = xpc_dictionary_get_data(a1, "data", length);
  if (data)
  {
    v4 = sub_23A4FCB50(data, length[0]);
    v6 = v5;
    sub_23A521704();
    return sub_23A4FBF48(v4, v6);
  }
  v8 = xpc_dictionary_get_data(a1, "error", length);
  if (!v8)
  {
    v13 = sub_23A5219C8();
    swift_unknownObjectRelease();
    if ((void *)v13 == a1)
    {
      type metadata accessor for DTError();
      v15 = 0x65746E6920435058;
      v17 = 1886745202;
    }
    else
    {
      v14 = sub_23A5219BC();
      swift_unknownObjectRelease();
      type metadata accessor for DTError();
      if ((void *)v14 != a1)
      {
        v15 = 0x6420435058206F4ELL;
        v16 = 0xEB00000000617461;
LABEL_13:
        DTError.__allocating_init(_:_:_:)(3, v15, v16, 0);
        return swift_willThrow();
      }
      v15 = 0x61766E6920435058;
      v17 = 1633970540;
    }
    v16 = v17 | 0xEF64657400000000;
    goto LABEL_13;
  }
  v9 = v8;
  type metadata accessor for DTError();
  v10 = sub_23A4FCB50(v9, length[0]);
  v12 = v11;
  sub_23A4FCBFC(&qword_25698ABF8, (uint64_t)&protocol conformance descriptor for DTError);
  sub_23A521704();
  result = sub_23A4FBF48(v10, v12);
  if (!v1)
    return swift_willThrow();
  return result;
}

uint64_t DTXPCEndpoint.xpcEndpoint.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t DTXPCEndpoint.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t DTXPCRequest.context.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1[1];
  v3 = v1[2];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id DTXPCRequest.request.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v2 = *(void **)(v1 + 24);
  v3 = *(_QWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 40);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  v5 = *(_BYTE *)(v1 + 48);
  *(_BYTE *)(a1 + 24) = v5;
  return sub_23A4FCC3C(v2, v3, v4, v5);
}

__n128 DTXPCRequest.init(request:context:)@<Q0>(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v3;
  unsigned __int8 v4;
  uint64_t v5;
  __n128 result;

  v3 = a1[1].n128_u64[0];
  v4 = a1[1].n128_u8[8];
  v5 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a3 = *(_OWORD *)a2;
  *(_QWORD *)(a3 + 16) = v5;
  result = *a1;
  *(__n128 *)(a3 + 24) = *a1;
  *(_QWORD *)(a3 + 40) = v3;
  *(_BYTE *)(a3 + 48) = v4;
  return result;
}

uint64_t DTXPCRequest.description.getter()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v1 = *(void **)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v5 = *(_BYTE *)(v0 + 48);
  sub_23A4FCC3C(v1, v2, v3, v5);
  sub_23A4FCC7C();
  sub_23A521DE8();
  sub_23A521A70();
  swift_bridgeObjectRelease();
  sub_23A4FCCC0(v1, v2, v3, v5);
  sub_23A521A70();
  sub_23A4FCD00();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A521DE8();
  sub_23A521A70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0x3D74736575716572;
}

BOOL sub_23A4FC520(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23A4FC538()
{
  sub_23A521E54();
  sub_23A521E60();
  return sub_23A521E6C();
}

uint64_t sub_23A4FC57C()
{
  return sub_23A521E60();
}

uint64_t sub_23A4FC5A4()
{
  sub_23A521E54();
  sub_23A521E60();
  return sub_23A521E6C();
}

uint64_t sub_23A4FC5E4()
{
  _BYTE *v0;

  if (*v0)
    return 0x74736575716572;
  else
    return 0x747865746E6F63;
}

uint64_t sub_23A4FC618@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A4FD948(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A4FC63C()
{
  return 0;
}

void sub_23A4FC648(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23A4FC654()
{
  sub_23A4FCDA8();
  return sub_23A521EA8();
}

uint64_t sub_23A4FC67C()
{
  sub_23A4FCDA8();
  return sub_23A521EB4();
}

uint64_t DTXPCRequest.encode(to:)(_QWORD *a1)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  char v18;
  int v19;
  char v20;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AC10);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v1;
  v9 = *((_QWORD *)v1 + 2);
  v8 = *((_QWORD *)v1 + 3);
  v13 = *((_QWORD *)v1 + 4);
  v14 = v8;
  v12 = *((_QWORD *)v1 + 5);
  v19 = *((unsigned __int8 *)v1 + 48);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A4FCDA8();
  sub_23A521E9C();
  v16 = v15;
  v17 = v9;
  v20 = 0;
  sub_23A4FCDEC();
  sub_23A521DD0();
  if (!v2)
  {
    *(_QWORD *)&v16 = v14;
    *((_QWORD *)&v16 + 1) = v13;
    v17 = v12;
    v18 = v19;
    v20 = 1;
    sub_23A4FCE30();
    sub_23A521DD0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void DTXPCRequest.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AC28);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A4FCDA8();
  sub_23A521E90();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v21 = 0;
    sub_23A4FCE94();
    sub_23A521D7C();
    v9 = v18;
    v16 = v17;
    v10 = v19;
    v21 = 1;
    sub_23A4FCED8();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23A521D7C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v11 = v17;
    v12 = v18;
    v13 = v19;
    v14 = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23A4FCC3C(v11, v12, v13, v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)a2 = v16;
    *(_QWORD *)(a2 + 8) = v9;
    *(_QWORD *)(a2 + 16) = v10;
    *(_QWORD *)(a2 + 24) = v11;
    *(_QWORD *)(a2 + 32) = v12;
    *(_QWORD *)(a2 + 40) = v13;
    *(_BYTE *)(a2 + 48) = v14;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23A4FCCC0(v11, v12, v13, v14);
  }
}

void sub_23A4FCA64(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  DTXPCRequest.init(from:)(a1, a2);
}

uint64_t sub_23A4FCA78(_QWORD *a1)
{
  return DTXPCRequest.encode(to:)(a1);
}

uint64_t sub_23A4FCA90(_BYTE *__src, _BYTE *a2)
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

uint64_t sub_23A4FCB50(_BYTE *__src, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  if (a2 <= 14)
    return sub_23A4FCA90(__src, &__src[a2]);
  sub_23A521824();
  swift_allocObject();
  sub_23A5217F4();
  if ((unint64_t)a2 < 0x7FFFFFFF)
    return a2 << 32;
  sub_23A521878();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t sub_23A4FCBFC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for DTError();
    result = MEMORY[0x23B850924](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

id sub_23A4FCC3C(id result, uint64_t a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      result = result;
      break;
    case 5:
    case 8:
      result = (id)swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_23A4FCC7C()
{
  unint64_t result;

  result = qword_25698AC00;
  if (!qword_25698AC00)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTRequest, &type metadata for DTRequest);
    atomic_store(result, (unint64_t *)&qword_25698AC00);
  }
  return result;
}

void sub_23A4FCCC0(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:

      break;
    case 5:
    case 8:
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

unint64_t sub_23A4FCD00()
{
  unint64_t result;

  result = qword_25698AC08;
  if (!qword_25698AC08)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTRequestContext, &type metadata for DTRequestContext);
    atomic_store(result, (unint64_t *)&qword_25698AC08);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B85090C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
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

unint64_t sub_23A4FCDA8()
{
  unint64_t result;

  result = qword_25698B5E0[0];
  if (!qword_25698B5E0[0])
  {
    result = MEMORY[0x23B850924](&unk_23A52287C, &type metadata for DTXPCRequest.CodingKeys);
    atomic_store(result, qword_25698B5E0);
  }
  return result;
}

unint64_t sub_23A4FCDEC()
{
  unint64_t result;

  result = qword_25698AC18;
  if (!qword_25698AC18)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTRequestContext, &type metadata for DTRequestContext);
    atomic_store(result, (unint64_t *)&qword_25698AC18);
  }
  return result;
}

unint64_t sub_23A4FCE30()
{
  unint64_t result;

  result = qword_25698AC20;
  if (!qword_25698AC20)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTRequest, &type metadata for DTRequest);
    atomic_store(result, (unint64_t *)&qword_25698AC20);
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

unint64_t sub_23A4FCE94()
{
  unint64_t result;

  result = qword_25698AC30;
  if (!qword_25698AC30)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTRequestContext, &type metadata for DTRequestContext);
    atomic_store(result, (unint64_t *)&qword_25698AC30);
  }
  return result;
}

unint64_t sub_23A4FCED8()
{
  unint64_t result;

  result = qword_25698AC38;
  if (!qword_25698AC38)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTRequest, &type metadata for DTRequest);
    atomic_store(result, (unint64_t *)&qword_25698AC38);
  }
  return result;
}

uint64_t destroy for DTXPCCoder()
{
  swift_release();
  return swift_release();
}

_QWORD *_s17DistributedTimers10DTXPCCoderVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for DTXPCCoder(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for DTXPCCoder(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DTXPCCoder(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DTXPCCoder(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for DTXPCCoder()
{
  return &type metadata for DTXPCCoder;
}

ValueMetadata *type metadata accessor for DTXPCEndpoint()
{
  return &type metadata for DTXPCEndpoint;
}

uint64_t sub_23A4FD0C4(uint64_t a1, unint64_t a2)
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

uint64_t destroy for DTXPCReplyContent(uint64_t a1)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(a1 + 40);
  if (v1 >= 2)
    v1 = *(_DWORD *)a1 + 2;
  if (v1 == 1)
    return __swift_destroy_boxed_opaque_existential_1(a1);
  else
    return sub_23A4FBF48(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t initializeWithCopy for DTXPCReplyContent(uint64_t a1, uint64_t *a2)
{
  unsigned int v3;
  __int128 v4;
  char v5;
  uint64_t v6;
  unint64_t v7;

  v3 = *((unsigned __int8 *)a2 + 40);
  if (v3 >= 2)
    v3 = *(_DWORD *)a2 + 2;
  if (v3 == 1)
  {
    v4 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v4;
    (**(void (***)(uint64_t))(v4 - 8))(a1);
    v5 = 1;
  }
  else
  {
    v6 = *a2;
    v7 = a2[1];
    sub_23A4FD0C4(*a2, v7);
    v5 = 0;
    *(_QWORD *)a1 = v6;
    *(_QWORD *)(a1 + 8) = v7;
  }
  *(_BYTE *)(a1 + 40) = v5;
  return a1;
}

uint64_t assignWithCopy for DTXPCReplyContent(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  char v7;
  unint64_t v8;
  uint64_t v9;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2)
      v4 = *(_DWORD *)a1 + 2;
    if (v4 == 1)
      __swift_destroy_boxed_opaque_existential_1(a1);
    else
      sub_23A4FBF48(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
    v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2)
      v5 = *(_DWORD *)a2 + 2;
    if (v5 == 1)
    {
      v6 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 24) = v6;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
      v7 = 1;
    }
    else
    {
      v9 = *(_QWORD *)a2;
      v8 = *(_QWORD *)(a2 + 8);
      sub_23A4FD0C4(v9, v8);
      v7 = 0;
      *(_QWORD *)a1 = v9;
      *(_QWORD *)(a1 + 8) = v8;
    }
    *(_BYTE *)(a1 + 40) = v7;
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

uint64_t assignWithTake for DTXPCReplyContent(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  __int128 v6;
  char v7;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2)
      v4 = *(_DWORD *)a1 + 2;
    if (v4 == 1)
      __swift_destroy_boxed_opaque_existential_1(a1);
    else
      sub_23A4FBF48(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
    v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2)
      v5 = *(_DWORD *)a2 + 2;
    if (v5 == 1)
    {
      v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      v7 = 1;
    }
    else
    {
      v7 = 0;
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    *(_BYTE *)(a1 + 40) = v7;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for DTXPCReplyContent(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 2)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DTXPCReplyContent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_23A4FD3BC(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 2)
    return (*(_DWORD *)a1 + 2);
  return result;
}

uint64_t sub_23A4FD3DC(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(_QWORD *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DTXPCReplyContent()
{
  return &type metadata for DTXPCReplyContent;
}

uint64_t initializeBufferWithCopyOfBuffer for DTRequest(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for DTXPCRequest(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A4FCCC0(*(void **)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
}

uint64_t initializeWithCopy for DTXPCRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_BYTE *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A4FCC3C(v4, v5, v6, v7);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = v6;
  *(_BYTE *)(a1 + 48) = v7;
  return a1;
}

uint64_t assignWithCopy for DTXPCRequest(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v2 = a2;
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = v2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)v2[3];
  v5 = v2[4];
  v6 = v2[5];
  LOBYTE(v2) = *((_BYTE *)v2 + 48);
  sub_23A4FCC3C(v4, v5, v6, (char)v2);
  v7 = *(void **)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = v6;
  v10 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = (_BYTE)v2;
  sub_23A4FCCC0(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DTXPCRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 40);
  v5 = *(_BYTE *)(a2 + 48);
  v6 = *(void **)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = v4;
  v9 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v5;
  sub_23A4FCCC0(v6, v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for DTXPCRequest(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 49))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DTXPCRequest(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 49) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 49) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for DTXPCRequest()
{
  return &type metadata for DTXPCRequest;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DTXPCRequest.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DTXPCRequest.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A4FD7DC + 4 * byte_23A5226B7[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A4FD810 + 4 * byte_23A5226B2[v4]))();
}

uint64_t sub_23A4FD810(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4FD818(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A4FD820);
  return result;
}

uint64_t sub_23A4FD82C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A4FD834);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A4FD838(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4FD840(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4FD84C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23A4FD854(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DTXPCRequest.CodingKeys()
{
  return &type metadata for DTXPCRequest.CodingKeys;
}

unint64_t sub_23A4FD874()
{
  unint64_t result;

  result = qword_25698B870[0];
  if (!qword_25698B870[0])
  {
    result = MEMORY[0x23B850924](&unk_23A522854, &type metadata for DTXPCRequest.CodingKeys);
    atomic_store(result, qword_25698B870);
  }
  return result;
}

unint64_t sub_23A4FD8BC()
{
  unint64_t result;

  result = qword_25698B980;
  if (!qword_25698B980)
  {
    result = MEMORY[0x23B850924](&unk_23A5227C4, &type metadata for DTXPCRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698B980);
  }
  return result;
}

unint64_t sub_23A4FD904()
{
  unint64_t result;

  result = qword_25698B988[0];
  if (!qword_25698B988[0])
  {
    result = MEMORY[0x23B850924](&unk_23A5227EC, &type metadata for DTXPCRequest.CodingKeys);
    atomic_store(result, qword_25698B988);
  }
  return result;
}

uint64_t sub_23A4FD948(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x747865746E6F63 && a2 == 0xE700000000000000;
  if (v2 || (sub_23A521E18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74736575716572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23A521E18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A4FDA3C()
{
  uint64_t v0;

  v0 = sub_23A5219A4();
  __swift_allocate_value_buffer(v0, qword_25698BA18);
  __swift_project_value_buffer(v0, (uint64_t)qword_25698BA18);
  sub_23A50D098();
  swift_bridgeObjectRetain();
  return sub_23A521998();
}

void DTAnalyticsLogEvent(_:)(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  __int128 v31;
  char v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v1 = 0xD000000000000021;
  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 < 0)
  {
    v6 = *(_QWORD *)(a1 + 64);
    LOBYTE(v28) = *(_QWORD *)a1;
    v29 = v2;
    v30 = v3;
    v31 = *(_OWORD *)(a1 + 24);
    v32 = v4;
    v33 = *(_OWORD *)(a1 + 48);
    v34 = v6;
    DTAnalyticsTimerDetails.eventPayload.getter();
    v5 = "com.apple.DistributedTimers.timer";
  }
  else
  {
    LOBYTE(v28) = *(_QWORD *)a1;
    v29 = v2;
    v30 = v3;
    DTAnalyticsMonitorDetails.eventPayload.getter();
    v1 = 0xD000000000000023;
    v5 = "com.apple.DistributedTimers.monitor";
  }
  v7 = (unint64_t)(v5 - 32) | 0x8000000000000000;
  v8 = (void *)objc_opt_self();
  sub_23A4FE5BC();
  v9 = (void *)sub_23A5219F8();
  v28 = 0;
  v10 = objc_msgSend(v8, sel_dataWithJSONObject_options_error_, v9, 0, &v28);

  v11 = (id)v28;
  if (v10)
  {
    sub_23A521884();
    v13 = v12;

    __asm { BR              X10 }
  }
  v14 = v11;
  v15 = v1;
  v16 = sub_23A52183C();

  swift_willThrow();
  v28 = 0x22726F727265227BLL;
  v29 = 0xE90000000000003ALL;
  swift_getErrorValue();
  sub_23A521E3C();
  sub_23A521A70();
  swift_bridgeObjectRelease();
  sub_23A521A70();
  v17 = (void *)v16;
  v18 = v15;

  v19 = v28;
  v20 = v29;
  if (qword_25698BA10 != -1)
    swift_once();
  v21 = sub_23A5219A4();
  __swift_project_value_buffer(v21, (uint64_t)qword_25698BA18);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v22 = sub_23A52198C();
  v23 = sub_23A521B90();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = swift_slowAlloc();
    v25 = swift_slowAlloc();
    v28 = v25;
    *(_DWORD *)v24 = 136446466;
    swift_bridgeObjectRetain();
    sub_23A4FEAB8(v18, v7, &v28);
    sub_23A521BF0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v24 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_23A4FEAB8(v19, v20, &v28);
    sub_23A521BF0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23A4FA000, v22, v23, "Event: name=%{public}s, payload=%s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B8509A8](v25, -1, -1);
    MEMORY[0x23B8509A8](v24, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v26 = (void *)sub_23A521A1C();
  swift_bridgeObjectRelease();
  v27 = (void *)sub_23A5219F8();
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();

}

unint64_t DTAnalyticsEvent.eventName.getter()
{
  uint64_t v0;

  if (*(uint64_t *)(v0 + 40) < 0)
    return 0xD000000000000021;
  else
    return 0xD000000000000023;
}

unint64_t DTAnalyticsEvent.eventPayload.getter()
{
  uint64_t v0;

  if ((*(_QWORD *)(v0 + 40) & 0x8000000000000000) != 0)
    return DTAnalyticsTimerDetails.eventPayload.getter();
  else
    return DTAnalyticsMonitorDetails.eventPayload.getter();
}

unint64_t DTAnalyticsMonitorDetails.eventPayload.getter()
{
  uint64_t v0;
  void *v1;
  uint64_t inited;
  id v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698AD18);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A5228E0;
  strcpy((char *)(inited + 32), "accessoryType");
  *(_WORD *)(inited + 46) = -4864;
  *(_QWORD *)(inited + 48) = sub_23A521B60();
  *(_QWORD *)(inited + 56) = 0x6E6F697461727564;
  *(_QWORD *)(inited + 64) = 0xEF73646E6F636553;
  *(_QWORD *)(inited + 72) = sub_23A521E84();
  *(_QWORD *)(inited + 80) = 0x646F43726F727265;
  *(_QWORD *)(inited + 88) = 0xE900000000000065;
  if (v1)
  {
    objc_msgSend(v1, sel_code);
    *(_QWORD *)(inited + 96) = sub_23A521B60();
    *(_QWORD *)(inited + 104) = 0x6D6F44726F727265;
    *(_QWORD *)(inited + 112) = 0xEB000000006E6961;
    v3 = objc_msgSend(v1, sel_domain);
    sub_23A521A28();

  }
  else
  {
    *(_QWORD *)(inited + 96) = sub_23A521B60();
    *(_QWORD *)(inited + 104) = 0x6D6F44726F727265;
    *(_QWORD *)(inited + 112) = 0xEB000000006E6961;
  }
  v4 = sub_23A521A1C();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 120) = v4;
  return sub_23A4FE858(inited);
}

unint64_t DTAnalyticsTimerDetails.eventPayload.getter()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t inited;
  id v7;
  uint64_t v8;
  _QWORD v10[3];
  char v11;

  v1 = *(void **)(v0 + 8);
  v2 = *(void **)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(_QWORD *)(v0 + 32);
  v5 = *(_BYTE *)(v0 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698AD18);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A5228F0;
  strcpy((char *)(inited + 32), "accessoryType");
  *(_WORD *)(inited + 46) = -4864;
  *(_QWORD *)(inited + 48) = sub_23A521B60();
  *(_QWORD *)(inited + 56) = 0x6E6F69746361;
  *(_QWORD *)(inited + 64) = 0xE600000000000000;
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v11 = v5;
  sub_23A4FCC3C(v2, v3, v4, v5);
  DTAnalyticsTimerAction.init(_:)((uint64_t)v10);
  *(_QWORD *)(inited + 72) = sub_23A521B60();
  *(_QWORD *)(inited + 80) = 0x646F43726F727265;
  *(_QWORD *)(inited + 88) = 0xE900000000000065;
  if (v1)
  {
    objc_msgSend(v1, sel_code);
    *(_QWORD *)(inited + 96) = sub_23A521B60();
    *(_QWORD *)(inited + 104) = 0x6D6F44726F727265;
    *(_QWORD *)(inited + 112) = 0xEB000000006E6961;
    v7 = objc_msgSend(v1, sel_domain);
    sub_23A521A28();

  }
  else
  {
    *(_QWORD *)(inited + 96) = sub_23A521B60();
    *(_QWORD *)(inited + 104) = 0x6D6F44726F727265;
    *(_QWORD *)(inited + 112) = 0xEB000000006E6961;
  }
  v8 = sub_23A521A1C();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 120) = v8;
  *(_QWORD *)(inited + 128) = 0x734D747472;
  *(_QWORD *)(inited + 136) = 0xE500000000000000;
  *(_QWORD *)(inited + 144) = sub_23A521E84();
  *(_QWORD *)(inited + 152) = 0x656372756F73;
  *(_QWORD *)(inited + 160) = 0xE600000000000000;
  *(_QWORD *)(inited + 168) = sub_23A521A1C();
  return sub_23A4FE858(inited);
}

unint64_t sub_23A4FE5BC()
{
  unint64_t result;

  result = qword_25698AD00;
  if (!qword_25698AD00)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25698AD00);
  }
  return result;
}

unint64_t sub_23A4FE5F8()
{
  uint64_t v0;

  if ((*(_QWORD *)(v0 + 40) & 0x8000000000000000) != 0)
    return DTAnalyticsTimerDetails.eventPayload.getter();
  else
    return DTAnalyticsMonitorDetails.eventPayload.getter();
}

DistributedTimers::DTAnalyticsAccessoryType_optional __swiftcall DTAnalyticsAccessoryType.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 3;
  if ((unint64_t)rawValue < 3)
    v2 = rawValue;
  *v1 = v2;
  return (DistributedTimers::DTAnalyticsAccessoryType_optional)rawValue;
}

DistributedTimers::DTAnalyticsAccessoryType_optional sub_23A4FE684(Swift::Int *a1)
{
  return DTAnalyticsAccessoryType.init(rawValue:)(*a1);
}

void DTAnalyticsTimerAction.init(_:)(uint64_t a1)
{
  __asm { BR              X11 }
}

void sub_23A4FE6C8(void *a1, uint64_t a2, uint64_t a3)
{
  _BYTE *v3;

  sub_23A4FCCC0(a1, a2, a3, 0);
  *v3 = 1;
}

DistributedTimers::DTAnalyticsTimerAction_optional __swiftcall DTAnalyticsTimerAction.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 11;
  if ((unint64_t)rawValue < 0xB)
    v2 = rawValue;
  *v1 = v2;
  return (DistributedTimers::DTAnalyticsTimerAction_optional)rawValue;
}

uint64_t DTAnalyticsTimerAction.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_23A4FE790(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

DistributedTimers::DTAnalyticsTimerAction_optional sub_23A4FE7A4(Swift::Int *a1)
{
  return DTAnalyticsTimerAction.init(rawValue:)(*a1);
}

void sub_23A4FE7AC(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

void DTAnalyticsMonitorDetails.accessoryType.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t DTAnalyticsMonitorDetails.durationSeconds.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

void *DTAnalyticsMonitorDetails.error.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  v2 = v1;
  return v1;
}

void default argument 0 of DTAnalyticsMonitorDetails.init(accessoryType:durationSeconds:error:)(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void DTAnalyticsMonitorDetails.init(accessoryType:durationSeconds:error:)(char *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  char v6;
  uint64_t v8;

  v6 = *a1;
  if (a3)
  {
    v8 = sub_23A521830();

  }
  else
  {
    v8 = 0;
  }
  *(_BYTE *)a4 = v6;
  *(_QWORD *)(a4 + 8) = a2;
  *(_QWORD *)(a4 + 16) = v8;
}

unint64_t sub_23A4FE858(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698AD30);
  v2 = (_QWORD *)sub_23A521CF8();
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
    result = sub_23A4FF1A4(v5, v6);
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

void DTAnalyticsTimerDetails.accessoryType.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

void *DTAnalyticsTimerDetails.error.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 8);
  v2 = v1;
  return v1;
}

id DTAnalyticsTimerDetails.request.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v2 = *(void **)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  v5 = *(_BYTE *)(v1 + 40);
  *(_BYTE *)(a1 + 24) = v5;
  return sub_23A4FCC3C(v2, v3, v4, v5);
}

uint64_t DTAnalyticsTimerDetails.rttMs.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t DTAnalyticsTimerDetails.source.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

void DTAnalyticsTimerDetails.init(accessoryType:error:request:rttMs:source:)(char *a1@<X0>, void *a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  char v11;
  __int128 v12;
  uint64_t v13;
  char v14;
  uint64_t v16;
  __int128 v17;

  v11 = *a1;
  v12 = *a3;
  v13 = *((_QWORD *)a3 + 2);
  v14 = *((_BYTE *)a3 + 24);
  if (a2)
  {
    v17 = *a3;
    v16 = sub_23A521830();

    v12 = v17;
  }
  else
  {
    v16 = 0;
  }
  *(_BYTE *)a7 = v11;
  *(_QWORD *)(a7 + 8) = v16;
  *(_OWORD *)(a7 + 16) = v12;
  *(_QWORD *)(a7 + 32) = v13;
  *(_BYTE *)(a7 + 40) = v14;
  *(_QWORD *)(a7 + 48) = a4;
  *(_QWORD *)(a7 + 56) = a5;
  *(_QWORD *)(a7 + 64) = a6;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23A4FEAB8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23A4FEB88(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23A50011C((uint64_t)v12, *a3);
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
      sub_23A50011C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23A4FEB88(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23A521BFC();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23A4FED40(a5, a6);
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
  v8 = sub_23A521CA4();
  if (!v8)
  {
    sub_23A521CBC();
    __break(1u);
LABEL_17:
    result = sub_23A521D04();
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

uint64_t sub_23A4FED40(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23A4FEDD4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23A4FEFAC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23A4FEFAC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23A4FEDD4(uint64_t a1, unint64_t a2)
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
      v3 = sub_23A4FEF48(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23A521C74();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23A521CBC();
      __break(1u);
LABEL_10:
      v2 = sub_23A521A7C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23A521D04();
    __break(1u);
LABEL_14:
    result = sub_23A521CBC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23A4FEF48(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698B4D0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23A4FEFAC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698B4D0);
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
  result = sub_23A521D04();
  __break(1u);
  return result;
}

uint64_t sub_23A4FF0F8(uint64_t a1, unint64_t a2)
{
  uint64_t v4;

  sub_23A4FD0C4(a1, a2);
  sub_23A4FF3E0(a1, a2);
  sub_23A4FBF48(a1, a2);
  v4 = sub_23A521A4C();
  swift_release();
  return v4;
}

uint64_t sub_23A4FF16C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_23A521A4C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_23A4FF1A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23A521E54();
  sub_23A521A58();
  v4 = sub_23A521E6C();
  return sub_23A4FF208(a1, a2, v4);
}

unint64_t sub_23A4FF208(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23A521E18() & 1) == 0)
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
      while (!v14 && (sub_23A521E18() & 1) == 0);
    }
  }
  return v6;
}

_QWORD *sub_23A4FF2E8(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a1)
    v4 = a2 - a1;
  else
    v4 = 0;
  result = a3(&v6, a1, v4);
  if (!v3)
    return (_QWORD *)v6;
  return result;
}

uint64_t sub_23A4FF334(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *(*a4)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t result;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = sub_23A521800();
  v9 = result;
  if (result)
  {
    result = sub_23A521818();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v9 += a1 - result;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
    __break(1u);
    goto LABEL_15;
  }
  v12 = sub_23A52180C();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  v14 = v9 + v13;
  if (v9)
    v15 = v14;
  else
    v15 = 0;
  result = (uint64_t)sub_23A4FF2E8(v9, v15, a4);
  if (v4)
    return v16;
  return result;
}

void sub_23A4FF3E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = sub_23A521890();
  MEMORY[0x24BDAC7A8](v3);
  __asm { BR              X10 }
}

_QWORD *sub_23A4FF45C()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;

  if (BYTE6(v0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698B4D0);
    v4 = (_QWORD *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v4);
    v4[2] = BYTE6(v0);
    v4[3] = 2 * v6 - 64;
    sub_23A4FD0C4(v2, v0);
    v7 = sub_23A521860();
    sub_23A4FBF48(v2, v0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v1);
    if (v7 != BYTE6(v0))
    {
      __break(1u);
      JUMPOUT(0x23A4FF530);
    }
  }
  return v4;
}

uint64_t sub_23A4FF548@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_23A521A4C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23A4FF57C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AD10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A4FF5BC(__int128 *a1, uint64_t a2)
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

unint64_t sub_23A4FF5D8()
{
  unint64_t result;

  result = qword_25698AD20;
  if (!qword_25698AD20)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTAnalyticsAccessoryType, &type metadata for DTAnalyticsAccessoryType);
    atomic_store(result, (unint64_t *)&qword_25698AD20);
  }
  return result;
}

unint64_t sub_23A4FF620()
{
  unint64_t result;

  result = qword_25698AD28;
  if (!qword_25698AD28)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTAnalyticsTimerAction, &type metadata for DTAnalyticsTimerAction);
    atomic_store(result, (unint64_t *)&qword_25698AD28);
  }
  return result;
}

id sub_23A4FF664(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v7;
  id v10;

  if ((a6 & 0x8000000000000000) == 0)
    return a3;
  v7 = a6;
  v10 = a2;
  sub_23A4FCC3C(a3, a4, a5, v7);
  return (id)swift_bridgeObjectRetain();
}

void destroy for DTAnalyticsEvent(uint64_t a1)
{
  sub_23A4FF6FC(*(_QWORD *)a1, *(void **)(a1 + 8), *(void **)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void sub_23A4FF6FC(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v6;

  if (a6 < 0)
  {
    v6 = a6;

    sub_23A4FCCC0(a3, a4, a5, v6);
    swift_bridgeObjectRelease();
  }
  else
  {

  }
}

uint64_t *initializeWithCopy for DTAnalyticsEvent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *a2;
  v4 = (void *)a2[1];
  v5 = (void *)a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = a2[5];
  v9 = a2[6];
  v10 = a2[7];
  v11 = a2[8];
  sub_23A4FF664(*a2, v4, v5, v6, v7, v8);
  *a1 = v3;
  a1[1] = (uint64_t)v4;
  a1[2] = (uint64_t)v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  return a1;
}

uint64_t *assignWithCopy for DTAnalyticsEvent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = *a2;
  v4 = (void *)a2[1];
  v5 = (void *)a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = a2[5];
  v9 = a2[6];
  v10 = a2[7];
  v11 = a2[8];
  sub_23A4FF664(*a2, v4, v5, v6, v7, v8);
  v12 = *a1;
  v13 = (void *)a1[1];
  v14 = (void *)a1[2];
  v15 = a1[3];
  v16 = a1[4];
  v17 = a1[5];
  *a1 = v3;
  a1[1] = (uint64_t)v4;
  a1[2] = (uint64_t)v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  sub_23A4FF6FC(v12, v13, v14, v15, v16, v17);
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for DTAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  v3 = *(_QWORD *)(a2 + 64);
  v4 = *(_QWORD *)a1;
  v6 = *(void **)(a1 + 8);
  v5 = *(void **)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  v11 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v11;
  *(_QWORD *)(a1 + 64) = v3;
  sub_23A4FF6FC(v4, v6, v5, v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for DTAnalyticsEvent(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)a1 >> 2;
  if (v2 > 0x80000000)
    v3 = ~(_DWORD)v2;
  else
    v3 = -1;
  return (v3 + 1);
}

double storeEnumTagSinglePayload for DTAnalyticsEvent(uint64_t a1, int a2, int a3)
{
  double result;

  if (a2 < 0)
  {
    result = 0.0;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_QWORD *)a1 = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(a1 + 72) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)a1 = 4 * -a2;
      result = 0.0;
      *(_OWORD *)(a1 + 8) = 0u;
      *(_OWORD *)(a1 + 24) = 0u;
      *(_OWORD *)(a1 + 40) = 0u;
      *(_OWORD *)(a1 + 56) = 0u;
      return result;
    }
    *(_BYTE *)(a1 + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_23A4FF9E4(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40) >> 63;
}

uint64_t sub_23A4FF9F0(uint64_t result)
{
  *(_QWORD *)(result + 40) &= ~0x8000000000000000;
  return result;
}

_QWORD *sub_23A4FFA00(_QWORD *result, uint64_t a2)
{
  uint64_t v2;

  v2 = result[5] & 0xFLL | (a2 << 63);
  *result &= 3uLL;
  result[5] = v2;
  return result;
}

ValueMetadata *type metadata accessor for DTAnalyticsEvent()
{
  return &type metadata for DTAnalyticsEvent;
}

uint64_t dispatch thunk of DTAnalyticsPayload.eventPayload.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t getEnumTagSinglePayload for DTAnalyticsAccessoryType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DTAnalyticsAccessoryType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A4FFB14 + 4 * byte_23A522912[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23A4FFB48 + 4 * byte_23A52290D[v4]))();
}

uint64_t sub_23A4FFB48(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4FFB50(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A4FFB58);
  return result;
}

uint64_t sub_23A4FFB64(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A4FFB6CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23A4FFB70(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4FFB78(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DTAnalyticsAccessoryType()
{
  return &type metadata for DTAnalyticsAccessoryType;
}

uint64_t getEnumTagSinglePayload for DTAnalyticsTimerAction(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF6)
    goto LABEL_17;
  if (a2 + 10 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 10) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 10;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 10;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 10;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v8 = v6 - 11;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DTAnalyticsTimerAction(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_23A4FFC70 + 4 * byte_23A52291C[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_23A4FFCA4 + 4 * byte_23A522917[v4]))();
}

uint64_t sub_23A4FFCA4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4FFCAC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A4FFCB4);
  return result;
}

uint64_t sub_23A4FFCC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A4FFCC8);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_23A4FFCCC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4FFCD4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23A4FFCE0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DTAnalyticsTimerAction()
{
  return &type metadata for DTAnalyticsTimerAction;
}

uint64_t initializeBufferWithCopyOfBuffer for DTAnalyticsMonitorDetails(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = v3;
  return a1;
}

void destroy for DTAnalyticsMonitorDetails(uint64_t a1)
{

}

uint64_t assignWithCopy for DTAnalyticsMonitorDetails(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v3 = *(void **)(a1 + 16);
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = v4;

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

uint64_t assignWithTake for DTAnalyticsMonitorDetails(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(void **)(a1 + 16);
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for DTMonitorEvent(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DTMonitorEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for DTAnalyticsMonitorDetails()
{
  return &type metadata for DTAnalyticsMonitorDetails;
}

uint64_t destroy for DTAnalyticsTimerDetails(uint64_t a1)
{

  sub_23A4FCCC0(*(void **)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DTAnalyticsTimerDetails(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  id v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v4;
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  v9 = v4;
  sub_23A4FCC3C(v5, v6, v7, v8);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DTAnalyticsTimerDetails(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(void **)(a1 + 8);
  v5 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v5;
  v6 = v5;

  v7 = *(void **)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 32);
  v10 = *(_BYTE *)(a2 + 40);
  sub_23A4FCC3C(v7, v8, v9, v10);
  v11 = *(void **)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v8;
  *(_QWORD *)(a1 + 32) = v9;
  v14 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v10;
  sub_23A4FCCC0(v11, v12, v13, v14);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DTAnalyticsTimerDetails(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);

  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(_BYTE *)(a2 + 40);
  v7 = *(void **)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = v5;
  v10 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v6;
  sub_23A4FCCC0(v7, v8, v9, v10);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DTAnalyticsTimerDetails(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 64);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DTAnalyticsTimerDetails(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 64) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DTAnalyticsTimerDetails()
{
  return &type metadata for DTAnalyticsTimerDetails;
}

uint64_t sub_23A50011C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

uint64_t static DTError.domain.getter()
{
  return 0x726F7272455444;
}

uint64_t static DTError.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t DTError.message.getter()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v8;
  __int128 v9;
  __int128 v10;

  v1 = objc_msgSend(v0, sel_userInfo);
  v2 = sub_23A521A04();

  sub_23A521950();
  v3 = sub_23A52192C();
  if (!*(_QWORD *)(v2 + 16) || (v5 = sub_23A4FF1A4(v3, v4), (v6 & 1) == 0))
  {
    v9 = 0u;
    v10 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_23A50011C(*(_QWORD *)(v2 + 56) + 32 * v5, (uint64_t)&v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v10 + 1))
  {
LABEL_9:
    sub_23A500EF0((uint64_t)&v9);
    return 0;
  }
  if (swift_dynamicCast())
    return v8;
  else
    return 0;
}

id DTError.__allocating_init(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return DTError.init(_:_:_:_:)(0x726F7272455444, 0xE700000000000000, a1, a2, a3, a4);
}

id DTError.__allocating_init(_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  objc_class *v6;
  id v13;

  v13 = objc_allocWithZone(v6);
  return DTError.init(_:_:_:_:)(a1, a2, a3, a4, a5, a6);
}

id DTError.init(_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  void *v6;
  void *v7;
  objc_class *ObjectType;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  SEL *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  char v28;
  void *v29;
  void *v30;
  id v31;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[2];
  __int128 v38;
  unint64_t v39;
  objc_super v40;

  v7 = v6;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a5)
  {
    sub_23A521950();
    v13 = sub_23A52192C();
    v15 = v14;
    v39 = MEMORY[0x24BEE0D00];
    *(_QWORD *)&v38 = a4;
    *((_QWORD *)&v38 + 1) = a5;
    sub_23A500F6C(&v38, v37);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_23A501278(v37, v13, v15, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v17 = (SEL *)&unk_250B69000;
  if (a6)
  {
    v18 = a6;
    v19 = (void *)sub_23A521830();
    v20 = sub_23A521A28();
    v34 = v21;
    v35 = v20;
    v22 = objc_msgSend(v19, sel_domain);
    sub_23A521A28();

    v33 = objc_msgSend(v19, sel_code);
    v23 = objc_msgSend(v19, sel_userInfo);
    v36 = a3;
    sub_23A521A04();

    v24 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    v25 = (void *)sub_23A521A1C();
    swift_bridgeObjectRelease();
    v17 = (SEL *)&unk_250B69000;
    v26 = (void *)sub_23A5219F8();
    swift_bridgeObjectRelease();
    v27 = objc_msgSend(v24, sel_initWithDomain_code_userInfo_, v25, v33, v26);

    a3 = v36;
    v39 = sub_23A500F30();
    *(_QWORD *)&v38 = v27;
    sub_23A500F6C(&v38, v37);
    v28 = swift_isUniquelyReferenced_nonNull_native();
    sub_23A501278(v37, v35, v34, v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  v29 = (void *)sub_23A521A1C();
  swift_bridgeObjectRelease();
  v30 = (void *)sub_23A5219F8();
  swift_bridgeObjectRelease();
  v40.receiver = v7;
  v40.super_class = ObjectType;
  v31 = objc_msgSendSuper2(&v40, v17[414], v29, a3, v30);

  return v31;
}

id DTError.__allocating_init(_:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return DTError.init(_:)(a1);
}

{
  objc_class *v1;
  objc_class *v2;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v13;
  objc_super v14;

  v2 = v1;
  v4 = objc_allocWithZone(v1);
  if (a1)
  {
    v13 = v4;
    v5 = a1;
    v6 = (void *)sub_23A521830();
    v7 = objc_msgSend(v6, sel_domain);
    if (!v7)
    {
      sub_23A521A28();
      v7 = (id)sub_23A521A1C();
      swift_bridgeObjectRelease();
    }
    v8 = objc_msgSend(v6, sel_code);
    v9 = objc_msgSend(v6, sel_userInfo);
    sub_23A521A04();

    v10 = (void *)sub_23A5219F8();
    swift_bridgeObjectRelease();
    v14.receiver = v13;
    v14.super_class = v2;
    v11 = objc_msgSendSuper2(&v14, sel_initWithDomain_code_userInfo_, v7, v8, v10);

  }
  else
  {
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v11;
}

id DTError.init(_:)(void *a1)
{
  void *v1;
  void *v2;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  objc_class *ObjectType;
  objc_super v12;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void *)sub_23A521830();
  v5 = objc_msgSend(v4, sel_domain);
  if (!v5)
  {
    sub_23A521A28();
    v5 = (id)sub_23A521A1C();
    swift_bridgeObjectRelease();
  }
  v6 = objc_msgSend(v4, sel_code);
  v7 = objc_msgSend(v4, sel_userInfo);
  sub_23A521A04();

  v8 = (void *)sub_23A5219F8();
  swift_bridgeObjectRelease();
  v12.receiver = v2;
  v12.super_class = ObjectType;
  v9 = objc_msgSendSuper2(&v12, sel_initWithDomain_code_userInfo_, v5, v6, v8);

  return v9;
}

{
  void *v1;
  void *v2;
  uint64_t ObjectType;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  objc_class *v13;
  objc_super v14;

  v2 = v1;
  ObjectType = swift_getObjectType();
  if (a1)
  {
    v13 = (objc_class *)ObjectType;
    v5 = a1;
    v6 = (void *)sub_23A521830();
    v7 = objc_msgSend(v6, sel_domain);
    if (!v7)
    {
      sub_23A521A28();
      v7 = (id)sub_23A521A1C();
      swift_bridgeObjectRelease();
    }
    v8 = objc_msgSend(v6, sel_code);
    v9 = objc_msgSend(v6, sel_userInfo);
    sub_23A521A04();

    v10 = (void *)sub_23A5219F8();
    swift_bridgeObjectRelease();
    v14.receiver = v2;
    v14.super_class = v13;
    v11 = objc_msgSendSuper2(&v14, sel_initWithDomain_code_userInfo_, v7, v8, v10);

  }
  else
  {
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v11;
}

uint64_t DTError.__allocating_init(from:)(uint64_t a1)
{
  objc_class *v1;
  uint64_t v2;
  objc_class *v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _BYTE v10[40];

  v3 = v1;
  v5 = sub_23A521950();
  sub_23A5013A8(a1, (uint64_t)v10);
  v6 = sub_23A521938();
  if (!v2)
  {
    v7 = (void *)v6;
    v8 = objc_allocWithZone(v3);
    v5 = (uint64_t)DTError.init(_:)(v7);
  }
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v5;
}

void DTError.encode(to:)()
{
  void *v0;
  id v1;
  id v2;
  void *v3;

  v1 = objc_allocWithZone((Class)sub_23A521950());
  v2 = v0;
  v3 = (void *)sub_23A52195C();
  sub_23A521944();

}

id DTError.__allocating_init(domain:code:userInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  objc_class *v5;
  void *v8;
  void *v9;
  id v10;

  v5 = v4;
  v8 = (void *)sub_23A521A1C();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v9 = (void *)sub_23A5219F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(objc_allocWithZone(v5), sel_initWithDomain_code_userInfo_, v8, a3, v9);

  return v10;
}

void DTError.init(domain:code:userInfo:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id DTError.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23A500DE8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  objc_class *v2;
  uint64_t v3;
  objc_class *v4;
  uint64_t v7;
  uint64_t result;
  void *v9;
  id v10;
  id v11;
  _BYTE v12[40];

  v4 = v2;
  sub_23A521950();
  sub_23A5013A8(a1, (uint64_t)v12);
  v7 = sub_23A521938();
  if (v3)
    return __swift_destroy_boxed_opaque_existential_1(a1);
  v9 = (void *)v7;
  v10 = objc_allocWithZone(v4);
  v11 = DTError.init(_:)(v9);
  result = __swift_destroy_boxed_opaque_existential_1(a1);
  *a2 = v11;
  return result;
}

void sub_23A500E90()
{
  void **v0;
  void *v1;
  id v2;
  id v3;
  void *v4;

  v1 = *v0;
  v2 = objc_allocWithZone((Class)sub_23A521950());
  v3 = v1;
  v4 = (void *)sub_23A52195C();
  sub_23A521944();

}

uint64_t sub_23A500EF0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AD38);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23A500F30()
{
  unint64_t result;

  result = qword_25698AD40;
  if (!qword_25698AD40)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25698AD40);
  }
  return result;
}

_OWORD *sub_23A500F6C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23A500F7C(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698AD70);
  v6 = sub_23A521CEC();
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
        sub_23A500F6C(v24, v35);
      }
      else
      {
        sub_23A50011C((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_23A521E54();
      sub_23A521A58();
      result = sub_23A521E6C();
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
      result = (uint64_t)sub_23A500F6C(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

_OWORD *sub_23A501278(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_23A4FF1A4(a2, a3);
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
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
        return sub_23A500F6C(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_23A501498();
      goto LABEL_7;
    }
    sub_23A500F7C(v15, a4 & 1);
    v21 = sub_23A4FF1A4(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_23A501430(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_23A521E30();
  __break(1u);
  return result;
}

uint64_t sub_23A5013A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t type metadata accessor for DTError()
{
  return objc_opt_self();
}

uint64_t method lookup function for DTError()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DTError.__allocating_init(_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of DTError.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

_OWORD *sub_23A501430(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_23A500F6C(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

void *sub_23A501498()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698AD70);
  v2 = *v0;
  v3 = sub_23A521CE0();
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
    sub_23A50011C(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_23A500F6C(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
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

uint64_t DTTimer.description.getter()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;

  v1 = objc_msgSend(v0, sel_mtAlarm);
  if (!v1)
  {
    v5 = objc_msgSend(v0, sel_mtAlarmID);
    if (v5)
    {
      v6 = v5;
      sub_23A521A28();

      v7 = 0x2C6D72616C61;
    }
    else
    {
      v9 = objc_msgSend(v0, sel_mtTimer);
      if (v9)
      {
        v2 = v9;
        v3 = (uint64_t)MTTimer.summary.getter();
        goto LABEL_3;
      }
      v10 = objc_msgSend(v0, sel_mtTimerID);
      if (!v10)
        return 63;
      v11 = v10;
      sub_23A521A28();

      v7 = 0x2C72656D6974;
    }
    v12 = v7 & 0xFFFFFFFFFFFFLL | 0x6920000000000000;
    sub_23A521A70();
    swift_bridgeObjectRelease();
    return v12;
  }
  v2 = v1;
  v3 = MTAlarm.summary.getter();
LABEL_3:
  v4 = v3;

  return v4;
}

uint64_t MTAlarm.summary.getter()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;

  v1 = v0;
  v2 = sub_23A521908();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A5218CC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = 0;
  v27 = 0xE000000000000000;
  sub_23A521C68();
  swift_bridgeObjectRelease();
  v26 = 0x69202C6D72616C61;
  v27 = 0xEA00000000003D64;
  v10 = objc_msgSend(v0, sel_alarmID);
  sub_23A5218C0();

  sub_23A5024EC();
  sub_23A521DE8();
  sub_23A521A70();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_23A521A70();
  v24 = (uint64_t)objc_msgSend(v1, sel_hour);
  sub_23A521DE8();
  sub_23A521A70();
  swift_bridgeObjectRelease();
  sub_23A521A70();
  v24 = (uint64_t)objc_msgSend(v1, sel_minute);
  sub_23A521DE8();
  sub_23A521A70();
  swift_bridgeObjectRelease();
  if ((objc_msgSend(v1, sel_isEnabled) & 1) == 0)
  {
    v24 = 0x656C62616E65202CLL;
    v25 = 0xEA00000000003D64;
    objc_msgSend(v1, sel_isEnabled);
    sub_23A521A70();
    swift_bridgeObjectRelease();
    sub_23A521A70();
    swift_bridgeObjectRelease();
  }
  if (objc_msgSend(v1, sel_repeatSchedule))
  {
    sub_23A521A70();
    sub_23A5218FC();
    swift_bridgeObjectRetain();
    if ((objc_msgSend(v1, sel_repeatSchedule) & 1) != 0)
      sub_23A521A40();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if ((objc_msgSend(v1, sel_repeatSchedule) & 2) != 0)
      sub_23A521A40();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if ((objc_msgSend(v1, sel_repeatSchedule) & 4) != 0)
      sub_23A521A40();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if ((objc_msgSend(v1, sel_repeatSchedule) & 8) != 0)
      sub_23A521A40();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if ((objc_msgSend(v1, sel_repeatSchedule) & 0x10) != 0)
      sub_23A521A40();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if ((objc_msgSend(v1, sel_repeatSchedule) & 0x20) != 0)
      sub_23A521A40();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if ((objc_msgSend(v1, sel_repeatSchedule) & 0x40) != 0)
      sub_23A521A40();
    swift_bridgeObjectRelease();
    sub_23A521A70();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  v11 = objc_msgSend(v1, sel_title);
  if (v11)
  {
    v12 = v11;
    sub_23A521A28();

    v24 = 0x3D656C746974202CLL;
    v25 = 0xE900000000000022;
    sub_23A521A70();
    swift_bridgeObjectRelease();
    sub_23A521A70();
    sub_23A521A70();
    swift_bridgeObjectRelease();
  }
  MTAlarm.targetAccessory.getter();
  if (v13)
  {
    v24 = 0x746567726174202CLL;
    v25 = 0xE90000000000003DLL;
    sub_23A521A70();
    swift_bridgeObjectRelease();
    sub_23A521A70();
    swift_bridgeObjectRelease();
  }
  v14 = objc_msgSend(v1, sel_sound);
  v15 = objc_msgSend(v14, sel_soundType);

  if (v15 == (id)2)
  {
    v24 = 0;
    v25 = 0xE000000000000000;
    sub_23A521C68();
    sub_23A521A70();
    v16 = objc_msgSend(v1, sel_sound);
    v17 = objc_msgSend(v16, sel_toneIdentifier);

    if (v17)
    {
      sub_23A521A28();

      v18 = sub_23A521A64();
      swift_bridgeObjectRelease();
    }
    else
    {
      v18 = 0;
    }
    v22 = v18;
    v23 = v17 == 0;
    sub_23A521E00();
    sub_23A521A70();
    v19 = objc_msgSend(v1, sel_sound);
    v20 = objc_msgSend(v19, sel_soundVolume);

    v22 = (uint64_t)v20;
    sub_23A5067B8(0, &qword_25698ADA0);
    sub_23A50563C();
    sub_23A521E00();

    sub_23A521A70();
    swift_bridgeObjectRelease();
  }
  return v26;
}

id MTTimer.summary.getter()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id result;
  double v12;
  double v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  void (*v16)(char *, uint64_t);
  double v17;
  double v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;

  v1 = v0;
  v2 = sub_23A521DF4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A5218CC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = 0x69202C72656D6974;
  v27 = 0xEA00000000003D64;
  v10 = objc_msgSend(v0, sel_timerID);
  sub_23A5218C0();

  sub_23A5024EC();
  sub_23A521DE8();
  sub_23A521A70();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v24 = 0;
  v25 = 0xE000000000000000;
  sub_23A521A70();
  result = objc_msgSend(v1, sel_duration);
  v13 = fabs(v12);
  if ((~*(_QWORD *)&v13 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v13 <= -1.0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v13 >= 1.84467441e19)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v23 = (unint64_t)v13;
  v14 = *MEMORY[0x24BE29E98];
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v15(v5, v14, v2);
  sub_23A505694();
  sub_23A521E0C();
  v16 = *(void (**)(char *, uint64_t))(v3 + 8);
  v16(v5, v2);
  sub_23A521A70();
  swift_bridgeObjectRelease();
  v24 = 0;
  v25 = 0xE000000000000000;
  sub_23A521A70();
  result = objc_msgSend(v1, sel_remainingTime);
  v18 = fabs(v17);
  if ((~*(_QWORD *)&v18 & 0x7FF0000000000000) == 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v18 <= -1.0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v18 >= 1.84467441e19)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  v23 = (unint64_t)v18;
  v15(v5, v14, v2);
  sub_23A521E0C();
  v16(v5, v2);
  sub_23A521A70();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v1, sel_title);
  if (v19)
  {
    v20 = v19;
    sub_23A521A28();

    v24 = 0x3D656C746974202CLL;
    v25 = 0xE900000000000022;
    sub_23A521A70();
    swift_bridgeObjectRelease();
    sub_23A521A70();
    sub_23A521A70();
    swift_bridgeObjectRelease();
  }
  v24 = 0x3D6574617473202CLL;
  v25 = 0xE800000000000000;
  MTTimerState.summary.getter((uint64_t)objc_msgSend(v1, sel_state));
  sub_23A521A70();
  swift_bridgeObjectRelease();
  sub_23A521A70();
  swift_bridgeObjectRelease();
  MTTimer.targetAccessory.getter();
  if (v21)
  {
    v24 = 0x746567726174202CLL;
    v25 = 0xE90000000000003DLL;
    sub_23A521A70();
    swift_bridgeObjectRelease();
    sub_23A521A70();
    swift_bridgeObjectRelease();
  }
  return (id)v26;
}

unint64_t sub_23A5024EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25698AD98;
  if (!qword_25698AD98)
  {
    v1 = sub_23A5218CC();
    result = MEMORY[0x23B850924](MEMORY[0x24BDCEAB8], v1);
    atomic_store(result, (unint64_t *)&qword_25698AD98);
  }
  return result;
}

id sub_23A502540(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  void *v5;

  v4 = a1;
  a3();

  v5 = (void *)sub_23A521A1C();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23A502598()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v8;

  v1 = objc_msgSend(v0, sel_mtAlarm);
  if (!v1)
  {
    v6 = objc_msgSend(v0, sel_mtAlarmID);
    if (!v6)
    {
      v8 = objc_msgSend(v0, sel_mtTimer);
      if (v8)
      {
        v2 = v8;
        v3 = objc_msgSend(v8, sel_timerIDString);
        goto LABEL_3;
      }
      v6 = objc_msgSend(v0, sel_mtTimerID);
      if (!v6)
        return 63;
    }
    v4 = v6;
    v5 = sub_23A521A28();
    goto LABEL_6;
  }
  v2 = v1;
  v3 = objc_msgSend(v1, sel_alarmIDString);
LABEL_3:
  v4 = v3;
  v5 = sub_23A521A28();

LABEL_6:
  return v5;
}

id sub_23A5026D0(void *a1, uint64_t a2, SEL *a3, SEL *a4, _QWORD *a5)
{
  char *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;

  v8 = a1;
  v9 = objc_msgSend(v8, *a3);
  if (v9)
  {
    v10 = v9;
    v11 = objc_msgSend(v9, *a4);

    sub_23A521A28();
  }
  else
  {
    v12 = *(_QWORD *)&v8[*a5 + 8];
    swift_bridgeObjectRetain();

    if (!v12)
    {
      v13 = 0;
      return v13;
    }
  }
  v13 = (void *)sub_23A521A1C();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t DTTimer.isEqual(_:)(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  _BYTE v27[24];
  uint64_t v28;

  v2 = sub_23A506A58(a1, (uint64_t)v27, &qword_25698AD38);
  if (!v28)
  {
    sub_23A506A9C((uint64_t)v27, &qword_25698AD38);
    goto LABEL_8;
  }
  type metadata accessor for DTTimer(v2);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    v7 = 0;
    return v7 & 1;
  }
  v3 = objc_msgSend(v26, sel_mtAlarm);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v1, sel_mtAlarm);
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(v5, sel_isEqual_, v4);

LABEL_6:
      return v7 & 1;
    }

    goto LABEL_8;
  }
  v9 = objc_msgSend(v26, sel_mtAlarmID);
  if (v9)
  {
    v10 = v9;
    v11 = sub_23A521A28();
    v13 = v12;

    v14 = objc_msgSend(v1, sel_mtAlarmID);
    if (v14)
      goto LABEL_12;
    goto LABEL_23;
  }
  v19 = objc_msgSend(v26, sel_mtTimer);
  if (v19)
  {
    v20 = v19;
    v21 = objc_msgSend(v1, sel_mtTimer);
    if (v21)
    {
      v22 = v21;
      v4 = v20;
      v7 = objc_msgSend(v22, sel_isEqual_, v4);

      goto LABEL_6;
    }

    goto LABEL_8;
  }
  v23 = objc_msgSend(v26, sel_mtTimerID);
  if (!v23)
  {
LABEL_24:

    goto LABEL_8;
  }
  v24 = v23;
  v11 = sub_23A521A28();
  v13 = v25;

  v14 = objc_msgSend(v1, sel_mtTimerID);
  if (!v14)
  {
LABEL_23:
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
LABEL_12:
  v15 = v14;
  v16 = sub_23A521A28();
  v18 = v17;

  if (v11 == v16 && v13 == v18)
    v7 = 1;
  else
    v7 = sub_23A521E18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7 & 1;
}

void __swiftcall DTTimer.init()(DTTimer *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void DTTimer.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t DTTimer.encode(to:)(_QWORD *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  unint64_t v33;
  uint64_t v34;

  v2 = v1;
  v34 = *MEMORY[0x24BDAC8D0];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698ADB8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A5056EC();
  sub_23A521E9C();
  v8 = objc_msgSend(v2, sel_mtAlarm);
  if (!v8)
  {
    v19 = objc_msgSend(v2, sel_mtAlarmID);
    if (v19)
    {
      v20 = v19;
      sub_23A521A28();

      v21 = 1;
    }
    else
    {
      v22 = objc_msgSend(v2, sel_mtTimer);
      if (v22)
      {
        v9 = v22;
        v23 = (void *)objc_opt_self();
        v32 = 0;
        v24 = objc_msgSend(v23, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v9, 1, &v32);
        v12 = v32;
        if (v24)
        {
          v25 = (void *)sub_23A521884();
          v27 = v26;

          v32 = v25;
          v33 = v27;
          HIBYTE(v31) = 2;
          sub_23A505730();
          sub_23A521DD0();
          (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

          v16 = (uint64_t)v25;
          v17 = v27;
          return sub_23A4FBF48(v16, v17);
        }
        goto LABEL_11;
      }
      v29 = objc_msgSend(v2, sel_mtTimerID);
      if (!v29)
        return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      v30 = v29;
      sub_23A521A28();

      v21 = 3;
    }
    LOBYTE(v32) = v21;
    sub_23A521DB8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return swift_bridgeObjectRelease();
  }
  v9 = v8;
  v10 = (void *)objc_opt_self();
  v32 = 0;
  v11 = objc_msgSend(v10, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v9, 1, &v32);
  v12 = v32;
  if (v11)
  {
    v13 = (void *)sub_23A521884();
    v15 = v14;

    v32 = v13;
    v33 = v15;
    HIBYTE(v31) = 0;
    sub_23A505730();
    sub_23A521DD0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

    v16 = (uint64_t)v13;
    v17 = v15;
    return sub_23A4FBF48(v16, v17);
  }
LABEL_11:
  v28 = v12;
  sub_23A52183C();

  swift_willThrow();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

id DTTimer.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  unint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698ADD0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A5056EC();
  sub_23A521E90();
  if (!v1)
  {
    v28 = 0;
    sub_23A505774();
    sub_23A521D58();
    v9 = v27;
    if (v27 >> 60 == 15)
    {
      LOBYTE(v26) = 1;
      sub_23A521D4C();
      if (v10)
      {
        v11 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
        v12 = (void *)sub_23A521A1C();
        swift_bridgeObjectRelease();
        v13 = objc_msgSend(v11, sel_initWithMTAlarmID_, v12);
LABEL_8:
        v7 = v13;

LABEL_12:
        (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
        return v7;
      }
      v28 = 2;
      sub_23A521D58();
      v9 = v27;
      if (v27 >> 60 == 15)
      {
        LOBYTE(v26) = 3;
        sub_23A521D4C();
        if (!v19)
        {
          v7 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
          goto LABEL_12;
        }
        v20 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
        v12 = (void *)sub_23A521A1C();
        swift_bridgeObjectRelease();
        v13 = objc_msgSend(v20, sel_initWithMTTimerID_, v12);
        goto LABEL_8;
      }
      v22 = v26;
      sub_23A5067B8(0, &qword_25698ADE0);
      sub_23A5067B8(0, &qword_25698ADE8);
      v23 = sub_23A521B9C();
      v16 = (void *)v23;
      v25 = v22;
      if (v23)
      {
        v17 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithMTTimer_, v23);
        goto LABEL_11;
      }
      v7 = (id)type metadata accessor for DTError();
      v21 = "Decode MTTimer failed";
    }
    else
    {
      v14 = v26;
      sub_23A5067B8(0, &qword_25698ADE0);
      sub_23A5067B8(0, &qword_25698ADF0);
      v15 = sub_23A521B9C();
      v16 = (void *)v15;
      v25 = v14;
      if (v15)
      {
        v17 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithMTAlarm_, v15);
LABEL_11:
        v18 = v16;
        v7 = v17;
        sub_23A5057B8(v25, v9);

        goto LABEL_12;
      }
      v7 = (id)type metadata accessor for DTError();
      v21 = "Decode MTAlarm failed";
    }
    DTError.__allocating_init(_:_:_:)(3, 0xD000000000000015, (unint64_t)(v21 - 32) | 0x8000000000000000, 0);
    swift_willThrow();
    sub_23A5057B8(v25, v9);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7;
}

void sub_23A5032DC(char *a1)
{
  sub_23A5032E8(*a1);
}

void sub_23A5032E8(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_23A503338(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23A503398 + 4 * byte_23A522C4C[a2]))(0x496D72616C41746DLL);
}

uint64_t sub_23A503398(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x496D72616C41746DLL && v1 == 0xE900000000000044)
    v2 = 1;
  else
    v2 = sub_23A521E18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_23A50342C()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_23A521E54();
  __asm { BR              X9 }
}

uint64_t sub_23A503478()
{
  sub_23A521A58();
  swift_bridgeObjectRelease();
  return sub_23A521E6C();
}

void sub_23A5034E4()
{
  __asm { BR              X10 }
}

uint64_t sub_23A503520()
{
  sub_23A521A58();
  return swift_bridgeObjectRelease();
}

void sub_23A503578()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_23A521E54();
  __asm { BR              X9 }
}

uint64_t sub_23A5035C0()
{
  sub_23A521A58();
  swift_bridgeObjectRelease();
  return sub_23A521E6C();
}

uint64_t sub_23A50362C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A506770();
  *a1 = result;
  return result;
}

uint64_t sub_23A503658()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_23A503688 + 4 * byte_23A522C5C[*v0]))();
}

void sub_23A503688(_QWORD *a1@<X8>)
{
  *a1 = 0x496D72616C41746DLL;
  a1[1] = 0xE900000000000044;
}

uint64_t sub_23A5036D4()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23A503704 + 4 * byte_23A522C60[*v0]))(0x6D72616C41746DLL, 0xE700000000000000);
}

uint64_t sub_23A503704()
{
  return 0x496D72616C41746DLL;
}

uint64_t sub_23A503748@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A506770();
  *a1 = result;
  return result;
}

void sub_23A50376C(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_23A503778()
{
  sub_23A5056EC();
  return sub_23A521EA8();
}

uint64_t sub_23A5037A0()
{
  sub_23A5056EC();
  return sub_23A521EB4();
}

id sub_23A5037C8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  id result;

  result = DTTimer.init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_23A5037F0(_QWORD *a1)
{
  return DTTimer.encode(to:)(a1);
}

unint64_t static DTTimer._siriContextAlarmTargetReferenceKey.getter()
{
  return 0xD000000000000024;
}

unint64_t static DTTimer._siriContextTimerTargetReferenceKey.getter()
{
  return 0xD000000000000024;
}

uint64_t DTTimer.siriContext.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v1 = objc_msgSend(v0, sel_mtAlarm);
  if (!v1)
  {
    v6 = objc_msgSend(v0, sel_mtTimer);
    if (!v6)
      return 0;
    v2 = v6;
    v3 = objc_msgSend(v6, sel_siriContext);
    if (v3)
      goto LABEL_3;
LABEL_6:

    return 0;
  }
  v2 = v1;
  v3 = objc_msgSend(v1, sel_siriContext);
  if (!v3)
    goto LABEL_6;
LABEL_3:
  v4 = v3;
  v5 = sub_23A521A04();

  return v5;
}

void __swiftcall DTTimer.setSiriContext(siriContext:)(DTTimer *__return_ptr retstr, Swift::OpaquePointer_optional siriContext)
{
  void *v2;
  void *rawValue;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  if (siriContext.value._rawValue)
  {
    if (*((_QWORD *)siriContext.value._rawValue + 2))
      rawValue = siriContext.value._rawValue;
    else
      rawValue = 0;
  }
  else
  {
    rawValue = 0;
  }
  v4 = objc_msgSend(v2, sel_mtAlarm, v2);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_mutableCopy);
    sub_23A521C14();
    swift_unknownObjectRelease();
    sub_23A5067B8(0, &qword_25698AE00);
    if (swift_dynamicCast())
    {
      v6 = v10;
      if (rawValue)
        rawValue = (void *)sub_23A5219F8();
      objc_msgSend(v10, sel_setSiriContext_, rawValue);

      objc_msgSend(objc_allocWithZone((Class)DTTimer), sel_initWithMTAlarm_, v10);
LABEL_16:

      return;
    }
LABEL_17:

    goto LABEL_18;
  }
  v7 = objc_msgSend(v9, sel_mtTimer);
  if (v7)
  {
    v5 = v7;
    objc_msgSend(v7, sel_mutableCopy);
    sub_23A521C14();
    swift_unknownObjectRelease();
    sub_23A5067B8(0, &qword_25698ADF8);
    if (swift_dynamicCast())
    {
      v6 = v10;
      if (rawValue)
        rawValue = (void *)sub_23A5219F8();
      objc_msgSend(v10, sel_setSiriContext_, rawValue);

      objc_msgSend(objc_allocWithZone((Class)DTTimer), sel_initWithMTTimer_, v10);
      goto LABEL_16;
    }
    goto LABEL_17;
  }
LABEL_18:
  v8 = v9;
}

uint64_t DTTimer.targetReference.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[40];
  __int128 v16;
  __int128 v17;

  v3 = DTTimer.siriContext.getter();
  if (!v3)
  {
    v8 = sub_23A5217E8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(a1, 1, 1, v8);
  }
  v4 = v3;
  v5 = objc_msgSend(v1, sel_mtAlarm);

  if ((v5 || (v6 = objc_msgSend(v1, sel_mtTimer), v6, v6))
    && ((v7 = objc_msgSend(v1, sel_mtAlarm), v7, v7)
     || (v10 = objc_msgSend(v1, sel_mtTimer), v10, v10)))
  {
    sub_23A521C5C();
    if (*(_QWORD *)(v4 + 16) && (v11 = sub_23A5057CC((uint64_t)v15), (v12 & 1) != 0))
    {
      sub_23A50011C(*(_QWORD *)(v4 + 56) + 32 * v11, (uint64_t)&v16);
    }
    else
    {
      v16 = 0u;
      v17 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_23A5067F0((uint64_t)v15);
    if (*((_QWORD *)&v17 + 1))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_23A5217D0();
        return swift_bridgeObjectRelease();
      }
    }
    else
    {
      sub_23A506A9C((uint64_t)&v16, &qword_25698AD38);
    }
    v14 = sub_23A5217E8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a1, 1, 1, v14);
  }
  else
  {
    v13 = sub_23A5217E8();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(a1, 1, 1, v13);
    return swift_bridgeObjectRelease();
  }
}

id DTTimer.setTargetReference(_:)(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
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
  char *v19;
  id v20;
  const char *v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  Swift::OpaquePointer_optional v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t inited;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  _OWORD v54[2];
  __int128 v55;
  uint64_t v56;
  _BYTE v57[40];
  void *v58;
  _BYTE _118[40];
  Swift::OpaquePointer_optional v60;

  v51 = sub_23A521854();
  v50 = *(_QWORD *)(v51 - 8);
  MEMORY[0x24BDAC7A8](v51);
  v3 = (char *)&v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23A5217E8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE08);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v49 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE10);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v49 - v18;
  v20 = objc_msgSend(v52, sel_mtAlarm);

  if (v20)
  {
    v49 = v3;
    v21 = "COAlarmSiriContextTargetReferenceKey";
  }
  else
  {
    v22 = objc_msgSend(v52, sel_mtTimer);

    if (!v22)
      return v52;
    v49 = v3;
    v21 = "COTimerSiriContextTargetReferenceKey";
  }
  v23 = (unint64_t)(v21 - 32) | 0x8000000000000000;
  v24 = DTTimer.siriContext.getter();
  if (!v24)
  {
    sub_23A506A58(a1, (uint64_t)v11, &qword_25698AE08);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v11, 1, v4) == 1)
    {
      swift_bridgeObjectRelease();
      v28 = &qword_25698AE08;
      v29 = (uint64_t)v11;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, v4);
      sub_23A521794();
      v34 = v50;
      v35 = v51;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48))(v17, 1, v51) != 1)
      {
        v43 = v49;
        (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v49, v17, v35);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE18);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_23A522E20;
        *(_QWORD *)(inited + 32) = 0xD000000000000024;
        *(_QWORD *)(inited + 40) = v23;
        *(_QWORD *)(inited + 48) = sub_23A521848();
        *(_QWORD *)(inited + 56) = v45;
        v46 = sub_23A504298(inited);
        v47 = (void *)sub_23A5043B8(v46);
        swift_bridgeObjectRelease();
        v60.value._rawValue = v47;
        DTTimer.setSiriContext(siriContext:)((DTTimer *)_118, v60);
        v42 = v48;
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v43, v35);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        return (id)v42;
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      swift_bridgeObjectRelease();
      v28 = &qword_25698AE10;
      v29 = (uint64_t)v17;
    }
    sub_23A506A9C(v29, v28);
    return v52;
  }
  v58 = (void *)v24;
  *(_QWORD *)&v55 = 0xD000000000000024;
  *((_QWORD *)&v55 + 1) = v23;
  v25 = MEMORY[0x24BEE0D00];
  sub_23A521C5C();
  sub_23A506A58(a1, (uint64_t)v13, &qword_25698AE08);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4) == 1)
  {
    v26 = &qword_25698AE08;
    v27 = (uint64_t)v13;
  }
  else
  {
    sub_23A521794();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
    v30 = v50;
    v31 = v51;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48))(v19, 1, v51) != 1)
    {
      v37 = sub_23A521848();
      v56 = v25;
      *(_QWORD *)&v55 = v37;
      *((_QWORD *)&v55 + 1) = v38;
      (*(void (**)(char *, uint64_t))(v30 + 8))(v19, v31);
      sub_23A500F6C(&v55, v54);
      v39 = v58;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v53 = v39;
      sub_23A505E84(v54, (uint64_t)v57, isUniquelyReferenced_nonNull_native);
      v33 = v53;
      swift_bridgeObjectRelease();
      sub_23A5067F0((uint64_t)v57);
      goto LABEL_18;
    }
    v26 = &qword_25698AE10;
    v27 = (uint64_t)v19;
  }
  sub_23A506A9C(v27, v26);
  sub_23A5058C0((uint64_t)v57, &v55);
  sub_23A5067F0((uint64_t)v57);
  sub_23A506A9C((uint64_t)&v55, &qword_25698AD38);
  v33 = v58;
LABEL_18:
  v32.value._rawValue = v33;
  DTTimer.setSiriContext(siriContext:)((DTTimer *)_118, v32);
  v42 = v41;
  swift_bridgeObjectRelease();
  return (id)v42;
}

unint64_t sub_23A504298(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE80);
  v2 = (_QWORD *)sub_23A521CF8();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_23A4FF1A4(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
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

uint64_t sub_23A5043B8(uint64_t a1)
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE78);
    v2 = sub_23A521CF8();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v27 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(63 - v3) >> 6;
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
    if (v13 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v26)
        goto LABEL_37;
      v14 = *(_QWORD *)(v27 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v26)
          goto LABEL_37;
        v14 = *(_QWORD *)(v27 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v26)
            goto LABEL_37;
          v14 = *(_QWORD *)(v27 + 8 * v15);
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
    v17 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v18 = v17[1];
    *(_QWORD *)&v36[0] = *v17;
    *((_QWORD *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    v32 = v28;
    v33 = v29;
    v34 = v30;
    sub_23A500F6C(&v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_23A500F6C(v35, v36);
    sub_23A500F6C(v36, &v32);
    result = sub_23A521C44();
    v19 = -1 << *(_BYTE *)(v2 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
        v25 = *(_QWORD *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(_QWORD *)(v10 + 32) = v30;
    result = (uint64_t)sub_23A500F6C(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_23A506B14();
    return v2;
  }
  v14 = *(_QWORD *)(v27 + 8 * v16);
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
    if (v15 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t DTTimer.targetAccessory.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v5;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE08);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  DTTimer.targetReference.getter((uint64_t)v2);
  v3 = _sSo7DTTimerC17DistributedTimersE27accessoryForTargetReferenceySSSg10Foundation13URLComponentsVSgFZ_0((uint64_t)v2);
  sub_23A506A9C((uint64_t)v2, &qword_25698AE08);
  return v3;
}

void __swiftcall DTTimer.setTargetAccessory(accessoryId:)(DTTimer *__return_ptr retstr, Swift::String_optional accessoryId)
{
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18[2];

  object = accessoryId.value._object;
  countAndFlagsBits = accessoryId.value._countAndFlagsBits;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE08);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v18 - v8;
  DTTimer.targetReference.getter((uint64_t)v18 - v8);
  v10 = _sSo7DTTimerC17DistributedTimersE27accessoryForTargetReferenceySSSg10Foundation13URLComponentsVSgFZ_0((uint64_t)v9);
  v12 = v11;
  sub_23A506A9C((uint64_t)v9, &qword_25698AE08);
  if (object)
  {
    if (!v12)
    {
LABEL_8:
      sub_23A5217DC();
      sub_23A5217C4();
      sub_23A5217AC();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE20);
      sub_23A521770();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_23A522E20;
      sub_23A52174C();
      sub_23A521788();
      v15 = sub_23A5217E8();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v7, 0, 1, v15);
LABEL_11:
      DTTimer.setTargetReference(_:)((uint64_t)v7);
      sub_23A506A9C((uint64_t)v7, &qword_25698AE08);
      return;
    }
    if (v10 == countAndFlagsBits && v12 == object)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v14 = sub_23A521E18();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0)
        goto LABEL_8;
    }
  }
  else if (v12)
  {
    swift_bridgeObjectRelease();
    v16 = sub_23A5217E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v7, 1, 1, v16);
    goto LABEL_11;
  }
  v17 = v18[1];
}

uint64_t static DTTimer.makeTargetReference(for:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;

  if (a1)
  {
    sub_23A5217DC();
    sub_23A5217C4();
    sub_23A5217AC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE20);
    sub_23A521770();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_23A522E20;
    sub_23A52174C();
    sub_23A521788();
    v3 = sub_23A5217E8();
    v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56);
    v5 = a2;
    v6 = 0;
  }
  else
  {
    v3 = sub_23A5217E8();
    v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56);
    v5 = a2;
    v6 = 1;
  }
  return v4(v5, v6, 1, v3);
}

void __swiftcall DTTimer.setTargetAccessoryIfNeeded(defaultTargetID:)(DTTimer *__return_ptr retstr, Swift::String defaultTargetID)
{
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  DTTimer *v9;
  id v10;
  Swift::String_optional v11;
  id v12[2];

  object = defaultTargetID._object;
  countAndFlagsBits = defaultTargetID._countAndFlagsBits;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE08);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  DTTimer.targetReference.getter((uint64_t)v6);
  _sSo7DTTimerC17DistributedTimersE27accessoryForTargetReferenceySSSg10Foundation13URLComponentsVSgFZ_0((uint64_t)v6);
  v8 = v7;
  sub_23A506A9C((uint64_t)v6, &qword_25698AE08);
  swift_bridgeObjectRelease();
  if (v8)
  {
    v10 = v12[1];
  }
  else
  {
    v11.value._countAndFlagsBits = countAndFlagsBits;
    v11.value._object = object;
    DTTimer.setTargetAccessory(accessoryId:)(v9, v11);
  }
}

BOOL DTTimer.isTargeting(accessoryId:alternateAccessoryIDs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE08);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  DTTimer.targetReference.getter((uint64_t)v8);
  v9 = _sSo7DTTimerC17DistributedTimersE27accessoryForTargetReferenceySSSg10Foundation13URLComponentsVSgFZ_0((uint64_t)v8);
  v11 = v10;
  sub_23A506A9C((uint64_t)v8, &qword_25698AE08);
  if (!v11)
    return !a2;
  if (!a2)
  {
    swift_bridgeObjectRelease();
    DTTimer.targetReference.getter((uint64_t)v8);
    v14 = _sSo7DTTimerC17DistributedTimersE27accessoryForTargetReferenceySSSg10Foundation13URLComponentsVSgFZ_0((uint64_t)v8);
    v16 = v15;
    sub_23A506A9C((uint64_t)v8, &qword_25698AE08);
    if (v16)
    {
      v17 = sub_23A504DCC(v14, v16, a3);
      swift_bridgeObjectRelease();
      if ((v17 & 1) != 0)
        return 1;
    }
    return 0;
  }
  if (v9 != a1 || v11 != a2)
  {
    v13 = sub_23A521E18();
    swift_bridgeObjectRelease();
    return (v13 & 1) != 0;
  }
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_23A504DCC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_23A521E54();
    sub_23A521A58();
    v6 = sub_23A521E6C();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_23A521E18() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_23A521E18() & 1) != 0)
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

uint64_t DTTimer.isExpired(before:)(uint64_t a1)
{
  void *v1;
  id v3;
  void *v4;
  char v5;
  id v6;
  char v7;

  v3 = objc_msgSend(v1, sel_mtAlarm);
  if (v3)
  {
    v4 = v3;
    v5 = MTAlarm.isExpired(before:)(a1);
  }
  else
  {
    v6 = objc_msgSend(v1, sel_mtTimer);
    if (!v6)
    {
      v7 = 0;
      return v7 & 1;
    }
    v4 = v6;
    v5 = MTTimer.isExpired(before:)();
  }
  v7 = v5;

  return v7 & 1;
}

uint64_t MTAlarm.isExpired(before:)(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unsigned __int8 v11;
  char v12;
  id v13;
  void (*v14)(char *, uint64_t);
  uint64_t v16;

  v2 = v1;
  v4 = sub_23A5218B4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v16 - v9;
  if ((objc_msgSend(v2, sel_isEnabled) & 1) != 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, a1, v4);
  }
  else
  {
    v11 = objc_msgSend(v2, sel_repeats);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, a1, v4);
    if ((v11 & 1) == 0)
    {
      v13 = objc_msgSend(v2, sel_lastModifiedDate);
      sub_23A5218A8();

      v12 = sub_23A52189C();
      v14 = *(void (**)(char *, uint64_t))(v5 + 8);
      v14(v8, v4);
      v14(v10, v4);
      return v12 & 1;
    }
  }
  v12 = 0;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  return v12 & 1;
}

uint64_t MTTimer.isExpired(before:)()
{
  void *v0;
  void *v1;
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
  id v12;
  void *v13;
  void (*v14)(char *, char *, uint64_t);
  char v15;
  uint64_t v17;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE28);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23A5218B4();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v17 - v10;
  if (objc_msgSend(v1, sel_state) != (id)2 && objc_msgSend(v1, sel_state) != (id)1)
    goto LABEL_8;
  v12 = objc_msgSend(v1, sel_lastModifiedDate);
  if (!v12)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_7;
  }
  v13 = v12;
  sub_23A5218A8();

  v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v14(v4, v9, v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_7:
    sub_23A506A9C((uint64_t)v4, &qword_25698AE28);
LABEL_8:
    v15 = 0;
    return v15 & 1;
  }
  v14(v11, v4, v5);
  v15 = sub_23A52189C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return v15 & 1;
}

uint64_t MTAlarm.targetAccessory.getter()
{
  return sub_23A5053BC(0x800000023A5260D0);
}

uint64_t MTTimerState.summary.getter(uint64_t a1)
{
  uint64_t result;

  result = 0x6E776F6E6B6E75;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = 0x646570706F7473;
      break;
    case 2:
      result = 0x6573756170;
      break;
    case 3:
      result = 0x676E696E6E7572;
      break;
    case 4:
      result = 0x746E756F63;
      break;
    default:
      sub_23A521DE8();
      sub_23A521A70();
      swift_bridgeObjectRelease();
      result = 2629695;
      break;
  }
  return result;
}

uint64_t MTTimer.targetAccessory.getter()
{
  return sub_23A5053BC(0x800000023A526100);
}

uint64_t sub_23A5053BC(uint64_t a1)
{
  void *v1;
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
  id v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t *v18;
  char *v19;
  uint64_t v20;
  _QWORD v22[3];
  _BYTE v23[40];
  __int128 v24;
  __int128 v25;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE08);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v22 - v7;
  v9 = sub_23A5217E8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend(v1, sel_siriContext);
  if (!v13)
    return 0;
  v14 = v13;
  v15 = sub_23A521A04();

  v22[1] = 0xD000000000000024;
  v22[2] = a1;
  sub_23A521C5C();
  if (*(_QWORD *)(v15 + 16) && (v16 = sub_23A5057CC((uint64_t)v23), (v17 & 1) != 0))
  {
    sub_23A50011C(*(_QWORD *)(v15 + 56) + 32 * v16, (uint64_t)&v24);
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_23A5067F0((uint64_t)v23);
  if (!*((_QWORD *)&v25 + 1))
  {
    v18 = &qword_25698AD38;
    v19 = (char *)&v24;
LABEL_11:
    sub_23A506A9C((uint64_t)v19, v18);
    return 0;
  }
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_23A5217D0();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v6, v12, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, v9);
      v20 = _sSo7DTTimerC17DistributedTimersE27accessoryForTargetReferenceySSSg10Foundation13URLComponentsVSgFZ_0((uint64_t)v6);
      sub_23A506A9C((uint64_t)v6, &qword_25698AE08);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      return v20;
    }
    v18 = &qword_25698AE08;
    v19 = v8;
    goto LABEL_11;
  }
  return 0;
}

unint64_t sub_23A50563C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25698ADA8;
  if (!qword_25698ADA8)
  {
    v1 = sub_23A5067B8(255, &qword_25698ADA0);
    result = MEMORY[0x23B850924](MEMORY[0x24BDD0240], v1);
    atomic_store(result, (unint64_t *)&qword_25698ADA8);
  }
  return result;
}

unint64_t sub_23A505694()
{
  unint64_t result;

  result = qword_25698ADB0;
  if (!qword_25698ADB0)
  {
    result = MEMORY[0x23B850924](MEMORY[0x24BEE45A0], MEMORY[0x24BEE4568]);
    atomic_store(result, (unint64_t *)&qword_25698ADB0);
  }
  return result;
}

uint64_t type metadata accessor for DTTimer(uint64_t a1)
{
  return sub_23A5067B8(a1, (unint64_t *)&unk_25698C230);
}

unint64_t sub_23A5056EC()
{
  unint64_t result;

  result = qword_25698ADC0;
  if (!qword_25698ADC0)
  {
    result = MEMORY[0x23B850924](&unk_23A522D14, &_s10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25698ADC0);
  }
  return result;
}

unint64_t sub_23A505730()
{
  unint64_t result;

  result = qword_25698ADC8;
  if (!qword_25698ADC8)
  {
    result = MEMORY[0x23B850924](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_25698ADC8);
  }
  return result;
}

unint64_t sub_23A505774()
{
  unint64_t result;

  result = qword_25698ADD8;
  if (!qword_25698ADD8)
  {
    result = MEMORY[0x23B850924](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_25698ADD8);
  }
  return result;
}

uint64_t sub_23A5057B8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23A4FBF48(a1, a2);
  return a1;
}

unint64_t sub_23A5057CC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A521C44();
  return sub_23A5057FC(a1, v2);
}

unint64_t sub_23A5057FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_23A506AD8(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x23B8502DC](v9, a1);
      sub_23A5067F0((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

double sub_23A5058C0@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  double result;
  uint64_t v11;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_23A5057CC(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v11 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_23A506034();
      v9 = v11;
    }
    sub_23A5067F0(*(_QWORD *)(v9 + 48) + 40 * v6);
    sub_23A500F6C((_OWORD *)(*(_QWORD *)(v9 + 56) + 32 * v6), a2);
    sub_23A505CBC(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_23A5059A8(uint64_t a1, char a2)
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
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE78);
  v6 = sub_23A521CEC();
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
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v11)
        goto LABEL_34;
      v23 = *(_QWORD *)(v36 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_43;
            if (v14 >= v11)
              goto LABEL_34;
            v23 = *(_QWORD *)(v36 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_21;
          }
        }
        v14 = v24;
      }
    }
LABEL_21:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    v25 = *(_QWORD *)(v5 + 48) + 40 * v20;
    if ((a2 & 1) != 0)
    {
      v26 = *(_OWORD *)v25;
      v27 = *(_OWORD *)(v25 + 16);
      v40 = *(_QWORD *)(v25 + 32);
      v38 = v26;
      v39 = v27;
      sub_23A500F6C((_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_23A506AD8(v25, (uint64_t)&v38);
      sub_23A50011C(*(_QWORD *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    result = sub_23A521C44();
    v28 = -1 << *(_BYTE *)(v7 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = *(_QWORD *)(v7 + 48) + 40 * v15;
    v17 = v38;
    v18 = v39;
    *(_QWORD *)(v16 + 32) = v40;
    *(_OWORD *)v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    result = (uint64_t)sub_23A500F6C(v37, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v15));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_23A505CBC(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v14;
  unint64_t v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _OWORD *v20;
  _OWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _BYTE v28[40];

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_23A521C38();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_23A506AD8(*(_QWORD *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        v10 = sub_23A521C44();
        result = sub_23A5067F0((uint64_t)v28);
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            v14 = *(_QWORD *)(a2 + 48);
            v15 = v14 + 40 * v3;
            v16 = (__int128 *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              v17 = *v16;
              v18 = v16[1];
              *(_QWORD *)(v15 + 32) = *((_QWORD *)v16 + 4);
              *(_OWORD *)v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            v19 = *(_QWORD *)(a2 + 56);
            v20 = (_OWORD *)(v19 + 32 * v3);
            v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (v3 = v6, v20 >= v21 + 2))
            {
              v9 = v21[1];
              *v20 = *v21;
              v20[1] = v9;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v23 = *v22;
    v24 = (-1 << v3) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    v24 = *v22;
    v23 = (-1 << result) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_23A505E84(_OWORD *a1, uint64_t a2, char a3)
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
  _OWORD *v17;
  _OWORD *result;
  unint64_t v19;
  char v20;
  _BYTE v21[40];

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_23A5057CC(a2);
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
      {
LABEL_8:
        v17 = (_OWORD *)(v16[7] + 32 * v10);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
        return sub_23A500F6C(a1, v17);
      }
      goto LABEL_11;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_23A506034();
      goto LABEL_7;
    }
    sub_23A5059A8(v13, a3 & 1);
    v19 = sub_23A5057CC(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_23A506AD8(a2, (uint64_t)v21);
      return sub_23A505FBC(v10, (uint64_t)v21, a1, v16);
    }
  }
  result = (_OWORD *)sub_23A521E30();
  __break(1u);
  return result;
}

_OWORD *sub_23A505FBC(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v5;
  __int128 v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v5 = a4[6] + 40 * a1;
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(a2 + 32);
  result = sub_23A500F6C(a3, (_OWORD *)(a4[7] + 32 * a1));
  v8 = a4[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a4[2] = v10;
  return result;
}

void *sub_23A506034()
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
  __int128 v19;
  __int128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  _OWORD v24[2];
  _OWORD v25[2];
  uint64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE78);
  v2 = *v0;
  v3 = sub_23A521CE0();
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    sub_23A506AD8(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    v17 = 32 * v15;
    sub_23A50011C(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v24);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v25[0];
    v20 = v25[1];
    *(_QWORD *)(v18 + 32) = v26;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    result = sub_23A500F6C(v24, (_OWORD *)(*(_QWORD *)(v4 + 56) + v17));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t _sSo7DTTimerC17DistributedTimersE27accessoryForTargetReferenceySSSg10Foundation13URLComponentsVSgFZ_0(uint64_t a1)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  void (*v36)(char *, unint64_t, uint64_t);
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  _QWORD v43[2];
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;

  v2 = sub_23A521770();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v44 = (char *)v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v43 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE70);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v45 = (char *)v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v46 = (char *)v43 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE08);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23A5217E8();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v43 - v20;
  sub_23A506A58(a1, (uint64_t)v14, &qword_25698AE08);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_23A506A9C((uint64_t)v14, &qword_25698AE08);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v14, v15);
  v22 = sub_23A5217B8();
  if (!v23)
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v15);
    goto LABEL_11;
  }
  if (v22 != 0x2D6B682D69726973 || v23 != 0xEE00746567726174)
  {
    v25 = sub_23A521E18();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v15);
    if ((v25 & 1) != 0)
      goto LABEL_16;
LABEL_11:
    v26 = *(void (**)(char *, uint64_t))(v16 + 8);
    v26(v19, v15);
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v15);
LABEL_16:
  v47 = v3;
  if (sub_23A5217A0() != 0x726F737365636361 || v29 != 0xE900000000000079)
  {
    v31 = sub_23A521E18();
    swift_bridgeObjectRelease();
    v26 = *(void (**)(char *, uint64_t))(v16 + 8);
    v26(v19, v15);
    v30 = v47;
    if ((v31 & 1) != 0)
      goto LABEL_20;
LABEL_12:
    v26(v21, v15);
    return 0;
  }
  swift_bridgeObjectRelease();
  v26 = *(void (**)(char *, uint64_t))(v16 + 8);
  v26(v19, v15);
  v30 = v47;
LABEL_20:
  v32 = sub_23A52177C();
  if (v32)
  {
    v33 = *(_QWORD *)(v32 + 16);
    v43[1] = v32;
    if (v33)
    {
      v43[0] = v26;
      v34 = v32 + ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80));
      v35 = *(_QWORD *)(v30 + 72);
      v36 = *(void (**)(char *, unint64_t, uint64_t))(v30 + 16);
      swift_bridgeObjectRetain();
      while (1)
      {
        v36(v7, v34, v2);
        if (sub_23A521758() == 0x696669746E656469 && v37 == 0xEA00000000007265)
          break;
        v38 = sub_23A521E18();
        swift_bridgeObjectRelease();
        if ((v38 & 1) != 0)
          goto LABEL_31;
        (*(void (**)(char *, uint64_t))(v47 + 8))(v7, v2);
        v34 += v35;
        if (!--v33)
        {
          swift_bridgeObjectRelease();
          v39 = 1;
          v40 = (uint64_t)v46;
          v30 = v47;
          goto LABEL_32;
        }
      }
      swift_bridgeObjectRelease();
LABEL_31:
      swift_bridgeObjectRelease();
      v40 = (uint64_t)v46;
      v30 = v47;
      (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v46, v7, v2);
      v39 = 0;
LABEL_32:
      v41 = (uint64_t)v45;
      v26 = (void (*)(char *, uint64_t))v43[0];
    }
    else
    {
      v39 = 1;
      v41 = (uint64_t)v45;
      v40 = (uint64_t)v46;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56))(v40, v39, 1, v2);
    swift_bridgeObjectRelease();
    sub_23A506A58(v40, v41, &qword_25698AE70);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v41, 1, v2) == 1)
    {
      v27 = 0;
    }
    else
    {
      v42 = v44;
      (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))(v44, v41, v2);
      v27 = sub_23A521764();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v42, v2);
    }
    sub_23A506A9C(v40, &qword_25698AE70);
  }
  else
  {
    v27 = 0;
  }
  v26(v21, v15);
  return v27;
}

uint64_t sub_23A506770()
{
  unint64_t v0;

  v0 = sub_23A521D28();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t sub_23A5067B8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23A5067F0(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

unint64_t sub_23A506828()
{
  unint64_t result;

  result = qword_25698AE30;
  if (!qword_25698AE30)
  {
    result = MEMORY[0x23B850924](&unk_23A522C74, &_s10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25698AE30);
  }
  return result;
}

unint64_t sub_23A506870()
{
  unint64_t result;

  result = qword_25698AE38;
  if (!qword_25698AE38)
  {
    result = MEMORY[0x23B850924](&unk_23A522D8C, &_s10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25698AE38);
  }
  return result;
}

unint64_t sub_23A5068B8()
{
  unint64_t result;

  result = qword_25698AE40;
  if (!qword_25698AE40)
  {
    result = MEMORY[0x23B850924](&unk_23A522D64, &_s10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25698AE40);
  }
  return result;
}

uint64_t _s10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A5069D8 + 4 * byte_23A522C6E[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23A506A0C + 4 * byte_23A522C69[v4]))();
}

uint64_t sub_23A506A0C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A506A14(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A506A1CLL);
  return result;
}

uint64_t sub_23A506A28(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A506A30);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23A506A34(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A506A3C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s10CodingKeysOMa()
{
  return &_s10CodingKeysON;
}

uint64_t sub_23A506A58(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23A506A9C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23A506AD8(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_23A506B14()
{
  return swift_release();
}

uint64_t sub_23A506B1C()
{
  uint64_t v0;

  v0 = sub_23A5219A4();
  __swift_allocate_value_buffer(v0, qword_25698C248);
  __swift_project_value_buffer(v0, (uint64_t)qword_25698C248);
  sub_23A50D098();
  swift_bridgeObjectRetain();
  return sub_23A521998();
}

uint64_t DTTimerClient._clientID.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___DTTimerClient__clientID);
}

void sub_23A506D08(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t DTTimerClient._requestContext.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR___DTTimerClient__requestContext + 8);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR___DTTimerClient__requestContext + 16);
  *a1 = *(_QWORD *)(v1 + OBJC_IVAR___DTTimerClient__requestContext);
  a1[1] = v2;
  a1[2] = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A506E38@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v4 = OBJC_IVAR___DTTimerClient__xpcClientCached;
  v5 = *(_QWORD *)(a1 + OBJC_IVAR___DTTimerClient__xpcClientCached);
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    type metadata accessor for DTXPCClient();
    v8 = *(_QWORD *)(a1 + OBJC_IVAR___DTTimerClient__environment);
    swift_bridgeObjectRetain();
    v6 = DTXPCClient.__allocating_init(environment:xpcEndpoint:)(&v8);
    *(_QWORD *)(a1 + v4) = v6;
    swift_retain();
    swift_release();
  }
  *a2 = v6;
  return swift_retain();
}

id sub_23A506ED0()
{
  _BYTE *v0;
  uint64_t v1;
  _BYTE *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __n128 *v9;
  objc_super v11;
  __n128 v12;
  __n128 v13;
  unint64_t v14;
  uint64_t v15;

  v0[OBJC_IVAR___DTTimerClient__activateCalled] = 0;
  v1 = OBJC_IVAR___DTTimerClient__clientID;
  v2 = v0;
  *(_QWORD *)&v0[v1] = CUNextID64();
  *(_QWORD *)&v2[OBJC_IVAR___DTTimerClient__error] = 0;
  v3 = &v2[OBJC_IVAR___DTTimerClient_eventHandler];
  *v3 = 0;
  v3[1] = 0;
  v4 = OBJC_IVAR___DTTimerClient__initTicks;
  *(_QWORD *)&v2[v4] = sub_23A521968();
  v2[OBJC_IVAR___DTTimerClient__invalidateCalled] = 0;
  v5 = OBJC_IVAR___DTTimerClient__lock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698AEA0);
  v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = 0;
  *(_QWORD *)&v2[v5] = v6;
  v2[OBJC_IVAR___DTTimerClient__monitorMode] = 0;
  v2[OBJC_IVAR___DTTimerClient__monitorSessionStarted] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___DTTimerClient__timerMap] = MEMORY[0x24BEE4B00];
  *(_QWORD *)&v2[OBJC_IVAR___DTTimerClient__xpcClientCached] = 0;
  DTEnvironmentValues.init()();
  sub_23A5067B8(0, (unint64_t *)&qword_25698B330);
  v7 = sub_23A521BC0();
  DTEnvironmentValues.dispatchQueue.setter(v7);
  *(_QWORD *)&v2[OBJC_IVAR___DTTimerClient__environment] = v15;
  v12 = 0uLL;
  DTRequestContext.init(endpoint:)(&v12, &v13);
  v8 = v14;
  v9 = (__n128 *)&v2[OBJC_IVAR___DTTimerClient__requestContext];
  *v9 = v13;
  v9[1].n128_u64[0] = v8;

  v11.receiver = v2;
  v11.super_class = (Class)DTTimerClient;
  return objc_msgSendSuper2(&v11, sel_init);
}

void sub_23A5070EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  os_unfair_lock_s *v8;
  os_unfair_lock_s *v9;
  unint64_t v10;
  unint64_t *v11;
  uint64_t v12[3];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[8];
  uint64_t v17;
  uint64_t v18;

  v1 = v0;
  LOBYTE(v12[0]) = 0;
  if ((unint64_t)sub_23A521968() >= *(_QWORD *)(v0 + OBJC_IVAR___DTTimerClient__initTicks))
  {
    v2 = sub_23A5218D8();
    v3 = *(void **)(v1 + OBJC_IVAR___DTTimerClient__error);
    v4 = v3;
    DTAnalyticsMonitorDetails.init(accessoryType:durationSeconds:error:)((char *)v12, v2, v3, (uint64_t)v16);
    v5 = (void *)v18;
    v12[0] = v16[0];
    v12[1] = v17;
    v12[2] = v18;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    DTAnalyticsLogEvent(_:)((uint64_t)v12);

    if (*(_BYTE *)(v1 + OBJC_IVAR___DTTimerClient__monitorSessionStarted) == 1)
    {
      MEMORY[0x24BDAC7A8](v6);
      v8 = v7 + 4;
      os_unfair_lock_lock(v7 + 4);
      sub_23A50C1F0(v12);
      os_unfair_lock_unlock(v8);
      DTXPCClient.monitorStop(client:completionHandler:)(v1, (uint64_t)nullsub_1, 0);
      swift_release();
    }
    v9 = (os_unfair_lock_s *)(*(_QWORD *)(v1 + OBJC_IVAR___DTTimerClient__lock) + 16);
    os_unfair_lock_lock(v9);
    v10 = sub_23A507FC0(MEMORY[0x24BEE4AF8]);
    v11 = (unint64_t *)(v1 + OBJC_IVAR___DTTimerClient__timerMap);
    swift_beginAccess();
    *v11 = v10;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v9);
  }
  else
  {
    __break(1u);
  }
}

void sub_23A507378()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unsigned __int8 *v8;
  NSObject *v9;
  os_log_type_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  v1 = sub_23A5219A4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend(v0, sel_eventHandler);
  v6 = 0x25698A000uLL;
  if (v5)
  {
    _Block_release(v5);
    *((_BYTE *)v0 + OBJC_IVAR___DTTimerClient__monitorMode) = 1;
  }
  if (qword_25698C240 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v1, (uint64_t)qword_25698C248);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v7, v1);
  v8 = v0;
  v9 = sub_23A52198C();
  v10 = sub_23A521B90();
  v11 = 0x25698A000uLL;
  if (os_log_type_enabled(v9, v10))
  {
    v12 = swift_slowAlloc();
    v22 = v2;
    v13 = v12;
    v14 = swift_slowAlloc();
    *(_DWORD *)v13 = 67109634;
    v15 = v8[OBJC_IVAR___DTTimerClient__monitorMode];
    v25 = v14;
    LODWORD(v23) = v15;
    sub_23A521BF0();
    *(_WORD *)(v13 + 8) = 2080;
    v16 = *(_QWORD *)&v8[OBJC_IVAR___DTTimerClient__requestContext + 16];
    v23 = *(_OWORD *)&v8[OBJC_IVAR___DTTimerClient__requestContext];
    v24 = v16;
    sub_23A4FCD00();
    v17 = sub_23A521DE8();
    *(_QWORD *)&v23 = sub_23A4FEAB8(v17, v18, &v25);
    sub_23A521BF0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 18) = 2080;
    if (v8[OBJC_IVAR___DTTimerClient__activateCalled])
      v19 = 0x2970756428202CLL;
    else
      v19 = 0;
    if (v8[OBJC_IVAR___DTTimerClient__activateCalled])
      v20 = 0xE700000000000000;
    else
      v20 = 0xE000000000000000;
    *(_QWORD *)&v23 = sub_23A4FEAB8(v19, v20, &v25);
    v6 = 0x25698A000;
    sub_23A521BF0();

    v11 = 0x25698A000;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A4FA000, v9, v10, "Activate: monitor=%{BOOL}d %s%s", (uint8_t *)v13, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x23B8509A8](v14, -1, -1);
    MEMORY[0x23B8509A8](v13, -1, -1);

    (*(void (**)(char *, uint64_t))(v22 + 8))(v4, v1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  v8[*(_QWORD *)(v11 + 3760)] = 1;
  if (v8[*(_QWORD *)(v6 + 3792)] == 1)
    DTTimerClient._monitorStart(restart:)(0);
}

uint64_t sub_23A5076AC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t default argument 0 of DTTimerClient._monitorStart(restart:)()
{
  return 0;
}

Swift::Void __swiftcall DTTimerClient._monitorStart(restart:)(Swift::Bool restart)
{
  char *v1;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)&v1[OBJC_IVAR___DTTimerClient__lock] + 16);
  os_unfair_lock_lock(v3);
  sub_23A50C1F0(&v5);
  os_unfair_lock_unlock(v3);
  v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  DTXPCClient.monitorStart(client:restart:completionHandler:)(v1, restart, (uint64_t)sub_23A50C21C, v4);
  swift_release();
  swift_release_n();
}

uint64_t sub_23A5077EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v18 = a3;
  v5 = sub_23A5219D4();
  v19 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23A5219EC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = *(_QWORD *)&v3[OBJC_IVAR___DTTimerClient__environment];
  v12 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v3;
  aBlock[4] = a2;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A5076AC;
  aBlock[3] = v18;
  v14 = _Block_copy(aBlock);
  v15 = v3;
  sub_23A5219E0();
  v20 = MEMORY[0x24BEE4AF8];
  sub_23A50CC1C(&qword_25698AEF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25698B4B0);
  sub_23A50C160();
  sub_23A521C2C();
  MEMORY[0x23B850240](0, v11, v7, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return swift_release();
}

void sub_23A5079D4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _BYTE *v6;
  NSObject *v7;
  os_log_type_t v8;
  unint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = sub_23A5219A4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25698C240 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v1, (uint64_t)qword_25698C248);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  v6 = v0;
  v7 = sub_23A52198C();
  v8 = sub_23A521B90();
  v9 = 0x25698A000uLL;
  if (os_log_type_enabled(v7, v8))
  {
    v10 = swift_slowAlloc();
    v18 = v2;
    v11 = (uint8_t *)v10;
    v12 = swift_slowAlloc();
    *(_DWORD *)v11 = 136315138;
    v20 = v12;
    if (v6[OBJC_IVAR___DTTimerClient__invalidateCalled])
      v13 = 0x297075642820;
    else
      v13 = 0;
    if (v6[OBJC_IVAR___DTTimerClient__invalidateCalled])
      v14 = 0xE600000000000000;
    else
      v14 = 0xE000000000000000;
    v19 = sub_23A4FEAB8(v13, v14, &v20);
    v9 = 0x25698A000;
    sub_23A521BF0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A4FA000, v7, v8, "Invalidate%s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B8509A8](v12, -1, -1);
    MEMORY[0x23B8509A8](v11, -1, -1);

    (*(void (**)(char *, uint64_t))(v18 + 8))(v4, v1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  v15 = *(_QWORD *)(v9 + 3784);
  v6[v15] = 1;
  v16 = OBJC_IVAR___DTTimerClient__monitorMode;
  if (v6[OBJC_IVAR___DTTimerClient__monitorMode] != 1 || (sub_23A5070EC(), v6[v16] = 0, v6[v15] == 1))
  {
    sub_23A507CA4(2, 0);
    objc_msgSend(v6, sel_setEventHandler_, 0);
  }
}

void sub_23A507CA4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  const void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v3 = v2;
  v6 = sub_23A5219A4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25698C240 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v6, (uint64_t)qword_25698C248);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  v11 = a2;
  v12 = a2;
  v13 = sub_23A52198C();
  v14 = sub_23A521B90();
  if (os_log_type_enabled(v13, v14))
  {
    v26 = v7;
    v24 = v2;
    v15 = swift_slowAlloc();
    v25 = swift_slowAlloc();
    v29 = v25;
    *(_DWORD *)v15 = 136315650;
    v27 = a1;
    v16 = DTTimerClientEventType.description.getter(a1);
    v28 = sub_23A4FEAB8(v16, v17, &v29);
    sub_23A521BF0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    v18 = 0xE300000000000000;
    v28 = sub_23A4FEAB8(7104878, 0xE300000000000000, &v29);
    sub_23A521BF0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 22) = 2080;
    if (a2)
    {
      swift_getErrorValue();
      v19 = sub_23A521E3C();
      v18 = v20;
      v3 = v24;
    }
    else
    {
      v3 = v24;
      v19 = 7104878;
    }
    v28 = sub_23A4FEAB8(v19, v18, &v29);
    sub_23A521BF0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A4FA000, v13, v14, "Event: type=%s, timer=%s, error=%s", (uint8_t *)v15, 0x20u);
    v21 = v25;
    swift_arrayDestroy();
    MEMORY[0x23B8509A8](v21, -1, -1);
    MEMORY[0x23B8509A8](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v6);
    a1 = v27;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  v22 = objc_msgSend(v3, sel_eventHandler);
  if (v22)
  {
    v23 = v22;
    (*((void (**)(id, uint64_t, _QWORD))v22 + 2))(v22, a1, 0);
    _Block_release(v23);
  }
}

unint64_t sub_23A507FC0(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698AFA8);
  v2 = (_QWORD *)sub_23A521CF8();
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
    result = sub_23A4FF1A4(v5, v6);
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

void DTTimerClient._monitorEvent(_:)(uint64_t **a1)
{
  uint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  unint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint8_t *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v26;
  char v27;
  unint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  char v32;
  unint64_t v33;
  char v34;
  _QWORD *v35;
  unint64_t *v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  unint64_t v43;
  SEL *v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  uint64_t v53;
  SEL *v54;
  char v55;
  uint64_t v56;
  void *v57;
  char *v58;
  uint64_t i;
  id v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  id v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  _QWORD *v70;
  _QWORD v71[3];

  v1 = *a1;
  v2 = (unint64_t)a1[1];
  v3 = (unint64_t)a1[2];
  if (qword_25698C240 != -1)
    goto LABEL_60;
  while (1)
  {
    v4 = sub_23A5219A4();
    __swift_project_value_buffer(v4, (uint64_t)qword_25698C248);
    swift_bridgeObjectRetain_n();
    v5 = sub_23A52198C();
    v6 = sub_23A521B90();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = v2;
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      *(_DWORD *)v8 = 136315138;
      v70 = (_QWORD *)v9;
      v71[0] = v1;
      v71[1] = v7;
      v71[2] = v3;
      sub_23A50C5E0();
      v1 = v71;
      v10 = sub_23A521DE8();
      v71[0] = sub_23A4FEAB8(v10, v11, (uint64_t *)&v70);
      sub_23A521BF0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23A4FA000, v5, v6, "Event: %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B8509A8](v9, -1, -1);
      v12 = v8;
      v2 = v7;
      MEMORY[0x23B8509A8](v12, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v13 = (char *)v66;
    if (v2 > 0xC)
      goto LABEL_46;
    v68 = v3;
    if (((1 << v2) & 0x1760) == 0)
      break;
    v1 = &v62;
    v14 = *(_QWORD *)((char *)v66 + OBJC_IVAR___DTTimerClient__lock) + 16;
    os_unfair_lock_lock((os_unfair_lock_t)v14);
    if (!v3)
      goto LABEL_45;
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain_n();
      v15 = sub_23A521CD4();
      if (!v15)
        goto LABEL_44;
    }
    else
    {
      v15 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      if (!v15)
      {
        while (1)
        {
LABEL_44:
          swift_bridgeObjectRelease_n();
LABEL_45:
          os_unfair_lock_unlock((os_unfair_lock_t)v14);
LABEL_46:
          v58 = (char *)objc_msgSend(v13, sel_eventHandler);
          if (!v58)
            return;
          v13 = v58;
          if (!v3)
            break;
          if (v3 >> 62)
          {
            swift_bridgeObjectRetain();
            v14 = sub_23A521CD4();
            if (!v14)
              goto LABEL_64;
          }
          else
          {
            v14 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            if (!v14)
              goto LABEL_64;
          }
          if (v14 >= 1)
          {
            for (i = 0; i != v14; ++i)
            {
              if ((v3 & 0xC000000000000001) != 0)
                v60 = (id)MEMORY[0x23B85030C](i, v3);
              else
                v60 = *(id *)(v3 + 8 * i + 32);
              v61 = v60;
              (*((void (**)(char *, unint64_t, id))v13 + 2))(v13, v2, v60);

            }
LABEL_64:
            swift_bridgeObjectRelease();
LABEL_65:
            _Block_release(v13);
            return;
          }
          __break(1u);
LABEL_68:
          swift_bridgeObjectRetain_n();
          v40 = sub_23A521CD4();
          if (v40)
            goto LABEL_32;
LABEL_69:
          v2 = v65;
        }
        (*((void (**)(char *, unint64_t, _QWORD))v58 + 2))(v58, v2, 0);
        goto LABEL_65;
      }
    }
    v63 = v14;
    v64 = &v62;
    v65 = v2;
    v16 = (uint64_t *)&v13[OBJC_IVAR___DTTimerClient__timerMap];
    v67 = v3 & 0xC000000000000001;
    v2 = 4;
    while (1)
    {
      v19 = v67 ? (id)MEMORY[0x23B85030C](v2 - 4, v3) : *(id *)(v3 + 8 * v2);
      v20 = v19;
      if (__OFADD__(v2 - 4, 1))
        break;
      v69 = v2 - 3;
      v1 = (uint64_t *)v15;
      v21 = objc_msgSend(v19, sel_identifier);
      v3 = sub_23A521A28();
      v23 = v22;

      swift_beginAccess();
      v24 = v20;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v70 = (_QWORD *)*v16;
      v26 = (uint64_t)v70;
      *v16 = 0x8000000000000000;
      v28 = sub_23A4FF1A4(v3, v23);
      v29 = *(_QWORD *)(v26 + 16);
      v30 = (v27 & 1) == 0;
      v31 = v29 + v30;
      if (__OFADD__(v29, v30))
        goto LABEL_58;
      v32 = v27;
      if (*(_QWORD *)(v26 + 24) >= v31)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          v35 = v70;
          if ((v27 & 1) != 0)
            goto LABEL_11;
        }
        else
        {
          sub_23A50B2FC();
          v35 = v70;
          if ((v32 & 1) != 0)
            goto LABEL_11;
        }
      }
      else
      {
        sub_23A50B4AC(v31, isUniquelyReferenced_nonNull_native);
        v33 = sub_23A4FF1A4(v3, v23);
        if ((v32 & 1) != (v34 & 1))
          goto LABEL_71;
        v28 = v33;
        v35 = v70;
        if ((v32 & 1) != 0)
        {
LABEL_11:
          v17 = v35[7];
          v18 = *(void **)(v17 + 8 * v28);
          *(_QWORD *)(v17 + 8 * v28) = v24;

          goto LABEL_12;
        }
      }
      v35[(v28 >> 6) + 8] |= 1 << v28;
      v36 = (unint64_t *)(v35[6] + 16 * v28);
      *v36 = v3;
      v36[1] = v23;
      *(_QWORD *)(v35[7] + 8 * v28) = v24;
      v37 = v35[2];
      v38 = __OFADD__(v37, 1);
      v39 = v37 + 1;
      if (v38)
        goto LABEL_59;
      v35[2] = v39;
      swift_bridgeObjectRetain();
LABEL_12:
      *v16 = (uint64_t)v35;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();

      ++v2;
      v15 = (uint64_t)v1;
      v3 = v68;
      if ((uint64_t *)v69 == v1)
        goto LABEL_43;
    }
    __break(1u);
LABEL_58:
    __break(1u);
LABEL_59:
    __break(1u);
LABEL_60:
    swift_once();
  }
  if (v2 != 7)
    goto LABEL_46;
  v1 = &v62;
  v14 = *(_QWORD *)((char *)v66 + OBJC_IVAR___DTTimerClient__lock) + 16;
  os_unfair_lock_lock((os_unfair_lock_t)v14);
  if (!v3)
    goto LABEL_45;
  v65 = 7;
  if (v3 >> 62)
    goto LABEL_68;
  v40 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  if (!v40)
    goto LABEL_69;
LABEL_32:
  v63 = v14;
  v64 = v1;
  if (v40 >= 1)
  {
    v41 = 0;
    v42 = (uint64_t *)((char *)v66 + OBJC_IVAR___DTTimerClient__timerMap);
    v43 = v3 & 0xC000000000000001;
    v44 = (SEL *)&unk_250B69000;
    v69 = v3 & 0xC000000000000001;
    do
    {
      if (v43)
        v45 = (id)MEMORY[0x23B85030C](v41, v3);
      else
        v45 = *(id *)(v3 + 8 * v41 + 32);
      v46 = v45;
      v47 = objc_msgSend(v45, v44[452]);
      v48 = sub_23A521A28();
      v50 = v49;

      swift_beginAccess();
      swift_bridgeObjectRetain();
      v51 = sub_23A4FF1A4(v48, v50);
      LOBYTE(v48) = v52;
      swift_bridgeObjectRelease();
      if ((v48 & 1) != 0)
      {
        v53 = v40;
        v54 = v44;
        v55 = swift_isUniquelyReferenced_nonNull_native();
        v56 = *v42;
        v70 = (_QWORD *)*v42;
        *v42 = 0x8000000000000000;
        if ((v55 & 1) == 0)
        {
          sub_23A50B2FC();
          v56 = (uint64_t)v70;
        }
        swift_bridgeObjectRelease();
        v57 = *(void **)(*(_QWORD *)(v56 + 56) + 8 * v51);
        sub_23A50B978(v51, v56);
        *v42 = v56;
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        v44 = v54;
        v40 = v53;
        v43 = v69;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      ++v41;
      swift_endAccess();

      v3 = v68;
    }
    while (v40 != v41);
LABEL_43:
    v2 = v65;
    v13 = (char *)v66;
    v14 = v63;
    v1 = v64;
    goto LABEL_44;
  }
  __break(1u);
LABEL_71:
  sub_23A521E30();
  __break(1u);
}

uint64_t sub_23A5088B8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  swift_beginAccess();
  v2 = swift_bridgeObjectRetain();
  v3 = sub_23A50BB5C(v2);
  result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

id sub_23A508940(char *a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  os_unfair_lock_s *v5;
  char *v6;
  void *v7;
  uint64_t v9;

  v5 = (os_unfair_lock_s *)(*(_QWORD *)&a1[OBJC_IVAR___DTTimerClient__lock] + 16);
  v6 = a1;
  os_unfair_lock_lock(v5);
  sub_23A50CD74(&v9);
  os_unfair_lock_unlock(v5);

  sub_23A5067B8(0, a4);
  v7 = (void *)sub_23A521AC4();
  swift_bridgeObjectRelease();
  return v7;
}

id sub_23A5089F0(uint64_t a1, SEL *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  id result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;

  v16 = MEMORY[0x24BEE4AF8];
  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  result = (id)swift_bridgeObjectRetain();
  v10 = 0;
  while (v7)
  {
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v12 = v11 | (v10 << 6);
LABEL_22:
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8 * v12), *a2);
    if (result)
    {
      MEMORY[0x23B850144]();
      if (*(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_23A521ADC();
      sub_23A521AE8();
      result = (id)sub_23A521AD0();
    }
  }
  v13 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
    __break(1u);
    goto LABEL_28;
  }
  if (v13 >= v8)
    goto LABEL_26;
  v14 = *(_QWORD *)(v4 + 8 * v13);
  ++v10;
  if (v14)
    goto LABEL_21;
  v10 = v13 + 1;
  if (v13 + 1 >= v8)
    goto LABEL_26;
  v14 = *(_QWORD *)(v4 + 8 * v10);
  if (v14)
    goto LABEL_21;
  v10 = v13 + 2;
  if (v13 + 2 >= v8)
    goto LABEL_26;
  v14 = *(_QWORD *)(v4 + 8 * v10);
  if (v14)
    goto LABEL_21;
  v10 = v13 + 3;
  if (v13 + 3 >= v8)
    goto LABEL_26;
  v14 = *(_QWORD *)(v4 + 8 * v10);
  if (v14)
  {
LABEL_21:
    v7 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v10 << 6);
    goto LABEL_22;
  }
  v15 = v13 + 4;
  if (v15 >= v8)
  {
LABEL_26:
    swift_release();
    return (id)v16;
  }
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
    v10 = v15;
    goto LABEL_21;
  }
  while (1)
  {
    v10 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v10 >= v8)
      goto LABEL_26;
    v14 = *(_QWORD *)(v4 + 8 * v10);
    ++v15;
    if (v14)
      goto LABEL_21;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_23A508BE0@<X0>(SEL *a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  id v5;
  uint64_t result;

  swift_beginAccess();
  v4 = swift_bridgeObjectRetain();
  v5 = sub_23A5089F0(v4, a1);
  result = swift_bridgeObjectRelease();
  *a2 = v5;
  return result;
}

uint64_t sub_23A508C68(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  char *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v5 = sub_23A5219D4();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v19 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_23A5219EC();
  v9 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = *(_QWORD *)&v2[OBJC_IVAR___DTTimerClient__environment];
  v12 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v2;
  v13[3] = a1;
  v13[4] = a2;
  aBlock[4] = sub_23A50CA40;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A5076AC;
  aBlock[3] = &block_descriptor_15;
  v14 = _Block_copy(aBlock);
  v15 = v2;
  swift_retain();
  sub_23A5219E0();
  v20 = MEMORY[0x24BEE4AF8];
  sub_23A50CC1C(&qword_25698AEF8, v6, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25698B4B0);
  sub_23A50C160();
  sub_23A521C2C();
  MEMORY[0x23B850240](0, v11, v8, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v18);
  return swift_release();
}

void sub_23A508E6C(void (*a1)(unint64_t, _QWORD), uint64_t a2)
{
  void *v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  unint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  os_unfair_lock_s *v29;
  os_unfair_lock_s *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  __int128 v37;
  void (*v38)(unint64_t, _QWORD);
  __n128 v39;
  __int128 v40;
  __int128 v41;
  char v42;
  uint64_t v43[3];
  __n128 v44;
  __int128 v45;
  __int128 v46;
  char v47;

  if (*((_BYTE *)v2 + OBJC_IVAR___DTTimerClient__monitorSessionStarted) == 1)
  {
    swift_beginAccess();
    v5 = swift_bridgeObjectRetain();
    v6 = (unint64_t)sub_23A50BB5C(v5);
    swift_bridgeObjectRelease();
    if (qword_25698C240 != -1)
      swift_once();
    v7 = sub_23A5219A4();
    __swift_project_value_buffer(v7, (uint64_t)qword_25698C248);
    swift_retain_n();
    v8 = v2;
    v9 = sub_23A52198C();
    v10 = sub_23A521B90();
    if (os_log_type_enabled(v9, v10))
    {
      v38 = a1;
      v11 = swift_slowAlloc();
      v12 = swift_slowAlloc();
      v43[0] = v12;
      *(_DWORD *)v11 = 134218242;
      if ((v6 & 0x8000000000000000) != 0 || (v6 & 0x4000000000000000) != 0)
      {
        swift_bridgeObjectRetain();
        v13 = sub_23A521CD4();
        swift_release();
      }
      else
      {
        v13 = *(_QWORD *)(v6 + 16);
      }
      swift_release();
      v39.n128_u64[0] = v13;
      sub_23A521BF0();
      swift_release();
      *(_WORD *)(v11 + 12) = 2080;
      v14 = *(_QWORD *)&v8[OBJC_IVAR___DTTimerClient__requestContext + 16];
      v39 = *(__n128 *)&v8[OBJC_IVAR___DTTimerClient__requestContext];
      *(_QWORD *)&v40 = v14;
      sub_23A4FCD00();
      v15 = sub_23A521DE8();
      v39.n128_u64[0] = sub_23A4FEAB8(v15, v16, v43);
      sub_23A521BF0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23A4FA000, v9, v10, "fetchTimers: cached, timers=%ld, %s", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23B8509A8](v12, -1, -1);
      MEMORY[0x23B8509A8](v11, -1, -1);

      v38(v6, 0);
    }
    else
    {

      swift_release_n();
      a1(v6, 0);
    }
    swift_release();
  }
  else
  {
    if (qword_25698C240 != -1)
      swift_once();
    v17 = sub_23A5219A4();
    __swift_project_value_buffer(v17, (uint64_t)qword_25698C248);
    v18 = v2;
    v19 = sub_23A52198C();
    v20 = sub_23A521B90();
    v21 = 0x25698A000uLL;
    if (os_log_type_enabled(v19, v20))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      v39.n128_u64[0] = v23;
      *(_DWORD *)v22 = 136315138;
      v24 = *(_QWORD *)&v18[OBJC_IVAR___DTTimerClient__requestContext + 16];
      v44 = *(__n128 *)&v18[OBJC_IVAR___DTTimerClient__requestContext];
      *(_QWORD *)&v45 = v24;
      sub_23A4FCD00();
      v25 = sub_23A521DE8();
      v44.n128_u64[0] = sub_23A4FEAB8(v25, v26, (uint64_t *)&v39);
      sub_23A521BF0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23A4FA000, v19, v20, "fetchTimers: %s", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B8509A8](v23, -1, -1);
      v27 = v22;
      v21 = 0x25698A000;
      MEMORY[0x23B8509A8](v27, -1, -1);

    }
    else
    {

    }
    MEMORY[0x24BDAC7A8](v28);
    v30 = v29 + 4;
    os_unfair_lock_lock(v29 + 4);
    sub_23A50C1F0((uint64_t *)&v44);
    os_unfair_lock_unlock(v30);
    *(_QWORD *)&v40 = 0;
    v39 = (__n128)1uLL;
    BYTE8(v40) = 10;
    v31 = (uint64_t *)&v18[*(_QWORD *)(v21 + 3752)];
    v32 = v31[1];
    v33 = v31[2];
    v43[0] = *v31;
    v43[1] = v32;
    v43[2] = v33;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    DTXPCRequest.init(request:context:)(&v39, (uint64_t)v43, (uint64_t)&v44);
    v39 = v44;
    v40 = v45;
    v41 = v46;
    v42 = v47;
    v34 = swift_allocObject();
    *(_QWORD *)(v34 + 16) = a1;
    *(_QWORD *)(v34 + 24) = a2;
    v35 = sub_23A50CE80();
    swift_retain();
    DTXPCClient.sendNonisolated<A>(request:replyHandler:)((__int128 *)&v39, (uint64_t)sub_23A50CE20, v34, (uint64_t)&type metadata for DTFetchTimersResponse, v35);
    swift_release();
    swift_release();
    v36 = (void *)*((_QWORD *)&v40 + 1);
    v37 = v41;
    LOBYTE(v30) = v42;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23A4FCCC0(v36, v37, *((uint64_t *)&v37 + 1), (char)v30);
  }
}

void sub_23A509468(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v5 = a1;
  if (a1)
  {
    type metadata accessor for DTTimer(0);
    v5 = (void *)sub_23A521AC4();
  }
  if (a2)
    v6 = sub_23A521830();
  else
    v6 = 0;
  v7 = (id)v6;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);

}

void sub_23A5094EC(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  os_unfair_lock_s *v23;
  os_unfair_lock_s *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  __n128 v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  _QWORD v39[3];
  __n128 v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  char v45;

  if (qword_25698C240 != -1)
    swift_once();
  v7 = sub_23A5219A4();
  __swift_project_value_buffer(v7, (uint64_t)qword_25698C248);
  v8 = a1;
  v9 = v3;
  v10 = v8;
  v11 = (char *)v9;
  v12 = sub_23A52198C();
  v13 = sub_23A521B90();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v15 = (_QWORD *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    v33.n128_u64[0] = v32;
    *(_DWORD *)v14 = 138412546;
    v40.n128_u64[0] = (unint64_t)v10;
    v16 = a2;
    v17 = a3;
    v18 = v10;
    sub_23A521BF0();
    *v15 = v10;

    a3 = v17;
    a2 = v16;
    *(_WORD *)(v14 + 12) = 2080;
    v19 = *(_QWORD *)&v11[OBJC_IVAR___DTTimerClient__requestContext + 16];
    v40 = *(__n128 *)&v11[OBJC_IVAR___DTTimerClient__requestContext];
    v41 = v19;
    sub_23A4FCD00();
    v20 = sub_23A521DE8();
    v40.n128_u64[0] = sub_23A4FEAB8(v20, v21, (uint64_t *)&v33);
    sub_23A521BF0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A4FA000, v12, v13, "addTimer: %@, %s", (uint8_t *)v14, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698AF10);
    swift_arrayDestroy();
    MEMORY[0x23B8509A8](v15, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x23B8509A8](v32, -1, -1);
    MEMORY[0x23B8509A8](v14, -1, -1);

  }
  else
  {

  }
  MEMORY[0x24BDAC7A8](v22);
  v24 = v23 + 4;
  os_unfair_lock_lock(v23 + 4);
  sub_23A50C1F0((uint64_t *)&v40);
  os_unfair_lock_unlock(v24);
  v34 = 0;
  v33 = (__n128)(unint64_t)v10;
  LOBYTE(v35) = 0;
  v25 = *(_QWORD *)&v11[OBJC_IVAR___DTTimerClient__requestContext + 8];
  v26 = *(_QWORD *)&v11[OBJC_IVAR___DTTimerClient__requestContext + 16];
  v39[0] = *(_QWORD *)&v11[OBJC_IVAR___DTTimerClient__requestContext];
  v39[1] = v25;
  v39[2] = v26;
  swift_bridgeObjectRetain();
  v27 = v10;
  swift_bridgeObjectRetain();
  DTXPCRequest.init(request:context:)(&v33, (uint64_t)v39, (uint64_t)&v40);
  v28 = v42;
  v29 = v43;
  v30 = v44;
  v31 = v45;
  v33 = v40;
  v34 = v41;
  v35 = v42;
  v36 = v43;
  v37 = v44;
  v38 = v45;
  DTXPCClient.send(request:completionHandler:)((__int128 *)&v33, a2, a3);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A4FCCC0(v28, v29, v30, v31);
}

void sub_23A5098E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_23A521830();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

void sub_23A509AF0(void *a1, uint64_t a2, uint64_t a3, const char *a4, void (*a5)(__n128 *__return_ptr), char a6)
{
  void *v6;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  _QWORD *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  os_unfair_lock_s *v28;
  os_unfair_lock_s *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  __n128 v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  _QWORD v47[3];
  __n128 v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  char v53;

  if (qword_25698C240 != -1)
    swift_once();
  v12 = sub_23A5219A4();
  __swift_project_value_buffer(v12, (uint64_t)qword_25698C248);
  v13 = a1;
  v14 = v6;
  v15 = v13;
  v16 = (char *)v14;
  v17 = sub_23A52198C();
  v18 = sub_23A521B90();
  if (os_log_type_enabled(v17, v18))
  {
    v39 = a2;
    v19 = swift_slowAlloc();
    v20 = (_QWORD *)swift_slowAlloc();
    v38 = swift_slowAlloc();
    v41.n128_u64[0] = v38;
    *(_DWORD *)v19 = 138412546;
    v48.n128_u64[0] = (unint64_t)v15;
    v21 = v15;
    sub_23A521BF0();
    *v20 = v15;

    *(_WORD *)(v19 + 12) = 2080;
    v22 = *(_QWORD *)&v16[OBJC_IVAR___DTTimerClient__requestContext + 16];
    v48 = *(__n128 *)&v16[OBJC_IVAR___DTTimerClient__requestContext];
    v49 = v22;
    sub_23A4FCD00();
    v23 = sub_23A521DE8();
    v48.n128_u64[0] = sub_23A4FEAB8(v23, v24, (uint64_t *)&v41);
    sub_23A521BF0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A4FA000, v17, v18, a4, (uint8_t *)v19, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698AF10);
    swift_arrayDestroy();
    MEMORY[0x23B8509A8](v20, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x23B8509A8](v38, -1, -1);
    v25 = v19;
    a2 = v39;
    MEMORY[0x23B8509A8](v25, -1, -1);

    v27 = 0x25698A000;
  }
  else
  {

    v27 = 0x25698A000uLL;
  }
  MEMORY[0x24BDAC7A8](v26);
  v29 = v28 + 4;
  os_unfair_lock_lock(v28 + 4);
  a5(&v48);
  os_unfair_lock_unlock(v29);
  v42 = 0;
  v41 = (__n128)(unint64_t)v15;
  LOBYTE(v43) = a6;
  v30 = &v16[*(_QWORD *)(v27 + 3752)];
  v31 = *((_QWORD *)v30 + 1);
  v32 = *((_QWORD *)v30 + 2);
  v47[0] = *(_QWORD *)v30;
  v47[1] = v31;
  v47[2] = v32;
  swift_bridgeObjectRetain();
  v33 = v15;
  swift_bridgeObjectRetain();
  DTXPCRequest.init(request:context:)(&v41, (uint64_t)v47, (uint64_t)&v48);
  v34 = v50;
  v35 = v51;
  v36 = v52;
  v37 = v53;
  v41 = v48;
  v42 = v49;
  v43 = v50;
  v44 = v51;
  v45 = v52;
  v46 = v53;
  DTXPCClient.send(request:completionHandler:)((__int128 *)&v41, a2, a3);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A4FCCC0(v34, v35, v36, v37);
}

uint64_t DTTimerClient.diagnostics(request:)(_BYTE *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 152) = v1;
  *(_BYTE *)(v2 + 66) = *a1;
  return swift_task_switch();
}

uint64_t sub_23A509F54()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  char v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  os_unfair_lock_s *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
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
  _QWORD *v24;
  unint64_t v25;
  __n128 v27;
  uint64_t v28;
  char v29;
  _QWORD v30[4];

  if (qword_25698C240 != -1)
    swift_once();
  v1 = sub_23A5219A4();
  __swift_project_value_buffer(v1, (uint64_t)qword_25698C248);
  v2 = sub_23A52198C();
  v3 = sub_23A521B90();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(_BYTE *)(v0 + 66);
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v27.n128_u64[0] = v6;
    *(_DWORD *)v5 = 136315138;
    *(_BYTE *)(v0 + 65) = v4;
    sub_23A50CAD4();
    v7 = sub_23A521DE8();
    *(_QWORD *)(v0 + 144) = sub_23A4FEAB8(v7, v8, (uint64_t *)&v27);
    sub_23A521BF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A4FA000, v2, v3, "diagnostics: %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B8509A8](v6, -1, -1);
    MEMORY[0x23B8509A8](v5, -1, -1);
  }

  v9 = *(_QWORD *)(v0 + 152);
  v10 = *(os_unfair_lock_s **)(v9 + OBJC_IVAR___DTTimerClient__lock);
  v11 = swift_task_alloc();
  *(_QWORD *)(v11 + 16) = v9;
  v12 = swift_task_alloc();
  *(_QWORD *)(v12 + 16) = sub_23A50CA68;
  *(_QWORD *)(v12 + 24) = v11;
  os_unfair_lock_lock(v10 + 4);
  (*(void (**)(__n128 *__return_ptr))(v12 + 16))(&v27);
  v13 = *(unsigned __int8 *)(v0 + 66);
  v14 = *(_QWORD *)(v0 + 152);
  *(_QWORD *)(v0 + 160) = v27.n128_u64[0];
  os_unfair_lock_unlock(v10 + 4);
  swift_task_dealloc();
  swift_task_dealloc();
  v28 = 0;
  v27 = (__n128)v13;
  v29 = 9;
  v15 = *(_QWORD *)(v14 + OBJC_IVAR___DTTimerClient__requestContext + 8);
  v16 = *(_QWORD *)(v14 + OBJC_IVAR___DTTimerClient__requestContext + 16);
  v30[0] = *(_QWORD *)(v14 + OBJC_IVAR___DTTimerClient__requestContext);
  v30[1] = v15;
  v30[2] = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  DTXPCRequest.init(request:context:)(&v27, (uint64_t)v30, v0 + 16);
  v17 = *(_QWORD *)(v0 + 16);
  v18 = *(_QWORD *)(v0 + 24);
  v19 = *(_QWORD *)(v0 + 32);
  v20 = *(_QWORD *)(v0 + 40);
  *(_QWORD *)(v0 + 168) = v18;
  *(_QWORD *)(v0 + 176) = v19;
  v21 = *(_QWORD *)(v0 + 48);
  v22 = *(_QWORD *)(v0 + 56);
  *(_QWORD *)(v0 + 184) = v20;
  *(_QWORD *)(v0 + 192) = v21;
  *(_QWORD *)(v0 + 200) = v22;
  v23 = *(_BYTE *)(v0 + 64);
  *(_BYTE *)(v0 + 67) = v23;
  *(_QWORD *)(v0 + 72) = v17;
  *(_QWORD *)(v0 + 80) = v18;
  *(_QWORD *)(v0 + 88) = v19;
  *(_QWORD *)(v0 + 96) = v20;
  *(_QWORD *)(v0 + 104) = v21;
  *(_QWORD *)(v0 + 112) = v22;
  *(_BYTE *)(v0 + 120) = v23;
  v24 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 208) = v24;
  v25 = sub_23A50CA90();
  *v24 = v0;
  v24[1] = sub_23A50A258;
  return DTXPCClient.send<A>(request:)(v0 + 128, v0 + 72, (uint64_t)&type metadata for DTShowResponse, v25);
}

uint64_t sub_23A50A258()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *v1;
  *(_QWORD *)(*v1 + 216) = v0;
  swift_task_dealloc();
  v3 = *(_QWORD *)(v2 + 192);
  v4 = *(_QWORD *)(v2 + 200);
  v5 = *(void **)(v2 + 184);
  LOBYTE(v2) = *(_BYTE *)(v2 + 67);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A4FCCC0(v5, v3, v4, v2);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23A50A33C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 136));
}

uint64_t sub_23A50A34C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DTTimerClient.echo(message:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[24] = a2;
  v3[25] = v2;
  v3[23] = a1;
  return swift_task_switch();
}

uint64_t sub_23A50A374()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  os_unfair_lock_s *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  _QWORD *v30;
  unint64_t v31;
  uint64_t v33;
  __n128 v34;
  uint64_t v35;
  char v36;
  _QWORD v37[4];

  if (qword_25698C240 != -1)
    swift_once();
  v1 = *(void **)(v0 + 200);
  v2 = sub_23A5219A4();
  __swift_project_value_buffer(v2, (uint64_t)qword_25698C248);
  swift_bridgeObjectRetain_n();
  v3 = v1;
  v4 = sub_23A52198C();
  v5 = sub_23A521B90();
  v6 = os_log_type_enabled(v4, v5);
  v8 = *(_QWORD *)(v0 + 192);
  v7 = *(char **)(v0 + 200);
  if (v6)
  {
    v9 = *(_QWORD *)(v0 + 184);
    v10 = swift_slowAlloc();
    v33 = swift_slowAlloc();
    v34.n128_u64[0] = v33;
    *(_DWORD *)v10 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 168) = sub_23A4FEAB8(v9, v8, (uint64_t *)&v34);
    sub_23A521BF0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 12) = 2080;
    v11 = *(_QWORD *)&v7[OBJC_IVAR___DTTimerClient__requestContext + 16];
    *(_OWORD *)(v0 + 128) = *(_OWORD *)&v7[OBJC_IVAR___DTTimerClient__requestContext];
    *(_QWORD *)(v0 + 144) = v11;
    sub_23A4FCD00();
    v12 = sub_23A521DE8();
    *(_QWORD *)(v0 + 176) = sub_23A4FEAB8(v12, v13, (uint64_t *)&v34);
    sub_23A521BF0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A4FA000, v4, v5, "echo: message=%s, %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B8509A8](v33, -1, -1);
    MEMORY[0x23B8509A8](v10, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();

  }
  v14 = *(_QWORD *)(v0 + 200);
  v15 = *(os_unfair_lock_s **)(v14 + OBJC_IVAR___DTTimerClient__lock);
  v16 = swift_task_alloc();
  *(_QWORD *)(v16 + 16) = v14;
  v17 = swift_task_alloc();
  *(_QWORD *)(v17 + 16) = sub_23A50CF20;
  *(_QWORD *)(v17 + 24) = v16;
  os_unfair_lock_lock(v15 + 4);
  (*(void (**)(__n128 *__return_ptr))(v17 + 16))(&v34);
  v18 = *(_QWORD *)(v0 + 192);
  v19 = *(_QWORD *)(v0 + 200);
  v20 = *(_QWORD *)(v0 + 184);
  *(_QWORD *)(v0 + 208) = v34.n128_u64[0];
  os_unfair_lock_unlock(v15 + 4);
  swift_task_dealloc();
  swift_task_dealloc();
  v34.n128_u64[0] = v20;
  v34.n128_u64[1] = v18;
  v35 = 0;
  v36 = 5;
  v21 = *(_QWORD *)(v19 + OBJC_IVAR___DTTimerClient__requestContext + 8);
  v22 = *(_QWORD *)(v19 + OBJC_IVAR___DTTimerClient__requestContext + 16);
  v37[0] = *(_QWORD *)(v19 + OBJC_IVAR___DTTimerClient__requestContext);
  v37[1] = v21;
  v37[2] = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  DTXPCRequest.init(request:context:)(&v34, (uint64_t)v37, v0 + 16);
  v23 = *(_QWORD *)(v0 + 16);
  v24 = *(_QWORD *)(v0 + 24);
  v25 = *(_QWORD *)(v0 + 32);
  v26 = *(_QWORD *)(v0 + 40);
  *(_QWORD *)(v0 + 216) = v24;
  *(_QWORD *)(v0 + 224) = v25;
  v27 = *(_QWORD *)(v0 + 48);
  v28 = *(_QWORD *)(v0 + 56);
  *(_QWORD *)(v0 + 232) = v26;
  *(_QWORD *)(v0 + 240) = v27;
  *(_QWORD *)(v0 + 248) = v28;
  v29 = *(_BYTE *)(v0 + 64);
  *(_BYTE *)(v0 + 65) = v29;
  *(_QWORD *)(v0 + 72) = v23;
  *(_QWORD *)(v0 + 80) = v24;
  *(_QWORD *)(v0 + 88) = v25;
  *(_QWORD *)(v0 + 96) = v26;
  *(_QWORD *)(v0 + 104) = v27;
  *(_QWORD *)(v0 + 112) = v28;
  *(_BYTE *)(v0 + 120) = v29;
  v30 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 256) = v30;
  v31 = sub_23A50CB18();
  *v30 = v0;
  v30[1] = sub_23A50A72C;
  return DTXPCClient.send<A>(request:)(v0 + 152, v0 + 72, (uint64_t)&type metadata for DTEchoResponse, v31);
}

uint64_t sub_23A50A72C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *v1;
  *(_QWORD *)(*v1 + 264) = v0;
  swift_task_dealloc();
  v3 = *(_QWORD *)(v2 + 240);
  v4 = *(_QWORD *)(v2 + 248);
  v5 = *(void **)(v2 + 232);
  LOBYTE(v2) = *(_BYTE *)(v2 + 65);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A4FCCC0(v5, v3, v4, v2);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23A50A810()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 160));
}

uint64_t sub_23A50A820()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DTTimerClient.show()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 176) = v0;
  return swift_task_switch();
}

uint64_t sub_23A50A844()
{
  uint64_t v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  char *v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  os_unfair_lock_s *v15;
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
  char v27;
  _QWORD *v28;
  unint64_t v29;
  __n128 v31;
  uint64_t v32;
  char v33;
  _QWORD v34[4];

  if (qword_25698C240 != -1)
    swift_once();
  v1 = (uint64_t *)(v0 + 176);
  v2 = *(void **)(v0 + 176);
  v3 = sub_23A5219A4();
  __swift_project_value_buffer(v3, (uint64_t)qword_25698C248);
  v4 = v2;
  v5 = sub_23A52198C();
  v6 = sub_23A521B90();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(char **)(v0 + 176);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v31.n128_u64[0] = v10;
    *(_DWORD *)v9 = 136315138;
    v11 = *(_QWORD *)&v8[OBJC_IVAR___DTTimerClient__requestContext + 16];
    *(_OWORD *)(v0 + 128) = *(_OWORD *)&v8[OBJC_IVAR___DTTimerClient__requestContext];
    *(_QWORD *)(v0 + 144) = v11;
    sub_23A4FCD00();
    v12 = sub_23A521DE8();
    *(_QWORD *)(v0 + 168) = sub_23A4FEAB8(v12, v13, (uint64_t *)&v31);
    sub_23A521BF0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A4FA000, v5, v6, "show, %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B8509A8](v10, -1, -1);
    MEMORY[0x23B8509A8](v9, -1, -1);
  }
  else
  {

  }
  v14 = *v1;
  v15 = *(os_unfair_lock_s **)(*v1 + OBJC_IVAR___DTTimerClient__lock);
  v16 = swift_task_alloc();
  *(_QWORD *)(v16 + 16) = v14;
  v17 = swift_task_alloc();
  *(_QWORD *)(v17 + 16) = sub_23A50CF20;
  *(_QWORD *)(v17 + 24) = v16;
  os_unfair_lock_lock(v15 + 4);
  (*(void (**)(__n128 *__return_ptr))(v17 + 16))(&v31);
  v18 = *(_QWORD *)(v0 + 176);
  *(_QWORD *)(v0 + 184) = v31.n128_u64[0];
  os_unfair_lock_unlock(v15 + 4);
  swift_task_dealloc();
  swift_task_dealloc();
  v32 = 0;
  v31 = (__n128)0x80uLL;
  v33 = 9;
  v19 = *(_QWORD *)(v18 + OBJC_IVAR___DTTimerClient__requestContext + 8);
  v20 = *(_QWORD *)(v18 + OBJC_IVAR___DTTimerClient__requestContext + 16);
  v34[0] = *(_QWORD *)(v18 + OBJC_IVAR___DTTimerClient__requestContext);
  v34[1] = v19;
  v34[2] = v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  DTXPCRequest.init(request:context:)(&v31, (uint64_t)v34, v0 + 16);
  v21 = *(_QWORD *)(v0 + 16);
  v22 = *(_QWORD *)(v0 + 24);
  v23 = *(_QWORD *)(v0 + 32);
  v24 = *(_QWORD *)(v0 + 40);
  *(_QWORD *)(v0 + 192) = v22;
  *(_QWORD *)(v0 + 200) = v23;
  v25 = *(_QWORD *)(v0 + 48);
  v26 = *(_QWORD *)(v0 + 56);
  *(_QWORD *)(v0 + 208) = v24;
  *(_QWORD *)(v0 + 216) = v25;
  *(_QWORD *)(v0 + 224) = v26;
  v27 = *(_BYTE *)(v0 + 64);
  *(_BYTE *)(v0 + 65) = v27;
  *(_QWORD *)(v0 + 72) = v21;
  *(_QWORD *)(v0 + 80) = v22;
  *(_QWORD *)(v0 + 88) = v23;
  *(_QWORD *)(v0 + 96) = v24;
  *(_QWORD *)(v0 + 104) = v25;
  *(_QWORD *)(v0 + 112) = v26;
  *(_BYTE *)(v0 + 120) = v27;
  v28 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 232) = v28;
  v29 = sub_23A50CA90();
  *v28 = v0;
  v28[1] = sub_23A50AB88;
  return DTXPCClient.send<A>(request:)(v0 + 152, v0 + 72, (uint64_t)&type metadata for DTShowResponse, v29);
}

uint64_t sub_23A50AB88()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *v1;
  *(_QWORD *)(*v1 + 240) = v0;
  swift_task_dealloc();
  v3 = *(_QWORD *)(v2 + 216);
  v4 = *(_QWORD *)(v2 + 224);
  v5 = *(void **)(v2 + 208);
  LOBYTE(v2) = *(_BYTE *)(v2 + 65);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A4FCCC0(v5, v3, v4, v2);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23A50AC6C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t DTTimerClientEventType.description.getter(uint64_t a1)
{
  unint64_t result;

  result = 0xD000000000000012;
  switch(a1)
  {
    case 0:
      result = 0x64696C61766E69;
      break;
    case 1:
      result = 0x6574617669746361;
      break;
    case 2:
      result = 0x6164696C61766E69;
      break;
    case 3:
      result = 0x7075727265746E69;
      break;
    case 4:
      result = 0x726F727265;
      break;
    case 5:
      result = 0x64644172656D6974;
      break;
    case 6:
      result = 0x64705572656D6974;
      break;
    case 7:
      result = 0x6D655272656D6974;
      break;
    case 8:
      result = 0x6F6E5372656D6974;
      break;
    case 9:
      result = 0x73694472656D6974;
      break;
    case 10:
      result = 0x72694672656D6974;
      break;
    case 11:
    case 12:
      return result;
    default:
      result = 63;
      break;
  }
  return result;
}

uint64_t sub_23A50AE10()
{
  sub_23A50CC1C(&qword_25698AFB0, (uint64_t (*)(uint64_t))type metadata accessor for DTTimerClientEventType, (uint64_t)&unk_23A522FE4);
  return sub_23A521AA0();
}

uint64_t sub_23A50AE84()
{
  sub_23A50CC1C(&qword_25698AFB0, (uint64_t (*)(uint64_t))type metadata accessor for DTTimerClientEventType, (uint64_t)&unk_23A522FE4);
  return sub_23A521A88();
}

unint64_t sub_23A50AEE8()
{
  uint64_t *v0;

  return DTTimerClientEventType.description.getter(*v0);
}

uint64_t DTTimerClientStatusFlags.description.getter(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  unint64_t v10;

  v2 = sub_23A521908();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = 0;
  v10 = 0xE000000000000000;
  sub_23A5218FC();
  if ((a1 & 1) != 0)
  {
    sub_23A521A40();
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  sub_23A521A40();
  if ((a1 & 4) != 0)
LABEL_4:
    sub_23A521A40();
LABEL_5:
  v6 = v9;
  v7 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0)
    v7 = v9 & 0xFFFFFFFFFFFFLL;
  if (!v7)
  {
    swift_bridgeObjectRelease();
    v6 = 1701736270;
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6;
}

uint64_t sub_23A50B018()
{
  sub_23A50CC1C(&qword_25698AF98, (uint64_t (*)(uint64_t))type metadata accessor for DTTimerClientStatusFlags, (uint64_t)&unk_23A523080);
  return sub_23A521AAC();
}

uint64_t sub_23A50B08C()
{
  sub_23A50CC1C(&qword_25698AF98, (uint64_t (*)(uint64_t))type metadata accessor for DTTimerClientStatusFlags, (uint64_t)&unk_23A523080);
  return sub_23A521A94();
}

uint64_t sub_23A50B0F0()
{
  _QWORD *v0;

  return DTTimerClientStatusFlags.description.getter(*v0);
}

_QWORD *sub_23A50B0F8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_23A50B108(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *sub_23A50B114@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_23A50B120(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_23A50B128@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_23A50B13C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_23A50B150@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_23A50B164(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_23A50B194@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
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

uint64_t *sub_23A50B1C0@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
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

_QWORD *sub_23A50B1E4(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_23A50B1F8(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_23A50B20C(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_23A50B220@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_23A50B234(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_23A50B248(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_23A50B25C(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_23A50B270()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_23A50B280()
{
  return sub_23A521C20();
}

_QWORD *sub_23A50B298(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

BOOL sub_23A50B2AC(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23A50B2C0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_23A50CCE0(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

id sub_23A50B2FC()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698AFA8);
  v2 = *v0;
  v3 = sub_23A521CE0();
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

uint64_t sub_23A50B4AC(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698AFA8);
  v38 = a2;
  v6 = sub_23A521CEC();
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
    sub_23A521E54();
    sub_23A521A58();
    result = sub_23A521E6C();
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

uint64_t sub_23A50B7B8(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23A50B7D4(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_23A50B7D4(char a1, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698AFD0);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8)
      memmove(v10 + 4, a4 + 4, 24 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698AFD8);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23A521D04();
  __break(1u);
  return result;
}

unint64_t sub_23A50B978(unint64_t result, uint64_t a2)
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
    result = sub_23A521C38();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_23A521E54();
        swift_bridgeObjectRetain();
        sub_23A521A58();
        v9 = sub_23A521E6C();
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

uint64_t sub_23A50BB4C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

_QWORD *sub_23A50BB5C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698AFC0);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 25;
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  v6 = sub_23A50BC44(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_23A506B14();
  if (v6 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

_QWORD *sub_23A50BC44(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  void *v20;
  id v21;

  v5 = result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (_QWORD *)v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = *(void **)(*(_QWORD *)(a4 + 56) + 8 * v16);
    *v11 = v20;
    if (v13 == v10)
    {
      v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    result = v20;
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

id sub_23A50BE3C()
{
  _BYTE *v0;
  uint64_t v1;
  _BYTE *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __n128 *v9;
  objc_super v11;
  __n128 v12;
  __n128 v13;
  unint64_t v14;
  uint64_t v15;

  v0[OBJC_IVAR___DTTimerClient__activateCalled] = 0;
  v1 = OBJC_IVAR___DTTimerClient__clientID;
  v2 = v0;
  *(_QWORD *)&v0[v1] = CUNextID64();
  *(_QWORD *)&v2[OBJC_IVAR___DTTimerClient__error] = 0;
  v3 = &v2[OBJC_IVAR___DTTimerClient_eventHandler];
  *v3 = 0;
  v3[1] = 0;
  v4 = OBJC_IVAR___DTTimerClient__initTicks;
  *(_QWORD *)&v2[v4] = sub_23A521968();
  v2[OBJC_IVAR___DTTimerClient__invalidateCalled] = 0;
  v5 = OBJC_IVAR___DTTimerClient__lock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698AEA0);
  v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = 0;
  *(_QWORD *)&v2[v5] = v6;
  v2[OBJC_IVAR___DTTimerClient__monitorMode] = 0;
  v2[OBJC_IVAR___DTTimerClient__monitorSessionStarted] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___DTTimerClient__timerMap] = MEMORY[0x24BEE4B00];
  *(_QWORD *)&v2[OBJC_IVAR___DTTimerClient__xpcClientCached] = 0;
  DTEnvironmentValues.init()();
  v7 = sub_23A521BA8();
  DTEnvironmentValues.dispatchQueue.setter(v7);
  *(_QWORD *)&v2[OBJC_IVAR___DTTimerClient__environment] = v15;
  v12 = 0uLL;
  DTRequestContext.init(endpoint:)(&v12, &v13);
  v8 = v14;
  v9 = (__n128 *)&v2[OBJC_IVAR___DTTimerClient__requestContext];
  *v9 = v13;
  v9[1].n128_u64[0] = v8;

  v11.receiver = v2;
  v11.super_class = (Class)DTTimerClient;
  return objc_msgSendSuper2(&v11, sel_init);
}

id sub_23A50BF98(uint64_t a1, unint64_t a2, unint64_t a3)
{
  _BYTE *v3;
  uint64_t v6;
  _BYTE *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  __n128 *v14;
  objc_super v16;
  __n128 v17;
  __n128 v18;
  unint64_t v19;
  uint64_t v20;

  v3[OBJC_IVAR___DTTimerClient__activateCalled] = 0;
  v6 = OBJC_IVAR___DTTimerClient__clientID;
  v7 = v3;
  *(_QWORD *)&v3[v6] = CUNextID64();
  *(_QWORD *)&v7[OBJC_IVAR___DTTimerClient__error] = 0;
  v8 = &v7[OBJC_IVAR___DTTimerClient_eventHandler];
  *v8 = 0;
  v8[1] = 0;
  v9 = OBJC_IVAR___DTTimerClient__initTicks;
  *(_QWORD *)&v7[v9] = sub_23A521968();
  v7[OBJC_IVAR___DTTimerClient__invalidateCalled] = 0;
  v10 = OBJC_IVAR___DTTimerClient__lock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698AEA0);
  v11 = swift_allocObject();
  *(_DWORD *)(v11 + 16) = 0;
  *(_QWORD *)&v7[v10] = v11;
  v7[OBJC_IVAR___DTTimerClient__monitorMode] = 0;
  v7[OBJC_IVAR___DTTimerClient__monitorSessionStarted] = 0;
  *(_QWORD *)&v7[OBJC_IVAR___DTTimerClient__timerMap] = MEMORY[0x24BEE4B00];
  *(_QWORD *)&v7[OBJC_IVAR___DTTimerClient__xpcClientCached] = 0;
  DTEnvironmentValues.init()();
  v12 = sub_23A521BA8();
  DTEnvironmentValues.dispatchQueue.setter(v12);
  *(_QWORD *)&v7[OBJC_IVAR___DTTimerClient__environment] = v20;
  v17.n128_u64[0] = a2;
  v17.n128_u64[1] = a3;
  DTRequestContext.init(endpoint:)(&v17, &v18);
  v13 = v19;
  v14 = (__n128 *)&v7[OBJC_IVAR___DTTimerClient__requestContext];
  *v14 = v18;
  v14[1].n128_u64[0] = v13;

  v16.receiver = v7;
  v16.super_class = (Class)DTTimerClient;
  return objc_msgSendSuper2(&v16, sel_init);
}

uint64_t sub_23A50C104()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_23A50C128()
{
  sub_23A507378();
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

unint64_t sub_23A50C160()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25698AF00;
  if (!qword_25698AF00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_25698B4B0);
    result = MEMORY[0x23B850924](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_25698AF00);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B850918](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A50C1F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_23A506E38(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_23A50C1F8()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_23A50C21C(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  char v3;
  uint64_t v4;
  char *v5;
  os_unfair_lock_s *v6;
  void *v7;
  id v8;
  unint64_t v9;
  unint64_t *v10;
  id v11;
  os_unfair_lock_s *v12;
  os_unfair_lock_s *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  char *v31;
  _QWORD v32[3];
  char *v33;
  unint64_t v34;
  _QWORD *v35;

  v2 = *(_QWORD *)a1;
  v3 = *(_BYTE *)(a1 + 8);
  swift_beginAccess();
  v4 = MEMORY[0x23B850A44](v1 + 16);
  if (v4)
  {
    v5 = (char *)v4;
    if ((v3 & 1) != 0)
    {
      v6 = *(os_unfair_lock_s **)(v4 + OBJC_IVAR___DTTimerClient__lock);
      sub_23A50CF08((id)v2, 1);
      swift_retain();
      os_unfair_lock_lock(v6 + 4);
      v7 = *(void **)&v5[OBJC_IVAR___DTTimerClient__error];
      *(_QWORD *)&v5[OBJC_IVAR___DTTimerClient__error] = v2;

      v8 = (id)v2;
      v9 = sub_23A507FC0(MEMORY[0x24BEE4AF8]);
      v10 = (unint64_t *)&v5[OBJC_IVAR___DTTimerClient__timerMap];
      swift_beginAccess();
      *v10 = v9;
      swift_bridgeObjectRelease();
      os_unfair_lock_unlock(v6 + 4);
      swift_release();
      v11 = (id)v2;
      sub_23A507CA4(4, (void *)v2);

      sub_23A50CF14((id)v2, 1);
      sub_23A50CF14((id)v2, 1);
      return;
    }
    *(_BYTE *)(v4 + OBJC_IVAR___DTTimerClient__monitorSessionStarted) = 1;
    v12 = *(os_unfair_lock_s **)(v4 + OBJC_IVAR___DTTimerClient__lock);
    v13 = v12 + 4;
    swift_retain();
    os_unfair_lock_lock(v12 + 4);
    v14 = *(void **)&v5[OBJC_IVAR___DTTimerClient__error];
    *(_QWORD *)&v5[OBJC_IVAR___DTTimerClient__error] = 0;

    if (v2 >> 62)
    {
      swift_bridgeObjectRetain();
      v15 = sub_23A521CD4();
      if (v15)
      {
LABEL_6:
        v32[0] = v12 + 4;
        v32[1] = v12;
        v32[2] = v32;
        v33 = v5;
        v35 = (_QWORD *)MEMORY[0x24BEE4AF8];
        sub_23A50B7B8(0, v15 & ~(v15 >> 63), 0);
        if (v15 < 0)
        {
          __break(1u);
          swift_release();
          __break(1u);
          return;
        }
        v16 = 0;
        v17 = v35;
        v34 = v2 & 0xC000000000000001;
        v18 = v2;
        v19 = v15;
        do
        {
          if (v34)
            v20 = (id)MEMORY[0x23B85030C](v16, v2);
          else
            v20 = *(id *)(v2 + 8 * v16 + 32);
          v21 = v20;
          v22 = objc_msgSend(v20, sel_identifier);
          v23 = sub_23A521A28();
          v25 = v24;

          v35 = v17;
          v27 = v17[2];
          v26 = v17[3];
          if (v27 >= v26 >> 1)
          {
            sub_23A50B7B8(v26 > 1, v27 + 1, 1);
            v17 = v35;
          }
          ++v16;
          v17[2] = v27 + 1;
          v28 = &v17[3 * v27];
          v28[4] = v23;
          v28[5] = v25;
          v28[6] = v21;
          v2 = v18;
        }
        while (v19 != v16);
        swift_bridgeObjectRelease();
        v5 = v33;
        v13 = (os_unfair_lock_s *)v32[0];
        if (v17[2])
          goto LABEL_15;
        goto LABEL_18;
      }
    }
    else
    {
      v15 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v15)
        goto LABEL_6;
    }
    swift_bridgeObjectRelease();
    v17 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
    {
LABEL_15:
      __swift_instantiateConcreteTypeFromMangledName(&qword_25698AFA8);
      v29 = sub_23A521CF8();
LABEL_19:
      v35 = (_QWORD *)v29;
      sub_23A50C664(v17, 1, &v35);
      swift_bridgeObjectRelease();
      v30 = v35;
      v31 = &v5[OBJC_IVAR___DTTimerClient__timerMap];
      swift_beginAccess();
      *(_QWORD *)v31 = v30;
      swift_bridgeObjectRelease();
      os_unfair_lock_unlock(v13);
      swift_release();
      sub_23A507CA4(1, 0);

      return;
    }
LABEL_18:
    v29 = MEMORY[0x24BEE4B00];
    goto LABEL_19;
  }
}

void sub_23A50C5C0()
{
  sub_23A5079D4();
}

unint64_t sub_23A50C5E0()
{
  unint64_t result;

  result = qword_25698AF08;
  if (!qword_25698AF08)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTMonitorEvent, &type metadata for DTMonitorEvent);
    atomic_store(result, (unint64_t *)&qword_25698AF08);
  }
  return result;
}

uint64_t sub_23A50C624@<X0>(_QWORD *a1@<X8>)
{
  return sub_23A508BE0((SEL *)&selRef_mtAlarm, a1);
}

uint64_t sub_23A50C644@<X0>(_QWORD *a1@<X8>)
{
  return sub_23A508BE0((SEL *)&selRef_mtTimer, a1);
}

_QWORD *sub_23A50C664(_QWORD *result, char a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  void **i;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  id v32;
  char v33;
  unint64_t v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  char v40;
  _QWORD *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;

  v3 = result[2];
  if (v3)
  {
    v6 = result;
    v8 = result[4];
    v7 = result[5];
    v9 = (void *)result[6];
    v10 = (_QWORD *)*a3;
    swift_bridgeObjectRetain();
    v45 = v9;
    swift_bridgeObjectRetain();
    v12 = sub_23A4FF1A4(v8, v7);
    v13 = v10[2];
    v14 = (v11 & 1) == 0;
    v15 = v13 + v14;
    if (__OFADD__(v13, v14))
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v16 = v11;
    if (v10[3] < v15)
    {
      sub_23A50B4AC(v15, a2 & 1);
      v17 = sub_23A4FF1A4(v8, v7);
      if ((v16 & 1) != (v18 & 1))
      {
LABEL_28:
        result = (_QWORD *)sub_23A521E30();
        __break(1u);
        return result;
      }
      v12 = v17;
      v19 = (_QWORD *)*a3;
      if ((v16 & 1) == 0)
        goto LABEL_12;
LABEL_9:
      swift_bridgeObjectRelease();
      v20 = v19[7];

      *(_QWORD *)(v20 + 8 * v12) = v45;
      v21 = v3 - 1;
      if (v3 == 1)
        return (_QWORD *)swift_bridgeObjectRelease();
LABEL_16:
      for (i = (void **)(v6 + 9); ; i += 3)
      {
        v29 = (uint64_t)*(i - 2);
        v28 = (uint64_t)*(i - 1);
        v30 = *i;
        v31 = (_QWORD *)*a3;
        swift_bridgeObjectRetain();
        v32 = v30;
        v34 = sub_23A4FF1A4(v29, v28);
        v35 = v31[2];
        v36 = (v33 & 1) == 0;
        v37 = v35 + v36;
        if (__OFADD__(v35, v36))
          break;
        v38 = v33;
        if (v31[3] < v37)
        {
          sub_23A50B4AC(v37, 1);
          v39 = sub_23A4FF1A4(v29, v28);
          if ((v38 & 1) != (v40 & 1))
            goto LABEL_28;
          v34 = v39;
        }
        v41 = (_QWORD *)*a3;
        if ((v38 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v27 = v41[7];

          *(_QWORD *)(v27 + 8 * v34) = v32;
        }
        else
        {
          v41[(v34 >> 6) + 8] |= 1 << v34;
          v42 = (uint64_t *)(v41[6] + 16 * v34);
          *v42 = v29;
          v42[1] = v28;
          *(_QWORD *)(v41[7] + 8 * v34) = v32;
          v43 = v41[2];
          v24 = __OFADD__(v43, 1);
          v44 = v43 + 1;
          if (v24)
            goto LABEL_27;
          v41[2] = v44;
        }
        if (!--v21)
          return (_QWORD *)swift_bridgeObjectRelease();
      }
      goto LABEL_26;
    }
    if ((a2 & 1) != 0)
    {
      v19 = (_QWORD *)*a3;
      if ((v11 & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      sub_23A50B2FC();
      v19 = (_QWORD *)*a3;
      if ((v16 & 1) != 0)
        goto LABEL_9;
    }
LABEL_12:
    v19[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v19[6] + 16 * v12);
    *v22 = v8;
    v22[1] = v7;
    *(_QWORD *)(v19[7] + 8 * v12) = v45;
    v23 = v19[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
    {
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    v19[2] = v25;
    v21 = v3 - 1;
    if (v3 == 1)
      return (_QWORD *)swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  return result;
}

uint64_t sub_23A50CA14()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_23A50CA40()
{
  uint64_t v0;

  sub_23A508E6C(*(void (**)(unint64_t, _QWORD))(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_23A50CA68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_23A506E38(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_23A50CA90()
{
  unint64_t result;

  result = qword_25698AF20;
  if (!qword_25698AF20)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTShowResponse, &type metadata for DTShowResponse);
    atomic_store(result, (unint64_t *)&qword_25698AF20);
  }
  return result;
}

unint64_t sub_23A50CAD4()
{
  unint64_t result;

  result = qword_25698AF28;
  if (!qword_25698AF28)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTDiagnosticsRequest, &type metadata for DTDiagnosticsRequest);
    atomic_store(result, (unint64_t *)&qword_25698AF28);
  }
  return result;
}

unint64_t sub_23A50CB18()
{
  unint64_t result;

  result = qword_25698AF38;
  if (!qword_25698AF38)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTEchoResponse, &type metadata for DTEchoResponse);
    atomic_store(result, (unint64_t *)&qword_25698AF38);
  }
  return result;
}

uint64_t type metadata accessor for DTTimerClient(uint64_t a1)
{
  return sub_23A5067B8(a1, qword_25698C560);
}

void type metadata accessor for DTTimerClientStatusFlags(uint64_t a1)
{
  sub_23A50CBAC(a1, &qword_25698AF70);
}

void type metadata accessor for DTTimerClientEventType(uint64_t a1)
{
  sub_23A50CBAC(a1, &qword_25698AF78);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_23A50CBAC(a1, &qword_25698AF80);
}

void sub_23A50CBAC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23A50CBF0()
{
  return sub_23A50CC1C(&qword_25698AF88, (uint64_t (*)(uint64_t))type metadata accessor for DTTimerClientStatusFlags, (uint64_t)&unk_23A523054);
}

uint64_t sub_23A50CC1C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B850924](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A50CC5C()
{
  return sub_23A50CC1C(&qword_25698AF90, (uint64_t (*)(uint64_t))type metadata accessor for DTTimerClientStatusFlags, (uint64_t)&unk_23A523020);
}

uint64_t sub_23A50CC88()
{
  return sub_23A50CC1C(&qword_25698AF98, (uint64_t (*)(uint64_t))type metadata accessor for DTTimerClientStatusFlags, (uint64_t)&unk_23A523080);
}

uint64_t sub_23A50CCB4()
{
  return sub_23A50CC1C(&qword_25698AFA0, (uint64_t (*)(uint64_t))type metadata accessor for DTTimerClientStatusFlags, (uint64_t)&unk_23A5230BC);
}

uint64_t sub_23A50CCE0(uint64_t a1)
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

uint64_t sub_23A50CD18()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_23A50CD3C(uint64_t a1)
{
  uint64_t v1;

  sub_23A5098E8(a1, *(_QWORD *)(v1 + 16));
}

void sub_23A50CD44(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_23A509468(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_23A50CD4C@<X0>(_QWORD *a1@<X8>)
{
  return sub_23A5088B8(a1);
}

_QWORD *sub_23A50CD74@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;

  result = (*(_QWORD *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2)
    *a1 = v5;
  return result;
}

uint64_t sub_23A50CDB0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

id sub_23A50CDC4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(*(_QWORD *)(v1 + 16) + OBJC_IVAR___DTTimerClient__error);
  *a1 = v2;
  return v2;
}

uint64_t sub_23A50CDFC()
{
  swift_release();
  return swift_deallocObject();
}

void sub_23A50CE20(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(_QWORD, void *);
  void *v3;
  id v4;

  v2 = *(void (**)(_QWORD, void *))(v1 + 16);
  v3 = *(void **)a1;
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    v4 = v3;
    v2(0, v3);
    sub_23A50CF14(v3, 1);
  }
  else
  {
    v2(*(_QWORD *)a1, 0);
  }
}

unint64_t sub_23A50CE80()
{
  unint64_t result;

  result = qword_25698AFB8;
  if (!qword_25698AFB8)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTFetchTimersResponse, &type metadata for DTFetchTimersResponse);
    atomic_store(result, (unint64_t *)&qword_25698AFB8);
  }
  return result;
}

unint64_t sub_23A50CEC4()
{
  unint64_t result;

  result = qword_25698AFC8;
  if (!qword_25698AFC8)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTFetchStatusResponse, &type metadata for DTFetchStatusResponse);
    atomic_store(result, (unint64_t *)&qword_25698AFC8);
  }
  return result;
}

id sub_23A50CF08(id a1, char a2)
{
  if ((a2 & 1) != 0)
    return a1;
  else
    return (id)swift_bridgeObjectRetain();
}

void sub_23A50CF14(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_bridgeObjectRelease();
}

uint64_t sub_23A50CF20@<X0>(uint64_t *a1@<X8>)
{
  return sub_23A50CA68(a1);
}

uint64_t sub_23A50CF34@<X0>(_QWORD *a1@<X8>)
{
  return sub_23A50C644(a1);
}

uint64_t sub_23A50CF48@<X0>(_QWORD *a1@<X8>)
{
  return sub_23A50C624(a1);
}

uint64_t sub_23A50CFA0()
{
  MEMORY[0x23B850924](MEMORY[0x24BEE59B0]);
  return sub_23A521B24();
}

uint64_t sub_23A50CFE0()
{
  MEMORY[0x23B850924](MEMORY[0x24BEE59B0]);
  return sub_23A521B30();
}

unint64_t static DTConstants.appSupportDirectoryName.getter()
{
  return 0xD00000000000001BLL;
}

unint64_t static DTConstants.entitlementCoordinationAlarms.getter()
{
  return 0xD000000000000025;
}

unint64_t static DTConstants.entitlementCoordinationTimers.getter()
{
  return 0xD000000000000025;
}

unint64_t static DTConstants.entitlementMain.getter()
{
  return 0xD00000000000001BLL;
}

void *sub_23A50D098()
{
  return &unk_250B67648;
}

unint64_t static DTConstants.logSubsystem.getter()
{
  return 0xD00000000000001BLL;
}

unint64_t static DTConstants.transactionPrefix.getter()
{
  return 0xD00000000000001BLL;
}

unint64_t static DTConstants.prefsDomain.getter()
{
  return 0xD00000000000001BLL;
}

void *sub_23A50D0F8()
{
  return &unk_250B67658;
}

unint64_t static DTConstants.xpcServiceName.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t DTEndpoint.init(homeKitAccessoryID:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  if (a2)
    v3 = result;
  else
    v3 = 0;
  *a3 = v3;
  a3[1] = a2;
  return result;
}

uint64_t DTEndpoint.description.getter()
{
  uint64_t *v0;
  uint64_t v1;

  if (v0[1])
    v1 = *v0;
  else
    v1 = 0x6C61636F6CLL;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DTEndpoint._homeKitAccessoryID.getter()
{
  uint64_t *v0;
  uint64_t v1;

  if (v0[1])
    v1 = *v0;
  else
    v1 = 0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DTEndpoint.hash(into:)()
{
  uint64_t v0;

  if (!*(_QWORD *)(v0 + 8))
    return sub_23A521E60();
  sub_23A521E60();
  return sub_23A521A58();
}

uint64_t sub_23A50D214()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000012;
  else
    return 0x6C61636F6CLL;
}

uint64_t sub_23A50D250@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A517318(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A50D274()
{
  sub_23A513B08();
  return sub_23A521EA8();
}

uint64_t sub_23A50D29C()
{
  sub_23A513B08();
  return sub_23A521EB4();
}

uint64_t sub_23A50D2C4()
{
  return 1;
}

uint64_t sub_23A50D2D4()
{
  return 12383;
}

void sub_23A50D2E4(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23A50D2F0()
{
  sub_23A513B4C();
  return sub_23A521EA8();
}

uint64_t sub_23A50D318()
{
  sub_23A513B4C();
  return sub_23A521EB4();
}

uint64_t sub_23A50D340()
{
  return 0;
}

uint64_t sub_23A50D34C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_23A50D378()
{
  sub_23A513B90();
  return sub_23A521EA8();
}

uint64_t sub_23A50D3A0()
{
  sub_23A513B90();
  return sub_23A521EB4();
}

uint64_t DTEndpoint.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AFE0);
  v19 = *(_QWORD *)(v3 - 8);
  v20 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AFE8);
  v16 = *(_QWORD *)(v6 - 8);
  v17 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AFF0);
  v21 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v1[1];
  v18 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A513B08();
  sub_23A521E9C();
  if (v12)
  {
    v23 = 1;
    sub_23A513B4C();
    sub_23A521DA0();
    v13 = v20;
    sub_23A521DB8();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v13);
  }
  else
  {
    v22 = 0;
    sub_23A513B90();
    sub_23A521DA0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v17);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v11, v9);
}

uint64_t DTEndpoint.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_23A521E54();
  sub_23A521E60();
  if (v1)
    sub_23A521A58();
  return sub_23A521E6C();
}

uint64_t DTEndpoint.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  char *v34;
  _QWORD *v35;
  char v36;
  char v37;

  v33 = a2;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AFF8);
  v32 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B000);
  v4 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B008);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A513B08();
  v11 = v35;
  sub_23A521E90();
  if (v11)
    goto LABEL_9;
  v12 = v34;
  v29 = v8;
  v35 = a1;
  v13 = sub_23A521D94();
  v14 = v7;
  if (*(_QWORD *)(v13 + 16) != 1)
  {
    v19 = sub_23A521C98();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698B010);
    *v21 = &type metadata for DTEndpoint;
    sub_23A521D40();
    sub_23A521C8C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v14);
    a1 = v35;
LABEL_9:
    v22 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v22);
  }
  if ((*(_BYTE *)(v13 + 32) & 1) != 0)
  {
    v37 = 1;
    sub_23A513B4C();
    sub_23A521D34();
    v15 = v7;
    v16 = v30;
    v17 = sub_23A521D64();
    v18 = v29;
    v24 = v17;
    v26 = v25;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v12, v16);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v15);
  }
  else
  {
    v36 = 0;
    sub_23A513B90();
    sub_23A521D34();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v31);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v7);
    v24 = 0;
    v26 = 0;
  }
  v27 = v33;
  *v33 = v24;
  v27[1] = v26;
  v22 = (uint64_t)v35;
  return __swift_destroy_boxed_opaque_existential_1(v22);
}

uint64_t sub_23A50D9DC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return DTEndpoint.init(from:)(a1, a2);
}

uint64_t sub_23A50D9F0(_QWORD *a1)
{
  return DTEndpoint.encode(to:)(a1);
}

uint64_t sub_23A50DA04()
{
  uint64_t *v0;
  uint64_t v1;

  if (v0[1])
    v1 = *v0;
  else
    v1 = 0x6C61636F6CLL;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23A50DA4C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_23A521E54();
  sub_23A521E60();
  if (v1)
    sub_23A521A58();
  return sub_23A521E6C();
}

uint64_t sub_23A50DAB8()
{
  uint64_t v0;

  if (!*(_QWORD *)(v0 + 8))
    return sub_23A521E60();
  sub_23A521E60();
  return sub_23A521A58();
}

uint64_t sub_23A50DB1C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_23A521E54();
  sub_23A521E60();
  if (v1)
    sub_23A521A58();
  return sub_23A521E6C();
}

const char *DTFeatures.domain.getter()
{
  return "DistributedTimers";
}

const char *DTFeatures.feature.getter()
{
  _BYTE *v0;

  if (*v0)
    return "ReplaceCoordination";
  else
    return "AllowHH1";
}

BOOL static DTFeatures.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DTFeatures.hash(into:)()
{
  return sub_23A521E60();
}

uint64_t DTFeatures.hashValue.getter()
{
  sub_23A521E54();
  sub_23A521E60();
  return sub_23A521E6C();
}

const char *sub_23A50DC50()
{
  return "DistributedTimers";
}

const char *sub_23A50DC64()
{
  _BYTE *v0;

  if (*v0)
    return "ReplaceCoordination";
  else
    return "AllowHH1";
}

DistributedTimers::DTPrefKey_optional __swiftcall DTPrefKey.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  DistributedTimers::DTPrefKey_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23A521D28();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

void *static DTPrefKey.allCases.getter()
{
  return &unk_250B676B8;
}

uint64_t DTPrefKey.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x67694D64756F6C63;
  else
    return 0xD000000000000010;
}

uint64_t sub_23A50DD4C(char *a1, char *a2)
{
  return sub_23A50DD58(*a1, *a2);
}

uint64_t sub_23A50DD58(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x67694D64756F6C63;
  else
    v3 = 0xD000000000000010;
  if (v2)
    v4 = 0x800000023A5264E0;
  else
    v4 = 0xED00006465746172;
  if ((a2 & 1) != 0)
    v5 = 0x67694D64756F6C63;
  else
    v5 = 0xD000000000000010;
  if ((a2 & 1) != 0)
    v6 = 0xED00006465746172;
  else
    v6 = 0x800000023A5264E0;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_23A521E18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_23A50DE0C()
{
  sub_23A521E54();
  sub_23A521A58();
  swift_bridgeObjectRelease();
  return sub_23A521E6C();
}

uint64_t sub_23A50DE9C()
{
  sub_23A521A58();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A50DF08()
{
  sub_23A521E54();
  sub_23A521A58();
  swift_bridgeObjectRelease();
  return sub_23A521E6C();
}

DistributedTimers::DTPrefKey_optional sub_23A50DF94(Swift::String *a1)
{
  return DTPrefKey.init(rawValue:)(*a1);
}

void sub_23A50DFA0(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;

  v2 = 0xD000000000000010;
  if (*v1)
    v2 = 0x67694D64756F6C63;
  v3 = 0x800000023A5264E0;
  if (*v1)
    v3 = 0xED00006465746172;
  *a1 = v2;
  a1[1] = v3;
}

void sub_23A50DFF0(_QWORD *a1@<X8>)
{
  *a1 = &unk_250B676E0;
}

void DTRequest.description.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_23A50E03C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  _QWORD v5[13];

  strcpy((char *)v5, "addTimer: id=");
  sub_23A4FCC3C(v0, v1, v2, 0);
  v3 = objc_msgSend(v0, sel_identifier);
  sub_23A521A28();

  sub_23A521A70();
  swift_bridgeObjectRelease();
  sub_23A4FCCC0(v0, v1, v2, 0);
  return v5[0];
}

void sub_23A50E490()
{
  JUMPOUT(0x23A50E478);
}

void sub_23A50E50C()
{
  sub_23A521C68();
  swift_bridgeObjectRelease();
  DTMonitorEvent.description.getter();
  sub_23A521A70();
  swift_bridgeObjectRelease();
  JUMPOUT(0x23A50E478);
}

uint64_t DTRequest.monitorID.getter()
{
  uint64_t *v0;
  uint64_t result;
  int v2;

  result = *v0;
  v2 = 1 << *((_BYTE *)v0 + 24);
  if ((v2 & 0x33F) != 0 || (v2 & 0xC0) == 0)
    return 0;
  return result;
}

BOOL DTRequest.isMulticastable.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 24) < 5u;
}

uint64_t DTRequest.isSyncable.getter()
{
  uint64_t v0;

  return (*(unsigned __int8 *)(v0 + 24) < 5u) & (0x17u >> *(_BYTE *)(v0 + 24));
}

uint64_t DTRequest.isTargetable.getter()
{
  uint64_t v0;
  unsigned int v1;
  uint64_t result;

  v1 = *(unsigned __int8 *)(v0 + 24);
  if (v1 > 0xA)
    return 0;
  result = 1;
  if (((1 << v1) & 0xC3) == 0)
  {
    if (v1 != 10)
      return 0;
    if (*(_QWORD *)v0 != 1 || *(_OWORD *)(v0 + 8) != 0)
      return 0;
  }
  return result;
}

id DTRequest.setTargetAccessoryIfNeeded(defaultTargetID:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(void **)v2;
  v3 = *(_QWORD *)(v2 + 8);
  v5 = *(_QWORD *)(v2 + 16);
  v6 = *(unsigned __int8 *)(v2 + 24);
  if (a1)
    __asm { BR              X9 }
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v3;
  *(_QWORD *)(a2 + 16) = v5;
  *(_BYTE *)(a2 + 24) = v6;
  return sub_23A4FCC3C(v4, v3, v5, v6);
}

void sub_23A50E6D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  Swift::String v7;
  DTTimer *v8;
  uint64_t v9;
  uint64_t v10;

  v6 = v3;
  v7._countAndFlagsBits = v4;
  v7._object = v5;
  DTTimer.setTargetAccessoryIfNeeded(defaultTargetID:)(v8, v7);
  v10 = v9;
  sub_23A4FCCC0(v3, v2, v1, 0);
  *(_QWORD *)(v0 + 8) = 0;
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)v0 = v10;
  *(_BYTE *)(v0 + 24) = 0;
}

uint64_t sub_23A50E7F0(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23A50E824 + 4 * byte_23A5231DB[a1]))(0x72656D6954646461, 0xE800000000000000);
}

uint64_t sub_23A50E824()
{
  return 0x6954657461647075;
}

uint64_t sub_23A50E864()
{
  return 0x547373696D736964;
}

uint64_t sub_23A50E884()
{
  return 0x6174536863746566;
}

uint64_t sub_23A50E8A4()
{
  return 0x6D69546863746566;
}

uint64_t sub_23A50E8C8()
{
  return 1869112165;
}

uint64_t sub_23A50E8D8()
{
  return 0x53726F74696E6F6DLL;
}

unint64_t sub_23A50E908()
{
  return 0xD000000000000010;
}

uint64_t sub_23A50E924()
{
  return 0x45726F74696E6F6DLL;
}

uint64_t sub_23A50E944()
{
  return 0x74736F6E67616964;
}

uint64_t sub_23A50E964()
{
  sub_23A514014();
  return sub_23A521EA8();
}

uint64_t sub_23A50E98C()
{
  sub_23A514014();
  return sub_23A521EB4();
}

uint64_t sub_23A50E9B4()
{
  unsigned __int8 *v0;

  return sub_23A50E7F0(*v0);
}

uint64_t sub_23A50E9BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A5173FC(a1, a2);
  *a3 = result;
  return result;
}

void sub_23A50E9E0(_BYTE *a1@<X8>)
{
  *a1 = 13;
}

uint64_t sub_23A50E9EC()
{
  sub_23A513BD4();
  return sub_23A521EA8();
}

uint64_t sub_23A50EA14()
{
  sub_23A513BD4();
  return sub_23A521EB4();
}

uint64_t sub_23A50EA3C()
{
  sub_23A513C18();
  return sub_23A521EA8();
}

uint64_t sub_23A50EA64()
{
  sub_23A513C18();
  return sub_23A521EB4();
}

uint64_t sub_23A50EA8C()
{
  sub_23A513F04();
  return sub_23A521EA8();
}

uint64_t sub_23A50EAB4()
{
  sub_23A513F04();
  return sub_23A521EB4();
}

uint64_t sub_23A50EADC()
{
  sub_23A513E38();
  return sub_23A521EA8();
}

uint64_t sub_23A50EB04()
{
  sub_23A513E38();
  return sub_23A521EB4();
}

uint64_t sub_23A50EB2C()
{
  sub_23A513EC0();
  return sub_23A521EA8();
}

uint64_t sub_23A50EB54()
{
  sub_23A513EC0();
  return sub_23A521EB4();
}

uint64_t sub_23A50EB7C()
{
  sub_23A513E7C();
  return sub_23A521EA8();
}

uint64_t sub_23A50EBA4()
{
  sub_23A513E7C();
  return sub_23A521EB4();
}

uint64_t sub_23A50EBCC()
{
  sub_23A513CA0();
  return sub_23A521EA8();
}

uint64_t sub_23A50EBF4()
{
  sub_23A513CA0();
  return sub_23A521EB4();
}

uint64_t sub_23A50EC1C()
{
  sub_23A513D28();
  return sub_23A521EA8();
}

uint64_t sub_23A50EC44()
{
  sub_23A513D28();
  return sub_23A521EB4();
}

uint64_t sub_23A50EC6C()
{
  sub_23A513DF4();
  return sub_23A521EA8();
}

uint64_t sub_23A50EC94()
{
  sub_23A513DF4();
  return sub_23A521EB4();
}

uint64_t sub_23A50ECBC()
{
  sub_23A513D6C();
  return sub_23A521EA8();
}

uint64_t sub_23A50ECE4()
{
  sub_23A513D6C();
  return sub_23A521EB4();
}

uint64_t sub_23A50ED0C()
{
  sub_23A513F8C();
  return sub_23A521EA8();
}

uint64_t sub_23A50ED34()
{
  sub_23A513F8C();
  return sub_23A521EB4();
}

uint64_t sub_23A50ED5C()
{
  sub_23A513F48();
  return sub_23A521EA8();
}

uint64_t sub_23A50ED84()
{
  sub_23A513F48();
  return sub_23A521EB4();
}

uint64_t sub_23A50EDAC()
{
  sub_23A513FD0();
  return sub_23A521EA8();
}

uint64_t sub_23A50EDD4()
{
  sub_23A513FD0();
  return sub_23A521EB4();
}

void DTRequest.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
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
  _QWORD v23[2];
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B018);
  v55 = *(_QWORD *)(v3 - 8);
  v56 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v54 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B020);
  v52 = *(_QWORD *)(v5 - 8);
  v53 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v51 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B028);
  v26 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v25 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B030);
  v49 = *(_QWORD *)(v8 - 8);
  v50 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v48 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B038);
  v46 = *(_QWORD *)(v10 - 8);
  v47 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v45 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B040);
  v43 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v42 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B048);
  v23[1] = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v23[0] = (char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B050);
  v29 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v28 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B058);
  v40 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v39 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B060);
  v37 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v36 = (char *)v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B068);
  v34 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v33 = (char *)v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B070);
  v31 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B078);
  MEMORY[0x24BDAC7A8](v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B080);
  v20 = *(_QWORD *)(v19 - 8);
  v60 = v19;
  v61 = v20;
  MEMORY[0x24BDAC7A8](v19);
  v21 = *v1;
  v58 = v1[1];
  v59 = v21;
  v57 = v1[2];
  v22 = *((unsigned __int8 *)v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A513BD4();
  sub_23A521E9C();
  __asm { BR              X9 }
}

void sub_23A50F27C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;

  *(_BYTE *)(v4 - 112) = 0;
  sub_23A514014();
  v5 = *(void **)(v4 - 136);
  v6 = v5;
  v7 = *(_QWORD *)(v4 - 128);
  sub_23A521DA0();
  *(_QWORD *)(v4 - 112) = v6;
  type metadata accessor for DTTimer(0);
  sub_23A50CC1C(&qword_25698B0A0, type metadata accessor for DTTimer, (uint64_t)&protocol conformance descriptor for DTTimer);
  sub_23A521DD0();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 120) + 8))(v3, v7);
  sub_23A4FCCC0(v5, *(_QWORD *)(v4 - 144), *(_QWORD *)(v4 - 152), 0);
}

void sub_23A50F93C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v1 - 136);
  if (*(_QWORD *)(v1 - 152) | *(_QWORD *)(v1 - 144) | v2)
  {
    v3 = *(_QWORD *)(v1 - 128);
    if (v2 == 1 && *(_OWORD *)(v1 - 152) == 0)
    {
      *(_BYTE *)(v1 - 112) = 6;
      sub_23A513E7C();
      v4 = *(_QWORD *)(v1 - 432);
      sub_23A521DA0();
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 424) + 8))(v4, *(_QWORD *)(v1 - 416));
    }
    else
    {
      *(_BYTE *)(v1 - 112) = 10;
      sub_23A513D28();
      v6 = *(_QWORD *)(v1 - 408);
      sub_23A521DA0();
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 400) + 8))(v6, *(_QWORD *)(v1 - 392));
    }
  }
  else
  {
    *(_BYTE *)(v1 - 112) = 5;
    sub_23A513EC0();
    v5 = *(_QWORD *)(v1 - 384);
    v3 = *(_QWORD *)(v1 - 128);
    sub_23A521DA0();
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 376) + 8))(v5, *(_QWORD *)(v1 - 368));
  }
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 120) + 8))(v0, v3);
  JUMPOUT(0x23A50F918);
}

uint64_t DTRequest.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD v31[15];
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
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  char *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;

  v52 = a2;
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B0A8);
  v31[13] = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v58 = (char *)v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B0B0);
  v31[12] = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v57 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B0B8);
  v42 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v51 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B0C0);
  v31[11] = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v56 = (char *)v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B0C8);
  v31[9] = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v55 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B0D0);
  v31[10] = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v54 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B0D8);
  v36 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v49 = (char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B0E0);
  v33 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v47 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B0E8);
  v31[8] = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v50 = (char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B0F0);
  v31[7] = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v48 = (char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B0F8);
  v31[6] = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v46 = (char *)v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B100);
  v31[14] = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v15 = (char *)v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B108);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B110);
  v20 = *(_QWORD *)(v59 - 8);
  MEMORY[0x24BDAC7A8](v59);
  v22 = (char *)v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = a1[3];
  v60 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v23);
  sub_23A513BD4();
  v24 = v61;
  sub_23A521E90();
  if (!v24)
  {
    v31[3] = v19;
    v31[1] = v17;
    v31[2] = v16;
    v31[4] = v15;
    v31[5] = 0;
    v61 = v20;
    v25 = sub_23A521D94();
    if (*(_QWORD *)(v25 + 16) == 1)
      __asm { BR              X10 }
    v26 = sub_23A521C98();
    swift_allocError();
    v28 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698B010);
    *v28 = &type metadata for DTRequest;
    v29 = v59;
    sub_23A521D40();
    sub_23A521C8C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v28, *MEMORY[0x24BEE26D0], v26);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v61 + 8))(v22, v29);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
}

uint64_t sub_23A510B28@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return DTRequest.init(from:)(a1, a2);
}

void sub_23A510B3C(_QWORD *a1)
{
  DTRequest.encode(to:)(a1);
}

uint64_t DTRequestContext.endpoint.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t DTRequestContext.targetIDs.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*DTRequestContext.targetIDs.modify())()
{
  return nullsub_1;
}

__n128 DTRequestContext.init(endpoint:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  a2[1].n128_u64[0] = 0;
  return result;
}

uint64_t DTRequestContext.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain_n();
  sub_23A521A70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = 0x746E696F70646E65;
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698B138);
    sub_23A5147B4(&qword_25698B140, &qword_25698B138, MEMORY[0x24BEE12B0]);
    sub_23A521A10();
    sub_23A521A70();
    swift_bridgeObjectRelease();
    sub_23A521A70();
    sub_23A521A70();
    swift_bridgeObjectRelease();
    return 0x746E696F70646E65;
  }
  return result;
}

uint64_t sub_23A510CF8()
{
  _BYTE *v0;

  if (*v0)
    return 0x4449746567726174;
  else
    return 0x746E696F70646E65;
}

uint64_t sub_23A510D38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A5179E0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A510D5C()
{
  sub_23A514124();
  return sub_23A521EA8();
}

uint64_t sub_23A510D84()
{
  sub_23A514124();
  return sub_23A521EB4();
}

uint64_t DTRequestContext.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];
  uint64_t v12;
  uint64_t v13;
  char v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B148);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  v11[0] = v1[2];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A514124();
  sub_23A521E9C();
  v12 = v8;
  v13 = v7;
  v14 = 0;
  sub_23A514168();
  v9 = v11[1];
  sub_23A521DD0();
  if (!v9)
  {
    v12 = v11[0];
    v14 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698B138);
    sub_23A5141F0(&qword_25698B158, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_23A521DAC();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t DTRequestContext.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];
  char v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B160);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A514124();
  sub_23A521E90();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v14 = 0;
    sub_23A5141AC();
    sub_23A521D7C();
    v11 = v13[0];
    v10 = v13[1];
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698B138);
    v14 = 1;
    sub_23A5141F0(&qword_25698B170, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    swift_bridgeObjectRetain();
    sub_23A521D58();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v12 = v13[0];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *a2 = v11;
    a2[1] = v10;
    a2[2] = v12;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A511118@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return DTRequestContext.init(from:)(a1, a2);
}

uint64_t sub_23A51112C(_QWORD *a1)
{
  return DTRequestContext.encode(to:)(a1);
}

uint64_t DTDiagnosticsRequest.description.getter()
{
  unsigned __int8 *v0;
  int v1;
  unint64_t v3;

  v1 = *v0 >> 6;
  if (!v1)
  {
    sub_23A521C68();
    swift_bridgeObjectRelease();
    v3 = 0xD000000000000016;
    goto LABEL_5;
  }
  if (v1 == 1)
  {
    sub_23A521C68();
    swift_bridgeObjectRelease();
    v3 = 0xD000000000000013;
LABEL_5:
    sub_23A521A70();
    swift_bridgeObjectRelease();
    return v3;
  }
  return 2003789939;
}

uint64_t sub_23A511270()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x7267694D636E7973;
  if (*v0 != 1)
    v1 = 2003789939;
  if (*v0)
    return v1;
  else
    return 0x666E6F43636E7973;
}

uint64_t sub_23A5112D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A517ADC(a1, a2);
  *a3 = result;
  return result;
}

void sub_23A5112FC(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23A511308()
{
  sub_23A514250();
  return sub_23A521EA8();
}

uint64_t sub_23A511330()
{
  sub_23A514250();
  return sub_23A521EB4();
}

uint64_t sub_23A511358()
{
  sub_23A514294();
  return sub_23A521EA8();
}

uint64_t sub_23A511380()
{
  sub_23A514294();
  return sub_23A521EB4();
}

uint64_t sub_23A5113A8()
{
  sub_23A51431C();
  return sub_23A521EA8();
}

uint64_t sub_23A5113D0()
{
  sub_23A51431C();
  return sub_23A521EB4();
}

uint64_t sub_23A5113F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23A521E18();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23A511474()
{
  sub_23A5142D8();
  return sub_23A521EA8();
}

uint64_t sub_23A51149C()
{
  sub_23A5142D8();
  return sub_23A521EB4();
}

uint64_t DTDiagnosticsRequest.encode(to:)(_QWORD *a1)
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
  unsigned int v15;
  uint64_t v16;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  char v28;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B178);
  v23 = *(_QWORD *)(v4 - 8);
  v24 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v20 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B180);
  v21 = *(_QWORD *)(v6 - 8);
  v22 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B188);
  v19 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B190);
  v25 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A514250();
  sub_23A521E9C();
  if (!(v15 >> 6))
  {
    v26 = 0;
    sub_23A51431C();
    sub_23A521DA0();
    sub_23A521DC4();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v14, v12);
  }
  if (v15 >> 6 == 1)
  {
    v27 = 1;
    sub_23A5142D8();
    sub_23A521DA0();
    v16 = v22;
    sub_23A521DC4();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v16);
    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v14, v12);
  }
  v28 = 2;
  sub_23A514294();
  v18 = v20;
  sub_23A521DA0();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v18, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v14, v12);
}

uint64_t DTDiagnosticsRequest.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  _BYTE *v26;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  char *v39;
  char *v40;
  _QWORD *v41;
  uint64_t v42;
  char v43;
  char v44;
  char v45;

  v38 = a2;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B198);
  v34 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v40 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B1A0);
  v37 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v39 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B1A8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B1B0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[3];
  v41 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_23A514250();
  v14 = v42;
  sub_23A521E90();
  if (v14)
    goto LABEL_9;
  v33 = v6;
  v16 = v39;
  v15 = v40;
  v42 = v10;
  v17 = sub_23A521D94();
  if (*(_QWORD *)(v17 + 16) != 1)
  {
    v20 = sub_23A521C98();
    swift_allocError();
    v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698B010);
    *v22 = &type metadata for DTDiagnosticsRequest;
    sub_23A521D40();
    sub_23A521C8C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v22, *MEMORY[0x24BEE26D0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v12, v9);
LABEL_9:
    v31 = (uint64_t)v41;
    return __swift_destroy_boxed_opaque_existential_1(v31);
  }
  v18 = v12;
  if (*(_BYTE *)(v17 + 32))
  {
    if (*(_BYTE *)(v17 + 32) == 1)
    {
      v44 = 1;
      sub_23A5142D8();
      v19 = v12;
      sub_23A521D34();
      v28 = v9;
      v29 = v35;
      v30 = sub_23A521D70();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v16, v29);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v19, v28);
      v31 = (uint64_t)v41;
      *v38 = v30 & 1 | 0x40;
    }
    else
    {
      v45 = 2;
      sub_23A514294();
      sub_23A521D34();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v15, v36);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v12, v9);
      v31 = (uint64_t)v41;
      *v38 = 0x80;
    }
  }
  else
  {
    v43 = 0;
    sub_23A51431C();
    v23 = v8;
    v24 = v9;
    v25 = v18;
    sub_23A521D34();
    v26 = v38;
    v32 = sub_23A521D70();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v23, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v25, v24);
    v31 = (uint64_t)v41;
    *v26 = v32 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1(v31);
}

uint64_t sub_23A511C40@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return DTDiagnosticsRequest.init(from:)(a1, a2);
}

uint64_t sub_23A511C54(_QWORD *a1)
{
  return DTDiagnosticsRequest.encode(to:)(a1);
}

uint64_t DTMonitorContext.clientID.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t DTMonitorContext.init(clientID:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t DTMonitorContext.description.getter()
{
  sub_23A521DE8();
  sub_23A521A70();
  swift_bridgeObjectRelease();
  return 0x4449746E65696C63;
}

uint64_t sub_23A511CF0()
{
  return 0x4449746E65696C63;
}

uint64_t sub_23A511D08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x4449746E65696C63 && a2 == 0xE800000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23A521E18();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23A511D9C()
{
  sub_23A514360();
  return sub_23A521EA8();
}

uint64_t sub_23A511DC4()
{
  sub_23A514360();
  return sub_23A521EB4();
}

uint64_t DTMonitorContext.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B1B8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A514360();
  sub_23A521E9C();
  sub_23A521DDC();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t DTMonitorContext.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B1C0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A514360();
  sub_23A521E90();
  if (!v2)
  {
    v9 = sub_23A521D88();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23A511FD8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return DTMonitorContext.init(from:)(a1, a2);
}

uint64_t sub_23A511FEC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B1B8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A514360();
  sub_23A521E9C();
  sub_23A521DDC();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_23A5120D4()
{
  sub_23A521DE8();
  sub_23A521A70();
  swift_bridgeObjectRelease();
  return 0x4449746E65696C63;
}

uint64_t DTMonitorEvent.clientID.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t DTMonitorEvent.eventType.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t DTMonitorEvent.timers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DTMonitorEvent.init(clientID:eventType:timers:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t DTMonitorEvent.description.getter()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_23A521C68();
  swift_bridgeObjectRelease();
  sub_23A521DE8();
  sub_23A521A70();
  swift_bridgeObjectRelease();
  sub_23A521A70();
  type metadata accessor for DTTimerClientEventType(0);
  sub_23A50CC1C(&qword_25698B1C8, (uint64_t (*)(uint64_t))type metadata accessor for DTTimerClientEventType, (uint64_t)&protocol conformance descriptor for DTTimerClientEventType);
  sub_23A521DE8();
  sub_23A521A70();
  swift_bridgeObjectRelease();
  sub_23A521A70();
  if (v1)
  {
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_23A521CD4();
      swift_bridgeObjectRelease();
    }
    sub_23A5143A4();
    sub_23A521C08();
  }
  sub_23A521A70();
  swift_bridgeObjectRelease();
  return 0x4449746E65696C63;
}

uint64_t sub_23A512318()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x707954746E657665;
  if (*v0 != 1)
    v1 = 0x7372656D6974;
  if (*v0)
    return v1;
  else
    return 0x4449746E65696C63;
}

uint64_t sub_23A512374@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A517C5C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A512398()
{
  sub_23A5143E8();
  return sub_23A521EA8();
}

uint64_t sub_23A5123C0()
{
  sub_23A5143E8();
  return sub_23A521EB4();
}

uint64_t DTMonitorEvent.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B1D8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 8);
  v12 = *(_QWORD *)(v1 + 16);
  v13 = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A5143E8();
  sub_23A521E9C();
  LOBYTE(v15) = 0;
  sub_23A521DDC();
  if (!v2)
  {
    v9 = v12;
    v15 = v13;
    v14 = 1;
    type metadata accessor for DTTimerClientEventType(0);
    sub_23A50CC1C(&qword_25698B1E0, (uint64_t (*)(uint64_t))type metadata accessor for DTTimerClientEventType, (uint64_t)&protocol conformance descriptor for DTTimerClientEventType);
    sub_23A521DD0();
    v15 = v9;
    v14 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698B1E8);
    sub_23A51442C(&qword_25698B1F0, &qword_25698B0A0, (uint64_t)&protocol conformance descriptor for DTTimer, MEMORY[0x24BEE12A0]);
    sub_23A521DAC();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t DTMonitorEvent.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B1F8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A5143E8();
  sub_23A521E90();
  if (!v2)
  {
    LOBYTE(v15) = 0;
    v9 = sub_23A521D88();
    type metadata accessor for DTTimerClientEventType(0);
    v14 = 1;
    sub_23A50CC1C(&qword_25698B200, (uint64_t (*)(uint64_t))type metadata accessor for DTTimerClientEventType, (uint64_t)&protocol conformance descriptor for DTTimerClientEventType);
    sub_23A521D7C();
    v11 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698B1E8);
    v14 = 2;
    sub_23A51442C(&qword_25698B208, &qword_25698B130, (uint64_t)&protocol conformance descriptor for DTTimer, MEMORY[0x24BEE12D0]);
    sub_23A521D58();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v12 = v15;
    *a2 = v9;
    a2[1] = v11;
    a2[2] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23A5127A0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return DTMonitorEvent.init(from:)(a1, a2);
}

uint64_t sub_23A5127B4(_QWORD *a1)
{
  return DTMonitorEvent.encode(to:)(a1);
}

uint64_t DTAckResponse.description.getter()
{
  return 7037793;
}

uint64_t sub_23A5127E0()
{
  sub_23A5144B0();
  return sub_23A521EA8();
}

uint64_t sub_23A512808()
{
  sub_23A5144B0();
  return sub_23A521EB4();
}

uint64_t DTAckResponse.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B210);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A5144B0();
  sub_23A521E9C();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t DTAckResponse.init(from:)(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_23A512918(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_23A51293C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B210);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A5144B0();
  sub_23A521E9C();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_23A512A00()
{
  return 7037793;
}

uint64_t DTEchoResponse.message.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

DistributedTimers::DTEchoResponse __swiftcall DTEchoResponse.init(message:)(DistributedTimers::DTEchoResponse message)
{
  DistributedTimers::DTEchoResponse *v1;

  *v1 = message;
  return message;
}

uint64_t DTEchoResponse.description.getter()
{
  return 1869112165;
}

uint64_t sub_23A512A54()
{
  return 0x6567617373656DLL;
}

uint64_t sub_23A512A6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6567617373656DLL && a2 == 0xE700000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23A521E18();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23A512B00()
{
  sub_23A5144F4();
  return sub_23A521EA8();
}

uint64_t sub_23A512B28()
{
  sub_23A5144F4();
  return sub_23A521EB4();
}

uint64_t DTEchoResponse.encode(to:)(_QWORD *a1)
{
  return sub_23A513710(a1, &qword_25698B218, (void (*)(void))sub_23A5144F4);
}

uint64_t DTEchoResponse.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23A513834(a1, &qword_25698B220, (void (*)(void))sub_23A5144F4, a2);
}

uint64_t sub_23A512BA8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return DTEchoResponse.init(from:)(a1, a2);
}

uint64_t sub_23A512BBC(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_23A51399C(a1, a2, a3, &qword_25698B218, (void (*)(void))sub_23A5144F4);
}

uint64_t sub_23A512BE8()
{
  return 1869112165;
}

uint64_t DTFetchStatusResponse.statusFlags.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

DistributedTimers::DTFetchStatusResponse __swiftcall DTFetchStatusResponse.init(statusFlags:)(DistributedTimers::DTFetchStatusResponse statusFlags)
{
  DistributedTimers::DTFetchStatusResponse *v1;

  v1->statusFlags.rawValue = statusFlags.statusFlags.rawValue;
  return statusFlags;
}

uint64_t DTFetchStatusResponse.description.getter()
{
  return 0x6174536863746566;
}

uint64_t sub_23A512C28()
{
  return 0x6C46737574617473;
}

uint64_t sub_23A512C48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6C46737574617473 && a2 == 0xEB00000000736761)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23A521E18();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23A512CF4()
{
  sub_23A514538();
  return sub_23A521EA8();
}

uint64_t sub_23A512D1C()
{
  sub_23A514538();
  return sub_23A521EB4();
}

uint64_t DTFetchStatusResponse.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B228);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A514538();
  sub_23A521E9C();
  v9[1] = v7;
  type metadata accessor for DTTimerClientStatusFlags(0);
  sub_23A50CC1C(&qword_25698B230, (uint64_t (*)(uint64_t))type metadata accessor for DTTimerClientStatusFlags, (uint64_t)&protocol conformance descriptor for DTTimerClientStatusFlags);
  sub_23A521DD0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t DTFetchStatusResponse.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[2];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B238);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A514538();
  sub_23A521E90();
  if (!v2)
  {
    type metadata accessor for DTTimerClientStatusFlags(0);
    sub_23A50CC1C(&qword_25698B240, (uint64_t (*)(uint64_t))type metadata accessor for DTTimerClientStatusFlags, (uint64_t)&protocol conformance descriptor for DTTimerClientStatusFlags);
    sub_23A521D7C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23A512F9C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return DTFetchStatusResponse.init(from:)(a1, a2);
}

uint64_t sub_23A512FB0(_QWORD *a1)
{
  return DTFetchStatusResponse.encode(to:)(a1);
}

uint64_t sub_23A512FC4()
{
  return 0x6174536863746566;
}

uint64_t DTFetchTimersResponse.timers.getter()
{
  return swift_bridgeObjectRetain();
}

DistributedTimers::DTFetchTimersResponse __swiftcall DTFetchTimersResponse.init(timers:)(DistributedTimers::DTFetchTimersResponse timers)
{
  DistributedTimers::DTFetchTimersResponse *v1;

  v1->timers._rawValue = timers.timers._rawValue;
  return timers;
}

uint64_t DTFetchTimersResponse.description.getter()
{
  return 0x6D69546863746566;
}

uint64_t sub_23A513014()
{
  return sub_23A521E60();
}

uint64_t sub_23A513038()
{
  return 0x7372656D6974;
}

uint64_t sub_23A513050()
{
  sub_23A51457C();
  return sub_23A521EA8();
}

uint64_t sub_23A513078()
{
  sub_23A51457C();
  return sub_23A521EB4();
}

uint64_t DTFetchTimersResponse.encode(to:)(_QWORD *a1)
{
  return sub_23A513268(a1, &qword_25698B248, (void (*)(void))sub_23A51457C);
}

uint64_t DTFetchTimersResponse.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_23A5133C8(a1, &qword_25698B250, (void (*)(void))sub_23A51457C, a2);
}

uint64_t sub_23A5130F8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return DTFetchTimersResponse.init(from:)(a1, a2);
}

uint64_t sub_23A51310C(_QWORD *a1)
{
  return DTFetchTimersResponse.encode(to:)(a1);
}

uint64_t sub_23A513120()
{
  return 0x6D69546863746566;
}

uint64_t DTMonitorStartResponse.description.getter()
{
  return 0x53726F74696E6F6DLL;
}

uint64_t sub_23A513160@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x7372656D6974 && a2 == 0xE600000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23A521E18();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23A5131EC()
{
  sub_23A5145C0();
  return sub_23A521EA8();
}

uint64_t sub_23A513214()
{
  sub_23A5145C0();
  return sub_23A521EB4();
}

uint64_t DTMonitorStartResponse.encode(to:)(_QWORD *a1)
{
  return sub_23A513268(a1, &qword_25698B258, (void (*)(void))sub_23A5145C0);
}

uint64_t sub_23A513268(_QWORD *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[4];

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v11[0] = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v3;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_23A521E9C();
  v11[3] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698B1E8);
  sub_23A51442C(&qword_25698B1F0, &qword_25698B0A0, (uint64_t)&protocol conformance descriptor for DTTimer, MEMORY[0x24BEE12A0]);
  sub_23A521DD0();
  return (*(uint64_t (**)(char *, uint64_t))(v11[0] + 8))(v8, v6);
}

uint64_t DTMonitorStartResponse.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_23A5133C8(a1, &qword_25698B260, (void (*)(void))sub_23A5145C0, a2);
}

uint64_t sub_23A5133C8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, void (*a3)(void)@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v12 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v13 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_23A521E90();
  if (!v4)
  {
    v10 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698B1E8);
    sub_23A51442C(&qword_25698B208, &qword_25698B130, (uint64_t)&protocol conformance descriptor for DTTimer, MEMORY[0x24BEE12D0]);
    sub_23A521D7C();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v9, v7);
    *v10 = v14;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23A513520@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return DTMonitorStartResponse.init(from:)(a1, a2);
}

uint64_t sub_23A513534(_QWORD *a1)
{
  return DTMonitorStartResponse.encode(to:)(a1);
}

uint64_t sub_23A513548()
{
  return 0x53726F74696E6F6DLL;
}

uint64_t DTShowResponse.description.getter()
{
  return 2003789939;
}

uint64_t sub_23A513578()
{
  sub_23A521E54();
  sub_23A521E60();
  return sub_23A521E6C();
}

uint64_t sub_23A5135B8()
{
  sub_23A521E54();
  sub_23A521E60();
  return sub_23A521E6C();
}

uint64_t sub_23A5135F4()
{
  return 0x74757074756FLL;
}

uint64_t sub_23A513608@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x74757074756FLL && a2 == 0xE600000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23A521E18();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23A513694()
{
  sub_23A514604();
  return sub_23A521EA8();
}

uint64_t sub_23A5136BC()
{
  sub_23A514604();
  return sub_23A521EB4();
}

uint64_t DTShowResponse.encode(to:)(_QWORD *a1)
{
  return sub_23A513710(a1, &qword_25698B268, (void (*)(void))sub_23A514604);
}

uint64_t sub_23A513710(_QWORD *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  void (*v11)(void);

  v11 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v11();
  sub_23A521E9C();
  sub_23A521DB8();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t DTShowResponse.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23A513834(a1, &qword_25698B270, (void (*)(void))sub_23A514604, a2);
}

uint64_t sub_23A513834@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, void (*a3)(void)@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;

  v17 = a4;
  v18 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_23A521E90();
  if (!v4)
  {
    v10 = v17;
    v11 = v18;
    v12 = sub_23A521D64();
    v14 = v13;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v11);
    *v10 = v12;
    v10[1] = v14;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23A51395C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return DTShowResponse.init(from:)(a1, a2);
}

uint64_t sub_23A513970(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_23A51399C(a1, a2, a3, &qword_25698B268, (void (*)(void))sub_23A514604);
}

uint64_t sub_23A51399C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(void))
{
  uint64_t *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  void (*v13)(void);

  v13 = a5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v13();
  sub_23A521E9C();
  sub_23A521DB8();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_23A513A94()
{
  return 2003789939;
}

uint64_t _s17DistributedTimers10DTEndpointO2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1[1];
  v4 = a2[1];
  if (v3)
  {
    if (v4)
    {
      if (*a1 != *a2 || v3 != v4)
        return sub_23A521E18();
      return 1;
    }
    return 0;
  }
  if (v4)
    return 0;
  swift_bridgeObjectRelease_n();
  return 1;
}

unint64_t sub_23A513B08()
{
  unint64_t result;

  result = qword_25698C870;
  if (!qword_25698C870)
  {
    result = MEMORY[0x23B850924](&unk_23A525B20, &type metadata for DTEndpoint.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C870);
  }
  return result;
}

unint64_t sub_23A513B4C()
{
  unint64_t result;

  result = qword_25698C878;
  if (!qword_25698C878)
  {
    result = MEMORY[0x23B850924](&unk_23A525AD0, &type metadata for DTEndpoint.HomeKitAccessoryIDCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C878);
  }
  return result;
}

unint64_t sub_23A513B90()
{
  unint64_t result;

  result = qword_25698C880;
  if (!qword_25698C880)
  {
    result = MEMORY[0x23B850924](&unk_23A525A80, &type metadata for DTEndpoint.LocalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C880);
  }
  return result;
}

unint64_t sub_23A513BD4()
{
  unint64_t result;

  result = qword_25698C888;
  if (!qword_25698C888)
  {
    result = MEMORY[0x23B850924](&unk_23A525A30, &type metadata for DTRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C888);
  }
  return result;
}

unint64_t sub_23A513C18()
{
  unint64_t result;

  result = qword_25698C890;
  if (!qword_25698C890)
  {
    result = MEMORY[0x23B850924](&unk_23A5259E0, &type metadata for DTRequest.DiagnosticsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C890);
  }
  return result;
}

unint64_t sub_23A513C5C()
{
  unint64_t result;

  result = qword_25698B088;
  if (!qword_25698B088)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTDiagnosticsRequest, &type metadata for DTDiagnosticsRequest);
    atomic_store(result, (unint64_t *)&qword_25698B088);
  }
  return result;
}

unint64_t sub_23A513CA0()
{
  unint64_t result;

  result = qword_25698C898;
  if (!qword_25698C898)
  {
    result = MEMORY[0x23B850924](&unk_23A525990, &type metadata for DTRequest.MonitorEventCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C898);
  }
  return result;
}

unint64_t sub_23A513CE4()
{
  unint64_t result;

  result = qword_25698B090;
  if (!qword_25698B090)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTMonitorEvent, &type metadata for DTMonitorEvent);
    atomic_store(result, (unint64_t *)&qword_25698B090);
  }
  return result;
}

unint64_t sub_23A513D28()
{
  unint64_t result;

  result = qword_25698C8A0;
  if (!qword_25698C8A0)
  {
    result = MEMORY[0x23B850924](&unk_23A525940, &type metadata for DTRequest.MonitorKeepAliveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C8A0);
  }
  return result;
}

unint64_t sub_23A513D6C()
{
  unint64_t result;

  result = qword_25698C8A8;
  if (!qword_25698C8A8)
  {
    result = MEMORY[0x23B850924](&unk_23A5258F0, &type metadata for DTRequest.MonitorStopCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C8A8);
  }
  return result;
}

unint64_t sub_23A513DB0()
{
  unint64_t result;

  result = qword_25698B098;
  if (!qword_25698B098)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTMonitorContext, &type metadata for DTMonitorContext);
    atomic_store(result, (unint64_t *)&qword_25698B098);
  }
  return result;
}

unint64_t sub_23A513DF4()
{
  unint64_t result;

  result = qword_25698C8B0;
  if (!qword_25698C8B0)
  {
    result = MEMORY[0x23B850924](&unk_23A5258A0, &type metadata for DTRequest.MonitorStartCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C8B0);
  }
  return result;
}

unint64_t sub_23A513E38()
{
  unint64_t result;

  result = qword_25698C8B8;
  if (!qword_25698C8B8)
  {
    result = MEMORY[0x23B850924](&unk_23A525850, &type metadata for DTRequest.EchoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C8B8);
  }
  return result;
}

unint64_t sub_23A513E7C()
{
  unint64_t result;

  result = qword_25698C8C0;
  if (!qword_25698C8C0)
  {
    result = MEMORY[0x23B850924](&unk_23A525800, &type metadata for DTRequest.FetchTimersCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C8C0);
  }
  return result;
}

unint64_t sub_23A513EC0()
{
  unint64_t result;

  result = qword_25698C8C8;
  if (!qword_25698C8C8)
  {
    result = MEMORY[0x23B850924](&unk_23A5257B0, &type metadata for DTRequest.FetchStatusCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C8C8);
  }
  return result;
}

unint64_t sub_23A513F04()
{
  unint64_t result;

  result = qword_25698C8D0;
  if (!qword_25698C8D0)
  {
    result = MEMORY[0x23B850924](&unk_23A525760, &type metadata for DTRequest.DismissTimerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C8D0);
  }
  return result;
}

unint64_t sub_23A513F48()
{
  unint64_t result;

  result = qword_25698C8D8;
  if (!qword_25698C8D8)
  {
    result = MEMORY[0x23B850924](&unk_23A525710, &type metadata for DTRequest.SnoozeTimerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C8D8);
  }
  return result;
}

unint64_t sub_23A513F8C()
{
  unint64_t result;

  result = qword_25698C8E0;
  if (!qword_25698C8E0)
  {
    result = MEMORY[0x23B850924](&unk_23A5256C0, &type metadata for DTRequest.RemoveTimerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C8E0);
  }
  return result;
}

unint64_t sub_23A513FD0()
{
  unint64_t result;

  result = qword_25698C8E8;
  if (!qword_25698C8E8)
  {
    result = MEMORY[0x23B850924](&unk_23A525670, &type metadata for DTRequest.UpdateTimerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C8E8);
  }
  return result;
}

unint64_t sub_23A514014()
{
  unint64_t result;

  result = qword_25698C8F0;
  if (!qword_25698C8F0)
  {
    result = MEMORY[0x23B850924](&unk_23A525620, &type metadata for DTRequest.AddTimerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C8F0);
  }
  return result;
}

unint64_t sub_23A514058()
{
  unint64_t result;

  result = qword_25698B118;
  if (!qword_25698B118)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTDiagnosticsRequest, &type metadata for DTDiagnosticsRequest);
    atomic_store(result, (unint64_t *)&qword_25698B118);
  }
  return result;
}

unint64_t sub_23A51409C()
{
  unint64_t result;

  result = qword_25698B120;
  if (!qword_25698B120)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTMonitorEvent, &type metadata for DTMonitorEvent);
    atomic_store(result, (unint64_t *)&qword_25698B120);
  }
  return result;
}

unint64_t sub_23A5140E0()
{
  unint64_t result;

  result = qword_25698B128;
  if (!qword_25698B128)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTMonitorContext, &type metadata for DTMonitorContext);
    atomic_store(result, (unint64_t *)&qword_25698B128);
  }
  return result;
}

unint64_t sub_23A514124()
{
  unint64_t result;

  result = qword_25698C8F8;
  if (!qword_25698C8F8)
  {
    result = MEMORY[0x23B850924](&unk_23A5255D0, &type metadata for DTRequestContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C8F8);
  }
  return result;
}

unint64_t sub_23A514168()
{
  unint64_t result;

  result = qword_25698B150;
  if (!qword_25698B150)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTEndpoint, &type metadata for DTEndpoint);
    atomic_store(result, (unint64_t *)&qword_25698B150);
  }
  return result;
}

unint64_t sub_23A5141AC()
{
  unint64_t result;

  result = qword_25698B168;
  if (!qword_25698B168)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTEndpoint, &type metadata for DTEndpoint);
    atomic_store(result, (unint64_t *)&qword_25698B168);
  }
  return result;
}

uint64_t sub_23A5141F0(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25698B138);
    v8 = a2;
    result = MEMORY[0x23B850924](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23A514250()
{
  unint64_t result;

  result = qword_25698C900;
  if (!qword_25698C900)
  {
    result = MEMORY[0x23B850924](&unk_23A525580, &type metadata for DTDiagnosticsRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C900);
  }
  return result;
}

unint64_t sub_23A514294()
{
  unint64_t result;

  result = qword_25698C908;
  if (!qword_25698C908)
  {
    result = MEMORY[0x23B850924](&unk_23A525530, &type metadata for DTDiagnosticsRequest.ShowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C908);
  }
  return result;
}

unint64_t sub_23A5142D8()
{
  unint64_t result;

  result = qword_25698C910;
  if (!qword_25698C910)
  {
    result = MEMORY[0x23B850924](&unk_23A5254E0, &type metadata for DTDiagnosticsRequest.SyncMigrateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C910);
  }
  return result;
}

unint64_t sub_23A51431C()
{
  unint64_t result;

  result = qword_25698C918;
  if (!qword_25698C918)
  {
    result = MEMORY[0x23B850924](&unk_23A525490, &type metadata for DTDiagnosticsRequest.SyncConfigureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C918);
  }
  return result;
}

unint64_t sub_23A514360()
{
  unint64_t result;

  result = qword_25698C920;
  if (!qword_25698C920)
  {
    result = MEMORY[0x23B850924](&unk_23A525440, &type metadata for DTMonitorContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C920);
  }
  return result;
}

unint64_t sub_23A5143A4()
{
  unint64_t result;

  result = qword_25698B1D0;
  if (!qword_25698B1D0)
  {
    result = MEMORY[0x23B850924](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_25698B1D0);
  }
  return result;
}

unint64_t sub_23A5143E8()
{
  unint64_t result;

  result = qword_25698C928;
  if (!qword_25698C928)
  {
    result = MEMORY[0x23B850924](&unk_23A5253F0, &type metadata for DTMonitorEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C928);
  }
  return result;
}

uint64_t sub_23A51442C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25698B1E8);
    v10 = sub_23A50CC1C(a2, type metadata accessor for DTTimer, a3);
    result = MEMORY[0x23B850924](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23A5144B0()
{
  unint64_t result;

  result = qword_25698C930;
  if (!qword_25698C930)
  {
    result = MEMORY[0x23B850924](&unk_23A5253A0, &type metadata for DTAckResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C930);
  }
  return result;
}

unint64_t sub_23A5144F4()
{
  unint64_t result;

  result = qword_25698C938;
  if (!qword_25698C938)
  {
    result = MEMORY[0x23B850924](&unk_23A525350, &type metadata for DTEchoResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C938);
  }
  return result;
}

unint64_t sub_23A514538()
{
  unint64_t result;

  result = qword_25698C940;
  if (!qword_25698C940)
  {
    result = MEMORY[0x23B850924](&unk_23A525300, &type metadata for DTFetchStatusResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C940);
  }
  return result;
}

unint64_t sub_23A51457C()
{
  unint64_t result;

  result = qword_25698C948;
  if (!qword_25698C948)
  {
    result = MEMORY[0x23B850924](&unk_23A5252B0, &type metadata for DTFetchTimersResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C948);
  }
  return result;
}

unint64_t sub_23A5145C0()
{
  unint64_t result;

  result = qword_25698C950;
  if (!qword_25698C950)
  {
    result = MEMORY[0x23B850924](&unk_23A525260, &type metadata for DTMonitorStartResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25698C950);
  }
  return result;
}

unint64_t sub_23A514604()
{
  unint64_t result;

  result = qword_25698C958[0];
  if (!qword_25698C958[0])
  {
    result = MEMORY[0x23B850924](&unk_23A525210, &type metadata for DTShowResponse.CodingKeys);
    atomic_store(result, qword_25698C958);
  }
  return result;
}

uint64_t sub_23A514648()
{
  return sub_23A50CC1C(&qword_25698B278, (uint64_t (*)(uint64_t))sub_23A514674, MEMORY[0x24BEE59B0]);
}

unint64_t sub_23A514674()
{
  unint64_t result;

  result = qword_25698B280;
  if (!qword_25698B280)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25698B280);
  }
  return result;
}

unint64_t sub_23A5146B4()
{
  unint64_t result;

  result = qword_25698B288;
  if (!qword_25698B288)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTEndpoint, &type metadata for DTEndpoint);
    atomic_store(result, (unint64_t *)&qword_25698B288);
  }
  return result;
}

unint64_t sub_23A5146FC()
{
  unint64_t result;

  result = qword_25698B290;
  if (!qword_25698B290)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTFeatures, &type metadata for DTFeatures);
    atomic_store(result, (unint64_t *)&qword_25698B290);
  }
  return result;
}

unint64_t sub_23A514744()
{
  unint64_t result;

  result = qword_25698B298;
  if (!qword_25698B298)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTPrefKey, &type metadata for DTPrefKey);
    atomic_store(result, (unint64_t *)&qword_25698B298);
  }
  return result;
}

uint64_t sub_23A514788()
{
  return sub_23A5147B4(&qword_25698B2A0, &qword_25698B2A8, MEMORY[0x24BEE12E0]);
}

uint64_t sub_23A5147B4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B850924](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A5147F4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_23A514BCC(a1, a2, a3, (uint64_t (*)(void))sub_23A514810, (uint64_t (*)(void))sub_23A514854, (uint64_t (*)(void))sub_23A514898);
}

unint64_t sub_23A514810()
{
  unint64_t result;

  result = qword_25698B2B0;
  if (!qword_25698B2B0)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTAckResponse, &type metadata for DTAckResponse);
    atomic_store(result, (unint64_t *)&qword_25698B2B0);
  }
  return result;
}

unint64_t sub_23A514854()
{
  unint64_t result;

  result = qword_25698B4C0;
  if (!qword_25698B4C0)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTAckResponse, &type metadata for DTAckResponse);
    atomic_store(result, (unint64_t *)&qword_25698B4C0);
  }
  return result;
}

unint64_t sub_23A514898()
{
  unint64_t result;

  result = qword_25698B2B8;
  if (!qword_25698B2B8)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTAckResponse, &type metadata for DTAckResponse);
    atomic_store(result, (unint64_t *)&qword_25698B2B8);
  }
  return result;
}

uint64_t sub_23A5148DC(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_23A514BCC(a1, a2, a3, (uint64_t (*)(void))sub_23A5148F8, (uint64_t (*)(void))sub_23A50CB18, (uint64_t (*)(void))sub_23A51493C);
}

unint64_t sub_23A5148F8()
{
  unint64_t result;

  result = qword_25698B2C0;
  if (!qword_25698B2C0)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTEchoResponse, &type metadata for DTEchoResponse);
    atomic_store(result, (unint64_t *)&qword_25698B2C0);
  }
  return result;
}

unint64_t sub_23A51493C()
{
  unint64_t result;

  result = qword_25698B2C8;
  if (!qword_25698B2C8)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTEchoResponse, &type metadata for DTEchoResponse);
    atomic_store(result, (unint64_t *)&qword_25698B2C8);
  }
  return result;
}

uint64_t sub_23A514980(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_23A514BCC(a1, a2, a3, (uint64_t (*)(void))sub_23A51499C, (uint64_t (*)(void))sub_23A50CEC4, (uint64_t (*)(void))sub_23A5149E0);
}

unint64_t sub_23A51499C()
{
  unint64_t result;

  result = qword_25698B2D0;
  if (!qword_25698B2D0)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTFetchStatusResponse, &type metadata for DTFetchStatusResponse);
    atomic_store(result, (unint64_t *)&qword_25698B2D0);
  }
  return result;
}

unint64_t sub_23A5149E0()
{
  unint64_t result;

  result = qword_25698B2D8;
  if (!qword_25698B2D8)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTFetchStatusResponse, &type metadata for DTFetchStatusResponse);
    atomic_store(result, (unint64_t *)&qword_25698B2D8);
  }
  return result;
}

uint64_t sub_23A514A24(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_23A514BCC(a1, a2, a3, (uint64_t (*)(void))sub_23A514A40, (uint64_t (*)(void))sub_23A50CE80, (uint64_t (*)(void))sub_23A514A84);
}

unint64_t sub_23A514A40()
{
  unint64_t result;

  result = qword_25698B2E0;
  if (!qword_25698B2E0)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTFetchTimersResponse, &type metadata for DTFetchTimersResponse);
    atomic_store(result, (unint64_t *)&qword_25698B2E0);
  }
  return result;
}

unint64_t sub_23A514A84()
{
  unint64_t result;

  result = qword_25698B2E8;
  if (!qword_25698B2E8)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTFetchTimersResponse, &type metadata for DTFetchTimersResponse);
    atomic_store(result, (unint64_t *)&qword_25698B2E8);
  }
  return result;
}

uint64_t sub_23A514AC8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_23A514BCC(a1, a2, a3, (uint64_t (*)(void))sub_23A514AE4, (uint64_t (*)(void))sub_23A514B28, (uint64_t (*)(void))sub_23A514B6C);
}

unint64_t sub_23A514AE4()
{
  unint64_t result;

  result = qword_25698B2F0;
  if (!qword_25698B2F0)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTMonitorStartResponse, &type metadata for DTMonitorStartResponse);
    atomic_store(result, (unint64_t *)&qword_25698B2F0);
  }
  return result;
}

unint64_t sub_23A514B28()
{
  unint64_t result;

  result = qword_25698B510;
  if (!qword_25698B510)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTMonitorStartResponse, &type metadata for DTMonitorStartResponse);
    atomic_store(result, (unint64_t *)&qword_25698B510);
  }
  return result;
}

unint64_t sub_23A514B6C()
{
  unint64_t result;

  result = qword_25698B2F8;
  if (!qword_25698B2F8)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTMonitorStartResponse, &type metadata for DTMonitorStartResponse);
    atomic_store(result, (unint64_t *)&qword_25698B2F8);
  }
  return result;
}

uint64_t sub_23A514BB0(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_23A514BCC(a1, a2, a3, (uint64_t (*)(void))sub_23A514C10, (uint64_t (*)(void))sub_23A50CA90, (uint64_t (*)(void))sub_23A514C54);
}

uint64_t sub_23A514BCC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  uint64_t result;

  a1[1] = a4();
  a1[2] = a5();
  result = a6();
  a1[3] = result;
  return result;
}

unint64_t sub_23A514C10()
{
  unint64_t result;

  result = qword_25698B300;
  if (!qword_25698B300)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTShowResponse, &type metadata for DTShowResponse);
    atomic_store(result, (unint64_t *)&qword_25698B300);
  }
  return result;
}

unint64_t sub_23A514C54()
{
  unint64_t result;

  result = qword_25698B308;
  if (!qword_25698B308)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTShowResponse, &type metadata for DTShowResponse);
    atomic_store(result, (unint64_t *)&qword_25698B308);
  }
  return result;
}

ValueMetadata *type metadata accessor for DTConstants()
{
  return &type metadata for DTConstants;
}

_QWORD *initializeBufferWithCopyOfBuffer for DTEndpoint(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for DTEndpoint()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithTake for DTEndpoint(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DTEndpoint(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DTEndpoint(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t sub_23A514DB4(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_23A514DCC(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for DTEndpoint()
{
  return &type metadata for DTEndpoint;
}

ValueMetadata *type metadata accessor for DTFeatures()
{
  return &type metadata for DTFeatures;
}

ValueMetadata *type metadata accessor for DTPrefKey()
{
  return &type metadata for DTPrefKey;
}

void destroy for DTRequest(uint64_t a1)
{
  sub_23A4FCCC0(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t initializeWithCopy for DTRequest(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23A4FCC3C(*(id *)a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for DTRequest(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23A4FCC3C(*(id *)a2, v4, v5, v6);
  v7 = *(void **)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v10 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v6;
  sub_23A4FCCC0(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DTRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  v8 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v4;
  sub_23A4FCCC0(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for DTRequest(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xF6 && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 246);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 0xA)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DTRequest(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF5)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 246;
    if (a3 >= 0xF6)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xF6)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t sub_23A514FF0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 9u)
    return *(unsigned __int8 *)(a1 + 24);
  else
    return (*(_DWORD *)a1 + 10);
}

uint64_t sub_23A515008(uint64_t result, unsigned int a2)
{
  uint64_t v2;

  v2 = a2 - 10;
  if (a2 >= 0xA)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    LOBYTE(a2) = 10;
    *(_QWORD *)result = v2;
  }
  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DTRequest()
{
  return &type metadata for DTRequest;
}

uint64_t destroy for DTRequestContext()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s17DistributedTimers16DTRequestContextVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for DTRequestContext(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DTRequestContext(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DTRequestContext(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DTRequestContext(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for DTRequestContext()
{
  return &type metadata for DTRequestContext;
}

uint64_t getEnumTagSinglePayload for DTDiagnosticsRequest(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;

  if (!a2)
    return 0;
  if (a2 < 0x7E)
    goto LABEL_17;
  if (a2 + 130 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 130) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 130;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 130;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 130;
  }
LABEL_17:
  v6 = ((*a1 >> 6) & 0xFFFFFF83 | (4 * ((*a1 >> 1) & 0x1F))) ^ 0x7F;
  if (v6 >= 0x7D)
    v6 = -1;
  return v6 + 1;
}

uint64_t storeEnumTagSinglePayload for DTDiagnosticsRequest(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 130 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 130) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0x7E)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0x7D)
    return ((uint64_t (*)(void))((char *)&loc_23A5152F0 + 4 * byte_23A52321F[v4]))();
  *a1 = a2 - 126;
  return ((uint64_t (*)(void))((char *)sub_23A515324 + 4 * byte_23A52321A[v4]))();
}

uint64_t sub_23A515324(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A51532C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A515334);
  return result;
}

uint64_t sub_23A51534C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A515354);
  *(_BYTE *)result = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
  return result;
}

uint64_t sub_23A515358(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A515360(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A51536C(_BYTE *a1)
{
  int v1;

  v1 = (char)*a1;
  if (v1 >= 0)
    return *a1 >> 6;
  else
    return v1 & 1 | 2u;
}

_BYTE *sub_23A515388(_BYTE *result)
{
  *result &= 0x3Fu;
  return result;
}

_BYTE *sub_23A515398(_BYTE *result, unsigned int a2)
{
  if (a2 < 2)
    *result = *result & 1 | ((_BYTE)a2 << 6);
  else
    *result = a2 & 1 | 0x80;
  return result;
}

ValueMetadata *type metadata accessor for DTDiagnosticsRequest()
{
  return &type metadata for DTDiagnosticsRequest;
}

ValueMetadata *type metadata accessor for DTMonitorContext()
{
  return &type metadata for DTMonitorContext;
}

uint64_t initializeBufferWithCopyOfBuffer for DTMonitorEvent(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for DTMonitorEvent()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for DTMonitorEvent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DTMonitorEvent(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for DTMonitorEvent()
{
  return &type metadata for DTMonitorEvent;
}

ValueMetadata *type metadata accessor for DTAckResponse()
{
  return &type metadata for DTAckResponse;
}

ValueMetadata *type metadata accessor for DTEchoResponse()
{
  return &type metadata for DTEchoResponse;
}

ValueMetadata *type metadata accessor for DTFetchStatusResponse()
{
  return &type metadata for DTFetchStatusResponse;
}

ValueMetadata *type metadata accessor for DTFetchTimersResponse()
{
  return &type metadata for DTFetchTimersResponse;
}

ValueMetadata *type metadata accessor for DTMonitorStartResponse()
{
  return &type metadata for DTMonitorStartResponse;
}

_QWORD *_s17DistributedTimers10DTEndpointOwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s17DistributedTimers14DTEchoResponseVwet_0(uint64_t a1, int a2)
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

uint64_t sub_23A515590(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for DTShowResponse()
{
  return &type metadata for DTShowResponse;
}

uint64_t sub_23A5155E8()
{
  return 0;
}

ValueMetadata *type metadata accessor for DTShowResponse.CodingKeys()
{
  return &type metadata for DTShowResponse.CodingKeys;
}

ValueMetadata *type metadata accessor for DTMonitorStartResponse.CodingKeys()
{
  return &type metadata for DTMonitorStartResponse.CodingKeys;
}

ValueMetadata *type metadata accessor for DTFetchTimersResponse.CodingKeys()
{
  return &type metadata for DTFetchTimersResponse.CodingKeys;
}

ValueMetadata *type metadata accessor for DTFetchStatusResponse.CodingKeys()
{
  return &type metadata for DTFetchStatusResponse.CodingKeys;
}

ValueMetadata *type metadata accessor for DTEchoResponse.CodingKeys()
{
  return &type metadata for DTEchoResponse.CodingKeys;
}

ValueMetadata *type metadata accessor for DTAckResponse.CodingKeys()
{
  return &type metadata for DTAckResponse.CodingKeys;
}

ValueMetadata *type metadata accessor for DTMonitorEvent.CodingKeys()
{
  return &type metadata for DTMonitorEvent.CodingKeys;
}

ValueMetadata *type metadata accessor for DTMonitorContext.CodingKeys()
{
  return &type metadata for DTMonitorContext.CodingKeys;
}

uint64_t _s17DistributedTimers14DTMonitorEventV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A5156C4 + 4 * byte_23A523229[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23A5156F8 + 4 * byte_23A523224[v4]))();
}

uint64_t sub_23A5156F8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A515700(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A515708);
  return result;
}

uint64_t sub_23A515714(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A51571CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23A515720(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A515728(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DTDiagnosticsRequest.CodingKeys()
{
  return &type metadata for DTDiagnosticsRequest.CodingKeys;
}

ValueMetadata *type metadata accessor for DTDiagnosticsRequest.SyncConfigureCodingKeys()
{
  return &type metadata for DTDiagnosticsRequest.SyncConfigureCodingKeys;
}

ValueMetadata *type metadata accessor for DTDiagnosticsRequest.SyncMigrateCodingKeys()
{
  return &type metadata for DTDiagnosticsRequest.SyncMigrateCodingKeys;
}

ValueMetadata *type metadata accessor for DTDiagnosticsRequest.ShowCodingKeys()
{
  return &type metadata for DTDiagnosticsRequest.ShowCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequestContext.CodingKeys()
{
  return &type metadata for DTRequestContext.CodingKeys;
}

uint64_t getEnumTagSinglePayload for DTRequest.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF4)
    goto LABEL_17;
  if (a2 + 12 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 12) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 12;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 12;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 12;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xD;
  v8 = v6 - 13;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DTRequest.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 12 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 12) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF3)
    return ((uint64_t (*)(void))((char *)&loc_23A515860 + 4 * byte_23A523233[v4]))();
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_23A515894 + 4 * byte_23A52322E[v4]))();
}

uint64_t sub_23A515894(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A51589C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A5158A4);
  return result;
}

uint64_t sub_23A5158B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A5158B8);
  *(_BYTE *)result = a2 + 12;
  return result;
}

uint64_t sub_23A5158BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A5158C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DTRequest.CodingKeys()
{
  return &type metadata for DTRequest.CodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.AddTimerCodingKeys()
{
  return &type metadata for DTRequest.AddTimerCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.UpdateTimerCodingKeys()
{
  return &type metadata for DTRequest.UpdateTimerCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.RemoveTimerCodingKeys()
{
  return &type metadata for DTRequest.RemoveTimerCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.SnoozeTimerCodingKeys()
{
  return &type metadata for DTRequest.SnoozeTimerCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.DismissTimerCodingKeys()
{
  return &type metadata for DTRequest.DismissTimerCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.FetchStatusCodingKeys()
{
  return &type metadata for DTRequest.FetchStatusCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.FetchTimersCodingKeys()
{
  return &type metadata for DTRequest.FetchTimersCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.EchoCodingKeys()
{
  return &type metadata for DTRequest.EchoCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.MonitorStartCodingKeys()
{
  return &type metadata for DTRequest.MonitorStartCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.MonitorStopCodingKeys()
{
  return &type metadata for DTRequest.MonitorStopCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.MonitorKeepAliveCodingKeys()
{
  return &type metadata for DTRequest.MonitorKeepAliveCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.MonitorEventCodingKeys()
{
  return &type metadata for DTRequest.MonitorEventCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.DiagnosticsCodingKeys()
{
  return &type metadata for DTRequest.DiagnosticsCodingKeys;
}

uint64_t _s17DistributedTimers10DTFeaturesOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A5159FC + 4 * byte_23A52323D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A515A30 + 4 * byte_23A523238[v4]))();
}

uint64_t sub_23A515A30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A515A38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A515A40);
  return result;
}

uint64_t sub_23A515A4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A515A54);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A515A58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A515A60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DTEndpoint.CodingKeys()
{
  return &type metadata for DTEndpoint.CodingKeys;
}

ValueMetadata *type metadata accessor for DTEndpoint.LocalCodingKeys()
{
  return &type metadata for DTEndpoint.LocalCodingKeys;
}

uint64_t _s17DistributedTimers14DTShowResponseV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t _s17DistributedTimers14DTShowResponseV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A515B1C + 4 * byte_23A523242[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A515B3C + 4 * byte_23A523247[v4]))();
}

_BYTE *sub_23A515B1C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A515B3C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A515B44(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A515B4C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A515B54(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A515B5C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DTEndpoint.HomeKitAccessoryIDCodingKeys()
{
  return &type metadata for DTEndpoint.HomeKitAccessoryIDCodingKeys;
}

unint64_t sub_23A515B7C()
{
  unint64_t result;

  result = qword_25698E460[0];
  if (!qword_25698E460[0])
  {
    result = MEMORY[0x23B850924](&unk_23A523F80, &type metadata for DTEndpoint.HomeKitAccessoryIDCodingKeys);
    atomic_store(result, qword_25698E460);
  }
  return result;
}

unint64_t sub_23A515BC4()
{
  unint64_t result;

  result = qword_25698E770[0];
  if (!qword_25698E770[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524088, &type metadata for DTEndpoint.CodingKeys);
    atomic_store(result, qword_25698E770);
  }
  return result;
}

unint64_t sub_23A515C0C()
{
  unint64_t result;

  result = qword_25698E980[0];
  if (!qword_25698E980[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524140, &type metadata for DTRequest.DiagnosticsCodingKeys);
    atomic_store(result, qword_25698E980);
  }
  return result;
}

unint64_t sub_23A515C54()
{
  unint64_t result;

  result = qword_25698EB90[0];
  if (!qword_25698EB90[0])
  {
    result = MEMORY[0x23B850924](&unk_23A5241F8, &type metadata for DTRequest.MonitorEventCodingKeys);
    atomic_store(result, qword_25698EB90);
  }
  return result;
}

unint64_t sub_23A515C9C()
{
  unint64_t result;

  result = qword_25698EEA0[0];
  if (!qword_25698EEA0[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524300, &type metadata for DTRequest.MonitorStopCodingKeys);
    atomic_store(result, qword_25698EEA0);
  }
  return result;
}

unint64_t sub_23A515CE4()
{
  unint64_t result;

  result = qword_25698F0B0[0];
  if (!qword_25698F0B0[0])
  {
    result = MEMORY[0x23B850924](&unk_23A5243B8, &type metadata for DTRequest.MonitorStartCodingKeys);
    atomic_store(result, qword_25698F0B0);
  }
  return result;
}

unint64_t sub_23A515D2C()
{
  unint64_t result;

  result = qword_25698F2C0[0];
  if (!qword_25698F2C0[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524470, &type metadata for DTRequest.EchoCodingKeys);
    atomic_store(result, qword_25698F2C0);
  }
  return result;
}

unint64_t sub_23A515D74()
{
  unint64_t result;

  result = qword_25698F6D0[0];
  if (!qword_25698F6D0[0])
  {
    result = MEMORY[0x23B850924](&unk_23A5245C8, &type metadata for DTRequest.DismissTimerCodingKeys);
    atomic_store(result, qword_25698F6D0);
  }
  return result;
}

unint64_t sub_23A515DBC()
{
  unint64_t result;

  result = qword_25698F8E0[0];
  if (!qword_25698F8E0[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524680, &type metadata for DTRequest.SnoozeTimerCodingKeys);
    atomic_store(result, qword_25698F8E0);
  }
  return result;
}

unint64_t sub_23A515E04()
{
  unint64_t result;

  result = qword_25698FAF0[0];
  if (!qword_25698FAF0[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524738, &type metadata for DTRequest.RemoveTimerCodingKeys);
    atomic_store(result, qword_25698FAF0);
  }
  return result;
}

unint64_t sub_23A515E4C()
{
  unint64_t result;

  result = qword_25698FD00[0];
  if (!qword_25698FD00[0])
  {
    result = MEMORY[0x23B850924](&unk_23A5247F0, &type metadata for DTRequest.UpdateTimerCodingKeys);
    atomic_store(result, qword_25698FD00);
  }
  return result;
}

unint64_t sub_23A515E94()
{
  unint64_t result;

  result = qword_25698FF10[0];
  if (!qword_25698FF10[0])
  {
    result = MEMORY[0x23B850924](&unk_23A5248A8, &type metadata for DTRequest.AddTimerCodingKeys);
    atomic_store(result, qword_25698FF10);
  }
  return result;
}

unint64_t sub_23A515EDC()
{
  unint64_t result;

  result = qword_256990120[0];
  if (!qword_256990120[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524960, &type metadata for DTRequest.CodingKeys);
    atomic_store(result, qword_256990120);
  }
  return result;
}

unint64_t sub_23A515F24()
{
  unint64_t result;

  result = qword_256990330[0];
  if (!qword_256990330[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524A18, &type metadata for DTRequestContext.CodingKeys);
    atomic_store(result, qword_256990330);
  }
  return result;
}

unint64_t sub_23A515F6C()
{
  unint64_t result;

  result = qword_256990640[0];
  if (!qword_256990640[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524B20, &type metadata for DTDiagnosticsRequest.SyncMigrateCodingKeys);
    atomic_store(result, qword_256990640);
  }
  return result;
}

unint64_t sub_23A515FB4()
{
  unint64_t result;

  result = qword_256990850[0];
  if (!qword_256990850[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524BD8, &type metadata for DTDiagnosticsRequest.SyncConfigureCodingKeys);
    atomic_store(result, qword_256990850);
  }
  return result;
}

unint64_t sub_23A515FFC()
{
  unint64_t result;

  result = qword_256990A60[0];
  if (!qword_256990A60[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524C90, &type metadata for DTDiagnosticsRequest.CodingKeys);
    atomic_store(result, qword_256990A60);
  }
  return result;
}

unint64_t sub_23A516044()
{
  unint64_t result;

  result = qword_256990C70[0];
  if (!qword_256990C70[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524D48, &type metadata for DTMonitorContext.CodingKeys);
    atomic_store(result, qword_256990C70);
  }
  return result;
}

unint64_t sub_23A51608C()
{
  unint64_t result;

  result = qword_256990E80[0];
  if (!qword_256990E80[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524E00, &type metadata for DTMonitorEvent.CodingKeys);
    atomic_store(result, qword_256990E80);
  }
  return result;
}

unint64_t sub_23A5160D4()
{
  unint64_t result;

  result = qword_256991190[0];
  if (!qword_256991190[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524F08, &type metadata for DTEchoResponse.CodingKeys);
    atomic_store(result, qword_256991190);
  }
  return result;
}

unint64_t sub_23A51611C()
{
  unint64_t result;

  result = qword_2569913A0[0];
  if (!qword_2569913A0[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524FC0, &type metadata for DTFetchStatusResponse.CodingKeys);
    atomic_store(result, qword_2569913A0);
  }
  return result;
}

unint64_t sub_23A516164()
{
  unint64_t result;

  result = qword_2569915B0[0];
  if (!qword_2569915B0[0])
  {
    result = MEMORY[0x23B850924](&unk_23A525078, &type metadata for DTFetchTimersResponse.CodingKeys);
    atomic_store(result, qword_2569915B0);
  }
  return result;
}

unint64_t sub_23A5161AC()
{
  unint64_t result;

  result = qword_2569917C0[0];
  if (!qword_2569917C0[0])
  {
    result = MEMORY[0x23B850924](&unk_23A525130, &type metadata for DTMonitorStartResponse.CodingKeys);
    atomic_store(result, qword_2569917C0);
  }
  return result;
}

unint64_t sub_23A5161F4()
{
  unint64_t result;

  result = qword_2569919D0[0];
  if (!qword_2569919D0[0])
  {
    result = MEMORY[0x23B850924](&unk_23A5251E8, &type metadata for DTShowResponse.CodingKeys);
    atomic_store(result, qword_2569919D0);
  }
  return result;
}

unint64_t sub_23A51623C()
{
  unint64_t result;

  result = qword_256991AE0;
  if (!qword_256991AE0)
  {
    result = MEMORY[0x23B850924](&unk_23A525158, &type metadata for DTShowResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256991AE0);
  }
  return result;
}

unint64_t sub_23A516284()
{
  unint64_t result;

  result = qword_256991AE8[0];
  if (!qword_256991AE8[0])
  {
    result = MEMORY[0x23B850924](&unk_23A525180, &type metadata for DTShowResponse.CodingKeys);
    atomic_store(result, qword_256991AE8);
  }
  return result;
}

unint64_t sub_23A5162CC()
{
  unint64_t result;

  result = qword_256991B70;
  if (!qword_256991B70)
  {
    result = MEMORY[0x23B850924](&unk_23A5250A0, &type metadata for DTMonitorStartResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256991B70);
  }
  return result;
}

unint64_t sub_23A516314()
{
  unint64_t result;

  result = qword_256991B78;
  if (!qword_256991B78)
  {
    result = MEMORY[0x23B850924](&unk_23A5250C8, &type metadata for DTMonitorStartResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256991B78);
  }
  return result;
}

unint64_t sub_23A51635C()
{
  unint64_t result;

  result = qword_256991C00;
  if (!qword_256991C00)
  {
    result = MEMORY[0x23B850924](&unk_23A524FE8, &type metadata for DTFetchTimersResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256991C00);
  }
  return result;
}

unint64_t sub_23A5163A4()
{
  unint64_t result;

  result = qword_256991C08[0];
  if (!qword_256991C08[0])
  {
    result = MEMORY[0x23B850924](&unk_23A525010, &type metadata for DTFetchTimersResponse.CodingKeys);
    atomic_store(result, qword_256991C08);
  }
  return result;
}

unint64_t sub_23A5163EC()
{
  unint64_t result;

  result = qword_256991C90;
  if (!qword_256991C90)
  {
    result = MEMORY[0x23B850924](&unk_23A524F30, &type metadata for DTFetchStatusResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256991C90);
  }
  return result;
}

unint64_t sub_23A516434()
{
  unint64_t result;

  result = qword_256991C98[0];
  if (!qword_256991C98[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524F58, &type metadata for DTFetchStatusResponse.CodingKeys);
    atomic_store(result, qword_256991C98);
  }
  return result;
}

unint64_t sub_23A51647C()
{
  unint64_t result;

  result = qword_256991D20;
  if (!qword_256991D20)
  {
    result = MEMORY[0x23B850924](&unk_23A524E78, &type metadata for DTEchoResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256991D20);
  }
  return result;
}

unint64_t sub_23A5164C4()
{
  unint64_t result;

  result = qword_256991D28[0];
  if (!qword_256991D28[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524EA0, &type metadata for DTEchoResponse.CodingKeys);
    atomic_store(result, qword_256991D28);
  }
  return result;
}

unint64_t sub_23A51650C()
{
  unint64_t result;

  result = qword_256991DB0;
  if (!qword_256991DB0)
  {
    result = MEMORY[0x23B850924](&unk_23A524E28, &type metadata for DTAckResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256991DB0);
  }
  return result;
}

unint64_t sub_23A516554()
{
  unint64_t result;

  result = qword_256991DB8[0];
  if (!qword_256991DB8[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524E50, &type metadata for DTAckResponse.CodingKeys);
    atomic_store(result, qword_256991DB8);
  }
  return result;
}

unint64_t sub_23A51659C()
{
  unint64_t result;

  result = qword_256991E40;
  if (!qword_256991E40)
  {
    result = MEMORY[0x23B850924](&unk_23A524D70, &type metadata for DTMonitorEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256991E40);
  }
  return result;
}

unint64_t sub_23A5165E4()
{
  unint64_t result;

  result = qword_256991E48[0];
  if (!qword_256991E48[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524D98, &type metadata for DTMonitorEvent.CodingKeys);
    atomic_store(result, qword_256991E48);
  }
  return result;
}

unint64_t sub_23A51662C()
{
  unint64_t result;

  result = qword_256991ED0;
  if (!qword_256991ED0)
  {
    result = MEMORY[0x23B850924](&unk_23A524CB8, &type metadata for DTMonitorContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256991ED0);
  }
  return result;
}

unint64_t sub_23A516674()
{
  unint64_t result;

  result = qword_256991ED8[0];
  if (!qword_256991ED8[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524CE0, &type metadata for DTMonitorContext.CodingKeys);
    atomic_store(result, qword_256991ED8);
  }
  return result;
}

unint64_t sub_23A5166BC()
{
  unint64_t result;

  result = qword_256991F60;
  if (!qword_256991F60)
  {
    result = MEMORY[0x23B850924](&unk_23A524B48, &type metadata for DTDiagnosticsRequest.SyncConfigureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256991F60);
  }
  return result;
}

unint64_t sub_23A516704()
{
  unint64_t result;

  result = qword_256991F68[0];
  if (!qword_256991F68[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524B70, &type metadata for DTDiagnosticsRequest.SyncConfigureCodingKeys);
    atomic_store(result, qword_256991F68);
  }
  return result;
}

unint64_t sub_23A51674C()
{
  unint64_t result;

  result = qword_256991FF0;
  if (!qword_256991FF0)
  {
    result = MEMORY[0x23B850924](&unk_23A524A90, &type metadata for DTDiagnosticsRequest.SyncMigrateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256991FF0);
  }
  return result;
}

unint64_t sub_23A516794()
{
  unint64_t result;

  result = qword_256991FF8[0];
  if (!qword_256991FF8[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524AB8, &type metadata for DTDiagnosticsRequest.SyncMigrateCodingKeys);
    atomic_store(result, qword_256991FF8);
  }
  return result;
}

unint64_t sub_23A5167DC()
{
  unint64_t result;

  result = qword_256992080;
  if (!qword_256992080)
  {
    result = MEMORY[0x23B850924](&unk_23A524A40, &type metadata for DTDiagnosticsRequest.ShowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256992080);
  }
  return result;
}

unint64_t sub_23A516824()
{
  unint64_t result;

  result = qword_256992088[0];
  if (!qword_256992088[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524A68, &type metadata for DTDiagnosticsRequest.ShowCodingKeys);
    atomic_store(result, qword_256992088);
  }
  return result;
}

unint64_t sub_23A51686C()
{
  unint64_t result;

  result = qword_256992110;
  if (!qword_256992110)
  {
    result = MEMORY[0x23B850924](&unk_23A524C00, &type metadata for DTDiagnosticsRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256992110);
  }
  return result;
}

unint64_t sub_23A5168B4()
{
  unint64_t result;

  result = qword_256992118[0];
  if (!qword_256992118[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524C28, &type metadata for DTDiagnosticsRequest.CodingKeys);
    atomic_store(result, qword_256992118);
  }
  return result;
}

unint64_t sub_23A5168FC()
{
  unint64_t result;

  result = qword_2569921A0;
  if (!qword_2569921A0)
  {
    result = MEMORY[0x23B850924](&unk_23A524988, &type metadata for DTRequestContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569921A0);
  }
  return result;
}

unint64_t sub_23A516944()
{
  unint64_t result;

  result = qword_2569921A8[0];
  if (!qword_2569921A8[0])
  {
    result = MEMORY[0x23B850924](&unk_23A5249B0, &type metadata for DTRequestContext.CodingKeys);
    atomic_store(result, qword_2569921A8);
  }
  return result;
}

unint64_t sub_23A51698C()
{
  unint64_t result;

  result = qword_256992230;
  if (!qword_256992230)
  {
    result = MEMORY[0x23B850924](&unk_23A524818, &type metadata for DTRequest.AddTimerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256992230);
  }
  return result;
}

unint64_t sub_23A5169D4()
{
  unint64_t result;

  result = qword_256992238[0];
  if (!qword_256992238[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524840, &type metadata for DTRequest.AddTimerCodingKeys);
    atomic_store(result, qword_256992238);
  }
  return result;
}

unint64_t sub_23A516A1C()
{
  unint64_t result;

  result = qword_2569922C0;
  if (!qword_2569922C0)
  {
    result = MEMORY[0x23B850924](&unk_23A524760, &type metadata for DTRequest.UpdateTimerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569922C0);
  }
  return result;
}

unint64_t sub_23A516A64()
{
  unint64_t result;

  result = qword_2569922C8[0];
  if (!qword_2569922C8[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524788, &type metadata for DTRequest.UpdateTimerCodingKeys);
    atomic_store(result, qword_2569922C8);
  }
  return result;
}

unint64_t sub_23A516AAC()
{
  unint64_t result;

  result = qword_256992350;
  if (!qword_256992350)
  {
    result = MEMORY[0x23B850924](&unk_23A5246A8, &type metadata for DTRequest.RemoveTimerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256992350);
  }
  return result;
}

unint64_t sub_23A516AF4()
{
  unint64_t result;

  result = qword_256992358[0];
  if (!qword_256992358[0])
  {
    result = MEMORY[0x23B850924](&unk_23A5246D0, &type metadata for DTRequest.RemoveTimerCodingKeys);
    atomic_store(result, qword_256992358);
  }
  return result;
}

unint64_t sub_23A516B3C()
{
  unint64_t result;

  result = qword_2569923E0;
  if (!qword_2569923E0)
  {
    result = MEMORY[0x23B850924](&unk_23A5245F0, &type metadata for DTRequest.SnoozeTimerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569923E0);
  }
  return result;
}

unint64_t sub_23A516B84()
{
  unint64_t result;

  result = qword_2569923E8[0];
  if (!qword_2569923E8[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524618, &type metadata for DTRequest.SnoozeTimerCodingKeys);
    atomic_store(result, qword_2569923E8);
  }
  return result;
}

unint64_t sub_23A516BCC()
{
  unint64_t result;

  result = qword_256992470;
  if (!qword_256992470)
  {
    result = MEMORY[0x23B850924](&unk_23A524538, &type metadata for DTRequest.DismissTimerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256992470);
  }
  return result;
}

unint64_t sub_23A516C14()
{
  unint64_t result;

  result = qword_256992478;
  if (!qword_256992478)
  {
    result = MEMORY[0x23B850924](&unk_23A524560, &type metadata for DTRequest.DismissTimerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256992478);
  }
  return result;
}

unint64_t sub_23A516C5C()
{
  unint64_t result;

  result = qword_256992500;
  if (!qword_256992500)
  {
    result = MEMORY[0x23B850924](&unk_23A5244E8, &type metadata for DTRequest.FetchStatusCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256992500);
  }
  return result;
}

unint64_t sub_23A516CA4()
{
  unint64_t result;

  result = qword_256992508[0];
  if (!qword_256992508[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524510, &type metadata for DTRequest.FetchStatusCodingKeys);
    atomic_store(result, qword_256992508);
  }
  return result;
}

unint64_t sub_23A516CEC()
{
  unint64_t result;

  result = qword_256992590;
  if (!qword_256992590)
  {
    result = MEMORY[0x23B850924](&unk_23A524498, &type metadata for DTRequest.FetchTimersCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256992590);
  }
  return result;
}

unint64_t sub_23A516D34()
{
  unint64_t result;

  result = qword_256992598[0];
  if (!qword_256992598[0])
  {
    result = MEMORY[0x23B850924](&unk_23A5244C0, &type metadata for DTRequest.FetchTimersCodingKeys);
    atomic_store(result, qword_256992598);
  }
  return result;
}

unint64_t sub_23A516D7C()
{
  unint64_t result;

  result = qword_256992620;
  if (!qword_256992620)
  {
    result = MEMORY[0x23B850924](&unk_23A5243E0, &type metadata for DTRequest.EchoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256992620);
  }
  return result;
}

unint64_t sub_23A516DC4()
{
  unint64_t result;

  result = qword_256992628[0];
  if (!qword_256992628[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524408, &type metadata for DTRequest.EchoCodingKeys);
    atomic_store(result, qword_256992628);
  }
  return result;
}

unint64_t sub_23A516E0C()
{
  unint64_t result;

  result = qword_2569926B0;
  if (!qword_2569926B0)
  {
    result = MEMORY[0x23B850924](&unk_23A524328, &type metadata for DTRequest.MonitorStartCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569926B0);
  }
  return result;
}

unint64_t sub_23A516E54()
{
  unint64_t result;

  result = qword_2569926B8[0];
  if (!qword_2569926B8[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524350, &type metadata for DTRequest.MonitorStartCodingKeys);
    atomic_store(result, qword_2569926B8);
  }
  return result;
}

unint64_t sub_23A516E9C()
{
  unint64_t result;

  result = qword_256992740;
  if (!qword_256992740)
  {
    result = MEMORY[0x23B850924](&unk_23A524270, &type metadata for DTRequest.MonitorStopCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256992740);
  }
  return result;
}

unint64_t sub_23A516EE4()
{
  unint64_t result;

  result = qword_256992748[0];
  if (!qword_256992748[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524298, &type metadata for DTRequest.MonitorStopCodingKeys);
    atomic_store(result, qword_256992748);
  }
  return result;
}

unint64_t sub_23A516F2C()
{
  unint64_t result;

  result = qword_2569927D0;
  if (!qword_2569927D0)
  {
    result = MEMORY[0x23B850924](&unk_23A524220, &type metadata for DTRequest.MonitorKeepAliveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569927D0);
  }
  return result;
}

unint64_t sub_23A516F74()
{
  unint64_t result;

  result = qword_2569927D8[0];
  if (!qword_2569927D8[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524248, &type metadata for DTRequest.MonitorKeepAliveCodingKeys);
    atomic_store(result, qword_2569927D8);
  }
  return result;
}

unint64_t sub_23A516FBC()
{
  unint64_t result;

  result = qword_256992860;
  if (!qword_256992860)
  {
    result = MEMORY[0x23B850924](&unk_23A524168, &type metadata for DTRequest.MonitorEventCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256992860);
  }
  return result;
}

unint64_t sub_23A517004()
{
  unint64_t result;

  result = qword_256992868[0];
  if (!qword_256992868[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524190, &type metadata for DTRequest.MonitorEventCodingKeys);
    atomic_store(result, qword_256992868);
  }
  return result;
}

unint64_t sub_23A51704C()
{
  unint64_t result;

  result = qword_2569928F0;
  if (!qword_2569928F0)
  {
    result = MEMORY[0x23B850924](&unk_23A5240B0, &type metadata for DTRequest.DiagnosticsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569928F0);
  }
  return result;
}

unint64_t sub_23A517094()
{
  unint64_t result;

  result = qword_2569928F8[0];
  if (!qword_2569928F8[0])
  {
    result = MEMORY[0x23B850924](&unk_23A5240D8, &type metadata for DTRequest.DiagnosticsCodingKeys);
    atomic_store(result, qword_2569928F8);
  }
  return result;
}

unint64_t sub_23A5170DC()
{
  unint64_t result;

  result = qword_256992980;
  if (!qword_256992980)
  {
    result = MEMORY[0x23B850924](&unk_23A5248D0, &type metadata for DTRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256992980);
  }
  return result;
}

unint64_t sub_23A517124()
{
  unint64_t result;

  result = qword_256992988[0];
  if (!qword_256992988[0])
  {
    result = MEMORY[0x23B850924](&unk_23A5248F8, &type metadata for DTRequest.CodingKeys);
    atomic_store(result, qword_256992988);
  }
  return result;
}

unint64_t sub_23A51716C()
{
  unint64_t result;

  result = qword_256992A10;
  if (!qword_256992A10)
  {
    result = MEMORY[0x23B850924](&unk_23A523FA8, &type metadata for DTEndpoint.LocalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256992A10);
  }
  return result;
}

unint64_t sub_23A5171B4()
{
  unint64_t result;

  result = qword_256992A18[0];
  if (!qword_256992A18[0])
  {
    result = MEMORY[0x23B850924](&unk_23A523FD0, &type metadata for DTEndpoint.LocalCodingKeys);
    atomic_store(result, qword_256992A18);
  }
  return result;
}

unint64_t sub_23A5171FC()
{
  unint64_t result;

  result = qword_256992AA0;
  if (!qword_256992AA0)
  {
    result = MEMORY[0x23B850924](&unk_23A523EF0, &type metadata for DTEndpoint.HomeKitAccessoryIDCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256992AA0);
  }
  return result;
}

unint64_t sub_23A517244()
{
  unint64_t result;

  result = qword_256992AA8[0];
  if (!qword_256992AA8[0])
  {
    result = MEMORY[0x23B850924](&unk_23A523F18, &type metadata for DTEndpoint.HomeKitAccessoryIDCodingKeys);
    atomic_store(result, qword_256992AA8);
  }
  return result;
}

unint64_t sub_23A51728C()
{
  unint64_t result;

  result = qword_256992B30;
  if (!qword_256992B30)
  {
    result = MEMORY[0x23B850924](&unk_23A523FF8, &type metadata for DTEndpoint.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256992B30);
  }
  return result;
}

unint64_t sub_23A5172D4()
{
  unint64_t result;

  result = qword_256992B38[0];
  if (!qword_256992B38[0])
  {
    result = MEMORY[0x23B850924](&unk_23A524020, &type metadata for DTEndpoint.CodingKeys);
    atomic_store(result, qword_256992B38);
  }
  return result;
}

uint64_t sub_23A517318(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6C61636F6CLL && a2 == 0xE500000000000000;
  if (v2 || (sub_23A521E18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000023A526630)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23A521E18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A5173FC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x72656D6954646461 && a2 == 0xE800000000000000;
  if (v2 || (sub_23A521E18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6954657461647075 && a2 == 0xEB0000000072656DLL || (sub_23A521E18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x695465766F6D6572 && a2 == 0xEB0000000072656DLL || (sub_23A521E18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6954657A6F6F6E73 && a2 == 0xEB0000000072656DLL || (sub_23A521E18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x547373696D736964 && a2 == 0xEC00000072656D69 || (sub_23A521E18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6174536863746566 && a2 == 0xEB00000000737574 || (sub_23A521E18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6D69546863746566 && a2 == 0xEB00000000737265 || (sub_23A521E18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 1869112165 && a2 == 0xE400000000000000 || (sub_23A521E18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x53726F74696E6F6DLL && a2 == 0xEC00000074726174 || (sub_23A521E18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x53726F74696E6F6DLL && a2 == 0xEB00000000706F74 || (sub_23A521E18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023A526550 || (sub_23A521E18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x45726F74696E6F6DLL && a2 == 0xEC000000746E6576 || (sub_23A521E18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x74736F6E67616964 && a2 == 0xEB00000000736369)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else
  {
    v6 = sub_23A521E18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 12;
    else
      return 13;
  }
}

uint64_t sub_23A5179E0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x746E696F70646E65 && a2 == 0xE800000000000000;
  if (v2 || (sub_23A521E18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4449746567726174 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23A521E18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A517ADC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x666E6F43636E7973 && a2 == 0xED00006572756769;
  if (v2 || (sub_23A521E18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7267694D636E7973 && a2 == 0xEB00000000657461 || (sub_23A521E18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 2003789939 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23A521E18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23A517C5C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x4449746E65696C63 && a2 == 0xE800000000000000;
  if (v2 || (sub_23A521E18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x707954746E657665 && a2 == 0xE900000000000065 || (sub_23A521E18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7372656D6974 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23A521E18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23A517DE8()
{
  uint64_t v0;

  v0 = sub_23A5219A4();
  __swift_allocate_value_buffer(v0, qword_256992BC8);
  __swift_project_value_buffer(v0, (uint64_t)qword_256992BC8);
  sub_23A50D098();
  swift_bridgeObjectRetain();
  return sub_23A521998();
}

uint64_t DTXPCClient.unownedExecutor.getter()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  v1 = sub_23A521BCC();

  return v1;
}

uint64_t DTXPCClient.__allocating_init(environment:xpcEndpoint:)(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = swift_allocObject();
  swift_unknownObjectRelease();
  v3 = *a1;
  *(_BYTE *)(v2 + 24) = 0;
  *(_QWORD *)(v2 + 32) = MEMORY[0x24BEE4B00];
  DTXPCCoder.init()((uint64_t *)(v2 + 40));
  *(_QWORD *)(v2 + 16) = v3;
  *(_QWORD *)(v2 + 56) = 0;
  *(_QWORD *)(v2 + 64) = 0;
  return v2;
}

uint64_t DTXPCClient.init(environment:xpcEndpoint:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;

  swift_unknownObjectRelease();
  v3 = *a1;
  *(_BYTE *)(v1 + 24) = 0;
  *(_QWORD *)(v1 + 32) = MEMORY[0x24BEE4B00];
  DTXPCCoder.init()((uint64_t *)(v1 + 40));
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v1 + 56) = 0;
  *(_QWORD *)(v1 + 64) = 0;
  return v1;
}

Swift::Void __swiftcall DTXPCClient.invalidate()()
{
  uint64_t v0;
  _xpc_connection_s *v1;

  *(_BYTE *)(v0 + 24) = 1;
  v1 = *(_xpc_connection_s **)(v0 + 56);
  if (v1)
    xpc_connection_cancel(v1);
}

uint64_t default argument 1 of DTXPCClient.monitorStart(client:restart:completionHandler:)()
{
  return 0;
}

uint64_t DTXPCClient.monitorStart(client:restart:completionHandler:)(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v23 = a3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B310);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v22 - v12;
  v29 = *(_QWORD *)(v4 + 16);
  v24 = DTEnvironmentValues.dispatchQueue.getter();
  v14 = sub_23A521B48();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v4;
  *(_QWORD *)(v16 + 24) = a1;
  *(_BYTE *)(v16 + 32) = a2;
  *(_QWORD *)(v16 + 40) = v23;
  *(_QWORD *)(v16 + 48) = a4;
  sub_23A51C9C0((uint64_t)v13, (uint64_t)v11, &qword_25698B310);
  v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v11, 1, v14);
  swift_retain();
  v18 = a1;
  swift_retain();
  if (v17 == 1)
  {
    sub_23A506A9C((uint64_t)v11, &qword_25698B310);
  }
  else
  {
    sub_23A521B3C();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v14);
  }
  v19 = sub_23A51CD78(&qword_25698B328, 255, (uint64_t (*)(uint64_t))sub_23A5186FC, (uint64_t)&_sSo33OS_dispatch_queue_serial_executorCSch17DistributedTimersMc);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = &unk_25698B320;
  *(_QWORD *)(v20 + 24) = v16;
  v25 = 6;
  v26 = 0;
  v27 = v24;
  v28 = v19;
  swift_task_create();
  return swift_release();
}

uint64_t sub_23A5181B0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v6[18] = a5;
  v6[19] = a6;
  v6[17] = a2;
  v9 = sub_23A5219D4();
  v6[20] = v9;
  v6[21] = *(_QWORD *)(v9 - 8);
  v6[22] = swift_task_alloc();
  v10 = sub_23A5219EC();
  v6[23] = v10;
  v6[24] = *(_QWORD *)(v10 - 8);
  v6[25] = swift_task_alloc();
  v11 = (_QWORD *)swift_task_alloc();
  v6[26] = v11;
  *v11 = v6;
  v11[1] = sub_23A518278;
  return DTXPCClient._monitorStart(client:restart:)((uint64_t)(v6 + 14), a3, a4);
}

uint64_t sub_23A518278()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 216) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A5182DC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;

  v1 = v0[25];
  v2 = v0[22];
  v12 = v0[24];
  v13 = v0[23];
  v4 = v0[20];
  v3 = v0[21];
  v6 = v0[18];
  v5 = v0[19];
  v7 = v0[14];
  v8 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v6;
  v9[3] = v5;
  v9[4] = v7;
  v0[12] = sub_23A51F12C;
  v0[13] = v9;
  v0[8] = MEMORY[0x24BDAC760];
  v0[9] = 1107296256;
  v0[10] = sub_23A5076AC;
  v0[11] = &block_descriptor_119;
  v10 = _Block_copy(v0 + 8);
  swift_retain();
  sub_23A5219E0();
  v0[16] = MEMORY[0x24BEE4AF8];
  sub_23A51CD78(&qword_25698AEF8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25698B4B0);
  sub_23A50C160();
  sub_23A521C2C();
  MEMORY[0x23B850240](0, v1, v2, v10);
  _Block_release(v10);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v13);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_23A51848C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = (void *)v0[27];
  v2 = v0[25];
  v3 = v0[22];
  v13 = v0[24];
  v14 = v0[23];
  v4 = v0[20];
  v12 = v0[21];
  v5 = v0[18];
  v6 = v0[19];
  v7 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v5;
  v8[3] = v6;
  v8[4] = v1;
  v0[6] = sub_23A51F094;
  v0[7] = v8;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  v0[4] = sub_23A5076AC;
  v0[5] = &block_descriptor_112;
  v9 = _Block_copy(v0 + 2);
  swift_retain();
  v10 = v1;
  sub_23A5219E0();
  v0[15] = MEMORY[0x24BEE4AF8];
  sub_23A51CD78(&qword_25698AEF8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25698B4B0);
  sub_23A50C160();
  sub_23A521C2C();
  MEMORY[0x23B850240](0, v2, v3, v9);
  _Block_release(v9);

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v2, v14);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_23A518654()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A518688()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(_BYTE *)(v0 + 32);
  v6 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 48);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_23A51F17C;
  return sub_23A5181B0((uint64_t)v7, v2, v3, v4, v6, v5);
}

unint64_t sub_23A5186FC()
{
  unint64_t result;

  result = qword_25698B330;
  if (!qword_25698B330)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25698B330);
  }
  return result;
}

uint64_t DTXPCClient._monitorStart(client:restart:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v4 + 104) = a2;
  *(_QWORD *)(v4 + 112) = v3;
  *(_BYTE *)(v4 + 65) = a3;
  *(_QWORD *)(v4 + 96) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698B350);
  *(_QWORD *)(v4 + 120) = swift_task_alloc();
  *(_QWORD *)(v4 + 128) = sub_23A51CD78(&qword_25698B358, v5, (uint64_t (*)(uint64_t))type metadata accessor for DTXPCClient, (uint64_t)&protocol conformance descriptor for DTXPCClient);
  *(_QWORD *)(v4 + 136) = sub_23A521AF4();
  *(_QWORD *)(v4 + 144) = v6;
  return swift_task_switch();
}

uint64_t sub_23A5187D4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  __n128 v15;
  uint64_t v16;
  char v17;
  _QWORD v18[3];

  if ((*(_BYTE *)(v0 + 65) & 1) == 0)
  {
    v1 = *(_QWORD *)(v0 + 120);
    v2 = *(char **)(v0 + 104);
    v3 = *(_QWORD *)&v2[OBJC_IVAR___DTTimerClient__clientID];
    type metadata accessor for DTTimerClient(0);
    v4 = v2;
    sub_23A521980();
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B360);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v1, 0, 1, v5);
    swift_beginAccess();
    sub_23A518A60(v1, v3);
    swift_endAccess();
  }
  v7 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD *)(v0 + 112);
  DTMonitorContext.init(clientID:)(*(_QWORD *)(v7 + OBJC_IVAR___DTTimerClient__clientID), &v15);
  v15.n128_u64[1] = 0;
  v16 = 0;
  v17 = 6;
  v8 = v7 + OBJC_IVAR___DTTimerClient__requestContext;
  v9 = *(_QWORD *)(v7 + OBJC_IVAR___DTTimerClient__requestContext);
  v10 = *(_QWORD *)(v7 + OBJC_IVAR___DTTimerClient__requestContext + 8);
  v11 = *(_QWORD *)(v8 + 16);
  v18[0] = v9;
  v18[1] = v10;
  v18[2] = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  DTXPCRequest.init(request:context:)(&v15, (uint64_t)v18, v0 + 16);
  v12 = swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v12;
  *(_QWORD *)(v12 + 16) = v6;
  *(_QWORD *)(v12 + 24) = v0 + 16;
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 160) = v13;
  *v13 = v0;
  v13[1] = sub_23A518988;
  return sub_23A521E24();
}

uint64_t sub_23A518988()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 168) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  sub_23A51C7AC(v2 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A518A14()
{
  uint64_t v0;

  sub_23A51C7AC(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A518A60(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B350);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B360);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_23A506A9C(a1, &qword_25698B350);
    v13 = sub_23A51DE7C(a2);
    if ((v14 & 1) != 0)
    {
      v15 = v13;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v17 = *v3;
      v22 = *v3;
      *v3 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_23A51E600();
        v17 = v22;
      }
      (*(void (**)(char *, unint64_t, uint64_t))(v10 + 32))(v8, *(_QWORD *)(v17 + 56) + *(_QWORD *)(v10 + 72) * v15, v9);
      sub_23A51E1E0(v15, v17);
      *v3 = v17;
      swift_bridgeObjectRelease();
      v18 = 0;
    }
    else
    {
      v18 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v18, 1, v9);
    return sub_23A506A9C((uint64_t)v8, &qword_25698B350);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    v19 = swift_isUniquelyReferenced_nonNull_native();
    v22 = *v3;
    *v3 = 0x8000000000000000;
    sub_23A51E3AC((uint64_t)v12, a2, v19);
    *v3 = v22;
    return swift_bridgeObjectRelease();
  }
}

uint64_t DTXPCClient.send<A>(request:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  *(_QWORD *)(v5 + 88) = a4;
  *(_QWORD *)(v5 + 96) = v4;
  *(_QWORD *)(v5 + 72) = a1;
  *(_QWORD *)(v5 + 80) = a3;
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v5 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 32) = v6;
  *(_OWORD *)(v5 + 48) = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(v5 + 64) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(v5 + 104) = sub_23A51CD78(&qword_25698B358, a2, (uint64_t (*)(uint64_t))type metadata accessor for DTXPCClient, (uint64_t)&protocol conformance descriptor for DTXPCClient);
  *(_QWORD *)(v5 + 112) = sub_23A521AF4();
  *(_QWORD *)(v5 + 120) = v7;
  return swift_task_switch();
}

uint64_t sub_23A518CC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v2;
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 80);
  *(_QWORD *)(v2 + 32) = v1;
  *(_QWORD *)(v2 + 40) = v0 + 16;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v3;
  *v3 = v0;
  v3[1] = sub_23A518D78;
  return sub_23A521E24();
}

uint64_t sub_23A518D78()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 144) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A518DE8()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DTXPCClient.monitorStop(client:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
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

  v26 = a2;
  v27 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B310);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v24 - v9;
  v25 = *(_QWORD *)(a1 + OBJC_IVAR___DTTimerClient__clientID);
  v11 = a1 + OBJC_IVAR___DTTimerClient__requestContext;
  v13 = *(_QWORD *)(a1 + OBJC_IVAR___DTTimerClient__requestContext);
  v12 = *(_QWORD *)(a1 + OBJC_IVAR___DTTimerClient__requestContext + 8);
  v14 = *(_QWORD *)(v11 + 16);
  v33 = *(_QWORD *)(v3 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v28 = DTEnvironmentValues.dispatchQueue.getter();
  v15 = sub_23A521B48();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v10, 1, 1, v15);
  v17 = (_QWORD *)swift_allocObject();
  v18 = v25;
  v17[2] = v3;
  v17[3] = v18;
  v17[4] = v13;
  v17[5] = v12;
  v19 = v26;
  v20 = v27;
  v17[6] = v14;
  v17[7] = v19;
  v17[8] = v20;
  sub_23A51C9C0((uint64_t)v10, (uint64_t)v8, &qword_25698B310);
  LODWORD(v12) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v8, 1, v15);
  swift_retain();
  swift_retain();
  if ((_DWORD)v12 == 1)
  {
    sub_23A506A9C((uint64_t)v8, &qword_25698B310);
  }
  else
  {
    sub_23A521B3C();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v15);
  }
  v21 = sub_23A51CD78(&qword_25698B328, 255, (uint64_t (*)(uint64_t))sub_23A5186FC, (uint64_t)&_sSo33OS_dispatch_queue_serial_executorCSch17DistributedTimersMc);
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = &unk_25698B378;
  *(_QWORD *)(v22 + 24) = v17;
  v29 = 6;
  v30 = 0;
  v31 = v28;
  v32 = v21;
  swift_task_create();
  return swift_release();
}

uint64_t sub_23A519060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  v8[20] = a7;
  v8[21] = a8;
  v8[19] = a2;
  v13 = sub_23A5219D4();
  v8[22] = v13;
  v8[23] = *(_QWORD *)(v13 - 8);
  v8[24] = swift_task_alloc();
  v14 = sub_23A5219EC();
  v8[25] = v14;
  v8[26] = *(_QWORD *)(v14 - 8);
  v8[27] = swift_task_alloc();
  v8[14] = a4;
  v8[15] = a5;
  v8[16] = a6;
  v15 = (_QWORD *)swift_task_alloc();
  v8[28] = v15;
  *v15 = v8;
  v15[1] = sub_23A519134;
  return DTXPCClient._monitorStop(clientID:context:)(a3, (uint64_t)(v8 + 14));
}

uint64_t sub_23A519134()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 232) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A519198()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;

  v1 = v0[27];
  v2 = v0[24];
  v11 = v0[26];
  v12 = v0[25];
  v4 = v0[22];
  v3 = v0[23];
  v6 = v0[20];
  v5 = v0[21];
  v7 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  *(_QWORD *)(v8 + 24) = v5;
  v0[12] = sub_23A51E9A8;
  v0[13] = v8;
  v0[8] = MEMORY[0x24BDAC760];
  v0[9] = 1107296256;
  v0[10] = sub_23A5076AC;
  v0[11] = &block_descriptor_93;
  v9 = _Block_copy(v0 + 8);
  swift_retain();
  sub_23A5219E0();
  v0[18] = MEMORY[0x24BEE4AF8];
  sub_23A51CD78(&qword_25698AEF8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25698B4B0);
  sub_23A50C160();
  sub_23A521C2C();
  MEMORY[0x23B850240](0, v1, v2, v9);
  _Block_release(v9);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v12);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_23A519340()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = (void *)v0[29];
  v2 = v0[27];
  v3 = v0[24];
  v13 = v0[26];
  v14 = v0[25];
  v4 = v0[22];
  v12 = v0[23];
  v5 = v0[20];
  v6 = v0[21];
  v7 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v5;
  v8[3] = v6;
  v8[4] = v1;
  v0[6] = sub_23A51CD74;
  v0[7] = v8;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  v0[4] = sub_23A5076AC;
  v0[5] = &block_descriptor_86;
  v9 = _Block_copy(v0 + 2);
  swift_retain();
  v10 = v1;
  sub_23A5219E0();
  v0[17] = MEMORY[0x24BEE4AF8];
  sub_23A51CD78(&qword_25698AEF8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25698B4B0);
  sub_23A50C160();
  sub_23A521C2C();
  MEMORY[0x23B850240](0, v2, v3, v9);
  _Block_release(v9);

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v2, v14);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t DTXPCClient._monitorStop(clientID:context:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v3 + 96) = a1;
  *(_QWORD *)(v3 + 104) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698B350);
  *(_QWORD *)(v3 + 112) = swift_task_alloc();
  *(_OWORD *)(v3 + 120) = *(_OWORD *)a2;
  *(_QWORD *)(v3 + 136) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(v3 + 144) = sub_23A51CD78(&qword_25698B358, v5, (uint64_t (*)(uint64_t))type metadata accessor for DTXPCClient, (uint64_t)&protocol conformance descriptor for DTXPCClient);
  *(_QWORD *)(v3 + 152) = sub_23A521AF4();
  *(_QWORD *)(v3 + 160) = v6;
  return swift_task_switch();
}

uint64_t sub_23A5195B8()
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
  _QWORD *v9;
  __n128 v11;
  uint64_t v12;
  char v13;
  _QWORD v14[3];

  v1 = v0[17];
  v2 = v0[15];
  v3 = v0[16];
  v5 = v0[13];
  v4 = v0[14];
  v6 = v0[12];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B360);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v4, 1, 1, v7);
  swift_beginAccess();
  sub_23A518A60(v4, v6);
  swift_endAccess();
  DTMonitorContext.init(clientID:)(v6, &v11);
  v11.n128_u64[1] = 0;
  v12 = 0;
  v13 = 7;
  v14[0] = v2;
  v14[1] = v3;
  v14[2] = v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  DTXPCRequest.init(request:context:)(&v11, (uint64_t)v14, (uint64_t)(v0 + 2));
  v8 = swift_task_alloc();
  v0[21] = v8;
  *(_QWORD *)(v8 + 16) = v5;
  *(_QWORD *)(v8 + 24) = v0 + 2;
  v9 = (_QWORD *)swift_task_alloc();
  v0[22] = v9;
  *v9 = v0;
  v9[1] = sub_23A519724;
  return sub_23A521E24();
}

uint64_t sub_23A519724()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 184) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    sub_23A51C7AC(v2 + 16);
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_23A51979C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A5197D0()
{
  uint64_t v0;

  sub_23A51C7AC(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DTXPCClient._monitorEvent(_:)(uint64_t **a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t **v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t result;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t *v40;
  int64_t v41;
  uint64_t *v42;
  uint64_t *v43[3];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B360);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B390);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (uint64_t **)((char *)&v35 - v11);
  v42 = *a1;
  v13 = a1[1];
  v39 = a1[2];
  v40 = v13;
  swift_beginAccess();
  v14 = *(_QWORD *)(v1 + 32);
  v15 = *(_QWORD *)(v14 + 64);
  v38 = v14 + 64;
  v16 = 1 << *(_BYTE *)(v14 + 32);
  v17 = -1;
  if (v16 < 64)
    v17 = ~(-1 << v16);
  v18 = v17 & v15;
  v19 = (unint64_t)(v16 + 63) >> 6;
  v35 = v19 - 1;
  result = swift_bridgeObjectRetain();
  v21 = 0;
  v41 = v19;
  v36 = v14 + 104;
  v37 = v19 - 5;
  while (1)
  {
    if (v18)
    {
      v22 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v23 = v22 | (v21 << 6);
      goto LABEL_7;
    }
    v27 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v27 >= v41)
    {
      v29 = v21;
    }
    else
    {
      v28 = *(_QWORD *)(v38 + 8 * v27);
      if (v28)
        goto LABEL_11;
      v29 = v21 + 1;
      if ((uint64_t)(v21 + 2) < v41)
      {
        v28 = *(_QWORD *)(v38 + 8 * (v21 + 2));
        if (v28)
        {
          v27 = v21 + 2;
          goto LABEL_11;
        }
        v29 = v21 + 2;
        if ((uint64_t)(v21 + 3) < v41)
        {
          v28 = *(_QWORD *)(v38 + 8 * (v21 + 3));
          if (v28)
          {
            v27 = v21 + 3;
LABEL_11:
            v18 = (v28 - 1) & v28;
            v23 = __clz(__rbit64(v28)) + (v27 << 6);
            v21 = v27;
LABEL_7:
            v24 = *(_QWORD *)(v14 + 56);
            *(_QWORD *)v10 = *(_QWORD *)(*(_QWORD *)(v14 + 48) + 8 * v23);
            v25 = v24 + *(_QWORD *)(v4 + 72) * v23;
            v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B398);
            (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(&v10[*(int *)(v26 + 48)], v25, v3);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v10, 0, 1, v26);
            goto LABEL_14;
          }
          v27 = v21 + 4;
          v29 = v21 + 3;
          if ((uint64_t)(v21 + 4) < v41)
          {
            v28 = *(_QWORD *)(v38 + 8 * v27);
            if (v28)
              goto LABEL_11;
            while (v37 != v21)
            {
              v28 = *(_QWORD *)(v36 + 8 * v21++);
              if (v28)
              {
                v27 = v21 + 4;
                goto LABEL_11;
              }
            }
            v29 = v35;
          }
        }
      }
    }
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B398);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v10, 1, 1, v30);
    v18 = 0;
    v21 = v29;
LABEL_14:
    sub_23A51C9C0((uint64_t)v10, (uint64_t)v12, &qword_25698B390);
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B398);
    if ((*(unsigned int (**)(uint64_t **, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 48))(v12, 1, v31) == 1)
      return swift_release();
    v32 = *v12;
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, (char *)v12 + *(int *)(v31 + 48), v3);
    if (v32 == v42)
    {
      v33 = sub_23A521974();
      if (v33)
      {
        v34 = (void *)v33;
        v43[0] = v42;
        v43[1] = v40;
        v43[2] = v39;
        DTTimerClient._monitorEvent(_:)(v43);

      }
    }
    result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __break(1u);
  return result;
}

void sub_23A519BB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  _xpc_connection_s *v23;
  _xpc_connection_s *v24;
  __int128 v25;
  xpc_object_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  __int128 aBlock;
  __int128 v37;
  __int128 v38;
  char v39;
  uint64_t v40[2];
  uint64_t v41;

  v9 = v7;
  v41 = a3;
  v12 = v6[5];
  v11 = v6[6];
  if (qword_256992BC0 != -1)
    swift_once();
  v13 = sub_23A5219A4();
  __swift_project_value_buffer(v13, (uint64_t)qword_256992BC8);
  sub_23A51CA04(a1);
  sub_23A51CA04(a1);
  v14 = sub_23A52198C();
  v15 = sub_23A521B78();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v31 = a6;
    v17 = swift_slowAlloc();
    v40[0] = v17;
    *(_DWORD *)v16 = 136315138;
    v18 = *(_OWORD *)(a1 + 16);
    aBlock = *(_OWORD *)a1;
    v37 = v18;
    v38 = *(_OWORD *)(a1 + 32);
    v39 = *(_BYTE *)(a1 + 48);
    sub_23A51CB30();
    v19 = sub_23A521DE8();
    *(_QWORD *)&aBlock = sub_23A4FEAB8(v19, v20, v40);
    sub_23A521BF0();
    swift_bridgeObjectRelease();
    sub_23A51C7AC(a1);
    sub_23A51C7AC(a1);
    _os_log_impl(&dword_23A4FA000, v14, v15, "XPC request start: %s", v16, 0xCu);
    swift_arrayDestroy();
    v21 = v17;
    a6 = v31;
    MEMORY[0x23B8509A8](v21, -1, -1);
    v22 = v16;
    v9 = v7;
    MEMORY[0x23B8509A8](v22, -1, -1);
  }
  else
  {
    sub_23A51C7AC(a1);
    sub_23A51C7AC(a1);
  }

  v23 = sub_23A51A2B8();
  if (!v9)
  {
    v24 = v23;
    v40[0] = v12;
    v40[1] = v11;
    v25 = *(_OWORD *)(a1 + 16);
    aBlock = *(_OWORD *)a1;
    v37 = v25;
    v38 = *(_OWORD *)(a1 + 32);
    v39 = *(_BYTE *)(a1 + 48);
    sub_23A51CA64();
    v26 = DTXPCCoder.encode<A>(_:)();
    *(_QWORD *)&aBlock = v6[2];
    v33 = v26;
    v32 = DTEnvironmentValues.dispatchQueue.getter();
    v27 = swift_allocObject();
    *(_QWORD *)(v27 + 16) = v12;
    *(_QWORD *)(v27 + 24) = v11;
    v28 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v27 + 32) = *(_OWORD *)a1;
    *(_OWORD *)(v27 + 48) = v28;
    *(_OWORD *)(v27 + 64) = *(_OWORD *)(a1 + 32);
    *(_BYTE *)(v27 + 80) = *(_BYTE *)(a1 + 48);
    v29 = v41;
    *(_QWORD *)(v27 + 88) = a2;
    *(_QWORD *)(v27 + 96) = v29;
    *(_QWORD *)(v27 + 104) = v6;
    *(_QWORD *)&v38 = a5;
    *((_QWORD *)&v38 + 1) = v27;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v37 = sub_23A51AAE4;
    *((_QWORD *)&v37 + 1) = a6;
    v30 = _Block_copy(&aBlock);
    sub_23A51CA04(a1);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    xpc_connection_send_message_with_reply(v24, v33, v32, v30);
    _Block_release(v30);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

  }
}

void DTXPCClient.send<A>(request:replyHandler:)(__int128 *a1, uint64_t a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  _xpc_connection_s *v20;
  _xpc_connection_s *v21;
  xpc_object_t v22;
  uint64_t v23;
  __int128 v24;
  void *v25;
  uint64_t v26;
  dispatch_queue_t replyq;
  NSObject *replyqa;
  __int128 aBlock;
  __int128 v32;
  __int128 v33;
  char v34;
  uint64_t v35[2];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  char v39;
  uint64_t v40;

  v40 = a2;
  v8 = a1[1];
  v36 = *a1;
  v37 = v8;
  v38 = a1[2];
  v39 = *((_BYTE *)a1 + 48);
  v10 = *(_QWORD *)(v5 + 40);
  v9 = *(_QWORD *)(v5 + 48);
  if (qword_256992BC0 != -1)
    swift_once();
  v11 = sub_23A5219A4();
  __swift_project_value_buffer(v11, (uint64_t)qword_256992BC8);
  sub_23A51CA04((uint64_t)&v36);
  sub_23A51CA04((uint64_t)&v36);
  v12 = sub_23A52198C();
  v13 = sub_23A521B78();
  if (os_log_type_enabled(v12, v13))
  {
    v26 = v9;
    v14 = (uint8_t *)swift_slowAlloc();
    replyq = a3;
    v15 = swift_slowAlloc();
    v35[0] = v15;
    *(_DWORD *)v14 = 136315138;
    *((_QWORD *)&aBlock + 1) = *((_QWORD *)&v36 + 1);
    v32 = v37;
    v33 = v38;
    v34 = v39;
    sub_23A51CB30();
    v16 = sub_23A521DE8();
    *(_QWORD *)&aBlock = sub_23A4FEAB8(v16, v17, v35);
    sub_23A521BF0();
    swift_bridgeObjectRelease();
    sub_23A51C7AC((uint64_t)&v36);
    sub_23A51C7AC((uint64_t)&v36);
    _os_log_impl(&dword_23A4FA000, v12, v13, "XPC request start: %s", v14, 0xCu);
    swift_arrayDestroy();
    v18 = v15;
    a3 = replyq;
    MEMORY[0x23B8509A8](v18, -1, -1);
    v19 = v14;
    v9 = v26;
    MEMORY[0x23B8509A8](v19, -1, -1);
  }
  else
  {
    sub_23A51C7AC((uint64_t)&v36);
    sub_23A51C7AC((uint64_t)&v36);
  }

  v20 = sub_23A51A2B8();
  if (!v6)
  {
    v21 = v20;
    v35[0] = v10;
    v35[1] = v9;
    aBlock = v36;
    v32 = v37;
    v33 = v38;
    v34 = v39;
    sub_23A51CA64();
    v22 = DTXPCCoder.encode<A>(_:)();
    replyqa = DTEnvironmentValues.dispatchQueue.getter();
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = a4;
    *(_QWORD *)(v23 + 24) = a5;
    *(_QWORD *)(v23 + 32) = v10;
    *(_QWORD *)(v23 + 40) = v9;
    v24 = v37;
    *(_OWORD *)(v23 + 48) = v36;
    *(_OWORD *)(v23 + 64) = v24;
    *(_OWORD *)(v23 + 80) = v38;
    *(_BYTE *)(v23 + 96) = v39;
    *(_QWORD *)(v23 + 104) = v40;
    *(_QWORD *)(v23 + 112) = a3;
    *(_QWORD *)(v23 + 120) = v5;
    *(_QWORD *)&v33 = sub_23A51CB04;
    *((_QWORD *)&v33 + 1) = v23;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v32 = sub_23A51AAE4;
    *((_QWORD *)&v32 + 1) = &block_descriptor_0;
    v25 = _Block_copy(&aBlock);
    sub_23A51CA04((uint64_t)&v36);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    xpc_connection_send_message_with_reply(v21, v22, replyqa, v25);
    _Block_release(v25);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

  }
}

_xpc_connection_s *sub_23A51A2B8()
{
  _QWORD *v0;
  _xpc_connection_s *mach_service;
  _QWORD *v2;
  _xpc_endpoint_s *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[6];

  if (v0[7])
  {
    mach_service = (_xpc_connection_s *)v0[7];
  }
  else
  {
    v2 = v0;
    if (v0[8])
    {
      v3 = (_xpc_endpoint_s *)swift_unknownObjectRetain();
      mach_service = xpc_connection_create_from_endpoint(v3);
      v10[0] = v0[2];
      swift_unknownObjectRetain();
      v4 = DTEnvironmentValues.dispatchQueue.getter();
      xpc_connection_set_target_queue(mach_service, v4);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();

    }
    else
    {
      sub_23A50D0F8();
      v10[0] = v0[2];
      swift_bridgeObjectRetain();
      v5 = DTEnvironmentValues.dispatchQueue.getter();
      v6 = sub_23A521A34();
      swift_bridgeObjectRelease();
      mach_service = xpc_connection_create_mach_service((const char *)(v6 + 32), v5, 0);

      swift_release();
    }
    v2[7] = mach_service;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    v7 = swift_allocObject();
    swift_weakInit();
    v10[4] = sub_23A51D320;
    v10[5] = v7;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 1107296256;
    v10[2] = sub_23A51AAE4;
    v10[3] = &block_descriptor_71;
    v8 = _Block_copy(v10);
    swift_release();
    xpc_connection_set_event_handler(mach_service, v8);
    _Block_release(v8);
    xpc_connection_activate(mach_service);
  }
  swift_unknownObjectRetain();
  return mach_service;
}

uint64_t sub_23A51A45C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *), uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void **v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  unint64_t v47;
  uint8_t *v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(char *);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  char v62;
  uint64_t v63[2];

  v52 = a6;
  v53 = a5;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25698B4C8);
  v14 = sub_23A521E78();
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (void **)((char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v50 - v19;
  v54 = a7;
  v55 = a8;
  v21 = v18;
  v56 = a2;
  v57 = a3;
  v58 = a1;
  v23 = v22;
  sub_23A51A9C8((void (*)(_BYTE *))sub_23A51D2B4, (uint64_t)&v50 - v19);
  (*(void (**)(void **, char *, uint64_t))(v23 + 16))(v17, v20, v21);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v24 = *v17;
    if (qword_256992BC0 != -1)
      swift_once();
    v25 = sub_23A5219A4();
    __swift_project_value_buffer(v25, (uint64_t)qword_256992BC8);
    sub_23A51CA04(a4);
    v26 = v24;
    sub_23A51CA04(a4);
    v27 = v24;
    v28 = sub_23A52198C();
    v29 = sub_23A521B84();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = swift_slowAlloc();
      v31 = swift_slowAlloc();
      v51 = v21;
      v32 = v31;
      v63[0] = v31;
      *(_DWORD *)v30 = 136315394;
      v50 = v23;
      v33 = *(_OWORD *)(a4 + 16);
      v59 = *(_OWORD *)a4;
      v60 = v33;
      v61 = *(_OWORD *)(a4 + 32);
      v62 = *(_BYTE *)(a4 + 48);
      sub_23A51CB30();
      v34 = sub_23A521DE8();
      *(_QWORD *)&v59 = sub_23A4FEAB8(v34, v35, v63);
      sub_23A521BF0();
      swift_bridgeObjectRelease();
      sub_23A51C7AC(a4);
      sub_23A51C7AC(a4);
      *(_WORD *)(v30 + 12) = 2080;
      swift_getErrorValue();
      v36 = sub_23A521E3C();
      *(_QWORD *)&v59 = sub_23A4FEAB8(v36, v37, v63);
      v23 = v50;
      sub_23A521BF0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23A4FA000, v28, v29, "### Request failed: %s, error=%s", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      v38 = v32;
      v21 = v51;
      MEMORY[0x23B8509A8](v38, -1, -1);
      MEMORY[0x23B8509A8](v30, -1, -1);

    }
    else
    {

      sub_23A51C7AC(a4);
      sub_23A51C7AC(a4);

    }
  }
  else
  {
    if (qword_256992BC0 != -1)
      swift_once();
    v39 = sub_23A5219A4();
    __swift_project_value_buffer(v39, (uint64_t)qword_256992BC8);
    sub_23A51CA04(a4);
    sub_23A51CA04(a4);
    v40 = sub_23A52198C();
    v41 = sub_23A521B78();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = swift_slowAlloc();
      v51 = v21;
      v43 = (uint8_t *)v42;
      v44 = swift_slowAlloc();
      v63[0] = v44;
      v50 = v23;
      *(_DWORD *)v43 = 136315138;
      v45 = *(_OWORD *)(a4 + 16);
      v59 = *(_OWORD *)a4;
      v60 = v45;
      v61 = *(_OWORD *)(a4 + 32);
      v62 = *(_BYTE *)(a4 + 48);
      sub_23A51CB30();
      v46 = sub_23A521DE8();
      *(_QWORD *)&v59 = sub_23A4FEAB8(v46, v47, v63);
      v23 = v50;
      sub_23A521BF0();
      swift_bridgeObjectRelease();
      sub_23A51C7AC(a4);
      sub_23A51C7AC(a4);
      _os_log_impl(&dword_23A4FA000, v40, v41, "XPC request succeeded: %s", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B8509A8](v44, -1, -1);
      v48 = v43;
      v21 = v51;
      MEMORY[0x23B8509A8](v48, -1, -1);
    }
    else
    {
      sub_23A51C7AC(a4);
      sub_23A51C7AC(a4);
    }

    (*(void (**)(void **, uint64_t))(v23 + 8))(v17, v21);
  }
  v53(v20);
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v20, v21);
}

uint64_t sub_23A51A9C8@<X0>(void (*a1)(_BYTE *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE v11[16];

  MEMORY[0x24BDAC7A8](a1);
  v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_23A521E78();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = &v11[-v8];
  a1(v5);
  swift_storeEnumTagMultiPayload();
  return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v7 + 32))(a2, v9, v6);
}

uint64_t sub_23A51AAE4(uint64_t a1)
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

uint64_t sub_23A51AB2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B508);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  v9 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10 + v9, v8, v5);
  sub_23A519BB8(a3, (uint64_t)sub_23A51EB20, v10, (uint64_t)&unk_250B69190, (uint64_t)sub_23A51EBE0, (uint64_t)&block_descriptor_105);
  return swift_release();
}

uint64_t sub_23A51AC4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B500);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  v9 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10 + v9, v8, v5);
  sub_23A519BB8(a3, (uint64_t)sub_23A51E960, v10, (uint64_t)&unk_250B68F38, (uint64_t)sub_23A51CDBC, (uint64_t)&block_descriptor_59);
  return swift_release();
}

uint64_t sub_23A51AD6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  __int128 v13;
  unint64_t v14;
  NSObject *v15;
  _BYTE v17[16];
  __int128 v18[3];
  char v19;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25698B4C8);
  v9 = sub_23A521B18();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = &v17[-v11];
  v13 = *(_OWORD *)(a3 + 16);
  v18[0] = *(_OWORD *)a3;
  v18[1] = v13;
  v18[2] = *(_OWORD *)(a3 + 32);
  v19 = *(_BYTE *)(a3 + 48);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v10 + 16))(&v17[-v11], a1, v9);
  v14 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v15 = swift_allocObject();
  v15[2].isa = (Class)a4;
  v15[3].isa = (Class)a5;
  (*(void (**)(char *, _BYTE *, uint64_t))(v10 + 32))((char *)v15 + v14, v12, v9);
  DTXPCClient.send<A>(request:replyHandler:)(v18, (uint64_t)sub_23A51EA4C, v15, a4, a5);
  return swift_release();
}

uint64_t sub_23A51AEC8(uint64_t a1, uint64_t a2)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v8 + 24);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23A521E78();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v18 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)&v18 - v14, a1, v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
    return sub_23A521B00();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v15, v3);
    return sub_23A521B0C();
  }
}

uint64_t DTXPCClient.sendNonisolated<A>(request:replyHandler:)(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char v36;

  v6 = v5;
  v26 = a2;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B310);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v25 - v15;
  v17 = a1[1];
  v33 = *a1;
  v34 = v17;
  v35 = a1[2];
  v36 = *((_BYTE *)a1 + 48);
  v32 = *(_QWORD *)(v6 + 16);
  v27 = DTEnvironmentValues.dispatchQueue.getter();
  v18 = sub_23A521B48();
  v19 = *(_QWORD *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v16, 1, 1, v18);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a4;
  *(_QWORD *)(v20 + 24) = a5;
  *(_QWORD *)(v20 + 32) = v6;
  v21 = v34;
  *(_OWORD *)(v20 + 40) = v33;
  *(_OWORD *)(v20 + 56) = v21;
  *(_OWORD *)(v20 + 72) = v35;
  *(_BYTE *)(v20 + 88) = v36;
  *(_QWORD *)(v20 + 96) = v26;
  *(_QWORD *)(v20 + 104) = a3;
  sub_23A51C9C0((uint64_t)v16, (uint64_t)v14, &qword_25698B310);
  LODWORD(a4) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48))(v14, 1, v18);
  swift_retain();
  sub_23A51CA04((uint64_t)&v33);
  swift_retain();
  if ((_DWORD)a4 == 1)
  {
    sub_23A506A9C((uint64_t)v14, &qword_25698B310);
  }
  else
  {
    sub_23A521B3C();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v18);
  }
  v22 = sub_23A51CD78(&qword_25698B328, 255, (uint64_t (*)(uint64_t))sub_23A5186FC, (uint64_t)&_sSo33OS_dispatch_queue_serial_executorCSch17DistributedTimersMc);
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = &unk_25698B3B8;
  *(_QWORD *)(v23 + 24) = v20;
  v28 = 6;
  v29 = 0;
  v30 = v27;
  v31 = v22;
  swift_task_create();
  return swift_release();
}

uint64_t sub_23A51B270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  *(_QWORD *)(v7 + 152) = a6;
  *(_QWORD *)(v7 + 160) = a7;
  *(_QWORD *)(v7 + 136) = a4;
  *(_QWORD *)(v7 + 144) = a5;
  *(_QWORD *)(v7 + 128) = a2;
  v9 = sub_23A5219D4();
  *(_QWORD *)(v7 + 168) = v9;
  *(_QWORD *)(v7 + 176) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v7 + 184) = swift_task_alloc();
  v10 = sub_23A5219EC();
  *(_QWORD *)(v7 + 192) = v10;
  *(_QWORD *)(v7 + 200) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v7 + 208) = swift_task_alloc();
  v11 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v7 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(v7 + 32) = v11;
  *(_OWORD *)(v7 + 48) = *(_OWORD *)(a3 + 32);
  *(_BYTE *)(v7 + 64) = *(_BYTE *)(a3 + 48);
  type metadata accessor for DTXPCClient();
  sub_23A51CD78(&qword_25698B358, v12, (uint64_t (*)(uint64_t))type metadata accessor for DTXPCClient, (uint64_t)&protocol conformance descriptor for DTXPCClient);
  sub_23A521AF4();
  return swift_task_switch();
}

uint64_t sub_23A51B358()
{
  uint64_t v0;

  DTXPCClient.send<A>(request:replyHandler:)((__int128 *)(v0 + 16), *(_QWORD *)(v0 + 136), *(NSObject **)(v0 + 144), *(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 160));
  *(_QWORD *)(v0 + 216) = 0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A51B3E0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 208);
  v2 = *(void **)(v0 + 216);
  v3 = *(_QWORD *)(v0 + 184);
  v14 = *(_QWORD *)(v0 + 200);
  v15 = *(_QWORD *)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 168);
  v13 = *(_QWORD *)(v0 + 176);
  v5 = *(_QWORD *)(v0 + 136);
  v6 = *(_QWORD *)(v0 + 144);
  v12 = *(_OWORD *)(v0 + 152);
  v7 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = v12;
  *(_QWORD *)(v8 + 32) = v5;
  *(_QWORD *)(v8 + 40) = v6;
  *(_QWORD *)(v8 + 48) = v2;
  *(_QWORD *)(v0 + 104) = sub_23A51D2A4;
  *(_QWORD *)(v0 + 112) = v8;
  *(_QWORD *)(v0 + 72) = MEMORY[0x24BDAC760];
  *(_QWORD *)(v0 + 80) = 1107296256;
  *(_QWORD *)(v0 + 88) = sub_23A5076AC;
  *(_QWORD *)(v0 + 96) = &block_descriptor_65;
  v9 = _Block_copy((const void *)(v0 + 72));
  swift_retain();
  v10 = v2;
  sub_23A5219E0();
  *(_QWORD *)(v0 + 120) = MEMORY[0x24BEE4AF8];
  sub_23A51CD78(&qword_25698AEF8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25698B4B0);
  sub_23A50C160();
  sub_23A521C2C();
  MEMORY[0x23B850240](0, v1, v3, v9);
  _Block_release(v9);

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v1, v15);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A51B5B8(void (*a1)(char *), uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25698B4C8);
  v5 = sub_23A521E78();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - v7;
  *(uint64_t *)((char *)&v11 - v7) = (uint64_t)a3;
  swift_storeEnumTagMultiPayload();
  v9 = a3;
  a1(v8);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t DTXPCClient.send(request:completionHandler:)(__int128 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[6];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B310);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v22 - v11;
  v13 = a1[1];
  v23 = *a1;
  v24 = v13;
  v25 = a1[2];
  v26 = *((_BYTE *)a1 + 48);
  v22[5] = *(_QWORD *)(v3 + 16);
  v22[0] = DTEnvironmentValues.dispatchQueue.getter();
  v14 = sub_23A521B48();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v12, 1, 1, v14);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v3;
  v17 = v24;
  *(_OWORD *)(v16 + 24) = v23;
  *(_OWORD *)(v16 + 40) = v17;
  *(_OWORD *)(v16 + 56) = v25;
  *(_BYTE *)(v16 + 72) = v26;
  *(_QWORD *)(v16 + 80) = a2;
  *(_QWORD *)(v16 + 88) = a3;
  sub_23A51C9C0((uint64_t)v12, (uint64_t)v10, &qword_25698B310);
  v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v10, 1, v14);
  swift_retain();
  sub_23A51CA04((uint64_t)&v23);
  swift_retain();
  if (v18 == 1)
  {
    sub_23A506A9C((uint64_t)v10, &qword_25698B310);
  }
  else
  {
    sub_23A521B3C();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v14);
  }
  v19 = sub_23A51CD78(&qword_25698B328, 255, (uint64_t (*)(uint64_t))sub_23A5186FC, (uint64_t)&_sSo33OS_dispatch_queue_serial_executorCSch17DistributedTimersMc);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = &unk_25698B3D0;
  *(_QWORD *)(v20 + 24) = v16;
  v22[1] = 6;
  v22[2] = 0;
  v22[3] = v22[0];
  v22[4] = v19;
  swift_task_create();
  return swift_release();
}

uint64_t sub_23A51B8B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[11] = a4;
  v5[12] = a5;
  v5[9] = a2;
  v5[10] = a3;
  v6 = sub_23A5219D4();
  v5[13] = v6;
  v5[14] = *(_QWORD *)(v6 - 8);
  v5[15] = swift_task_alloc();
  v7 = sub_23A5219EC();
  v5[16] = v7;
  v5[17] = *(_QWORD *)(v7 - 8);
  v5[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A51B940()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v0[11];
  v1 = v0[12];
  v3 = swift_allocObject();
  v0[19] = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  type metadata accessor for DTXPCClient();
  sub_23A51CD78(&qword_25698B358, v4, (uint64_t (*)(uint64_t))type metadata accessor for DTXPCClient, (uint64_t)&protocol conformance descriptor for DTXPCClient);
  swift_retain();
  sub_23A521AF4();
  return swift_task_switch();
}

uint64_t sub_23A51B9E4()
{
  uint64_t v0;

  sub_23A519BB8(*(_QWORD *)(v0 + 80), (uint64_t)sub_23A51CD04, *(_QWORD *)(v0 + 152), (uint64_t)&unk_250B68F38, (uint64_t)sub_23A51CDBC, (uint64_t)&block_descriptor_59);
  *(_QWORD *)(v0 + 160) = 0;
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A51BA8C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = (void *)v0[20];
  v2 = v0[18];
  v3 = v0[15];
  v13 = v0[17];
  v14 = v0[16];
  v4 = v0[13];
  v12 = v0[14];
  v5 = v0[11];
  v6 = v0[12];
  v7 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v5;
  v8[3] = v6;
  v8[4] = v1;
  v0[6] = sub_23A51CD74;
  v0[7] = v8;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  v0[4] = sub_23A5076AC;
  v0[5] = &block_descriptor_53;
  v9 = _Block_copy(v0 + 2);
  swift_retain();
  v10 = v1;
  sub_23A5219E0();
  v0[8] = MEMORY[0x24BEE4AF8];
  sub_23A51CD78(&qword_25698AEF8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25698B4B0);
  sub_23A50C160();
  sub_23A521C2C();
  MEMORY[0x23B850240](0, v2, v3, v9);
  _Block_release(v9);

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v2, v14);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t static DTXPCClient.sendSync<A>(request:)(__int128 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  char v6;
  uint64_t v7;
  _xpc_connection_s *mach_service;
  void *v9;
  __int128 v10;
  xpc_object_t v11;
  xpc_object_t v12;
  __int128 v14;
  __int128 v15;
  __int128 aBlock;
  __int128 v17;
  uint64_t (*v18)();
  uint64_t v19;
  char v20;
  __int128 v21;
  uint64_t v22;

  v22 = a3;
  v14 = a1[1];
  v15 = *a1;
  v5 = (uint64_t (*)())*((_QWORD *)a1 + 4);
  v4 = *((_QWORD *)a1 + 5);
  v6 = *((_BYTE *)a1 + 48);
  sub_23A50D0F8();
  v7 = sub_23A521A34();
  mach_service = xpc_connection_create_mach_service((const char *)(v7 + 32), 0, 0);
  swift_release();
  v18 = nullsub_1;
  v19 = 0;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v17 = sub_23A51AAE4;
  *((_QWORD *)&v17 + 1) = &block_descriptor_44;
  v9 = _Block_copy(&aBlock);
  xpc_connection_set_event_handler(mach_service, v9);
  _Block_release(v9);
  xpc_connection_activate(mach_service);
  DTXPCCoder.init()((uint64_t *)&aBlock);
  v10 = aBlock;
  v21 = aBlock;
  aBlock = v15;
  v17 = v14;
  v18 = v5;
  v19 = v4;
  v20 = v6;
  sub_23A51CA64();
  v11 = DTXPCCoder.encode<A>(_:)();
  if (v3)
  {
    swift_release();
    swift_release();
  }
  else
  {
    v12 = xpc_connection_send_message_with_reply_sync(mach_service, v11);
    swift_unknownObjectRelease();
    aBlock = v10;
    DTXPCCoder.decode<A>(_:)(v12);
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
  return swift_unknownObjectRelease();
}

uint64_t sub_23A51BE14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t result;
  uint64_t v7;
  _QWORD v8[3];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B4D8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v8[2] = a1;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25698B4E0);
    v7 = sub_23A5218F0();
    MEMORY[0x24BDAC7A8](v7);
    v8[-2] = v5;
    sub_23A51BF3C((uint64_t)sub_23A51D328, (uint64_t)&v8[-4]);
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

uint64_t sub_23A51BF3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  char isEscapingClosureAtFileLocation;

  v5 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  sub_23A521BCC();

  if ((swift_task_isCurrentExecutor() & 1) == 0)
    goto LABEL_6;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_23A51DE5C;
  *(_QWORD *)(v7 + 24) = v6;
  swift_retain();
  sub_23A51DE5C();
  if (v2)
  {
    swift_release();
    return swift_release();
  }
  swift_release();
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
LABEL_6:
    sub_23A521C68();
    sub_23A521A70();
    sub_23A521CB0();
    sub_23A521A70();
    result = sub_23A521CC8();
    __break(1u);
  }
  return result;
}

uint64_t sub_23A51C128()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v36;
  unint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  _QWORD *v40;
  int64_t v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B360);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B390);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (uint64_t *)((char *)&v36 - v10);
  if (qword_256992BC0 != -1)
LABEL_34:
    swift_once();
  v12 = sub_23A5219A4();
  __swift_project_value_buffer(v12, (uint64_t)qword_256992BC8);
  v13 = sub_23A52198C();
  v14 = sub_23A521B84();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_23A4FA000, v13, v14, "### Interrupted", v15, 2u);
    MEMORY[0x23B8509A8](v15, -1, -1);
  }

  swift_beginAccess();
  v1 = (_QWORD *)v1[4];
  v16 = v1[8];
  v40 = v1 + 8;
  v17 = 1 << *((_BYTE *)v1 + 32);
  v18 = -1;
  if (v17 < 64)
    v18 = ~(-1 << v17);
  v19 = v18 & v16;
  v20 = (unint64_t)(v17 + 63) >> 6;
  v37 = v20 - 1;
  swift_bridgeObjectRetain();
  v21 = 0;
  v41 = v20;
  v38 = v1 + 13;
  v39 = v20 - 5;
  while (1)
  {
    if (v19)
    {
      v22 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      v23 = v22 | (v21 << 6);
LABEL_10:
      v24 = v1[7];
      *(_QWORD *)v9 = *(_QWORD *)(v1[6] + 8 * v23);
      v25 = v24 + *(_QWORD *)(v3 + 72) * v23;
      v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B398);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(&v9[*(int *)(v26 + 48)], v25, v2);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v9, 0, 1, v26);
      goto LABEL_17;
    }
    v27 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
      __break(1u);
      goto LABEL_34;
    }
    if (v27 >= v41)
    {
      v29 = v21;
    }
    else
    {
      v28 = v40[v27];
      if (v28)
        goto LABEL_14;
      v29 = v21 + 1;
      if ((uint64_t)(v21 + 2) < v41)
      {
        v28 = v40[v21 + 2];
        if (v28)
        {
          v27 = v21 + 2;
LABEL_14:
          v19 = (v28 - 1) & v28;
          v23 = __clz(__rbit64(v28)) + (v27 << 6);
          v21 = v27;
          goto LABEL_10;
        }
        v29 = v21 + 2;
        if ((uint64_t)(v21 + 3) < v41)
        {
          v28 = v40[v21 + 3];
          if (v28)
          {
            v27 = v21 + 3;
            goto LABEL_14;
          }
          v27 = v21 + 4;
          v29 = v21 + 3;
          if ((uint64_t)(v21 + 4) < v41)
          {
            v28 = v40[v27];
            if (v28)
              goto LABEL_14;
            while (v39 != v21)
            {
              v28 = v38[v21++];
              if (v28)
              {
                v27 = v21 + 4;
                goto LABEL_14;
              }
            }
            v29 = v37;
          }
        }
      }
    }
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B398);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v9, 1, 1, v30);
    v19 = 0;
    v21 = v29;
LABEL_17:
    sub_23A51C9C0((uint64_t)v9, (uint64_t)v11, &qword_25698B390);
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B398);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 48))(v11, 1, v31) == 1)
      return swift_release();
    v32 = *v11;
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, (char *)v11 + *(int *)(v31 + 48), v2);
    v33 = sub_23A521974();
    if (v33)
    {
      v34 = (void *)v33;
      DTMonitorEvent.init(clientID:eventType:timers:)(v32, 3, 0, &v44);
      v42 = v44;
      v43 = v45;
      DTTimerClient._monitorEvent(_:)((uint64_t **)&v42);
      swift_bridgeObjectRelease();
      DTTimerClient._monitorStart(restart:)(1);

    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t DTXPCClient.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t DTXPCClient.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_23A51C610()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  v1 = sub_23A521BCC();

  return v1;
}

uint64_t sub_23A51C664(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A51C6C8;
  return v6(a1);
}

uint64_t sub_23A51C6C8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A51C714(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A51F17C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25698B338 + dword_25698B338))(a1, v4);
}

uint64_t type metadata accessor for DTXPCClient()
{
  return objc_opt_self();
}

uint64_t sub_23A51C7A4(uint64_t a1)
{
  uint64_t v1;

  return sub_23A51AB2C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_23A51C7AC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v2 = *(void **)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_BYTE *)(a1 + 48);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A4FCCC0(v2, v3, v4, v5);
  return a1;
}

uint64_t sub_23A51C80C(uint64_t a1)
{
  uint64_t *v1;

  return sub_23A51AD6C(a1, v1[4], v1[5], v1[2], v1[3]);
}

uint64_t sub_23A51C818()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A51C854()
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
  _QWORD *v9;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = v0[5];
  v6 = v0[6];
  v7 = v0[7];
  v8 = v0[8];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v9;
  *v9 = v1;
  v9[1] = sub_23A51C8DC;
  return sub_23A519060((uint64_t)v9, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_23A51C8DC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A51C924()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A51C948(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A51C8DC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25698B338 + dword_25698B338))(a1, v4);
}

uint64_t sub_23A51C9B8(uint64_t a1)
{
  uint64_t v1;

  return sub_23A51AC4C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_23A51C9C0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23A51CA04(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v2 = *(void **)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_BYTE *)(a1 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A4FCC3C(v2, v3, v4, v5);
  return a1;
}

unint64_t sub_23A51CA64()
{
  unint64_t result;

  result = qword_25698B3A0;
  if (!qword_25698B3A0)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTXPCRequest, &type metadata for DTXPCRequest);
    atomic_store(result, (unint64_t *)&qword_25698B3A0);
  }
  return result;
}

uint64_t sub_23A51CAA8()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A4FCCC0(*(void **)(v0 + 72), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88), *(_BYTE *)(v0 + 96));
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A51CB04(uint64_t a1)
{
  uint64_t v1;

  return sub_23A51A45C(a1, *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), v1 + 48, *(void (**)(char *))(v1 + 104), *(_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
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

unint64_t sub_23A51CB30()
{
  unint64_t result;

  result = qword_25698B3A8;
  if (!qword_25698B3A8)
  {
    result = MEMORY[0x23B850924](&protocol conformance descriptor for DTXPCRequest, &type metadata for DTXPCRequest);
    atomic_store(result, &qword_25698B3A8);
  }
  return result;
}

uint64_t sub_23A51CB74()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A4FCCC0(*(void **)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), *(_BYTE *)(v0 + 88));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A51CBC0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (uint64_t)(v0 + 5);
  v7 = v0[12];
  v6 = v0[13];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v8;
  *v8 = v1;
  v8[1] = sub_23A51F17C;
  return sub_23A51B270((uint64_t)v8, v4, v5, v7, v6, v2, v3);
}

uint64_t sub_23A51CC3C()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A4FCCC0(*(void **)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_BYTE *)(v0 + 72));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A51CC88()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[2];
  v3 = (uint64_t)(v0 + 3);
  v5 = v0[10];
  v4 = v0[11];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_23A51F17C;
  return sub_23A51B8B4((uint64_t)v6, v2, v3, v5, v4);
}

uint64_t method lookup function for DTXPCClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DTXPCClient.__allocating_init(environment:xpcEndpoint:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

void sub_23A51CD04(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(id);
  id v3;
  id v4;

  v2 = *(void (**)(id))(v1 + 16);
  if (*(_BYTE *)(a1 + 8) == 1)
  {
    v3 = *(id *)a1;
    v4 = *(id *)a1;
    v2(v3);
    sub_23A51D26C(v3, 1);
  }
  else
  {
    v2(0);
  }
}

uint64_t sub_23A51CD68()
{
  return objectdestroy_49Tm((void (*)(_QWORD))MEMORY[0x24BEE4CA0]);
}

uint64_t sub_23A51CD78(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x23B850924](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

void sub_23A51CDBC(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void (*v4)(id *);
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  char v14;

  v3 = v1 + 32;
  v4 = *(void (**)(id *))(v1 + 88);
  sub_23A514854();
  DTXPCCoder.decode<A>(_:)(a1);
  v14 = 0;
  if (qword_256992BC0 != -1)
    swift_once();
  v5 = sub_23A5219A4();
  __swift_project_value_buffer(v5, (uint64_t)qword_256992BC8);
  sub_23A51CA04(v3);
  sub_23A51CA04(v3);
  v6 = sub_23A52198C();
  v7 = sub_23A521B78();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v12 = v9;
    *(_DWORD *)v8 = 136315138;
    sub_23A51CB30();
    v10 = sub_23A521DE8();
    sub_23A4FEAB8(v10, v11, &v12);
    sub_23A521BF0();
    swift_bridgeObjectRelease();
    sub_23A51C7AC(v3);
    sub_23A51C7AC(v3);
    _os_log_impl(&dword_23A4FA000, v6, v7, "XPC request succeeded: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B8509A8](v9, -1, -1);
    MEMORY[0x23B8509A8](v8, -1, -1);
  }
  else
  {
    sub_23A51C7AC(v3);
    sub_23A51C7AC(v3);
  }

  v4(&v13);
  sub_23A51D26C(v13, v14);
}

id sub_23A51D260(id result, char a2)
{
  if ((a2 & 1) != 0)
    return result;
  return result;
}

void sub_23A51D26C(id a1, char a2)
{
  if ((a2 & 1) != 0)

}

uint64_t sub_23A51D278()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_23A51D2A4()
{
  uint64_t v0;

  return sub_23A51B5B8(*(void (**)(char *))(v0 + 32), *(_QWORD *)(v0 + 40), *(void **)(v0 + 48));
}

uint64_t sub_23A51D2B4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = DTXPCCoder.decode<A>(_:)(*(void **)(v1 + 48));
  if (v2)
    *a1 = v2;
  return result;
}

uint64_t sub_23A51D2FC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23A51D320(uint64_t a1)
{
  return sub_23A51BE14(a1);
}

void sub_23A51D328(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  char v20;
  _xpc_connection_s *v21;
  xpc_object_t reply;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  char v29;
  uint8_t *v30;
  uint8_t *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  unint64_t v41;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25698B4D8);
  sub_23A5218E4();
  v2 = (void *)v39;
  v3 = MEMORY[0x23B850B28](v39);
  if (v3 == sub_23A5219B0())
  {
    v14 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    *(_QWORD *)&v36 = v14;
    *((_QWORD *)&v36 + 1) = v13;
    sub_23A4FCED8();
    swift_retain();
    swift_retain();
    DTXPCCoder.decode<A>(_:)((void *)v39);
    swift_release();
    swift_release();
    v19 = v40;
    v20 = BYTE8(v40);
    v33 = v39;
    if (BYTE8(v40) == 8)
    {
      v36 = v39;
      v37 = v40;
      v32 = v39;
      swift_bridgeObjectRetain();
      DTXPCClient._monitorEvent(_:)((uint64_t **)&v36);
      sub_23A4FCCC0((void *)v32, *((uint64_t *)&v32 + 1), v19, 8);
      v39 = 0u;
      v40 = 0u;
      v41 = 0;
    }
    else
    {
      *((_QWORD *)&v40 + 1) = &type metadata for DTAckResponse;
      v41 = sub_23A514898();
      DTAckResponse.init()();
    }
    sub_23A51E90C((uint64_t)&v39, (uint64_t)&v34);
    if (v35)
    {
      sub_23A4FF5BC(&v34, (uint64_t)&v36);
      v21 = *(_xpc_connection_s **)(a1 + 56);
      if (v21)
      {
        swift_unknownObjectRetain();
        reply = xpc_dictionary_create_reply(v2);
        if (!reply)
        {
          v25 = v19;
          if (qword_256992BC0 != -1)
            swift_once();
          v26 = sub_23A5219A4();
          __swift_project_value_buffer(v26, (uint64_t)qword_256992BC8);
          v27 = sub_23A52198C();
          v28 = sub_23A521B84();
          if (os_log_type_enabled(v27, v28))
          {
            v29 = v20;
            v30 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v30 = 0;
            _os_log_impl(&dword_23A4FA000, v27, v28, "### XPC create reply failed", v30, 2u);
            v31 = v30;
            v20 = v29;
            MEMORY[0x23B8509A8](v31, -1, -1);
          }

          sub_23A506A9C((uint64_t)&v39, (uint64_t *)&unk_25698B4F0);
          swift_unknownObjectRelease();
          sub_23A4FCCC0((void *)v33, *((uint64_t *)&v33 + 1), v25, v20);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v36);
          goto LABEL_33;
        }
        v23 = reply;
        v24 = __swift_project_boxed_opaque_existential_1(&v36, v38);
        *(_QWORD *)&v34 = v14;
        *((_QWORD *)&v34 + 1) = v13;
        swift_retain();
        swift_retain();
        DTXPCCoder.encode<A>(_:into:)((uint64_t)v24, v23);
        swift_release();
        swift_release();
        xpc_connection_send_message(v21, v23);
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        sub_23A4FCCC0((void *)v33, *((uint64_t *)&v33 + 1), v19, v20);
        sub_23A506A9C((uint64_t)&v39, (uint64_t *)&unk_25698B4F0);
      }
      else
      {
        sub_23A506A9C((uint64_t)&v39, (uint64_t *)&unk_25698B4F0);
        sub_23A4FCCC0((void *)v33, *((uint64_t *)&v33 + 1), v19, v20);
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v36);
    }
    else
    {
      sub_23A506A9C((uint64_t)&v39, (uint64_t *)&unk_25698B4F0);
      sub_23A4FCCC0((void *)v33, *((uint64_t *)&v33 + 1), v19, v20);
      sub_23A506A9C((uint64_t)&v34, (uint64_t *)&unk_25698B4F0);
    }
LABEL_33:
    swift_unknownObjectRelease();
    return;
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  v4 = sub_23A5219C8();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if ((_QWORD)v39 == v4)
  {
    if ((*(_BYTE *)(a1 + 24) & 1) == 0)
      sub_23A51C128();
    goto LABEL_33;
  }
  swift_unknownObjectRetain();
  v5 = sub_23A5219BC();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if ((_QWORD)v39 == v5)
  {
    if ((*(_BYTE *)(a1 + 24) & 1) == 0)
    {
      if (qword_256992BC0 != -1)
        swift_once();
      v15 = sub_23A5219A4();
      __swift_project_value_buffer(v15, (uint64_t)qword_256992BC8);
      v16 = sub_23A52198C();
      v17 = sub_23A521B84();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_23A4FA000, v16, v17, "### Invalidated unexpectedly", v18, 2u);
        MEMORY[0x23B8509A8](v18, -1, -1);
      }

    }
    swift_unknownObjectRelease();
    *(_QWORD *)(a1 + 56) = 0;
    goto LABEL_33;
  }
  if (qword_256992BC0 != -1)
    swift_once();
  v6 = sub_23A5219A4();
  __swift_project_value_buffer(v6, (uint64_t)qword_256992BC8);
  swift_unknownObjectRetain_n();
  v7 = sub_23A52198C();
  v8 = sub_23A521B84();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    *(_QWORD *)&v39 = v10;
    *(_DWORD *)v9 = 136315138;
    v11 = sub_23A521B6C();
    *(_QWORD *)&v36 = sub_23A4FEAB8(v11, v12, (uint64_t *)&v39);
    sub_23A521BF0();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A4FA000, v7, v8, "### XPC event error: error=%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B8509A8](v10, -1, -1);
    MEMORY[0x23B8509A8](v9, -1, -1);
    swift_unknownObjectRelease();

  }
  else
  {

    swift_unknownObjectRelease_n();
  }
}

uint64_t sub_23A51DE4C()
{
  return swift_deallocObject();
}

uint64_t sub_23A51DE5C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_23A51DE7C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A521E48();
  return sub_23A51E564(a1, v2);
}

uint64_t sub_23A51DEAC(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  int v37;
  int64_t v38;
  _QWORD *v39;
  uint64_t v40;

  v3 = v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B360);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698B518);
  result = sub_23A521CEC();
  v11 = result;
  if (*(_QWORD *)(v9 + 16))
  {
    v36 = v3;
    v12 = 0;
    v13 = *(_QWORD *)(v9 + 64);
    v39 = (_QWORD *)(v9 + 64);
    v14 = 1 << *(_BYTE *)(v9 + 32);
    if (v14 < 64)
      v15 = ~(-1 << v14);
    else
      v15 = -1;
    v16 = v15 & v13;
    v38 = (unint64_t)(v14 + 63) >> 6;
    v17 = result + 64;
    v37 = a2;
    v18 = 16;
    if ((a2 & 1) != 0)
      v18 = 32;
    v40 = v18;
    while (1)
    {
      if (v16)
      {
        v20 = __clz(__rbit64(v16));
        v16 &= v16 - 1;
        v21 = v20 | (v12 << 6);
      }
      else
      {
        v22 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = (uint64_t)v39;
        if (v22 >= v38)
          goto LABEL_33;
        v23 = v39[v22];
        ++v12;
        if (!v23)
        {
          v12 = v22 + 1;
          if (v22 + 1 >= v38)
            goto LABEL_33;
          v23 = v39[v12];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_33:
              if ((v37 & 1) == 0)
              {
                result = swift_release();
                v3 = v36;
                goto LABEL_40;
              }
              v34 = 1 << *(_BYTE *)(v9 + 32);
              if (v34 >= 64)
                bzero(v39, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v39 = -1 << v34;
              v3 = v36;
              *(_QWORD *)(v9 + 16) = 0;
              break;
            }
            v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                v12 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_42;
                if (v12 >= v38)
                  goto LABEL_33;
                v23 = v39[v12];
                ++v24;
                if (v23)
                  goto LABEL_23;
              }
            }
            v12 = v24;
          }
        }
LABEL_23:
        v16 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v12 << 6);
      }
      v25 = *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v21);
      v26 = *(_QWORD *)(v6 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + v40))(v8, *(_QWORD *)(v9 + 56) + v26 * v21, v5);
      result = sub_23A521E48();
      v27 = -1 << *(_BYTE *)(v11 + 32);
      v28 = result & ~v27;
      v29 = v28 >> 6;
      if (((-1 << v28) & ~*(_QWORD *)(v17 + 8 * (v28 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v17 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v30 = 0;
        v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v32 = v29 == v31;
          if (v29 == v31)
            v29 = 0;
          v30 |= v32;
          v33 = *(_QWORD *)(v17 + 8 * v29);
        }
        while (v33 == -1);
        v19 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(_QWORD *)(v17 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8 * v19) = v25;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 56) + v26 * v19, v8, v5);
      ++*(_QWORD *)(v11 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v11;
  return result;
}

unint64_t sub_23A51E1E0(unint64_t result, uint64_t a2)
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
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_23A521C38();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = sub_23A521E48();
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
        v16 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25698B360) - 8) + 72);
        v17 = v16 * v3;
        result = v15 + v16 * v3;
        v18 = v16 * v6;
        v19 = v15 + v16 * v6 + v16;
        if (v17 < v18 || result >= v19)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v17 == v18)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    v23 = *v21;
    v22 = (-1 << result) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_23A51E3AC(uint64_t a1, uint64_t a2, char a3)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  unint64_t v20;
  char v21;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_23A51DE7C(a2);
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
      {
LABEL_8:
        v17 = v16[7];
        v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B360);
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v10, a1, v18);
      }
      return sub_23A51E4D4(v10, a2, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_23A51E600();
      goto LABEL_7;
    }
    sub_23A51DEAC(v13, a3 & 1);
    v20 = sub_23A51DE7C(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      v10 = v20;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      return sub_23A51E4D4(v10, a2, a1, v16);
    }
  }
  result = sub_23A521E30();
  __break(1u);
  return result;
}

uint64_t sub_23A51E4D4(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  v7 = a4[7];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B360);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7 + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 72) * a1, a3, v8);
  v10 = a4[2];
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    a4[2] = v12;
  return result;
}

unint64_t sub_23A51E564(uint64_t a1, uint64_t a2)
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

void *sub_23A51E600()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int64_t v25;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B360);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698B518);
  v23 = v0;
  v5 = *v0;
  v6 = sub_23A521CE0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_23:
    result = (void *)swift_release();
    *v23 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v10 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v11 = 1 << *(_BYTE *)(v5 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v5 + 64);
  v24 = v5 + 64;
  v25 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25)
      goto LABEL_23;
    v20 = *(_QWORD *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v25)
        goto LABEL_23;
      v20 = *(_QWORD *)(v24 + 8 * v10);
      if (!v20)
        break;
    }
LABEL_22:
    v13 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v15);
    v18 = *(_QWORD *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 56) + v18, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v16) = v17;
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 56) + v18, v4, v1);
  }
  v21 = v19 + 2;
  if (v21 >= v25)
    goto LABEL_23;
  v20 = *(_QWORD *)(v24 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v25)
      goto LABEL_23;
    v20 = *(_QWORD *)(v24 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_23A51E828(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)a1;
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698B508);
    return sub_23A521B00();
  }
  else
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698B508);
    return sub_23A521B0C();
  }
}

uint64_t sub_23A51E8A0(uint64_t a1)
{
  id v1;

  if (*(_BYTE *)(a1 + 8) == 1)
  {
    v1 = *(id *)a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698B500);
    return sub_23A521B00();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698B500);
    return sub_23A521B0C();
  }
}

uint64_t sub_23A51E90C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25698B4F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A51E954()
{
  return objectdestroy_79Tm(&qword_25698B500);
}

uint64_t sub_23A51E960(uint64_t a1)
{
  return sub_23A51EB34(a1, &qword_25698B500, (uint64_t (*)(uint64_t, uint64_t))sub_23A51E8A0);
}

uint64_t sub_23A51E974()
{
  return objectdestroy_49Tm((void (*)(_QWORD))MEMORY[0x24BEE4CA0]);
}

uint64_t sub_23A51E980()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32));
}

uint64_t sub_23A51E9A8()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(0);
}

uint64_t sub_23A51E9CC()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25698B4C8);
  v1 = sub_23A521B18();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_23A51EA4C(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25698B4C8);
  v2 = sub_23A521B18();
  return sub_23A51AEC8(a1, v2);
}

uint64_t sub_23A51EAB8()
{
  return objectdestroy_79Tm(&qword_25698B508);
}

uint64_t objectdestroy_79Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t sub_23A51EB20(uint64_t a1)
{
  return sub_23A51EB34(a1, &qword_25698B508, (uint64_t (*)(uint64_t, uint64_t))sub_23A51E828);
}

uint64_t sub_23A51EB34(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8) + 80);
  return a3(a1, v3 + ((v5 + 16) & ~v5));
}

uint64_t objectdestroy_55Tm()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A4FCCC0(*(void **)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_BYTE *)(v0 + 80));
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_23A51EBE0(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void (*v13)(id *);
  uint64_t v14;
  id v15;
  char v16;

  v3 = v1 + 32;
  v13 = *(void (**)(id *))(v1 + 88);
  sub_23A514B28();
  DTXPCCoder.decode<A>(_:)(a1);
  v4 = v15;
  v16 = 0;
  v5 = qword_256992BC0;
  swift_bridgeObjectRetain();
  if (v5 != -1)
    swift_once();
  v6 = sub_23A5219A4();
  __swift_project_value_buffer(v6, (uint64_t)qword_256992BC8);
  sub_23A51CA04(v3);
  sub_23A51CA04(v3);
  v7 = sub_23A52198C();
  v8 = sub_23A521B78();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v14 = v10;
    *(_DWORD *)v9 = 136315138;
    sub_23A51CB30();
    v11 = sub_23A521DE8();
    sub_23A4FEAB8(v11, v12, &v14);
    sub_23A521BF0();
    swift_bridgeObjectRelease();
    sub_23A51C7AC(v3);
    sub_23A51C7AC(v3);
    _os_log_impl(&dword_23A4FA000, v7, v8, "XPC request succeeded: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B8509A8](v10, -1, -1);
    MEMORY[0x23B8509A8](v9, -1, -1);
  }
  else
  {
    sub_23A51C7AC(v3);
    sub_23A51C7AC(v3);
  }

  sub_23A50CF14(v4, 0);
  v13(&v15);
  sub_23A50CF14(v15, v16);
}

uint64_t sub_23A51F088()
{
  return objectdestroy_49Tm((void (*)(_QWORD))MEMORY[0x24BEE4CA0]);
}

void sub_23A51F094()
{
  uint64_t v0;
  void (*v1)(void **);
  void *v2;
  id v3;
  void *v4;
  char v5;

  v1 = *(void (**)(void **))(v0 + 16);
  v2 = *(void **)(v0 + 32);
  v4 = v2;
  v5 = 1;
  v3 = v2;
  v1(&v4);

}

uint64_t sub_23A51F0E8()
{
  return objectdestroy_49Tm((void (*)(_QWORD))MEMORY[0x24BEE4BC0]);
}

uint64_t objectdestroy_49Tm(void (*a1)(_QWORD))
{
  uint64_t v1;

  swift_release();
  a1(*(_QWORD *)(v1 + 32));
  return swift_deallocObject();
}

uint64_t sub_23A51F12C()
{
  uint64_t v0;
  void (*v1)(uint64_t *);
  uint64_t v3;
  char v4;

  v1 = *(void (**)(uint64_t *))(v0 + 16);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = 0;
  swift_bridgeObjectRetain();
  v1(&v3);
  return swift_bridgeObjectRelease();
}

DistributedTimers::DTEnvironmentValues __swiftcall DTEnvironmentValues.init()()
{
  DistributedTimers::DTEnvironmentValues *v0;
  DistributedTimers::DTEnvironmentValues *v1;
  DistributedTimers::DTEnvironmentValues result;

  v1 = v0;
  result._values._rawValue = (void *)sub_23A521488(MEMORY[0x24BEE4AF8]);
  v1->_values._rawValue = result._values._rawValue;
  return result;
}

uint64_t sub_23A51F214@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  _OWORD v15[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B5D0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a1 + 16) && (v7 = sub_23A520C2C((uint64_t)&type metadata for ClockDTEnvironmentKey), (v8 & 1) != 0))
    sub_23A50011C(*(_QWORD *)(a1 + 56) + 32 * v7, (uint64_t)v15);
  else
    memset(v15, 0, sizeof(v15));
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698B520);
  v9 = sub_23A521920();
  v10 = swift_dynamicCast();
  v11 = *(_QWORD *)(v9 - 8);
  v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  if (v10)
  {
    v12(v6, 0, 1, v9);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a2, v6, v9);
  }
  else
  {
    v12(v6, 1, 1, v9);
    sub_23A506A9C((uint64_t)v6, &qword_25698B5D0);
    if (qword_256992C60 != -1)
      swift_once();
    v14 = __swift_project_value_buffer(v9, (uint64_t)qword_256992C68);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(a2, v14, v9);
  }
}

uint64_t sub_23A51F384(uint64_t a1)
{
  unint64_t v2;
  char v3;
  char v5;
  _OWORD v6[2];

  if (*(_QWORD *)(a1 + 16)
    && (v2 = sub_23A520C2C((uint64_t)&type metadata for CloudKitAutomaticallySyncDTEnvironmentKey), (v3 & 1) != 0))
  {
    sub_23A50011C(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)v6);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698B520);
  return v5 & 1 | ((swift_dynamicCast() & 1) == 0);
}

uint64_t sub_23A51F410(uint64_t a1)
{
  unint64_t v2;
  char v3;
  uint64_t v5;
  _OWORD v6[2];

  if (*(_QWORD *)(a1 + 16)
    && (v2 = sub_23A520C2C((uint64_t)&type metadata for CloudKitContainerDTEnvironmentKey), (v3 & 1) != 0))
  {
    sub_23A50011C(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)v6);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698B520);
  __swift_instantiateConcreteTypeFromMangledName(qword_25698B528);
  if (swift_dynamicCast())
    return v5;
  else
    return 0;
}

uint64_t sub_23A51F4A8(uint64_t a1)
{
  unint64_t v2;
  char v3;
  char v5;
  _OWORD v6[2];

  if (*(_QWORD *)(a1 + 16)
    && (v2 = sub_23A520C2C((uint64_t)&type metadata for CloudSyncEnabledDTEnvironmentKey), (v3 & 1) != 0))
  {
    sub_23A50011C(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)v6);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698B520);
  if (swift_dynamicCast())
    return v5 & 1;
  if (qword_256992C80 != -1)
    swift_once();
  return byte_256992C88;
}

uint64_t sub_23A51F568@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  int v10;
  void (*v11)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  _OWORD v14[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698B5C0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a1 + 16)
    && (v7 = sub_23A520C2C((uint64_t)&type metadata for DatabaseURLDTEnvironmentKey), (v8 & 1) != 0))
  {
    sub_23A50011C(*(_QWORD *)(a1 + 56) + 32 * v7, (uint64_t)v14);
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698B520);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE10);
  v10 = swift_dynamicCast();
  v11 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56);
  if (v10)
  {
    v11(v6, 0, 1, v9);
    return sub_23A5216BC((uint64_t)v6, a2);
  }
  else
  {
    v11(v6, 1, 1, v9);
    sub_23A506A9C((uint64_t)v6, &qword_25698B5C0);
    if (qword_256992C90 != -1)
      swift_once();
    v13 = __swift_project_value_buffer(v9, (uint64_t)qword_256992C98);
    return sub_23A506A58(v13, a2, &qword_25698AE10);
  }
}

id sub_23A51F6D8(uint64_t a1)
{
  unint64_t v2;
  char v3;
  uint64_t v5;
  _OWORD v6[2];

  if (*(_QWORD *)(a1 + 16)
    && (v2 = sub_23A520C2C((uint64_t)&type metadata for DispatchQueueDTEnvironmentKey), (v3 & 1) != 0))
  {
    sub_23A50011C(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)v6);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698B520);
  sub_23A5186FC();
  if (swift_dynamicCast())
    return (id)v5;
  if (qword_256992CB0 != -1)
    swift_once();
  return (id)qword_256992CB8;
}

uint64_t DTEnvironmentValues.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  _OWORD v21[2];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = sub_23A521BE4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v21 - v12;
  v14 = *v4;
  if (*(_QWORD *)(v14 + 16) && (v15 = sub_23A520C2C(a1), (v16 & 1) != 0))
    sub_23A50011C(*(_QWORD *)(v14 + 56) + 32 * v15, (uint64_t)v21);
  else
    memset(v21, 0, sizeof(v21));
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698B520);
  v17 = swift_dynamicCast();
  v18 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  if ((v17 & 1) != 0)
  {
    v19(v13, 0, 1, AssociatedTypeWitness);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v18 + 32))(a4, v13, AssociatedTypeWitness);
  }
  else
  {
    v19(v13, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  }
}

uint64_t DTEnvironmentValues.subscript.setter(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;

  sub_23A521588(a1, a2);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
}

uint64_t sub_23A51F978(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  char v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD v14[2];

  v3 = v2;
  if (*(_QWORD *)(a1 + 24))
  {
    sub_23A500F6C((_OWORD *)a1, v14);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v12 = *v2;
    *v2 = 0x8000000000000000;
    sub_23A52114C(v14, a2, isUniquelyReferenced_nonNull_native);
    *v2 = v12;
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_23A506A9C(a1, &qword_25698B520);
    v7 = sub_23A520C2C(a2);
    if ((v8 & 1) != 0)
    {
      v9 = v7;
      v10 = swift_isUniquelyReferenced_nonNull_native();
      v11 = *v2;
      v13 = *v3;
      *v3 = 0x8000000000000000;
      if ((v10 & 1) == 0)
      {
        sub_23A5212C8();
        v11 = v13;
      }
      sub_23A500F6C((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v9), v14);
      sub_23A520FB8(v9, v11);
      *v3 = v11;
      swift_bridgeObjectRelease();
    }
    else
    {
      memset(v14, 0, sizeof(v14));
    }
    return sub_23A506A9C((uint64_t)v14, &qword_25698B520);
  }
}

void (*DTEnvironmentValues.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t **a1, char a2)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  size_t v12;
  void *v13;

  v9 = malloc(0x40uLL);
  *a1 = v9;
  v9[2] = a4;
  v9[3] = v4;
  *v9 = a2;
  v9[1] = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9[4] = AssociatedTypeWitness;
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v9[5] = v11;
  v12 = *(_QWORD *)(v11 + 64);
  v9[6] = malloc(v12);
  v13 = malloc(v12);
  v9[7] = v13;
  DTEnvironmentValues.subscript.getter(a2, a3, a4, (uint64_t)v13);
  return sub_23A51FB54;
}

void sub_23A51FB54(uint64_t **a1, char a2)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, uint64_t);

  v2 = *a1;
  v3 = (void *)(*a1)[6];
  v4 = (void *)(*a1)[7];
  v5 = (*a1)[4];
  v6 = (*a1)[5];
  v7 = **a1;
  if ((a2 & 1) != 0)
  {
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[6], v4, v5);
    sub_23A521588((uint64_t)v3, v7);
    v8 = *(void (**)(void *, uint64_t))(v6 + 8);
    v8(v3, v5);
  }
  else
  {
    sub_23A521588((*a1)[7], v7);
    v8 = *(void (**)(void *, uint64_t))(v6 + 8);
  }
  v8(v4, v5);
  free(v4);
  free(v3);
  free(v2);
}

uint64_t sub_23A51FC18()
{
  uint64_t v0;

  v0 = sub_23A521920();
  __swift_allocate_value_buffer(v0, qword_256992C68);
  __swift_project_value_buffer(v0, (uint64_t)qword_256992C68);
  return sub_23A521914();
}

uint64_t sub_23A51FC60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256992C60 != -1)
    swift_once();
  v2 = sub_23A521920();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256992C68);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t DTEnvironmentValues.clock.getter()
{
  return sub_23A520618((void (*)(uint64_t))sub_23A51F214);
}

uint64_t sub_23A51FCDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A520664(a1, a2, a3, (void (*)(uint64_t))sub_23A51F214);
}

uint64_t sub_23A51FCE8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_23A521920();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return DTEnvironmentValues.clock.setter(v4);
}

uint64_t DTEnvironmentValues.clock.setter(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *, char *, uint64_t);
  uint64_t *boxed_opaque_existential_0;
  void (*v8)(char *, uint64_t);
  uint64_t v10[4];

  v2 = sub_23A521920();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v6(v5, a1, v2);
  v10[3] = v2;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v10);
  v6((char *)boxed_opaque_existential_0, v5, v2);
  sub_23A51F978((uint64_t)v10, (uint64_t)&type metadata for ClockDTEnvironmentKey);
  v8 = *(void (**)(char *, uint64_t))(v3 + 8);
  v8(v5, v2);
  return ((uint64_t (*)(char *, uint64_t))v8)(a1, v2);
}

void (*DTEnvironmentValues.clock.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[8] = v1;
  v4 = sub_23A521920();
  v3[9] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[10] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[11] = malloc(v6);
  v3[12] = malloc(v6);
  v7 = malloc(v6);
  v3[13] = v7;
  v8 = swift_bridgeObjectRetain();
  sub_23A51F214(v8, (uint64_t)v7);
  swift_bridgeObjectRelease();
  return sub_23A51FEC8;
}

void sub_23A51FEC8(uint64_t **a1, char a2)
{
  uint64_t *v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *boxed_opaque_existential_0;
  void (*v11)(void *, uint64_t);
  uint64_t v12;
  uint64_t *v13;

  v3 = *a1;
  v4 = *(void (**)(uint64_t, uint64_t, uint64_t))((*a1)[10] + 16);
  v4((*a1)[12], v3[13], v3[9]);
  v6 = (void *)v3[12];
  v5 = (void *)v3[13];
  if ((a2 & 1) != 0)
  {
    v8 = v3[10];
    v7 = (void *)v3[11];
    v9 = v3[9];
    v4((uint64_t)v7, v3[12], v9);
    v3[3] = v9;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v3);
    v4((uint64_t)boxed_opaque_existential_0, (uint64_t)v7, v9);
    sub_23A51F978((uint64_t)v3, (uint64_t)&type metadata for ClockDTEnvironmentKey);
    v11 = *(void (**)(void *, uint64_t))(v8 + 8);
    v11(v7, v9);
  }
  else
  {
    v12 = v3[10];
    v7 = (void *)v3[11];
    v9 = v3[9];
    v3[7] = v9;
    v13 = __swift_allocate_boxed_opaque_existential_0(v3 + 4);
    v4((uint64_t)v13, (uint64_t)v6, v9);
    sub_23A51F978((uint64_t)(v3 + 4), (uint64_t)&type metadata for ClockDTEnvironmentKey);
    v11 = *(void (**)(void *, uint64_t))(v12 + 8);
  }
  v11(v6, v9);
  v11(v5, v9);
  free(v5);
  free(v6);
  free(v7);
  free(v3);
}

uint64_t DTEnvironmentValues.cloudKitAutomaticallySync.getter()
{
  return sub_23A520384(sub_23A51F384);
}

uint64_t sub_23A51FFF0@<X0>(_BYTE *a1@<X8>)
{
  return sub_23A5203CC(sub_23A51F384, a1);
}

uint64_t sub_23A51FFFC(char *a1)
{
  char v1;
  _BYTE v3[24];
  uint64_t v4;

  v1 = *a1;
  v4 = MEMORY[0x24BEE1328];
  v3[0] = v1;
  return sub_23A51F978((uint64_t)v3, (uint64_t)&type metadata for CloudKitAutomaticallySyncDTEnvironmentKey);
}

uint64_t DTEnvironmentValues.cloudKitAutomaticallySync.setter(char a1)
{
  _BYTE v2[24];
  uint64_t v3;

  v3 = MEMORY[0x24BEE1328];
  v2[0] = a1;
  return sub_23A51F978((uint64_t)v2, (uint64_t)&type metadata for CloudKitAutomaticallySyncDTEnvironmentKey);
}

uint64_t (*DTEnvironmentValues.cloudKitAutomaticallySync.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char v4;

  *(_QWORD *)a1 = v1;
  v3 = swift_bridgeObjectRetain();
  v4 = sub_23A51F384(v3);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = v4 & 1;
  return sub_23A5200D4;
}

uint64_t sub_23A5200D4(uint64_t a1)
{
  char v1;
  _BYTE v3[24];
  uint64_t v4;

  v1 = *(_BYTE *)(a1 + 8);
  v4 = MEMORY[0x24BEE1328];
  v3[0] = v1;
  return sub_23A51F978((uint64_t)v3, (uint64_t)&type metadata for CloudKitAutomaticallySyncDTEnvironmentKey);
}

uint64_t DTEnvironmentValues.cloudKitContainer.getter()
{
  return sub_23A520A48(sub_23A51F410);
}

uint64_t sub_23A520128@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = swift_bridgeObjectRetain();
  v3 = sub_23A51F410(v2);
  result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t sub_23A52016C(void **a1)
{
  void *v1;
  id v2;
  _QWORD v4[4];

  v1 = *a1;
  v4[3] = __swift_instantiateConcreteTypeFromMangledName(qword_25698B528);
  v4[0] = v1;
  v2 = v1;
  return sub_23A51F978((uint64_t)v4, (uint64_t)&type metadata for CloudKitContainerDTEnvironmentKey);
}

uint64_t DTEnvironmentValues.cloudKitContainer.setter(uint64_t a1)
{
  _QWORD v3[4];

  v3[3] = __swift_instantiateConcreteTypeFromMangledName(qword_25698B528);
  v3[0] = a1;
  return sub_23A51F978((uint64_t)v3, (uint64_t)&type metadata for CloudKitContainerDTEnvironmentKey);
}

void (*DTEnvironmentValues.cloudKitContainer.modify(uint64_t *a1))(void **a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  a1[1] = v1;
  v3 = swift_bridgeObjectRetain();
  v4 = sub_23A51F410(v3);
  swift_bridgeObjectRelease();
  *a1 = v4;
  return sub_23A520258;
}

void sub_23A520258(void **a1, char a2)
{
  void *v2;
  id v3;
  _QWORD v4[3];
  uint64_t v5;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(qword_25698B528);
    v4[0] = v2;
    v3 = v2;
    sub_23A51F978((uint64_t)v4, (uint64_t)&type metadata for CloudKitContainerDTEnvironmentKey);

  }
  else
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(qword_25698B528);
    v4[0] = v2;
    sub_23A51F978((uint64_t)v4, (uint64_t)&type metadata for CloudKitContainerDTEnvironmentKey);
  }
}

void sub_23A5202DC()
{
  id v0;
  void *v1;
  int deviceClassNumber;

  v0 = (id)MobileGestalt_get_current_device();
  if (v0)
  {
    v1 = v0;
    deviceClassNumber = MobileGestalt_get_deviceClassNumber();

    byte_256992C88 = deviceClassNumber == 7;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23A520328@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  if (qword_256992C80 != -1)
    result = swift_once();
  *a1 = byte_256992C88;
  return result;
}

uint64_t DTEnvironmentValues.cloudSyncEnabled.getter()
{
  return sub_23A520384(sub_23A51F4A8);
}

uint64_t sub_23A520384(uint64_t (*a1)(uint64_t))
{
  uint64_t v2;

  v2 = swift_bridgeObjectRetain();
  LOBYTE(a1) = a1(v2);
  swift_bridgeObjectRelease();
  return a1 & 1;
}

uint64_t sub_23A5203C0@<X0>(_BYTE *a1@<X8>)
{
  return sub_23A5203CC(sub_23A51F4A8, a1);
}

uint64_t sub_23A5203CC@<X0>(uint64_t (*a1)(uint64_t)@<X3>, _BYTE *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = swift_bridgeObjectRetain();
  LOBYTE(a1) = a1(v4);
  result = swift_bridgeObjectRelease();
  *a2 = a1 & 1;
  return result;
}

uint64_t sub_23A520418(char *a1)
{
  char v1;
  _BYTE v3[24];
  uint64_t v4;

  v1 = *a1;
  v4 = MEMORY[0x24BEE1328];
  v3[0] = v1;
  return sub_23A51F978((uint64_t)v3, (uint64_t)&type metadata for CloudSyncEnabledDTEnvironmentKey);
}

uint64_t DTEnvironmentValues.cloudSyncEnabled.setter(char a1)
{
  _BYTE v2[24];
  uint64_t v3;

  v3 = MEMORY[0x24BEE1328];
  v2[0] = a1;
  return sub_23A51F978((uint64_t)v2, (uint64_t)&type metadata for CloudSyncEnabledDTEnvironmentKey);
}

uint64_t (*DTEnvironmentValues.cloudSyncEnabled.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char v4;

  *(_QWORD *)a1 = v1;
  v3 = swift_bridgeObjectRetain();
  v4 = sub_23A51F4A8(v3);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = v4 & 1;
  return sub_23A5204F0;
}

uint64_t sub_23A5204F0(uint64_t a1)
{
  char v1;
  _BYTE v3[24];
  uint64_t v4;

  v1 = *(_BYTE *)(a1 + 8);
  v4 = MEMORY[0x24BEE1328];
  v3[0] = v1;
  return sub_23A51F978((uint64_t)v3, (uint64_t)&type metadata for CloudSyncEnabledDTEnvironmentKey);
}

uint64_t sub_23A520538()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE10);
  __swift_allocate_value_buffer(v0, qword_256992C98);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_256992C98);
  v2 = sub_23A521854();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
}

uint64_t sub_23A5205A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256992C90 != -1)
    swift_once();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE10);
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256992C98);
  return sub_23A506A58(v3, a1, &qword_25698AE10);
}

uint64_t DTEnvironmentValues.databaseURL.getter()
{
  return sub_23A520618((void (*)(uint64_t))sub_23A51F568);
}

uint64_t sub_23A520618(void (*a1)(uint64_t))
{
  uint64_t v2;

  v2 = swift_bridgeObjectRetain();
  a1(v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A520658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A520664(a1, a2, a3, (void (*)(uint64_t))sub_23A51F568);
}

uint64_t sub_23A520664(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5;

  v5 = swift_bridgeObjectRetain();
  a4(v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A5206A4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE10);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A506A58(a1, (uint64_t)v4, &qword_25698AE10);
  return DTEnvironmentValues.databaseURL.setter((uint64_t)v4);
}

uint64_t DTEnvironmentValues.databaseURL.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v7[4];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE10);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A506A58(a1, (uint64_t)v4, &qword_25698AE10);
  v7[3] = v2;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v7);
  sub_23A506A58((uint64_t)v4, (uint64_t)boxed_opaque_existential_0, &qword_25698AE10);
  sub_23A51F978((uint64_t)v7, (uint64_t)&type metadata for DatabaseURLDTEnvironmentKey);
  sub_23A506A9C((uint64_t)v4, &qword_25698AE10);
  return sub_23A506A9C(a1, &qword_25698AE10);
}

void (*DTEnvironmentValues.databaseURL.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;

  v3 = malloc(0x68uLL);
  *a1 = v3;
  v3[8] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE10);
  v3[9] = v4;
  v5 = *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64);
  v3[10] = malloc(v5);
  v3[11] = malloc(v5);
  v6 = malloc(v5);
  v3[12] = v6;
  v7 = swift_bridgeObjectRetain();
  sub_23A51F568(v7, (uint64_t)v6);
  swift_bridgeObjectRelease();
  return sub_23A52088C;
}

void sub_23A52088C(uint64_t **a1, char a2)
{
  uint64_t *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_0;
  uint64_t *v9;

  v3 = *a1;
  sub_23A506A58((*a1)[12], (*a1)[11], &qword_25698AE10);
  v5 = (void *)v3[11];
  v4 = (void *)v3[12];
  if ((a2 & 1) != 0)
  {
    v7 = v3[9];
    v6 = (void *)v3[10];
    sub_23A506A58(v3[11], (uint64_t)v6, &qword_25698AE10);
    v3[3] = v7;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v3);
    sub_23A506A58((uint64_t)v6, (uint64_t)boxed_opaque_existential_0, &qword_25698AE10);
    sub_23A51F978((uint64_t)v3, (uint64_t)&type metadata for DatabaseURLDTEnvironmentKey);
    sub_23A506A9C((uint64_t)v6, &qword_25698AE10);
  }
  else
  {
    v6 = (void *)v3[10];
    v3[7] = v3[9];
    v9 = __swift_allocate_boxed_opaque_existential_0(v3 + 4);
    sub_23A506A58((uint64_t)v5, (uint64_t)v9, &qword_25698AE10);
    sub_23A51F978((uint64_t)(v3 + 4), (uint64_t)&type metadata for DatabaseURLDTEnvironmentKey);
  }
  sub_23A506A9C((uint64_t)v5, &qword_25698AE10);
  sub_23A506A9C((uint64_t)v4, &qword_25698AE10);
  free(v4);
  free(v5);
  free(v6);
  free(v3);
}

uint64_t sub_23A5209BC()
{
  uint64_t result;

  sub_23A5186FC();
  result = sub_23A521BC0();
  qword_256992CB8 = result;
  return result;
}

id sub_23A5209EC@<X0>(_QWORD *a1@<X8>)
{
  void *v2;

  if (qword_256992CB0 != -1)
    swift_once();
  v2 = (void *)qword_256992CB8;
  *a1 = qword_256992CB8;
  return v2;
}

uint64_t DTEnvironmentValues.dispatchQueue.getter()
{
  return sub_23A520A48((uint64_t (*)(uint64_t))sub_23A51F6D8);
}

uint64_t sub_23A520A48(uint64_t (*a1)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;

  v2 = swift_bridgeObjectRetain();
  v3 = a1(v2);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_23A520A84@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  id v3;
  uint64_t result;

  v2 = swift_bridgeObjectRetain();
  v3 = sub_23A51F6D8(v2);
  result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t sub_23A520AC8(void **a1)
{
  void *v1;
  id v2;
  _QWORD v4[4];

  v1 = *a1;
  v4[3] = sub_23A5186FC();
  v4[0] = v1;
  v2 = v1;
  return sub_23A51F978((uint64_t)v4, (uint64_t)&type metadata for DispatchQueueDTEnvironmentKey);
}

uint64_t DTEnvironmentValues.dispatchQueue.setter(uint64_t a1)
{
  _QWORD v3[4];

  v3[3] = sub_23A5186FC();
  v3[0] = a1;
  return sub_23A51F978((uint64_t)v3, (uint64_t)&type metadata for DispatchQueueDTEnvironmentKey);
}

void (*DTEnvironmentValues.dispatchQueue.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  id v4;

  a1[1] = v1;
  v3 = swift_bridgeObjectRetain();
  v4 = sub_23A51F6D8(v3);
  swift_bridgeObjectRelease();
  *a1 = v4;
  return sub_23A520BAC;
}

void sub_23A520BAC(void **a1, char a2)
{
  void *v2;
  id v3;
  _QWORD v4[3];
  unint64_t v5;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v5 = sub_23A5186FC();
    v4[0] = v2;
    v3 = v2;
    sub_23A51F978((uint64_t)v4, (uint64_t)&type metadata for DispatchQueueDTEnvironmentKey);

  }
  else
  {
    v5 = sub_23A5186FC();
    v4[0] = v2;
    sub_23A51F978((uint64_t)v4, (uint64_t)&type metadata for DispatchQueueDTEnvironmentKey);
  }
}

unint64_t sub_23A520C2C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A521E48();
  return sub_23A520C5C(a1, v2);
}

unint64_t sub_23A520C5C(uint64_t a1, uint64_t a2)
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

uint64_t sub_23A520CF8(uint64_t a1, char a2)
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
  _OWORD *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  _OWORD v32[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698B5C8);
  result = sub_23A521CEC();
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
      v22 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
        sub_23A500F6C(v22, v32);
      else
        sub_23A50011C((uint64_t)v22, (uint64_t)v32);
      result = sub_23A521E48();
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
      result = (uint64_t)sub_23A500F6C(v32, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v15));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_41:
  *v3 = v7;
  return result;
}

unint64_t sub_23A520FB8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  _QWORD *v15;
  uint64_t v16;
  _OWORD *v17;
  _OWORD *v18;
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
    result = sub_23A521C38();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v10 = *(_QWORD *)(a2 + 48);
        v11 = (_QWORD *)(v10 + 8 * v6);
        result = sub_23A521E48();
        v12 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 >= v8 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            v15 = (_QWORD *)(v10 + 8 * v3);
            if (v3 != v6 || v15 >= v11 + 1)
              *v15 = *v11;
            v16 = *(_QWORD *)(a2 + 56);
            v17 = (_OWORD *)(v16 + 32 * v3);
            v18 = (_OWORD *)(v16 + 32 * v6);
            if (v3 != v6 || (v3 = v6, v17 >= v18 + 2))
            {
              v9 = v18[1];
              *v17 = *v18;
              v17[1] = v9;
              v3 = v6;
            }
          }
        }
        else if (v12 >= v8 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
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

_OWORD *sub_23A52114C(_OWORD *a1, uint64_t a2, char a3)
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
  _OWORD *v17;
  _OWORD *result;
  unint64_t v19;
  char v20;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_23A520C2C(a2);
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
      {
LABEL_8:
        v17 = (_OWORD *)(v16[7] + 32 * v10);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
        return sub_23A500F6C(a1, v17);
      }
      return sub_23A521264(v10, a2, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_23A5212C8();
      goto LABEL_7;
    }
    sub_23A520CF8(v13, a3 & 1);
    v19 = sub_23A520C2C(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      return sub_23A521264(v10, a2, a1, v16);
    }
  }
  result = (_OWORD *)sub_23A521E30();
  __break(1u);
  return result;
}

_OWORD *sub_23A521264(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  _OWORD *result;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  result = sub_23A500F6C(a3, (_OWORD *)(a4[7] + 32 * a1));
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

void *sub_23A5212C8()
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
  _OWORD v22[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25698B5C8);
  v2 = *v0;
  v3 = sub_23A521CE0();
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
    v18 = 32 * v15;
    sub_23A50011C(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = sub_23A500F6C(v22, (_OWORD *)(*(_QWORD *)(v4 + 56) + v18));
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

unint64_t sub_23A521488(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t i;
  uint64_t v5;
  unint64_t result;
  char v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25698B5C8);
    v3 = (_QWORD *)sub_23A521CF8();
    for (i = a1 + 32; ; i += 40)
    {
      sub_23A506A58(i, (uint64_t)&v11, &qword_25698B5D8);
      v5 = v11;
      result = sub_23A520C2C(v11);
      if ((v7 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_QWORD *)(v3[6] + 8 * result) = v5;
      result = (unint64_t)sub_23A500F6C(&v12, (_OWORD *)(v3[7] + 32 * result));
      v8 = v3[2];
      v9 = __OFADD__(v8, 1);
      v10 = v8 + 1;
      if (v9)
        goto LABEL_10;
      v3[2] = v10;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

uint64_t sub_23A521588(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v7[4];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7[3] = AssociatedTypeWitness;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v7);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(boxed_opaque_existential_0, a1, AssociatedTypeWitness);
  return sub_23A51F978((uint64_t)v7, a2);
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

uint64_t dispatch thunk of static DTEnvironmentKey.defaultValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

ValueMetadata *type metadata accessor for DTEnvironmentValues()
{
  return &type metadata for DTEnvironmentValues;
}

ValueMetadata *type metadata accessor for DispatchQueueDTEnvironmentKey()
{
  return &type metadata for DispatchQueueDTEnvironmentKey;
}

ValueMetadata *type metadata accessor for DatabaseURLDTEnvironmentKey()
{
  return &type metadata for DatabaseURLDTEnvironmentKey;
}

ValueMetadata *type metadata accessor for CloudSyncEnabledDTEnvironmentKey()
{
  return &type metadata for CloudSyncEnabledDTEnvironmentKey;
}

ValueMetadata *type metadata accessor for CloudKitContainerDTEnvironmentKey()
{
  return &type metadata for CloudKitContainerDTEnvironmentKey;
}

ValueMetadata *type metadata accessor for CloudKitAutomaticallySyncDTEnvironmentKey()
{
  return &type metadata for CloudKitAutomaticallySyncDTEnvironmentKey;
}

ValueMetadata *type metadata accessor for ClockDTEnvironmentKey()
{
  return &type metadata for ClockDTEnvironmentKey;
}

uint64_t sub_23A5216BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25698AE10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A521704()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_23A521710()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_23A52171C()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_23A521728()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_23A521734()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_23A521740()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_23A52174C()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_23A521758()
{
  return MEMORY[0x24BDCB960]();
}

uint64_t sub_23A521764()
{
  return MEMORY[0x24BDCB980]();
}

uint64_t sub_23A521770()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_23A52177C()
{
  return MEMORY[0x24BDCBA58]();
}

uint64_t sub_23A521788()
{
  return MEMORY[0x24BDCBA60]();
}

uint64_t sub_23A521794()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_23A5217A0()
{
  return MEMORY[0x24BDCBAE0]();
}

uint64_t sub_23A5217AC()
{
  return MEMORY[0x24BDCBAE8]();
}

uint64_t sub_23A5217B8()
{
  return MEMORY[0x24BDCBB20]();
}

uint64_t sub_23A5217C4()
{
  return MEMORY[0x24BDCBB28]();
}

uint64_t sub_23A5217D0()
{
  return MEMORY[0x24BDCBB30]();
}

uint64_t sub_23A5217DC()
{
  return MEMORY[0x24BDCBB68]();
}

uint64_t sub_23A5217E8()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_23A5217F4()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_23A521800()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_23A52180C()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_23A521818()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_23A521824()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_23A521830()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23A52183C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23A521848()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_23A521854()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23A521860()
{
  return MEMORY[0x24BDCDBF8]();
}

uint64_t sub_23A52186C()
{
  return MEMORY[0x24BE29C38]();
}

uint64_t sub_23A521878()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_23A521884()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23A521890()
{
  return MEMORY[0x24BDCDD78]();
}

uint64_t sub_23A52189C()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_23A5218A8()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_23A5218B4()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23A5218C0()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_23A5218CC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23A5218D8()
{
  return MEMORY[0x24BE29C48]();
}

uint64_t sub_23A5218E4()
{
  return MEMORY[0x24BE29C50]();
}

uint64_t sub_23A5218F0()
{
  return MEMORY[0x24BE29C60]();
}

uint64_t sub_23A5218FC()
{
  return MEMORY[0x24BE29C68]();
}

uint64_t sub_23A521908()
{
  return MEMORY[0x24BE29C80]();
}

uint64_t sub_23A521914()
{
  return MEMORY[0x24BE29CF8]();
}

uint64_t sub_23A521920()
{
  return MEMORY[0x24BE29D68]();
}

uint64_t sub_23A52192C()
{
  return MEMORY[0x24BE29D90]();
}

uint64_t sub_23A521938()
{
  return MEMORY[0x24BE29DA8]();
}

uint64_t sub_23A521944()
{
  return MEMORY[0x24BE29DC0]();
}

uint64_t sub_23A521950()
{
  return MEMORY[0x24BE29DD0]();
}

uint64_t sub_23A52195C()
{
  return MEMORY[0x24BE29DE8]();
}

uint64_t sub_23A521968()
{
  return MEMORY[0x24BE29DF8]();
}

uint64_t sub_23A521974()
{
  return MEMORY[0x24BE29E00]();
}

uint64_t sub_23A521980()
{
  return MEMORY[0x24BE29E10]();
}

uint64_t sub_23A52198C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23A521998()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23A5219A4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23A5219B0()
{
  return MEMORY[0x24BEE64B8]();
}

uint64_t sub_23A5219BC()
{
  return MEMORY[0x24BEE64C8]();
}

uint64_t sub_23A5219C8()
{
  return MEMORY[0x24BEE64D8]();
}

uint64_t sub_23A5219D4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_23A5219E0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23A5219EC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23A5219F8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23A521A04()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23A521A10()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23A521A1C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A521A28()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A521A34()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_23A521A40()
{
  return MEMORY[0x24BE29E38]();
}

uint64_t sub_23A521A4C()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t sub_23A521A58()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23A521A64()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_23A521A70()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23A521A7C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23A521A88()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_23A521A94()
{
  return MEMORY[0x24BEE1020]();
}

uint64_t sub_23A521AA0()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_23A521AAC()
{
  return MEMORY[0x24BEE10A0]();
}

uint64_t sub_23A521AB8()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23A521AC4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23A521AD0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23A521ADC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23A521AE8()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23A521AF4()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23A521B00()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_23A521B0C()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_23A521B18()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_23A521B24()
{
  return MEMORY[0x24BEE6850]();
}

uint64_t sub_23A521B30()
{
  return MEMORY[0x24BEE6858]();
}

uint64_t sub_23A521B3C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23A521B48()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23A521B54()
{
  return MEMORY[0x24BEE6BF8]();
}

uint64_t sub_23A521B60()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_23A521B6C()
{
  return MEMORY[0x24BE29E48]();
}

uint64_t sub_23A521B78()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23A521B84()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23A521B90()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23A521B9C()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_23A521BA8()
{
  return MEMORY[0x24BE29E68]();
}

uint64_t sub_23A521BB4()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_23A521BC0()
{
  return MEMORY[0x24BE29E80]();
}

uint64_t sub_23A521BCC()
{
  return MEMORY[0x24BEE59A0]();
}

uint64_t sub_23A521BD8()
{
  return MEMORY[0x24BEE59A8]();
}

uint64_t sub_23A521BE4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23A521BF0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23A521BFC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23A521C08()
{
  return MEMORY[0x24BEE2090]();
}

uint64_t sub_23A521C14()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23A521C20()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_23A521C2C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23A521C38()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23A521C44()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_23A521C50()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_23A521C5C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_23A521C68()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23A521C74()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23A521C80()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23A521C8C()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23A521C98()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23A521CA4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23A521CB0()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23A521CBC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23A521CC8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23A521CD4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23A521CE0()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23A521CEC()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23A521CF8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23A521D04()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23A521D10()
{
  return MEMORY[0x24BEE30E0]();
}

uint64_t sub_23A521D1C()
{
  return MEMORY[0x24BEE30E8]();
}

uint64_t sub_23A521D28()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23A521D34()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23A521D40()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23A521D4C()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_23A521D58()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23A521D64()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23A521D70()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23A521D7C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23A521D88()
{
  return MEMORY[0x24BEE33C0]();
}

uint64_t sub_23A521D94()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23A521DA0()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23A521DAC()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23A521DB8()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23A521DC4()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23A521DD0()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23A521DDC()
{
  return MEMORY[0x24BEE3510]();
}

uint64_t sub_23A521DE8()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23A521DF4()
{
  return MEMORY[0x24BE29EA0]();
}

uint64_t sub_23A521E00()
{
  return MEMORY[0x24BE29EA8]();
}

uint64_t sub_23A521E0C()
{
  return MEMORY[0x24BE29EB8]();
}

uint64_t sub_23A521E18()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23A521E24()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_23A521E30()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23A521E3C()
{
  return MEMORY[0x24BE29EC8]();
}

uint64_t sub_23A521E48()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_23A521E54()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A521E60()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23A521E6C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23A521E78()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_23A521E84()
{
  return MEMORY[0x24BDD0810]();
}

uint64_t sub_23A521E90()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23A521E9C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23A521EA8()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23A521EB4()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

uint64_t CUNextID64()
{
  return MEMORY[0x24BE29178]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x24BED8580]();
}

uint64_t MobileGestalt_get_deviceClassNumber()
{
  return MEMORY[0x24BED8588]();
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
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

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x24BDB0710](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x24BDB0738](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

uint64_t xpc_dictionary_expects_reply()
{
  return MEMORY[0x24BDB08E8]();
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

