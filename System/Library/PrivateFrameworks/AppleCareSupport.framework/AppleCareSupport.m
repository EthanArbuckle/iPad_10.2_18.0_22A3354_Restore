uint64_t sub_2363619EC(uint64_t a1, uint64_t a2)
{
  return sub_236361B34(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_2363619F8(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_23637A82C();
  *a2 = 0;
  return result;
}

uint64_t sub_236361A6C(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_23637A838();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_236361AE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_23637A844();
  v2 = sub_23637A820();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_236361B28(uint64_t a1, uint64_t a2)
{
  return sub_236361B34(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_236361B34(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_23637A844();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_236361B70()
{
  sub_23637A844();
  sub_23637A874();
  return swift_bridgeObjectRelease();
}

uint64_t sub_236361BB0()
{
  uint64_t v0;

  sub_23637A844();
  sub_23637AC7C();
  sub_23637A874();
  v0 = sub_23637AC94();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_236361C20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_23637A844();
  v2 = v1;
  if (v0 == sub_23637A844() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_23637ABEC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_236361CA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_23637A820();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_236361CEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_23637A844();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
  sub_236361E90(a1, &qword_2563DDAC8);
}

uint64_t sub_236361D28()
{
  sub_236361DDC(&qword_2563DDBA8, (uint64_t)&unk_23637B544);
  sub_236361DDC(&qword_2563DDBB0, (uint64_t)&unk_23637B498);
  return sub_23637AB8C();
}

uint64_t sub_236361D94()
{
  return sub_236361DDC(&qword_2563DDAD0, (uint64_t)&unk_23637B45C);
}

uint64_t sub_236361DB8()
{
  return sub_236361DDC(&qword_2563DDAD8, (uint64_t)&unk_23637B430);
}

uint64_t sub_236361DDC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for OpenExternalURLOptionsKey(255);
    result = MEMORY[0x23B7F153C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_236361E1C()
{
  return sub_236361DDC(&qword_2563DDAE0, (uint64_t)&unk_23637B4CC);
}

void type metadata accessor for SecCertificate(uint64_t a1)
{
  sub_236361E90(a1, &qword_2563DDBB8);
}

void type metadata accessor for CFError(uint64_t a1)
{
  sub_236361E90(a1, &qword_2563DDBC0);
}

void type metadata accessor for SecAccessControl(uint64_t a1)
{
  sub_236361E90(a1, &qword_2563DDBC8);
}

void type metadata accessor for ACAccountCredentialRenewResult(uint64_t a1)
{
  sub_236361E90(a1, (unint64_t *)&unk_2563DDBD0);
}

void sub_236361E90(uint64_t a1, unint64_t *a2)
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

uint64_t destroy for ErrorWithTelemetryEvent(id *a1)
{

  return swift_release();
}

_QWORD *_s16AppleCareSupport23ErrorWithTelemetryEventVwCP_0(_QWORD *a1, uint64_t a2)
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = *(id *)a2;
  v5 = *(id *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  *a1 = v4;
  a1[1] = v6;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ErrorWithTelemetryEvent(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;
  void *v6;

  v4 = *(id *)a2;
  v5 = *(id *)a2;
  v6 = *(void **)a1;
  *(_QWORD *)a1 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
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

id *assignWithTake for ErrorWithTelemetryEvent(id *a1, _OWORD *a2)
{

  *(_OWORD *)a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ErrorWithTelemetryEvent(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ErrorWithTelemetryEvent(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ErrorWithTelemetryEvent()
{
  return &type metadata for ErrorWithTelemetryEvent;
}

ValueMetadata *type metadata accessor for AnisetteHeadersProvider()
{
  return &type metadata for AnisetteHeadersProvider;
}

unint64_t sub_23636209C()
{
  return 0xD000000000000017;
}

uint64_t sub_2363620B8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v3 = (uint64_t (__cdecl *)())((char *)&dword_2563DDC48 + dword_2563DDC48);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_236362118;
  return v3();
}

uint64_t sub_236362118(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_23636216C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_236370B50(a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_23637685C();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (_QWORD *)(v20[7] + 16 * v14);
      result = swift_bridgeObjectRelease();
      *v21 = a1;
      v21[1] = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (_QWORD *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_236375EC0(v17, a5 & 1);
  v23 = sub_236370B50(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23637AC1C();
  __break(1u);
  return result;
}

uint64_t sub_2363622E0()
{
  return swift_task_switch();
}

uint64_t sub_2363622F4()
{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;
  unint64_t v4;
  char isUniquelyReferenced_nonNull_native;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16B0]), sel_init);
  objc_msgSend(v1, sel_ak_addClientInfoHeader);
  objc_msgSend(v1, sel_ak_addDeviceUDIDHeader);
  v2 = objc_msgSend(v1, sel_allHTTPHeaderFields);
  if (v2)
  {
    v3 = v2;
    v4 = sub_23637A7FC();

  }
  else
  {
    v4 = sub_2363703E8(MEMORY[0x24BEE4AF8]);
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_23636216C(0xD000000000000022, 0x800000023637C4D0, 0xD000000000000010, 0x800000023637C4B0, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();

  return (*(uint64_t (**)(unint64_t))(v0 + 8))(v4);
}

id sub_236362414(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_236363424();
    v4 = (void *)sub_23637A7F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

void sub_236362488(_QWORD *a1, char a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  id v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  void *v19;
  id v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  void **v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  char v37;
  char v38;
  _QWORD *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  if (!a1[2])
  {
    swift_bridgeObjectRelease();
    return;
  }
  v43 = a1[2];
  v7 = a1[4];
  v6 = a1[5];
  v8 = (void *)a1[6];
  swift_bridgeObjectRetain();
  v9 = (_QWORD *)*a3;
  swift_bridgeObjectRetain();
  v10 = v8;
  v12 = sub_236370B50(v7, v6);
  v13 = v9[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
    goto LABEL_23;
  v16 = v11;
  if (v9[3] >= v15)
  {
    if ((a2 & 1) != 0)
    {
      if ((v11 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      sub_236376A14();
      if ((v16 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v21 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    v22 = (uint64_t *)(v21[6] + 16 * v12);
    *v22 = v7;
    v22[1] = v6;
    *(_QWORD *)(v21[7] + 8 * v12) = v10;
    v23 = v21[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v21[2] = v25;
    v26 = v43 - 1;
    if (v43 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    v27 = (void **)(a1 + 9);
    while (1)
    {
      v29 = (uint64_t)*(v27 - 2);
      v28 = (uint64_t)*(v27 - 1);
      v30 = *v27;
      v31 = (_QWORD *)*a3;
      swift_bridgeObjectRetain();
      v10 = v30;
      v32 = sub_236370B50(v29, v28);
      v34 = v31[2];
      v35 = (v33 & 1) == 0;
      v24 = __OFADD__(v34, v35);
      v36 = v34 + v35;
      if (v24)
        break;
      v37 = v33;
      if (v31[3] < v36)
      {
        sub_2363761E4(v36, 1);
        v32 = sub_236370B50(v29, v28);
        if ((v37 & 1) != (v38 & 1))
          goto LABEL_25;
      }
      if ((v37 & 1) != 0)
        goto LABEL_10;
      v39 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v32 >> 6) + 64) |= 1 << v32;
      v40 = (uint64_t *)(v39[6] + 16 * v32);
      *v40 = v29;
      v40[1] = v28;
      *(_QWORD *)(v39[7] + 8 * v32) = v10;
      v41 = v39[2];
      v24 = __OFADD__(v41, 1);
      v42 = v41 + 1;
      if (v24)
        goto LABEL_24;
      v39[2] = v42;
      v27 += 3;
      if (!--v26)
        goto LABEL_22;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_2363761E4(v15, a2 & 1);
  v17 = sub_236370B50(v7, v6);
  if ((v16 & 1) == (v18 & 1))
  {
    v12 = v17;
    if ((v16 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v19 = (void *)swift_allocError();
    swift_willThrow();
    v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDC70);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease_n();
      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_23637AC1C();
  __break(1u);
LABEL_26:
  sub_23637AA18();
  sub_23637A880();
  sub_23637AB20();
  sub_23637A880();
  sub_23637AB44();
  __break(1u);
}

uint64_t sub_236362814(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23636284C(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_236362830(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2363629F0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23636284C(char a1, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDC78);
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDC80);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23637AB80();
  __break(1u);
  return result;
}

uint64_t sub_2363629F0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDC88);
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
  result = sub_23637AB80();
  __break(1u);
  return result;
}

uint64_t sub_236362B58(uint64_t a1)
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
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
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

uint64_t sub_236362BE0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 264) = a1;
  return swift_task_switch();
}

uint64_t sub_236362BF8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 264);
  swift_beginAccess();
  *(_QWORD *)(v0 + 272) = *(_QWORD *)(v1 + 128);
  swift_bridgeObjectRetain();
  return swift_task_switch();
}

uint64_t sub_236362C50()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  __int128 v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  int64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[3];

  v1 = *(_QWORD *)(v0 + 272);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v46 = MEMORY[0x24BEE4AF8];
    sub_236362814(0, v2, 0);
    v3 = sub_236362B58(v1);
    if (v3 < 0)
      goto LABEL_46;
    v5 = v3;
    if (v3 >= 1 << *(_BYTE *)(v1 + 32))
      goto LABEL_46;
    v6 = 0;
    v7 = v0 + 128;
    v8 = v1 + 64;
    v40 = v0 + 32;
    v45 = v0 + 200;
    v44 = (_QWORD *)(v0 + 144);
    v37 = v1 + 80;
    v38 = v4;
    v39 = v1 + 64;
    v41 = v1;
    while (1)
    {
      v9 = v5 >> 6;
      if ((*(_QWORD *)(v8 + 8 * (v5 >> 6)) & (1 << v5)) == 0)
      {
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
        JUMPOUT(0x236363174);
      }
      if (*(_DWORD *)(v1 + 36) != v4)
        goto LABEL_42;
      v42 = v6;
      v10 = *(_QWORD *)(v1 + 56);
      v11 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v5);
      v12 = *v11;
      v13 = v11[1];
      sub_2363632B0(v10 + 40 * v5, v40);
      *(_QWORD *)(v0 + 16) = v12;
      *(_QWORD *)(v0 + 24) = v13;
      *(_QWORD *)(v0 + 72) = v12;
      *(_QWORD *)(v0 + 80) = v13;
      sub_2363632B0(v40, v0 + 88);
      v14 = *(_OWORD *)(v0 + 88);
      *(_OWORD *)v7 = *(_OWORD *)(v0 + 72);
      *(_OWORD *)(v7 + 16) = v14;
      *(_OWORD *)(v7 + 32) = *(_OWORD *)(v0 + 104);
      *(_QWORD *)(v7 + 48) = *(_QWORD *)(v0 + 120);
      sub_2363632F4(v12, v13);
      sub_2363632F4(v12, v13);
      sub_236363308(v0 + 16);
      v16 = *(_QWORD *)(v0 + 128);
      v15 = *(_QWORD *)(v0 + 136);
      *(_QWORD *)(v0 + 184) = v16;
      *(_QWORD *)(v0 + 192) = v15;
      sub_2363632B0((uint64_t)v44, v45);
      v17 = 0x800000023637C580;
      v18 = 0xD000000000000014;
      switch(v15)
      {
        case 0uLL:
          v17 = 0xE800000000000000;
          v18 = 0x6E6F697461727564;
          break;
        case 1uLL:
          v17 = 0xE700000000000000;
          v18 = 0x656D6F6374756FLL;
          break;
        case 2uLL:
          v17 = 0xE700000000000000;
          v18 = 0x6572756C696166;
          break;
        case 3uLL:
          v17 = 0xEA0000000000746ELL;
          v18 = 0x756F437972746572;
          break;
        case 4uLL:
          break;
        case 5uLL:
          v19 = "@\"NSDictionary\"8@?0";
          goto LABEL_15;
        case 6uLL:
          v18 = 0xD00000000000001DLL;
          v19 = "lecaresupport.auth";
LABEL_15:
          v17 = (unint64_t)v19 | 0x8000000000000000;
          break;
        default:
          v47[0] = 0x6E6F697461727564;
          v47[1] = 0xEB00000000726F46;
          sub_2363632F4(v16, v15);
          sub_23637A880();
          sub_236363410(v16, v15);
          v18 = 0x6E6F697461727564;
          v17 = 0xEB00000000726F46;
          break;
      }
      v43 = v17;
      v20 = *(_QWORD *)(v0 + 168);
      v21 = *(_QWORD *)(v0 + 176);
      __swift_project_boxed_opaque_existential_1(v44, v20);
      v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 8))(v20, v21);
      __swift_destroy_boxed_opaque_existential_1(v45);
      sub_236363308(v7);
      v23 = v46;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_236362814(0, *(_QWORD *)(v46 + 16) + 1, 1);
        v23 = v46;
      }
      v25 = *(_QWORD *)(v23 + 16);
      v24 = *(_QWORD *)(v23 + 24);
      if (v25 >= v24 >> 1)
      {
        sub_236362814(v24 > 1, v25 + 1, 1);
        v23 = v46;
      }
      *(_QWORD *)(v23 + 16) = v25 + 1;
      v26 = (_QWORD *)(v23 + 24 * v25);
      v26[4] = v18;
      v26[5] = v43;
      v26[6] = v22;
      v1 = v41;
      v27 = 1 << *(_BYTE *)(v41 + 32);
      if ((uint64_t)v5 >= v27)
        goto LABEL_43;
      v8 = v39;
      v28 = *(_QWORD *)(v39 + 8 * v9);
      if ((v28 & (1 << v5)) == 0)
        goto LABEL_44;
      v4 = v38;
      if (*(_DWORD *)(v41 + 36) != v38)
        goto LABEL_45;
      v29 = v28 & (-2 << (v5 & 0x3F));
      if (v29)
      {
        v5 = __clz(__rbit64(v29)) | v5 & 0xFFFFFFFFFFFFFFC0;
        v7 = v0 + 128;
        v30 = v2;
        goto LABEL_32;
      }
      v31 = v9 + 1;
      v32 = (unint64_t)(v27 + 63) >> 6;
      v7 = v0 + 128;
      v30 = v2;
      if (v9 + 1 < v32)
      {
        v33 = *(_QWORD *)(v39 + 8 * v31);
        if (v33)
        {
LABEL_30:
          v5 = __clz(__rbit64(v33)) + (v31 << 6);
          goto LABEL_32;
        }
        while (v32 - 2 != v9)
        {
          v33 = *(_QWORD *)(v37 + 8 * v9++);
          if (v33)
          {
            v31 = v9 + 1;
            goto LABEL_30;
          }
        }
      }
      v5 = 1 << *(_BYTE *)(v41 + 32);
LABEL_32:
      v6 = v42 + 1;
      if (v42 + 1 == v30)
      {
        swift_bridgeObjectRelease();
        if (*(_QWORD *)(v23 + 16))
          goto LABEL_37;
LABEL_39:
        v34 = MEMORY[0x24BEE4B00];
        goto LABEL_40;
      }
      if ((v5 & 0x8000000000000000) != 0 || (uint64_t)v5 >= v27)
        goto LABEL_46;
    }
  }
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
    goto LABEL_39;
LABEL_37:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDC60);
  v34 = sub_23637AB74();
LABEL_40:
  v47[0] = v34;
  v35 = (_QWORD *)swift_bridgeObjectRetain();
  sub_236362488(v35, 1, v47);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 280) = v47[0];
  return swift_task_switch();
}

uint64_t sub_236363190()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = v0[33];
  v0[36] = *(_QWORD *)(v1 + 112);
  v0[37] = *(_QWORD *)(v1 + 120);
  swift_bridgeObjectRetain();
  return swift_task_switch();
}

void sub_2363631DC()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  if (v0[37])
  {
    v1 = v0[35];
    v2 = (void *)sub_23637A820();
    swift_bridgeObjectRelease();
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    v0[6] = sub_2363633F0;
    v0[7] = v3;
    v0[2] = MEMORY[0x24BDAC760];
    v0[3] = 1107296256;
    v0[4] = sub_236362414;
    v0[5] = &block_descriptor;
    v4 = _Block_copy(v0 + 2);
    swift_release();
    AnalyticsSendEventLazy();
    _Block_release(v4);

    ((void (*)(void))v0[1])();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2363632B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2363632F4(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 7)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_236363308(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDC58);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7F1524]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2363633CC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2363633F0()
{
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

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_236363410(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 7)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_236363424()
{
  unint64_t result;

  result = qword_2563DDC68;
  if (!qword_2563DDC68)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2563DDC68);
  }
  return result;
}

ValueMetadata *type metadata accessor for CoreAnalyticsReporter()
{
  return &type metadata for CoreAnalyticsReporter;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RequestManagerError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for RequestManagerError(uint64_t result, int a2, int a3)
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

uint64_t sub_2363634CC()
{
  return 0;
}

ValueMetadata *type metadata accessor for RequestManagerError()
{
  return &type metadata for RequestManagerError;
}

BOOL sub_2363634E8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void sub_2363634FC()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultSessionConfiguration);
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0ACD8]), sel_init);
  objc_msgSend(v0, sel_set_appleIDContext_, v1);

  qword_2563DFD70 = (uint64_t)v0;
}

uint64_t initializeBufferWithCopyOfBuffer for AuthenticationHeadersProvider(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = v3;
  v6 = v4;
  return a1;
}

void destroy for AuthenticationHeadersProvider(id *a1)
{

}

uint64_t assignWithCopy for AuthenticationHeadersProvider(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  v7 = *(void **)(a1 + 8);
  v8 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v8;
  v9 = v8;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
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

uint64_t assignWithTake for AuthenticationHeadersProvider(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AuthenticationHeadersProvider(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 17))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AuthenticationHeadersProvider(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthenticationHeadersProvider()
{
  return &type metadata for AuthenticationHeadersProvider;
}

uint64_t sub_236363748(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    __asm { BR              X9 }
  sub_23637AA18();
  sub_23637A880();
  type metadata accessor for ACAccountCredentialRenewResult(0);
  sub_23637AB20();
  return 0;
}

uint64_t sub_236363868()
{
  uint64_t v0;

  return sub_236363748(*(_QWORD *)v0, *(_BYTE *)(v0 + 8));
}

void sub_236363874(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDCC0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_2363649FC;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_236363BE0;
  aBlock[3] = &block_descriptor_0;
  v11 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_authenticateWithContext_completion_, a3, v11);
  _Block_release(v11);
}

void sub_2363639AC(uint64_t a1, id a2)
{
  id v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v13[2];
  __int128 v14;
  __int128 v15;

  if (a2)
  {
    *(_QWORD *)&v14 = a2;
    v2 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDCC0);
    sub_23637A8BC();
    return;
  }
  if (!a1)
    goto LABEL_10;
  v4 = sub_23637A844();
  if (!*(_QWORD *)(a1 + 16) || (sub_236370B50(v4, v5), (v6 & 1) == 0))
  {
    swift_bridgeObjectRelease();
LABEL_10:
    v8 = 0;
    v14 = 0u;
    v15 = 0u;
LABEL_11:
    sub_236364A64((uint64_t)&v14);
    goto LABEL_12;
  }
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  objc_opt_self();
  v7 = (void *)swift_dynamicCastObjCClass();
  if (!v7)
  {
    swift_unknownObjectRelease();
    goto LABEL_10;
  }
  v8 = v7;
  *(_QWORD *)&v13[0] = 0xD000000000000022;
  *((_QWORD *)&v13[0] + 1) = 0x800000023637C4D0;
  v9 = v7;
  v10 = objc_msgSend(v9, sel___swift_objectForKeyedSubscript_, sub_23637AC10());
  swift_unknownObjectRelease();

  if (v10)
  {
    sub_23637A9DC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
  }
  sub_236364AA4((uint64_t)v13, (uint64_t)&v14);
  if (!*((_QWORD *)&v15 + 1))
    goto LABEL_11;
  if ((swift_dynamicCast() & 1) != 0)
  {
    v14 = v13[0];
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDCC0);
    sub_23637A8C8();

    return;
  }
LABEL_12:
  sub_2363648DC();
  v11 = swift_allocError();
  *(_QWORD *)v12 = 2;
  *(_BYTE *)(v12 + 8) = 1;
  *(_QWORD *)&v14 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDCC0);
  sub_23637A8BC();

}

uint64_t sub_236363BE0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;

  v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDCC8);
    v4 = sub_23637A7FC();
  }
  swift_retain();
  v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

unint64_t sub_236363C70()
{
  return 0xD00000000000001DLL;
}

uint64_t sub_236363C8C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);

  v4 = *v1;
  v5 = v1[1];
  v6 = *((unsigned __int8 *)v1 + 16);
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2563DDC98 + dword_2563DDC98);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_236362118;
  return v9(a1, v4, v5, v6);
}

uint64_t sub_236363D0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return swift_task_switch();
}

uint64_t sub_236363D24()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD *v13;
  uint64_t v15;

  v1 = *(void **)(v0 + 32);
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0ACB8]), sel_init);
  *(_QWORD *)(v0 + 48) = v2;
  objc_msgSend(v2, sel_setAuthenticationType_, 1);
  objc_msgSend(v2, sel_setIsUsernameEditable_, 0);
  objc_msgSend(v2, sel_setServiceType_, 1);
  v3 = (void *)sub_23637A820();
  objc_msgSend(v2, sel_setServiceIdentifier_, v3);

  objc_msgSend(v2, sel_setShouldUpdatePersistentServiceTokens_, 1);
  v4 = objc_msgSend(v1, sel_aida_alternateDSID);
  if (v4)
  {
    v5 = v4;
    v6 = sub_23637A844();
    v8 = v7;
    swift_bridgeObjectRelease();
    v9 = HIBYTE(v8) & 0xF;
    if ((v8 & 0x2000000000000000) == 0)
      v9 = v6 & 0xFFFFFFFFFFFFLL;
    if (v9)
      objc_msgSend(v2, sel_setAltDSID_, v5);

  }
  v10 = *(void **)(v0 + 40);
  if (v10)
  {
    v11 = swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v11;
    *(_QWORD *)(v11 + 16) = v10;
    *(_QWORD *)(v11 + 24) = v2;
    v12 = v10;
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v13;
    *v13 = v0;
    v13[1] = sub_236363F44;
    return sub_23637AC04();
  }
  else
  {
    sub_2363648DC();
    swift_allocError();
    *(_QWORD *)v15 = 1;
    *(_BYTE *)(v15 + 8) = 1;
    swift_willThrow();

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_236363F44()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236363FB0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 40);

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_236363FEC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 40);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236364030(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v3 + 80) = a3;
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = a2;
  v4 = sub_23637A7E4();
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 48) = swift_task_alloc();
  *(_QWORD *)(v3 + 56) = swift_task_alloc();
  *(_QWORD *)(v3 + 64) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2363640B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  const char *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;

  if ((*(_BYTE *)(v0 + 80) & 1) != 0)
  {
    if (qword_2563DDA98 != -1)
      swift_once();
    v2 = (uint64_t *)(v0 + 56);
    v1 = *(_QWORD *)(v0 + 56);
    v3 = *(_QWORD *)(v0 + 32);
    v4 = *(_QWORD *)(v0 + 40);
    v5 = __swift_project_value_buffer(v3, (uint64_t)qword_2563DFDB8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v5, v3);
    v6 = sub_23637A7CC();
    v7 = sub_23637A988();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      v9 = "Forcing GS token refresh due to retry…";
LABEL_16:
      _os_log_impl(&dword_23635F000, v6, v7, v9, v8, 2u);
      v31 = *v2;
      MEMORY[0x23B7F15E4](v8, -1, -1);
LABEL_18:
      v32 = *(_QWORD *)(v0 + 32);
      v33 = *(_QWORD *)(v0 + 40);

      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v31, v32);
      v34 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 72) = v34;
      *v34 = v0;
      v34[1] = sub_236364428;
      v35 = *(_QWORD *)(v0 + 24);
      v34[4] = *(_QWORD *)(v0 + 16);
      v34[5] = v35;
      return swift_task_switch();
    }
    goto LABEL_17;
  }
  v10 = *(void **)(v0 + 16);
  v11 = (void *)sub_23637A820();
  v12 = objc_msgSend(v10, sel_aida_tokenWithExpiryCheckForService_, v11);

  if (!v12)
  {
    if (qword_2563DDA98 != -1)
      swift_once();
    v2 = (uint64_t *)(v0 + 48);
    v27 = *(_QWORD *)(v0 + 48);
    v28 = *(_QWORD *)(v0 + 32);
    v29 = *(_QWORD *)(v0 + 40);
    v30 = __swift_project_value_buffer(v28, (uint64_t)qword_2563DFDB8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v27, v30, v28);
    v6 = sub_23637A7CC();
    v7 = sub_23637A988();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      v9 = "Did not find cached valid GS token, fetching a new one…";
      goto LABEL_16;
    }
LABEL_17:
    v31 = *v2;
    goto LABEL_18;
  }
  v13 = sub_23637A844();
  v15 = v14;

  if (qword_2563DDA98 != -1)
    swift_once();
  v16 = *(_QWORD *)(v0 + 64);
  v17 = *(_QWORD *)(v0 + 32);
  v18 = *(_QWORD *)(v0 + 40);
  v19 = __swift_project_value_buffer(v17, (uint64_t)qword_2563DFDB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v16, v19, v17);
  v20 = sub_23637A7CC();
  v21 = sub_23637A988();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_23635F000, v20, v21, "Using cached GS token", v22, 2u);
    MEMORY[0x23B7F15E4](v22, -1, -1);
  }
  v23 = *(_QWORD *)(v0 + 64);
  v24 = *(_QWORD *)(v0 + 32);
  v25 = *(_QWORD *)(v0 + 40);

  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v13, v15);
}

uint64_t sub_236364428(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *v3;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v7 = swift_task_dealloc();
  if (!v2)
  {
    v7 = a1;
    v8 = a2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
}

uint64_t sub_2363644AC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v4 + 160) = a4;
  *(_QWORD *)(v4 + 80) = a2;
  *(_QWORD *)(v4 + 88) = a3;
  v5 = sub_23637A868();
  *(_QWORD *)(v4 + 96) = v5;
  *(_QWORD *)(v4 + 104) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 112) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_236364510()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = *(void **)(v0 + 80);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v2, sel_aida_accountForPrimaryiCloudAccount);
    *(_QWORD *)(v0 + 120) = v3;
    if (v3)
    {
      v4 = (uint64_t)v3;
      v5 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 128) = v5;
      *v5 = v0;
      v5[1] = sub_2363645F0;
      return sub_236364030(v4, *(_QWORD *)(v0 + 88), *(_BYTE *)(v0 + 160));
    }

  }
  sub_2363648DC();
  swift_allocError();
  *(_QWORD *)v7 = 0;
  *(_BYTE *)(v7 + 8) = 1;
  swift_willThrow();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2363645F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v4 = (_QWORD *)*v3;
  v4[17] = a1;
  v4[18] = a2;
  v4[19] = v2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236364660()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t inited;
  unint64_t v20;

  v1 = objc_msgSend(*(id *)(v0 + 120), sel_aida_alternateDSID);
  if (!v1)
  {
    v9 = *(void **)(v0 + 120);
    v10 = *(void **)(v0 + 80);
    swift_bridgeObjectRelease();
    sub_2363648DC();
    swift_allocError();
    v12 = 3;
    goto LABEL_5;
  }
  v2 = v1;
  v4 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 96);
  sub_23637A844();

  sub_23637A880();
  sub_23637A880();
  swift_bridgeObjectRelease();
  sub_23637A85C();
  v6 = sub_23637A850();
  v8 = v7;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (v8 >> 60 == 15)
  {
    v9 = *(void **)(v0 + 120);
    v10 = *(void **)(v0 + 80);
    sub_2363648DC();
    swift_allocError();
    v12 = 4;
LABEL_5:
    *(_QWORD *)v11 = v12;
    *(_BYTE *)(v11 + 8) = 1;
    swift_willThrow();

    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v14 = *(void **)(v0 + 120);
  v15 = *(void **)(v0 + 80);
  v16 = sub_23637A73C();
  v18 = v17;
  sub_236364920(v6, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDCB0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23637B860;
  *(_QWORD *)(inited + 32) = 0xD000000000000010;
  *(_QWORD *)(inited + 40) = 0x800000023637C640;
  *(_QWORD *)(inited + 48) = v16;
  *(_QWORD *)(inited + 56) = v18;
  v20 = sub_2363703E8(inited);

  swift_task_dealloc();
  return (*(uint64_t (**)(unint64_t))(v0 + 8))(v20);
}

uint64_t sub_236364898()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 80);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_2363648DC()
{
  unint64_t result;

  result = qword_2563DDCA0;
  if (!qword_2563DDCA0)
  {
    result = MEMORY[0x23B7F153C](&unk_23637B81C, &type metadata for AuthenticationHeadersProvider.AuthenticationError);
    atomic_store(result, &qword_2563DDCA0);
  }
  return result;
}

