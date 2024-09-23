void *__Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_2358AA130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  id *v12;
  uint64_t v13;
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v12);
  objc_destroyWeak((id *)(v13 - 72));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void type metadata accessor for Dataclass(uint64_t a1)
{
  sub_2358AA9EC(a1, &qword_256306AE8);
}

void type metadata accessor for SecCertificate(uint64_t a1)
{
  sub_2358AA9EC(a1, &qword_256306AF0);
}

uint64_t sub_2358AA484(uint64_t a1)
{
  return sub_2358AA4BC(a1, qword_254293728);
}

uint64_t sub_2358AA49C(uint64_t a1)
{
  return sub_2358AA4BC(a1, qword_254293740);
}

uint64_t sub_2358AA4BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_2358BA2E4();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  swift_bridgeObjectRetain();
  return sub_2358BA2D8();
}

uint64_t sub_2358AA540(uint64_t a1, uint64_t a2)
{
  return sub_2358AA7E8(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_2358AA54C(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_2358BA338();
  *a2 = 0;
  return result;
}

uint64_t sub_2358AA5C0(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_2358BA344();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2358AA63C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_2358BA350();
  v2 = sub_2358BA32C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2358AA67C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2358BA32C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2358AA6C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2358BA350();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2358AA6E8()
{
  sub_2358AA79C(&qword_256306B10, (uint64_t)&unk_2358BAE00);
  sub_2358AA79C(&qword_256306B18, (uint64_t)&unk_2358BADA8);
  return sub_2358BA554();
}

uint64_t sub_2358AA754()
{
  return sub_2358AA79C(&qword_256306AF8, (uint64_t)&unk_2358BAD70);
}

uint64_t sub_2358AA778()
{
  return sub_2358AA79C(&qword_256306B00, (uint64_t)&unk_2358BAD48);
}

uint64_t sub_2358AA79C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for Dataclass(255);
    result = MEMORY[0x23B7D9FF8](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2358AA7DC(uint64_t a1, uint64_t a2)
{
  return sub_2358AA7E8(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_2358AA7E8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_2358BA350();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2358AA824()
{
  sub_2358BA350();
  sub_2358BA38C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2358AA864()
{
  uint64_t v0;

  sub_2358BA350();
  sub_2358BA608();
  sub_2358BA38C();
  v0 = sub_2358BA620();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2358AA8D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_2358BA350();
  v2 = v1;
  if (v0 == sub_2358BA350() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_2358BA590();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2358AA95C()
{
  return sub_2358AA79C(&qword_256306B08, (uint64_t)&unk_2358BADD8);
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void type metadata accessor for CFError(uint64_t a1)
{
  sub_2358AA9EC(a1, &qword_256306B20);
}

void sub_2358AA9EC(uint64_t a1, unint64_t *a2)
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

uint64_t ACSEError.nsError.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, a1);
  v6 = sub_2358BA578();
  if (v6)
  {
    v7 = (void *)v6;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, a1);
  }
  else
  {
    v7 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v8, v4, a1);
  }
  v9 = sub_2358BA194();

  return v9;
}

uint64_t ACSEError.errorCode.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

unint64_t ACSEError.userInfo.getter(uint64_t a1, uint64_t (**a2)(_QWORD, _QWORD))
{
  uint64_t inited;
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

  __swift_instantiateConcreteTypeFromMangledName(&qword_256306B28);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2358BAEB0;
  *(_QWORD *)(inited + 32) = sub_2358BA350();
  *(_QWORD *)(inited + 40) = v5;
  v6 = a2[3](a1, a2);
  v7 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v6;
  *(_QWORD *)(inited + 56) = v8;
  *(_QWORD *)(inited + 80) = sub_2358BA350();
  *(_QWORD *)(inited + 88) = v9;
  v10 = a2[4](a1, a2);
  *(_QWORD *)(inited + 120) = v7;
  *(_QWORD *)(inited + 96) = v10;
  *(_QWORD *)(inited + 104) = v11;
  *(_QWORD *)(inited + 128) = sub_2358BA350();
  *(_QWORD *)(inited + 136) = v12;
  v13 = a2[5](a1, a2);
  *(_QWORD *)(inited + 168) = v7;
  *(_QWORD *)(inited + 144) = v13;
  *(_QWORD *)(inited + 152) = v14;
  return sub_2358AAC60(inited);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7D9FE0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2358AAC60(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254293710);
  v2 = sub_2358BA53C();
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
    sub_2358AB2A0(v6, (uint64_t)&v15, &qword_256306B50);
    v7 = v15;
    v8 = v16;
    result = sub_2358AD3DC(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_2358AB290(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_2358AAD94(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256306B40);
  v2 = sub_2358BA53C();
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
    sub_2358AB2A0(v6, (uint64_t)v15, &qword_256306B48);
    result = sub_2358AD640((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_2358AB290(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
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

unint64_t sub_2358AAED4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256306B38);
  v2 = (_QWORD *)sub_2358BA53C();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_BYTE *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_2358AD3DC(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_BYTE *)(v2[7] + result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 24;
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

uint64_t ACSEError.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v8 = sub_2358BA458();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v22 - v10;
  v12 = objc_msgSend(a1, sel_domain);
  v13 = sub_2358BA350();
  v15 = v14;

  if (v13 == sub_2358BA17C() && v15 == v16)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v18 = sub_2358BA590();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0)
    {

      v19 = *(_QWORD *)(a2 - 8);
      goto LABEL_10;
    }
  }
  (*(void (**)(id, uint64_t, uint64_t))(a3 + 64))(objc_msgSend(a1, sel_code), a2, a3);

  v19 = *(_QWORD *)(a2 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v11, 1, a2))
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(a4, v11, a2);
    v20 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(a4, v20, 1, a2);
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
LABEL_10:
  v20 = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(a4, v20, 1, a2);
}

uint64_t dispatch thunk of ACSEError.errorDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ACSEError.failureReason.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ACSEError.recoverySuggestion.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ACSEError.nsError.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of ACSEError.rawValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of ACSEError.init(rawValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t sub_2358AB1BC()
{
  char *v0;
  uint64_t v1;
  void *v2;
  _BYTE *v3;
  uint64_t v4;
  char v6;

  v6 = *v0;
  sub_2358AB24C();
  v1 = sub_2358BA578();
  if (v1)
  {
    v2 = (void *)v1;
  }
  else
  {
    v2 = (void *)swift_allocError();
    *v3 = v6;
  }
  v4 = sub_2358BA194();

  return v4;
}

unint64_t sub_2358AB24C()
{
  unint64_t result;

  result = qword_256306B30;
  if (!qword_256306B30)
  {
    result = MEMORY[0x23B7D9FF8](&protocol conformance descriptor for RequestSigningError, &type metadata for RequestSigningError);
    atomic_store(result, (unint64_t *)&qword_256306B30);
  }
  return result;
}

_OWORD *sub_2358AB290(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2358AB2A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_2358AB2E4()
{
  strcpy((char *)&qword_256306B58, "UniqueDeviceID");
  unk_256306B67 = -18;
}

char *sub_2358AB314()
{
  char *result;
  uint64_t v1;

  result = sub_2358AB334();
  qword_256306B68 = (uint64_t)result;
  unk_256306B70 = v1;
  return result;
}

char *sub_2358AB334()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  char *result;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  uint64_t v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v0 = sub_2358BA260();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = 37;
  v4 = sub_2358BA3BC();
  *(_QWORD *)(v4 + 16) = 37;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_QWORD *)(v4 + 61) = 0;
  *(_OWORD *)(v4 + 32) = 0u;
  v5 = sysctlbyname("kern.bootsessionuuid", (void *)(v4 + 32), &v21, 0, 0);
  if (!v5)
  {
    v19 = sub_2358AB7FC(v4);
    swift_bridgeObjectRelease();
    return (char *)v19;
  }
  v6 = v5;
  v7 = MEMORY[0x23B7D9860]();
  result = strerror(v7);
  if (result)
  {
    v9 = sub_2358BA320();
    v11 = v10;
    swift_bridgeObjectRelease();
    if (v11)
      v12 = v9;
    else
      v12 = 0x6E776F6E6B6E55;
    if (v11)
      v13 = v11;
    else
      v13 = 0xE700000000000000;
    if (qword_2542936E0 != -1)
      swift_once();
    v14 = sub_2358BA2E4();
    __swift_project_value_buffer(v14, (uint64_t)qword_254293728);
    swift_bridgeObjectRetain();
    v15 = sub_2358BA2CC();
    v16 = sub_2358BA434();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc();
      v18 = swift_slowAlloc();
      v22[0] = v18;
      *(_DWORD *)v17 = 67109378;
      LODWORD(v20) = v6;
      sub_2358BA464();
      *(_WORD *)(v17 + 8) = 2080;
      swift_bridgeObjectRetain();
      v20 = sub_2358ACD9C(v12, v13, v22);
      sub_2358BA464();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2358A8000, v15, v16, "Failed to fetch current boot session UUID with error: %d -> %s", (uint8_t *)v17, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x23B7DA064](v18, -1, -1);
      MEMORY[0x23B7DA064](v17, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_2358BA254();
    v19 = sub_2358BA248();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return (char *)v19;
  }
  __break(1u);
  return result;
}

uint64_t static SystemProperties.bootSessionUUID.getter()
{
  uint64_t v0;

  if (qword_256306AE0 != -1)
    swift_once();
  v0 = qword_256306B68;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static SystemProperties.getDeviceID()()
{
  void *v0;
  uint64_t v1;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;

  if (qword_256306AD8 != -1)
    swift_once();
  v0 = (void *)sub_2358BA32C();
  v1 = MGCopyAnswer();

  if (v1 && (swift_dynamicCast() & 1) != 0)
    return v7;
  if (qword_2542936E0 != -1)
    swift_once();
  v3 = sub_2358BA2E4();
  __swift_project_value_buffer(v3, (uint64_t)qword_254293728);
  v4 = sub_2358BA2CC();
  v5 = sub_2358BA434();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2358A8000, v4, v5, "Failed to fetch unique device ID.", v6, 2u);
    MEMORY[0x23B7DA064](v6, -1, -1);
  }

  return 0;
}

ValueMetadata *type metadata accessor for SystemProperties()
{
  return &type metadata for SystemProperties;
}

uint64_t sub_2358AB7FC(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(result + 16);
  if (v1)
  {
    v2 = result;
    v3 = *(unsigned __int8 *)(result + 32);
    result += 32;
    if (!v3)
      return sub_2358BA380();
    v4 = 0;
    v5 = v1 - 1;
    v6 = v2 + 33;
    while (v5 != v4)
    {
      if (!*(unsigned __int8 *)(v6 + v4++))
        return sub_2358BA380();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2358AB844()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2358AB8B4;
  return sub_2358BA404();
}

uint64_t sub_2358AB8B4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t TaskLimiter.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 112) = MEMORY[0x24BEE4B00];
  return v0;
}

uint64_t TaskLimiter.init()()
{
  uint64_t v0;

  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 112) = MEMORY[0x24BEE4B00];
  return v0;
}

uint64_t sub_2358AB964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;

  v7[43] = a6;
  v7[44] = v6;
  v7[41] = a4;
  v7[42] = a5;
  v7[39] = a2;
  v7[40] = a3;
  v7[38] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542936F8);
  v7[45] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2358AB9CC()
{
  uint64_t v0;
  _OWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  unint64_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  unint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  _OWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  BOOL v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  _BOOL4 v49;
  unint64_t v50;
  uint64_t v51;
  uint8_t *v52;
  uint64_t v53;
  _QWORD *v54;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59[3];
  uint64_t v60;
  uint64_t v61;

  v1 = (_OWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 352) + 112;
  swift_beginAccess();
  v3 = *(_QWORD *)v2;
  if (!*(_QWORD *)(*(_QWORD *)v2 + 16))
  {
    *(_QWORD *)(v0 + 128) = 0;
    *v1 = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
LABEL_12:
    sub_2358AE980(v0 + 96, &qword_2542936F0);
    goto LABEL_14;
  }
  v5 = *(_QWORD *)(v0 + 312);
  v4 = *(_QWORD *)(v0 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = sub_2358AD3DC(v5, v4);
  if ((v7 & 1) != 0)
  {
    sub_2358AD5C4(*(_QWORD *)(v3 + 56) + 40 * v6, v0 + 96);
  }
  else
  {
    *(_QWORD *)(v0 + 128) = 0;
    *v1 = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 120))
    goto LABEL_12;
  sub_2358AD608((__int128 *)(v0 + 96), v0 + 16);
  sub_2358AD5C4(v0 + 16, v0 + 56);
  __swift_instantiateConcreteTypeFromMangledName(qword_256306B90);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254293718);
  sub_2358BA410();
  if ((swift_dynamicCast() & 1) != 0)
  {
    *(_QWORD *)(v0 + 368) = *(_QWORD *)(v0 + 288);
    if (qword_2542936E0 != -1)
      swift_once();
    v8 = sub_2358BA2E4();
    __swift_project_value_buffer(v8, (uint64_t)qword_254293728);
    swift_bridgeObjectRetain_n();
    v9 = sub_2358BA2CC();
    v10 = sub_2358BA428();
    v11 = os_log_type_enabled(v9, v10);
    v12 = *(_QWORD *)(v0 + 320);
    if (v11)
    {
      v13 = *(_QWORD *)(v0 + 312);
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v59[0] = v15;
      *(_DWORD *)v14 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 296) = sub_2358ACD9C(v13, v12, v59);
      sub_2358BA464();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2358A8000, v9, v10, "TaskLimiter: reusing existing task for identifier %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7DA064](v15, -1, -1);
      MEMORY[0x23B7DA064](v14, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v56 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 376) = v56;
    *v56 = v0;
    v56[1] = sub_2358AC2E8;
    return sub_2358BA404();
  }
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
LABEL_14:
  if (qword_2542936E0 != -1)
    swift_once();
  v57 = v0 + 176;
  v16 = sub_2358BA2E4();
  __swift_project_value_buffer(v16, (uint64_t)qword_254293728);
  swift_bridgeObjectRetain_n();
  v17 = sub_2358BA2CC();
  v18 = sub_2358BA428();
  v19 = os_log_type_enabled(v17, v18);
  v20 = *(_QWORD *)(v0 + 320);
  if (v19)
  {
    v58 = *(_QWORD *)(v0 + 312);
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v59[0] = v22;
    *(_DWORD *)v21 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 272) = sub_2358ACD9C(v58, v20, v59);
    sub_2358BA464();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2358A8000, v17, v18, "TaskLimiter: creating new task for identifier %s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DA064](v22, -1, -1);
    MEMORY[0x23B7DA064](v21, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v23 = (_OWORD *)(v0 + 136);
  v24 = *(_QWORD *)v2;
  if (*(_QWORD *)(*(_QWORD *)v2 + 16))
  {
    v26 = *(_QWORD *)(v0 + 312);
    v25 = *(_QWORD *)(v0 + 320);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v27 = sub_2358AD3DC(v26, v25);
    if ((v28 & 1) != 0)
    {
      sub_2358AD5C4(*(_QWORD *)(v24 + 56) + 40 * v27, v0 + 136);
    }
    else
    {
      *(_QWORD *)(v0 + 168) = 0;
      *v23 = 0u;
      *(_OWORD *)(v0 + 152) = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(v0 + 168) = 0;
    *v23 = 0u;
    *(_OWORD *)(v0 + 152) = 0u;
  }
  v29 = *(_QWORD *)(v0 + 360);
  v31 = *(_QWORD *)(v0 + 336);
  v30 = *(_QWORD *)(v0 + 344);
  v32 = *(_QWORD *)(v0 + 328);
  v33 = sub_2358BA3F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v29, 1, 1, v33);
  sub_2358AD440(v0 + 136, v57);
  v34 = (_QWORD *)swift_allocObject();
  v34[2] = 0;
  v34[3] = 0;
  v34[4] = v30;
  sub_2358AD4C4(v57, (uint64_t)(v34 + 5));
  v34[10] = v32;
  v34[11] = v31;
  swift_retain();
  v35 = sub_2358AC9E8(v29, (uint64_t)&unk_256306B88, (uint64_t)v34);
  *(_QWORD *)(v0 + 392) = v35;
  swift_bridgeObjectRetain_n();
  v36 = sub_2358BA2CC();
  v37 = sub_2358BA428();
  v38 = os_log_type_enabled(v36, v37);
  v39 = *(_QWORD *)(v0 + 320);
  if (v38)
  {
    v40 = v35;
    v41 = *(_QWORD *)(v0 + 312);
    v42 = (uint8_t *)swift_slowAlloc();
    v43 = swift_slowAlloc();
    v59[0] = v43;
    *(_DWORD *)v42 = 136315138;
    swift_bridgeObjectRetain();
    v44 = v41;
    v35 = v40;
    *(_QWORD *)(v0 + 264) = sub_2358ACD9C(v44, v39, v59);
    sub_2358BA464();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2358A8000, v36, v37, "TaskLimiter: storing task for identifier %s", v42, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DA064](v43, -1, -1);
    MEMORY[0x23B7DA064](v42, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v46 = *(_QWORD *)(v0 + 312);
  v45 = *(_QWORD *)(v0 + 320);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254293718);
  v60 = sub_2358BA410();
  v61 = MEMORY[0x23B7D9FF8](&unk_2358BAF10, v60);
  v59[0] = v35;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2358ACB18((uint64_t)v59, v46, v45);
  swift_endAccess();
  swift_bridgeObjectRetain_n();
  v47 = sub_2358BA2CC();
  v48 = sub_2358BA428();
  v49 = os_log_type_enabled(v47, v48);
  v50 = *(_QWORD *)(v0 + 320);
  if (v49)
  {
    v51 = *(_QWORD *)(v0 + 312);
    v52 = (uint8_t *)swift_slowAlloc();
    v53 = swift_slowAlloc();
    v59[0] = v53;
    *(_DWORD *)v52 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 280) = sub_2358ACD9C(v51, v50, v59);
    sub_2358BA464();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2358A8000, v47, v48, "TaskLimiter: performing task operation for identifier %s", v52, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DA064](v53, -1, -1);
    MEMORY[0x23B7DA064](v52, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v54 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 400) = v54;
  *v54 = v0;
  v54[1] = sub_2358AC394;
  return sub_2358BA404();
}

uint64_t sub_2358AC2E8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 384) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2358AC34C()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2358AC394()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 408) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2358AC3F8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 312);
  v1 = *(_QWORD *)(v0 + 320);
  swift_release();
  sub_2358AE980(v0 + 136, &qword_2542936F0);
  sub_2358AC520(v2, v1);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2358AC468()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2358AC4B0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 312);
  v1 = *(_QWORD *)(v0 + 320);
  swift_release();
  sub_2358AE980(v0 + 136, &qword_2542936F0);
  sub_2358AC520(v2, v1);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2358AC520(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  _OWORD v10[2];
  uint64_t v11;

  if (qword_2542936E0 != -1)
    swift_once();
  v4 = sub_2358BA2E4();
  __swift_project_value_buffer(v4, (uint64_t)qword_254293728);
  swift_bridgeObjectRetain_n();
  v5 = sub_2358BA2CC();
  v6 = sub_2358BA428();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    *(_QWORD *)&v10[0] = v8;
    *(_DWORD *)v7 = 136315138;
    swift_bridgeObjectRetain();
    sub_2358ACD9C(a1, a2, (uint64_t *)v10);
    sub_2358BA464();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2358A8000, v5, v6, "TaskLimiter: cleaning up task for identifier %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DA064](v8, -1, -1);
    MEMORY[0x23B7DA064](v7, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v11 = 0;
  memset(v10, 0, sizeof(v10));
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_2358ACB18((uint64_t)v10, a1, a2);
  return swift_endAccess();
}

uint64_t sub_2358AC70C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[13] = a5;
  v6[14] = a6;
  v6[11] = a1;
  v6[12] = a4;
  return swift_task_switch();
}

uint64_t sub_2358AC728()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t *boxed_opaque_existential_0;
  _QWORD *v5;
  int *v7;
  _QWORD *v8;
  uint64_t (*v9)(uint64_t *, uint64_t, uint64_t);
  uint64_t (*v10)(_QWORD);

  sub_2358AD440(*(_QWORD *)(v0 + 96), v0 + 16);
  v1 = *(_QWORD *)(v0 + 40);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    v3 = *(int **)(v2 + 16);
    *(_QWORD *)(v0 + 80) = swift_getAssociatedTypeWitness();
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 56));
    v9 = (uint64_t (*)(uint64_t *, uint64_t, uint64_t))((char *)v3 + *v3);
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 120) = v5;
    *v5 = v0;
    v5[1] = sub_2358AC87C;
    return v9(boxed_opaque_existential_0, v1, v2);
  }
  else
  {
    sub_2358AE980(v0 + 16, &qword_2542936F0);
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
    v7 = *(int **)(v0 + 104);
    sub_2358AE980(v0 + 56, &qword_254293720);
    v10 = (uint64_t (*)(_QWORD))((char *)v7 + *v7);
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v8;
    *v8 = v0;
    v8[1] = sub_2358AC960;
    return v10(*(_QWORD *)(v0 + 88));
  }
}

uint64_t sub_2358AC87C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2358AC8E0()
{
  _QWORD *v0;
  int *v1;
  _QWORD *v2;
  uint64_t (*v4)(_QWORD);

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  v1 = (int *)v0[13];
  sub_2358AE980((uint64_t)(v0 + 7), &qword_254293720);
  v4 = (uint64_t (*)(_QWORD))((char *)v1 + *v1);
  v2 = (_QWORD *)swift_task_alloc();
  v0[17] = v2;
  *v2 = v0;
  v2[1] = sub_2358AC960;
  return v4(v0[11]);
}

uint64_t sub_2358AC960()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2358AC9A8()
{
  uint64_t v0;

  __swift_deallocate_boxed_opaque_existential_0(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2358AC9E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_2358BA3F8();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_2358BA3EC();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_2358AE980(a1, &qword_2542936F8);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2358BA3C8();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_2358ACB18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  __int128 v9[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_2358AD608((__int128 *)a1, (uint64_t)v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = *v3;
    *v3 = 0x8000000000000000;
    sub_2358AE12C(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_2358AE980(a1, &qword_2542936F0);
    sub_2358AD814(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_2358AE980((uint64_t)v9, &qword_2542936F0);
  }
}

uint64_t TaskLimiter.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t TaskLimiter.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_2358ACC20()
{
  uint64_t v0;

  return v0;
}

uint64_t TaskLimiters.limiter(key:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;

  v5 = (uint64_t *)(v2 + 112);
  swift_beginAccess();
  v6 = *(_QWORD *)(v2 + 112);
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_5;
  swift_bridgeObjectRetain();
  v7 = sub_2358AD3DC(a1, a2);
  if ((v8 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    swift_endAccess();
    type metadata accessor for TaskLimiter();
    v9 = swift_allocObject();
    swift_defaultActor_initialize();
    *(_QWORD *)(v9 + 112) = MEMORY[0x24BEE4B00];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v12 = *v5;
    *v5 = 0x8000000000000000;
    sub_2358AE260(v9, a1, a2, isUniquelyReferenced_nonNull_native);
    *v5 = v12;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    return v9;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v7);
  swift_endAccess();
  swift_retain();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t _s14ACSEFoundation11TaskLimiterCfD_0()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_2358ACD9C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2358ACE6C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2358AE940((uint64_t)v12, *a3);
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
      sub_2358AE940((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_2358ACE6C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2358BA470();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2358AD024(a5, a6);
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
  v8 = sub_2358BA4C4();
  if (!v8)
  {
    sub_2358BA50C();
    __break(1u);
LABEL_17:
    result = sub_2358BA548();
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

uint64_t sub_2358AD024(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2358AD0B8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2358AD290(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2358AD290(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2358AD0B8(uint64_t a1, unint64_t a2)
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
      v3 = sub_2358AD22C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2358BA4AC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2358BA50C();
      __break(1u);
LABEL_10:
      v2 = sub_2358BA3A4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2358BA548();
    __break(1u);
LABEL_14:
    result = sub_2358BA50C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2358AD22C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256306C70);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2358AD290(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256306C70);
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
  result = sub_2358BA548();
  __break(1u);
  return result;
}

unint64_t sub_2358AD3DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2358BA608();
  sub_2358BA38C();
  v4 = sub_2358BA620();
  return sub_2358AD670(a1, a2, v4);
}

uint64_t sub_2358AD440(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542936F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2358AD488()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  if (*(_QWORD *)(v0 + 64))
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 40);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2358AD4C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542936F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2358AD50C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 80);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_2358AEA58;
  *(_OWORD *)(v4 + 104) = v5;
  *(_QWORD *)(v4 + 88) = a1;
  *(_QWORD *)(v4 + 96) = v1 + 40;
  return swift_task_switch();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7D9FEC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2358AD5C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2358AD608(__int128 *a1, uint64_t a2)
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

uint64_t type metadata accessor for TaskLimiter()
{
  return objc_opt_self();
}

unint64_t sub_2358AD640(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2358BA488();
  return sub_2358AD750(a1, v2);
}

unint64_t sub_2358AD670(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2358BA590() & 1) == 0)
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
      while (!v14 && (sub_2358BA590() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2358AD750(uint64_t a1, uint64_t a2)
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
      sub_2358AE4A8(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x23B7D9A04](v9, a1);
      sub_2358AE4E4((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

double sub_2358AD814@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  v8 = sub_2358AD3DC(a1, a2);
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
      sub_2358AE584();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_2358AD608((__int128 *)(*(_QWORD *)(v11 + 56) + 40 * v8), a3);
    sub_2358ADF44(v8, v11);
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

uint64_t sub_2358AD90C(uint64_t a1, char a2)
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
  __int128 *v25;
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
  __int128 v38[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254293708);
  v37 = a2;
  v6 = sub_2358BA530();
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
    v25 = (__int128 *)(*(_QWORD *)(v5 + 56) + 40 * v17);
    if ((v37 & 1) != 0)
    {
      sub_2358AD608(v25, (uint64_t)v38);
    }
    else
    {
      sub_2358AD5C4((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_2358BA608();
    sub_2358BA38C();
    result = sub_2358BA620();
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
    result = sub_2358AD608(v38, *(_QWORD *)(v7 + 56) + 40 * v14);
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

uint64_t sub_2358ADC30(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256306C68);
  v36 = a2;
  v6 = sub_2358BA530();
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
    sub_2358BA608();
    sub_2358BA38C();
    result = sub_2358BA620();
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

unint64_t sub_2358ADF44(unint64_t result, uint64_t a2)
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
  unint64_t v17;
  __int128 *v18;
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
    result = sub_2358BA47C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_2358BA608();
        swift_bridgeObjectRetain();
        sub_2358BA38C();
        v11 = sub_2358BA620();
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
          v17 = v16 + 40 * v3;
          v18 = (__int128 *)(v16 + 40 * v6);
          if (v3 != v6 || (v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            v9 = *v18;
            v10 = v18[1];
            *(_QWORD *)(v17 + 32) = *((_QWORD *)v18 + 4);
            *(_OWORD *)v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
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

uint64_t sub_2358AE12C(__int128 *a1, uint64_t a2, uint64_t a3, char a4)
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
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_2358AD3DC(a2, a3);
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
        v19 = v18[7] + 40 * v12;
        __swift_destroy_boxed_opaque_existential_1Tm(v19);
        return sub_2358AD608(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_2358AE584();
      goto LABEL_7;
    }
    sub_2358AD90C(v15, a4 & 1);
    v21 = sub_2358AD3DC(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_2358AE518(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_2358BA5A8();
  __break(1u);
  return result;
}

uint64_t sub_2358AE260(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_2358AD3DC(a2, a3);
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
    sub_2358AE76C();
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
  sub_2358ADC30(v15, a4 & 1);
  v21 = sub_2358AD3DC(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_2358BA5A8();
  __break(1u);
  return result;
}

uint64_t method lookup function for TaskLimiter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TaskLimiter.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of TaskLimiter.perform<A>(identifier:operation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v14;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v6 + 128)
                                                                                     + *(_QWORD *)(*(_QWORD *)v6 + 128));
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v14;
  *v14 = v7;
  v14[1] = sub_2358AB8B4;
  return v16(a1, a2, a3, a4, a5, a6);
}

uint64_t type metadata accessor for TaskLimiters()
{
  return objc_opt_self();
}

uint64_t method lookup function for TaskLimiters()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TaskLimiters.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_2358AE4A8(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_2358AE4E4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_2358AE518(unint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, _QWORD *a5)
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
  result = sub_2358AD608(a4, a5[7] + 40 * a1);
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

void *sub_2358AE584()
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
  __int128 v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254293708);
  v2 = *v0;
  v3 = sub_2358BA524();
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
    v20 = 40 * v15;
    sub_2358AD5C4(*(_QWORD *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_2358AD608(v26, *(_QWORD *)(v4 + 56) + v20);
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

void *sub_2358AE76C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256306C68);
  v2 = *v0;
  v3 = sub_2358BA524();
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

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2358AE940(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2358AE980(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
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

uint64_t __swift_deallocate_boxed_opaque_existential_0(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x23B7DA064);
  return result;
}

void sub_2358AEA68()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  char *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;

  v1 = v0;
  v2 = sub_2358BA278();
  v43 = *(_QWORD *)(v2 - 8);
  v44 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v42 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2358BA29C();
  v40 = *(_QWORD *)(v4 - 8);
  v41 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2358BA23C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2358BA2C0();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v1, sel_aa_addClientInfoHeaders);
  objc_msgSend(v1, sel_aa_addMultiUserDeviceHeaderIfEnabled);
  v15 = (void *)sub_2358BA32C();
  objc_msgSend(v1, sel_aa_addContentTypeHeaders_, v15);

  objc_msgSend(v1, sel_ak_addDeviceUDIDHeader);
  v16 = objc_msgSend((id)objc_opt_self(), sel_systemTimeZone);
  sub_2358BA2B4();

  sub_2358BA230();
  sub_2358BA2A8();
  v18 = v17;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if (v18)
  {
    v19 = (void *)sub_2358BA32C();
    swift_bridgeObjectRelease();
    v20 = (void *)sub_2358BA32C();
    objc_msgSend(v1, sel_setValue_forHTTPHeaderField_, v19, v20);

  }
  v21 = objc_msgSend((id)objc_opt_self(), sel_currentInfo);
  if (!v21)
  {
    __break(1u);
    goto LABEL_8;
  }
  v22 = v21;
  v23 = objc_msgSend(v21, sel_udid);

  v24 = (void *)sub_2358BA32C();
  objc_msgSend(v1, sel_setValue_forHTTPHeaderField_, v23, v24);

  v25 = objc_msgSend((id)objc_opt_self(), sel_currentLocale);
  sub_2358BA290();

  v26 = v42;
  sub_2358BA284();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v6, v41);
  sub_2358BA26C();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v26, v44);
  v27 = (void *)sub_2358BA32C();
  swift_bridgeObjectRelease();
  v28 = (void *)sub_2358BA32C();
  objc_msgSend(v1, sel_setValue_forHTTPHeaderField_, v27, v28);

  v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  objc_msgSend(v29, sel_setDateStyle_, 3);
  objc_msgSend(v29, sel_setTimeStyle_, 3);
  v30 = objc_msgSend(v29, sel_dateFormat);
  if (!v30)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v31 = v30;
  sub_2358BA350();

  v32 = (void *)sub_2358BA32C();
  swift_bridgeObjectRelease();
  v33 = (void *)sub_2358BA32C();
  objc_msgSend(v1, sel_setValue_forHTTPHeaderField_, v32, v33);

  v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  objc_msgSend(v34, sel_setDateStyle_, 1);
  objc_msgSend(v34, sel_setTimeStyle_, 1);
  v35 = objc_msgSend(v34, sel_dateFormat);
  if (v35)
  {
    v36 = v35;
    sub_2358BA350();

    v37 = (void *)sub_2358BA32C();
    swift_bridgeObjectRelease();
    v38 = (void *)sub_2358BA32C();
    objc_msgSend(v1, sel_setValue_forHTTPHeaderField_, v37, v38);

    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t sub_2358AEFA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 136) = a1;
  *(_QWORD *)(v2 + 144) = v1;
  return swift_task_switch();
}

uint64_t sub_2358AEFC0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;

  v1 = *(void **)(v0 + 136);
  v2 = *(void **)(v0 + 144);
  objc_msgSend(v1, sel_aa_needsEmailConfiguration);
  v3 = (void *)sub_2358BA32C();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_2358BA32C();
  objc_msgSend(v2, sel_setValue_forHTTPHeaderField_, v3, v4);

  objc_msgSend(v1, sel_isEnabledForDataclass_, *MEMORY[0x24BDB3DA8]);
  v5 = (void *)sub_2358BA32C();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_2358BA32C();
  objc_msgSend(v2, sel_setValue_forHTTPHeaderField_, v5, v6);

  objc_msgSend(v1, sel_isEnabledForDataclass_, *MEMORY[0x24BDB3DE0]);
  v7 = (void *)sub_2358BA32C();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_2358BA32C();
  objc_msgSend(v2, sel_setValue_forHTTPHeaderField_, v7, v8);

  v9 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v10 = objc_msgSend(v9, sel_bundleIdentifier);

  if (v10)
  {
    v11 = sub_2358BA350();
    v13 = v12;

    if (v11 == 0xD000000000000015 && v13 == 0x80000002358BB760)
    {
      swift_bridgeObjectRelease();
LABEL_6:
      v15 = (void *)sub_2358BA32C();
      v16 = objc_msgSend((id)objc_opt_self(), sel_containerWithIdentifier_, v15);
      *(_QWORD *)(v0 + 152) = v16;

      *(_QWORD *)(v0 + 56) = v0 + 120;
      *(_QWORD *)(v0 + 16) = v0;
      *(_QWORD *)(v0 + 24) = sub_2358AF3E8;
      v17 = swift_continuation_init();
      *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
      v18 = (_QWORD *)(v0 + 80);
      v18[1] = 0x40000000;
      v18[2] = sub_2358AF830;
      v18[3] = &block_descriptor;
      v18[4] = v17;
      objc_msgSend(v16, sel_fetchCurrentDeviceIDWithCompletionHandler_, v18);
      return swift_continuation_await();
    }
    v14 = sub_2358BA590();
    swift_bridgeObjectRelease();
    if ((v14 & 1) != 0)
      goto LABEL_6;
  }
  if (qword_2542936E8 != -1)
    swift_once();
  v20 = sub_2358BA2E4();
  __swift_project_value_buffer(v20, (uint64_t)qword_254293740);
  v21 = sub_2358BA2CC();
  v22 = sub_2358BA434();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_2358A8000, v21, v22, "Caller is not running on Settings process. Bailing.", v23, 2u);
    MEMORY[0x23B7DA064](v23, -1, -1);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2358AF3E8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 160) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2358AF448()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v2 = *(_QWORD *)(v0 + 120);
  v1 = *(_QWORD *)(v0 + 128);
  if (qword_2542936E8 != -1)
    swift_once();
  v3 = sub_2358BA2E4();
  __swift_project_value_buffer(v3, (uint64_t)qword_254293740);
  swift_bridgeObjectRetain_n();
  v4 = sub_2358BA2CC();
  v5 = sub_2358BA428();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v13 = v7;
    *(_DWORD *)v6 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 80) = sub_2358ACD9C(v2, v1, &v13);
    sub_2358BA464();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2358A8000, v4, v5, "iCloud backup device id: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DA064](v7, -1, -1);
    MEMORY[0x23B7DA064](v6, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v8 = *(void **)(v0 + 144);
  v9 = *(void **)(v0 + 152);
  v10 = (void *)sub_2358BA32C();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_2358BA32C();
  objc_msgSend(v8, sel_setValue_forHTTPHeaderField_, v10, v11);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2358AF64C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  void *v14;

  swift_willThrow();
  if (qword_2542936E8 != -1)
    swift_once();
  v1 = *(void **)(v0 + 160);
  v2 = sub_2358BA2E4();
  __swift_project_value_buffer(v2, (uint64_t)qword_254293740);
  v3 = v1;
  v4 = v1;
  v5 = sub_2358BA2CC();
  v6 = sub_2358BA434();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 160);
  if (v7)
  {
    v14 = *(void **)(v0 + 152);
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 80) = v12;
    sub_2358BA464();
    *v10 = v12;

    _os_log_impl(&dword_2358A8000, v5, v6, "Failed to fetch iCloud backup device id w/ error: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256306C80);
    swift_arrayDestroy();
    MEMORY[0x23B7DA064](v10, -1, -1);
    MEMORY[0x23B7DA064](v9, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2358AF830(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254293718);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    v8 = sub_2358BA350();
    v9 = *(uint64_t **)(*(_QWORD *)(v3 + 64) + 40);
    *v9 = v8;
    v9[1] = v10;
    return swift_continuation_throwingResume();
  }
}

void sub_2358AF8B8(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;
  uint8_t *v4;
  const char *v5;
  uint64_t v6;
  NSObject *oslog;

  if (a1 && objc_msgSend(a1, sel_signURLRequest_isUserInitiated_, v1, 1))
  {
    if (qword_2542936E8 != -1)
      swift_once();
    v2 = sub_2358BA2E4();
    __swift_project_value_buffer(v2, (uint64_t)qword_254293740);
    oslog = sub_2358BA2CC();
    v3 = sub_2358BA440();
    if (os_log_type_enabled(oslog, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      v5 = "GS Request signed successfully!";
LABEL_11:
      _os_log_impl(&dword_2358A8000, oslog, v3, v5, v4, 2u);
      MEMORY[0x23B7DA064](v4, -1, -1);
    }
  }
  else
  {
    if (qword_2542936E8 != -1)
      swift_once();
    v6 = sub_2358BA2E4();
    __swift_project_value_buffer(v6, (uint64_t)qword_254293740);
    oslog = sub_2358BA2CC();
    v3 = sub_2358BA434();
    if (os_log_type_enabled(oslog, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      v5 = "Unable to sign grandslam request";
      goto LABEL_11;
    }
  }

}

uint64_t sub_2358AFA28(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;

  v1 = objc_msgSend(a1, sel_aa_personID);
  if (v1)
  {
    v2 = v1;
    v3 = sub_2358BA350();
    v5 = v4;

  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  result = (uint64_t)objc_msgSend((id)objc_opt_self(), sel_defaultStore);
  if (result)
  {
    v7 = (void *)result;
    v8 = objc_msgSend((id)result, sel_aa_primaryAppleAccount);

    v9 = 0x65736C6166;
    if (v8)
    {
      v10 = objc_msgSend(v8, sel_aa_personID);

      if (v10)
      {
        v11 = sub_2358BA350();
        v13 = v12;

        if (v5)
        {
          if (v11 != v3 || v5 != v13)
          {
            v15 = sub_2358BA590();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v15 & 1) != 0)
              return 1702195828;
            return v9;
          }
          swift_bridgeObjectRelease();
          v9 = 1702195828;
        }
      }
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  __break(1u);
  return result;
}

void sub_2358AFBA8(char a1)
{
  uint64_t inited;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256306B28);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2358BAEB0;
  *(_QWORD *)(inited + 32) = sub_2358BA350();
  *(_QWORD *)(inited + 40) = v3;
  __asm { BR              X12 }
}

unint64_t sub_2358AFC60()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v1 + 3;
  v3 = v1 + 4;
  v4 = v1 + 13;
  v5 = MEMORY[0x24BEE0D00];
  v0[9] = MEMORY[0x24BEE0D00];
  v0[6] = v4;
  v0[7] = 0x80000002358BB9A0;
  v0[10] = sub_2358BA350();
  v0[11] = v6;
  v0[15] = v5;
  v0[12] = v3;
  v0[13] = 0x80000002358BBAC0;
  v0[16] = sub_2358BA350();
  v0[17] = v7;
  v0[21] = v5;
  v0[18] = v2;
  v0[19] = 0x80000002358BBB60;
  return sub_2358AAC60((uint64_t)v0);
}

uint64_t sub_2358AFE44(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (*v6)(void *, uint64_t, void *);
  uint64_t v7;
  id v8;
  id v9;

  v6 = *(void (**)(void *, uint64_t, void *))(a1 + 32);
  if (a3)
    v7 = sub_2358BA3B0();
  else
    v7 = 0;
  swift_retain();
  v8 = a2;
  v9 = a4;
  v6(a2, v7, a4);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t BAARequestSigner.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2358AB2A0(v1 + OBJC_IVAR____TtC14ACSEFoundation16BAARequestSigner_date, a1, &qword_256306C88);
}

id BAARequestSigner.__allocating_init(date:)(uint64_t a1)
{
  objc_class *v1;
  uint64_t v3;
  char *v4;
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  _OWORD v10[2];
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256306C88);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_allocWithZone(v1);
  sub_2358AB2A0(a1, (uint64_t)v4, &qword_256306C88);
  v6 = (objc_class *)type metadata accessor for BAARequestSigner();
  memset(v10, 0, sizeof(v10));
  v11 = 0;
  v7 = objc_allocWithZone(v6);
  v8 = sub_2358B0354((uint64_t)v4, (uint64_t)v10);
  sub_2358AE980(a1, &qword_256306C88);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

id BAARequestSigner.init(date:)(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  objc_class *v4;
  id v5;
  id v6;
  _OWORD v8[2];
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256306C88);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2358AB2A0(a1, (uint64_t)v3, &qword_256306C88);
  v4 = (objc_class *)type metadata accessor for BAARequestSigner();
  memset(v8, 0, sizeof(v8));
  v9 = 0;
  v5 = objc_allocWithZone(v4);
  v6 = sub_2358B0354((uint64_t)v3, (uint64_t)v8);
  sub_2358AE980(a1, &qword_256306C88);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

uint64_t type metadata accessor for BAARequestSigner()
{
  uint64_t result;

  result = qword_256306D08;
  if (!qword_256306D08)
    return swift_getSingletonMetadata();
  return result;
}

id sub_2358B0354(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v5;
  id v6;
  id v7;
  objc_super v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  ValueMetadata *v13;
  _UNKNOWN **v14;

  sub_2358AB2A0(a1, (uint64_t)v2 + OBJC_IVAR____TtC14ACSEFoundation16BAARequestSigner_date, &qword_256306C88);
  sub_2358AB2A0(a2, (uint64_t)&v10, &qword_256306DA8);
  if (v11)
  {
    sub_2358AD608(&v10, (uint64_t)&v12);
    v5 = v2;
  }
  else
  {
    v13 = &type metadata for DeviceIdentityCertificateFetcher;
    v14 = &off_2506E1360;
    v6 = v2;
    sub_2358AE980((uint64_t)&v10, &qword_256306DA8);
  }
  sub_2358AD608(&v12, (uint64_t)v2 + OBJC_IVAR____TtC14ACSEFoundation16BAARequestSigner_baaCertificateFetcher);

  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for BAARequestSigner();
  v7 = objc_msgSendSuper2(&v9, sel_init);
  sub_2358AE980(a2, &qword_256306DA8);
  sub_2358AE980(a1, &qword_256306C88);
  return v7;
}

uint64_t sub_2358B0450(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542936D0);
  v3[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2358B04B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _BYTE *v10;
  uint64_t v12;
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
  _QWORD *v26;
  _QWORD *v27;

  v1 = *(_QWORD *)(v0 + 88);
  sub_2358BA158();
  v2 = sub_2358BA1C4();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  v5 = *(_QWORD *)(v0 + 88);
  if (v4 == 1)
  {
    sub_2358AE980(*(_QWORD *)(v0 + 88), &qword_2542936D0);
    if (qword_2542936E8 != -1)
      swift_once();
    v6 = sub_2358BA2E4();
    __swift_project_value_buffer(v6, (uint64_t)qword_254293740);
    v7 = sub_2358BA2CC();
    v8 = sub_2358BA434();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2358A8000, v7, v8, "Attempted to BAA sign request with no path", v9, 2u);
      MEMORY[0x23B7DA064](v9, -1, -1);
    }

    sub_2358AB24C();
    swift_allocError();
    *v10 = 0;
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v13 = *(_QWORD *)(v0 + 64);
    v12 = *(_QWORD *)(v0 + 72);
    v14 = sub_2358BA1AC();
    v16 = v15;
    *(_QWORD *)(v0 + 96) = v15;
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v2);
    v17 = sub_2358BA170();
    *(_QWORD *)(v0 + 104) = v17;
    v18 = *(_QWORD *)(v17 - 8);
    *(_QWORD *)(v0 + 112) = v18;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v13, v12, v17);
    if (qword_2542936E8 != -1)
      swift_once();
    v19 = sub_2358BA2E4();
    __swift_project_value_buffer(v19, (uint64_t)qword_254293740);
    v20 = sub_2358BA2CC();
    v21 = sub_2358BA428();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_2358A8000, v20, v21, "Fetching BAA signing credentials", v22, 2u);
      MEMORY[0x23B7DA064](v22, -1, -1);
    }
    v23 = *(_QWORD *)(v0 + 80);

    v24 = v23 + OBJC_IVAR____TtC14ACSEFoundation16BAARequestSigner_date;
    v25 = v23 + OBJC_IVAR____TtC14ACSEFoundation16BAARequestSigner_baaCertificateFetcher;
    v26 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 120) = v26;
    v26[2] = v25;
    v26[3] = v24;
    v26[4] = v14;
    v26[5] = v16;
    v27 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256306CA0);
    *v27 = v0;
    v27[1] = sub_2358B07D4;
    return sub_2358BA59C();
  }
}

uint64_t sub_2358B07D4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2358B0840()
{
  uint64_t v0;
  __SecCertificate *v1;
  __SecCertificate *v2;
  CFDataRef v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  CFDataRef v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  swift_bridgeObjectRelease();
  v14 = *(_QWORD *)(v0 + 24);
  v15 = *(_QWORD *)(v0 + 16);
  v12 = *(_QWORD *)(v0 + 40);
  v13 = *(_QWORD *)(v0 + 32);
  v1 = *(__SecCertificate **)(v0 + 48);
  v2 = *(__SecCertificate **)(v0 + 56);
  sub_2358BA1DC();
  sub_2358BA164();
  swift_bridgeObjectRelease();
  sub_2358BA1DC();
  sub_2358BA164();
  swift_bridgeObjectRelease();
  v3 = SecCertificateCopyData(v1);
  v4 = sub_2358BA1E8();
  v6 = v5;

  v16 = v4;
  v17 = v6;
  v7 = SecCertificateCopyData(v2);
  v8 = sub_2358BA1E8();
  v10 = v9;

  sub_2358BA1F4();
  sub_2358B2524(v16, v17);
  sub_2358BA1DC();
  sub_2358B2568(v16, v17);
  sub_2358BA164();
  swift_bridgeObjectRelease();
  sub_2358B2568(v8, v10);

  sub_2358B2568(v13, v12);
  sub_2358B2568(v15, v14);
  sub_2358B2568(v16, v17);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2358B0A10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v3, v2);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2358B0BA4(uint64_t a1, const void *a2, void *a3)
{
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v3[2] = a3;
  v6 = sub_2358BA170();
  v3[3] = v6;
  v3[4] = *(_QWORD *)(v6 - 8);
  v7 = swift_task_alloc();
  v3[5] = v7;
  v8 = swift_task_alloc();
  v3[6] = v8;
  v3[7] = _Block_copy(a2);
  sub_2358BA14C();
  a3;
  v9 = (_QWORD *)swift_task_alloc();
  v3[8] = v9;
  *v9 = v3;
  v9[1] = sub_2358B0C78;
  return sub_2358B0450(v8, v7);
}

uint64_t sub_2358B0C78()
{
  void *v0;
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);

  v2 = (_QWORD *)*v1;
  v4 = *(_QWORD *)(*v1 + 32);
  v3 = *(_QWORD *)(*v1 + 40);
  v6 = *(void **)(*v1 + 16);
  v5 = *(_QWORD *)(*v1 + 24);
  v7 = *v1;
  swift_task_dealloc();
  v8 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v8(v3, v5);

  if (v0)
  {
    v9 = sub_2358BA194();

    v10 = 0;
    v11 = (void *)v9;
  }
  else
  {
    v12 = v2[6];
    v13 = v2[3];
    v10 = sub_2358BA140();
    v8(v12, v13);
    v9 = 0;
    v11 = (void *)v10;
  }
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))v2[7];
  v14[2](v14, v10, v9);

  _Block_release(v14);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v7 + 8))();
}