uint64_t sub_236364920(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_236364934(a1, a2);
  return a1;
}

uint64_t sub_236364934(uint64_t a1, unint64_t a2)
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_236364990(uint64_t a1)
{
  uint64_t v1;

  sub_236363874(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_236364998()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDCC0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

void sub_2363649FC(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDCC0);
  sub_2363639AC(a1, a2);
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

uint64_t sub_236364A64(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563DDCD0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_236364AA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563DDCD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for AuthenticationHeadersProvider.AuthenticationError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AuthenticationHeadersProvider.AuthenticationError(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_236364B50(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_236364B6C(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthenticationHeadersProvider.AuthenticationError()
{
  return &type metadata for AuthenticationHeadersProvider.AuthenticationError;
}

void destroy for HTTPHeadersProviderError(uint64_t a1)
{
  swift_bridgeObjectRelease();

}

_QWORD *_s16AppleCareSupport24HTTPHeadersProviderErrorVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[2];
  swift_bridgeObjectRetain();
  v5 = v4;
  a1[2] = v4;
  return a1;
}

_QWORD *assignWithCopy for HTTPHeadersProviderError(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  id v5;
  void *v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[2];
  v5 = v4;
  v6 = (void *)a1[2];
  a1[2] = v4;

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

uint64_t assignWithTake for HTTPHeadersProviderError(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for HTTPHeadersProviderError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for HTTPHeadersProviderError(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HTTPHeadersProviderError()
{
  return &type metadata for HTTPHeadersProviderError;
}

uint64_t initializeBufferWithCopyOfBuffer for HandoffRequest(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for HandoffRequest()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for HandoffRequest(_QWORD *a1, _QWORD *a2)
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
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for HandoffRequest(_QWORD *a1, _QWORD *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for HandoffRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HandoffRequest(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for HandoffRequest(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HandoffRequest()
{
  return &type metadata for HandoffRequest;
}

uint64_t sub_236364FF0(char a1)
{
  return *(_QWORD *)&aSource_0[8 * a1];
}

BOOL sub_236365010(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_236365024()
{
  sub_23637AC7C();
  sub_23637AC88();
  return sub_23637AC94();
}

uint64_t sub_236365068()
{
  return sub_23637AC88();
}

uint64_t sub_236365090()
{
  sub_23637AC7C();
  sub_23637AC88();
  return sub_23637AC94();
}

uint64_t sub_2363650D0()
{
  char *v0;

  return sub_236364FF0(*v0);
}

uint64_t sub_2363650D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_236365700(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2363650FC()
{
  return 0;
}

void sub_236365108(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_236365114()
{
  sub_2363653BC();
  return sub_23637AD54();
}

uint64_t sub_23636513C()
{
  sub_2363653BC();
  return sub_23637AD60();
}

uint64_t sub_236365164(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];
  uint64_t v11;
  char v12;
  char v13;
  char v14;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDCE0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2363653BC();
  sub_23637ACAC();
  v14 = 0;
  sub_23637ABC8();
  if (!v2)
  {
    v13 = 1;
    sub_23637ABC8();
    v12 = 2;
    sub_23637ABC8();
    v11 = *(_QWORD *)(v3 + 48);
    v10[15] = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDCF0);
    sub_236365BA8(&qword_2563DDCF8, MEMORY[0x24BEE0D08], MEMORY[0x24BEE04C0]);
    sub_23637ABD4();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

double sub_236365304@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;
  uint64_t v8;

  sub_236365888(a1, (uint64_t *)v6);
  if (!v2)
  {
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(_QWORD *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t sub_236365350(_QWORD *a1)
{
  return sub_236365164(a1);
}

uint64_t sub_236365364(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[3];
  uint64_t v6;
  _OWORD v7[3];
  uint64_t v8;

  v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  v5[2] = *(_OWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 48);
  return sub_236365660(v5, v7) & 1;
}

unint64_t sub_2363653BC()
{
  unint64_t result;

  result = qword_2563DDCE8;
  if (!qword_2563DDCE8)
  {
    result = MEMORY[0x23B7F153C](&unk_23637BA2C, &type metadata for HandoffRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563DDCE8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7F1530](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_236365444(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  _QWORD *v24;
  char v26;
  int64_t v27;

  if (result == a2)
    return 1;
  v3 = result;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v4 = 0;
  v5 = result + 64;
  v6 = 1 << *(_BYTE *)(result + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(result + 64);
  v27 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      v9 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v10 = v9 | (v4 << 6);
      goto LABEL_25;
    }
    v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v11 >= v27)
      return 1;
    v12 = *(_QWORD *)(v5 + 8 * v11);
    ++v4;
    if (!v12)
    {
      v4 = v11 + 1;
      if (v11 + 1 >= v27)
        return 1;
      v12 = *(_QWORD *)(v5 + 8 * v4);
      if (!v12)
      {
        v4 = v11 + 2;
        if (v11 + 2 >= v27)
          return 1;
        v12 = *(_QWORD *)(v5 + 8 * v4);
        if (!v12)
        {
          v4 = v11 + 3;
          if (v11 + 3 >= v27)
            return 1;
          v12 = *(_QWORD *)(v5 + 8 * v4);
          if (!v12)
            break;
        }
      }
    }
LABEL_24:
    v8 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v4 << 6);
LABEL_25:
    v14 = 16 * v10;
    v15 = (uint64_t *)(*(_QWORD *)(v3 + 48) + v14);
    v16 = *v15;
    v17 = v15[1];
    v18 = (uint64_t *)(*(_QWORD *)(v3 + 56) + v14);
    v20 = *v18;
    v19 = v18[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v21 = sub_236370B50(v16, v17);
    v23 = v22;
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    v24 = (_QWORD *)(*(_QWORD *)(a2 + 56) + 16 * v21);
    if (*v24 == v20 && v24[1] == v19)
    {
      result = swift_bridgeObjectRelease();
    }
    else
    {
      v26 = sub_23637ABEC();
      result = swift_bridgeObjectRelease();
      if ((v26 & 1) == 0)
        return 0;
    }
  }
  v13 = v11 + 4;
  if (v13 >= v27)
    return 1;
  v12 = *(_QWORD *)(v5 + 8 * v13);
  if (v12)
  {
    v4 = v13;
    goto LABEL_24;
  }
  while (1)
  {
    v4 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v4 >= v27)
      return 1;
    v12 = *(_QWORD *)(v5 + 8 * v4);
    ++v13;
    if (v12)
      goto LABEL_24;
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_236365660(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  BOOL v5;

  v4 = *a1 == *a2 && a1[1] == a2[1];
  if ((v4 || (sub_23637ABEC() & 1) != 0)
    && (a1[2] == a2[2] ? (v5 = a1[3] == a2[3]) : (v5 = 0),
        (v5 || (sub_23637ABEC() & 1) != 0) && (a1[4] == a2[4] && a1[5] == a2[5] || (sub_23637ABEC() & 1) != 0)))
  {
    return sub_236365444(a1[6], a2[6]);
  }
  else
  {
    return 0;
  }
}

uint64_t sub_236365700(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x656372756F73 && a2 == 0xE600000000000000;
  if (v3 || (sub_23637ABEC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x72656C6C6163 && a2 == 0xE600000000000000 || (sub_23637ABEC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6575737369 && a2 == 0xE500000000000000 || (sub_23637ABEC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x736E6F6974706FLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23637ABEC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_236365888@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
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
  uint64_t v17;
  uint64_t result;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  char v30;
  char v31;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDD00);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_2363703E8(MEMORY[0x24BEE4AF8]);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2363653BC();
  sub_23637ACA0();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    v25 = a2;
    v31 = 0;
    v9 = sub_23637ABB0();
    v11 = v10;
    v30 = 1;
    swift_bridgeObjectRetain();
    v12 = sub_23637ABB0();
    v24 = v13;
    v22 = v12;
    v23 = v9;
    v29 = 2;
    swift_bridgeObjectRetain();
    v21 = sub_23637ABB0();
    v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDCF0);
    v28 = 3;
    sub_236365BA8(&qword_2563DDD08, MEMORY[0x24BEE0D38], MEMORY[0x24BEE04E0]);
    swift_bridgeObjectRetain();
    sub_23637ABBC();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v16 = v27;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v17 = v24;
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    v19 = v25;
    *v25 = v23;
    v19[1] = v11;
    v19[2] = v22;
    v19[3] = v17;
    v19[4] = v21;
    v19[5] = v15;
    v19[6] = v16;
  }
  return result;
}

uint64_t sub_236365BA8(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  _QWORD v8[2];

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563DDCF0);
    v8[0] = a2;
    v8[1] = a2;
    result = MEMORY[0x23B7F153C](a3, v7, v8);
    atomic_store(result, a1);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HandoffRequest.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HandoffRequest.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_236365CF0 + 4 * byte_23637B8D5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_236365D24 + 4 * byte_23637B8D0[v4]))();
}

uint64_t sub_236365D24(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_236365D2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x236365D34);
  return result;
}

uint64_t sub_236365D40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x236365D48);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_236365D4C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_236365D54(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_236365D60(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_236365D68(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HandoffRequest.CodingKeys()
{
  return &type metadata for HandoffRequest.CodingKeys;
}

unint64_t sub_236365D84()
{
  unint64_t result;

  result = qword_2563DDD10;
  if (!qword_2563DDD10)
  {
    result = MEMORY[0x23B7F153C](&unk_23637BA04, &type metadata for HandoffRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563DDD10);
  }
  return result;
}

unint64_t sub_236365DCC()
{
  unint64_t result;

  result = qword_2563DDD18;
  if (!qword_2563DDD18)
  {
    result = MEMORY[0x23B7F153C](&unk_23637B974, &type metadata for HandoffRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563DDD18);
  }
  return result;
}

unint64_t sub_236365E14()
{
  unint64_t result;

  result = qword_2563DDD20;
  if (!qword_2563DDD20)
  {
    result = MEMORY[0x23B7F153C](&unk_23637B99C, &type metadata for HandoffRequest.CodingKeys);
    atomic_store(result, &qword_2563DDD20);
  }
  return result;
}

uint64_t sub_236365E58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return swift_task_switch();
}

uint64_t sub_236365E74()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v2 = v0[5];
  v1 = v0[6];
  v4 = v0[3];
  v3 = v0[4];
  v5 = sub_23637A664();
  v0[7] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v0[8] = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v3, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDCF0);
  v7 = (_QWORD *)swift_task_alloc();
  v0[9] = v7;
  v7[2] = v1;
  v7[3] = v4;
  v7[4] = v2;
  v8 = (_QWORD *)swift_task_alloc();
  v0[10] = v8;
  *v8 = v0;
  v8[1] = sub_236365F54;
  return sub_23637ABA4();
}

uint64_t sub_236365F54()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236365FC0()
{
  uint64_t v0;
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;

  v1 = 0;
  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v2 + 64);
  v12 = v2 + 64;
  v4 = -1;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  if (-v5 < 64)
    v4 = ~(-1 << -(char)v5);
  v6 = v4 & v3;
  v7 = (unint64_t)(63 - v5) >> 6;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_5;
    }
    v9 = v1 + 1;
    if (__OFADD__(v1, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v9 >= v7)
      goto LABEL_23;
    v10 = *(_QWORD *)(v12 + 8 * v9);
    ++v1;
    if (!v10)
    {
      v1 = v9 + 1;
      if (v9 + 1 >= v7)
        goto LABEL_23;
      v10 = *(_QWORD *)(v12 + 8 * v1);
      if (!v10)
      {
        v1 = v9 + 2;
        if (v9 + 2 >= v7)
          goto LABEL_23;
        v10 = *(_QWORD *)(v12 + 8 * v1);
        if (!v10)
        {
          v1 = v9 + 3;
          if (v9 + 3 >= v7)
            goto LABEL_23;
          v10 = *(_QWORD *)(v12 + 8 * v1);
          if (!v10)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v10 - 1) & v10;
LABEL_5:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23637A658();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v11 = v9 + 4;
  if (v11 >= v7)
  {
LABEL_23:
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v10 = *(_QWORD *)(v12 + 8 * v11);
  if (v10)
  {
    v1 = v11;
    goto LABEL_22;
  }
  while (1)
  {
    v1 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v1 >= v7)
      goto LABEL_23;
    v10 = *(_QWORD *)(v12 + 8 * v1);
    ++v11;
    if (v10)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_236366188()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 24);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v3, v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2363661DC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v14;
  _BYTE v15[24];
  uint64_t v16;
  uint64_t v17;

  if (*(_QWORD *)(a1 + 24))
  {
    sub_23636F540((__int128 *)a1, (uint64_t)v15);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v3;
    *v3 = 0x8000000000000000;
    v7 = v16;
    v8 = v17;
    v9 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v15, v16);
    MEMORY[0x24BDAC7A8](v9, v9);
    v11 = &v15[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
    (*(void (**)(_BYTE *))(v12 + 16))(v11);
    sub_23636E330((uint64_t)v11, a2, a3, isUniquelyReferenced_nonNull_native, &v14, v7, v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    *v3 = v14;
    swift_bridgeObjectRelease();
    return sub_236363410(a2, a3);
  }
  else
  {
    sub_23636FCC8(a1, &qword_2563DDF18);
    sub_23636D48C(a2, a3, (uint64_t)v15);
    sub_236363410(a2, a3);
    return sub_23636FCC8((uint64_t)v15, &qword_2563DDF18);
  }
}

uint64_t sub_236366320()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDE40);
  MEMORY[0x24BDAC7A8](v0, v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23637A724();
  __swift_allocate_value_buffer(v4, qword_2563DFD78);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_2563DFD78);
  sub_23637A700();
  v6 = *(_QWORD *)(v4 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v3, 1, v4);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(v5, v3, v4);
  __break(1u);
  return result;
}

char *BatteryServiceBookingCoordinator.__allocating_init()()
{
  uint64_t v0;
  id v1;
  char *v2;
  uint64_t v4[5];

  swift_allocObject();
  sub_236372D90((uint64_t)&unk_2563DE338, 0, (uint64_t)sub_236372ACC, 0, v4);
  type metadata accessor for UserDefaultsActor();
  v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 112) = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BatteryServiceOptions()), sel_init);
  v2 = sub_23636DEB0((uint64_t)v4, (uint64_t)sub_23636699C, 0, v0, v1);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v2;
}

char *BatteryServiceBookingCoordinator.init()()
{
  uint64_t v0;
  id v1;
  char *v2;
  uint64_t v4[5];

  sub_236372D90((uint64_t)&unk_2563DE338, 0, (uint64_t)sub_236372ACC, 0, v4);
  type metadata accessor for UserDefaultsActor();
  v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 112) = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BatteryServiceOptions()), sel_init);
  v2 = sub_23636DEB0((uint64_t)v4, (uint64_t)sub_23636699C, 0, v0, v1);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v2;
}

char *BatteryServiceBookingCoordinator.__allocating_init(options:)(void *a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v5[5];

  swift_allocObject();
  sub_236372D90((uint64_t)&unk_2563DE338, 0, (uint64_t)sub_236372ACC, 0, v5);
  type metadata accessor for UserDefaultsActor();
  v2 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v2 + 112) = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v3 = sub_23636DEB0((uint64_t)v5, (uint64_t)sub_23636699C, 0, v2, a1);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v3;
}

char *BatteryServiceBookingCoordinator.init(options:)(void *a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v5[5];

  sub_236372D90((uint64_t)&unk_2563DE338, 0, (uint64_t)sub_236372ACC, 0, v5);
  type metadata accessor for UserDefaultsActor();
  v2 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v2 + 112) = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v3 = sub_23636DEB0((uint64_t)v5, (uint64_t)sub_23636699C, 0, v2, a1);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v3;
}

void sub_23636699C()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v1 = (void *)sub_23637A6F4();
  sub_236370508(MEMORY[0x24BEE4AF8]);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_23637026C(&qword_2563DDBA8, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_23637B544);
  v2 = (id)sub_23637A7F0();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_openURL_options_completionHandler_, v1, v2, 0);

}

uint64_t sub_236366A7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[10] = a3;
  v4[11] = a4;
  v4[8] = a1;
  v4[9] = a2;
  v5 = sub_23637AB14();
  v4[12] = v5;
  v4[13] = *(_QWORD *)(v5 - 8);
  v4[14] = swift_task_alloc();
  v6 = sub_23637AAFC();
  v4[15] = v6;
  v4[16] = *(_QWORD *)(v6 - 8);
  v4[17] = swift_task_alloc();
  v4[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_236366B18()
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
  void (*v10)(uint64_t, uint64_t);
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;

  v2 = v0[17];
  v1 = v0[18];
  v3 = v0[15];
  v4 = v0[16];
  v5 = v0[14];
  v7 = v0[10];
  v6 = v0[11];
  v8 = v0[9];
  type metadata accessor for TelemetryEvent();
  v9 = (_QWORD *)swift_allocObject();
  v0[19] = v9;
  swift_defaultActor_initialize();
  v9[14] = 0;
  v9[15] = 0;
  v9[16] = sub_236370634(MEMORY[0x24BEE4AF8]);
  sub_23637AAE4();
  sub_23637AAD8();
  v10 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v0[20] = v10;
  v10(v2, v3);
  v11 = (_QWORD *)swift_allocObject();
  v0[21] = v11;
  v11[2] = v8;
  v11[3] = v9;
  v11[4] = v7;
  v11[5] = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_23637AB08();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDED0);
  v12 = (_QWORD *)swift_task_alloc();
  v0[22] = v12;
  v12[2] = &unk_2563DDF40;
  v12[3] = v11;
  v12[4] = v1;
  v12[5] = v5;
  v13 = (_QWORD *)swift_task_alloc();
  v0[23] = v13;
  *v13 = v0;
  v13[1] = sub_236366CA0;
  return sub_23637ABA4();
}

uint64_t sub_236366CA0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 192) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236366D0C()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 160);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 120);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 96));
  v1(v2, v3);
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236366DA4()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  id v5;

  v1 = *(void **)(v0 + 192);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 160);
  v3 = *(_QWORD *)(v0 + 144);
  v4 = *(_QWORD *)(v0 + 120);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 96));
  v2(v3, v4);
  swift_release();
  *(_QWORD *)(v0 + 56) = v1;
  v5 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDC70);
  if (swift_dynamicCast())
  {

    *(_OWORD *)(v0 + 200) = *(_OWORD *)(v0 + 40);
  }
  else
  {

  }
  return swift_task_switch();
}

uint64_t sub_236366E7C()
{
  uint64_t v0;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _UNKNOWN **v5;

  v0 = MEMORY[0x24BEE0D00];
  v4 = MEMORY[0x24BEE0D00];
  v5 = &off_2507B0230;
  v2 = 0x6572756C696166;
  v3 = 0xE700000000000000;
  swift_beginAccess();
  sub_2363661DC((uint64_t)&v2, 0, 1uLL);
  v4 = v0;
  v5 = &off_2507B0230;
  v2 = 0xD00000000000002CLL;
  v3 = 0x800000023637CC50;
  sub_2363661DC((uint64_t)&v2, 0, 2uLL);
  swift_endAccess();
  return swift_task_switch();
}

uint64_t sub_236366F54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t *v6;

  v2 = *(_QWORD *)(v0 + 200);
  v1 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 152);
  sub_23636FFBC();
  v4 = swift_allocError();
  *v5 = v2;
  v5[1] = v1;
  sub_23636FF78();
  swift_allocError();
  *v6 = v4;
  v6[1] = v3;
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23636700C()
{
  sub_2363721C4(0xD00000000000001DLL, 0x800000023637CC30);
  return swift_task_switch();
}

uint64_t sub_236367060()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 152);
  sub_23636FF78();
  swift_allocError();
  *v3 = v1;
  v3[1] = v2;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2363670E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[13] = a4;
  v5[14] = a5;
  v5[11] = a2;
  v5[12] = a3;
  v5[10] = a1;
  v6 = sub_23637A724();
  v5[15] = v6;
  v5[16] = *(_QWORD *)(v6 - 8);
  v5[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_236367148()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t inited;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;

  v1 = v0[14];
  if (v1)
  {
    v2 = v0[13];
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDCB0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23637B860;
    *(_QWORD *)(inited + 32) = sub_23637A844();
    *(_QWORD *)(inited + 40) = v4;
    *(_QWORD *)(inited + 48) = v2;
    *(_QWORD *)(inited + 56) = v1;
    swift_bridgeObjectRetain();
    v5 = inited;
  }
  else
  {
    v5 = MEMORY[0x24BEE4AF8];
  }
  v6 = sub_2363703E8(v5);
  v0[18] = v6;
  v7 = (_QWORD *)swift_task_alloc();
  v0[19] = (uint64_t)v7;
  *v7 = v0;
  v7[1] = sub_236367214;
  return sub_236368D34(v0[17], v0[12], v6);
}

uint64_t sub_236367214()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_236367280()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 128);
  v1 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 96);
  v5 = *(_QWORD *)(v0 + 80);
  v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2563DDED0) + 48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v5, v1, v3);
  *(_QWORD *)(v5 + v6) = v4;
  swift_retain();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236367304()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236367340()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 104) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDD30);
  *(_QWORD *)(v1 + 112) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23636739C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  char *v8;

  v2 = v0[13];
  v1 = v0[14];
  v0[12] = 0;
  v3 = v2 + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_clock;
  sub_23637AA84();
  v4 = sub_23637AA9C();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v1, 0, 1, v4);
  v5 = v2 + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_lastPrepareInstant;
  swift_beginAccess();
  sub_23636FB14(v1, v5, &qword_2563DDD30);
  swift_endAccess();
  v8 = (char *)&dword_2563DE428 + dword_2563DE428;
  swift_retain();
  v6 = (_QWORD *)swift_task_alloc();
  v0[15] = v6;
  *v6 = v0;
  v6[1] = sub_2363674A4;
  return ((uint64_t (*)(uint64_t, _QWORD *, _QWORD))v8)(v3, v0 + 12, v0[13]);
}

uint64_t sub_2363674A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v4 = (_QWORD *)*v3;
  v4[2] = v3;
  v4[3] = a1;
  v4[4] = a2;
  v4[5] = v2;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23636750C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 96);
  *(_QWORD *)(v0 + 128) = v1;
  if (v1)
  {
    *(int8x16_t *)(v0 + 136) = vextq_s8(*(int8x16_t *)(v0 + 24), *(int8x16_t *)(v0 + 24), 8uLL);
    swift_retain();
    return swift_task_switch();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_236367564()
{
  double v0;
  uint64_t v1;
  double v3[5];

  v0 = (double)sub_23637AD48();
  sub_23637AD48();
  *(_QWORD *)&v3[3] = MEMORY[0x24BEE13C8];
  *(_QWORD *)&v3[4] = &off_2507B0250;
  v3[0] = (double)v1 * 1.0e-18 + v0;
  swift_beginAccess();
  sub_2363661DC((uint64_t)v3, 0, 0);
  swift_endAccess();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_236367640()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 96);
  *(_QWORD *)(v0 + 152) = v1;
  if (v1)
  {
    swift_retain();
    return swift_task_switch();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23636768C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 152);
  sub_23637AA18();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 112) = 0xD000000000000022;
  *(_QWORD *)(v1 + 120) = 0x800000023637C790;
  swift_release();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

void sub_23636771C()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  void (*v3)(uint64_t);

  v1 = v0[12];
  v0[20] = v1;
  if (v1)
  {
    v3 = (void (*)(uint64_t))((char *)&dword_2563DDC50 + dword_2563DDC50);
    swift_retain();
    v2 = (_QWORD *)swift_task_alloc();
    v0[21] = v2;
    *v2 = v0;
    v2[1] = sub_236367798;
    v3(v1);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_236367798()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 176) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_23636780C()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23636784C()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236367894(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[9] = a1;
  v2[10] = a2;
  v2[11] = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDED0);
  v2[12] = swift_task_alloc();
  v3 = sub_23637A7E4();
  v2[13] = v3;
  v2[14] = *(_QWORD *)(v3 - 8);
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23636793C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  uint64_t result;
  uint64_t v15;
  _QWORD *v16;
  uint64_t (*v17)(uint64_t);

  if (qword_2563DDA98 != -1)
    swift_once();
  v1 = v0[17];
  v2 = v0[13];
  v3 = v0[14];
  v4 = __swift_project_value_buffer(v2, (uint64_t)qword_2563DFDB8);
  v0[18] = v4;
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[19] = v5;
  v5(v1, v4, v2);
  v6 = sub_23637A7CC();
  v7 = sub_23637A988();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_23635F000, v6, v7, "Preparing battery service booking flow.", v8, 2u);
    MEMORY[0x23B7F15E4](v8, -1, -1);
  }
  v9 = v0[17];
  v10 = v0[13];
  v11 = v0[14];
  v12 = v0[10];

  v13 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
  v0[20] = v13;
  result = v13(v9, v10);
  v15 = *(_QWORD *)(v12 + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_retrieveSupportHandoffURLTask);
  v0[21] = v15;
  if (v15)
  {
    v17 = (uint64_t (*)(uint64_t))((char *)&dword_2563DDED8 + dword_2563DDED8);
    swift_retain();
    v16 = (_QWORD *)swift_task_alloc();
    v0[22] = v16;
    *v16 = v0;
    v16[1] = sub_236367AB8;
    return v17(v0[12]);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_236367AB8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_236367B2C()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t result;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 152);
  v3 = *(_QWORD *)(v0 + 128);
  v5 = *(_QWORD *)(v0 + 96);
  v4 = *(_QWORD *)(v0 + 104);
  **(_QWORD **)(v0 + 72) = *(_QWORD *)(v5 + *(int *)(*(_QWORD *)(v0 + 88) + 48));
  swift_release();
  v6 = sub_23637A724();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v2(v3, v1, v4);
  v7 = sub_23637A7CC();
  v8 = sub_23637A988();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_23635F000, v7, v8, "Successfully prepared battery booking flow.", v9, 2u);
    MEMORY[0x23B7F15E4](v9, -1, -1);
  }
  v10 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 160);
  v11 = *(_QWORD *)(v0 + 128);
  v12 = *(_QWORD *)(v0 + 104);
  v13 = *(uint64_t **)(v0 + 72);

  result = v10(v11, v12);
  v15 = *v13;
  *(_QWORD *)(v0 + 192) = *v13;
  if (v15)
  {
    swift_retain();
    return swift_task_switch();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_236367C68()
{
  uint64_t v0;
  __int128 v2;
  __int128 v3;
  _UNKNOWN **v4;

  *((_QWORD *)&v3 + 1) = MEMORY[0x24BEE0D00];
  v4 = &off_2507B0230;
  *(_QWORD *)&v2 = 0x73736563637573;
  *((_QWORD *)&v2 + 1) = 0xE700000000000000;
  swift_beginAccess();
  sub_2363661DC((uint64_t)&v2, 0, 1uLL);
  v4 = 0;
  v2 = 0u;
  v3 = 0u;
  sub_2363661DC((uint64_t)&v2, 0, 2uLL);
  swift_endAccess();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236367D4C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  NSObject *log;
  id v19;

  v1 = *(void **)(v0 + 184);
  *(_QWORD *)(v0 + 56) = v1;
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 152);
  v4 = *(_QWORD *)(v0 + 120);
  v5 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD **)(v0 + 72);
  v7 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDC70);
  swift_dynamicCast();
  v8 = *(void **)(v0 + 40);
  *v6 = *(_QWORD *)(v0 + 48);
  swift_retain();
  swift_release();
  v3(v4, v2, v5);
  v9 = v8;
  v10 = v8;
  swift_retain();
  v11 = sub_23637A7CC();
  v12 = sub_23637A994();
  if (os_log_type_enabled(v11, v12))
  {
    log = v11;
    v19 = *(id *)(v0 + 184);
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v13 = 138412290;
    v15 = v8;
    v16 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 64) = v16;
    sub_23637A9C4();
    *v14 = v16;

    swift_release();
    _os_log_impl(&dword_23635F000, log, v12, "Could not prepare battery service booking flow: '%@'.", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDEE0);
    swift_arrayDestroy();
    MEMORY[0x23B7F15E4](v14, -1, -1);
    MEMORY[0x23B7F15E4](v13, -1, -1);

    swift_release();
  }
  else
  {

    swift_release();
    swift_release();

  }
  (*(void (**)(_QWORD, _QWORD))(v0 + 160))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 104));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2363680E8(const void *a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  swift_retain();
  v3 = (_QWORD *)swift_task_alloc();
  v2[4] = v3;
  *v3 = v2;
  v3[1] = sub_2363702B0;
  return sub_236367340();
}