void sub_2358B0D6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t inited;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unint64_t v33;
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
  uint64_t v44;
  uint64_t (*v45)(uint64_t, void *, uint64_t, void *);
  void *v46;
  void (*v47)(void *, uint64_t, void *);
  uint64_t v48;

  v41 = a4;
  v42 = a5;
  v39 = a3;
  v37 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256306C88);
  v38 = *(_QWORD *)(v5 - 8);
  v40 = *(_QWORD *)(v38 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v36 = (uint64_t)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256306D78);
  v7 = *(_QWORD *)(v35 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v35);
  v34 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2358BA2FC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256306D80);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2358BAEB0;
  v43 = sub_2358BA350();
  v44 = v14;
  v15 = MEMORY[0x24BEE0D00];
  sub_2358BA4A0();
  *(_QWORD *)(inited + 96) = v15;
  *(_QWORD *)(inited + 72) = 4608835;
  *(_QWORD *)(inited + 80) = 0xE300000000000000;
  v43 = sub_2358BA350();
  v44 = v16;
  sub_2358BA4A0();
  *(_QWORD *)(inited + 168) = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 144) = 129600;
  v43 = sub_2358BA350();
  v44 = v17;
  sub_2358BA4A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256306D88);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_2358BB000;
  *(_QWORD *)(v18 + 32) = sub_2358BA350();
  *(_QWORD *)(v18 + 40) = v19;
  *(_QWORD *)(v18 + 48) = sub_2358BA350();
  *(_QWORD *)(v18 + 56) = v20;
  *(_QWORD *)(inited + 240) = __swift_instantiateConcreteTypeFromMangledName(&qword_256306D90);
  *(_QWORD *)(inited + 216) = v18;
  v33 = sub_2358AAD94(inited);
  sub_2358B2FF4();
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BEE5490], v9);
  v21 = (void *)sub_2358BA44C();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v22 = v34;
  v23 = v35;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v34, v37, v35);
  v24 = v36;
  sub_2358AB2A0(v39, v36, &qword_256306C88);
  v25 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v26 = (v8 + *(unsigned __int8 *)(v38 + 80) + v25) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
  v27 = (v40 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
  v28 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v28 + v25, v22, v23);
  sub_2358B3124(v24, v28 + v26);
  v29 = (_QWORD *)(v28 + v27);
  v30 = v42;
  *v29 = v41;
  v29[1] = v30;
  swift_bridgeObjectRetain();
  v31 = (void *)sub_2358BA308();
  v47 = sub_2358B316C;
  v48 = v28;
  v43 = MEMORY[0x24BDAC760];
  v44 = 1107296256;
  v45 = sub_2358AFE44;
  v46 = &block_descriptor_0;
  v32 = _Block_copy(&v43);
  swift_retain();
  swift_release();
  DeviceIdentityIssueClientCertificateWithCompletion();
  _Block_release(v32);
  swift_release();

  swift_bridgeObjectRelease();
}

void sub_2358B1170(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, __SecKey *a6, __SecKey *a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFDataRef Signature;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  __SecKey *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE *v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  _BYTE *v54;
  uint64_t v55;
  _BYTE *v56;
  id v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  BOOL v61;
  uint8_t *v62;
  uint64_t v63;
  _BYTE *v64;
  uint64_t v65;
  double v66;
  double v67;
  double v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  _BYTE *v72;
  SecKeyRef v73;
  const __CFString *v74;
  const __CFData *v75;
  uint64_t v76;
  NSObject *v77;
  os_log_type_t v78;
  uint8_t *v79;
  const __CFData *v80;
  CFErrorRef v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  uint64_t v89;
  NSObject *v90;
  os_log_type_t v91;
  uint8_t *v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  NSObject *v97;
  os_log_type_t v98;
  uint8_t *v99;
  uint64_t v100;
  _BYTE *v101;
  uint64_t v102;
  _BYTE *v103;
  SecKeyRef v104[3];
  uint8_t *v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  CFErrorRef v111;
  uint64_t v112;
  id v113;
  id v114;
  CFErrorRef error[3];

  v104[2] = a7;
  v104[1] = a6;
  v105 = (uint8_t *)a5;
  v107 = a4;
  error[1] = *(CFErrorRef *)MEMORY[0x24BDAC8D0];
  v10 = sub_2358BA374();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v104 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_2358BA23C();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  Signature = (CFDataRef)((char *)v104 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256306C88);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v104 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = a1;
  if (a1)
  {
    if (a3)
    {
      v21 = v106;
      v22 = v106;
      v23 = a3;
      if (qword_2542936E8 != -1)
        swift_once();
      v24 = sub_2358BA2E4();
      __swift_project_value_buffer(v24, (uint64_t)qword_254293740);
      v25 = a3;
      v26 = a3;
      v27 = sub_2358BA2CC();
      v28 = sub_2358BA434();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = (uint8_t *)swift_slowAlloc();
        v30 = swift_slowAlloc();
        v109 = v30;
        *(_DWORD *)v29 = 136315138;
        swift_getErrorValue();
        v31 = sub_2358BA5CC();
        error[0] = (CFErrorRef)sub_2358ACD9C(v31, v32, &v109);
        sub_2358BA464();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_2358A8000, v27, v28, "Unable to get BAA certificates. Error: %s", v29, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B7DA064](v30, -1, -1);
        MEMORY[0x23B7DA064](v29, -1, -1);
      }
      else
      {

      }
      sub_2358AB24C();
      v47 = swift_allocError();
      *v48 = 1;
      v109 = v47;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256306D78);
      sub_2358BA3D4();

      goto LABEL_32;
    }
    if (!a2)
    {
      v57 = v106;
      goto LABEL_27;
    }
    v43 = (__SecKey *)v106;
    v44 = sub_2358B1F44(a2);
    if (!v44)
    {
LABEL_27:
      if (qword_2542936E8 != -1)
        swift_once();
      v58 = sub_2358BA2E4();
      __swift_project_value_buffer(v58, (uint64_t)qword_254293740);
      v59 = sub_2358BA2CC();
      v60 = sub_2358BA434();
      v61 = os_log_type_enabled(v59, v60);
      v21 = v106;
      if (v61)
      {
        v62 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v62 = 0;
        _os_log_impl(&dword_2358A8000, v59, v60, "Unable to get BAA certificates. Unknown error.", v62, 2u);
        MEMORY[0x23B7DA064](v62, -1, -1);
      }

      sub_2358AB24C();
      v63 = swift_allocError();
      *v64 = 1;
      v109 = v63;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256306D78);
      sub_2358BA3D4();
      goto LABEL_32;
    }
    v45 = v44;
    v104[0] = v43;
    v46 = v44 & 0xFFFFFFFFFFFFFF8;
    if (v44 >> 62)
    {
      swift_bridgeObjectRetain();
      v65 = sub_2358BA518();
      swift_bridgeObjectRelease();
      if (v65 < 2)
        goto LABEL_16;
    }
    else if (*(uint64_t *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2)
    {
LABEL_16:
      swift_bridgeObjectRelease();
      goto LABEL_27;
    }
    sub_2358AB2A0((uint64_t)v105, (uint64_t)v20, &qword_256306C88);
    if ((*(unsigned int (**)(char *, uint64_t, unint64_t))(v15 + 48))(v20, 1, v14) == 1)
    {
      sub_2358AE980((uint64_t)v20, &qword_256306C88);
      sub_2358BA224();
      v20 = (char *)Signature;
    }
    sub_2358BA20C();
    v67 = v66;
    (*(void (**)(char *, unint64_t))(v15 + 8))(v20, v14);
    v68 = v67 * 1000.0;
    if ((~COERCE__INT64(v67 * 1000.0) & 0x7FF0000000000000) != 0)
    {
      if (v68 > -1.0)
      {
        if (v68 < 1.84467441e19)
        {
          v109 = (unint64_t)v68;
          v109 = sub_2358BA560();
          v110 = v69;
          swift_bridgeObjectRetain();
          sub_2358BA398();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_2358BA398();
          swift_bridgeObjectRelease();
          sub_2358BA368();
          v15 = sub_2358BA35C();
          v14 = v70;
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
          if (v14 >> 60 == 15)
          {
            swift_bridgeObjectRelease();
            sub_2358AB24C();
            v71 = swift_allocError();
            *v72 = 4;
            v109 = v71;
            __swift_instantiateConcreteTypeFromMangledName(&qword_256306D78);
            sub_2358BA3D4();
            v73 = v104[0];

            return;
          }
          error[0] = 0;
          v74 = (const __CFString *)*MEMORY[0x24BDE92D0];
          v75 = (const __CFData *)sub_2358BA1D0();
          Signature = SecKeyCreateSignature(v104[0], v74, v75, error);

          if (!Signature)
          {
            swift_bridgeObjectRelease();
            v81 = error[0];
            if (!error[0])
            {
              if (qword_2542936E8 != -1)
                swift_once();
              v96 = sub_2358BA2E4();
              __swift_project_value_buffer(v96, (uint64_t)qword_254293740);
              v97 = sub_2358BA2CC();
              v98 = sub_2358BA434();
              if (os_log_type_enabled(v97, v98))
              {
                v99 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)v99 = 0;
                _os_log_impl(&dword_2358A8000, v97, v98, "BAA signature was empty", v99, 2u);
                MEMORY[0x23B7DA064](v99, -1, -1);
              }

              sub_2358AB24C();
              v100 = swift_allocError();
              *v101 = 3;
              v109 = v100;
              __swift_instantiateConcreteTypeFromMangledName(&qword_256306D78);
              sub_2358BA3D4();
              sub_2358B3224(v15, v14);
              v21 = v106;
              goto LABEL_32;
            }
            if (qword_2542936E8 == -1)
              goto LABEL_52;
            goto LABEL_69;
          }
          v11 = v46;
          if (qword_2542936E8 == -1)
          {
LABEL_43:
            v76 = sub_2358BA2E4();
            __swift_project_value_buffer(v76, (uint64_t)qword_254293740);
            v77 = sub_2358BA2CC();
            v78 = sub_2358BA428();
            if (os_log_type_enabled(v77, v78))
            {
              v79 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v79 = 0;
              _os_log_impl(&dword_2358A8000, v77, v78, "Successfully fetched BAA signing credentials", v79, 2u);
              MEMORY[0x23B7DA064](v79, -1, -1);
            }

            sub_2358B3280(v15, v14);
            v80 = Signature;
            v81 = (CFErrorRef)sub_2358BA1E8();
            v83 = v82;

            if ((v45 & 0xC000000000000001) != 0)
            {
              v86 = (id)MEMORY[0x23B7D9A28](0, v45);
              v87 = (id)MEMORY[0x23B7D9A28](1, v45);
              goto LABEL_49;
            }
            v84 = *(_QWORD *)(v11 + 16);
            if (v84)
            {
              if (v84 != 1)
              {
                v85 = *(void **)(v45 + 40);
                v86 = *(id *)(v45 + 32);
                v87 = v85;
LABEL_49:
                v88 = v87;
                swift_bridgeObjectRelease();
                v109 = v15;
                v110 = v14;
                v111 = v81;
                v112 = v83;
                v113 = v86;
                v114 = v88;
                __swift_instantiateConcreteTypeFromMangledName(&qword_256306D78);
                sub_2358BA3E0();
LABEL_61:
                sub_2358B3224(v15, v14);

                v21 = v106;
LABEL_32:

                return;
              }
            }
            else
            {
              __break(1u);
            }
            __break(1u);
LABEL_69:
            swift_once();
LABEL_52:
            v89 = sub_2358BA2E4();
            __swift_project_value_buffer(v89, (uint64_t)qword_254293740);
            v80 = v81;
            v90 = sub_2358BA2CC();
            v91 = sub_2358BA434();
            if (os_log_type_enabled(v90, v91))
            {
              v92 = (uint8_t *)swift_slowAlloc();
              v93 = swift_slowAlloc();
              v109 = v93;
              *(_DWORD *)v92 = 136315138;
              v105 = v92 + 4;
              v108 = (uint64_t)v80;
              type metadata accessor for CFError(0);
              sub_2358B3238();
              v94 = sub_2358BA5CC();
              v108 = sub_2358ACD9C(v94, v95, &v109);
              sub_2358BA464();

              swift_bridgeObjectRelease();
              _os_log_impl(&dword_2358A8000, v90, v91, "Unable to create BAA signature: %s", v92, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x23B7DA064](v93, -1, -1);
              MEMORY[0x23B7DA064](v92, -1, -1);

            }
            else
            {

            }
            sub_2358AB24C();
            v102 = swift_allocError();
            *v103 = 5;
            v109 = v102;
            __swift_instantiateConcreteTypeFromMangledName(&qword_256306D78);
            sub_2358BA3D4();
            goto LABEL_61;
          }
LABEL_65:
          swift_once();
          goto LABEL_43;
        }
LABEL_64:
        __break(1u);
        goto LABEL_65;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_64;
  }
  if (a3)
  {
    v33 = a3;
    if (qword_2542936E8 != -1)
      swift_once();
    v34 = sub_2358BA2E4();
    __swift_project_value_buffer(v34, (uint64_t)qword_254293740);
    v35 = a3;
    v36 = a3;
    v37 = sub_2358BA2CC();
    v38 = sub_2358BA434();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      v40 = swift_slowAlloc();
      v109 = v40;
      *(_DWORD *)v39 = 136315138;
      swift_getErrorValue();
      v41 = sub_2358BA5CC();
      error[0] = (CFErrorRef)sub_2358ACD9C(v41, v42, &v109);
      sub_2358BA464();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2358A8000, v37, v38, "Unable to get BAA signing keys. Error: %s", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7DA064](v40, -1, -1);
      MEMORY[0x23B7DA064](v39, -1, -1);
    }
    else
    {

    }
    sub_2358AB24C();
    v55 = swift_allocError();
    *v56 = 2;
    v109 = v55;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256306D78);
    sub_2358BA3D4();

  }
  else
  {
    if (qword_2542936E8 != -1)
      swift_once();
    v49 = sub_2358BA2E4();
    __swift_project_value_buffer(v49, (uint64_t)qword_254293740);
    v50 = sub_2358BA2CC();
    v51 = sub_2358BA434();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v52 = 0;
      _os_log_impl(&dword_2358A8000, v50, v51, "Unable to get BAA signing keys. Unknown error.", v52, 2u);
      MEMORY[0x23B7DA064](v52, -1, -1);
    }

    sub_2358AB24C();
    v53 = swift_allocError();
    *v54 = 2;
    v109 = v53;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256306D78);
    sub_2358BA3D4();
  }
}

uint64_t sub_2358B1F44(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  _BYTE v5[32];
  uint64_t v6;

  v6 = MEMORY[0x24BEE4AF8];
  v2 = *(_QWORD *)(a1 + 16);
  sub_2358BA4E8();
  if (!v2)
    return v6;
  for (i = a1 + 32; ; i += 32)
  {
    sub_2358AE940(i, (uint64_t)v5);
    type metadata accessor for SecCertificate(0);
    if (!swift_dynamicCast())
      break;
    sub_2358BA4D0();
    sub_2358BA4F4();
    sub_2358BA500();
    sub_2358BA4DC();
    if (!--v2)
      return v6;
  }
  swift_release();

  return 0;
}

id BAARequestSigner.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void BAARequestSigner.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BAARequestSigner.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BAARequestSigner();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2358B2128(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2358AB8B4;
  return sub_2358B0450(a1, a2);
}

uint64_t RequestSigningError.errorDescription.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2358B21C0 + 4 * byte_2358BB017[*v0]))(0xD000000000000012, 0x80000002358BB9D0);
}

uint64_t sub_2358B21C0(uint64_t a1)
{
  return a1 + 16;
}

uint64_t RequestSigningError.failureReason.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2358B225C + 4 * byte_2358BB01E[*v0]))(0xD000000000000015, 0x80000002358BBAE0);
}

uint64_t sub_2358B225C(uint64_t a1)
{
  return a1 + 4;
}

uint64_t RequestSigningError.recoverySuggestion.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2358B22FC + 4 * byte_2358BB025[*v0]))(0xD000000000000014, 0x80000002358BBB80);
}

unint64_t sub_2358B22FC()
{
  return 0xD000000000000018;
}

uint64_t sub_2358B2318()
{
  return 0x72206120656C6966;
}

uint64_t sub_2358B2338@<X0>(uint64_t a1@<X8>)
{
  return a1 - 3;
}

ACSEFoundation::RequestSigningError_optional __swiftcall RequestSigningError.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 7;
  if ((unint64_t)rawValue < 7)
    v2 = rawValue;
  *v1 = v2;
  return (ACSEFoundation::RequestSigningError_optional)rawValue;
}

void *static RequestSigningError.allCases.getter()
{
  return &unk_2506E0EB8;
}

uint64_t RequestSigningError.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_2358B2398(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2358B23AC()
{
  sub_2358BA608();
  sub_2358BA614();
  return sub_2358BA620();
}

uint64_t sub_2358B23F0()
{
  return sub_2358BA614();
}

uint64_t sub_2358B2418()
{
  sub_2358BA608();
  sub_2358BA614();
  return sub_2358BA620();
}

ACSEFoundation::RequestSigningError_optional sub_2358B2458(Swift::Int *a1)
{
  return RequestSigningError.init(rawValue:)(*a1);
}

void sub_2358B2460(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_2358B2478()
{
  unsigned __int8 *v0;

  return *v0;
}

void sub_2358B2488()
{
  char *v0;

  sub_2358AFBA8(*v0);
}

void sub_2358B2490(_QWORD *a1@<X8>)
{
  *a1 = &unk_2506E0EB8;
}

uint64_t sub_2358B24A0()
{
  sub_2358B2620();
  return sub_2358BA5C0();
}

uint64_t sub_2358B24C8()
{
  sub_2358B2620();
  sub_2358B2F6C();
  sub_2358B2FB0();
  return sub_2358BA5B4();
}

void sub_2358B2518(uint64_t a1)
{
  uint64_t *v1;

  sub_2358B0D6C(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_2358B2524(uint64_t a1, unint64_t a2)
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

uint64_t sub_2358B2568(uint64_t a1, unint64_t a2)
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

unint64_t sub_2358B25B0()
{
  unint64_t result;

  result = qword_256306CB0;
  if (!qword_256306CB0)
  {
    result = MEMORY[0x23B7D9FF8](&protocol conformance descriptor for RequestSigningError, &type metadata for RequestSigningError);
    atomic_store(result, (unint64_t *)&qword_256306CB0);
  }
  return result;
}

unint64_t sub_2358B25F4(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_2358B2620();
  result = sub_2358B2664();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_2358B2620()
{
  unint64_t result;

  result = qword_256306CB8;
  if (!qword_256306CB8)
  {
    result = MEMORY[0x23B7D9FF8](&protocol conformance descriptor for RequestSigningError, &type metadata for RequestSigningError);
    atomic_store(result, (unint64_t *)&qword_256306CB8);
  }
  return result;
}

unint64_t sub_2358B2664()
{
  unint64_t result;

  result = qword_256306CC0;
  if (!qword_256306CC0)
  {
    result = MEMORY[0x23B7D9FF8](&protocol conformance descriptor for RequestSigningError, &type metadata for RequestSigningError);
    atomic_store(result, (unint64_t *)&qword_256306CC0);
  }
  return result;
}

unint64_t sub_2358B26B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256306CC8;
  if (!qword_256306CC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256306CD0);
    result = MEMORY[0x23B7D9FF8](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_256306CC8);
  }
  return result;
}

uint64_t dispatch thunk of RequestSigning.sign(request:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 8) + *(_QWORD *)(a4 + 8));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_2358AB8B4;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_2358B2784()
{
  return type metadata accessor for BAARequestSigner();
}

void sub_2358B278C()
{
  unint64_t v0;

  sub_2358B2890();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for BAARequestSigner()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BAARequestSigner.sign(request:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  v6 = *(int **)((*MEMORY[0x24BEE4EA0] & *v2) + 0x68);
  v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_2358AEA58;
  return v9(a1, a2);
}

void sub_2358B2890()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256306D20)
  {
    sub_2358BA23C();
    v0 = sub_2358BA458();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256306D20);
  }
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RequestSigningError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for RequestSigningError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_2358B29D0 + 4 * byte_2358BB031[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_2358B2A04 + 4 * byte_2358BB02C[v4]))();
}

uint64_t sub_2358B2A04(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2358B2A0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2358B2A14);
  return result;
}

uint64_t sub_2358B2A20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2358B2A28);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_2358B2A2C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2358B2A34(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2358B2A40(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2358B2A4C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RequestSigningError()
{
  return &type metadata for RequestSigningError;
}

uint64_t sub_2358B2A64()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_2358B2A98()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  const void *v3;
  void *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = (const void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_2358AB8B4;
  return ((uint64_t (*)(uint64_t, const void *, void *))((char *)&dword_256306D28 + dword_256306D28))(v2, v3, v4);
}

uint64_t sub_2358B2B04(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_2358AEA58;
  return v6();
}

uint64_t sub_2358B2B5C()
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
  v5[1] = sub_2358AEA58;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_256306D38 + dword_256306D38))(v2, v3, v4);
}

uint64_t sub_2358B2BD4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_2358AEA58;
  return v7();
}

uint64_t objectdestroy_7Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2358B2C58(uint64_t a1)
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
  v7[1] = sub_2358AEA58;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_256306D48 + dword_256306D48))(a1, v4, v5, v6);
}

uint64_t sub_2358B2CDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2358BA3F8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2358BA3EC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2358AE980(a1, &qword_2542936F8);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2358BA3C8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2358B2E28(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2358B2E8C;
  return v6(a1);
}

uint64_t sub_2358B2E8C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2358B2ED8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2358B2EFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2358AEA58;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256306D58 + dword_256306D58))(a1, v4);
}

unint64_t sub_2358B2F6C()
{
  unint64_t result;

  result = qword_256306D68;
  if (!qword_256306D68)
  {
    result = MEMORY[0x23B7D9FF8](&protocol conformance descriptor for RequestSigningError, &type metadata for RequestSigningError);
    atomic_store(result, (unint64_t *)&qword_256306D68);
  }
  return result;
}

unint64_t sub_2358B2FB0()
{
  unint64_t result;

  result = qword_256306D70;
  if (!qword_256306D70)
  {
    result = MEMORY[0x23B7D9FF8](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_256306D70);
  }
  return result;
}

unint64_t sub_2358B2FF4()
{
  unint64_t result;

  result = qword_256306D98;
  if (!qword_256306D98)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256306D98);
  }
  return result;
}