uint64_t sub_236368148()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[18] = v0;
  v2 = sub_23637AA9C();
  v1[19] = v2;
  v1[20] = *(_QWORD *)(v2 - 8);
  v1[21] = swift_task_alloc();
  v1[22] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDD30);
  v1[23] = swift_task_alloc();
  v1[24] = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDD40);
  v1[25] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_236368204()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = v0[18];
  v0[17] = 0;
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_retrieveSupportHandoffURLTask);
  v0[26] = v2;
  if (v2)
  {
    swift_retain();
    return swift_task_switch();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_236368260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 208) + *(_QWORD *)(**(_QWORD **)(v0 + 208) + 112);
  swift_beginAccess();
  sub_236370228(v2, v1, &qword_2563DDD40);
  *(_DWORD *)(v0 + 312) = swift_getEnumCaseMultiPayload();
  sub_23636FCC8(v1, &qword_2563DDD40);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23636830C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 160);
  v4 = *(_QWORD *)(v0 + 144) + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_lastPrepareInstant;
  swift_beginAccess();
  sub_236370228(v4, v1, &qword_2563DDD30);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  *(_DWORD *)(v0 + 316) = v5;
  v6 = *(_QWORD *)(v0 + 184);
  if (v5)
  {
    sub_23636FCC8(*(_QWORD *)(v0 + 184), &qword_2563DDD30);
    v7 = 0;
    v8 = 0;
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 168);
    v9 = *(_QWORD *)(v0 + 176);
    v11 = *(_QWORD *)(v0 + 152);
    v12 = *(_QWORD *)(v0 + 160);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v12 + 16))(v9, *(_QWORD *)(v0 + 184), v11);
    sub_23636FCC8(v6, &qword_2563DDD30);
    sub_23637AA84();
    v7 = sub_23637AA90();
    v8 = v13;
    v14 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v14(v10, v11);
    v14(v9, v11);
  }
  *(_QWORD *)(v0 + 216) = v7;
  *(_QWORD *)(v0 + 224) = v8;
  v15 = *(_QWORD *)(v0 + 144) + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_clock;
  v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2563DE418 + dword_2563DE418);
  swift_retain();
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 232) = v16;
  *v16 = v0;
  v16[1] = sub_236368494;
  return v18(v15, *(_QWORD *)(v0 + 144), v0 + 136);
}

uint64_t sub_236368494(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 240) = a1;
  *(_QWORD *)(v3 + 248) = a2;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2363684FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 136);
  *(_QWORD *)(v0 + 256) = v1;
  if (v1)
  {
    swift_retain();
    return swift_task_switch();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_236368548()
{
  uint64_t v0;
  BOOL v1;
  BOOL v3[24];
  uint64_t v4;
  _UNKNOWN **v5;

  v1 = *(_DWORD *)(v0 + 312) == 1;
  v4 = MEMORY[0x24BEE1328];
  v5 = &off_2507B0260;
  v3[0] = v1;
  swift_beginAccess();
  sub_2363661DC((uint64_t)v3, 0, 4uLL);
  swift_endAccess();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2363685F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 136);
  if (*(_DWORD *)(v0 + 316))
  {
    *(_QWORD *)(v0 + 272) = v1;
    if (v1)
      goto LABEL_5;
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v0 + 264) = v1;
    if (v1)
    {
LABEL_5:
      swift_retain();
      return swift_task_switch();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_236368668()
{
  double v0;
  uint64_t v1;
  double v3[5];

  v0 = (double)sub_23637AD48();
  sub_23637AD48();
  *(_QWORD *)&v3[3] = MEMORY[0x24BEE13C8];
  *(_QWORD *)&v3[4] = &off_2507B0250;
  v3[0] = (double)v1 * 1.0e-18 + v0;
  swift_beginAccess();
  sub_2363661DC((uint64_t)v3, 0, 5uLL);
  swift_endAccess();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_236368744()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 136);
  *(_QWORD *)(v0 + 272) = v1;
  if (v1)
  {
    swift_retain();
    return swift_task_switch();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_236368790()
{
  double v0;
  uint64_t v1;
  double v3[5];

  v0 = (double)sub_23637AD48();
  sub_23637AD48();
  *(_QWORD *)&v3[3] = MEMORY[0x24BEE13C8];
  *(_QWORD *)&v3[4] = &off_2507B0250;
  v3[0] = (double)v1 * 1.0e-18 + v0;
  swift_beginAccess();
  sub_2363661DC((uint64_t)v3, 0, 0);
  swift_endAccess();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23636886C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 136);
  *(_QWORD *)(v0 + 280) = v1;
  if (v1)
  {
    swift_retain();
    return swift_task_switch();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2363688B8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 280);
  sub_23637AA18();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 112) = 0xD000000000000021;
  *(_QWORD *)(v1 + 120) = 0x800000023637C7C0;
  swift_release();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

void sub_236368948()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  void (*v3)(uint64_t);

  v1 = v0[17];
  v0[36] = v1;
  if (v1)
  {
    v3 = (void (*)(uint64_t))((char *)&dword_2563DDC50 + dword_2563DDC50);
    swift_retain();
    v2 = (_QWORD *)swift_task_alloc();
    v0[37] = v2;
    *v2 = v0;
    v2[1] = sub_2363689C4;
    v3(v1);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2363689C4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 304) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_236368A38()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236368AA0()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236368C30(const void *a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  swift_retain();
  v3 = (_QWORD *)swift_task_alloc();
  v2[4] = v3;
  *v3 = v2;
  v3[1] = sub_236368C90;
  return sub_236368148();
}

uint64_t sub_236368C90()
{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *v1;
  swift_task_dealloc();
  swift_release();
  v3 = *(_QWORD *)(v2 + 24);
  if (v0)
  {
    v4 = (void *)sub_23637A6D0();

    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(v2 + 24), 0);
  }
  _Block_release(*(const void **)(v2 + 24));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_236368D34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4[13] = a3;
  v4[14] = v3;
  v4[11] = a1;
  v4[12] = a2;
  v5 = sub_23637A6E8();
  v4[15] = v5;
  v4[16] = *(_QWORD *)(v5 - 8);
  v4[17] = swift_task_alloc();
  v6 = sub_23637A664();
  v4[18] = v6;
  v4[19] = *(_QWORD *)(v6 - 8);
  v4[20] = swift_task_alloc();
  v7 = sub_23637A7A8();
  v4[21] = v7;
  v4[22] = *(_QWORD *)(v7 - 8);
  v4[23] = swift_task_alloc();
  v8 = sub_23637A7C0();
  v4[24] = v8;
  v4[25] = *(_QWORD *)(v8 - 8);
  v4[26] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDE38);
  v4[27] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDE40);
  v4[28] = swift_task_alloc();
  v4[29] = swift_task_alloc();
  v9 = sub_23637A724();
  v4[30] = v9;
  v4[31] = *(_QWORD *)(v9 - 8);
  v4[32] = swift_task_alloc();
  v4[33] = swift_task_alloc();
  v4[34] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_236368EAC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 280) = *(_QWORD *)(*(_QWORD *)(v0 + 112) + 168);
  return swift_task_switch();
}

uint64_t sub_236368EC8()
{
  _QWORD *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(id *)(v0[35] + 112);
  v2 = (void *)sub_23637A820();
  v3 = objc_msgSend(v1, sel_stringForKey_, v2);

  if (v3)
  {
    v4 = sub_23637A844();
    v6 = v5;

    v0[36] = v4;
    v0[37] = v6;
  }
  return swift_task_switch();
}

uint64_t sub_236368F88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
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
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = *(_QWORD *)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 248);
  v3 = *(_QWORD *)(v0 + 232);
  swift_bridgeObjectRetain();
  sub_23637A700();
  swift_bridgeObjectRelease_n();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    v4 = *(_QWORD *)(v0 + 240);
    v5 = *(_QWORD *)(v0 + 248);
    v6 = *(_QWORD *)(v0 + 224);
    sub_23637A700();
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4);
    if ((_DWORD)result == 1)
    {
      __break(1u);
      return result;
    }
    v8 = *(_QWORD *)(v0 + 232);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 32))(*(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 240));
    sub_23636FCC8(v8, &qword_2563DDE40);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 32))(*(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240));
  }
  v9 = *(_QWORD *)(v0 + 208);
  v10 = *(_QWORD *)(v0 + 216);
  v11 = *(_QWORD *)(v0 + 192);
  v12 = *(_QWORD *)(v0 + 200);
  v14 = *(_QWORD *)(v0 + 176);
  v13 = *(_QWORD *)(v0 + 184);
  v15 = *(_QWORD *)(v0 + 168);
  sub_23637A790();
  sub_23637A7B4();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v9, v11);
  sub_23637A79C();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  v16 = sub_23637A784();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16);
  v19 = *(_QWORD *)(v0 + 216);
  if (v18 == 1)
  {
    sub_23636FCC8(v19, &qword_2563DDE38);
  }
  else
  {
    sub_23637A778();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v19, v16);
  }
  v20 = *(_QWORD *)(v0 + 256);
  v26 = *(_QWORD *)(v0 + 248);
  v27 = *(_QWORD *)(v0 + 240);
  v22 = *(_QWORD *)(v0 + 128);
  v21 = *(_QWORD *)(v0 + 136);
  v23 = *(_QWORD *)(v0 + 120);
  v28 = *(_QWORD *)(v0 + 104);
  *(_QWORD *)(v0 + 72) = 0xD000000000000019;
  *(_QWORD *)(v0 + 80) = 0x800000023637CBB0;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v22 + 104))(v21, *MEMORY[0x24BDCD7A0], v23);
  sub_23636F7B0();
  sub_23637A718();
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDE50);
  sub_23637A6C4();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_23637B860;
  sub_23637A6B8();
  swift_bridgeObjectRelease();
  sub_23637A70C();
  swift_bridgeObjectRelease();
  v24 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
  *(_QWORD *)(v0 + 304) = v24;
  v24(v20, v27);
  sub_23637A634();
  sub_23637A61C();
  sub_23637A6AC();
  swift_allocObject();
  sub_23637A6A0();
  strcpy((char *)(v0 + 16), "ios_settings");
  *(_BYTE *)(v0 + 29) = 0;
  *(_WORD *)(v0 + 30) = -5120;
  *(_QWORD *)(v0 + 32) = 0xD000000000000010;
  *(_QWORD *)(v0 + 40) = 0x800000023637CBD0;
  *(_QWORD *)(v0 + 48) = 0x5F79726574746162;
  *(_QWORD *)(v0 + 56) = 0xEF65636976726573;
  *(_QWORD *)(v0 + 64) = v28;
  sub_23636F7F4();
  swift_bridgeObjectRetain();
  sub_23637A694();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_23637A64C();
  v25 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 312) = v25;
  *v25 = v0;
  v25[1] = sub_236369A50;
  return sub_236369C78(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 96));
}

uint64_t sub_236369510()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
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
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 248) + 56))(*(_QWORD *)(v0 + 232), 1, 1, *(_QWORD *)(v0 + 240));
  v1 = *(_QWORD *)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 248);
  v3 = *(_QWORD *)(v0 + 224);
  sub_23637A700();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 232);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 32))(*(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 240));
    sub_23636FCC8(v5, &qword_2563DDE40);
    v6 = *(_QWORD *)(v0 + 208);
    v7 = *(_QWORD *)(v0 + 216);
    v8 = *(_QWORD *)(v0 + 192);
    v9 = *(_QWORD *)(v0 + 200);
    v11 = *(_QWORD *)(v0 + 176);
    v10 = *(_QWORD *)(v0 + 184);
    v12 = *(_QWORD *)(v0 + 168);
    sub_23637A790();
    sub_23637A7B4();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v6, v8);
    sub_23637A79C();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    v13 = sub_23637A784();
    v14 = *(_QWORD *)(v13 - 8);
    v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v7, 1, v13);
    v16 = *(_QWORD *)(v0 + 216);
    if (v15 == 1)
    {
      sub_23636FCC8(v16, &qword_2563DDE38);
    }
    else
    {
      sub_23637A778();
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v16, v13);
    }
    v17 = *(_QWORD *)(v0 + 256);
    v23 = *(_QWORD *)(v0 + 248);
    v24 = *(_QWORD *)(v0 + 240);
    v19 = *(_QWORD *)(v0 + 128);
    v18 = *(_QWORD *)(v0 + 136);
    v20 = *(_QWORD *)(v0 + 120);
    v25 = *(_QWORD *)(v0 + 104);
    *(_QWORD *)(v0 + 72) = 0xD000000000000019;
    *(_QWORD *)(v0 + 80) = 0x800000023637CBB0;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v19 + 104))(v18, *MEMORY[0x24BDCD7A0], v20);
    sub_23636F7B0();
    sub_23637A718();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDE50);
    sub_23637A6C4();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_23637B860;
    sub_23637A6B8();
    swift_bridgeObjectRelease();
    sub_23637A70C();
    swift_bridgeObjectRelease();
    v21 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    *(_QWORD *)(v0 + 304) = v21;
    v21(v17, v24);
    sub_23637A634();
    sub_23637A61C();
    sub_23637A6AC();
    swift_allocObject();
    sub_23637A6A0();
    strcpy((char *)(v0 + 16), "ios_settings");
    *(_BYTE *)(v0 + 29) = 0;
    *(_WORD *)(v0 + 30) = -5120;
    *(_QWORD *)(v0 + 32) = 0xD000000000000010;
    *(_QWORD *)(v0 + 40) = 0x800000023637CBD0;
    *(_QWORD *)(v0 + 48) = 0x5F79726574746162;
    *(_QWORD *)(v0 + 56) = 0xEF65636976726573;
    *(_QWORD *)(v0 + 64) = v25;
    sub_23636F7F4();
    swift_bridgeObjectRetain();
    sub_23637A694();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    sub_23637A64C();
    v22 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 312) = v22;
    *v22 = v0;
    v22[1] = sub_236369A50;
    return sub_236369C78(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 96));
  }
  return result;
}

uint64_t sub_236369A50()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 320) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236369AB4()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
  v2 = *(_QWORD *)(v0 + 272);
  v3 = *(_QWORD *)(v0 + 240);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));
  v1(v2, v3);
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

uint64_t sub_236369B94()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
  v2 = *(_QWORD *)(v0 + 272);
  v3 = *(_QWORD *)(v0 + 240);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));
  v1(v2, v3);
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

uint64_t sub_236369C78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[25] = a3;
  v4[26] = v3;
  v4[23] = a1;
  v4[24] = a2;
  v5 = sub_23637A7E4();
  v4[27] = v5;
  v4[28] = *(_QWORD *)(v5 - 8);
  v4[29] = swift_task_alloc();
  v4[30] = swift_task_alloc();
  type metadata accessor for HandoffResponse();
  v4[31] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_236369D0C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 256) = 0;
  *(_QWORD *)(v0 + 264) = 0;
  return swift_task_switch();
}

uint64_t sub_236369D24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v9;

  v1 = *(_QWORD *)(v0 + 264);
  v2 = *(_QWORD *)(v0 + 200);
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v0 + 88) = &off_2507B0240;
  *(_QWORD *)(v0 + 56) = v1;
  swift_beginAccess();
  sub_23636F540((__int128 *)(v0 + 56), v0 + 96);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *(_QWORD *)(v2 + 128);
  *(_QWORD *)(v2 + 128) = 0x8000000000000000;
  v4 = *(_QWORD *)(v0 + 120);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(v0 + 96, v4);
  v6 = *(_QWORD *)(v4 - 8);
  v7 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v6 + 16))(v7, v5, v4);
  sub_23636E184(*v7, 0, 3uLL, isUniquelyReferenced_nonNull_native, &v9);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  swift_task_dealloc();
  *(_QWORD *)(v2 + 128) = v9;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_task_switch();
}

uint64_t sub_236369E5C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  __int128 v4;
  _QWORD *v5;
  char *v7;

  v1 = *(_QWORD *)(v0 + 264);
  v2 = __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 208) + 112), *(_QWORD *)(*(_QWORD *)(v0 + 208) + 136));
  v3 = v2[4];
  v4 = *((_OWORD *)v2 + 1);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v0 + 32) = v4;
  *(_QWORD *)(v0 + 48) = v3;
  v7 = (char *)&dword_2563DDDA8 + dword_2563DDDA8;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 272) = v5;
  *v5 = v0;
  v5[1] = sub_236369EF8;
  return ((uint64_t (*)(_QWORD, _QWORD, BOOL, _QWORD))v7)(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 192), v1 != 0, *(_QWORD *)(v0 + 200));
}

uint64_t sub_236369EF8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 280) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236369F5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 248);
  v2 = *(_QWORD *)(v0 + 184);

  v3 = sub_23637A724();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32))(v2, v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236369FD8()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  _QWORD *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  v1 = *(void **)(v0 + 280);
  *(_QWORD *)(v0 + 160) = v1;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDC70);
  if ((swift_dynamicCast() & 1) == 0 || *(_QWORD *)(v0 + 168) != 401)
  {

LABEL_12:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  if (qword_2563DDA98 != -1)
    swift_once();
  v3 = *(_QWORD *)(v0 + 240);
  v4 = *(_QWORD *)(v0 + 216);
  v5 = *(_QWORD *)(v0 + 224);
  v6 = __swift_project_value_buffer(v4, (uint64_t)qword_2563DFDB8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v7(v3, v6, v4);
  v8 = sub_23637A7CC();
  v9 = sub_23637A994();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_23635F000, v8, v9, "Support handoff API returned 401, retrying…", v10, 2u);
    MEMORY[0x23B7F15E4](v10, -1, -1);
  }
  v11 = *(void **)(v0 + 256);
  v12 = *(_QWORD *)(v0 + 264);
  v13 = *(_QWORD *)(v0 + 240);
  v14 = *(_QWORD *)(v0 + 216);
  v15 = *(_QWORD *)(v0 + 224);

  v16 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v16(v13, v14);
  sub_23636F580();
  v17 = swift_allocError();
  *v18 = 401;

  if (v12 == 2)
  {
    v7(*(_QWORD *)(v0 + 232), v6, *(_QWORD *)(v0 + 216));
    v19 = sub_23637A7CC();
    v20 = sub_23637A994();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v21 = 134217984;
      *(_QWORD *)(v0 + 176) = 3;
      sub_23637A9C4();
      _os_log_impl(&dword_23635F000, v19, v20, "Failed to retrieve handoff URL after %ld attempts.", v21, 0xCu);
      MEMORY[0x23B7F15E4](v21, -1, -1);
    }
    v22 = *(_QWORD *)(v0 + 232);
    v23 = *(_QWORD *)(v0 + 216);

    v16(v22, v23);
    swift_willThrow();
    goto LABEL_12;
  }
  v25 = *(_QWORD *)(v0 + 264) + 1;
  *(_QWORD *)(v0 + 256) = v17;
  *(_QWORD *)(v0 + 264) = v25;
  return swift_task_switch();
}

uint64_t BatteryServiceBookingCoordinator.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 176);
  v1 = v0 + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_clock;
  v2 = sub_23637AAB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_23636FCC8(v0 + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_lastPrepareInstant, &qword_2563DDD30);
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t BatteryServiceBookingCoordinator.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 176);
  v1 = v0 + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_clock;
  v2 = sub_23637AAB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_23636FCC8(v0 + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_lastPrepareInstant, &qword_2563DDD30);
  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t BatteryServiceBookingCoordinator.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23636A404()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23636A410(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[14] = a1;
  v2[15] = v1;
  v2[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDED0);
  v2[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDE60);
  v2[18] = swift_task_alloc();
  v2[19] = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDD40);
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23636A4D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int EnumCaseMultiPayload;
  _QWORD *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;

  v1 = *(_QWORD *)(v0 + 176);
  v2 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(*(_QWORD *)v2 + 112);
  *(_QWORD *)(v0 + 184) = v3;
  v4 = v2 + v3;
  swift_beginAccess();
  sub_236370228(v4, v1, &qword_2563DDD40);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_23636FB58(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 112), &qword_2563DDED0);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    else
    {
      v8 = *(_QWORD *)(v0 + 160);
      v9 = *(uint64_t **)(v0 + 168);
      v10 = *(_QWORD *)(v0 + 144);
      v11 = *(_QWORD *)(v0 + 120);
      v12 = sub_23637A910();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
      v13 = sub_23636FB9C();
      v14 = (_QWORD *)swift_allocObject();
      v14[2] = v11;
      v14[3] = v13;
      v14[4] = v11;
      swift_retain_n();
      v15 = sub_23636AE0C(v10, (uint64_t)&unk_2563DDF00, (uint64_t)v14);
      *(_QWORD *)(v0 + 192) = v15;
      *v9 = v15;
      swift_storeEnumTagMultiPayload();
      sub_23636FB58((uint64_t)v9, v8, &qword_2563DDD40);
      swift_beginAccess();
      swift_retain();
      sub_23636FB14(v8, v4, &qword_2563DDD40);
      swift_endAccess();
      v16 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 200) = v16;
      *v16 = v0;
      v16[1] = sub_23636A78C;
      return sub_23637ABF8();
    }
  }
  else
  {
    *(_QWORD *)(v0 + 216) = **(_QWORD **)(v0 + 176);
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 224) = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDC70);
    *v7 = v0;
    v7[1] = sub_23636A7F0;
    return sub_23637A91C();
  }
}

uint64_t sub_23636A78C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 208) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23636A7F0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 232) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23636A854()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23636A8C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 120);
  swift_release();
  swift_storeEnumTagMultiPayload();
  swift_beginAccess();
  sub_23636FB14(v2, v3 + v1, &qword_2563DDD40);
  swift_endAccess();
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23636A9A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 184);
  v3 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 136);
  v5 = *(_QWORD *)(v0 + 112);
  v6 = *(_QWORD *)(v0 + 120);
  swift_release();
  sub_236370228(v4, v2, &qword_2563DDED0);
  swift_storeEnumTagMultiPayload();
  sub_23636FB58(v2, v3, &qword_2563DDD40);
  swift_beginAccess();
  sub_23636FB14(v3, v6 + v1, &qword_2563DDD40);
  swift_endAccess();
  sub_23636FB58(v4, v5, &qword_2563DDED0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23636AAB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 120);
  swift_release();
  swift_storeEnumTagMultiPayload();
  swift_beginAccess();
  sub_23636FB14(v2, v3 + v1, &qword_2563DDD40);
  swift_endAccess();
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23636AB98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[5] = a1;
  v4[6] = a4;
  v4[7] = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDD40);
  v4[8] = swift_task_alloc();
  v4[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23636AC0C()
{
  _QWORD *v0;
  int **v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(_QWORD);

  v1 = (int **)(v0[6] + *(_QWORD *)(*(_QWORD *)v0[6] + 120));
  v2 = *v1;
  v0[10] = v1[1];
  v5 = (uint64_t (*)(_QWORD))((char *)v2 + *v2);
  swift_retain();
  v3 = (_QWORD *)swift_task_alloc();
  v0[11] = v3;
  *v3 = v0;
  v3[1] = sub_23636AC8C;
  return v5(v0[5]);
}

uint64_t sub_23636AC8C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23636ACF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 48);
  swift_release();
  sub_236370228(v3, v1, &qword_2563DDED0);
  swift_storeEnumTagMultiPayload();
  sub_23636FB58(v1, v2, &qword_2563DDD40);
  v5 = v4 + *(_QWORD *)(*(_QWORD *)v4 + 112);
  swift_beginAccess();
  sub_23636FB14(v2, v5, &qword_2563DDD40);
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23636ADC4()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23636AE0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_23637A910();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_23637A904();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23636FCC8(a1, &qword_2563DDE60);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23637A8B0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDED0);
  return swift_task_create();
}

uint64_t sub_23636AF40()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDED0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDC70);
  *v1 = v0;
  v1[1] = sub_23636AFD0;
  return sub_23637A91C();
}

uint64_t sub_23636AFD0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23636B018()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDED0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDC70);
  return sub_23637A928();
}

uint64_t sub_23636B064(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v5 + 312) = a4;
  *(_QWORD *)(v5 + 320) = v4;
  *(_BYTE *)(v5 + 568) = a3;
  *(_QWORD *)(v5 + 296) = a1;
  *(_QWORD *)(v5 + 304) = a2;
  v6 = sub_23637A7E4();
  *(_QWORD *)(v5 + 328) = v6;
  *(_QWORD *)(v5 + 336) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v5 + 344) = swift_task_alloc();
  sub_23637ACE8();
  *(_QWORD *)(v5 + 352) = swift_task_alloc();
  sub_23637ACD0();
  *(_QWORD *)(v5 + 360) = swift_task_alloc();
  sub_23637AD24();
  *(_QWORD *)(v5 + 368) = swift_task_alloc();
  v7 = sub_23637AD30();
  *(_QWORD *)(v5 + 376) = v7;
  *(_QWORD *)(v5 + 384) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v5 + 392) = swift_task_alloc();
  v8 = sub_23637AAB4();
  *(_QWORD *)(v5 + 400) = v8;
  *(_QWORD *)(v5 + 408) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v5 + 416) = swift_task_alloc();
  *(_QWORD *)(v5 + 424) = type metadata accessor for CompositeHTTPHeadersProvider();
  *(_QWORD *)(v5 + 432) = swift_task_alloc();
  v9 = sub_23637A664();
  *(_QWORD *)(v5 + 440) = v9;
  *(_QWORD *)(v5 + 448) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v5 + 456) = swift_task_alloc();
  *(_QWORD *)(v5 + 464) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23636B1D8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD **)(v0 + 432);
  v2 = *(uint64_t **)(v0 + 320);
  v3 = *(unsigned __int8 *)(v0 + 568);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 448) + 16))(*(_QWORD *)(v0 + 464), *(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 440));
  v4 = *v2;
  *(_QWORD *)(v0 + 272) = *v2;
  v5 = (void (*)(uint64_t))v2[3];
  swift_bridgeObjectRetain();
  v5(v3);
  sub_236370228(v0 + 56, v0 + 16, &qword_2563DDDB8);
  swift_bridgeObjectRetain();
  sub_23636D984(v0 + 16);
  sub_23636FCC8(v0 + 56, &qword_2563DDDB8);
  sub_23636F5C4(v0 + 272);
  sub_23637AAA8();
  *v1 = v4;
  v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2563DDDC0 + dword_2563DDDC0);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 472) = v6;
  *v6 = v0;
  v6[1] = sub_23636B304;
  return v8(*(_QWORD *)(v0 + 456), *(_QWORD *)(v0 + 464), *(_QWORD *)(v0 + 312));
}

uint64_t sub_23636B304()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 480) = v0;
  swift_task_dealloc();
  sub_23636F5EC(*(_QWORD *)(v2 + 432));
  return swift_task_switch();
}

uint64_t sub_23636B370()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 448) + 40))(*(_QWORD *)(v0 + 464), *(_QWORD *)(v0 + 456), *(_QWORD *)(v0 + 440));
  v1 = sub_23637A628();
  if (!v1)
    goto LABEL_5;
  if (!*(_QWORD *)(v1 + 16))
  {
    swift_bridgeObjectRelease();
LABEL_5:
    v3 = 0;
    goto LABEL_6;
  }
  sub_236370B50(0xD000000000000010, 0x800000023637C640);
  v3 = v2;
  swift_bridgeObjectRelease();
LABEL_6:
  *(_BYTE *)(v0 + 569) = v3 & 1;
  return swift_task_switch();
}

uint64_t sub_23636B40C()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 480);
  *(_QWORD *)(v0 + 280) = v1;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDC70);
  swift_dynamicCast();
  *(_OWORD *)(v0 + 488) = *(_OWORD *)(v0 + 152);
  sub_23637AA18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23637A880();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 504) = 0xD00000000000001DLL;
  *(_QWORD *)(v0 + 512) = 0x800000023637C8E0;
  return swift_task_switch();
}

uint64_t sub_23636B50C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _UNKNOWN **v8;

  v2 = *(_QWORD *)(v0 + 504);
  v1 = *(_QWORD *)(v0 + 512);
  v3 = MEMORY[0x24BEE0D00];
  v7 = MEMORY[0x24BEE0D00];
  v8 = &off_2507B0230;
  v5 = 0x6572756C696166;
  v6 = 0xE700000000000000;
  swift_beginAccess();
  sub_2363661DC((uint64_t)&v5, 0, 1uLL);
  v7 = v3;
  v8 = &off_2507B0230;
  v5 = v2;
  v6 = v1;
  swift_bridgeObjectRetain();
  sub_2363661DC((uint64_t)&v5, 0, 2uLL);
  swift_endAccess();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23636B5E8()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 496);
  swift_willThrow();
  swift_bridgeObjectRelease();

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 448) + 8))(*(_QWORD *)(v0 + 464), *(_QWORD *)(v0 + 440));
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

uint64_t sub_23636B6C8()
{
  uint64_t v0;
  char v1;
  _BYTE v3[24];
  uint64_t v4;
  _UNKNOWN **v5;

  v1 = *(_BYTE *)(v0 + 569);
  v4 = MEMORY[0x24BEE1328];
  v5 = &off_2507B0260;
  v3[0] = v1;
  swift_beginAccess();
  sub_2363661DC((uint64_t)v3, 0, 6uLL);
  swift_endAccess();
  return swift_task_switch();
}

uint64_t sub_23636B758()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v1 = v0[58];
  v2 = v0[40];
  v0[28] = 0;
  v0[29] = 0;
  v0[27] = 0;
  sub_23637AAA8();
  v3 = (_QWORD *)swift_task_alloc();
  v0[65] = v3;
  v3[2] = v0 + 27;
  v3[3] = v2;
  v3[4] = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[66] = v4;
  sub_23637026C(&qword_2563DDDD0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  *v4 = v0;
  v4[1] = sub_23636B824;
  return sub_23637AC34();
}

uint64_t sub_23636B824()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *v1;
  *(_QWORD *)(*v1 + 536) = v0;
  swift_task_dealloc();
  v4 = *(_QWORD *)(v2 + 408);
  v3 = *(_QWORD *)(v2 + 416);
  v5 = *(_QWORD *)(v2 + 400);
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 8))(*(_QWORD *)(v2 + 416), *(_QWORD *)(v2 + 400));
    swift_task_dealloc();
  }
  else
  {
    *(_OWORD *)(v2 + 544) = *(_OWORD *)(v2 + 240);
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  return swift_task_switch();
}

uint64_t sub_23636B8E4()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 560) = *(_QWORD *)(v0 + 536);
  sub_23636F688(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 224), *(void **)(v0 + 232));
  return swift_task_switch();
}

uint64_t sub_23636B930()
{
  double v0;
  uint64_t v1;
  double v3[5];

  v0 = (double)sub_23637AD48();
  sub_23637AD48();
  *(_QWORD *)&v3[3] = MEMORY[0x24BEE13C8];
  *(_QWORD *)&v3[4] = &off_2507B0250;
  v3[0] = (double)v1 * 1.0e-18 + v0;
  swift_beginAccess();
  sub_2363661DC((uint64_t)v3, 0xD000000000000012, 0x800000023637C920);
  swift_endAccess();
  return swift_task_switch();
}

uint64_t sub_23636BA18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t result;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  id v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v1 = *(_QWORD *)(v0 + 392);
  v33 = *(_QWORD *)(v0 + 384);
  v2 = *(_QWORD *)(v0 + 376);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDDD8);
  sub_23637AD0C();
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23637BAE0;
  sub_23637AD00();
  sub_23637ACF4();
  sub_23636E754(v3);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_23637AD18();
  sub_23637ACC4();
  sub_23637ACDC();
  sub_23637ACB8();
  sub_23637026C(&qword_2563DDDE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDD0AF0], MEMORY[0x24BDD0AE8]);
  sub_23637AD3C();
  (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v1, v2);
  v5 = *(_QWORD *)(v0 + 256);
  v4 = *(_QWORD *)(v0 + 264);
  if (qword_2563DDA98 != -1)
    swift_once();
  v7 = *(_QWORD *)(v0 + 336);
  v6 = *(_QWORD *)(v0 + 344);
  v8 = *(_QWORD *)(v0 + 328);
  v9 = __swift_project_value_buffer(v8, (uint64_t)qword_2563DFDB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v9, v8);
  swift_bridgeObjectRetain();
  v10 = sub_23637A7CC();
  v11 = sub_23637A988();
  v12 = os_log_type_enabled(v10, v11);
  v14 = *(_QWORD *)(v0 + 336);
  v13 = *(_QWORD *)(v0 + 344);
  v15 = *(_QWORD *)(v0 + 328);
  if (v12)
  {
    v34 = *(_QWORD *)(v0 + 344);
    v32 = *(_QWORD *)(v0 + 328);
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v35 = v17;
    *(_DWORD *)v16 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 288) = sub_23636CE4C(v5, v4, &v35);
    sub_23637A9C4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23635F000, v10, v11, "Support service call completed in %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7F15E4](v17, -1, -1);
    MEMORY[0x23B7F15E4](v16, -1, -1);

    result = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v34, v32);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    result = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  v19 = *(void **)(v0 + 232);
  if (!v19)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    return result;
  }
  objc_opt_self();
  v20 = swift_dynamicCastObjCClass();
  if (v20)
  {
    v21 = (void *)v20;
    v22 = v19;
    if ((char *)objc_msgSend(v21, sel_statusCode) - 200 >= (char *)0x64)
    {
      v27 = objc_msgSend(v21, sel_statusCode);
      sub_23636F580();
      v26 = swift_allocError();
      *v28 = v27;
      swift_willThrow();

      goto LABEL_14;
    }

  }
  sub_23637A688();
  swift_allocObject();
  result = sub_23637A67C();
  if (!*(_QWORD *)(v0 + 232))
    goto LABEL_17;
  v23 = *(_QWORD *)(v0 + 536);
  type metadata accessor for HandoffResponse();
  v24 = *(_QWORD *)(v0 + 216);
  v25 = *(_QWORD *)(v0 + 224);
  sub_23636F6B4(v24, v25);
  sub_23637026C(&qword_2563DDDE8, (uint64_t (*)(uint64_t))type metadata accessor for HandoffResponse, (uint64_t)&unk_23637BF3C);
  sub_23637A670();
  if (v23)
  {
    v26 = v23;
    sub_236364934(v24, v25);
    swift_release();
LABEL_14:
    *(_QWORD *)(v0 + 560) = v26;
    sub_23636F688(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 224), *(void **)(v0 + 232));
    return swift_task_switch();
  }
  v29 = *(_QWORD *)(v0 + 464);
  v30 = *(_QWORD *)(v0 + 440);
  v31 = *(_QWORD *)(v0 + 448);
  sub_236364934(v24, v25);
  swift_release();
  sub_23636F688(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 224), *(void **)(v0 + 232));
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v29, v30);
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

uint64_t sub_23636BF78()
{
  uint64_t v0;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _UNKNOWN **v5;

  v0 = MEMORY[0x24BEE0D00];
  v4 = MEMORY[0x24BEE0D00];
  v5 = &off_2507B0230;
  v2 = 0x6572756C696166;
  v3 = 0xE700000000000000;
  swift_beginAccess();
  sub_2363661DC((uint64_t)&v2, 0, 1uLL);
  v4 = v0;
  v5 = &off_2507B0230;
  v2 = 0xD00000000000001ELL;
  v3 = 0x800000023637C900;
  sub_2363661DC((uint64_t)&v2, 0, 2uLL);
  swift_endAccess();
  return swift_task_switch();
}

uint64_t sub_23636C050()
{
  uint64_t v0;

  swift_willThrow();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 448) + 8))(*(_QWORD *)(v0 + 464), *(_QWORD *)(v0 + 440));
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

uint64_t sub_23636C11C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
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
  _QWORD *v17;
  _QWORD v19[4];
  _QWORD v20[4];

  v4 = v3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDE60);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236370228(a1, (uint64_t)v10, &qword_2563DDE60);
  v11 = sub_23637A910();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_23636FCC8((uint64_t)v10, &qword_2563DDE60);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v13 = sub_23637A8B0();
      v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_23637A904();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v16 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDED0);
  v17 = (_QWORD *)(v15 | v13);
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    v17 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }
  v19[1] = 1;
  v19[2] = v17;
  v19[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t sub_23636C2B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDF68);
  v6[8] = swift_task_alloc();
  v7 = sub_23637AB14();
  v6[9] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v6[10] = v8;
  v6[11] = *(_QWORD *)(v8 + 64);
  v6[12] = swift_task_alloc();
  v9 = sub_23637AAFC();
  v6[13] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v6[14] = v10;
  v6[15] = *(_QWORD *)(v10 + 64);
  v6[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDE60);
  v6[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23636C390()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = v0[17];
  v2 = v0[14];
  v3 = v0[13];
  v20 = v0[15];
  v15 = v0[10];
  v16 = v0[16];
  v18 = v0[9];
  v19 = v0[12];
  v4 = v0[5];
  v14 = v0[6];
  v5 = v0[4];
  v17 = v0[7];
  v6 = sub_23637A910();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
  v7(v1, 1, 1, v6);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v5;
  v8[5] = v4;
  swift_retain();
  sub_23636C11C(v1, (uint64_t)&unk_2563DDF78, (uint64_t)v8);
  sub_23636FCC8(v1, &qword_2563DDE60);
  sub_23637A8F8();
  v7(v1, 0, 1, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v16, v14, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v19, v17, v18);
  v9 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v10 = (v20 + *(unsigned __int8 *)(v15 + 80) + v9) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = 0;
  *(_QWORD *)(v11 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v11 + v9, v16, v3);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v15 + 32))(v11 + v10, v19, v18);
  sub_23636C11C(v1, (uint64_t)&unk_2563DDF88, v11);
  sub_23636FCC8(v1, &qword_2563DDE60);
  v12 = (_QWORD *)swift_task_alloc();
  v0[18] = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDF90);
  *v12 = v0;
  v12[1] = sub_23636C5B0;
  return sub_23637A94C();
}

uint64_t sub_23636C5B0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23636C614()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDED0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(v1, 1, v2);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_23636FB58(v1, *(_QWORD *)(v0 + 16), &qword_2563DDED0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDC70);
    sub_23637A958();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t sub_23636C6EC()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDED0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDC70);
  sub_23637A958();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23636C790(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v6;
  *v6 = v4;
  v6[1] = sub_2363702AC;
  return v8(a1);
}

uint64_t sub_23636C7F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  _QWORD *v9;

  *(_QWORD *)(v5 + 40) = a4;
  *(_QWORD *)(v5 + 48) = a5;
  v6 = sub_23637AAFC();
  *(_QWORD *)(v5 + 56) = v6;
  *(_QWORD *)(v5 + 64) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v5 + 72) = swift_task_alloc();
  *(_QWORD *)(v5 + 80) = swift_task_alloc();
  v7 = sub_23637AB14();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E98];
  *(_QWORD *)(v5 + 88) = v7;
  *(_QWORD *)(v5 + 96) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v5 + 104) = swift_task_alloc();
  *(_QWORD *)(v5 + 16) = 0;
  *(_QWORD *)(v5 + 24) = 0;
  *(_BYTE *)(v5 + 32) = 1;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 112) = v9;
  sub_23637026C(&qword_2563DDF98, v8, MEMORY[0x24BEE6EA8]);
  *v9 = v5;
  v9[1] = sub_23636C908;
  return sub_23637A934();
}

uint64_t sub_23636C908()
{
  void *v0;

  swift_task_dealloc();
  if (v0)

  return swift_task_switch();
}

uint64_t sub_23636C974()
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
  void (*v12)(uint64_t, uint64_t);
  uint64_t *v13;

  v2 = *(_QWORD *)(v0 + 96);
  v1 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD *)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 56);
  v8 = *(_QWORD *)(v0 + 40);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 16))(v1, *(_QWORD *)(v0 + 48), v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v8, v7);
  sub_23637AACC();
  v9 = sub_23637AA90();
  v11 = v10;
  v12 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v12(v4, v7);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v12(v5, v7);
  sub_23636FFBC();
  swift_allocError();
  *v13 = v9;
  v13[1] = v11;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23636CA88(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_2363702AC;
  return v6();
}

uint64_t sub_23636CADC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_2363702AC;
  return v7();
}

uint64_t sub_23636CB30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23637A910();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23637A904();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23636FCC8(a1, &qword_2563DDE60);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23637A8B0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23636CC7C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23636CCE0;
  return v6(a1);
}

uint64_t sub_23636CCE0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

_QWORD *sub_23636CD2C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDE28);
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
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_23636E648(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23636CE4C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23636CF1C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23636F6F8((uint64_t)v12, *a3);
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
      sub_23636F6F8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23636CF1C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23637A9D0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23636D0D4(a5, a6);
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
  v8 = sub_23637AA3C();
  if (!v8)
  {
    sub_23637AB38();
    __break(1u);
LABEL_17:
    result = sub_23637AB80();
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

uint64_t sub_23636D0D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23636D168(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23636D340(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23636D340(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23636D168(uint64_t a1, unint64_t a2)
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
      v3 = sub_23636D2DC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23637AA24();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23637AB38();
      __break(1u);
LABEL_10:
      v2 = sub_23637A88C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23637AB80();
    __break(1u);
LABEL_14:
    result = sub_23637AB38();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23636D2DC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDDF0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23636D340(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDDF0);
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
  result = sub_23637AB80();
  __break(1u);
  return result;
}

double sub_23636D48C@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
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
  v8 = sub_236370C94(a1, a2);
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
      sub_236376BC4();
      v11 = v13;
    }
    sub_236363410(*(_QWORD *)(*(_QWORD *)(v11 + 48) + 16 * v8), *(_QWORD *)(*(_QWORD *)(v11 + 48) + 16 * v8 + 8));
    sub_23636F540((__int128 *)(*(_QWORD *)(v11 + 56) + 40 * v8), a3);
    sub_23636D584(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(a3 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

unint64_t sub_23636D584(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  _OWORD *v18;
  uint64_t v19;
  unint64_t v20;
  __int128 *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_23637A9E8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v11 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v6);
        v13 = *v11;
        v12 = v11[1];
        sub_23637AC7C();
        switch(v12)
        {
          case 0uLL:
          case 1uLL:
          case 2uLL:
          case 3uLL:
          case 4uLL:
          case 5uLL:
          case 6uLL:
            sub_23637AC88();
            break;
          default:
            sub_23637AC88();
            swift_bridgeObjectRetain();
            sub_23637A874();
            break;
        }
        v14 = sub_23637AC94();
        result = sub_236363410(v13, v12);
        v15 = v14 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v15 < v8)
            goto LABEL_5;
        }
        else if (v15 >= v8)
        {
          goto LABEL_14;
        }
        if (v3 >= (uint64_t)v15)
        {
LABEL_14:
          v16 = *(_QWORD *)(a2 + 48);
          v17 = (_OWORD *)(v16 + 16 * v3);
          v18 = (_OWORD *)(v16 + 16 * v6);
          if (v3 != v6 || v17 >= v18 + 1)
            *v17 = *v18;
          v19 = *(_QWORD *)(a2 + 56);
          v20 = v19 + 40 * v3;
          v21 = (__int128 *)(v19 + 40 * v6);
          if (v3 != v6 || (v3 = v6, v20 >= (unint64_t)v21 + 40))
          {
            v9 = *v21;
            v10 = v21[1];
            *(_QWORD *)(v20 + 32) = *((_QWORD *)v21 + 4);
            *(_OWORD *)v20 = v9;
            *(_OWORD *)(v20 + 16) = v10;
            v3 = v6;
          }
        }
LABEL_5:
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
    JUMPOUT(0x23636D7F4);
  }
  *(_QWORD *)(a2 + 16) = v27;
  ++*(_DWORD *)(a2 + 36);
  return result;
}

uint64_t sub_23636D810(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_23636CD2C(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = (unint64_t)&v3[5 * v9 + 4];
  if (a1 + 32 < v10 + 40 * v8 && v10 < a1 + 32 + 40 * v8)
    goto LABEL_24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDE30);
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = v3[2];
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_23637AB80();
  __break(1u);
  return result;
}

uint64_t sub_23636D984(uint64_t a1)
{
  _QWORD **v1;
  _QWORD **v2;
  _QWORD *v4;
  unint64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  __int128 *v16;
  int64_t v18;
  int64_t v19;
  _QWORD *v20;
  unint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  _BYTE v27[40];
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v2 = v1;
  v4 = *v1;
  v5 = v4[2];
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  *v2 = v4;
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v7 = v4[3] >> 1, v7 <= v5))
  {
    v4 = sub_23636CD2C(isUniquelyReferenced_nonNull_native, v5 + 1, 1, v4);
    *v2 = v4;
    v7 = v4[3] >> 1;
  }
  v8 = v4[2];
  v9 = v7 - v8;
  v10 = (uint64_t)&v4[5 * v8 + 4];
  sub_236370228(a1, (uint64_t)v27, &qword_2563DDDB8);
  v11 = sub_23636E03C((uint64_t)&v28, v10, v9);
  sub_23636FCC8(a1, &qword_2563DDDB8);
  if (v11 < 1)
  {
    __break(1u);
    goto LABEL_10;
  }
  v12 = (*v2)[2];
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (v13)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  (*v2)[2] = v14;
  if (v11 != v9)
  {
    v15 = &qword_2563DDE18;
    v16 = &v28;
    return sub_23636FCC8((uint64_t)v16, v15);
  }
LABEL_11:
  v18 = (*v2)[2];
  sub_23636FB58((uint64_t)&v28, (uint64_t)v27, &qword_2563DDE20);
  v28 = 0u;
  v29 = 0u;
  v30 = 0;
  sub_236370228((uint64_t)v27, (uint64_t)&v25, &qword_2563DDE20);
  while (v26)
  {
    sub_23636FCC8((uint64_t)&v25, &qword_2563DDE20);
    v20 = *v2;
    v21 = (*v2)[3];
    v19 = v21 >> 1;
    if ((uint64_t)(v21 >> 1) < v18 + 1)
    {
      v20 = sub_23636CD2C((_QWORD *)(v21 > 1), v18 + 1, 1, *v2);
      *v2 = v20;
      v19 = v20[3] >> 1;
    }
    sub_236370228((uint64_t)v27, (uint64_t)&v23, &qword_2563DDE20);
    if (v24)
    {
      if (v18 > v19)
        v19 = v18;
      v22 = (uint64_t)&v20[5 * v18 + 4];
      while (1)
      {
        sub_23636F540(&v23, (uint64_t)&v25);
        if (v19 == v18)
          break;
        sub_23636FCC8((uint64_t)v27, &qword_2563DDE20);
        sub_23636F540(&v25, v22);
        ++v18;
        sub_23636FB58((uint64_t)&v28, (uint64_t)v27, &qword_2563DDE20);
        v28 = 0u;
        v29 = 0u;
        v30 = 0;
        sub_236370228((uint64_t)v27, (uint64_t)&v23, &qword_2563DDE20);
        v22 += 40;
        if (!v24)
          goto LABEL_13;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
      v18 = v19;
    }
    else
    {
LABEL_13:
      sub_23636FCC8((uint64_t)&v23, &qword_2563DDE20);
      v19 = v18;
    }
    (*v2)[2] = v19;
    sub_236370228((uint64_t)v27, (uint64_t)&v25, &qword_2563DDE20);
  }
  sub_23636FCC8((uint64_t)v27, &qword_2563DDE20);
  sub_23636FCC8((uint64_t)&v28, &qword_2563DDE18);
  v16 = &v25;
  v15 = &qword_2563DDE20;
  return sub_23636FCC8((uint64_t)v16, v15);
}

char *sub_23636DC40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, _QWORD *a6)
{
  uint64_t ObjectType;
  uint64_t v13;
  __int128 v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _QWORD *v21;
  uint64_t v22;
  char *v23;
  _QWORD *v24;
  objc_super v26;
  _BYTE v27[24];
  ValueMetadata *v28;
  _UNKNOWN **v29;
  _QWORD v30[5];

  ObjectType = swift_getObjectType();
  v30[3] = &type metadata for SignedRequestManager;
  v30[4] = &off_2507B03F8;
  v13 = swift_allocObject();
  v30[0] = v13;
  v14 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v13 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v13 + 32) = v14;
  *(_QWORD *)(v13 + 48) = *(_QWORD *)(a1 + 32);
  v28 = &type metadata for CoreAnalyticsReporter;
  v29 = &off_2507AF970;
  swift_defaultActor_initialize();
  swift_retain();
  sub_23637AAA8();
  v15 = (char *)a6 + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_lastPrepareInstant;
  v16 = sub_23637AA9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  *(_QWORD *)((char *)a6 + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_retrieveSupportHandoffURLTask) = 0;
  sub_2363632B0((uint64_t)v30, (uint64_t)(a6 + 14));
  a6[19] = a2;
  a6[20] = a3;
  a6[21] = a4;
  sub_2363632B0((uint64_t)v27, (uint64_t)(a6 + 22));
  swift_retain();
  swift_retain();
  swift_release();
  v17 = 0;
  v18 = 0;
  if ((sub_236370794() & 0x100000000) == 0)
  {
    v17 = sub_23637ABE0();
    v18 = v19;
  }
  v26.receiver = a6;
  v26.super_class = (Class)type metadata accessor for BatteryServiceBookingCoordinator();
  v20 = objc_msgSendSuper2(&v26, sel_init);
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = v20;
  v21[3] = v17;
  v21[4] = v18;
  v21[5] = ObjectType;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDEF0);
  v22 = swift_allocObject();
  v23 = (char *)v20;
  swift_defaultActor_initialize();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDD40);
  swift_storeEnumTagMultiPayload();
  v24 = (_QWORD *)(v22 + *(_QWORD *)(*(_QWORD *)v22 + 120));
  *v24 = &unk_2563DDF30;
  v24[1] = v21;

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  *(_QWORD *)&v23[OBJC_IVAR____ACSBatteryServiceBookingCoordinator_retrieveSupportHandoffURLTask] = v22;
  swift_release();
  return v23;
}

char *sub_23636DEB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10;
  __int128 v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  char *v20;
  _BYTE v22[24];
  ValueMetadata *v23;
  _UNKNOWN **v24;
  _QWORD v25[5];
  _OWORD v26[2];
  uint64_t v27;

  v25[3] = &type metadata for SignedRequestManager;
  v25[4] = &off_2507B03F8;
  v10 = swift_allocObject();
  v25[0] = v10;
  v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v10 + 32) = v11;
  *(_QWORD *)(v10 + 48) = *(_QWORD *)(a1 + 32);
  v23 = &type metadata for CoreAnalyticsReporter;
  v24 = &off_2507AF970;
  type metadata accessor for BatteryServiceBookingCoordinator();
  v12 = (_QWORD *)swift_allocObject();
  v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, (uint64_t)&type metadata for SignedRequestManager);
  MEMORY[0x24BDAC7A8](v13, v13);
  v15 = &v22[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *))(v16 + 16))(v15);
  v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, (uint64_t)&type metadata for CoreAnalyticsReporter);
  MEMORY[0x24BDAC7A8](v17, v17);
  (*(void (**)(void))(v18 + 16))();
  v19 = *((_OWORD *)v15 + 1);
  v26[0] = *(_OWORD *)v15;
  v26[1] = v19;
  v27 = *((_QWORD *)v15 + 4);
  v20 = sub_23636DC40((uint64_t)v26, a2, a3, a4, a5, v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  return v20;
}