uint64_t sub_2358B3030()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256306D78);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256306C88) - 8);
  v6 = (v3 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  v7 = sub_2358BA23C();
  v8 = *(_QWORD *)(v7 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v8 + 48))(v0 + v6, 1, v7))
    (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v0 + v6, v7);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2358B3124(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256306C88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_2358B316C(void *a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  __SecKey **v12;

  v7 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256306D78) - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256306C88) - 8);
  v11 = (v8 + v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v12 = (__SecKey **)(v3 + ((*(_QWORD *)(v10 + 64) + v11 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_2358B1170(a1, a2, a3, v3 + v8, v3 + v11, *v12, v12[1]);
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

uint64_t sub_2358B3224(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2358B2568(a1, a2);
  return a1;
}

unint64_t sub_2358B3238()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256306DA0;
  if (!qword_256306DA0)
  {
    type metadata accessor for CFError(255);
    result = MEMORY[0x23B7D9FF8](MEMORY[0x24BDCFD90], v1);
    atomic_store(result, (unint64_t *)&qword_256306DA0);
  }
  return result;
}

uint64_t sub_2358B3280(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2358B2524(a1, a2);
  return a1;
}

ValueMetadata *type metadata accessor for DeviceIdentityCertificateFetcher()
{
  return &type metadata for DeviceIdentityCertificateFetcher;
}

uint64_t initializeBufferWithCopyOfBuffer for NetworkError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_2358B32FC + 4 * byte_2358BB2B0[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

void destroy for NetworkError(id *a1)
{
  uint64_t v2;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:

      break;
    case 1u:
    case 2u:
      swift_bridgeObjectRelease();
      break;
    case 3u:
      v2 = sub_2358BA170();
      (*(void (**)(id *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
      break;
    default:
      return;
  }
}

void initializeWithCopy for NetworkError()
{
  char *v0;

  v0 = (char *)sub_2358B3480 + 4 * byte_2358BB2B8[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void **sub_2358B3480()
{
  void **v0;
  void **v1;
  void *v2;
  id v3;

  v2 = *v1;
  *v0 = *v1;
  v3 = v2;
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithCopy for NetworkError(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_2358B3614(result);
    v2 = (char *)&loc_2358B356C + 4 * byte_2358BB2BC[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

uint64_t sub_2358B3614(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for NetworkError();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for NetworkError()
{
  uint64_t result;

  result = qword_256306E20;
  if (!qword_256306E20)
    return swift_getSingletonMetadata();
  return result;
}

void *initializeWithTake for NetworkError(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 3)
  {
    v6 = sub_2358BA170();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for NetworkError(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_2358B3614((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      v6 = sub_2358BA170();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkError(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for NetworkError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_2358B37D0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2358B37E0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2358BA170();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_2358B385C()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t result;

  v0 = objc_allocWithZone(MEMORY[0x24BDD17C8]);
  v1 = (void *)sub_2358BA32C();
  v2 = objc_msgSend(v0, sel_initWithString_, v1);

  sub_2358BA350();
  v3 = sub_2358BA32C();

  result = swift_bridgeObjectRelease();
  qword_2542936D8 = v3;
  return result;
}

id ACAccountDataclassQuota.getter()
{
  if (qword_254293628 != -1)
    swift_once();
  return (id)qword_2542936D8;
}

id sub_2358B3930()
{
  _QWORD *v0;
  void *v1;
  id v2;
  id v3;

  v1 = (void *)v0[3];
  v2 = v1;
  if (v1 == (void *)1)
  {
    v2 = sub_2358B3980(v0);
    v0[3] = v2;
    v3 = v2;
  }
  sub_2358B6B68(v1);
  return v2;
}

id sub_2358B3980(_QWORD *a1)
{
  void *v2;
  id v3;
  id result;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_defaultStore);
  result = objc_msgSend(v2, sel_defaultStore);
  if (result)
  {
    v5 = result;
    v6 = objc_msgSend(result, sel_aida_accountForiCloudAccount_, *a1);

    v7 = objc_allocWithZone(MEMORY[0x24BE049B0]);
    v8 = (void *)sub_2358BA32C();
    v9 = objc_msgSend(v7, sel_initWithAccountStore_grandSlamAccount_appTokenID_, v3, v6, v8);

    if (v9)
      objc_msgSend(v9, sel_setUseAltDSID_, 1);
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t NetworkController.init(account:accountDataclass:urlSession:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  a4[3] = 1;
  return result;
}

uint64_t NetworkController.fetchData(forURLKey:additionalHeaders:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4[2] = a3;
  v4[3] = v3;
  v7 = sub_2358BA1C4();
  v4[4] = v7;
  v4[5] = *(_QWORD *)(v7 - 8);
  v8 = swift_task_alloc();
  v4[6] = v8;
  v9 = (_QWORD *)swift_task_alloc();
  v4[7] = v9;
  *v9 = v4;
  v9[1] = sub_2358B3B28;
  return NetworkController.fetchURL(forKey:)(v8, a1, a2);
}

uint64_t sub_2358B3B28()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2358B3B8C()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = v0[2];
  v2 = objc_allocWithZone(MEMORY[0x24BDD16B0]);
  v3 = (void *)sub_2358BA1A0();
  v4 = objc_msgSend(v2, sel_initWithURL_cachePolicy_timeoutInterval_, v3, 1, 30.0);
  v0[9] = v4;

  if (v1)
  {
    *(_QWORD *)(swift_task_alloc() + 16) = v4;
    v5 = swift_bridgeObjectRetain();
    sub_2358B6688(v5, sub_2358B57AC);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
  }
  v6 = (_QWORD *)swift_task_alloc();
  v0[10] = v6;
  *v6 = v0;
  v6[1] = sub_2358B3C74;
  return NetworkController.fetchData(forURLRequest:)((uint64_t)v4);
}

uint64_t sub_2358B3C74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;

  v8 = *(_QWORD **)v4;
  *(_QWORD *)(*(_QWORD *)v4 + 88) = v3;
  swift_task_dealloc();
  if (!v3)
  {
    v8[12] = a3;
    v8[13] = a2;
    v8[14] = a1;
  }
  return swift_task_switch();
}

uint64_t sub_2358B3CFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 32);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 96));
}

uint64_t sub_2358B3D60()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2358B3D94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 32);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t NetworkController.fetchURL(forKey:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[14] = a3;
  v4[15] = v3;
  v4[12] = a1;
  v4[13] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542936D0);
  v4[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2358B3E50()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  void *v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  os_log_type_t v34;
  _BOOL4 v35;
  void *v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  _QWORD *v44;
  id v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  _BOOL4 v59;
  unint64_t v60;
  uint64_t v61;
  uint8_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t (*v67)(void);
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71[2];

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(void **)v1;
  v3 = *(void **)(v1 + 8);
  *(_QWORD *)(v0 + 136) = v3;
  v4 = objc_msgSend(v2, sel_propertiesForDataclass_, v3);
  if (v4)
  {
    v5 = v4;
    v6 = sub_2358BA314();

    v7 = sub_2358B57B4(v6);
    swift_bridgeObjectRelease();
    if (v7)
    {
      v8 = v3;
      swift_bridgeObjectRelease();
      v9 = objc_msgSend(**(id **)(v0 + 120), sel_propertiesForDataclass_, *(_QWORD *)(*(_QWORD *)(v0 + 120) + 8));
      if (!v9
        || (v10 = v9,
            v11 = sub_2358BA314(),
            v10,
            v12 = sub_2358B57B4(v11),
            swift_bridgeObjectRelease(),
            !v12))
      {
        if (qword_2542936E8 != -1)
          swift_once();
        v30 = *(void **)(v0 + 136);
        v31 = sub_2358BA2E4();
        __swift_project_value_buffer(v31, (uint64_t)qword_254293740);
        v32 = v30;
        v33 = sub_2358BA2CC();
        v34 = sub_2358BA434();
        v35 = os_log_type_enabled(v33, v34);
        v36 = *(void **)(v0 + 136);
        if (v35)
        {
          v37 = (uint8_t *)swift_slowAlloc();
          v38 = swift_slowAlloc();
          v71[0] = v38;
          *(_DWORD *)v37 = 136315138;
          v39 = sub_2358BA350();
          *(_QWORD *)(v0 + 64) = sub_2358ACD9C(v39, v40, v71);
          sub_2358BA464();
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_2358A8000, v33, v34, "Still not able to fetch properties for dataclass: %s. Bailing.", v37, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23B7DA064](v38, -1, -1);
          MEMORY[0x23B7DA064](v37, -1, -1);
        }
        else
        {

        }
        v41 = *(void **)(v0 + 136);
        v42 = *(_QWORD *)(v0 + 120);
        type metadata accessor for NetworkError();
        sub_2358B6848();
        swift_allocError();
        v43 = *(void **)(v42 + 8);
        *v44 = v43;
        swift_storeEnumTagMultiPayload();
        v45 = v43;
        goto LABEL_37;
      }
      v13 = (_OWORD *)(v0 + 16);
      if (*(_QWORD *)(v12 + 16))
      {
        v15 = *(_QWORD *)(v0 + 104);
        v14 = *(_QWORD *)(v0 + 112);
        swift_bridgeObjectRetain();
        v16 = sub_2358AD3DC(v15, v14);
        if ((v17 & 1) != 0)
        {
          sub_2358AE940(*(_QWORD *)(v12 + 56) + 32 * v16, v0 + 16);
        }
        else
        {
          *v13 = 0u;
          *(_OWORD *)(v0 + 32) = 0u;
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        *v13 = 0u;
        *(_OWORD *)(v0 + 32) = 0u;
      }
      swift_bridgeObjectRelease();
      if (*(_QWORD *)(v0 + 40))
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v46 = *(_QWORD *)(v0 + 128);
          v48 = *(_QWORD *)(v0 + 48);
          v47 = *(_QWORD *)(v0 + 56);
          sub_2358BA1B8();
          v49 = sub_2358BA1C4();
          v50 = *(_QWORD *)(v49 - 8);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v50 + 48))(v46, 1, v49) != 1)
          {
            v68 = *(_QWORD *)(v0 + 128);
            v69 = *(_QWORD *)(v0 + 96);

            swift_bridgeObjectRelease();
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 32))(v69, v68, v49);
            swift_task_dealloc();
            v67 = *(uint64_t (**)(void))(v0 + 8);
            return v67();
          }
          sub_2358AE980(*(_QWORD *)(v0 + 128), &qword_2542936D0);
          if (qword_2542936E8 != -1)
            swift_once();
          v51 = sub_2358BA2E4();
          __swift_project_value_buffer(v51, (uint64_t)qword_254293740);
          swift_bridgeObjectRetain_n();
          v52 = sub_2358BA2CC();
          v53 = sub_2358BA434();
          if (os_log_type_enabled(v52, v53))
          {
            v54 = (uint8_t *)swift_slowAlloc();
            v55 = swift_slowAlloc();
            *(_DWORD *)v54 = 136315138;
            v71[0] = v55;
            swift_bridgeObjectRetain();
            *(_QWORD *)(v0 + 80) = sub_2358ACD9C(v48, v47, v71);
            sub_2358BA464();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_2358A8000, v52, v53, "Failed to create URL from string: %s", v54, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x23B7DA064](v55, -1, -1);
            MEMORY[0x23B7DA064](v54, -1, -1);
          }
          else
          {
            swift_bridgeObjectRelease_n();
          }

          v41 = *(void **)(v0 + 136);
          type metadata accessor for NetworkError();
          sub_2358B6848();
          swift_allocError();
          *v70 = v48;
          v70[1] = v47;
          swift_storeEnumTagMultiPayload();
LABEL_37:
          swift_willThrow();

          swift_task_dealloc();
          v67 = *(uint64_t (**)(void))(v0 + 8);
          return v67();
        }
      }
      else
      {
        sub_2358AE980(v0 + 16, &qword_256306E80);
      }
      if (qword_2542936E8 != -1)
        swift_once();
      v56 = sub_2358BA2E4();
      __swift_project_value_buffer(v56, (uint64_t)qword_254293740);
      swift_bridgeObjectRetain_n();
      v57 = sub_2358BA2CC();
      v58 = sub_2358BA434();
      v59 = os_log_type_enabled(v57, v58);
      v60 = *(_QWORD *)(v0 + 112);
      if (v59)
      {
        v61 = *(_QWORD *)(v0 + 104);
        v62 = (uint8_t *)swift_slowAlloc();
        v63 = swift_slowAlloc();
        v71[0] = v63;
        *(_DWORD *)v62 = 136315138;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 72) = sub_2358ACD9C(v61, v60, v71);
        sub_2358BA464();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2358A8000, v57, v58, "Failed to fetch URL for key: %s", v62, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B7DA064](v63, -1, -1);
        MEMORY[0x23B7DA064](v62, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      v41 = *(void **)(v0 + 136);
      v65 = *(_QWORD *)(v0 + 104);
      v64 = *(_QWORD *)(v0 + 112);
      type metadata accessor for NetworkError();
      sub_2358B6848();
      swift_allocError();
      *v66 = v65;
      v66[1] = v64;
      swift_storeEnumTagMultiPayload();
      swift_bridgeObjectRetain();
      goto LABEL_37;
    }
  }
  v18 = qword_2542936E8;
  v19 = v3;
  if (v18 != -1)
    swift_once();
  v20 = sub_2358BA2E4();
  __swift_project_value_buffer(v20, (uint64_t)qword_254293740);
  v21 = v19;
  v22 = sub_2358BA2CC();
  v23 = sub_2358BA434();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    v25 = swift_slowAlloc();
    v71[0] = v25;
    *(_DWORD *)v24 = 136315138;
    v26 = sub_2358BA350();
    *(_QWORD *)(v0 + 88) = sub_2358ACD9C(v26, v27, v71);
    sub_2358BA464();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2358A8000, v22, v23, "Failed to fetch properties for dataclass: %s. Trying to renew credentials.", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DA064](v25, -1, -1);
    MEMORY[0x23B7DA064](v24, -1, -1);
  }
  else
  {

  }
  v28 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v28;
  *v28 = v0;
  v28[1] = sub_2358B476C;
  v28[26] = *(_QWORD *)(v0 + 120);
  return swift_task_switch();
}

uint64_t sub_2358B476C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2358B47D0()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  void *v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  _BOOL4 v39;
  unint64_t v40;
  uint64_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t (*v47)(void);
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52[2];

  v1 = objc_msgSend(**(id **)(v0 + 120), sel_propertiesForDataclass_, *(_QWORD *)(*(_QWORD *)(v0 + 120) + 8));
  if (!v1
    || (v2 = v1, v3 = sub_2358BA314(), v2, v4 = sub_2358B57B4(v3), swift_bridgeObjectRelease(), !v4))
  {
    if (qword_2542936E8 != -1)
      swift_once();
    v10 = *(void **)(v0 + 136);
    v11 = sub_2358BA2E4();
    __swift_project_value_buffer(v11, (uint64_t)qword_254293740);
    v12 = v10;
    v13 = sub_2358BA2CC();
    v14 = sub_2358BA434();
    v15 = os_log_type_enabled(v13, v14);
    v16 = *(void **)(v0 + 136);
    if (v15)
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v52[0] = v18;
      *(_DWORD *)v17 = 136315138;
      v19 = sub_2358BA350();
      *(_QWORD *)(v0 + 64) = sub_2358ACD9C(v19, v20, v52);
      sub_2358BA464();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2358A8000, v13, v14, "Still not able to fetch properties for dataclass: %s. Bailing.", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7DA064](v18, -1, -1);
      MEMORY[0x23B7DA064](v17, -1, -1);
    }
    else
    {

    }
    v21 = *(void **)(v0 + 136);
    v22 = *(_QWORD *)(v0 + 120);
    type metadata accessor for NetworkError();
    sub_2358B6848();
    swift_allocError();
    v23 = *(void **)(v22 + 8);
    *v24 = v23;
    swift_storeEnumTagMultiPayload();
    v25 = v23;
    goto LABEL_29;
  }
  v5 = (_OWORD *)(v0 + 16);
  if (*(_QWORD *)(v4 + 16))
  {
    v7 = *(_QWORD *)(v0 + 104);
    v6 = *(_QWORD *)(v0 + 112);
    swift_bridgeObjectRetain();
    v8 = sub_2358AD3DC(v7, v6);
    if ((v9 & 1) != 0)
    {
      sub_2358AE940(*(_QWORD *)(v4 + 56) + 32 * v8, v0 + 16);
    }
    else
    {
      *v5 = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    *v5 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 40))
  {
    sub_2358AE980(v0 + 16, &qword_256306E80);
    goto LABEL_23;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_23:
    if (qword_2542936E8 != -1)
      swift_once();
    v36 = sub_2358BA2E4();
    __swift_project_value_buffer(v36, (uint64_t)qword_254293740);
    swift_bridgeObjectRetain_n();
    v37 = sub_2358BA2CC();
    v38 = sub_2358BA434();
    v39 = os_log_type_enabled(v37, v38);
    v40 = *(_QWORD *)(v0 + 112);
    if (v39)
    {
      v41 = *(_QWORD *)(v0 + 104);
      v42 = (uint8_t *)swift_slowAlloc();
      v43 = swift_slowAlloc();
      v52[0] = v43;
      *(_DWORD *)v42 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 72) = sub_2358ACD9C(v41, v40, v52);
      sub_2358BA464();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2358A8000, v37, v38, "Failed to fetch URL for key: %s", v42, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7DA064](v43, -1, -1);
      MEMORY[0x23B7DA064](v42, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v21 = *(void **)(v0 + 136);
    v45 = *(_QWORD *)(v0 + 104);
    v44 = *(_QWORD *)(v0 + 112);
    type metadata accessor for NetworkError();
    sub_2358B6848();
    swift_allocError();
    *v46 = v45;
    v46[1] = v44;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    goto LABEL_29;
  }
  v26 = *(_QWORD *)(v0 + 128);
  v28 = *(_QWORD *)(v0 + 48);
  v27 = *(_QWORD *)(v0 + 56);
  sub_2358BA1B8();
  v29 = sub_2358BA1C4();
  v30 = *(_QWORD *)(v29 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v26, 1, v29) != 1)
  {
    v49 = *(_QWORD *)(v0 + 128);
    v50 = *(_QWORD *)(v0 + 96);

    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 32))(v50, v49, v29);
    swift_task_dealloc();
    v47 = *(uint64_t (**)(void))(v0 + 8);
    return v47();
  }
  sub_2358AE980(*(_QWORD *)(v0 + 128), &qword_2542936D0);
  if (qword_2542936E8 != -1)
    swift_once();
  v31 = sub_2358BA2E4();
  __swift_project_value_buffer(v31, (uint64_t)qword_254293740);
  swift_bridgeObjectRetain_n();
  v32 = sub_2358BA2CC();
  v33 = sub_2358BA434();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    v35 = swift_slowAlloc();
    v52[0] = v35;
    *(_DWORD *)v34 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 80) = sub_2358ACD9C(v28, v27, v52);
    sub_2358BA464();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2358A8000, v32, v33, "Failed to create URL from string: %s", v34, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DA064](v35, -1, -1);
    MEMORY[0x23B7DA064](v34, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v21 = *(void **)(v0 + 136);
  type metadata accessor for NetworkError();
  sub_2358B6848();
  swift_allocError();
  *v51 = v28;
  v51[1] = v27;
  swift_storeEnumTagMultiPayload();
LABEL_29:
  swift_willThrow();

  swift_task_dealloc();
  v47 = *(uint64_t (**)(void))(v0 + 8);
  return v47();
}