uint64_t sub_23636E03C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 *v3;
  __int128 *v4;
  uint64_t result;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14[2];
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v4 = v3;
  sub_23636F540(v4, (uint64_t)v14);
  v13 = 0;
  v11 = 0u;
  v12 = 0u;
  result = sub_23636FB14((uint64_t)v14, (uint64_t)&v11, &qword_2563DDE20);
  v15 = v11;
  v16 = v12;
  v17 = v13;
  if (!a2)
  {
    a3 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_12:
    v10 = v16;
    *(_OWORD *)a1 = v15;
    *(_OWORD *)(a1 + 16) = v10;
    *(_QWORD *)(a1 + 32) = v17;
    return a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    sub_23636FB58((uint64_t)&v15, (uint64_t)&v11, &qword_2563DDE20);
    v15 = 0u;
    v16 = 0u;
    v17 = 0;
    if (*((_QWORD *)&v12 + 1))
    {
      v9 = 0;
      while (1)
      {
        sub_23636F540(&v11, (uint64_t)v14);
        sub_23636F540(v14, a2);
        if (a3 - 1 == v9)
          break;
        a2 += 40;
        sub_23636FB58((uint64_t)&v15, (uint64_t)&v11, &qword_2563DDE20);
        v15 = 0u;
        v16 = 0u;
        v17 = 0;
        ++v9;
        if (!*((_QWORD *)&v12 + 1))
          goto LABEL_11;
      }
    }
    else
    {
      v9 = 0;
LABEL_11:
      sub_23636FCC8((uint64_t)&v11, &qword_2563DDE20);
      a3 = v9;
    }
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_23636E184(uint64_t a1, uint64_t a2, unint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v9;
  _QWORD *v10;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  _UNKNOWN **v30;

  *(_QWORD *)&v28 = a1;
  v9 = MEMORY[0x24BEE1768];
  v29 = MEMORY[0x24BEE1768];
  v30 = &off_2507B0240;
  v10 = (_QWORD *)*a5;
  v12 = sub_236370C94(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_14;
  }
  v16 = v11;
  v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0)
  {
LABEL_7:
    v18 = (_QWORD *)*a5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7] + 40 * v12;
      __swift_destroy_boxed_opaque_existential_1(v19);
      return sub_23636F540(&v28, v19);
    }
    goto LABEL_11;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_236376BC4();
    goto LABEL_7;
  }
  sub_2363764F0(v15, a4 & 1);
  v21 = sub_236370C94(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_14:
    result = sub_23637AC1C();
    __break(1u);
    return result;
  }
  v12 = v21;
  v18 = (_QWORD *)*a5;
  if ((v16 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  v23 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v28, v9);
  MEMORY[0x24BDAC7A8](v23, v23);
  v25 = (uint64_t *)((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v26 + 16))(v25);
  sub_23636E500(v12, a2, a3, *v25, v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v28);
  return sub_2363632F4(a2, a3);
}

uint64_t sub_23636E330(uint64_t a1, uint64_t a2, unint64_t a3, char a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t result;
  unint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;

  v34 = a6;
  v35 = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v33);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 32))(boxed_opaque_existential_1, a1, a6);
  v15 = (_QWORD *)*a5;
  v17 = sub_236370C94(a2, a3);
  v18 = v15[2];
  v19 = (v16 & 1) == 0;
  v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
    goto LABEL_14;
  }
  v21 = v16;
  v22 = v15[3];
  if (v22 >= v20 && (a4 & 1) != 0)
  {
LABEL_7:
    v23 = (_QWORD *)*a5;
    if ((v21 & 1) != 0)
    {
LABEL_8:
      v24 = v23[7] + 40 * v17;
      __swift_destroy_boxed_opaque_existential_1(v24);
      return sub_23636F540(&v33, v24);
    }
    goto LABEL_11;
  }
  if (v22 >= v20 && (a4 & 1) == 0)
  {
    sub_236376BC4();
    goto LABEL_7;
  }
  sub_2363764F0(v20, a4 & 1);
  v26 = sub_236370C94(a2, a3);
  if ((v21 & 1) != (v27 & 1))
  {
LABEL_14:
    result = sub_23637AC1C();
    __break(1u);
    return result;
  }
  v17 = v26;
  v23 = (_QWORD *)*a5;
  if ((v21 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  v28 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v33, v34);
  MEMORY[0x24BDAC7A8](v28, v28);
  v30 = (char *)&v32 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v31 + 16))(v30);
  sub_23636E590(v17, a2, a3, (uint64_t)v30, v23, a6, a7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v33);
  return sub_2363632F4(a2, a3);
}

uint64_t sub_23636E500(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v6;
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  _UNKNOWN **v13;

  *(_QWORD *)&v11 = a4;
  v12 = MEMORY[0x24BEE1768];
  v13 = &off_2507B0240;
  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_23636F540(&v11, a5[7] + 40 * a1);
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t sub_23636E590(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v14;
  uint64_t result;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;

  v20 = a6;
  v21 = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v19);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 32))(boxed_opaque_existential_1, a4, a6);
  a5[(a1 >> 6) + 8] |= 1 << a1;
  v14 = (_QWORD *)(a5[6] + 16 * a1);
  *v14 = a2;
  v14[1] = a3;
  result = sub_23636F540(&v19, a5[7] + 40 * a1);
  v16 = a5[2];
  v17 = __OFADD__(v16, 1);
  v18 = v16 + 1;
  if (v17)
    __break(1u);
  else
    a5[2] = v18;
  return result;
}

uint64_t sub_23636E648(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDE30);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23637AB80();
  __break(1u);
  return result;
}

uint64_t sub_23636E754(uint64_t a1)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t result;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  uint64_t v34;

  v2 = sub_23637AD0C();
  v3 = *(_QWORD *)(v2 - 8);
  v5 = MEMORY[0x24BDAC7A8](v2, v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5, v8);
  v10 = (char *)&v29 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDDF8);
    v12 = sub_23637AA0C();
    v13 = 0;
    v14 = *(unsigned __int8 *)(v3 + 80);
    v30 = v11;
    v31 = a1 + ((v14 + 32) & ~v14);
    v15 = *(_QWORD *)(v3 + 72);
    v33 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v34 = v12 + 56;
    while (1)
    {
      v32 = v13;
      v33(v10, v31 + v15 * v13, v2);
      sub_23637026C(&qword_2563DDE00, (uint64_t (*)(uint64_t))MEMORY[0x24BDD0A50], MEMORY[0x24BDD0A60]);
      v16 = sub_23637A808();
      v17 = ~(-1 << *(_BYTE *)(v12 + 32));
      v18 = v16 & v17;
      v19 = (v16 & (unint64_t)v17) >> 6;
      v20 = *(_QWORD *)(v34 + 8 * v19);
      v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        do
        {
          v33(v7, *(_QWORD *)(v12 + 48) + v18 * v15, v2);
          sub_23637026C(&qword_2563DDE08, (uint64_t (*)(uint64_t))MEMORY[0x24BDD0A50], MEMORY[0x24BDD0A68]);
          v22 = sub_23637A814();
          v23 = v3;
          v24 = *(void (**)(char *, uint64_t))(v3 + 8);
          v24(v7, v2);
          if ((v22 & 1) != 0)
          {
            v24(v10, v2);
            v3 = v23;
            v11 = v30;
            goto LABEL_4;
          }
          v18 = (v18 + 1) & v17;
          v19 = v18 >> 6;
          v20 = *(_QWORD *)(v34 + 8 * (v18 >> 6));
          v21 = 1 << v18;
          v3 = v23;
        }
        while ((v20 & (1 << v18)) != 0);
        v11 = v30;
      }
      *(_QWORD *)(v34 + 8 * v19) = v21 | v20;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v12 + 48) + v18 * v15, v10, v2);
      v26 = *(_QWORD *)(v12 + 16);
      v27 = __OFADD__(v26, 1);
      v28 = v26 + 1;
      if (v27)
        break;
      *(_QWORD *)(v12 + 16) = v28;
LABEL_4:
      v13 = v32 + 1;
      if (v32 + 1 == v11)
        return v12;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B08];
  }
  return result;
}

uint64_t sub_23636E9BC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[9] = a1;
  v2[10] = a2;
  v3 = sub_23637A7E4();
  v2[11] = v3;
  v2[12] = *(_QWORD *)(v3 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  v2[15] = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDED0);
  v2[16] = swift_task_alloc();
  v4 = sub_23637A724();
  v2[17] = v4;
  v2[18] = *(_QWORD *)(v4 - 8);
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  return swift_task_switch();
}

void sub_23636EA90()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  void (*v3)(_QWORD);

  v1 = *(_QWORD *)(v0[9] + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_retrieveSupportHandoffURLTask);
  v0[21] = v1;
  if (v1)
  {
    v3 = (void (*)(_QWORD))((char *)&dword_2563DDED8 + dword_2563DDED8);
    swift_retain();
    v2 = (_QWORD *)swift_task_alloc();
    v0[22] = v2;
    *v2 = v0;
    v2[1] = sub_23636EB1C;
    v3(v0[16]);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23636EB1C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23636EB90()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t result;
  uint64_t v17;

  v1 = v0[20];
  v2 = v0[18];
  v3 = (_QWORD *)v0[10];
  v4 = *(_QWORD *)(v0[16] + *(int *)(v0[15] + 48));
  v0[24] = v4;
  (*(void (**)(uint64_t))(v2 + 32))(v1);
  *v3 = v4;
  swift_retain();
  swift_release();
  if (qword_2563DDA98 != -1)
    swift_once();
  v5 = v0[14];
  v6 = v0[11];
  v7 = v0[12];
  v8 = __swift_project_value_buffer(v6, (uint64_t)qword_2563DFDB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v5, v8, v6);
  v9 = sub_23637A7CC();
  v10 = sub_23637A988();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_23635F000, v9, v10, "Opening handoff URL.", v11, 2u);
    MEMORY[0x23B7F15E4](v11, -1, -1);
  }
  v12 = v0[14];
  v13 = v0[11];
  v14 = v0[12];
  v15 = (uint64_t *)v0[10];

  result = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  v17 = *v15;
  v0[25] = *v15;
  if (v17)
  {
    swift_retain();
    return swift_task_switch();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23636ED04()
{
  __int128 v1;
  __int128 v2;
  _UNKNOWN **v3;

  *((_QWORD *)&v2 + 1) = MEMORY[0x24BEE0D00];
  v3 = &off_2507B0230;
  *(_QWORD *)&v1 = 0x73736563637573;
  *((_QWORD *)&v1 + 1) = 0xE700000000000000;
  swift_beginAccess();
  sub_2363661DC((uint64_t)&v1, 0, 1uLL);
  v3 = 0;
  v1 = 0u;
  v2 = 0u;
  sub_2363661DC((uint64_t)&v1, 0, 2uLL);
  swift_endAccess();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23636EDD4()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = v0[9];
  v0[26] = *(_QWORD *)(v1 + 152);
  v0[27] = *(_QWORD *)(v1 + 160);
  sub_23637A8EC();
  v0[28] = sub_23637A8E0();
  sub_23637A8B0();
  return swift_task_switch();
}

uint64_t sub_23636EE50()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(v0 + 208);
  v2 = *(_QWORD *)(v0 + 160);
  swift_release();
  v1(v2);
  return swift_task_switch();
}

uint64_t sub_23636EEA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 144);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23636EF2C()
{
  _QWORD *v0;
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (void (*)(uint64_t))v0[29];
  v3 = v0[18];
  v2 = v0[19];
  v4 = v0[17];
  swift_release();
  v1(v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch();
}

uint64_t sub_23636EFA0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 184);

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23636F020()
{
  _QWORD *v0;
  void *v1;
  _QWORD *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  BOOL v14;
  void *v15;
  uint8_t *v16;
  _QWORD *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v1 = (void *)v0[23];
  v0[7] = v1;
  v2 = (_QWORD *)v0[10];
  v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDC70);
  swift_dynamicCast();
  v4 = v0[6];
  v0[32] = v0[5];
  v0[33] = v4;
  *v2 = v4;
  swift_retain();
  swift_release();
  if (qword_2563DDA98 != -1)
    swift_once();
  v5 = (void *)v0[23];
  v7 = v0[12];
  v6 = v0[13];
  v8 = v0[11];
  v9 = __swift_project_value_buffer(v8, (uint64_t)qword_2563DFDB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v9, v8);
  v10 = v5;
  v11 = v5;
  v12 = sub_23637A7CC();
  v13 = sub_23637A994();
  v14 = os_log_type_enabled(v12, v13);
  v15 = (void *)v0[23];
  if (v14)
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v16 = 138412290;
    v18 = v15;
    v19 = _swift_stdlib_bridgeErrorToNSError();
    v0[8] = v19;
    sub_23637A9C4();
    *v17 = v19;

    _os_log_impl(&dword_23635F000, v12, v13, "Failed to retrieve handoff URL: '%@'. Using fallback URL.", v16, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDEE0);
    swift_arrayDestroy();
    MEMORY[0x23B7F15E4](v17, -1, -1);
    MEMORY[0x23B7F15E4](v16, -1, -1);
  }
  else
  {

  }
  v21 = v0[12];
  v20 = v0[13];
  v22 = v0[11];
  v23 = v0[9];

  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
  v0[29] = *(_QWORD *)(v23 + 152);
  v0[30] = *(_QWORD *)(v23 + 160);
  if (qword_2563DDA88 != -1)
    swift_once();
  v25 = v0[18];
  v24 = v0[19];
  v26 = v0[17];
  v27 = __swift_project_value_buffer(v26, (uint64_t)qword_2563DFD78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v24, v27, v26);
  sub_23637A8EC();
  v0[31] = sub_23637A8E0();
  sub_23637A8B0();
  return swift_task_switch();
}

uint64_t sub_23636F308()
{
  return type metadata accessor for BatteryServiceBookingCoordinator();
}

uint64_t type metadata accessor for BatteryServiceBookingCoordinator()
{
  uint64_t result;

  result = qword_2563DDD70;
  if (!qword_2563DDD70)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23636F34C()
{
  unint64_t v0;
  unint64_t v1;

  sub_23637AAB4();
  if (v0 <= 0x3F)
  {
    sub_23636F4EC();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for BatteryServiceBookingCoordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BatteryServiceBookingCoordinator.prepareBatteryServiceBookingFlow()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2363702AC;
  return v5();
}

uint64_t dispatch thunk of BatteryServiceBookingCoordinator.launchBatteryServiceBookingFlow()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2363702AC;
  return v5();
}

void sub_23636F4EC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2563DDDA0)
  {
    sub_23637AA9C();
    v0 = sub_23637A9B8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2563DDDA0);
  }
}

uint64_t sub_23636F540(__int128 *a1, uint64_t a2)
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

unint64_t sub_23636F580()
{
  unint64_t result;

  result = qword_2563DDDB0;
  if (!qword_2563DDDB0)
  {
    result = MEMORY[0x23B7F153C](&unk_23637B74C, &type metadata for RequestManagerError);
    atomic_store(result, (unint64_t *)&qword_2563DDDB0);
  }
  return result;
}

uint64_t sub_23636F5C4(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23636F5EC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CompositeHTTPHeadersProvider();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23636F628()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_2363702AC;
  return sub_236372B88(v2, v3, v4);
}

void sub_23636F688(uint64_t a1, unint64_t a2, void *a3)
{
  if (a3)
  {
    sub_236364934(a1, a2);

  }
}

uint64_t sub_23636F6B4(uint64_t a1, unint64_t a2)
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

uint64_t sub_23636F6F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23636F734(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v9;
  *v9 = v3;
  v9[1] = sub_2363702AC;
  return sub_236374364(a1, a2, v6, v7, v8);
}

unint64_t sub_23636F7B0()
{
  unint64_t result;

  result = qword_2563DDE48;
  if (!qword_2563DDE48)
  {
    result = MEMORY[0x23B7F153C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2563DDE48);
  }
  return result;
}

unint64_t sub_23636F7F4()
{
  unint64_t result;

  result = qword_2563DDE58;
  if (!qword_2563DDE58)
  {
    result = MEMORY[0x23B7F153C](&unk_23637B940, &type metadata for HandoffRequest);
    atomic_store(result, (unint64_t *)&qword_2563DDE58);
  }
  return result;
}

uint64_t sub_23636F83C()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_23636AFD0;
  return ((uint64_t (*)(const void *, uint64_t))((char *)&dword_2563DDE68 + dword_2563DDE68))(v2, v3);
}

uint64_t sub_23636F8A4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_2363702AC;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2563DDE78 + dword_2563DDE78))(v2, v3, v4);
}

uint64_t sub_23636F920(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_2363702AC;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2563DDE88 + dword_2563DDE88))(a1, v4, v5, v6);
}

uint64_t sub_23636F9A4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23636F9C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2363702AC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2563DDE98 + dword_2563DDE98))(a1, v4);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23636FA68()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_2363702AC;
  return ((uint64_t (*)(const void *, uint64_t))((char *)&dword_2563DDEA8 + dword_2563DDEA8))(v2, v3);
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

uint64_t sub_23636FB14(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_23636FB58(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_23636FB9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2563DDEE8;
  if (!qword_2563DDEE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563DDEF0);
    result = MEMORY[0x23B7F153C](&unk_23637BD58, v1);
    atomic_store(result, (unint64_t *)&qword_2563DDEE8);
  }
  return result;
}

uint64_t sub_23636FBE8()
{
  return objectdestroy_56Tm((void (*)(_QWORD))MEMORY[0x24BEE4F70], (void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_23636FC00(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_2363702AC;
  return sub_23636AB98(a1, v4, v5, v6);
}

uint64_t sub_23636FC6C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23636AFD0;
  return sub_23636AF40();
}

uint64_t sub_23636FCC0()
{
  return sub_23636B018();
}

uint64_t sub_23636FCC8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
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

uint64_t sub_23636FD40()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23636FD74()
{
  return objectdestroy_56Tm((void (*)(_QWORD))MEMORY[0x24BEE4EF8], (void (*)(_QWORD))MEMORY[0x24BEE4BC0]);
}

uint64_t objectdestroy_56Tm(void (*a1)(_QWORD), void (*a2)(_QWORD))
{
  uint64_t v2;

  a1(*(_QWORD *)(v2 + 16));
  a2(*(_QWORD *)(v2 + 32));
  return swift_deallocObject();
}

uint64_t sub_23636FDD4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_2363702AC;
  return sub_236366A7C(a1, v4, v5, v6);
}

uint64_t sub_23636FE4C()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23636FE80(uint64_t a1)
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
  v8[1] = sub_2363702AC;
  return sub_2363670E0(a1, v4, v5, v7, v6);
}

uint64_t sub_23636FEF8(uint64_t a1, uint64_t a2)
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
  v10[1] = sub_2363702AC;
  return sub_23636C2B0(a1, a2, v6, v7, v9, v8);
}

unint64_t sub_23636FF78()
{
  unint64_t result;

  result = qword_2563DDF58;
  if (!qword_2563DDF58)
  {
    result = MEMORY[0x23B7F153C](&unk_23637B658, &type metadata for ErrorWithTelemetryEvent);
    atomic_store(result, (unint64_t *)&qword_2563DDF58);
  }
  return result;
}

unint64_t sub_23636FFBC()
{
  unint64_t result;

  result = qword_2563DDF60;
  if (!qword_2563DDF60)
  {
    result = MEMORY[0x23B7F153C](&unk_23637C458, &type metadata for TimeoutError);
    atomic_store(result, (unint64_t *)&qword_2563DDF60);
  }
  return result;
}

uint64_t objectdestroy_22Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_236370030(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v4 = *(int **)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2363702AC;
  v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v6 = (_QWORD *)swift_task_alloc();
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_2363702AC;
  return v8(a1);
}

uint64_t sub_2363700B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = sub_23637AAFC();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_23637AB14();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_236370174(uint64_t a1)
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
  uint64_t v12;
  _QWORD *v13;

  v4 = *(_QWORD *)(sub_23637AAFC() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(sub_23637AB14() - 8) + 80);
  v8 = v5 + v6 + v7;
  v9 = *(_QWORD *)(v1 + 16);
  v10 = *(_QWORD *)(v1 + 24);
  v11 = v1 + v5;
  v12 = v1 + (v8 & ~v7);
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v13;
  *v13 = v2;
  v13[1] = sub_2363702AC;
  return sub_23636C7F4(a1, v9, v10, v11, v12);
}

uint64_t sub_236370228(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23637026C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B7F153C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2363702B4(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDFD0);
  v2 = sub_23637AB74();
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
    sub_236370228(v6, (uint64_t)&v15, &qword_2563DDFD8);
    v7 = v15;
    v8 = v16;
    result = sub_236370B50(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_236371210(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_2363703E8(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDFE0);
  v2 = (_QWORD *)sub_23637AB74();
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
    result = sub_236370B50(v5, v6);
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

unint64_t sub_236370508(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDFF8);
  v2 = sub_23637AB74();
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
    sub_236370228(v6, (uint64_t)&v13, &qword_2563DE000);
    v7 = v13;
    result = sub_236370C14(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_236371210(&v14, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_236370634(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDFE8);
  v2 = sub_23637AB74();
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
    sub_236370228(v6, (uint64_t)&v15, &qword_2563DDFF0);
    v7 = v15;
    v8 = v16;
    result = sub_236370C94(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = sub_23636F540(&v17, v3[7] + 40 * result);
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 56;
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

id BatteryServiceOptions.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

unint64_t sub_236370794()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned int v11;
  __int128 v12;
  __int128 v13;

  v1 = sub_23637A844();
  v3 = v2;
  v4 = *(_QWORD *)(v0 + OBJC_IVAR____ACSBatteryServiceOptions_storage);
  if (!*(_QWORD *)(v4 + 16))
  {
    v12 = 0u;
    v13 = 0u;
LABEL_8:
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  v5 = v1;
  swift_bridgeObjectRetain();
  v6 = sub_236370B50(v5, v3);
  if ((v7 & 1) == 0)
  {
    v12 = 0u;
    v13 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  sub_23636F6F8(*(_QWORD *)(v4 + 56) + 32 * v6, (uint64_t)&v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v13 + 1))
  {
LABEL_9:
    sub_236364A64((uint64_t)&v12);
    goto LABEL_10;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_10:
    v9 = 0;
    v8 = 1;
    return v9 | ((unint64_t)v8 << 32);
  }
  v8 = 0;
  v9 = v11;
  return v9 | ((unint64_t)v8 << 32);
}

id BatteryServiceOptions.init()()
{
  void *v0;
  char *v1;
  objc_super v3;

  v1 = v0;
  *(_QWORD *)&v1[OBJC_IVAR____ACSBatteryServiceOptions_storage] = sub_2363702B4(MEMORY[0x24BEE4AF8]);

  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for BatteryServiceOptions();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for BatteryServiceOptions()
{
  return objc_opt_self();
}

id BatteryServiceOptions.__allocating_init(values:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  objc_super v5;

  v3 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v3[OBJC_IVAR____ACSBatteryServiceOptions_storage] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id BatteryServiceOptions.init(values:)(uint64_t a1)
{
  char *v1;
  objc_super v3;

  *(_QWORD *)&v1[OBJC_IVAR____ACSBatteryServiceOptions_storage] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for BatteryServiceOptions();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t sub_236370A70@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  char v9;

  v5 = *(_QWORD *)(v3 + OBJC_IVAR____ACSBatteryServiceOptions_storage);
  if (*(_QWORD *)(v5 + 16))
  {
    v7 = result;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v8 = sub_236370B50(v7, a2);
    if ((v9 & 1) != 0)
    {
      sub_23636F6F8(*(_QWORD *)(v5 + 56) + 32 * v8, (uint64_t)a3);
    }
    else
    {
      *a3 = 0u;
      a3[1] = 0u;
    }
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

id BatteryServiceOptions.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BatteryServiceOptions();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_236370B50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23637AC7C();
  sub_23637A874();
  v4 = sub_23637AC94();
  return sub_236370D7C(a1, a2, v4);
}

uint64_t method lookup function for BatteryServiceOptions()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BatteryServiceOptions.__allocating_init(values:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of BatteryServiceOptions.subscript.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

unint64_t sub_236370BE4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23637A9A0();
  return sub_236370E5C(a1, v2);
}

unint64_t sub_236370C14(uint64_t a1)
{
  uint64_t v2;

  sub_23637A844();
  sub_23637AC7C();
  sub_23637A874();
  v2 = sub_23637AC94();
  swift_bridgeObjectRelease();
  return sub_236370F64(a1, v2);
}

unint64_t sub_236370C94(uint64_t a1, unint64_t a2)
{
  uint64_t v4;

  sub_23637AC7C();
  switch(a2)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
      sub_23637AC88();
      break;
    default:
      sub_23637AC88();
      sub_23637A874();
      break;
  }
  v4 = sub_23637AC94();
  return sub_2363710D8(a1, a2, v4);
}

unint64_t sub_236370D7C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23637ABEC() & 1) == 0)
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
      while (!v14 && (sub_23637ABEC() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_236370E5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_236363424();
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_23637A9AC();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_23637A9AC();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_236370F64(uint64_t a1, uint64_t a2)
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
    v6 = sub_23637A844();
    v8 = v7;
    if (v6 == sub_23637A844() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_23637ABEC();
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
          v13 = sub_23637A844();
          v15 = v14;
          if (v13 == sub_23637A844() && v15 == v16)
            break;
          v18 = sub_23637ABEC();
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

unint64_t sub_2363710D8(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = ~v5;
    v10 = *(_QWORD *)(v3 + 48);
    while (2)
    {
      v11 = (_QWORD *)(v10 + 16 * v6);
      v12 = v11[1];
      switch(v12)
      {
        case 0:
          if (a2)
            goto LABEL_4;
          break;
        case 1:
          if (a2 != 1)
            goto LABEL_4;
          break;
        case 2:
          if (a2 != 2)
            goto LABEL_4;
          break;
        case 3:
          if (a2 != 3)
            goto LABEL_4;
          break;
        case 4:
          if (a2 != 4)
            goto LABEL_4;
          break;
        case 5:
          if (a2 != 5)
            goto LABEL_4;
          break;
        case 6:
          if (a2 != 6)
            goto LABEL_4;
          break;
        default:
          if (a2 < 7 || (*v11 == a1 ? (v13 = v12 == a2) : (v13 = 0), !v13 && (sub_23637ABEC() & 1) == 0))
          {
LABEL_4:
            v6 = (v6 + 1) & v9;
            if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
              continue;
          }
          break;
      }
      break;
    }
  }
  return v6;
}

_OWORD *sub_236371210(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_236371220()
{
  uint64_t v0;

  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for UserDefaultsActor()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for TransactionIDHeadersProvider()
{
  return &type metadata for TransactionIDHeadersProvider;
}

void sub_236371274()
{
  strcpy((char *)&qword_2563DFDA8, "X-Apple-Txn-ID");
  unk_2563DFDB7 = -18;
}

unint64_t sub_2363712A4()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_2363712C0()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = sub_23637A76C();
  v0[10] = v1;
  v0[11] = *(_QWORD *)(v1 - 8);
  v0[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23637131C()
{
  uint64_t v0;
  uint64_t inited;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDCB0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23637B860;
  if (qword_2563DDA90 != -1)
    swift_once();
  v3 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v4 = *(_QWORD *)(v0 + 80);
  v5 = unk_2563DFDB0;
  *(_QWORD *)(inited + 32) = qword_2563DFDA8;
  *(_QWORD *)(inited + 40) = v5;
  swift_bridgeObjectRetain();
  sub_23637A760();
  v6 = sub_23637A754();
  v8 = v7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  *(_QWORD *)(inited + 48) = v6;
  *(_QWORD *)(inited + 56) = v8;
  v9 = sub_2363703E8(inited);
  swift_task_dealloc();
  return (*(uint64_t (**)(unint64_t))(v0 + 8))(v9);
}

uint64_t sub_236371408(uint64_t *a1)
{
  uint64_t result;
  unint64_t v2;

  result = type metadata accessor for CachingTask.State(319, a1[10], a1[11], a1[12]);
  if (v2 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_236371494()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 112);
  v2 = type metadata accessor for CachingTask.State(0, *(_QWORD *)(*(_QWORD *)v0 + 80), *(_QWORD *)(*(_QWORD *)v0 + 88), *(_QWORD *)(*(_QWORD *)v0 + 96));
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_2363714FC()
{
  sub_236371494();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for CachingTask(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CachingTask);
}

uint64_t type metadata accessor for CachingTask.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CachingTask.State);
}

uint64_t sub_23637152C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_236371534()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_2363715AC(uint64_t *__dst, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;

  v3 = __dst;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8));
  }
  else
  {
    v9 = *((unsigned __int8 *)a2 + v5);
    if (v9 >= 2)
    {
      if (v5 <= 3)
        v10 = v5;
      else
        v10 = 4;
      __asm { BR              X14 }
    }
    if (v9 == 1)
    {
      (*(void (**)(uint64_t *))(v4 + 16))(__dst);
      *((_BYTE *)v3 + v5) = 1;
      return v3;
    }
    *__dst = *a2;
    *((_BYTE *)__dst + v5) = 0;
  }
  swift_retain();
  return v3;
}

uint64_t sub_2363716D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  if (v3 <= 8)
    v3 = 8;
  v4 = *(unsigned __int8 *)(a1 + v3);
  if (v4 < 2)
  {
    if (v4 == 1)
      return (*(uint64_t (**)(void))(v2 + 8))();
    else
      return swift_release();
  }
  else
  {
    if (v3 <= 3)
      v5 = v3;
    else
      v5 = 4;
    return ((uint64_t (*)(void))((char *)&loc_23637171C + 4 * byte_23637BCB5[v5]))();
  }
}

_BYTE *sub_23637177C(_BYTE *__dst, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *((unsigned __int8 *)a2 + v5);
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    (*(void (**)(_BYTE *))(v4 + 16))(__dst);
    __dst[v5] = 1;
  }
  else
  {
    *(_QWORD *)__dst = *a2;
    __dst[v5] = 0;
    swift_retain();
  }
  return __dst;
}

unsigned __int8 *sub_236371868(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  if (__dst != __src)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 8uLL)
      v7 = 8;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = __dst[v7];
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 1)
      (*(void (**)(unsigned __int8 *, _QWORD))(v6 + 8))(__dst, *(_QWORD *)(a3 + 16));
    else
      swift_release();
    v10 = __src[v7];
    if (v10 >= 2)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(__dst, __src, v5);
      __dst[v7] = 1;
    }
    else
    {
      *(_QWORD *)__dst = *(_QWORD *)__src;
      __dst[v7] = 0;
      swift_retain();
    }
  }
  return __dst;
}

_BYTE *sub_236371A14(_BYTE *__dst, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *((unsigned __int8 *)a2 + v5);
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    (*(void (**)(_BYTE *))(v4 + 32))(__dst);
    __dst[v5] = 1;
  }
  else
  {
    *(_QWORD *)__dst = *a2;
    __dst[v5] = 0;
  }
  return __dst;
}

unsigned __int8 *sub_236371AFC(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  if (__dst != __src)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 8uLL)
      v7 = 8;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = __dst[v7];
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 1)
      (*(void (**)(unsigned __int8 *, _QWORD))(v6 + 8))(__dst, *(_QWORD *)(a3 + 16));
    else
      swift_release();
    v10 = __src[v7];
    if (v10 >= 2)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(__dst, __src, v5);
      __dst[v7] = 1;
    }
    else
    {
      *(_QWORD *)__dst = *(_QWORD *)__src;
      __dst[v7] = 0;
    }
  }
  return __dst;
}

uint64_t sub_236371CA4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  v3 = 8;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) > 8uLL)
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_21;
  v4 = v3 + 1;
  v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    v8 = ((a2 + ~(-1 << v5) - 253) >> v5) + 1;
    if (HIWORD(v8))
    {
      v6 = *(_DWORD *)(a1 + v4);
      if (!v6)
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 > 0xFF)
    {
      v6 = *(unsigned __int16 *)(a1 + v4);
      if (!*(_WORD *)(a1 + v4))
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 < 2)
    {
LABEL_21:
      v10 = *(unsigned __int8 *)(a1 + v3);
      if (v10 >= 3)
        return (v10 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (!*(_BYTE *)(a1 + v4))
    goto LABEL_21;
LABEL_14:
  v9 = (v6 - 1) << v5;
  if (v4 > 3)
    v9 = 0;
  if (!(_DWORD)v4)
    return (v9 + 254);
  if (v4 > 3)
    LODWORD(v4) = 4;
  return ((uint64_t (*)(void))((char *)&loc_236371D68 + 4 * byte_23637BCD8[(v4 - 1)]))();
}

void sub_236371DB4(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (v5 <= 8)
    v5 = 8;
  v6 = v5 + 1;
  if (a3 < 0xFE)
  {
    v7 = 0;
  }
  else if (v6 <= 3)
  {
    v9 = ((a3 + ~(-1 << (8 * v6)) - 253) >> (8 * v6)) + 1;
    if (HIWORD(v9))
    {
      v7 = 4u;
    }
    else if (v9 >= 0x100)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 > 1;
    }
  }
  else
  {
    v7 = 1u;
  }
  if (a2 <= 0xFD)
    __asm { BR              X11 }
  v8 = a2 - 254;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v10 = v8 & ~(-1 << (8 * v6));
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v10;
        *((_BYTE *)a1 + 2) = BYTE2(v10);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v10;
      }
      else
      {
        *(_BYTE *)a1 = v10;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v8;
  }
  __asm { BR              X10 }
}

uint64_t sub_236371F5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 8;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) > 8uLL)
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 2u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_236371FA4 + 4 * byte_23637BCE6[v3]))();
}

void sub_236371FEC(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) <= 8uLL)
    v4 = 8;
  else
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (a2 > 1)
  {
    v5 = a2 - 2;
    if (v4 < 4)
    {
      v6 = v5 >> (8 * v4);
      v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if ((_DWORD)v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if ((_DWORD)v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t sub_2363720B4()
{
  return sub_23636A404();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B7F14E8](a1, v6, a5);
}

void sub_2363720F8()
{
  uint64_t v0;
  id v1;
  id v2;

  v0 = sub_23637A7E4();
  __swift_allocate_value_buffer(v0, qword_2563DFDB8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2563DFDB8);
  v1 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v2 = objc_msgSend(v1, sel_bundleIdentifier);

  if (v2)
  {
    sub_23637A844();

    sub_23637A7D8();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2363721C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _UNKNOWN **v12;

  swift_beginAccess();
  if (!*(_QWORD *)(*(_QWORD *)(v2 + 128) + 16)
    || (swift_bridgeObjectRetain(),
        sub_236370C94(0, 1uLL),
        v6 = v5,
        result = swift_bridgeObjectRelease(),
        (v6 & 1) == 0))
  {
    v8 = 0x6572756C696166;
    v9 = MEMORY[0x24BEE0D00];
    if (!a2)
      v8 = 0x73736563637573;
    *((_QWORD *)&v11 + 1) = MEMORY[0x24BEE0D00];
    v12 = &off_2507B0230;
    *(_QWORD *)&v10 = v8;
    *((_QWORD *)&v10 + 1) = 0xE700000000000000;
    swift_beginAccess();
    sub_2363661DC((uint64_t)&v10, 0, 1uLL);
    if (a2)
    {
      *((_QWORD *)&v11 + 1) = v9;
      v12 = &off_2507B0230;
      *(_QWORD *)&v10 = a1;
      *((_QWORD *)&v10 + 1) = a2;
    }
    else
    {
      v12 = 0;
      v10 = 0u;
      v11 = 0u;
    }
    swift_bridgeObjectRetain();
    sub_2363661DC((uint64_t)&v10, 0, 2uLL);
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_2363722F0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_23637231C(uint64_t a1, uint64_t a2)
{
  sub_23637AC7C();
  switch(a2)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      sub_23637AC88();
      break;
    default:
      sub_23637AC88();
      sub_23637A874();
      break;
  }
  return sub_23637AC94();
}

uint64_t sub_2363723F4()
{
  uint64_t *v0;

  return sub_23637231C(*v0, v0[1]);
}

uint64_t sub_2363723FC()
{
  uint64_t v0;
  uint64_t result;

  switch(*(_QWORD *)(v0 + 8))
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      result = sub_23637AC88();
      break;
    default:
      sub_23637AC88();
      result = sub_23637A874();
      break;
  }
  return result;
}

uint64_t sub_2363724AC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_23637AC7C();
  switch(v1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      sub_23637AC88();
      break;
    default:
      sub_23637AC88();
      sub_23637A874();
      break;
  }
  return sub_23637AC94();
}

uint64_t sub_23637257C(uint64_t *a1, uint64_t a2)
{
  return sub_236372870(*a1, a1[1], *(_QWORD *)a2, *(_QWORD *)(a2 + 8));
}

uint64_t sub_236372590()
{
  return sub_23637A820();
}

uint64_t sub_236372598()
{
  return sub_23637A970();
}

uint64_t sub_2363725A0()
{
  return sub_23637A964();
}

uint64_t sub_2363725A8()
{
  return sub_23637A8A4();
}

uint64_t type metadata accessor for TelemetryEvent()
{
  return objc_opt_self();
}

unint64_t destroy for TelemetryEvent.Key(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s16AppleCareSupport14TelemetryEventC3KeyOwCP_0(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithCopy for TelemetryEvent.Key(_QWORD *a1, _QWORD *a2)
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

uint64_t assignWithTake for TelemetryEvent.Key(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for TelemetryEvent.Key(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFF9 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483641);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 6;
  if (v4 >= 8)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for TelemetryEvent.Key(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF9)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483641;
    if (a3 >= 0x7FFFFFF9)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFF9)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 6;
  }
  return result;
}

uint64_t sub_2363727E0(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_2363727F8(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for TelemetryEvent.Key()
{
  return &type metadata for TelemetryEvent.Key;
}

unint64_t sub_23637282C()
{
  unint64_t result;

  result = qword_2563DE320;
  if (!qword_2563DE320)
  {
    result = MEMORY[0x23B7F153C](&unk_23637BE14, &type metadata for TelemetryEvent.Key);
    atomic_store(result, &qword_2563DE320);
  }
  return result;
}

uint64_t sub_236372870(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t result;

  switch(a2)
  {
    case 0:
      if (a4)
        goto LABEL_20;
      result = 1;
      break;
    case 1:
      if (a4 != 1)
        goto LABEL_20;
      result = 1;
      break;
    case 2:
      if (a4 != 2)
        goto LABEL_20;
      result = 1;
      break;
    case 3:
      if (a4 != 3)
        goto LABEL_20;
      result = 1;
      break;
    case 4:
      if (a4 != 4)
        goto LABEL_20;
      result = 1;
      break;
    case 5:
      if (a4 != 5)
        goto LABEL_20;
      result = 1;
      break;
    case 6:
      if (a4 != 6)
        goto LABEL_20;
      result = 1;
      break;
    default:
      if (a4 < 7)
      {
LABEL_20:
        result = 0;
      }
      else if (a1 == a3 && a2 == a4)
      {
        result = 1;
      }
      else
      {
        result = sub_23637ABEC();
      }
      break;
  }
  return result;
}

uint64_t sub_23637292C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_236372944()
{
  uint64_t v0;
  _QWORD *v1;

  if (qword_2563DDA80 != -1)
    swift_once();
  *(_QWORD *)(v0 + 24) = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_, qword_2563DFD70);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_2363729F4;
  return sub_23637A97C();
}

uint64_t sub_2363729F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v8;

  v8 = *v4;
  *(_QWORD *)(v8 + 40) = v3;
  swift_task_dealloc();
  if (v3)
    return swift_task_switch();

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 8))(a1, a2, a3);
}

uint64_t sub_236372A98()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236372ACC@<X0>(char a1@<W0>, uint64_t *a2@<X8>)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t result;

  v4 = objc_msgSend((id)objc_opt_self(), sel_defaultStore);
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0ACC0]), sel_init);
  v6 = sub_2363703E8(MEMORY[0x24BEE4AF8]);
  a2[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DE330);
  a2[4] = (uint64_t)&off_2507B0968;
  result = swift_allocObject();
  *a2 = result;
  *(_QWORD *)(result + 16) = v4;
  *(_QWORD *)(result + 24) = v5;
  *(_BYTE *)(result + 32) = a1;
  *(_QWORD *)(result + 40) = v6;
  return result;
}

uint64_t sub_236372B88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = sub_23637A664();
  v3[5] = v4;
  v3[6] = *(_QWORD *)(v4 - 8);
  v3[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_236372BEC()
{
  _QWORD *v0;
  int *v1;
  _QWORD *v2;
  uint64_t (*v4)(_QWORD);

  v1 = *(int **)(v0[3] + 8);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[6] + 16))(v0[7], v0[4], v0[5]);
  v4 = (uint64_t (*)(_QWORD))((char *)v1 + *v1);
  v2 = (_QWORD *)swift_task_alloc();
  v0[8] = v2;
  *v2 = v0;
  v2[1] = sub_236372C60;
  return v4(v0[7]);
}

uint64_t sub_236372C60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = *(_QWORD **)v4;
  *(_QWORD *)(*(_QWORD *)v4 + 72) = v3;
  swift_task_dealloc();
  v10 = v8[6];
  v9 = v8[7];
  v11 = v8[5];
  if (!v3)
  {
    v8[10] = a3;
    v8[11] = a2;
    v8[12] = a1;
  }
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  return swift_task_switch();
}

uint64_t sub_236372D00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(uint64_t **)(v0 + 16);
  v3 = *v2;
  v4 = v2[1];
  v5 = (void *)v2[2];
  *(int8x16_t *)v2 = vextq_s8(*(int8x16_t *)(v0 + 88), *(int8x16_t *)(v0 + 88), 8uLL);
  v2[2] = v1;
  sub_23636F688(v3, v4, v5);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236372D5C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236372D90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v10;
  uint64_t inited;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDE28);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_23637BEB0;
  *(_QWORD *)(v10 + 56) = &type metadata for UserAgentHeadersProvider;
  *(_QWORD *)(v10 + 64) = &off_2507B08F0;
  *(_QWORD *)(v10 + 96) = &type metadata for TransactionIDHeadersProvider;
  *(_QWORD *)(v10 + 104) = &off_2507B00D0;
  *(_QWORD *)(v10 + 136) = &type metadata for ContentTypeHeadersProvider;
  *(_QWORD *)(v10 + 144) = &off_2507B0598;
  *(_QWORD *)(v10 + 176) = &type metadata for AnisetteHeadersProvider;
  *(_QWORD *)(v10 + 184) = &off_2507AF8E0;
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23637B860;
  *(_QWORD *)(inited + 56) = &type metadata for BAAHeadersProvider;
  *(_QWORD *)(inited + 64) = &off_2507B0620;
  result = sub_23636D810(inited);
  *a5 = v10;
  a5[1] = a1;
  a5[2] = a2;
  a5[3] = a3;
  a5[4] = a4;
  return result;
}

uint64_t sub_236372ECC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t destroy for SignedRequestManager()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for SignedRequestManager(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for SignedRequestManager(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_retain();
  swift_release();
  v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for SignedRequestManager(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  v4 = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SignedRequestManager(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SignedRequestManager(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SignedRequestManager()
{
  return &type metadata for SignedRequestManager;
}

uint64_t sub_236373104(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23637A724();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_236373140(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23637A724();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_236373174(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23637A724();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_2363731B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23637A724();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_2363731FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23637A724();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_236373240(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23637A724();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_236373284()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_236373290(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23637A724();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_2363732CC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2363732D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23637A724();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for HandoffResponse()
{
  uint64_t result;

  result = qword_2563DE398;
  if (!qword_2563DE398)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_236373354()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23637A724();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2363733BC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;

  v18 = a2;
  v20 = sub_23637A724();
  v17 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20, v4);
  v19 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DE3D0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for HandoffResponse();
  MEMORY[0x24BDAC7A8](v11, v12);
  v14 = (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23637381C();
  sub_23637ACA0();
  if (!v2)
  {
    sub_2363738A4(&qword_2563DE3E0, MEMORY[0x24BDCDB10]);
    sub_23637ABBC();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v14, v19, v20);
    sub_236373860((uint64_t)v14, v18);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23637357C()
{
  return sub_236373B24();
}

uint64_t sub_2363735AC()
{
  return sub_236373AC8();
}

uint64_t sub_2363735D8@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_23637AB98();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_236373628@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_236373BA0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_236373650@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_23637AB98();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_2363736A4(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2363736B0()
{
  sub_23637381C();
  return sub_23637AD54();
}

uint64_t sub_2363736D8()
{
  sub_23637381C();
  return sub_23637AD60();
}

uint64_t sub_236373700@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2363733BC(a1, a2);
}

uint64_t sub_236373714(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DE3E8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23637381C();
  sub_23637ACAC();
  sub_23637A724();
  sub_2363738A4(&qword_2563DE3F0, MEMORY[0x24BDCDAE0]);
  sub_23637ABD4();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

unint64_t sub_23637381C()
{
  unint64_t result;

  result = qword_2563DE3D8;
  if (!qword_2563DE3D8)
  {
    result = MEMORY[0x23B7F153C](&unk_23637C060, &type metadata for HandoffResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563DE3D8);
  }
  return result;
}

uint64_t sub_236373860(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HandoffResponse();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2363738A4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23637A724();
    result = MEMORY[0x23B7F153C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for HandoffResponse.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for HandoffResponse.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_236373978 + 4 * byte_23637BEF0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_236373998 + 4 * byte_23637BEF5[v4]))();
}

_BYTE *sub_236373978(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_236373998(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2363739A0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2363739A8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2363739B0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2363739B8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for HandoffResponse.CodingKeys()
{
  return &type metadata for HandoffResponse.CodingKeys;
}

unint64_t sub_2363739D8()
{
  unint64_t result;

  result = qword_2563DE3F8;
  if (!qword_2563DE3F8)
  {
    result = MEMORY[0x23B7F153C](&unk_23637C038, &type metadata for HandoffResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563DE3F8);
  }
  return result;
}

unint64_t sub_236373A20()
{
  unint64_t result;

  result = qword_2563DE400;
  if (!qword_2563DE400)
  {
    result = MEMORY[0x23B7F153C](&unk_23637BF70, &type metadata for HandoffResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563DE400);
  }
  return result;
}

unint64_t sub_236373A68()
{
  unint64_t result;

  result = qword_2563DE408;
  if (!qword_2563DE408)
  {
    result = MEMORY[0x23B7F153C](&unk_23637BF98, &type metadata for HandoffResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563DE408);
  }
  return result;
}

uint64_t sub_236373AAC()
{
  return 1;
}

uint64_t sub_236373AB4()
{
  return sub_236373AC8();
}

uint64_t sub_236373AC8()
{
  sub_23637AC7C();
  sub_23637A874();
  return sub_23637AC94();
}

uint64_t sub_236373B10()
{
  return sub_236373B24();
}

uint64_t sub_236373B24()
{
  sub_23637AC7C();
  sub_23637A874();
  return sub_23637AC94();
}

uint64_t sub_236373B70()
{
  return sub_23637A874();
}

uint64_t sub_236373B8C()
{
  return sub_23637A874();
}

uint64_t sub_236373BA0()
{
  return 0x5566666F646E6168;
}

uint64_t Clock.measureInheritingActorContext(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t AssociatedTypeWitness;

  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6[8] = AssociatedTypeWitness;
  v6[9] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6[10] = swift_task_alloc();
  v6[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_236373C54()
{
  uint64_t v0;
  int *v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v1 = *(int **)(v0 + 24);
  sub_23637AC28();
  v4 = (uint64_t (*)(void))((char *)v1 + *v1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v2;
  *v2 = v0;
  v2[1] = sub_236373CC0;
  return v4();
}

uint64_t sub_236373CC0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236373D24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v2 = *(_QWORD *)(v0 + 80);
  v1 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 72);
  sub_23637AC28();
  swift_getAssociatedConformanceWitness();
  sub_23637AAC0();
  v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v5(v2, v3);
  v5(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236373DF0()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 64));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236373E40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  v4 = sub_23637AA9C();
  v3[7] = v4;
  v3[8] = *(_QWORD *)(v4 - 8);
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_236373EB4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  _QWORD *v3;

  v1 = sub_23637AAB4();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10];
  v0[11] = v1;
  v0[12] = sub_23637026C(&qword_2563DDDD0, v2, MEMORY[0x24BEE6E20]);
  sub_23637AC28();
  v3 = (_QWORD *)swift_task_alloc();
  v0[13] = (uint64_t)v3;
  *v3 = v0;
  v3[1] = sub_236373F50;
  return sub_236367894(v0[5], v0[6]);
}

uint64_t sub_236373F50()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236373FB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  v4 = sub_23637AA9C();
  v3[7] = v4;
  v3[8] = *(_QWORD *)(v4 - 8);
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_236374028()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  _QWORD *v3;

  v1 = sub_23637AAB4();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10];
  v0[11] = v1;
  v0[12] = sub_23637026C(&qword_2563DDDD0, v2, MEMORY[0x24BEE6E20]);
  sub_23637AC28();
  v3 = (_QWORD *)swift_task_alloc();
  v0[13] = (uint64_t)v3;
  *v3 = v0;
  v3[1] = sub_2363740C4;
  return sub_23636E9BC(v0[5], v0[6]);
}

uint64_t sub_2363740C4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236374128()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 64);
  sub_23637AC28();
  sub_23637026C(&qword_2563DE420, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  sub_23637AAC0();
  v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v5(v2, v3);
  v5(v1, v3);
  v7 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v7, v6);
}

uint64_t sub_2363741EC()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 56));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

ValueMetadata *type metadata accessor for ContentTypeHeadersProvider()
{
  return &type metadata for ContentTypeHeadersProvider;
}

void sub_236374254()
{
  strcpy((char *)&qword_2563DFDD0, "Content-Type");
  algn_2563DFDD8[5] = 0;
  *(_WORD *)&algn_2563DFDD8[6] = -5120;
}

unint64_t sub_236374280()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_23637429C()
{
  return swift_task_switch();
}

uint64_t sub_2363742B0()
{
  uint64_t v0;
  uint64_t inited;
  uint64_t v2;
  unint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDCB0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23637B860;
  if (qword_2563DDAA0 != -1)
    swift_once();
  v2 = *(_QWORD *)algn_2563DFDD8;
  *(_QWORD *)(inited + 32) = qword_2563DFDD0;
  *(_QWORD *)(inited + 40) = v2;
  *(_QWORD *)(inited + 48) = 0xD000000000000010;
  *(_QWORD *)(inited + 56) = 0x800000023637CD60;
  swift_bridgeObjectRetain();
  v3 = sub_2363703E8(inited);
  return (*(uint64_t (**)(unint64_t))(v0 + 8))(v3);
}

uint64_t sub_236374364(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5[19] = a4;
  v5[20] = a5;
  v5[17] = a2;
  v5[18] = a3;
  v5[16] = a1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DE440);
  v5[21] = v6;
  v5[22] = *(_QWORD *)(v6 - 8);
  v5[23] = swift_task_alloc();
  v7 = sub_23637A664();
  v5[24] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v5[25] = v8;
  v5[26] = *(_QWORD *)(v8 + 64);
  v5[27] = swift_task_alloc();
  v9 = *(_QWORD *)(type metadata accessor for CompositeHTTPHeadersProvider() - 8);
  v5[28] = v9;
  v5[29] = *(_QWORD *)(v9 + 64);
  v5[30] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDE60);
  v5[31] = swift_task_alloc();
  v5[32] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_236374458()
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
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  void (*v27)(void);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  if (v2)
  {
    v32 = (__int128 *)(v0 + 16);
    v30 = *(_QWORD *)(v0 + 200);
    v31 = *(_QWORD *)(v0 + 224);
    v3 = *(_QWORD *)v1 + 32;
    v29 = *(_QWORD *)(v0 + 208) + 7;
    v4 = sub_23637A910();
    v5 = *(_QWORD *)(v4 - 8);
    v27 = *(void (**)(void))(v5 + 56);
    swift_bridgeObjectRetain();
    v28 = v5;
    do
    {
      v33 = v2;
      v36 = *(_QWORD *)(v0 + 256);
      v38 = *(_QWORD *)(v0 + 248);
      v7 = v4;
      v9 = *(_QWORD *)(v0 + 232);
      v8 = *(_QWORD *)(v0 + 240);
      v10 = *(_QWORD *)(v0 + 216);
      v11 = *(_QWORD *)(v0 + 192);
      v34 = v11;
      v35 = v10;
      v12 = *(_QWORD *)(v0 + 152);
      v37 = *(_QWORD *)(v0 + 160);
      v13 = *(_QWORD *)(v0 + 144);
      v27();
      sub_2363632B0(v3, (uint64_t)v32);
      sub_2363758A4(v13, v8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v10, v12, v11);
      v14 = (*(unsigned __int8 *)(v31 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
      v15 = (v9 + *(unsigned __int8 *)(v30 + 80) + v14) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
      v16 = (v29 + v15) & 0xFFFFFFFFFFFFFFF8;
      v17 = swift_allocObject();
      *(_QWORD *)(v17 + 16) = 0;
      *(_QWORD *)(v17 + 24) = 0;
      sub_23636F540(v32, v17 + 32);
      sub_2363759E0(v8, v17 + v14);
      v18 = v17 + v15;
      v4 = v7;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v30 + 32))(v18, v35, v34);
      *(_QWORD *)(v17 + v16) = v37;
      sub_236375B00(v36, v38);
      LODWORD(v8) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v38, 1, v7);
      swift_retain();
      v19 = *(_QWORD *)(v0 + 248);
      if ((_DWORD)v8 == 1)
      {
        sub_236375B48(*(_QWORD *)(v0 + 248));
      }
      else
      {
        sub_23637A904();
        (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v19, v7);
      }
      if (*(_QWORD *)(v17 + 16))
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        v20 = sub_23637A8B0();
        v22 = v21;
        swift_unknownObjectRelease();
      }
      else
      {
        v20 = 0;
        v22 = 0;
      }
      v23 = **(_QWORD **)(v0 + 136);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDCF0);
      v24 = v22 | v20;
      if (v22 | v20)
      {
        v24 = v0 + 56;
        *(_QWORD *)(v0 + 56) = 0;
        *(_QWORD *)(v0 + 64) = 0;
        *(_QWORD *)(v0 + 72) = v20;
        *(_QWORD *)(v0 + 80) = v22;
      }
      v6 = *(_QWORD *)(v0 + 256);
      *(_QWORD *)(v0 + 88) = 1;
      *(_QWORD *)(v0 + 96) = v24;
      *(_QWORD *)(v0 + 104) = v23;
      swift_task_create();
      swift_release();
      sub_236375B48(v6);
      v3 += 40;
      v2 = v33 - 1;
    }
    while (v33 != 1);
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDCF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDC70);
  sub_23637A940();
  *(_QWORD *)(v0 + 264) = sub_236375B88();
  v25 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 272) = v25;
  *v25 = v0;
  v25[1] = sub_2363747CC;
  return sub_23637A8D4();
}

uint64_t sub_2363747CC()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    v2[36] = v0;
    v4 = v2[22];
    v3 = v2[23];
    v5 = v2[21];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    v2[35] = MEMORY[0x24BEE4B00];
  }
  return swift_task_switch();
}