uint64_t sub_2358B4EBC()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_2358B4EF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  id v7;

  v6 = (void *)sub_2358BA32C();
  v7 = (id)sub_2358BA32C();
  objc_msgSend(a5, sel_setValue_forHTTPHeaderField_, v6, v7);

}

uint64_t NetworkController.fetchData(forURLRequest:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[4] = a1;
  v2[5] = v1;
  v3 = sub_2358BA170();
  v2[6] = v3;
  v2[7] = *(_QWORD *)(v3 - 8);
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2358B4FDC()
{
  _QWORD *v0;
  void *v1;
  id *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t *v12;
  uint64_t v13;
  _QWORD *v14;

  v1 = (void *)v0[4];
  v2 = (id *)v0[5];
  sub_2358AEA68();
  v3 = *v2;
  v4 = objc_msgSend(*v2, sel_aa_personID);
  v5 = (void *)sub_2358BA32C();
  objc_msgSend(v1, sel_setValue_forHTTPHeaderField_, v4, v5);

  objc_msgSend(v1, sel_aa_addBasicAuthorizationHeaderWithAccount_preferUsingPassword_, v3, 0);
  objc_msgSend(v1, sel_ak_addAnisetteHeaders);
  sub_2358AFA28(v3);
  v6 = (void *)sub_2358BA32C();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_2358BA32C();
  objc_msgSend(v1, sel_setValue_forHTTPHeaderField_, v6, v7);

  if (objc_msgSend(v3, sel_isProvisionedForDataclass_, *MEMORY[0x24BDB3E38])
    && (objc_msgSend(v3, sel_aa_isManagedAppleID) & 1) == 0)
  {
    v9 = sub_2358B3930();
    sub_2358AF8B8(v9);
  }
  else
  {
    if (qword_2542936E8 != -1)
      swift_once();
    v8 = sub_2358BA2E4();
    __swift_project_value_buffer(v8, (uint64_t)qword_254293740);
    v9 = sub_2358BA2CC();
    v10 = sub_2358BA440();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      MEMORY[0x23B7DA064](v11, -1, -1);
    }
  }
  v12 = (uint64_t *)v0[5];

  v13 = *v12;
  v14 = (_QWORD *)swift_task_alloc();
  v0[10] = v14;
  *v14 = v0;
  v14[1] = sub_2358B5228;
  return sub_2358AEFA8(v13);
}

uint64_t sub_2358B5228()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2358B527C()
{
  uint64_t v0;
  _QWORD *v1;

  sub_2358BA14C();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v1;
  *v1 = v0;
  v1[1] = sub_2358B52E0;
  return sub_2358BA41C();
}

uint64_t sub_2358B52E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v5 = (_QWORD *)*v4;
  v5[12] = a1;
  v5[13] = a2;
  v5[14] = a3;
  v5[15] = v3;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v5[7] + 8))(v5[9], v5[6]);
  return swift_task_switch();
}

uint64_t sub_2358B5360()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  NSObject *v11;
  uint8_t *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  void *v21;
  uint8_t *v22;
  _QWORD *v23;
  id v24;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  NSObject *v34;
  unint64_t v35;

  objc_opt_self();
  v1 = swift_dynamicCastObjCClass();
  v2 = qword_2542936E8;
  if (v1)
  {
    v3 = v1;
    v4 = *(id *)(v0 + 112);
    if (v2 != -1)
      swift_once();
    v5 = *(void **)(v0 + 32);
    v6 = sub_2358BA2E4();
    __swift_project_value_buffer(v6, (uint64_t)qword_254293740);
    v7 = v5;
    v8 = sub_2358BA2CC();
    v9 = sub_2358BA428();
    v10 = os_log_type_enabled(v8, v9);
    v11 = *(NSObject **)(v0 + 32);
    if (v10)
    {
      v34 = *(NSObject **)(v0 + 112);
      v12 = (uint8_t *)swift_slowAlloc();
      v33 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v12 = 138412290;
      *(_QWORD *)(v0 + 24) = v11;
      v13 = v11;
      sub_2358BA464();
      *v33 = v11;

      v14 = v34;
      _os_log_impl(&dword_2358A8000, v8, v9, "Successfully fetched response for request: %@", v12, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256306C80);
      swift_arrayDestroy();
      MEMORY[0x23B7DA064](v33, -1, -1);
      MEMORY[0x23B7DA064](v12, -1, -1);
      v11 = v8;
    }
    else
    {

      v14 = v8;
    }

    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(v0 + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104), v3);
  }
  else
  {
    if (qword_2542936E8 != -1)
      swift_once();
    v15 = *(void **)(v0 + 32);
    v16 = sub_2358BA2E4();
    __swift_project_value_buffer(v16, (uint64_t)qword_254293740);
    v17 = v15;
    v18 = sub_2358BA2CC();
    v19 = sub_2358BA434();
    v20 = os_log_type_enabled(v18, v19);
    v21 = *(void **)(v0 + 32);
    if (v20)
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v22 = 138412290;
      *(_QWORD *)(v0 + 16) = v21;
      v24 = v21;
      sub_2358BA464();
      *v23 = v21;

      _os_log_impl(&dword_2358A8000, v18, v19, "Failed to fetch response for request: %@", v22, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256306C80);
      swift_arrayDestroy();
      MEMORY[0x23B7DA064](v23, -1, -1);
      MEMORY[0x23B7DA064](v22, -1, -1);
    }
    else
    {

    }
    v26 = *(void **)(v0 + 112);
    v35 = *(_QWORD *)(v0 + 104);
    v27 = *(_QWORD *)(v0 + 96);
    v28 = *(_QWORD *)(v0 + 56);
    v29 = *(_QWORD *)(v0 + 64);
    v30 = *(_QWORD *)(v0 + 48);
    type metadata accessor for NetworkError();
    sub_2358B6848();
    swift_allocError();
    v32 = v31;
    sub_2358BA14C();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v32, v29, v30);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();

    sub_2358B2568(v27, v35);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2358B5770()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_2358B57AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_2358B4EF8(a1, a2, a3, a4, *(void **)(v4 + 16));
}