uint64_t sub_236374868()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t result;
  int64_t v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  uint64_t v28;
  _BOOL8 v29;
  char v30;
  char v31;
  uint64_t *v32;
  _QWORD *v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  int64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  int64_t v43;

  v1 = (_QWORD *)v0;
  v2 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 280);
  if (v2)
  {
    v42 = (_QWORD *)(v0 + 120);
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v1[15] = v3;
    v39 = v2 + 64;
    v5 = -1;
    v6 = -1 << *(_BYTE *)(v2 + 32);
    if (-v6 < 64)
      v5 = ~(-1 << -(char)v6);
    v7 = v5 & *(_QWORD *)(v2 + 64);
    v40 = (unint64_t)(63 - v6) >> 6;
    v8 = (_QWORD *)v1[35];
    result = swift_bridgeObjectRetain();
    v10 = 0;
    v41 = v1;
    while (1)
    {
      v1[37] = v8;
      if (v7)
      {
        v12 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v43 = v10;
        v13 = v12 | (v10 << 6);
      }
      else
      {
        v14 = v10 + 1;
        if (__OFADD__(v10, 1))
          goto LABEL_39;
        if (v14 >= v40)
        {
LABEL_35:
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease_n();
          v38 = (_QWORD *)swift_task_alloc();
          v1[38] = v38;
          *v38 = v1;
          v38[1] = sub_236374CD4;
          return sub_23637A8D4();
        }
        v15 = *(_QWORD *)(v39 + 8 * v14);
        v16 = v10 + 1;
        if (!v15)
        {
          v16 = v10 + 2;
          if (v10 + 2 >= v40)
            goto LABEL_35;
          v15 = *(_QWORD *)(v39 + 8 * v16);
          if (!v15)
          {
            v16 = v10 + 3;
            if (v10 + 3 >= v40)
              goto LABEL_35;
            v15 = *(_QWORD *)(v39 + 8 * v16);
            if (!v15)
            {
              v16 = v10 + 4;
              if (v10 + 4 >= v40)
                goto LABEL_35;
              v15 = *(_QWORD *)(v39 + 8 * v16);
              if (!v15)
              {
                v17 = v10 + 5;
                if (v10 + 5 >= v40)
                  goto LABEL_35;
                v15 = *(_QWORD *)(v39 + 8 * v17);
                if (!v15)
                {
                  while (1)
                  {
                    v16 = v17 + 1;
                    if (__OFADD__(v17, 1))
                      goto LABEL_40;
                    if (v16 >= v40)
                      goto LABEL_35;
                    v15 = *(_QWORD *)(v39 + 8 * v16);
                    ++v17;
                    if (v15)
                      goto LABEL_24;
                  }
                }
                v16 = v10 + 5;
              }
            }
          }
        }
LABEL_24:
        v7 = (v15 - 1) & v15;
        v43 = v16;
        v13 = __clz(__rbit64(v15)) + (v16 << 6);
      }
      v18 = 16 * v13;
      v19 = v2;
      v20 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v18);
      v22 = *v20;
      v21 = v20[1];
      v23 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v18);
      v24 = *v23;
      v25 = v23[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v27 = sub_236370B50(v22, v21);
      v28 = v8[2];
      v29 = (v26 & 1) == 0;
      result = v28 + v29;
      if (__OFADD__(v28, v29))
        break;
      v30 = v26;
      if (v8[3] >= result)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          result = (uint64_t)sub_23637685C();
      }
      else
      {
        sub_236375EC0(result, isUniquelyReferenced_nonNull_native & 1);
        result = sub_236370B50(v22, v21);
        if ((v30 & 1) != (v31 & 1))
          return sub_23637AC1C();
        v27 = result;
      }
      v8 = (_QWORD *)*v42;
      if ((v30 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v11 = (_QWORD *)(v8[7] + 16 * v27);
        result = swift_bridgeObjectRelease();
        *v11 = v24;
        v11[1] = v25;
      }
      else
      {
        v8[(v27 >> 6) + 8] |= 1 << v27;
        v32 = (uint64_t *)(v8[6] + 16 * v27);
        *v32 = v22;
        v32[1] = v21;
        v33 = (_QWORD *)(v8[7] + 16 * v27);
        *v33 = v24;
        v33[1] = v25;
        v34 = v8[2];
        v35 = __OFADD__(v34, 1);
        v36 = v34 + 1;
        if (v35)
          goto LABEL_38;
        v8[2] = v36;
      }
      isUniquelyReferenced_nonNull_native = 1;
      v1 = v41;
      v2 = v19;
      v10 = v43;
    }
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
  }
  else
  {
    v37 = *(_QWORD **)(v0 + 128);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 176) + 8))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 168));
    swift_bridgeObjectRelease();
    *v37 = v3;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t sub_236374C6C()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236374CD4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    v2[36] = v0;
    v4 = v2[22];
    v3 = v2[23];
    v5 = v2[21];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    v2[35] = v2[37];
  }
  return swift_task_switch();
}

uint64_t type metadata accessor for CompositeHTTPHeadersProvider()
{
  uint64_t result;

  result = qword_2563DE4D8;
  if (!qword_2563DE4D8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_236374DA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7[26] = a6;
  v7[27] = a7;
  v7[24] = a4;
  v7[25] = a5;
  v7[23] = a1;
  sub_23637ACE8();
  v7[28] = swift_task_alloc();
  sub_23637ACD0();
  v7[29] = swift_task_alloc();
  sub_23637AD24();
  v7[30] = swift_task_alloc();
  v8 = sub_23637AD30();
  v7[31] = v8;
  v7[32] = *(_QWORD *)(v8 - 8);
  v7[33] = swift_task_alloc();
  v9 = sub_23637AAB4();
  v7[34] = v9;
  v7[35] = *(_QWORD *)(v9 - 8);
  v7[36] = swift_task_alloc();
  v10 = sub_23637A7E4();
  v7[37] = v10;
  v7[38] = *(_QWORD *)(v10 - 8);
  v7[39] = swift_task_alloc();
  v7[40] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_236374EC8()
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
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;

  if (qword_2563DDA98 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 320);
  v2 = *(_QWORD *)(v0 + 296);
  v3 = *(_QWORD *)(v0 + 304);
  v4 = *(_QWORD *)(v0 + 192);
  v5 = __swift_project_value_buffer(v2, (uint64_t)qword_2563DFDB8);
  *(_QWORD *)(v0 + 328) = v5;
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(_QWORD *)(v0 + 336) = v6;
  v6(v1, v5, v2);
  sub_2363632B0(v4, v0 + 16);
  v7 = sub_23637A7CC();
  v8 = sub_23637A988();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(_QWORD *)(v0 + 320);
  v11 = *(_QWORD *)(v0 + 296);
  v12 = *(_QWORD *)(v0 + 304);
  if (v9)
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v31 = v14;
    *(_DWORD *)v13 = 136315138;
    v28 = v12;
    v29 = v11;
    v16 = *(_QWORD *)(v0 + 40);
    v15 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v16);
    v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v16, v15);
    *(_QWORD *)(v0 + 176) = sub_23636CE4C(v17, v18, &v31);
    sub_23637A9C4();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    _os_log_impl(&dword_23635F000, v7, v8, "Computing headers using %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7F15E4](v14, -1, -1);
    MEMORY[0x23B7F15E4](v13, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v10, v29);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  }
  v20 = *(_QWORD *)(v0 + 280);
  v19 = *(_QWORD *)(v0 + 288);
  v21 = *(_QWORD *)(v0 + 272);
  v23 = *(_QWORD *)(v0 + 192);
  v22 = *(_QWORD *)(v0 + 200);
  *(_QWORD *)(v0 + 152) = 0;
  v24 = type metadata accessor for CompositeHTTPHeadersProvider();
  v30 = *(_OWORD *)(v0 + 208);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v19, v22 + *(int *)(v24 + 20), v21);
  v25 = swift_task_alloc();
  *(_QWORD *)(v0 + 344) = v25;
  *(_QWORD *)(v25 + 16) = v0 + 152;
  *(_QWORD *)(v25 + 24) = v23;
  *(_OWORD *)(v25 + 32) = v30;
  v26 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 352) = v26;
  sub_23637026C(&qword_2563DDDD0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  *v26 = v0;
  v26[1] = sub_236375190;
  return sub_23637AC34();
}

uint64_t sub_236375190()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *v1;
  *(_QWORD *)(*v1 + 360) = v0;
  swift_task_dealloc();
  v4 = *(_QWORD *)(v2 + 280);
  v3 = *(_QWORD *)(v2 + 288);
  v5 = *(_QWORD *)(v2 + 272);
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 8))(*(_QWORD *)(v2 + 288), *(_QWORD *)(v2 + 272));
    swift_task_dealloc();
  }
  else
  {
    *(_OWORD *)(v2 + 368) = *(_OWORD *)(v2 + 120);
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  return swift_task_switch();
}

uint64_t sub_236375248()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;

  v1 = *(_QWORD *)(v0 + 360);
  v2 = *(_QWORD **)(v0 + 192);
  swift_bridgeObjectRelease();
  v4 = v2[3];
  v3 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v4);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v4, v3);
  v7 = v6;
  sub_236376E10();
  swift_allocError();
  *v8 = v5;
  v8[1] = v7;
  v8[2] = v1;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236375358()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (_QWORD *)v0[24];
  v2 = v1[3];
  v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  v0[48] = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  v0[49] = v4;
  return swift_task_switch();
}

uint64_t sub_2363753C0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  double v3;
  uint64_t v4;
  double v6[5];

  v1 = *(_QWORD *)(v0 + 384);
  v2 = *(_QWORD *)(v0 + 392);
  v3 = (double)sub_23637AD48();
  sub_23637AD48();
  *(_QWORD *)&v6[3] = MEMORY[0x24BEE13C8];
  *(_QWORD *)&v6[4] = &off_2507B0250;
  v6[0] = (double)v4 * 1.0e-18 + v3;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_2363661DC((uint64_t)v6, v1, v2);
  swift_endAccess();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_2363754B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t result;
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
  void (*v27)(uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;

  v29 = (_QWORD *)(v0 + 152);
  v25 = *(_QWORD *)(v0 + 328);
  v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 336);
  v21 = *(_QWORD *)(v0 + 312);
  v23 = *(_QWORD *)(v0 + 296);
  v1 = *(_QWORD *)(v0 + 264);
  v19 = *(_QWORD *)(v0 + 256);
  v2 = *(_QWORD *)(v0 + 248);
  v20 = *(_QWORD *)(v0 + 192);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDDD8);
  sub_23637AD0C();
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23637BAE0;
  sub_23637AD00();
  sub_23637ACF4();
  sub_23636E754(v3);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_23637AD18();
  sub_23637ACC4();
  sub_23637ACDC();
  sub_23637ACB8();
  sub_23637026C(&qword_2563DDDE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDD0AF0], MEMORY[0x24BDD0AE8]);
  sub_23637AD3C();
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v1, v2);
  v4 = *(_QWORD *)(v0 + 136);
  v5 = *(_QWORD *)(v0 + 144);
  v27(v21, v25, v23);
  v6 = (_QWORD *)(v0 + 56);
  sub_2363632B0(v20, v0 + 56);
  swift_bridgeObjectRetain();
  v7 = sub_23637A7CC();
  v8 = sub_23637A988();
  if (os_log_type_enabled(v7, v8))
  {
    v24 = *(_QWORD *)(v0 + 304);
    v26 = *(_QWORD *)(v0 + 296);
    v28 = *(_QWORD *)(v0 + 312);
    v9 = swift_slowAlloc();
    v10 = swift_slowAlloc();
    v30 = v10;
    *(_DWORD *)v9 = 136315394;
    v22 = v4;
    v11 = *(_QWORD *)(v0 + 80);
    v12 = *(_QWORD *)(v0 + 88);
    __swift_project_boxed_opaque_existential_1(v6, v11);
    v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
    *(_QWORD *)(v0 + 160) = sub_23636CE4C(v13, v14, &v30);
    sub_23637A9C4();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
    *(_WORD *)(v9 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 168) = sub_23636CE4C(v22, v5, &v30);
    sub_23637A9C4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23635F000, v7, v8, "Computed headers using %s in %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7F15E4](v10, -1, -1);
    MEMORY[0x23B7F15E4](v9, -1, -1);

    result = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 8))(v28, v26);
  }
  else
  {
    v17 = *(_QWORD *)(v0 + 304);
    v16 = *(_QWORD *)(v0 + 312);
    v18 = *(_QWORD *)(v0 + 296);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
    swift_bridgeObjectRelease_n();

    result = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  }
  if (*v29)
  {
    **(_QWORD **)(v0 + 184) = *v29;
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
    __break(1u);
  }
  return result;
}

uint64_t sub_2363758A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CompositeHTTPHeadersProvider();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2363758E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v1 = type metadata accessor for CompositeHTTPHeadersProvider();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_23637A664();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  swift_bridgeObjectRelease();
  v8 = v0 + v3 + *(int *)(v1 + 20);
  v9 = sub_23637AAB4();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2363759E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CompositeHTTPHeadersProvider();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_236375A24(uint64_t a1)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  v4 = *(_QWORD *)(type metadata accessor for CompositeHTTPHeadersProvider() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = *(_QWORD *)(sub_23637A664() - 8);
  v8 = (v5 + v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v1 + 16);
  v10 = *(_QWORD *)(v1 + 24);
  v11 = v1 + 32;
  v12 = v1 + v5;
  v13 = v1 + v8;
  v14 = *(_QWORD *)(v1 + ((*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFF8));
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v15;
  *v15 = v2;
  v15[1] = sub_23636AFD0;
  return sub_236374DA0(a1, v9, v10, v11, v12, v13, v14);
}

uint64_t sub_236375B00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDE60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_236375B48(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDE60);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_236375B88()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2563DE458;
  if (!qword_2563DE458)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563DE440);
    result = MEMORY[0x23B7F153C](MEMORY[0x24BEE6BD8], v1);
    atomic_store(result, &qword_2563DE458);
  }
  return result;
}

uint64_t sub_236375BD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t sub_236375BF0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, _QWORD, uint64_t, uint64_t);

  v1 = (_QWORD *)v0[3];
  v2 = v1[3];
  v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  v6 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(**(int **)(v3 + 16) + *(_QWORD *)(v3 + 16));
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_236375C70;
  return v6(v0[4], v0[5], v2, v3);
}

uint64_t sub_236375C70(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v5 + 8))();
  *(_QWORD *)(v4 + 56) = a1;
  return swift_task_switch();
}

uint64_t sub_236375CEC()
{
  uint64_t v0;

  **(_QWORD **)(v0 + 16) = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_236375D2C()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_236375D48(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return swift_task_switch();
}

uint64_t sub_236375D64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDCF0);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  v3 = *(_OWORD *)(v0 + 24);
  *(_QWORD *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v3;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v4;
  *v4 = v0;
  v4[1] = sub_236375E14;
  return sub_23637ABA4();
}

uint64_t sub_236375E14()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236375E80()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_236375E8C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236375EC0(uint64_t a1, char a2)
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
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
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
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDFE0);
  v42 = a2;
  v6 = sub_23637AB68();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v39 = v2;
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v31);
    v36 = *v35;
    v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_23637AC7C();
    sub_23637A874();
    result = sub_23637AC94();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v36;
    v20[1] = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2363761E4(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDC60);
  v38 = a2;
  v6 = sub_23637AB68();
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
    sub_23637AC7C();
    sub_23637A874();
    result = sub_23637AC94();
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

uint64_t sub_2363764F0(uint64_t a1, char a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  __int128 *v22;
  uint64_t v23;
  _QWORD *v24;
  __int128 v25[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDFE8);
  v6 = (_QWORD *)sub_23637AB68();
  if (*(_QWORD *)(v5 + 16))
  {
    v24 = v3;
    v7 = 1 << *(_BYTE *)(v5 + 32);
    v8 = (_QWORD *)(v5 + 64);
    v9 = -1;
    if (v7 < 64)
      v9 = ~(-1 << v7);
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v11 = (unint64_t)(v7 + 63) >> 6;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v14 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v15 = v14 | (v13 << 6);
      }
      else
      {
        v16 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
          __break(1u);
LABEL_32:
          __break(1u);
          return result;
        }
        if (v16 >= v11)
          goto LABEL_23;
        v17 = v8[v16];
        ++v13;
        if (!v17)
        {
          v13 = v16 + 1;
          if (v16 + 1 >= v11)
            goto LABEL_23;
          v17 = v8[v13];
          if (!v17)
          {
            v18 = v16 + 2;
            if (v18 >= v11)
            {
LABEL_23:
              swift_release();
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v24;
                goto LABEL_30;
              }
              v23 = 1 << *(_BYTE *)(v5 + 32);
              if (v23 >= 64)
                bzero((void *)(v5 + 64), ((unint64_t)(v23 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v8 = -1 << v23;
              v3 = v24;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v17 = v8[v18];
            if (!v17)
            {
              while (1)
              {
                v13 = v18 + 1;
                if (__OFADD__(v18, 1))
                  goto LABEL_32;
                if (v13 >= v11)
                  goto LABEL_23;
                v17 = v8[v13];
                ++v18;
                if (v17)
                  goto LABEL_20;
              }
            }
            v13 = v18;
          }
        }
LABEL_20:
        v10 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v13 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      v22 = (__int128 *)(*(_QWORD *)(v5 + 56) + 40 * v15);
      if ((a2 & 1) != 0)
      {
        sub_23636F540(v22, (uint64_t)v25);
      }
      else
      {
        sub_2363632B0((uint64_t)v22, (uint64_t)v25);
        sub_2363632F4(v20, v21);
      }
      result = sub_23637670C(v20, v21, v25, v6);
    }
  }
  result = swift_release();
LABEL_30:
  *v3 = v6;
  return result;
}

uint64_t sub_23637670C(uint64_t a1, uint64_t a2, __int128 *a3, _QWORD *a4)
{
  unint64_t v8;
  _QWORD *v9;
  uint64_t result;

  sub_23637AC7C();
  switch(a2)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      sub_23637AC88();
      break;
    default:
      sub_23637AC88();
      sub_23637A874();
      break;
  }
  sub_23637AC94();
  v8 = sub_23637A9F4();
  *(_QWORD *)((char *)a4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v8;
  v9 = (_QWORD *)(a4[6] + 16 * v8);
  *v9 = a1;
  v9[1] = a2;
  result = sub_23636F540(a3, a4[7] + 40 * v8);
  ++a4[2];
  return result;
}

void *sub_23637685C()
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
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDFE0);
  v2 = *v0;
  v3 = sub_23637AB5C();
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
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_236376A14()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDC60);
  v2 = *v0;
  v3 = sub_23637AB5C();
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

void *sub_236376BC4()
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
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  __int128 v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDFE8);
  v2 = *v0;
  v3 = sub_23637AB5C();
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
    v18 = *v17;
    v19 = v17[1];
    v20 = 40 * v15;
    sub_2363632B0(*(_QWORD *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    v21 = (uint64_t *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v18;
    v21[1] = v19;
    sub_23636F540(v26, *(_QWORD *)(v4 + 56) + v20);
    result = (void *)sub_2363632F4(v18, v19);
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

uint64_t sub_236376DB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  __int128 v4;

  v2 = swift_task_alloc();
  v3 = *(_OWORD *)(v0 + 16);
  v4 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_2363702AC;
  *(_OWORD *)(v2 + 16) = v3;
  *(_OWORD *)(v2 + 32) = v4;
  return swift_task_switch();
}

unint64_t sub_236376E10()
{
  unint64_t result;

  result = qword_2563DE470[0];
  if (!qword_2563DE470[0])
  {
    result = MEMORY[0x23B7F153C](&unk_23637B88C, &type metadata for HTTPHeadersProviderError);
    atomic_store(result, qword_2563DE470);
  }
  return result;
}

uint64_t *sub_236376E54(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_23637AAB4();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_236376EEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_23637AAB4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_236376F34(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_23637AAB4();
  v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
  swift_bridgeObjectRetain();
  v8(v5, v6, v7);
  return a1;
}

_QWORD *sub_236376FA4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23637AAB4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_QWORD *sub_236377018(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_23637AAB4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_236377074(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23637AAB4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_2363770E0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2363770EC(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_23637AAB4();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_236377168()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_236377174(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_23637AAB4();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_2363771E8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23637AAB4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for BAAHeadersProvider()
{
  return &type metadata for BAAHeadersProvider;
}

void sub_236377270()
{
  strcpy((char *)&qword_2563DE510, "X-Apple-Baa-S");
  *(_WORD *)&algn_2563DE518[6] = -4864;
}

void sub_2363772A0()
{
  qword_2563DE520 = 0x2D656C7070412D58;
  *(_QWORD *)algn_2563DE528 = 0xEB00000000616142;
}

uint64_t sub_2363772CC()
{
  id v0;
  id v1;
  uint64_t result;

  sub_23637AA18();
  swift_bridgeObjectRelease();
  v0 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v1 = objc_msgSend(v0, sel_processName);

  sub_23637A844();
  sub_23637A880();
  result = swift_bridgeObjectRelease();
  qword_2563DE530 = 0xD00000000000001BLL;
  *(_QWORD *)algn_2563DE538 = 0x800000023637CE30;
  return result;
}

uint64_t sub_2363773A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 344) = a1;
  *(_QWORD *)(v2 + 352) = a2;
  return swift_task_switch();
}

uint64_t sub_2363773C0()
{
  _QWORD *v0;
  uint64_t inited;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SecAccessControlRef v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  _QWORD *v21;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DE550);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23637C130;
  *(_QWORD *)(inited + 32) = sub_23637A844();
  v2 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 40) = v3;
  *(_QWORD *)(inited + 48) = 0xD00000000000002ALL;
  *(_QWORD *)(inited + 56) = 0x800000023637CD80;
  *(_QWORD *)(inited + 80) = sub_23637A844();
  *(_QWORD *)(inited + 88) = v4;
  if (qword_2563DDAB8 != -1)
    swift_once();
  v5 = qword_2563DE530;
  v6 = *(_QWORD *)algn_2563DE538;
  *(_QWORD *)(inited + 120) = v2;
  *(_QWORD *)(inited + 96) = v5;
  *(_QWORD *)(inited + 104) = v6;
  *(_QWORD *)(inited + 128) = sub_23637A844();
  v7 = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 168) = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 136) = v8;
  *(_QWORD *)(inited + 144) = 60;
  *(_QWORD *)(inited + 176) = sub_23637A844();
  *(_QWORD *)(inited + 216) = v7;
  *(_QWORD *)(inited + 184) = v9;
  *(_QWORD *)(inited + 192) = 262800;
  *(_QWORD *)(inited + 224) = sub_23637A844();
  *(_QWORD *)(inited + 232) = v10;
  swift_bridgeObjectRetain();
  v11 = sub_236378888();
  v13 = v0[43];
  v12 = v0[44];
  type metadata accessor for SecAccessControl(0);
  *(_QWORD *)(inited + 264) = v14;
  *(_QWORD *)(inited + 240) = v11;
  *(_QWORD *)(inited + 272) = sub_23637A844();
  *(_QWORD *)(inited + 280) = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDC88);
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_23637BAE0;
  *(_QWORD *)(v16 + 32) = sub_23637A844();
  *(_QWORD *)(v16 + 40) = v17;
  *(_QWORD *)(v16 + 48) = sub_23637A844();
  *(_QWORD *)(v16 + 56) = v18;
  *(_QWORD *)(inited + 312) = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DE558);
  *(_QWORD *)(inited + 288) = v16;
  v19 = sub_2363702B4(inited);
  v0[45] = v19;
  v20 = (_QWORD *)swift_task_alloc();
  v0[46] = v20;
  v20[2] = v19;
  v20[3] = v13;
  v20[4] = v12;
  v21 = (_QWORD *)swift_task_alloc();
  v0[47] = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDCF0);
  *v21 = v0;
  v21[1] = sub_2363776D4;
  return sub_23637AC04();
}

uint64_t sub_2363776D4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 384) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_236377748()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 336));
}

uint64_t sub_236377758()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_236377794(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD aBlock[6];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DE560);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8, v11);
  sub_236377920(a2);
  v12 = (void *)sub_23637A7F0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  v13 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a3;
  *(_QWORD *)(v14 + 24) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v14 + v13, (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  aBlock[4] = sub_236378A40;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23637805C;
  aBlock[3] = &block_descriptor_1;
  v15 = _Block_copy(aBlock);
  sub_23636F6B4(a3, a4);
  swift_release();
  DeviceIdentityIssueClientCertificateWithCompletion();
  _Block_release(v15);

}

uint64_t sub_236377920(uint64_t a1)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DE580);
    v2 = sub_23637AB74();
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
    sub_23636F6F8(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_236371210(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_236371210(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_236371210(v36, v37);
    sub_236371210(v37, &v33);
    result = sub_23637AA00();
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
    result = (uint64_t)sub_236371210(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_236378F70();
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

uint64_t sub_236377CE4(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t inited;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  id v26;

  if (!a1 || !a2)
    goto LABEL_15;
  v9 = a1;
  v10 = sub_236377F64(a2);
  if (!v10)
  {

LABEL_15:
    sub_236378AB4();
    swift_allocError();
    *(_QWORD *)v25 = a3;
    *(_BYTE *)(v25 + 8) = 2;
    v26 = a3;
    swift_willThrow();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DE560);
    return sub_23637A8BC();
  }
  v11 = v10;
  if (!(v10 >> 62))
  {
    if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_6;
    goto LABEL_14;
  }
  if (!sub_23637AB50())
  {
LABEL_14:

    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
LABEL_6:
  v12 = sub_236378AF8(a4, a5, (__SecKey *)v9);
  v14 = v13;
  v15 = sub_236378C2C(v11);
  v17 = v16;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDCB0);
  inited = swift_initStackObject();
  v19 = (_QWORD *)inited;
  *(_OWORD *)(inited + 16) = xmmword_23637BAE0;
  if (qword_2563DDAA8 != -1)
    swift_once();
  v20 = *(_QWORD *)algn_2563DE518;
  v19[4] = qword_2563DE510;
  v19[5] = v20;
  swift_bridgeObjectRetain();
  v19[6] = sub_23637A73C();
  v19[7] = v21;
  if (qword_2563DDAB0 != -1)
    swift_once();
  v22 = *(_QWORD *)algn_2563DE528;
  v19[8] = qword_2563DE520;
  v19[9] = v22;
  swift_bridgeObjectRetain();
  v19[10] = sub_23637A73C();
  v19[11] = v23;
  sub_2363703E8((uint64_t)v19);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DE560);
  sub_23637A8C8();

  sub_236364934(v15, v17);
  sub_236364934(v12, v14);
  return swift_bridgeObjectRelease();
}

uint64_t sub_236377F64(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  _BYTE v5[32];
  uint64_t v6;

  v6 = MEMORY[0x24BEE4AF8];
  v2 = *(_QWORD *)(a1 + 16);
  sub_23637AA60();
  if (!v2)
    return v6;
  for (i = a1 + 32; ; i += 32)
  {
    sub_23636F6F8(i, (uint64_t)v5);
    type metadata accessor for SecCertificate(0);
    if (!swift_dynamicCast())
      break;
    sub_23637AA48();
    sub_23637AA6C();
    sub_23637AA78();
    sub_23637AA54();
    if (!--v2)
      return v6;
  }
  swift_release();

  return 0;
}

uint64_t sub_23637805C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (*v6)(void *, uint64_t, void *);
  uint64_t v7;
  id v8;
  id v9;

  v6 = *(void (**)(void *, uint64_t, void *))(a1 + 32);
  if (a3)
    v7 = sub_23637A898();
  else
    v7 = 0;
  swift_retain();
  v8 = a2;
  v9 = a4;
  v6(a2, v7, a4);
  swift_release();

  return swift_bridgeObjectRelease();
}

void *sub_2363780F8()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = (void *)sub_23637A730();
  v5[0] = 0;
  v1 = objc_msgSend(v0, sel_compressedDataUsingAlgorithm_error_, 3, v5);

  v2 = v5[0];
  if (v1)
  {
    v3 = (void *)sub_23637A748();

  }
  else
  {
    v3 = v2;
    sub_23637A6DC();

    swift_willThrow();
  }
  return v3;
}

unint64_t sub_2363781C8(id a1, char a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  unsigned __int8 v10;
  unint64_t v12;

  if (a2)
  {
    if (a2 == 1)
    {
      v3 = a1;
      sub_23637AA18();
      swift_bridgeObjectRelease();
      v12 = 0xD00000000000001CLL;
      if (a1)
      {
        swift_getErrorValue();
        v4 = a1;
        sub_23637AC40();
        sub_236378FF0(a1, 1u);
      }
      sub_23637A880();
      swift_bridgeObjectRelease();
      v9 = a1;
      v10 = 1;
    }
    else
    {
      v7 = a1;
      sub_23637AA18();
      swift_bridgeObjectRelease();
      v12 = 0xD000000000000024;
      if (a1)
      {
        swift_getErrorValue();
        v8 = a1;
        sub_23637AC40();
        sub_236378FF0(a1, 2u);
      }
      sub_23637A880();
      swift_bridgeObjectRelease();
      v9 = a1;
      v10 = 2;
    }
  }
  else
  {
    v5 = a1;
    sub_23637AA18();
    swift_bridgeObjectRelease();
    v12 = 0xD000000000000021;
    if (a1)
    {
      swift_getErrorValue();
      v6 = a1;
      sub_23637AC40();
      sub_236378FF0(a1, 0);
    }
    sub_23637A880();
    swift_bridgeObjectRelease();
    v9 = a1;
    v10 = 0;
  }
  sub_236378FF0(v9, v10);
  return v12;
}

uint64_t sub_236378444(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DE588);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23637913C();
  sub_23637ACAC();
  v10[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DE558);
  sub_2363792D8(&qword_2563DE598, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
  sub_23637ABD4();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

unint64_t sub_236378560()
{
  uint64_t v0;

  return sub_2363781C8(*(id *)v0, *(_BYTE *)(v0 + 8));
}

unint64_t sub_23637856C()
{
  return 0xD000000000000012;
}

uint64_t sub_236378588(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_2363785A0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;

  v1 = sub_23637A640();
  *(_QWORD *)(v0 + 24) = v1;
  *(_QWORD *)(v0 + 32) = v2;
  if (v2 >> 60 == 15)
  {
    v3 = sub_2363703E8(MEMORY[0x24BEE4AF8]);
    return (*(uint64_t (**)(unint64_t))(v0 + 8))(v3);
  }
  else
  {
    v5 = v1;
    v6 = v2;
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 40) = v7;
    *v7 = v0;
    v7[1] = sub_236378640;
    v7[43] = v5;
    v7[44] = v6;
    return swift_task_switch();
  }
}

uint64_t sub_236378640(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 48) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 56) = a1;
  return swift_task_switch();
}

uint64_t sub_2363786B4()
{
  uint64_t v0;

  sub_236364920(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 56));
}

uint64_t sub_2363786EC()
{
  uint64_t v0;

  sub_236364920(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23637872C@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_23637AB98();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_23637877C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_236379180();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2363787A4@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_23637AB98();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_2363787F8()
{
  sub_23637913C();
  return sub_23637AD54();
}

uint64_t sub_236378820()
{
  sub_23637913C();
  return sub_23637AD60();
}

_QWORD *sub_236378848@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_236379194(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_236378870(_QWORD *a1)
{
  uint64_t *v1;

  return sub_236378444(a1, *v1);
}

SecAccessControlRef sub_236378888()
{
  SecAccessControlRef v0;
  CFErrorRef v1;
  uint64_t v2;
  CFErrorRef *v3;
  uint64_t v4;
  CFErrorRef v6[2];

  v6[1] = *(CFErrorRef *)MEMORY[0x24BDAC8D0];
  v6[0] = 0;
  v0 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x24BDE8F70], 0x40000000uLL, v6);
  if (!v0)
  {
    v1 = v6[0];
    if (v6[0])
    {
      type metadata accessor for CFError(0);
      sub_236378F28();
      v2 = swift_allocError();
      *v3 = v1;
    }
    else
    {
      v2 = 0;
    }
    sub_236378AB4();
    swift_allocError();
    *(_QWORD *)v4 = v2;
    *(_BYTE *)(v4 + 8) = 0;
    swift_willThrow();
  }
  return v0;
}

uint64_t sub_23637897C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDFD8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2363789BC(uint64_t a1)
{
  uint64_t v1;

  sub_236377794(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_2363789C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DE560);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  sub_236364934(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_236378A40(void *a1, uint64_t a2, void *a3)
{
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DE560);
  return sub_236377CE4(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

unint64_t sub_236378AB4()
{
  unint64_t result;

  result = qword_2563DE568;
  if (!qword_2563DE568)
  {
    result = MEMORY[0x23B7F153C](&unk_23637C208, &type metadata for BAAHeadersProvider.BAASigningError);
    atomic_store(result, (unint64_t *)&qword_2563DE568);
  }
  return result;
}

uint64_t sub_236378AF8(uint64_t a1, uint64_t a2, __SecKey *a3)
{
  const __CFString *v4;
  const __CFData *v5;
  CFDataRef Signature;
  const __CFData *v7;
  uint64_t v8;
  CFErrorRef v9;
  CFErrorRef *v10;
  uint64_t v11;
  CFErrorRef v13[2];

  v13[1] = *(CFErrorRef *)MEMORY[0x24BDAC8D0];
  v13[0] = 0;
  v4 = (const __CFString *)*MEMORY[0x24BDE92D0];
  v5 = (const __CFData *)sub_23637A730();
  Signature = SecKeyCreateSignature(a3, v4, v5, v13);

  if (Signature)
  {
    v7 = Signature;
    v8 = sub_23637A748();

  }
  else
  {
    v9 = v13[0];
    if (v13[0])
    {
      type metadata accessor for CFError(0);
      sub_236378F28();
      v8 = swift_allocError();
      *v10 = v9;
    }
    else
    {
      v8 = 0;
    }
    sub_236378AB4();
    swift_allocError();
    *(_QWORD *)v11 = v8;
    *(_BYTE *)(v11 + 8) = 1;
    swift_willThrow();
  }
  return v8;
}

uint64_t sub_236378C2C(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  __SecCertificate *v7;
  CFDataRef v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id *v18;
  __SecCertificate *v19;
  CFDataRef v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;

  v2 = v1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = sub_23637AB50();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v4)
  {
    v35 = MEMORY[0x24BEE4AF8];
    result = sub_236362830(0, v4 & ~(v4 >> 63), 0);
    if (v4 < 0)
    {
      __break(1u);
      return result;
    }
    if ((a1 & 0xC000000000000001) != 0)
    {
      v6 = 0;
      do
      {
        v7 = (__SecCertificate *)MEMORY[0x23B7F0E04](v6, a1);
        v8 = SecCertificateCopyData(v7);
        v9 = sub_23637A748();
        v11 = v10;

        v12 = sub_23637A73C();
        v14 = v13;
        sub_236364934(v9, v11);
        swift_unknownObjectRelease();
        v16 = *(_QWORD *)(v35 + 16);
        v15 = *(_QWORD *)(v35 + 24);
        if (v16 >= v15 >> 1)
          sub_236362830(v15 > 1, v16 + 1, 1);
        ++v6;
        *(_QWORD *)(v35 + 16) = v16 + 1;
        v17 = v35 + 16 * v16;
        *(_QWORD *)(v17 + 32) = v12;
        *(_QWORD *)(v17 + 40) = v14;
      }
      while (v4 != v6);
    }
    else
    {
      v18 = (id *)(a1 + 32);
      do
      {
        v19 = (__SecCertificate *)*v18;
        v20 = SecCertificateCopyData(v19);
        v21 = sub_23637A748();
        v23 = v22;

        v24 = sub_23637A73C();
        v26 = v25;
        sub_236364934(v21, v23);

        v28 = *(_QWORD *)(v35 + 16);
        v27 = *(_QWORD *)(v35 + 24);
        if (v28 >= v27 >> 1)
          sub_236362830(v27 > 1, v28 + 1, 1);
        *(_QWORD *)(v35 + 16) = v28 + 1;
        v29 = v35 + 16 * v28;
        *(_QWORD *)(v29 + 32) = v24;
        *(_QWORD *)(v29 + 40) = v26;
        ++v18;
        --v4;
      }
      while (v4);
    }
    v2 = v1;
  }
  sub_23637A6AC();
  swift_allocObject();
  v30 = sub_23637A6A0();
  sub_236378EE4();
  v31 = sub_23637A694();
  if (v2)
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    v33 = v31;
    v34 = v32;
    swift_release();
    swift_bridgeObjectRelease();
    v30 = (uint64_t)sub_2363780F8();
    sub_236364934(v33, v34);
  }
  return v30;
}

unint64_t sub_236378EE4()
{
  unint64_t result;

  result = qword_2563DE570;
  if (!qword_2563DE570)
  {
    result = MEMORY[0x23B7F153C](&unk_23637C1E0, &type metadata for Attestation);
    atomic_store(result, (unint64_t *)&qword_2563DE570);
  }
  return result;
}

unint64_t sub_236378F28()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2563DE578;
  if (!qword_2563DE578)
  {
    type metadata accessor for CFError(255);
    result = MEMORY[0x23B7F153C](MEMORY[0x24BDCFD90], v1);
    atomic_store(result, (unint64_t *)&qword_2563DE578);
  }
  return result;
}

uint64_t sub_236378F70()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for Attestation()
{
  return &type metadata for Attestation;
}

uint64_t initializeBufferWithCopyOfBuffer for BAAHeadersProvider.BAASigningError(uint64_t a1, uint64_t a2)
{
  id v3;
  unsigned __int8 v4;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_236378FCC(*(id *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

id sub_236378FCC(id result, unsigned __int8 a2)
{
  if (a2 <= 2u)
    return result;
  return result;
}

void destroy for BAAHeadersProvider.BAASigningError(uint64_t a1)
{
  sub_236378FF0(*(id *)a1, *(_BYTE *)(a1 + 8));
}

void sub_236378FF0(id a1, unsigned __int8 a2)
{
  if (a2 <= 2u)

}

uint64_t assignWithCopy for BAAHeadersProvider.BAASigningError(uint64_t a1, uint64_t a2)
{
  id v3;
  unsigned __int8 v4;
  void *v5;
  unsigned __int8 v6;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_236378FCC(*(id *)a2, v4);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v3;
  v6 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v4;
  sub_236378FF0(v5, v6);
  return a1;
}

uint64_t assignWithTake for BAAHeadersProvider.BAASigningError(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  unsigned __int8 v5;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v3;
  sub_236378FF0(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for BAAHeadersProvider.BAASigningError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BAAHeadersProvider.BAASigningError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_23637911C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_236379124(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for BAAHeadersProvider.BAASigningError()
{
  return &type metadata for BAAHeadersProvider.BAASigningError;
}

unint64_t sub_23637913C()
{
  unint64_t result;

  result = qword_2563DE590;
  if (!qword_2563DE590)
  {
    result = MEMORY[0x23B7F153C](&unk_23637C344, &type metadata for Attestation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563DE590);
  }
  return result;
}

uint64_t sub_236379180()
{
  return 0x7374726563;
}

_QWORD *sub_236379194(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  _QWORD v10[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DE5A0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23637913C();
  sub_23637ACA0();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DE558);
    sub_2363792D8(&qword_2563DE5A8, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    sub_23637ABBC();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    v8 = (_QWORD *)v10[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v8;
}

uint64_t sub_2363792D8(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563DE558);
    v8 = a2;
    result = MEMORY[0x23B7F153C](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for Attestation.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_236379378 + 4 * byte_23637C140[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_236379398 + 4 * byte_23637C145[v4]))();
}

_BYTE *sub_236379378(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_236379398(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2363793A0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2363793A8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2363793B0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2363793B8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for Attestation.CodingKeys()
{
  return &type metadata for Attestation.CodingKeys;
}

unint64_t sub_2363793D8()
{
  unint64_t result;

  result = qword_2563DE5B0;
  if (!qword_2563DE5B0)
  {
    result = MEMORY[0x23B7F153C](&unk_23637C31C, &type metadata for Attestation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563DE5B0);
  }
  return result;
}

unint64_t sub_236379420()
{
  unint64_t result;

  result = qword_2563DE5B8;
  if (!qword_2563DE5B8)
  {
    result = MEMORY[0x23B7F153C](&unk_23637C254, &type metadata for Attestation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563DE5B8);
  }
  return result;
}

unint64_t sub_236379468()
{
  unint64_t result;

  result = qword_2563DE5C0;
  if (!qword_2563DE5C0)
  {
    result = MEMORY[0x23B7F153C](&unk_23637C27C, &type metadata for Attestation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563DE5C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for UserAgentHeadersProvider()
{
  return &type metadata for UserAgentHeadersProvider;
}

unint64_t sub_2363794C0()
{
  return 0xD000000000000018;
}

uint64_t sub_2363794DC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v3 = (uint64_t (__cdecl *)())((char *)&dword_2563DE5D0 + dword_2563DE5D0);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_236362118;
  return v3();
}

uint64_t sub_23637953C()
{
  return swift_task_switch();
}

uint64_t sub_236379550()
{
  _QWORD *v0;

  v0[15] = objc_opt_self();
  v0[16] = sub_23637A8EC();
  v0[17] = sub_23637A8E0();
  sub_23637A8B0();
  return swift_task_switch();
}

uint64_t sub_2363795CC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 120);
  swift_release();
  *(_QWORD *)(v0 + 144) = objc_msgSend(v1, sel_currentDevice);
  return swift_task_switch();
}

uint64_t sub_236379628()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 152) = sub_23637A8E0();
  sub_23637A8B0();
  return swift_task_switch();
}

uint64_t sub_236379688()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 144);
  swift_release();
  *(_QWORD *)(v0 + 160) = objc_msgSend(v1, sel_systemVersion);

  return swift_task_switch();
}

void sub_2363796E4()
{
  id v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;

  v2 = (void *)v1[20];
  v1[12] = sub_23637A844();
  v1[13] = v3;

  v4 = _CFCopySystemVersionDictionary();
  if (!v4)
  {
    __break(1u);
    goto LABEL_11;
  }
  v5 = (void *)v4;
  sub_236363424();
  sub_236379AE4();
  v6 = sub_23637A7FC();

  v7 = (void *)*MEMORY[0x24BDBD1F0];
  if (!*MEMORY[0x24BDBD1F0])
  {
LABEL_11:
    __break(1u);
LABEL_12:

    goto LABEL_13;
  }
  if ((v6 & 0xC000000000000001) != 0)
  {
    v8 = v7;
    v9 = sub_23637AB2C();
    swift_bridgeObjectRelease();

    if (!v9)
      goto LABEL_14;
LABEL_9:
    v1[14] = v9;
    swift_dynamicCast();
    v12 = v1[11];
    v1[21] = v1[10];
    v1[22] = v12;
    v1[23] = sub_23637A8E0();
    sub_23637A8B0();
    swift_task_switch();
    return;
  }
  if (*(_QWORD *)(v6 + 16))
  {
    v0 = v7;
    v10 = sub_236370BE4((uint64_t)v0);
    if ((v11 & 1) != 0)
    {
      v9 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v10);
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();

      goto LABEL_9;
    }
    goto LABEL_12;
  }
LABEL_13:
  swift_bridgeObjectRelease();
LABEL_14:
  __break(1u);
}

uint64_t sub_236379860()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 120);
  swift_release();
  *(_QWORD *)(v0 + 192) = objc_msgSend(v1, sel_currentDevice);
  return swift_task_switch();
}

uint64_t sub_2363798BC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 200) = sub_23637A8E0();
  sub_23637A8B0();
  return swift_task_switch();
}

uint64_t sub_23637991C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 192);
  swift_release();
  *(_QWORD *)(v0 + 208) = objc_msgSend(v1, sel_model);

  return swift_task_switch();
}

uint64_t sub_236379978()
{
  uint64_t v0;
  void *v1;
  uint64_t inited;
  unint64_t v3;

  v1 = *(void **)(v0 + 208);
  sub_23637A844();

  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDCB0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23637B860;
  *(_QWORD *)(inited + 32) = 0x6567412D72657355;
  *(_QWORD *)(inited + 40) = 0xEA0000000000746ELL;
  sub_23637AA18();
  swift_bridgeObjectRelease();
  sub_23637A880();
  swift_bridgeObjectRelease();
  sub_23637A880();
  sub_23637A880();
  swift_bridgeObjectRelease();
  sub_23637A880();
  sub_23637A880();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 48) = 0x73676E6974746553;
  *(_QWORD *)(inited + 56) = 0xEB000000002F312FLL;
  v3 = sub_2363703E8(inited);
  return (*(uint64_t (**)(unint64_t))(v0 + 8))(v3);
}

unint64_t sub_236379AE4()
{
  unint64_t result;
  unint64_t v1;

  result = qword_2563DE5D8[0];
  if (!qword_2563DE5D8[0])
  {
    v1 = sub_236363424();
    result = MEMORY[0x23B7F153C](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, qword_2563DE5D8);
  }
  return result;
}

uint64_t sub_236379B2C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_236379B34()
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

uint64_t *sub_236379BAC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    *(_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_236379C60(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
  return swift_bridgeObjectRelease();
}

uint64_t sub_236379CA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_236379D00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_236379D6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_236379DC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_236379E2C(uint64_t a1, unsigned int a2, uint64_t a3)
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
      v12 = *(_QWORD *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
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
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
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
    return ((uint64_t (*)(void))((char *)&loc_236379EA8 + 4 * byte_23637C3D0[v10]))();
  }
}

void sub_236379F2C(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
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
  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_23637A020()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x23637A094);
}

void sub_23637A028(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x23637A030);
  JUMPOUT(0x23637A094);
}

void sub_23637A070()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x23637A094);
}

void sub_23637A078()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x23637A094);
}

uint64_t sub_23637A080(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_WORD *)(v5 + v6) = 0;
  if (!a2)
    JUMPOUT(0x23637A094);
  if (a3 < 0x7FFFFFFF)
  {
    if ((a2 & 0x80000000) == 0)
      JUMPOUT(0x23637A090);
    JUMPOUT(0x23637A08CLL);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v5);
}

uint64_t type metadata accessor for ErrorHandlingHeadersProvider(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ErrorHandlingHeadersProvider);
}

uint64_t sub_23637A0B8(uint64_t a1)
{
  uint64_t v2;

  sub_23637AA18();
  v2 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 24) + 8))(*(_QWORD *)(a1 + 16));
  swift_bridgeObjectRelease();
  sub_23637A880();
  return v2;
}

uint64_t sub_23637A148(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t);

  v4[4] = a3;
  v4[5] = v3;
  v8 = sub_23637A7E4();
  v4[6] = v8;
  v4[7] = *(_QWORD *)(v8 - 8);
  v4[8] = swift_task_alloc();
  v11 = a3 + 16;
  v9 = *(_QWORD *)(a3 + 16);
  v10 = *(_QWORD *)(v11 + 8);
  v12 = *(int **)(v10 + 16);
  v4[9] = v9;
  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v12 + *v12);
  v13 = (_QWORD *)swift_task_alloc();
  v4[10] = v13;
  *v13 = v4;
  v13[1] = sub_23637A1FC;
  return v15(a1, a2, v9, v10);
}

uint64_t sub_23637A1FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 88) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_23637A284()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (qword_2563DDA98 != -1)
    swift_once();
  v1 = *(void **)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 48);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_2563DFDB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_23637A7CC();
  v9 = sub_23637A994();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(void **)(v0 + 88);
  if (v10)
  {
    v24 = *(_QWORD *)(v0 + 56);
    v25 = *(_QWORD *)(v0 + 48);
    v26 = *(_QWORD *)(v0 + 64);
    v12 = swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v27 = v14;
    *(_DWORD *)v12 = 136315394;
    swift_getMetatypeMetadata();
    v15 = sub_23637AD6C();
    *(_QWORD *)(v0 + 16) = sub_23636CE4C(v15, v16, &v27);
    sub_23637A9C4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2112;
    v17 = v11;
    v18 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 24) = v18;
    sub_23637A9C4();
    *v13 = v18;

    _os_log_impl(&dword_23635F000, v8, v9, "Failed to retrieve headers using %s: '%@'. using fallback value.", (uint8_t *)v12, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DDEE0);
    swift_arrayDestroy();
    MEMORY[0x23B7F15E4](v13, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x23B7F15E4](v14, -1, -1);
    MEMORY[0x23B7F15E4](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v26, v25);
  }
  else
  {
    v20 = *(_QWORD *)(v0 + 56);
    v19 = *(_QWORD *)(v0 + 64);
    v21 = *(_QWORD *)(v0 + 48);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  v22 = *(_QWORD *)(*(_QWORD *)(v0 + 40) + *(int *)(*(_QWORD *)(v0 + 32) + 36));
  swift_bridgeObjectRetain();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v22);
}

uint64_t sub_23637A544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_236362118;
  return sub_23637A148(a1, a2, a3);
}

uint64_t getEnumTagSinglePayload for TimeoutError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for TimeoutError(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for TimeoutError()
{
  return &type metadata for TimeoutError;
}

unint64_t sub_23637A600()
{
  return 0xD000000000000013;
}

uint64_t sub_23637A61C()
{
  return MEMORY[0x24BDCAFF8]();
}

uint64_t sub_23637A628()
{
  return MEMORY[0x24BDCB040]();
}

uint64_t sub_23637A634()
{
  return MEMORY[0x24BDCB070]();
}

uint64_t sub_23637A640()
{
  return MEMORY[0x24BDCB0A0]();
}

uint64_t sub_23637A64C()
{
  return MEMORY[0x24BDCB0A8]();
}

uint64_t sub_23637A658()
{
  return MEMORY[0x24BDCB0B0]();
}

uint64_t sub_23637A664()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_23637A670()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_23637A67C()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_23637A688()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_23637A694()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_23637A6A0()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_23637A6AC()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_23637A6B8()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_23637A6C4()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_23637A6D0()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23637A6DC()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23637A6E8()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_23637A6F4()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23637A700()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_23637A70C()
{
  return MEMORY[0x24BDCDA90]();
}

uint64_t sub_23637A718()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_23637A724()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23637A730()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23637A73C()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_23637A748()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23637A754()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23637A760()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23637A76C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23637A778()
{
  return MEMORY[0x24BDCECF0]();
}

uint64_t sub_23637A784()
{
  return MEMORY[0x24BDCED08]();
}

uint64_t sub_23637A790()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_23637A79C()
{
  return MEMORY[0x24BDCEE18]();
}

uint64_t sub_23637A7A8()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_23637A7B4()
{
  return MEMORY[0x24BDCEE60]();
}

uint64_t sub_23637A7C0()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23637A7CC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23637A7D8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23637A7E4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23637A7F0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23637A7FC()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23637A808()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23637A814()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23637A820()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23637A82C()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_23637A838()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_23637A844()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23637A850()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_23637A85C()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_23637A868()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_23637A874()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23637A880()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23637A88C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23637A898()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23637A8A4()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_23637A8B0()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23637A8BC()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_23637A8C8()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_23637A8D4()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_23637A8E0()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23637A8EC()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23637A8F8()
{
  return MEMORY[0x24BEE6970]();
}

uint64_t sub_23637A904()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23637A910()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23637A91C()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_23637A928()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_23637A934()
{
  return MEMORY[0x24BEE6B38]();
}

uint64_t sub_23637A940()
{
  return MEMORY[0x24BEE6B98]();
}

uint64_t sub_23637A94C()
{
  return MEMORY[0x24BEE6BA0]();
}

uint64_t sub_23637A958()
{
  return MEMORY[0x24BEE6BE0]();
}

uint64_t sub_23637A964()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_23637A970()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_23637A97C()
{
  return MEMORY[0x24BDCFED8]();
}

uint64_t sub_23637A988()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23637A994()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23637A9A0()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_23637A9AC()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23637A9B8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23637A9C4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23637A9D0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23637A9DC()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23637A9E8()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23637A9F4()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_23637AA00()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_23637AA0C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23637AA18()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23637AA24()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23637AA30()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23637AA3C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23637AA48()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23637AA54()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23637AA60()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_23637AA6C()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23637AA78()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23637AA84()
{
  return MEMORY[0x24BEE6D80]();
}

uint64_t sub_23637AA90()
{
  return MEMORY[0x24BEE6DC0]();
}

uint64_t sub_23637AA9C()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_23637AAA8()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_23637AAB4()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_23637AAC0()
{
  return MEMORY[0x24BEE2AE8]();
}

uint64_t sub_23637AACC()
{
  return MEMORY[0x24BEE6E28]();
}

uint64_t sub_23637AAD8()
{
  return MEMORY[0x24BEE6E48]();
}

uint64_t sub_23637AAE4()
{
  return MEMORY[0x24BEE6E58]();
}

uint64_t sub_23637AAF0()
{
  return MEMORY[0x24BEE6E68]();
}

uint64_t sub_23637AAFC()
{
  return MEMORY[0x24BEE6E70]();
}

uint64_t sub_23637AB08()
{
  return MEMORY[0x24BEE6E90]();
}

uint64_t sub_23637AB14()
{
  return MEMORY[0x24BEE6E98]();
}

uint64_t sub_23637AB20()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23637AB2C()
{
  return MEMORY[0x24BEE2F08]();
}

uint64_t sub_23637AB38()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23637AB44()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23637AB50()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23637AB5C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23637AB68()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23637AB74()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23637AB80()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23637AB8C()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_23637AB98()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23637ABA4()
{
  return MEMORY[0x24BEE6FA8]();
}

uint64_t sub_23637ABB0()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23637ABBC()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23637ABC8()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23637ABD4()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23637ABE0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23637ABEC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23637ABF8()
{
  return MEMORY[0x24BEE7098]();
}

uint64_t sub_23637AC04()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_23637AC10()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_23637AC1C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23637AC28()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_23637AC34()
{
  return MEMORY[0x24BEE7138]();
}

uint64_t sub_23637AC40()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_23637AC4C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23637AC58()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23637AC64()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23637AC70()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23637AC7C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23637AC88()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23637AC94()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23637ACA0()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23637ACAC()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23637ACB8()
{
  return MEMORY[0x24BDD08E0]();
}

uint64_t sub_23637ACC4()
{
  return MEMORY[0x24BDD0900]();
}

uint64_t sub_23637ACD0()
{
  return MEMORY[0x24BDD0910]();
}

uint64_t sub_23637ACDC()
{
  return MEMORY[0x24BDD09E8]();
}

uint64_t sub_23637ACE8()
{
  return MEMORY[0x24BDD09F0]();
}

uint64_t sub_23637ACF4()
{
  return MEMORY[0x24BDD0A18]();
}

uint64_t sub_23637AD00()
{
  return MEMORY[0x24BDD0A48]();
}

uint64_t sub_23637AD0C()
{
  return MEMORY[0x24BDD0A50]();
}

uint64_t sub_23637AD18()
{
  return MEMORY[0x24BDD0A90]();
}

uint64_t sub_23637AD24()
{
  return MEMORY[0x24BDD0AB8]();
}

uint64_t sub_23637AD30()
{
  return MEMORY[0x24BDD0AF0]();
}

uint64_t sub_23637AD3C()
{
  return MEMORY[0x24BDD0B20]();
}

uint64_t sub_23637AD48()
{
  return MEMORY[0x24BEE4828]();
}

uint64_t sub_23637AD54()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23637AD60()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_23637AD6C()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t DeviceIdentityIssueClientCertificateWithCompletion()
{
  return MEMORY[0x24BE2C378]();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x24BDE87A0](allocator, protection, flags, error);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x24BDE8850](certificate);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8B38](key, algorithm, dataToSign, error);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x24BDBCFB0]();
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
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

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