unint64_t sub_2358B57B4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t result;
  int64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  __int128 v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  __int128 v24;
  _OWORD v25[2];
  _OWORD v26[2];
  __int128 v27;
  _OWORD v28[2];
  _OWORD v29[2];
  _OWORD v30[2];
  _OWORD v31[2];
  uint64_t v32;
  _OWORD v33[2];
  _OWORD v34[2];
  uint64_t v35;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254293710);
    v2 = (_QWORD *)sub_2358BA53C();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v23 = a1 + 64;
  v3 = -1;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(a1 + 64);
  v22 = (unint64_t)(63 - v4) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    if (v5)
    {
      v10 = (v5 - 1) & v5;
      v11 = __clz(__rbit64(v5)) | (v7 << 6);
      v12 = v7;
    }
    else
    {
      v13 = v7 + 1;
      if (__OFADD__(v7, 1))
        goto LABEL_37;
      if (v13 >= v22)
      {
LABEL_33:
        sub_2358B6B78();
        return (unint64_t)v2;
      }
      v14 = *(_QWORD *)(v23 + 8 * v13);
      v12 = v7 + 1;
      if (!v14)
      {
        v12 = v7 + 2;
        if (v7 + 2 >= v22)
          goto LABEL_33;
        v14 = *(_QWORD *)(v23 + 8 * v12);
        if (!v14)
        {
          v12 = v7 + 3;
          if (v7 + 3 >= v22)
            goto LABEL_33;
          v14 = *(_QWORD *)(v23 + 8 * v12);
          if (!v14)
          {
            v12 = v7 + 4;
            if (v7 + 4 >= v22)
              goto LABEL_33;
            v14 = *(_QWORD *)(v23 + 8 * v12);
            if (!v14)
            {
              v15 = v7 + 5;
              if (v7 + 5 >= v22)
                goto LABEL_33;
              v14 = *(_QWORD *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  v12 = v15 + 1;
                  if (__OFADD__(v15, 1))
                    goto LABEL_38;
                  if (v12 >= v22)
                    goto LABEL_33;
                  v14 = *(_QWORD *)(v23 + 8 * v12);
                  ++v15;
                  if (v14)
                    goto LABEL_26;
                }
              }
              v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      v10 = (v14 - 1) & v14;
      v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_2358AE4A8(*(_QWORD *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_2358AE940(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_2358AE4A8((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_2358AE980((uint64_t)v30, &qword_254293700);
      swift_bridgeObjectRelease();
      sub_2358B6B78();
      swift_release();
      return 0;
    }
    sub_2358AE940((uint64_t)v31 + 8, (uint64_t)v25);
    sub_2358AE980((uint64_t)v30, &qword_254293700);
    sub_2358AB290(v25, v26);
    v27 = v24;
    sub_2358AB290(v26, v28);
    v16 = v27;
    sub_2358AB290(v28, v29);
    sub_2358AB290(v29, &v27);
    result = sub_2358AD3DC(v16, *((uint64_t *)&v16 + 1));
    v17 = result;
    if ((v18 & 1) != 0)
    {
      v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v8 = v16;
      v9 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
      result = (unint64_t)sub_2358AB290(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    result = (unint64_t)sub_2358AB290(&v27, (_OWORD *)(v2[7] + 32 * result));
    v19 = v2[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_36;
    v2[2] = v21;
LABEL_8:
    v7 = v12;
    v5 = v10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_2358B5B84()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 208) = v0;
  return swift_task_switch();
}

void sub_2358B5B9C()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;

  v1 = **(void ***)(v0 + 208);
  v2 = objc_msgSend(v1, sel_aa_altDSID);
  *(_QWORD *)(v0 + 216) = v2;
  if (v2)
  {
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256306E90);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2358BB000;
    *(_QWORD *)(inited + 32) = sub_2358BA350();
    *(_QWORD *)(inited + 40) = v5;
    *(_BYTE *)(inited + 48) = 1;
    *(_QWORD *)(inited + 56) = sub_2358BA350();
    *(_QWORD *)(inited + 64) = v6;
    *(_BYTE *)(inited + 72) = 1;
    v7 = sub_2358AAED4(inited);
    v8 = (void *)objc_opt_self();
    *(_QWORD *)(v0 + 224) = v8;
    v9 = objc_msgSend(v8, sel_defaultStore);
    *(_QWORD *)(v0 + 232) = v9;
    if (v9)
    {
      v10 = v9;
      sub_2358B6260(v7);
      swift_bridgeObjectRelease();
      v11 = sub_2358BA308();
      *(_QWORD *)(v0 + 240) = v11;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 56) = v0 + 200;
      *(_QWORD *)(v0 + 16) = v0;
      *(_QWORD *)(v0 + 24) = sub_2358B5E24;
      v12 = swift_continuation_init();
      *(_QWORD *)(v0 + 160) = MEMORY[0x24BDAC760];
      v13 = (_QWORD *)(v0 + 160);
      v13[1] = 0x40000000;
      v13[2] = sub_2358B6608;
      v13[3] = &block_descriptor_1;
      v13[4] = v12;
      objc_msgSend(v10, sel_renewCredentialsForAccount_options_completion_, v1, v11, v13);
      swift_continuation_await();
    }
    else
    {

      __break(1u);
    }
  }
  else
  {
    if (qword_2542936E8 != -1)
      swift_once();
    v14 = sub_2358BA2E4();
    __swift_project_value_buffer(v14, (uint64_t)qword_254293740);
    v15 = sub_2358BA2CC();
    v16 = sub_2358BA434();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_2358A8000, v15, v16, "Renew credentials failed, missing id", v17, 2u);
      MEMORY[0x23B7DA064](v17, -1, -1);
    }

    (*(void (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2358B5E24()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 48);
  *(_QWORD *)(*v0 + 248) = v2;
  if (v2)

  return swift_task_switch();
}

void sub_2358B5E8C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(void **)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 200);

  if (v2 == 2)
  {

    if (qword_2542936E8 != -1)
      swift_once();
    v13 = sub_2358BA2E4();
    __swift_project_value_buffer(v13, (uint64_t)qword_254293740);
    v14 = sub_2358BA2CC();
    v15 = sub_2358BA434();
    if (!os_log_type_enabled(v14, v15))
      goto LABEL_26;
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    v17 = "Renew credentials failed.";
    goto LABEL_25;
  }
  if (v2 == 1)
  {

    if (qword_2542936E8 != -1)
      swift_once();
    v18 = sub_2358BA2E4();
    __swift_project_value_buffer(v18, (uint64_t)qword_254293740);
    v14 = sub_2358BA2CC();
    v15 = sub_2358BA434();
    if (!os_log_type_enabled(v14, v15))
      goto LABEL_26;
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    v17 = "Renew credentials rejected.";
    goto LABEL_25;
  }
  if (v2)
  {

    if (qword_2542936E8 != -1)
      swift_once();
    v19 = sub_2358BA2E4();
    __swift_project_value_buffer(v19, (uint64_t)qword_254293740);
    v14 = sub_2358BA2CC();
    v15 = sub_2358BA434();
    if (!os_log_type_enabled(v14, v15))
      goto LABEL_26;
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    v17 = "Renew credentials failed w/ unknown reason.";
    goto LABEL_25;
  }
  if (qword_2542936E8 != -1)
    swift_once();
  v3 = sub_2358BA2E4();
  __swift_project_value_buffer(v3, (uint64_t)qword_254293740);
  v4 = sub_2358BA2CC();
  v5 = sub_2358BA440();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2358A8000, v4, v5, "Successfully renewed credentials.", v6, 2u);
    MEMORY[0x23B7DA064](v6, -1, -1);
  }
  v7 = *(void **)(v0 + 224);

  v8 = objc_msgSend(v7, sel_defaultStore);
  v9 = *(void **)(v0 + 216);
  if (v8)
  {
    v10 = v8;
    v11 = objc_msgSend(v8, sel_aa_appleAccountWithAltDSID_, *(_QWORD *)(v0 + 216));

    if (v11)
    {
      v12 = *(id **)(v0 + 208);

      *v12 = v11;
LABEL_27:
      (*(void (**)(void))(v0 + 8))();
      return;
    }
    v14 = sub_2358BA2CC();
    v15 = sub_2358BA434();
    if (!os_log_type_enabled(v14, v15))
    {
LABEL_26:

      goto LABEL_27;
    }
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    v17 = "Renew credentials failed, missing account";
LABEL_25:
    _os_log_impl(&dword_2358A8000, v14, v15, v17, v16, 2u);
    MEMORY[0x23B7DA064](v16, -1, -1);
    goto LABEL_26;
  }

  __break(1u);
}

uint64_t sub_2358B6218()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 240);
  v2 = *(void **)(v0 + 232);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2358B6260(uint64_t a1)
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
  _OWORD v36[3];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256306B40);
    v2 = sub_2358BA53C();
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
    swift_dynamicCast();
    swift_dynamicCast();
    v32 = v28;
    v33 = v29;
    v34 = v30;
    sub_2358AB290(&v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_2358AB290(v35, v36);
    sub_2358AB290(v36, &v32);
    result = sub_2358BA488();
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
    result = (uint64_t)sub_2358AB290(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_2358B6B78();
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

uint64_t sub_2358B6608(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v4;
  id v5;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254293718);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_2358B6688(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;

  v22 = a1 + 64;
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
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v7)
      return swift_release();
    v20 = *(_QWORD *)(v22 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v7)
        return swift_release();
      v20 = *(_QWORD *)(v22 + 8 * v9);
      if (!v20)
      {
        v9 = v19 + 2;
        if (v19 + 2 >= v7)
          return swift_release();
        v20 = *(_QWORD *)(v22 + 8 * v9);
        if (!v20)
        {
          v9 = v19 + 3;
          if (v19 + 3 >= v7)
            return swift_release();
          v20 = *(_QWORD *)(v22 + 8 * v9);
          if (!v20)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v20 - 1) & v20;
    v11 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_5:
    v12 = 16 * v11;
    v13 = (uint64_t *)(*(_QWORD *)(a1 + 48) + v12);
    v14 = *v13;
    v15 = v13[1];
    v16 = (uint64_t *)(*(_QWORD *)(a1 + 56) + v12);
    v17 = *v16;
    v18 = v16[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a2(v14, v15, v17, v18);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v21 = v19 + 4;
  if (v21 >= v7)
    return swift_release();
  v20 = *(_QWORD *)(v22 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v7)
      return swift_release();
    v20 = *(_QWORD *)(v22 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

unint64_t sub_2358B6848()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256306E78;
  if (!qword_256306E78)
  {
    v1 = type metadata accessor for NetworkError();
    result = MEMORY[0x23B7D9FF8](&protocol conformance descriptor for NetworkError, v1);
    atomic_store(result, (unint64_t *)&qword_256306E78);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for NetworkController(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for NetworkController(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 24);
  if (v2 != (void *)1)

}

_QWORD *initializeWithCopy for NetworkController(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v6 = *(void **)(a2 + 16);
  v5 = *(void **)(a2 + 24);
  a1[2] = v6;
  v7 = v3;
  v8 = v4;
  v9 = v6;
  if (v5 != (void *)1)
    v10 = v5;
  a1[3] = v5;
  return a1;
}

uint64_t assignWithCopy for NetworkController(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  v10 = *(void **)(a2 + 16);
  v11 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  v12 = v10;

  v13 = (_QWORD *)(a1 + 24);
  v14 = *(void **)(a1 + 24);
  v15 = *(void **)(a2 + 24);
  if (v14 != (void *)1)
  {
    if (v15 != (void *)1)
    {
      *v13 = v15;
      v17 = v15;

      return a1;
    }
    sub_2358AE980(a1 + 24, &qword_256306E88);
    v15 = *(void **)(a2 + 24);
    goto LABEL_6;
  }
  if (v15 == (void *)1)
  {
LABEL_6:
    *v13 = v15;
    return a1;
  }
  *v13 = v15;
  v16 = v15;
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

uint64_t assignWithTake for NetworkController(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t *v8;
  uint64_t v9;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = a2[1];

  v6 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2[2];

  v8 = (uint64_t *)(a1 + 24);
  v7 = *(void **)(a1 + 24);
  v9 = a2[3];
  if (v7 != (void *)1)
  {
    if (v9 != 1)
    {
      *v8 = v9;

      return a1;
    }
    sub_2358AE980(a1 + 24, &qword_256306E88);
    v9 = 1;
  }
  *v8 = v9;
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkController(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NetworkController(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for NetworkController()
{
  return &type metadata for NetworkController;
}

id sub_2358B6B68(id result)
{
  if (result != (id)1)
    return result;
  return result;
}

uint64_t sub_2358B6B78()
{
  return swift_release();
}

uint64_t sub_2358B6B80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[42] = a5;
  v6[43] = v5;
  v6[40] = a3;
  v6[41] = a4;
  v6[38] = a1;
  v6[39] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542936F8);
  v6[44] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2358B6BE4()
{
  uint64_t v0;
  _OWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  BOOL v11;
  unint64_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  BOOL v20;
  unint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  BOOL v38;
  unint64_t v39;
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  BOOL v48;
  unint64_t v49;
  uint64_t v50;
  uint8_t *v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58[5];

  v1 = (_OWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 344) + 112;
  swift_beginAccess();
  v3 = *(_QWORD *)v2;
  if (!*(_QWORD *)(*(_QWORD *)v2 + 16))
  {
    *(_QWORD *)(v0 + 128) = 0;
    *v1 = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
LABEL_12:
    sub_2358AE980(v0 + 96, &qword_2542936F0);
    goto LABEL_14;
  }
  v5 = *(_QWORD *)(v0 + 312);
  v4 = *(_QWORD *)(v0 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = sub_2358AD3DC(v5, v4);
  if ((v7 & 1) != 0)
  {
    sub_2358AD5C4(*(_QWORD *)(v3 + 56) + 40 * v6, v0 + 96);
  }
  else
  {
    *(_QWORD *)(v0 + 128) = 0;
    *v1 = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 120))
    goto LABEL_12;
  sub_2358AD608((__int128 *)(v0 + 96), v0 + 16);
  sub_2358AD5C4(v0 + 16, v0 + 56);
  __swift_instantiateConcreteTypeFromMangledName(qword_256306B90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256306F70);
  if ((swift_dynamicCast() & 1) != 0)
  {
    *(_QWORD *)(v0 + 360) = *(_QWORD *)(v0 + 288);
    if (qword_2542936E0 != -1)
      swift_once();
    v8 = sub_2358BA2E4();
    __swift_project_value_buffer(v8, (uint64_t)qword_254293728);
    swift_bridgeObjectRetain_n();
    v9 = sub_2358BA2CC();
    v10 = sub_2358BA428();
    v11 = os_log_type_enabled(v9, v10);
    v12 = *(_QWORD *)(v0 + 320);
    if (v11)
    {
      v13 = *(_QWORD *)(v0 + 312);
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v58[0] = v15;
      *(_DWORD *)v14 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 296) = sub_2358ACD9C(v13, v12, v58);
      sub_2358BA464();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2358A8000, v9, v10, "TaskLimiter: reusing existing task for identifier %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7DA064](v15, -1, -1);
      MEMORY[0x23B7DA064](v14, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v55 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 368) = v55;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254293718);
    *v55 = v0;
    v55[1] = sub_2358B74F4;
    return sub_2358BA404();
  }
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
LABEL_14:
  if (qword_2542936E0 != -1)
    swift_once();
  v16 = v0 + 176;
  v17 = sub_2358BA2E4();
  __swift_project_value_buffer(v17, (uint64_t)qword_254293728);
  swift_bridgeObjectRetain_n();
  v18 = sub_2358BA2CC();
  v19 = sub_2358BA428();
  v20 = os_log_type_enabled(v18, v19);
  v21 = *(_QWORD *)(v0 + 320);
  if (v20)
  {
    v57 = *(_QWORD *)(v0 + 312);
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v58[0] = v23;
    *(_DWORD *)v22 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 272) = sub_2358ACD9C(v57, v21, v58);
    v16 = v0 + 176;
    sub_2358BA464();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2358A8000, v18, v19, "TaskLimiter: creating new task for identifier %s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DA064](v23, -1, -1);
    MEMORY[0x23B7DA064](v22, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v24 = (_OWORD *)(v0 + 136);
  v25 = *(_QWORD *)v2;
  if (*(_QWORD *)(*(_QWORD *)v2 + 16))
  {
    v27 = *(_QWORD *)(v0 + 312);
    v26 = *(_QWORD *)(v0 + 320);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v28 = sub_2358AD3DC(v27, v26);
    if ((v29 & 1) != 0)
    {
      sub_2358AD5C4(*(_QWORD *)(v25 + 56) + 40 * v28, v0 + 136);
    }
    else
    {
      *(_QWORD *)(v0 + 168) = 0;
      *v24 = 0u;
      *(_OWORD *)(v0 + 152) = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(v0 + 168) = 0;
    *v24 = 0u;
    *(_OWORD *)(v0 + 152) = 0u;
  }
  v30 = *(_QWORD *)(v0 + 352);
  v32 = *(_QWORD *)(v0 + 328);
  v31 = *(_QWORD *)(v0 + 336);
  v33 = sub_2358BA3F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v30, 1, 1, v33);
  sub_2358AB2A0(v0 + 136, v16, &qword_2542936F0);
  v34 = (_QWORD *)swift_allocObject();
  v34[2] = 0;
  v34[3] = 0;
  sub_2358AD4C4(v16, (uint64_t)(v34 + 4));
  v34[9] = v32;
  v34[10] = v31;
  swift_retain();
  v35 = sub_2358AC9E8(v30, (uint64_t)&unk_256306F68, (uint64_t)v34);
  *(_QWORD *)(v0 + 384) = v35;
  swift_bridgeObjectRetain_n();
  v36 = sub_2358BA2CC();
  v37 = sub_2358BA428();
  v38 = os_log_type_enabled(v36, v37);
  v39 = *(_QWORD *)(v0 + 320);
  if (v38)
  {
    v56 = v35;
    v40 = *(_QWORD *)(v0 + 312);
    v41 = (uint8_t *)swift_slowAlloc();
    v42 = swift_slowAlloc();
    v58[0] = v42;
    *(_DWORD *)v41 = 136315138;
    swift_bridgeObjectRetain();
    v43 = v40;
    v35 = v56;
    *(_QWORD *)(v0 + 264) = sub_2358ACD9C(v43, v39, v58);
    sub_2358BA464();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2358A8000, v36, v37, "TaskLimiter: storing task for identifier %s", v41, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DA064](v42, -1, -1);
    MEMORY[0x23B7DA064](v41, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v45 = *(_QWORD *)(v0 + 312);
  v44 = *(_QWORD *)(v0 + 320);
  v58[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_256306F70);
  v58[4] = sub_2358B9FE8(&qword_256306F78, &qword_256306F70);
  v58[0] = v35;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2358ACB18((uint64_t)v58, v45, v44);
  swift_endAccess();
  swift_bridgeObjectRetain_n();
  v46 = sub_2358BA2CC();
  v47 = sub_2358BA428();
  v48 = os_log_type_enabled(v46, v47);
  v49 = *(_QWORD *)(v0 + 320);
  if (v48)
  {
    v50 = *(_QWORD *)(v0 + 312);
    v51 = (uint8_t *)swift_slowAlloc();
    v52 = swift_slowAlloc();
    v58[0] = v52;
    *(_DWORD *)v51 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 280) = sub_2358ACD9C(v50, v49, v58);
    sub_2358BA464();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2358A8000, v46, v47, "TaskLimiter: performing task operation for identifier %s", v51, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DA064](v52, -1, -1);
    MEMORY[0x23B7DA064](v51, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v53 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 392) = v53;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254293718);
  *v53 = v0;
  v53[1] = sub_2358B75E8;
  return sub_2358BA404();
}

uint64_t sub_2358B74F4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 376) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2358B7558()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2358B75A0()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2358B75E8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 400) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2358B764C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 312);
  v1 = *(_QWORD *)(v0 + 320);
  swift_release();
  sub_2358AE980(v0 + 136, &qword_2542936F0);
  sub_2358AC520(v2, v1);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2358B76BC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 312);
  v1 = *(_QWORD *)(v0 + 320);
  swift_release();
  sub_2358AE980(v0 + 136, &qword_2542936F0);
  sub_2358AC520(v2, v1);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2358B772C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[42] = a5;
  v6[43] = v5;
  v6[40] = a3;
  v6[41] = a4;
  v6[38] = a1;
  v6[39] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542936F8);
  v6[44] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2358B7790()
{
  uint64_t v0;
  _OWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  BOOL v11;
  unint64_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  BOOL v19;
  unint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  BOOL v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  BOOL v51;
  unint64_t v52;
  uint64_t v53;
  uint8_t *v54;
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60[5];

  v1 = (_OWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 344) + 112;
  swift_beginAccess();
  v3 = *(_QWORD *)v2;
  if (!*(_QWORD *)(*(_QWORD *)v2 + 16))
  {
    *(_QWORD *)(v0 + 128) = 0;
    *v1 = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
LABEL_12:
    sub_2358AE980(v0 + 96, &qword_2542936F0);
    goto LABEL_14;
  }
  v5 = *(_QWORD *)(v0 + 312);
  v4 = *(_QWORD *)(v0 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = sub_2358AD3DC(v5, v4);
  if ((v7 & 1) != 0)
  {
    sub_2358AD5C4(*(_QWORD *)(v3 + 56) + 40 * v6, v0 + 96);
  }
  else
  {
    *(_QWORD *)(v0 + 128) = 0;
    *v1 = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 120))
    goto LABEL_12;
  sub_2358AD608((__int128 *)(v0 + 96), v0 + 16);
  sub_2358AD5C4(v0 + 16, v0 + 56);
  __swift_instantiateConcreteTypeFromMangledName(qword_256306B90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256306F20);
  if ((swift_dynamicCast() & 1) != 0)
  {
    *(_QWORD *)(v0 + 360) = *(_QWORD *)(v0 + 288);
    if (qword_2542936E0 != -1)
      swift_once();
    v8 = sub_2358BA2E4();
    __swift_project_value_buffer(v8, (uint64_t)qword_254293728);
    swift_bridgeObjectRetain_n();
    v9 = sub_2358BA2CC();
    v10 = sub_2358BA428();
    v11 = os_log_type_enabled(v9, v10);
    v12 = *(_QWORD *)(v0 + 320);
    if (v11)
    {
      v13 = *(_QWORD *)(v0 + 312);
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v60[0] = v15;
      *(_DWORD *)v14 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 296) = sub_2358ACD9C(v13, v12, v60);
      sub_2358BA464();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2358A8000, v9, v10, "TaskLimiter: reusing existing task for identifier %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7DA064](v15, -1, -1);
      MEMORY[0x23B7DA064](v14, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v58 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 368) = v58;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254293718);
    *v58 = v0;
    v58[1] = sub_2358B8098;
    return sub_2358BA404();
  }
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
LABEL_14:
  if (qword_2542936E0 != -1)
    swift_once();
  v59 = v0 + 176;
  v16 = sub_2358BA2E4();
  __swift_project_value_buffer(v16, (uint64_t)qword_254293728);
  swift_bridgeObjectRetain_n();
  v17 = sub_2358BA2CC();
  v18 = sub_2358BA428();
  v19 = os_log_type_enabled(v17, v18);
  v20 = *(_QWORD *)(v0 + 320);
  if (v19)
  {
    v21 = *(_QWORD *)(v0 + 312);
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = v2;
    v24 = swift_slowAlloc();
    v60[0] = v24;
    *(_DWORD *)v22 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 272) = sub_2358ACD9C(v21, v20, v60);
    sub_2358BA464();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2358A8000, v17, v18, "TaskLimiter: creating new task for identifier %s", v22, 0xCu);
    swift_arrayDestroy();
    v25 = v24;
    v2 = v23;
    MEMORY[0x23B7DA064](v25, -1, -1);
    MEMORY[0x23B7DA064](v22, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v26 = (_OWORD *)(v0 + 136);
  v27 = *(_QWORD *)v2;
  if (*(_QWORD *)(*(_QWORD *)v2 + 16))
  {
    v29 = *(_QWORD *)(v0 + 312);
    v28 = *(_QWORD *)(v0 + 320);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v30 = sub_2358AD3DC(v29, v28);
    if ((v31 & 1) != 0)
    {
      sub_2358AD5C4(*(_QWORD *)(v27 + 56) + 40 * v30, v0 + 136);
    }
    else
    {
      *(_QWORD *)(v0 + 168) = 0;
      *v26 = 0u;
      *(_OWORD *)(v0 + 152) = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(v0 + 168) = 0;
    *v26 = 0u;
    *(_OWORD *)(v0 + 152) = 0u;
  }
  v32 = *(_QWORD *)(v0 + 352);
  v34 = *(_QWORD *)(v0 + 328);
  v33 = *(_QWORD *)(v0 + 336);
  v35 = sub_2358BA3F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v32, 1, 1, v35);
  sub_2358AB2A0(v0 + 136, v59, &qword_2542936F0);
  v36 = (_QWORD *)swift_allocObject();
  v36[2] = 0;
  v36[3] = 0;
  sub_2358AD4C4(v59, (uint64_t)(v36 + 4));
  v36[9] = v34;
  v36[10] = v33;
  swift_retain();
  v37 = sub_2358AC9E8(v32, (uint64_t)&unk_256306F18, (uint64_t)v36);
  *(_QWORD *)(v0 + 384) = v37;
  swift_bridgeObjectRetain_n();
  v38 = sub_2358BA2CC();
  v39 = sub_2358BA428();
  v40 = os_log_type_enabled(v38, v39);
  v41 = *(_QWORD *)(v0 + 320);
  if (v40)
  {
    v42 = v37;
    v43 = *(_QWORD *)(v0 + 312);
    v44 = (uint8_t *)swift_slowAlloc();
    v45 = swift_slowAlloc();
    v60[0] = v45;
    *(_DWORD *)v44 = 136315138;
    swift_bridgeObjectRetain();
    v46 = v43;
    v37 = v42;
    *(_QWORD *)(v0 + 264) = sub_2358ACD9C(v46, v41, v60);
    sub_2358BA464();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2358A8000, v38, v39, "TaskLimiter: storing task for identifier %s", v44, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DA064](v45, -1, -1);
    MEMORY[0x23B7DA064](v44, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v48 = *(_QWORD *)(v0 + 312);
  v47 = *(_QWORD *)(v0 + 320);
  v60[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_256306F20);
  v60[4] = sub_2358B9FE8(&qword_256306F28, &qword_256306F20);
  v60[0] = v37;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2358ACB18((uint64_t)v60, v48, v47);
  swift_endAccess();
  swift_bridgeObjectRetain_n();
  v49 = sub_2358BA2CC();
  v50 = sub_2358BA428();
  v51 = os_log_type_enabled(v49, v50);
  v52 = *(_QWORD *)(v0 + 320);
  if (v51)
  {
    v53 = *(_QWORD *)(v0 + 312);
    v54 = (uint8_t *)swift_slowAlloc();
    v55 = swift_slowAlloc();
    v60[0] = v55;
    *(_DWORD *)v54 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 280) = sub_2358ACD9C(v53, v52, v60);
    sub_2358BA464();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2358A8000, v49, v50, "TaskLimiter: performing task operation for identifier %s", v54, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DA064](v55, -1, -1);
    MEMORY[0x23B7DA064](v54, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v56 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 392) = v56;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254293718);
  *v56 = v0;
  v56[1] = sub_2358B80FC;
  return sub_2358BA404();
}

uint64_t sub_2358B8098()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 376) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2358B80FC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 400) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2358B8160(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[13] = a5;
  v6[14] = a6;
  v6[11] = a1;
  v6[12] = a4;
  return swift_task_switch();
}

uint64_t sub_2358B817C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t *boxed_opaque_existential_0;
  _QWORD *v5;
  int *v7;
  _QWORD *v8;
  uint64_t (*v9)(uint64_t *, uint64_t, uint64_t);
  uint64_t (*v10)(_QWORD);

  sub_2358AB2A0(*(_QWORD *)(v0 + 96), v0 + 16, &qword_2542936F0);
  v1 = *(_QWORD *)(v0 + 40);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    v3 = *(int **)(v2 + 16);
    *(_QWORD *)(v0 + 80) = swift_getAssociatedTypeWitness();
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 56));
    v9 = (uint64_t (*)(uint64_t *, uint64_t, uint64_t))((char *)v3 + *v3);
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 120) = v5;
    *v5 = v0;
    v5[1] = sub_2358AC87C;
    return v9(boxed_opaque_existential_0, v1, v2);
  }
  else
  {
    sub_2358AE980(v0 + 16, &qword_2542936F0);
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
    v7 = *(int **)(v0 + 104);
    sub_2358AE980(v0 + 56, &qword_254293720);
    v10 = (uint64_t (*)(_QWORD))((char *)v7 + *v7);
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v8;
    *v8 = v0;
    v8[1] = sub_2358AC960;
    return v10(*(_QWORD *)(v0 + 88));
  }
}

uint64_t sub_2358B82D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[13] = a5;
  v6[14] = a6;
  v6[11] = a1;
  v6[12] = a4;
  return swift_task_switch();
}

uint64_t sub_2358B82F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t *boxed_opaque_existential_0;
  _QWORD *v5;
  int *v7;
  _QWORD *v8;
  uint64_t (*v9)(uint64_t *, uint64_t, uint64_t);
  uint64_t (*v10)(_QWORD);

  sub_2358AB2A0(*(_QWORD *)(v0 + 96), v0 + 16, &qword_2542936F0);
  v1 = *(_QWORD *)(v0 + 40);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    v3 = *(int **)(v2 + 16);
    *(_QWORD *)(v0 + 80) = swift_getAssociatedTypeWitness();
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 56));
    v9 = (uint64_t (*)(uint64_t *, uint64_t, uint64_t))((char *)v3 + *v3);
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 120) = v5;
    *v5 = v0;
    v5[1] = sub_2358B8450;
    return v9(boxed_opaque_existential_0, v1, v2);
  }
  else
  {
    sub_2358AE980(v0 + 16, &qword_2542936F0);
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
    v7 = *(int **)(v0 + 104);
    sub_2358AE980(v0 + 56, &qword_254293720);
    v10 = (uint64_t (*)(_QWORD))((char *)v7 + *v7);
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v8;
    *v8 = v0;
    v8[1] = sub_2358BA114;
    return v10(*(_QWORD *)(v0 + 88));
  }
}

uint64_t sub_2358B8450()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2358B84B4()
{
  _QWORD *v0;
  int *v1;
  _QWORD *v2;
  uint64_t (*v4)(_QWORD);

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  v1 = (int *)v0[13];
  sub_2358AE980((uint64_t)(v0 + 7), &qword_254293720);
  v4 = (uint64_t (*)(_QWORD))((char *)v1 + *v1);
  v2 = (_QWORD *)swift_task_alloc();
  v0[17] = v2;
  *v2 = v0;
  v2[1] = sub_2358BA114;
  return v4(v0[11]);
}

uint64_t sub_2358B8534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  uint64_t v20;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542936F8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_2358BA3F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = v6;
  v17[5] = a1;
  v17[6] = a2;
  v17[7] = a3;
  v17[8] = a4;
  v17[9] = a5;
  v17[10] = a6;
  v18 = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_2358B8C68((uint64_t)v15, (uint64_t)&unk_256306EA0, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_2358B8644(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;

  v8[29] = v10;
  v8[30] = v11;
  v8[27] = a7;
  v8[28] = a8;
  v8[25] = a5;
  v8[26] = a6;
  v8[24] = a4;
  return swift_task_switch();
}

uint64_t sub_2358B8670()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 248) = *(_QWORD *)(*(_QWORD *)(v0 + 192)
                                    + OBJC_IVAR____TtC14ACSEFoundation16TaskLimitersObjC_taskLimiters);
  return swift_task_switch();
}

uint64_t sub_2358B8694()
{
  uint64_t *v0;

  v0[32] = TaskLimiters.limiter(key:)(v0[25], v0[26]);
  return swift_task_switch();
}

uint64_t sub_2358B86D8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  id v5;
  _QWORD *v6;
  char *v8;

  v2 = v0[27];
  v1 = v0[28];
  v3 = (void *)v0[24];
  v4 = (_QWORD *)swift_allocObject();
  v0[33] = v4;
  v4[2] = v3;
  v4[3] = v2;
  v4[4] = v1;
  v8 = (char *)&dword_256306F58 + dword_256306F58;
  v5 = v3;
  swift_retain();
  v6 = (_QWORD *)swift_task_alloc();
  v0[34] = v6;
  *v6 = v0;
  v6[1] = sub_2358B87A0;
  return ((uint64_t (*)(_QWORD *, _QWORD, _QWORD, void *, _QWORD *))v8)(v0 + 12, v0[25], v0[26], &unk_256306F50, v4);
}

uint64_t sub_2358B87A0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 280) = v0;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2358B880C()
{
  uint64_t v0;
  void (*v1)(uint64_t, _QWORD);

  v1 = *(void (**)(uint64_t, _QWORD))(v0 + 232);
  sub_2358AE940(v0 + 96, v0 + 160);
  v1(v0 + 160, 0);
  swift_release();
  sub_2358AE980(v0 + 160, &qword_256306E80);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2358B888C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  uint64_t inited;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void (*v16)(uint64_t, id);
  id v17;

  v17 = *(id *)(v0 + 280);
  v16 = *(void (**)(uint64_t, id))(v0 + 232);
  v1 = (void *)sub_2358BA194();
  v2 = objc_msgSend(v1, sel_domain);
  sub_2358BA350();

  v3 = objc_msgSend(v1, sel_code);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256306B28);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2358BB380;
  *(_QWORD *)(inited + 32) = sub_2358BA350();
  *(_QWORD *)(inited + 40) = v5;
  v6 = objc_msgSend(v1, sel_localizedDescription);
  v7 = sub_2358BA350();
  v9 = v8;

  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v7;
  *(_QWORD *)(inited + 56) = v9;
  sub_2358AAC60(inited);
  v10 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v11 = (void *)sub_2358BA32C();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_2358BA308();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v10, sel_initWithDomain_code_userInfo_, v11, v3, v12);

  *(_OWORD *)(v0 + 144) = 0u;
  *(_OWORD *)(v0 + 128) = 0u;
  v14 = v13;
  v16(v0 + 128, v13);
  swift_release();

  sub_2358AE980(v0 + 128, &qword_256306E80);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2358B8A84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 80);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v0 + 48);
  v7 = *(_OWORD *)(v0 + 64);
  *(_QWORD *)(v1 + 16) = v5;
  *(_QWORD *)v5 = v1;
  *(_QWORD *)(v5 + 8) = sub_2358AEA58;
  *(_QWORD *)(v5 + 240) = v4;
  *(_OWORD *)(v5 + 208) = v6;
  *(_OWORD *)(v5 + 224) = v7;
  *(_QWORD *)(v5 + 192) = v2;
  *(_QWORD *)(v5 + 200) = v3;
  return swift_task_switch();
}

uint64_t sub_2358B8AFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[3] = a3;
  v4[4] = a4;
  v4[2] = a1;
  return swift_task_switch();
}

uint64_t sub_2358B8B18()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  *v2 = v0;
  v2[1] = sub_2358B8BC0;
  return sub_2358BA59C();
}

uint64_t sub_2358B8BC0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2358B8C34()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2358B8C68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2358BA3F8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2358BA3EC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2358AE980(a1, &qword_2542936F8);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2358BA3C8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2358B8F48(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(__int128 *, void *);
  id v6;
  __int128 v8;
  __int128 v9;

  v5 = *(void (**)(__int128 *, void *))(a1 + 32);
  if (a2)
  {
    *((_QWORD *)&v9 + 1) = swift_getObjectType();
    *(_QWORD *)&v8 = a2;
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }
  swift_retain();
  swift_unknownObjectRetain();
  v6 = a3;
  v5(&v8, a3);

  swift_release();
  return sub_2358AE980((uint64_t)&v8, &qword_256306E80);
}

uint64_t sub_2358B8FDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t v13;

  sub_2358AB2A0(a1, (uint64_t)v12, &qword_256306E80);
  v5 = v13;
  if (v13)
  {
    v6 = __swift_project_boxed_opaque_existential_1(v12, v13);
    v7 = *(_QWORD *)(v5 - 8);
    MEMORY[0x24BDAC7A8](v6);
    v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    v10 = sub_2358BA584();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  }
  else
  {
    v10 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, v10, a2);
  return swift_unknownObjectRelease();
}

uint64_t sub_2358B90D4(uint64_t a1, void *a2)
{
  id v2;
  __int128 v4;
  uint64_t v5;
  _OWORD v6[2];

  if (a2)
  {
    *(_QWORD *)&v6[0] = a2;
    v2 = a2;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256306F80);
    return sub_2358BA3D4();
  }
  else
  {
    sub_2358AB2A0(a1, (uint64_t)&v4, &qword_256306E80);
    if (v5)
    {
      sub_2358AB290(&v4, v6);
      sub_2358AE940((uint64_t)v6, (uint64_t)&v4);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256306F80);
      sub_2358BA3E0();
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
    }
    else
    {
      return sub_2358AE980((uint64_t)&v4, &qword_256306E80);
    }
  }
}

uint64_t sub_2358B9184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  uint64_t v20;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542936F8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_2358BA3F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = v6;
  v17[5] = a1;
  v17[6] = a2;
  v17[7] = a3;
  v17[8] = a4;
  v17[9] = a5;
  v17[10] = a6;
  v18 = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_2358AC9E8((uint64_t)v15, (uint64_t)&unk_256306EB0, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_2358B92A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;

  v8[7] = v10;
  v8[8] = v11;
  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  v8[2] = a4;
  return swift_task_switch();
}

uint64_t sub_2358B92CC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 72) = *(_QWORD *)(*(_QWORD *)(v0 + 16)
                                   + OBJC_IVAR____TtC14ACSEFoundation16TaskLimitersObjC_taskLimiters);
  return swift_task_switch();
}

uint64_t sub_2358B92F0()
{
  uint64_t *v0;

  v0[10] = TaskLimiters.limiter(key:)(v0[3], v0[4]);
  return swift_task_switch();
}

uint64_t sub_2358B9334()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v2 = v0[5];
  v1 = v0[6];
  v3 = swift_allocObject();
  v0[11] = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_256306F08 + dword_256306F08);
  swift_retain();
  v4 = (_QWORD *)swift_task_alloc();
  v0[12] = v4;
  *v4 = v0;
  v4[1] = sub_2358B93D8;
  return v6((uint64_t)v6, v0[3], v0[4], (uint64_t)&unk_256306F00, v3);
}

uint64_t sub_2358B93D8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2358B9444()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 56))();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2358B9484()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2358B94BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 80);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v0 + 48);
  v7 = *(_OWORD *)(v0 + 64);
  *(_QWORD *)(v1 + 16) = v5;
  *(_QWORD *)v5 = v1;
  *(_QWORD *)(v5 + 8) = sub_2358AEA58;
  *(_QWORD *)(v5 + 64) = v4;
  *(_OWORD *)(v5 + 32) = v6;
  *(_OWORD *)(v5 + 48) = v7;
  *(_QWORD *)(v5 + 16) = v2;
  *(_QWORD *)(v5 + 24) = v3;
  return swift_task_switch();
}

uint64_t sub_2358B9534(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_2358B9550()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  *v2 = v0;
  v2[1] = sub_2358B95F0;
  return sub_2358BA56C();
}

uint64_t sub_2358B95F0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2358B9644(uint64_t a1, void (*a2)(uint64_t, uint64_t), uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13 + v12, (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  a2(a6, v13);
  return swift_release();
}

uint64_t sub_2358B98CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  void (*v7)(uint64_t, void *);
  _QWORD v9[6];

  v9[4] = a1;
  v9[5] = a2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = a4;
  v9[3] = a5;
  v6 = _Block_copy(v9);
  v7 = *(void (**)(uint64_t, void *))(a3 + 16);
  swift_retain();
  v7(a3, v6);
  _Block_release(v6);
  return swift_release();
}

uint64_t sub_2358B9950(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id TaskLimitersObjC.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id TaskLimitersObjC.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  objc_super v5;

  v1 = OBJC_IVAR____TtC14ACSEFoundation16TaskLimitersObjC_taskLimiters;
  type metadata accessor for TaskLimiters();
  v2 = swift_allocObject();
  v3 = v0;
  swift_defaultActor_initialize();
  *(_QWORD *)(v2 + 112) = MEMORY[0x24BEE4B00];
  *(_QWORD *)&v0[v1] = v2;

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for TaskLimitersObjC();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for TaskLimitersObjC()
{
  return objc_opt_self();
}

id TaskLimitersObjC.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TaskLimitersObjC();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for TaskLimitersObjC()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TaskLimitersObjC.perform(identifier:task:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of TaskLimitersObjC.performClosureNoParams(identifier:task:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t sub_2358B9B4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2358B98CC(a1, a2, *(_QWORD *)(v2 + 16), (uint64_t)sub_2358B9950, (uint64_t)&block_descriptor_2);
}

uint64_t sub_2358B9B74()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_2358B9B98()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
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

uint64_t sub_2358B9BC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2358B98CC(a1, a2, *(_QWORD *)(v2 + 16), (uint64_t)sub_2358B8F48, (uint64_t)&block_descriptor_30);
}

uint64_t sub_2358B9BE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2358B8FDC(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2358B9C38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 80);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v0 + 48);
  v7 = *(_OWORD *)(v0 + 64);
  *(_QWORD *)(v1 + 16) = v5;
  *(_QWORD *)v5 = v1;
  *(_QWORD *)(v5 + 8) = sub_2358AB8B4;
  *(_QWORD *)(v5 + 240) = v4;
  *(_OWORD *)(v5 + 208) = v6;
  *(_OWORD *)(v5 + 224) = v7;
  *(_QWORD *)(v5 + 192) = v2;
  *(_QWORD *)(v5 + 200) = v3;
  return swift_task_switch();
}

uint64_t sub_2358B9CB0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2358B9CD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_2358AEA58;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_2358B9D40(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 72);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_2358AEA58;
  *(_OWORD *)(v4 + 104) = v5;
  *(_QWORD *)(v4 + 88) = a1;
  *(_QWORD *)(v4 + 96) = v1 + 32;
  return swift_task_switch();
}

uint64_t sub_2358B9DB4(uint64_t a1)
{
  uint64_t v1;

  return sub_2358B9644(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24), &qword_256306F30, (uint64_t)&unk_2506E1700, (uint64_t)sub_2358B9DF0);
}

uint64_t sub_2358B9DE4()
{
  return objectdestroy_49Tm(&qword_256306F30);
}

uint64_t sub_2358B9DF0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256306F30);
  return sub_2358BA3E0();
}

uint64_t sub_2358B9E30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2358AEA58;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256306F38 + dword_256306F38))(a1, v4);
}

uint64_t sub_2358B9EA0()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2358B9ECC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 24);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_2358AEA58;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t objectdestroy_38Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  if (*(_QWORD *)(v0 + 56))
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 32);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2358B9F74(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 72);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_2358AB8B4;
  *(_OWORD *)(v4 + 104) = v5;
  *(_QWORD *)(v4 + 88) = a1;
  *(_QWORD *)(v4 + 96) = v1 + 32;
  return swift_task_switch();
}

uint64_t sub_2358B9FE8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B7D9FF8](&unk_2358BAF10, v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2358BA028(uint64_t a1)
{
  uint64_t v1;

  return sub_2358B9644(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t *)&unk_256306F80, (uint64_t)&unk_2506E17A0, (uint64_t)sub_2358BA0C0);
}

uint64_t sub_2358BA058()
{
  return objectdestroy_49Tm((uint64_t *)&unk_256306F80);
}

uint64_t objectdestroy_49Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t sub_2358BA0C0(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256306F80);
  return sub_2358B90D4(a1, a2);
}

uint64_t sub_2358BA140()
{
  return MEMORY[0x24BDCB030]();
}

uint64_t sub_2358BA14C()
{
  return MEMORY[0x24BDCB068]();
}

uint64_t sub_2358BA158()
{
  return MEMORY[0x24BDCB088]();
}

uint64_t sub_2358BA164()
{
  return MEMORY[0x24BDCB098]();
}

uint64_t sub_2358BA170()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_2358BA17C()
{
  return MEMORY[0x24BDCB9C0]();
}

uint64_t sub_2358BA188()
{
  return MEMORY[0x24BDCB9D8]();
}

uint64_t sub_2358BA194()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2358BA1A0()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2358BA1AC()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_2358BA1B8()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_2358BA1C4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2358BA1D0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2358BA1DC()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_2358BA1E8()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2358BA1F4()
{
  return MEMORY[0x24BDCDD40]();
}

uint64_t sub_2358BA200()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2358BA20C()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_2358BA218()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_2358BA224()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_2358BA230()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_2358BA23C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2358BA248()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2358BA254()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2358BA260()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2358BA26C()
{
  return MEMORY[0x24BDCEBC0]();
}

uint64_t sub_2358BA278()
{
  return MEMORY[0x24BDCEBD0]();
}

uint64_t sub_2358BA284()
{
  return MEMORY[0x24BDCEBF0]();
}

uint64_t sub_2358BA290()
{
  return MEMORY[0x24BDCECE0]();
}

uint64_t sub_2358BA29C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2358BA2A8()
{
  return MEMORY[0x24BDCF4A8]();
}

uint64_t sub_2358BA2B4()
{
  return MEMORY[0x24BDCF4F0]();
}

uint64_t sub_2358BA2C0()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_2358BA2CC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2358BA2D8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2358BA2E4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2358BA2F0()
{
  return MEMORY[0x24BEE76B0]();
}

uint64_t sub_2358BA2FC()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_2358BA308()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2358BA314()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2358BA320()
{
  return MEMORY[0x24BDCF880]();
}

uint64_t sub_2358BA32C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2358BA338()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_2358BA344()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2358BA350()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2358BA35C()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_2358BA368()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_2358BA374()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_2358BA380()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t sub_2358BA38C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2358BA398()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2358BA3A4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2358BA3B0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2358BA3BC()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2358BA3C8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2358BA3D4()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_2358BA3E0()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_2358BA3EC()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2358BA3F8()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2358BA404()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_2358BA410()
{
  return MEMORY[0x24BEE6AE8]();
}

uint64_t sub_2358BA41C()
{
  return MEMORY[0x24BDCFED8]();
}

uint64_t sub_2358BA428()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2358BA434()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2358BA440()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2358BA44C()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_2358BA458()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2358BA464()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2358BA470()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2358BA47C()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2358BA488()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2358BA494()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_2358BA4A0()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_2358BA4AC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2358BA4B8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2358BA4C4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2358BA4D0()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2358BA4DC()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2358BA4E8()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2358BA4F4()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2358BA500()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2358BA50C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2358BA518()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2358BA524()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2358BA530()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2358BA53C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2358BA548()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2358BA554()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2358BA560()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2358BA56C()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_2358BA578()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_2358BA584()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_2358BA590()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2358BA59C()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_2358BA5A8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2358BA5B4()
{
  return MEMORY[0x24BDD06D8]();
}

uint64_t sub_2358BA5C0()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_2358BA5CC()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2358BA5D8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2358BA5E4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2358BA5F0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2358BA5FC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2358BA608()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2358BA614()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2358BA620()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t DeviceIdentityIssueClientCertificateWithCompletion()
{
  return MEMORY[0x24BE2C378]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
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

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

