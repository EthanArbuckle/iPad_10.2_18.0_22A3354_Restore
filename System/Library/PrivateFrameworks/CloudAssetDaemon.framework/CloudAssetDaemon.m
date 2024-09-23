__n128 sub_237F6C150(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_237F6C164(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 64))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 16);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_237F6C1B8(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 64) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

void type metadata accessor for MMCSEngineClientContext(uint64_t a1)
{
  sub_237F6C2F4(a1, &qword_2568B5DE8);
}

uint64_t sub_237F6C230(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_237F6C260(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_237F6C26C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_237F6C28C(uint64_t result, int a2, int a3)
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

void type metadata accessor for audit_token_t(uint64_t a1)
{
  sub_237F6C2F4(a1, &qword_2568B5DF0);
}

void type metadata accessor for CFError(uint64_t a1)
{
  sub_237F6C2F4(a1, &qword_2568B5DF8);
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_237F6C2F4(a1, &qword_2568B5E00);
}

void sub_237F6C2F4(uint64_t a1, unint64_t *a2)
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

void sub_237F6C33C()
{
  sub_237F6CB20();
  sub_237F6CB2C();
  swift_bridgeObjectRelease();
  sub_237F6CB08();
  sub_237F6CAEC();
  sub_237F6CAAC(&qword_2568B5F70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  dispatch thunk of Hashable.hash(into:)();
  sub_237F6CB38();
}

uint64_t sub_237F6C3A8(_QWORD *a1, _QWORD *a2)
{
  BOOL v2;

  v2 = *a1 == *a2 && a1[1] == a2[1];
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    sub_237F6CB08();
    JUMPOUT(0x23B828748);
  }
  return 0;
}

void sub_237F6C40C()
{
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  sub_237F6CB08();
  sub_237F6CAEC();
  sub_237F6CAAC(&qword_2568B5F70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  sub_237F6CAF8();
  Hasher._finalize()();
  sub_237F6CB10();
}

void sub_237F6C498()
{
  Hasher.init(_seed:)();
  sub_237F6CB20();
  sub_237F6CB2C();
  swift_bridgeObjectRelease();
  sub_237F6CAEC();
  sub_237F6CAAC(&qword_2568B5F70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  sub_237F6CAF8();
  Hasher._finalize()();
  sub_237F6CB10();
}

uint64_t sub_237F6C50C()
{
  uint64_t v0;

  swift_defaultActor_initialize();
  type metadata accessor for RequestTracker();
  swift_allocObject();
  *(_QWORD *)(v0 + 112) = sub_237F8502C();
  sub_237F6CB08();
  type metadata accessor for Engine();
  sub_237F6CAAC(&qword_2568B5F78, (uint64_t (*)(uint64_t))type metadata accessor for ProcessorFactory.TenantDomain, (uint64_t)&unk_237F8B1B0);
  *(_QWORD *)(v0 + 120) = Dictionary.init(dictionaryLiteral:)();
  return v0;
}

uint64_t sub_237F6C5AC()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_237F6C5D8()
{
  sub_237F6C5AC();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for ProcessorFactory()
{
  return objc_opt_self();
}

uint64_t *sub_237F6C610(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = type metadata accessor for URL();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_237F6C6AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_237F6C6F4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = type metadata accessor for URL();
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

_QWORD *sub_237F6C764(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  v9 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_237F6C7E0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_237F6C83C(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  v10 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_237F6C8A8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237F6C8B4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for URL();
    return sub_237F6C928(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_237F6C928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_237F6C934()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_237F6C940(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 8) = (a2 - 1);
    sub_237F6CB38();
  }
  else
  {
    v7 = type metadata accessor for URL();
    sub_237F6C9A4(a1 + *(int *)(a4 + 20), a2, a2, v7);
  }
}

uint64_t sub_237F6C9A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t type metadata accessor for ProcessorFactory.TenantDomain()
{
  uint64_t result;

  result = qword_2568B5F30;
  if (!qword_2568B5F30)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_237F6C9E8()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_237F6CA5C()
{
  return sub_237F6CAAC(&qword_2568B5F68, (uint64_t (*)(uint64_t))type metadata accessor for ProcessorFactory.TenantDomain, (uint64_t)&unk_237F8B188);
}

uint64_t sub_237F6CA88()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F6CA94()
{
  return sub_237F6CA88();
}

uint64_t sub_237F6CAAC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B828F58](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_237F6CAEC()
{
  return type metadata accessor for URL();
}

uint64_t sub_237F6CAF8()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_237F6CB08()
{
  return type metadata accessor for ProcessorFactory.TenantDomain();
}

uint64_t sub_237F6CB20()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_237F6CB2C()
{
  return String.hash(into:)();
}

void sub_237F6CB44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
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

  v4 = v3;
  v24 = a3;
  v8 = type metadata accessor for ProcessorFactory.TenantDomain();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)((char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = type metadata accessor for URL();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v15(v13, a3, v11);
  v16 = *(_QWORD *)(v4 + 112);
  type metadata accessor for TenantContext();
  swift_allocObject();
  sub_237F85F40(a1, a2, (uint64_t)v13, v16);
  v15((char *)v10 + *(int *)(v8 + 20), v24, v11);
  *v10 = a1;
  v10[1] = a2;
  swift_beginAccess();
  v17 = *(_QWORD *)(v4 + 120);
  swift_bridgeObjectRetain_n();
  swift_retain();
  swift_bridgeObjectRetain();
  v18 = sub_237F84E20(v10, v17);
  swift_bridgeObjectRelease();
  if (v18)
  {
    swift_release();
LABEL_3:
    sub_237F6F6B8((uint64_t)v10);
    type metadata accessor for Uploader();
    swift_allocObject();
    sub_237F72084(v18);
    return;
  }
  type metadata accessor for Engine();
  swift_allocObject();
  v19 = swift_retain();
  v20 = v25;
  sub_237F853C0(v19);
  if (!v20)
  {
    v18 = v21;
    swift_beginAccess();
    v22 = swift_retain();
    sub_237F6F6F4(v22, v10);
    swift_endAccess();
    swift_release();
    goto LABEL_3;
  }
  sub_237F6F6B8((uint64_t)v10);
  swift_release();
}

uint64_t sub_237F6CD88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = v3;
  v25 = a3;
  v8 = type metadata accessor for ProcessorFactory.TenantDomain();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)((char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = type metadata accessor for URL();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v15(v13, a3, v11);
  v16 = *(_QWORD *)(v4 + 112);
  type metadata accessor for TenantContext();
  swift_allocObject();
  sub_237F85F40(a1, a2, (uint64_t)v13, v16);
  v15((char *)v10 + *(int *)(v8 + 20), v25, v11);
  *v10 = a1;
  v10[1] = a2;
  swift_beginAccess();
  v17 = *(_QWORD *)(v4 + 120);
  swift_bridgeObjectRetain_n();
  swift_retain();
  swift_bridgeObjectRetain();
  v18 = sub_237F84E20(v10, v17);
  swift_bridgeObjectRelease();
  if (v18)
  {
    swift_release();
LABEL_3:
    sub_237F6F6B8((uint64_t)v10);
    type metadata accessor for Downloader();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v18;
    return result;
  }
  type metadata accessor for Engine();
  swift_allocObject();
  v20 = swift_retain();
  v21 = v26;
  sub_237F853C0(v20);
  if (!v21)
  {
    v18 = v22;
    swift_beginAccess();
    v23 = swift_retain();
    sub_237F6F6F4(v23, v10);
    swift_endAccess();
    swift_release();
    goto LABEL_3;
  }
  sub_237F6F6B8((uint64_t)v10);
  return swift_release();
}

double sub_237F6CFC4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  _OWORD *v24;
  double result;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;

  v30 = a2;
  v31 = a3;
  v34 = a4;
  v33 = type metadata accessor for XPCReceivedMessage();
  v29 = *(_QWORD *)(v33 - 8);
  v5 = *(_QWORD *)(v29 + 64);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v32 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237F6F330(&qword_2568B6030);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237F6F330(&qword_2568B6038);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for XPCAsyncSequenceRequest();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v14 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v26 - v15;
  sub_237F6FB4C(&qword_2568B6040, v17, MEMORY[0x24BE171B0]);
  XPCReceivedMessage.decode<A>(as:)();
  sub_237F6C9A4((uint64_t)v9, 0, 1, v10);
  v27 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v27(v16, v9, v10);
  v18 = type metadata accessor for TaskPriority();
  v28 = v7;
  sub_237F6C9A4((uint64_t)v7, 1, 1, v18);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  v19 = v29;
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v32, a1, v33);
  v20 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v21 = (v12 + *(unsigned __int8 *)(v19 + 80) + v20) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v22 = (char *)swift_allocObject();
  *((_QWORD *)v22 + 2) = 0;
  *((_QWORD *)v22 + 3) = 0;
  v23 = v31;
  *((_QWORD *)v22 + 4) = v30;
  *((_QWORD *)v22 + 5) = v23;
  v27(&v22[v20], v14, v10);
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(&v22[v21], v32, v33);
  swift_retain();
  swift_retain();
  sub_237F6DD94((uint64_t)v28, (uint64_t)&unk_2568B6050, (uint64_t)v22);
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
  v24 = (_OWORD *)v34;
  *(_QWORD *)(v34 + 32) = 0;
  result = 0.0;
  *v24 = 0u;
  v24[1] = 0u;
  return result;
}

uint64_t sub_237F6D2A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[4] = a6;
  v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  return swift_task_switch();
}

uint64_t sub_237F6D2C0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = XPCReceivedMessage.auditToken.getter();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = (_QWORD *)swift_task_alloc();
  v0[6] = (uint64_t)v8;
  *v8 = v0;
  v8[1] = sub_237F6D340;
  return sub_237F6D374(v0[4], v1, v3, v5, v7, v0[2], v0[3]);
}

uint64_t sub_237F6D340()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  sub_237F6FDC8();
  v1 = *v0;
  sub_237F6FF60(&v3);
  return sub_237F700B0(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_237F6D374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7[7] = a6;
  v7[8] = a7;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  v8 = sub_237F6F330(&qword_2568B6070);
  v7[9] = v8;
  v7[10] = *(_QWORD *)(v8 - 8);
  v7[11] = swift_task_alloc();
  sub_237F6F330(&qword_2568B6078);
  v7[12] = swift_task_alloc();
  v9 = type metadata accessor for DownloadRequestMessage();
  v7[13] = v9;
  v7[14] = *(_QWORD *)(v9 - 8);
  v7[15] = swift_task_alloc();
  v10 = type metadata accessor for UUID();
  v7[16] = v10;
  v7[17] = *(_QWORD *)(v10 - 8);
  v7[18] = swift_task_alloc();
  v7[19] = swift_task_alloc();
  v7[20] = swift_task_alloc();
  v11 = sub_237F6F330(&qword_2568B6080);
  v7[21] = v11;
  v7[22] = *(_QWORD *)(v11 - 8);
  v7[23] = swift_task_alloc();
  sub_237F6F330(&qword_2568B6088);
  v7[24] = swift_task_alloc();
  v12 = type metadata accessor for UploadRequestMessage();
  v7[25] = v12;
  v7[26] = *(_QWORD *)(v12 - 8);
  v7[27] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237F6D4EC()
{
  uint64_t *v0;
  _QWORD *v1;

  sub_237F6FD80();
  type metadata accessor for JSONDecoder();
  sub_237F70188();
  v0[28] = JSONDecoder.init()();
  XPCAsyncSequenceRequest.data.getter();
  sub_237F6FB4C(&qword_2568B6090, (uint64_t (*)(uint64_t))MEMORY[0x24BE170F0], MEMORY[0x24BE17100]);
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  sub_237F6FE18();
  sub_237F6FD20();
  v1 = (_QWORD *)swift_task_alloc();
  v0[29] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_237F6D734;
  return sub_237F6DED8(v0[23], v0[27]);
}

uint64_t sub_237F6D734()
{
  uint64_t v0;
  uint64_t v1;

  sub_237F6FDC8();
  sub_237F70120();
  *(_QWORD *)(v1 + 240) = v0;
  swift_task_dealloc();
  sub_237F6FDBC();
  return sub_237F6FCB8();
}

uint64_t sub_237F6D780()
{
  uint64_t *v0;
  _QWORD *v1;

  XPCAsyncSequenceRequest.id.getter();
  v1 = (_QWORD *)swift_task_alloc();
  v0[31] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_237F6D7E0;
  return sub_237F6E1FC(v0[23], v0[20], v0[7]);
}

uint64_t sub_237F6D7E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_237F6FDC8();
  v2 = *(_QWORD *)(v1 + 136);
  sub_237F70120();
  *(_QWORD *)(v3 + 256) = v0;
  swift_task_dealloc();
  sub_237F6FF9C(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_237F6FDBC();
  return sub_237F6FCD8();
}

uint64_t sub_237F6D848()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  sub_237F6FD80();
  v2 = *(_QWORD *)(v0 + 208);
  v1 = *(_QWORD *)(v0 + 216);
  sub_237F6FF68(*(_QWORD *)(v0 + 176));
  sub_237F6FD50(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  v3 = *(_QWORD *)(v0 + 256);
  XPCAsyncSequenceRequest.data.getter();
  sub_237F6FB4C(&qword_2568B6098, (uint64_t (*)(uint64_t))MEMORY[0x24BE17150], MEMORY[0x24BE17160]);
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  if (v3)
  {
    sub_237F70058();
    sub_237F6FE18();
    v4 = sub_237F6FF30();
    sub_237F70268(v4, &qword_2568B6078);
    sub_237F70114();
    sub_237F6FB4C(&qword_2568B60A0, (uint64_t (*)(uint64_t))MEMORY[0x24BE17218], MEMORY[0x24BE17220]);
    v5 = sub_237F6FF04();
    sub_237F6FF8C(v6, *MEMORY[0x24BE17210]);
    sub_237F70248();
    sub_237F70068();
    sub_237F6FC7C();
    sub_237F6FCF0(v5);
    sub_237F70270();
    sub_237F6FCE0();
    sub_237F6FEFC();
    sub_237F6FD68();
    sub_237F70284();
    sub_237F6FF44();
    sub_237F70040();
    sub_237F6FDD8();
    sub_237F7002C();
    sub_237F70024();
    sub_237F6FFFC();
    return sub_237F6FC24(*(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    sub_237F6FE18();
    sub_237F6FD20();
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 264) = v8;
    v9 = sub_237F70090(v8);
    return sub_237F6FEA8(v9, v10, v11, v12, v13, v14);
  }
}

uint64_t sub_237F6D9BC()
{
  uint64_t v0;
  uint64_t v1;

  sub_237F6FDC8();
  sub_237F70120();
  *(_QWORD *)(v1 + 272) = v0;
  swift_task_dealloc();
  sub_237F6FDBC();
  return sub_237F6FCB8();
}

uint64_t sub_237F6DA08()
{
  uint64_t *v0;
  _QWORD *v1;

  XPCAsyncSequenceRequest.id.getter();
  v1 = (_QWORD *)swift_task_alloc();
  v0[35] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_237F6DA68;
  return sub_237F6E6D0(v0[11], v0[19], v0[7]);
}

uint64_t sub_237F6DA68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_237F6FDC8();
  v2 = *(_QWORD *)(v1 + 136);
  sub_237F70120();
  *(_QWORD *)(v3 + 288) = v0;
  swift_task_dealloc();
  sub_237F6FF9C(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_237F6FDBC();
  return sub_237F6FCD8();
}

uint64_t sub_237F6DAD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_237F6FD80();
  v2 = *(_QWORD *)(v0 + 112);
  v1 = *(_QWORD *)(v0 + 120);
  sub_237F6FF68(*(_QWORD *)(v0 + 80));
  sub_237F6FD50(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_237F70114();
  sub_237F6FB4C(&qword_2568B60A0, (uint64_t (*)(uint64_t))MEMORY[0x24BE17218], MEMORY[0x24BE17220]);
  v3 = sub_237F6FF04();
  sub_237F6FF8C(v4, *MEMORY[0x24BE17210]);
  sub_237F70248();
  sub_237F70068();
  sub_237F6FC7C();
  sub_237F6FCF0(v3);
  sub_237F70270();
  sub_237F6FCE0();
  sub_237F6FEFC();
  sub_237F6FD68();
  sub_237F70284();
  sub_237F6FF44();
  sub_237F70040();
  sub_237F6FDD8();
  sub_237F7002C();
  sub_237F70024();
  sub_237F6FFFC();
  return sub_237F6FC24(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F6DB94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_237F6FD80();
  v1 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 208);
  swift_release();
  sub_237F6FD50(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  v3 = *(_QWORD *)(v0 + 240);
  sub_237F6FC40();
  sub_237F6FCF0(v3);
  sub_237F70058();
  sub_237F6FCE0();
  sub_237F6FE24();
  sub_237F6FD68();
  sub_237F6FF44();
  sub_237F70040();
  sub_237F7002C();
  sub_237F6FDD8();
  sub_237F70024();
  sub_237F6FFFC();
  sub_237F701A4();
  return sub_237F6FC24(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F6DC0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_237F6FD80();
  v1 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 208);
  swift_release();
  sub_237F6FD70();
  sub_237F6FD50(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  v3 = *(_QWORD *)(v0 + 256);
  sub_237F6FC40();
  sub_237F6FCF0(v3);
  sub_237F70058();
  sub_237F6FCE0();
  sub_237F6FE24();
  sub_237F6FD68();
  sub_237F6FF44();
  sub_237F70040();
  sub_237F7002C();
  sub_237F6FDD8();
  sub_237F70024();
  sub_237F6FFFC();
  sub_237F701A4();
  return sub_237F6FC24(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F6DC90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_237F6FD80();
  v2 = *(_QWORD *)(v0 + 112);
  v1 = *(_QWORD *)(v0 + 120);
  swift_release();
  sub_237F6FD50(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  v3 = *(_QWORD *)(v0 + 272);
  sub_237F6FC40();
  sub_237F6FCF0(v3);
  sub_237F70058();
  sub_237F6FCE0();
  sub_237F6FE24();
  sub_237F6FD68();
  sub_237F6FF44();
  sub_237F70040();
  sub_237F7002C();
  sub_237F6FDD8();
  sub_237F70024();
  sub_237F6FFFC();
  sub_237F701A4();
  return sub_237F6FC24(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F6DD0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_237F6FD80();
  v2 = *(_QWORD *)(v0 + 112);
  v1 = *(_QWORD *)(v0 + 120);
  swift_release();
  sub_237F6FD70();
  sub_237F6FD50(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  v3 = *(_QWORD *)(v0 + 288);
  sub_237F6FC40();
  sub_237F6FCF0(v3);
  sub_237F70058();
  sub_237F6FCE0();
  sub_237F6FE24();
  sub_237F6FD68();
  sub_237F6FF44();
  sub_237F70040();
  sub_237F7002C();
  sub_237F6FDD8();
  sub_237F70024();
  sub_237F6FFFC();
  sub_237F701A4();
  return sub_237F6FC24(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F6DD94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for TaskPriority();
  if (sub_237F6C928(a1, 1, v6) == 1)
  {
    sub_237F6F680(a1, &qword_2568B6030);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_237F6DED8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[3] = a2;
  v3[4] = v2;
  v4 = sub_237F70250(a1);
  v3[5] = v4;
  v3[6] = *(_QWORD *)(v4 - 8);
  v3[7] = sub_237F6FD58();
  v5 = type metadata accessor for AssetUploadRequest();
  v3[8] = v5;
  v3[9] = *(_QWORD *)(v5 - 8);
  v3[10] = sub_237F6FD58();
  v6 = type metadata accessor for UploadRequestMessage();
  v3[11] = v6;
  v3[12] = *(_QWORD *)(v6 - 8);
  v3[13] = sub_237F6FD58();
  sub_237F6FDBC();
  return sub_237F6FCB8();
}

void sub_237F6DF54()
{
  _QWORD *v0;
  int v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_237F70148();
  v1 = sub_237F70220();
  if (v1 == *MEMORY[0x24BE170E0] || v1 == *MEMORY[0x24BE170E8])
  {
    v3 = v0[13];
    sub_237F70278(v0[12]);
    if (*(_QWORD *)(*(_QWORD *)v3 + 16))
    {
      v4 = v0[4];
      sub_237F6FFE0(v0[9]);
      sub_237F701AC();
      v0[14] = AssetUploadRequest.tenantName.getter();
      v0[15] = v5;
      AssetUploadRequest.workingDirectory.getter();
      v0[16] = *(_QWORD *)(v4 + 16);
      sub_237F6FF4C();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_237F6FF70();
    sub_237F700D8();
  }
}

uint64_t sub_237F6E038()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;

  sub_237F6CB44(v0[14], v0[15], v0[7]);
  v0[17] = v1;
  v0[18] = 0;
  sub_237F701AC();
  v2 = (_QWORD *)swift_task_alloc();
  v0[19] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = sub_237F6E0C8;
  return sub_237F70294(v0[2], v0[3]);
}

uint64_t sub_237F6E0C8()
{
  uint64_t v0;
  uint64_t v1;

  sub_237F6FDC8();
  sub_237F70120();
  *(_QWORD *)(v1 + 160) = v0;
  swift_task_dealloc();
  sub_237F6FDBC();
  return sub_237F6FCB8();
}

uint64_t sub_237F6E114()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 48);
  swift_release();
  sub_237F70034(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_237F6FF9C(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_237F70240();
  sub_237F6FE10();
  sub_237F6FE24();
  v3 = (uint64_t (*)(void))sub_237F701B4();
  return sub_237F6FF18(v3);
}

uint64_t sub_237F6E174()
{
  uint64_t v0;

  sub_237F6FFA8();
  sub_237F6FD70();
  sub_237F6FE10();
  sub_237F6FEFC();
  sub_237F6FD68();
  return sub_237F6FCC4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F6E1B4()
{
  uint64_t v0;

  swift_release();
  sub_237F6FFA8();
  sub_237F6FD70();
  sub_237F6FE10();
  sub_237F6FEFC();
  sub_237F6FD68();
  return sub_237F6FCC4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F6E1FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  v4 = type metadata accessor for XPCAsyncSequenceResponse.Event();
  v3[6] = v4;
  v3[7] = *(_QWORD *)(v4 - 8);
  v3[8] = swift_task_alloc();
  v3[9] = swift_task_alloc();
  v5 = type metadata accessor for UUID();
  v3[10] = v5;
  v3[11] = *(_QWORD *)(v5 - 8);
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  v6 = type metadata accessor for XPCAsyncSequenceResponse();
  v3[14] = v6;
  v3[15] = *(_QWORD *)(v6 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  v7 = type metadata accessor for UploadResponseMessage();
  v3[18] = v7;
  v3[19] = *(_QWORD *)(v7 - 8);
  v3[20] = swift_task_alloc();
  sub_237F6F330(&qword_2568B60C8);
  v3[21] = swift_task_alloc();
  v8 = sub_237F6F330(&qword_2568B60D0);
  v3[22] = v8;
  v3[23] = *(_QWORD *)(v8 - 8);
  v3[24] = swift_task_alloc();
  return swift_task_switch();
}

void sub_237F6E358()
{
  uint64_t v0;

  sub_237F700EC();
  sub_237F70188();
  *(_QWORD *)(v0 + 200) = JSONEncoder.init()();
  sub_237F6F330(&qword_2568B6080);
  sub_237F7025C();
}

uint64_t sub_237F6E394()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 208) = v1;
  sub_237F6FD00(v1);
  return sub_237F70004();
}

uint64_t sub_237F6E3C0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;

  v2 = *v1;
  v4 = *v1;
  sub_237F6FF60(&v4);
  if (!v0)
  {
    *(_DWORD *)(v2 + 232) = *MEMORY[0x24BE171C8];
    *(_QWORD *)(v2 + 216) = 0;
  }
  sub_237F6FDBC();
  return sub_237F6FCD8();
}

uint64_t sub_237F6E428()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;

  sub_237F7015C();
  if (!v4)
  {
    sub_237F6FE80();
    sub_237F70100();
    sub_237F6FB4C(&qword_2568B60E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE17128], MEMORY[0x24BE17138]);
    v6 = sub_237F701E0();
    if (!v0)
    {
      sub_237F6FE2C(v6, v7);
      sub_237F701C0();
      sub_237F6FB4C(&qword_2568B60D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE171E0], MEMORY[0x24BE171E8]);
      sub_237F701D0();
      v10 = v1[19];
      v9 = v1[20];
      sub_237F6FF68(v1[15]);
      sub_237F70060(v9, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
      v11 = (_QWORD *)swift_task_alloc();
      v1[28] = v11;
      sub_237F6FD00(v11);
      return sub_237F6FEC4();
    }
    sub_237F70070();
    swift_release();
    sub_237F70230();
    sub_237F70034(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    sub_237F6FD50(v13, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
    goto LABEL_9;
  }
  sub_237F6FDE0();
  v5 = sub_237F7012C();
  sub_237F70210(v5, *MEMORY[0x24BE171D0]);
  sub_237F70200();
  sub_237F6FB4C(&qword_2568B60D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE171E0], MEMORY[0x24BE171E8]);
  sub_237F701F0();
  if (v0)
  {
    sub_237F6FF68(v1[15]);
    sub_237F70068();
LABEL_9:
    sub_237F70048();
    sub_237F70240();
    sub_237F6FE10();
    sub_237F6FE24();
    sub_237F6FD68();
    sub_237F70140();
    sub_237F7019C();
    sub_237F70194();
    sub_237F6FDD8();
    v8 = (uint64_t (*)(void))v1[1];
    return sub_237F6FEE0(v8);
  }
  sub_237F6FE58();
  sub_237F70068();
  sub_237F6FE10();
  sub_237F6FEFC();
  sub_237F6FE24();
  sub_237F6FD68();
  sub_237F70140();
  sub_237F7019C();
  sub_237F70194();
  sub_237F6FDD8();
  sub_237F6FF44();
  v8 = (uint64_t (*)(void))sub_237F701B4();
  return sub_237F6FEE0(v8);
}

uint64_t sub_237F6E5E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 184);
  swift_release();
  sub_237F6FD50(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_237F70048();
  sub_237F6FE10();
  sub_237F6FEFC();
  sub_237F6FE24();
  sub_237F6FD68();
  sub_237F70140();
  sub_237F7019C();
  sub_237F70194();
  sub_237F6FDD8();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237F6E678()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;

  v2 = *v1;
  v4 = *v1;
  sub_237F6FF60(&v4);
  if (!v0)
    *(_QWORD *)(v2 + 216) = 0;
  sub_237F6FDBC();
  return sub_237F6FCD8();
}

uint64_t sub_237F6E6D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  v4 = type metadata accessor for XPCAsyncSequenceResponse.Event();
  v3[6] = v4;
  v3[7] = *(_QWORD *)(v4 - 8);
  v3[8] = swift_task_alloc();
  v3[9] = swift_task_alloc();
  v5 = type metadata accessor for UUID();
  v3[10] = v5;
  v3[11] = *(_QWORD *)(v5 - 8);
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  v6 = type metadata accessor for XPCAsyncSequenceResponse();
  v3[14] = v6;
  v3[15] = *(_QWORD *)(v6 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  v7 = type metadata accessor for DownloadResponseMessage();
  v3[18] = v7;
  v3[19] = *(_QWORD *)(v7 - 8);
  v3[20] = swift_task_alloc();
  sub_237F6F330(&qword_2568B60F0);
  v3[21] = swift_task_alloc();
  v8 = sub_237F6F330(&qword_2568B60F8);
  v3[22] = v8;
  v3[23] = *(_QWORD *)(v8 - 8);
  v3[24] = swift_task_alloc();
  return swift_task_switch();
}

void sub_237F6E82C()
{
  uint64_t v0;

  sub_237F700EC();
  sub_237F70188();
  *(_QWORD *)(v0 + 200) = JSONEncoder.init()();
  sub_237F6F330(&qword_2568B6070);
  sub_237F7025C();
}

uint64_t sub_237F6E868()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 208) = v1;
  sub_237F6FD00(v1);
  return sub_237F70004();
}

uint64_t sub_237F6E894()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;

  v2 = *v1;
  v4 = *v1;
  sub_237F6FF60(&v4);
  if (!v0)
  {
    *(_DWORD *)(v2 + 232) = *MEMORY[0x24BE171C8];
    *(_QWORD *)(v2 + 216) = 0;
  }
  sub_237F6FDBC();
  return sub_237F6FCD8();
}

uint64_t sub_237F6E8FC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;

  sub_237F7015C();
  if (!v4)
  {
    sub_237F6FE80();
    sub_237F70100();
    sub_237F6FB4C(&qword_2568B6100, (uint64_t (*)(uint64_t))MEMORY[0x24BE17178], MEMORY[0x24BE17188]);
    v6 = sub_237F701E0();
    if (!v0)
    {
      sub_237F6FE2C(v6, v7);
      sub_237F701C0();
      sub_237F6FB4C(&qword_2568B60D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE171E0], MEMORY[0x24BE171E8]);
      sub_237F701D0();
      v10 = v1[19];
      v9 = v1[20];
      sub_237F6FF68(v1[15]);
      sub_237F70060(v9, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
      v11 = (_QWORD *)swift_task_alloc();
      v1[28] = v11;
      sub_237F6FD00(v11);
      return sub_237F6FEC4();
    }
    sub_237F70070();
    swift_release();
    sub_237F70230();
    sub_237F70034(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    sub_237F6FD50(v13, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
    goto LABEL_9;
  }
  sub_237F6FDE0();
  v5 = sub_237F7012C();
  sub_237F70210(v5, *MEMORY[0x24BE171D0]);
  sub_237F70200();
  sub_237F6FB4C(&qword_2568B60D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE171E0], MEMORY[0x24BE171E8]);
  sub_237F701F0();
  if (v0)
  {
    sub_237F6FF68(v1[15]);
    sub_237F70068();
LABEL_9:
    sub_237F70048();
    sub_237F70240();
    sub_237F6FE10();
    sub_237F6FE24();
    sub_237F6FD68();
    sub_237F70140();
    sub_237F7019C();
    sub_237F70194();
    sub_237F6FDD8();
    v8 = (uint64_t (*)(void))v1[1];
    return sub_237F6FEE0(v8);
  }
  sub_237F6FE58();
  sub_237F70068();
  sub_237F6FE10();
  sub_237F6FEFC();
  sub_237F6FE24();
  sub_237F6FD68();
  sub_237F70140();
  sub_237F7019C();
  sub_237F70194();
  sub_237F6FDD8();
  sub_237F6FF44();
  v8 = (uint64_t (*)(void))sub_237F701B4();
  return sub_237F6FEE0(v8);
}

uint64_t sub_237F6EABC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;

  v2 = *v1;
  v4 = *v1;
  sub_237F6FF60(&v4);
  if (!v0)
    *(_QWORD *)(v2 + 216) = 0;
  sub_237F6FDBC();
  return sub_237F6FCD8();
}

uint64_t sub_237F6EB14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v8 = sub_237F70250(a1);
  v7[9] = v8;
  v7[10] = *(_QWORD *)(v8 - 8);
  v7[11] = sub_237F6FD58();
  v9 = type metadata accessor for AssetDownloadRequest();
  v7[12] = v9;
  v7[13] = *(_QWORD *)(v9 - 8);
  v7[14] = sub_237F6FD58();
  v10 = type metadata accessor for DownloadRequestMessage();
  v7[15] = v10;
  v7[16] = *(_QWORD *)(v10 - 8);
  v7[17] = sub_237F6FD58();
  sub_237F6FDBC();
  return sub_237F6FCB8();
}

void sub_237F6EB98()
{
  _QWORD *v0;
  int v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_237F70148();
  v1 = sub_237F70220();
  if (v1 == *MEMORY[0x24BE17140] || v1 == *MEMORY[0x24BE17148])
  {
    v3 = v0[17];
    sub_237F70278(v0[16]);
    if (*(_QWORD *)(*(_QWORD *)v3 + 16))
    {
      v4 = v0[8];
      sub_237F6FFE0(v0[13]);
      sub_237F701AC();
      v0[18] = AssetDownloadRequest.tenantName.getter();
      v0[19] = v5;
      AssetDownloadRequest.workingDirectory.getter();
      v0[20] = *(_QWORD *)(v4 + 16);
      sub_237F6FF4C();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_237F6FF70();
    sub_237F700D8();
  }
}

uint64_t sub_237F6EC7C()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[21] = sub_237F6CD88(v0[18], v0[19], v0[11]);
  v0[22] = 0;
  sub_237F701AC();
  v1 = (_QWORD *)swift_task_alloc();
  v0[23] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_237F6ED14;
  return sub_237F7CE9C(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7]);
}

uint64_t sub_237F6ED14()
{
  uint64_t v0;
  uint64_t v1;

  sub_237F6FDC8();
  sub_237F70120();
  *(_QWORD *)(v1 + 192) = v0;
  swift_task_dealloc();
  sub_237F6FDBC();
  return sub_237F6FCB8();
}

uint64_t sub_237F6ED60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 80);
  swift_release();
  sub_237F70034(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_237F6FF9C(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_237F70240();
  sub_237F6FE10();
  sub_237F6FE24();
  v3 = (uint64_t (*)(void))sub_237F701B4();
  return sub_237F6FF18(v3);
}

uint64_t sub_237F6EDC0()
{
  uint64_t v0;

  sub_237F6FFC4();
  sub_237F6FD70();
  sub_237F6FE10();
  sub_237F6FEFC();
  sub_237F6FD68();
  return sub_237F6FCC4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F6EE00()
{
  uint64_t v0;

  swift_release();
  sub_237F6FFC4();
  sub_237F6FD70();
  sub_237F6FE10();
  sub_237F6FEFC();
  sub_237F6FD68();
  return sub_237F6FCC4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F6EE48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
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
  char *v15;
  _QWORD v17[2];

  v17[0] = a3;
  v4 = type metadata accessor for XPCAsyncSequenceResponse.Event();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for UUID();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for XPCAsyncSequenceResponse();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BE171C0], v4);
  XPCAsyncSequenceResponse.init(id:event:)();
  sub_237F6FB4C(&qword_2568B60D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE171E0], MEMORY[0x24BE171E8]);
  dispatch thunk of XPCSession.send<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

double sub_237F6EFDC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return sub_237F6CFC4(a1, *v2, v2[1], a2);
}

uint64_t sub_237F6EFE8()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for Dispatcher();
  v0 = swift_allocObject();
  type metadata accessor for ProcessorFactory();
  swift_allocObject();
  result = sub_237F6C50C();
  *(_QWORD *)(v0 + 16) = result;
  qword_2568B5F80 = v0;
  return result;
}

uint64_t static Dispatcher.shared.getter()
{
  if (qword_2568B5DC0 != -1)
    swift_once();
  return swift_retain();
}

uint64_t Dispatcher.dispatchRequest(_:)()
{
  sub_237F6F0FC();
  return dispatch thunk of XPCListener.IncomingSessionRequest.accept<A>(_:)();
}

uint64_t sub_237F6F0CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  swift_retain();
  return swift_retain();
}

uint64_t sub_237F6F0F4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_237F6F0CC(a1, v2, a2);
}

unint64_t sub_237F6F0FC()
{
  unint64_t result;

  result = qword_2568B5F88;
  if (!qword_2568B5F88)
  {
    result = MEMORY[0x23B828F58](&unk_237F8B258, &type metadata for Dispatcher.Handler);
    atomic_store(result, (unint64_t *)&qword_2568B5F88);
  }
  return result;
}

uint64_t Dispatcher.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t Dispatcher.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Dispatcher()
{
  return objc_opt_self();
}

uint64_t method lookup function for Dispatcher()
{
  return swift_lookUpClassMethod();
}

uint64_t destroy for Dispatcher.Handler()
{
  swift_release();
  return swift_release();
}

void _s16CloudAssetDaemon10DispatcherC7HandlerVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = a2[1];
  *a1 = *a2;
  a1[1] = v2;
  swift_retain();
  swift_retain();
  sub_237F7028C();
}

_QWORD *assignWithCopy for Dispatcher.Handler(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for Dispatcher.Handler(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for Dispatcher.Handler(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Dispatcher.Handler(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Dispatcher.Handler(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Dispatcher.Handler()
{
  return &type metadata for Dispatcher.Handler;
}

uint64_t sub_237F6F330(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B828F40]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_237F6F370()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v1 = *(_QWORD *)(type metadata accessor for XPCAsyncSequenceRequest() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(_QWORD *)(type metadata accessor for XPCReceivedMessage() - 8);
  v5 = (v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  sub_237F6FD50(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_237F70060(v0 + v5, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  return swift_deallocObject();
}

uint64_t sub_237F6F434(uint64_t a1)
{
  _QWORD *v1;
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

  v4 = *(_QWORD *)(type metadata accessor for XPCAsyncSequenceRequest() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for XPCReceivedMessage() - 8) + 80);
  v8 = v5 + v6 + v7;
  v9 = v1[2];
  v10 = v1[3];
  v11 = v1[4];
  v12 = v1[5];
  v13 = (uint64_t)v1 + v5;
  v14 = (uint64_t)v1 + (v8 & ~v7);
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v15;
  *v15 = v2;
  v15[1] = sub_237F6F4FC;
  return sub_237F6D2A4(a1, v9, v10, v11, v12, v13, v14);
}

uint64_t sub_237F6F4FC()
{
  uint64_t v0;

  sub_237F6FD9C();
  return sub_237F700B0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F6F520(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_237F6F584;
  return v6(a1);
}

uint64_t sub_237F6F584()
{
  uint64_t (*v0)(void);

  sub_237F6FD9C();
  v0 = (uint64_t (*)(void))sub_237F701B4();
  return sub_237F700B0(v0);
}

uint64_t sub_237F6F5A8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237F6F5CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_237F6F4FC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2568B6058 + dword_2568B6058))(a1, v4);
}

uint64_t sub_237F6F63C(uint64_t a1, unint64_t a2)
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

void sub_237F6F680(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_237F6F330(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  sub_237F7028C();
}

uint64_t sub_237F6F6B8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ProcessorFactory.TenantDomain();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_237F6F6F4(uint64_t a1, _QWORD *a2)
{
  uint64_t *v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v7;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v2;
  *v2 = 0x8000000000000000;
  sub_237F6F7DC(a1, a2, isUniquelyReferenced_nonNull_native);
  *v2 = v7;
  return swift_bridgeObjectRelease();
}

uint64_t sub_237F6F760(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  *v3 = 0x8000000000000000;
  sub_237F6F95C(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *v3 = v9;
  return swift_bridgeObjectRelease();
}

uint64_t sub_237F6F7DC(uint64_t a1, _QWORD *a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  _BOOL8 v15;
  Swift::Int v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;

  v4 = (_QWORD **)v3;
  v8 = type metadata accessor for ProcessorFactory.TenantDomain();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (_QWORD *)*v3;
  v12 = sub_237F7922C(a2);
  v14 = v11[2];
  v15 = (v13 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_10;
  }
  v17 = v12;
  v18 = v13;
  sub_237F6F330(&qword_2568B60E8);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v16))
    goto LABEL_5;
  v19 = sub_237F7922C(a2);
  if ((v18 & 1) != (v20 & 1))
  {
LABEL_10:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  v17 = v19;
LABEL_5:
  v21 = *v4;
  if ((v18 & 1) != 0)
  {
    v22 = v21[7];
    result = swift_release();
    *(_QWORD *)(v22 + 8 * v17) = a1;
  }
  else
  {
    sub_237F6F918((uint64_t)a2, (uint64_t)v10);
    return sub_237F6FA78(v17, (uint64_t)v10, a1, v21);
  }
  return result;
}

uint64_t sub_237F6F918(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ProcessorFactory.TenantDomain();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_237F6F95C(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  _BOOL8 v14;
  Swift::Int v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  _QWORD *v20;
  _OWORD *v21;
  _OWORD *result;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v11 = sub_237F79370();
  v13 = v10[2];
  v14 = (v12 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_9;
  }
  v16 = v11;
  v17 = v12;
  sub_237F6F330(&qword_2568B6108);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15))
    goto LABEL_5;
  v18 = sub_237F79370();
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_9:
    result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  v16 = v18;
LABEL_5:
  v20 = *v5;
  if ((v17 & 1) != 0)
  {
    v21 = (_OWORD *)(v20[7] + 32 * v16);
    sub_237F6FBF0((uint64_t)v21);
    return sub_237F6FC10(a1, v21);
  }
  else
  {
    sub_237F6FB88(v16, a2, a3, a1, v20);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

uint64_t sub_237F6FA78(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = type metadata accessor for ProcessorFactory.TenantDomain();
  result = sub_237F6FB08(a2, v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

uint64_t sub_237F6FB08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ProcessorFactory.TenantDomain();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_237F6FB4C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x23B828F58](a3, v5), a1);
  }
  sub_237F7028C();
}

_OWORD *sub_237F6FB88(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_237F6FC10(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t sub_237F6FBF0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_OWORD *sub_237F6FC10(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_237F6FC24(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_237F6FC40()
{
  return XPCAsyncSequenceRequest.id.getter();
}

uint64_t sub_237F6FC7C()
{
  return XPCAsyncSequenceRequest.id.getter();
}

uint64_t sub_237F6FCB8()
{
  return swift_task_switch();
}

uint64_t sub_237F6FCC4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_237F6FCD8()
{
  return swift_task_switch();
}

uint64_t sub_237F6FCE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t sub_237F6FCF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_237F6EE48(a1, v2, v1);
}

uint64_t sub_237F6FD00(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 168);
}

uint64_t sub_237F6FD20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_237F6C9A4(v2, 0, 1, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v0, v2, v1);
}

uint64_t sub_237F6FD50@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_237F6FD58()
{
  return swift_task_alloc();
}

uint64_t sub_237F6FD68()
{
  return swift_task_dealloc();
}

uint64_t sub_237F6FD70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_237F6FD9C()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

void sub_237F6FDC8()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t sub_237F6FDD8()
{
  return swift_task_dealloc();
}

uint64_t sub_237F6FDE0()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[23] + 8))(v0[24], v0[22]);
}

uint64_t sub_237F6FE10()
{
  return swift_task_dealloc();
}

uint64_t sub_237F6FE18()
{
  unint64_t v0;
  uint64_t v1;

  return sub_237F6F63C(v1, v0);
}

uint64_t sub_237F6FE24()
{
  return swift_task_dealloc();
}

uint64_t sub_237F6FE2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(unsigned int *)(v2 + 232);
  v4 = *(_QWORD **)(v2 + 72);
  v5 = *(_QWORD *)(v2 + 48);
  v6 = *(_QWORD *)(v2 + 56);
  *v4 = a1;
  v4[1] = a2;
  return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v6 + 104))(v4, v3, v5);
}

uint64_t sub_237F6FE58()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[15] + 8))(v0[16], v0[14]);
}

uint64_t sub_237F6FE80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v1 + 152) + 32))(*(_QWORD *)(v1 + 160), v0, v2);
}

uint64_t sub_237F6FEA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_237F6EB14(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_237F6FEC4()
{
  return _sScs8IteratorV4next9isolationxSgScA_pSgYi_tYaq_YKF();
}

uint64_t sub_237F6FEE0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_237F6FEFC()
{
  return swift_task_dealloc();
}

uint64_t sub_237F6FF04()
{
  return swift_allocError();
}

uint64_t sub_237F6FF18(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_237F6FF30()
{
  uint64_t v0;
  uint64_t v1;

  return sub_237F6C9A4(v1, 1, 1, v0);
}

uint64_t sub_237F6FF44()
{
  return swift_task_dealloc();
}

uint64_t sub_237F6FF4C()
{
  return swift_task_switch();
}

uint64_t sub_237F6FF60@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
  return swift_task_dealloc();
}

uint64_t sub_237F6FF68@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8))();
}

uint64_t sub_237F6FF70()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_237F6FF8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(a1, a2, v2);
}

uint64_t sub_237F6FF9C@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_237F6FFA8()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[6] + 8))(v0[7], v0[5]);
}

uint64_t sub_237F6FFC4()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[10] + 8))(v0[11], v0[9]);
}

uint64_t sub_237F6FFE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 16))(v2, v1 + ((*(unsigned __int8 *)(a1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(a1 + 80)));
}

uint64_t sub_237F6FFFC()
{
  return swift_task_dealloc();
}

uint64_t sub_237F70004()
{
  return _sScs8IteratorV4next9isolationxSgScA_pSgYi_tYaq_YKF();
}

uint64_t sub_237F70014()
{
  return swift_task_switch();
}

uint64_t sub_237F70024()
{
  return swift_task_dealloc();
}

uint64_t sub_237F7002C()
{
  return swift_task_dealloc();
}

uint64_t sub_237F70034@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_237F70040()
{
  return swift_task_dealloc();
}

uint64_t sub_237F70048()
{
  return swift_task_dealloc();
}

void sub_237F70058()
{
  void *v0;

}

uint64_t sub_237F70060@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_237F70068()
{
  return swift_release();
}

uint64_t sub_237F70070()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 200);
}

uint64_t sub_237F70090(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 88);
}

uint64_t sub_237F700B0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_237F700BC()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 200);
}

uint64_t sub_237F700EC()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_237F70100()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v0, v2, v1);
}

uint64_t sub_237F70114()
{
  return type metadata accessor for XPCError();
}

void sub_237F70120()
{
  _QWORD *v0;
  _QWORD *v1;

  *v0 = *v1;
}

uint64_t sub_237F7012C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16))(v1, v3, v2);
}

uint64_t sub_237F70140()
{
  return swift_task_dealloc();
}

uint64_t sub_237F70148()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v2 + 16))(v1, *(_QWORD *)(v3 + 24), v0);
}

uint64_t sub_237F7015C()
{
  uint64_t v0;

  return sub_237F6C928(*(_QWORD *)(v0 + 168), 1, *(_QWORD *)(v0 + 144));
}

uint64_t sub_237F70188()
{
  return swift_allocObject();
}

uint64_t sub_237F70194()
{
  return swift_task_dealloc();
}

uint64_t sub_237F7019C()
{
  return swift_task_dealloc();
}

uint64_t sub_237F701A4()
{
  return swift_task_dealloc();
}

uint64_t sub_237F701AC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_237F701B4()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t sub_237F701C0()
{
  return XPCAsyncSequenceResponse.init(id:event:)();
}

uint64_t sub_237F701D0()
{
  return dispatch thunk of XPCSession.send<A>(_:)();
}

uint64_t sub_237F701E0()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_237F701F0()
{
  return dispatch thunk of XPCSession.send<A>(_:)();
}

uint64_t sub_237F70200()
{
  return XPCAsyncSequenceResponse.init(id:event:)();
}

uint64_t sub_237F70210(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 104))(v2, a2, v3);
}

uint64_t sub_237F70220()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v0);
}

uint64_t sub_237F70230()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_237F70240()
{
  return swift_task_dealloc();
}

uint64_t sub_237F70248()
{
  return swift_willThrow();
}

uint64_t sub_237F70250(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return type metadata accessor for URL();
}

void sub_237F7025C()
{
  JUMPOUT(0x23B8289F4);
}

void sub_237F70268(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_237F6F680(v2, a2);
}

void sub_237F70270()
{
  void *v0;

}

uint64_t sub_237F70278@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 96))(v1);
}

uint64_t sub_237F70284()
{
  return swift_task_dealloc();
}

uint64_t sub_237F70294(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v4 = type metadata accessor for UploadRequestMessage();
  v3[5] = v4;
  v3[6] = *(_QWORD *)(v4 - 8);
  v3[7] = swift_task_alloc();
  sub_237F6FDBC();
  return sub_237F6FCB8();
}

uint64_t sub_237F702EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v8)();
  uint64_t *v9;
  uint64_t v10;

  v2 = *(_QWORD *)(v0 + 48);
  v1 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 40);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 16))(v1, *(_QWORD *)(v0 + 24), v3);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v4 == *MEMORY[0x24BE170E0])
  {
    v5 = *(uint64_t **)(v0 + 56);
    (*(void (**)(uint64_t *, _QWORD))(*(_QWORD *)(v0 + 48) + 96))(v5, *(_QWORD *)(v0 + 40));
    v6 = *v5;
    *(_QWORD *)(v0 + 64) = *v5;
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v7;
    v8 = sub_237F70444;
LABEL_5:
    *v7 = v0;
    v7[1] = v8;
    return sub_237F75878(*(_QWORD *)(v0 + 16), v6);
  }
  v10 = *(_QWORD *)(v0 + 48);
  v9 = *(uint64_t **)(v0 + 56);
  if (v4 == *MEMORY[0x24BE170E8])
  {
    sub_237F7C990(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 96));
    v6 = *v9;
    *(_QWORD *)(v0 + 88) = *v9;
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v7;
    v8 = sub_237F704C4;
    goto LABEL_5;
  }
  sub_237F77634();
  sub_237F7CD9C();
  swift_willThrow();
  sub_237F7C990(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
  sub_237F7CCDC();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237F70444()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  sub_237F6FDC8();
  *v2 = *v1;
  *(_QWORD *)(v3 + 80) = v0;
  swift_task_dealloc();
  sub_237F6FDBC();
  return sub_237F6FCB8();
}

uint64_t sub_237F70494()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_237F70240();
  return sub_237F700B0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F704C4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  sub_237F6FDC8();
  *v2 = *v1;
  *(_QWORD *)(v3 + 104) = v0;
  swift_task_dealloc();
  sub_237F6FDBC();
  return sub_237F6FCB8();
}

uint64_t sub_237F70514()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_237F70240();
  return sub_237F700B0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F70548()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_237F7CCDC();
  return sub_237F700B0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F70578()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_237F7CCDC();
  return sub_237F700B0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F705A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void (*v16)(char *, uint64_t);
  unint64_t v17;
  uint64_t inited;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t result;
  unint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t);
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  unint64_t v59;
  _QWORD v60[13];

  v4 = type metadata accessor for Asset.ID();
  v52 = *(_QWORD *)(v4 - 8);
  v53 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v51 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Asset.Protector();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v49 - v11;
  Asset.protector.getter();
  v13 = Asset.Protector.securityKey.getter();
  v15 = v14;
  v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v12, v6);
  v56 = a2;
  Asset.protector.getter();
  v58 = Asset.Protector.privacyKey.getter();
  v59 = v17;
  v54 = v16;
  v55 = v6;
  v16(v12, v6);
  sub_237F6F330(&qword_2568B6388);
  inited = swift_initStackObject();
  v57 = xmmword_237F8B2A0;
  *(_OWORD *)(inited + 16) = xmmword_237F8B2A0;
  if (!*MEMORY[0x24BE633F0])
  {
    __break(1u);
    goto LABEL_13;
  }
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 40) = v19;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 48) = a1;
  v20 = Dictionary.init(dictionaryLiteral:)();
  if ((sub_237F70A3C(v13, v15) & 1) == 0)
  {
    v50 = v13;
    sub_237F6F330(&qword_2568B63A0);
    v21 = swift_initStackObject();
    *(_OWORD *)(v21 + 16) = v57;
    if (*MEMORY[0x24BE634A0])
    {
      v49 = v15;
      *(_QWORD *)(v21 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
      *(_QWORD *)(v21 + 40) = v22;
      sub_237F6F330(&qword_2568B63A8);
      v23 = swift_initStackObject();
      *(_OWORD *)(v23 + 16) = xmmword_237F8B2B0;
      if (*MEMORY[0x24BE633F8])
      {
        *(_QWORD *)(v23 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
        *(_QWORD *)(v23 + 40) = v24;
        Asset.protector.getter();
        v25 = Asset.Protector.securityKey.getter();
        v27 = v26;
        v54(v10, v55);
        *(_QWORD *)(v23 + 48) = v25;
        *(_QWORD *)(v23 + 56) = v27;
        if (*MEMORY[0x24BE63400])
        {
          *(_QWORD *)(v23 + 64) = static String._unconditionallyBridgeFromObjectiveC(_:)();
          *(_QWORD *)(v23 + 72) = v28;
          v29 = v51;
          Asset.id.getter();
          v30 = Asset.ID.referenceSignature.getter();
          v32 = v31;
          (*(void (**)(char *, uint64_t))(v52 + 8))(v29, v53);
          *(_QWORD *)(v23 + 80) = v30;
          *(_QWORD *)(v23 + 88) = v32;
          *(_QWORD *)(v21 + 48) = Dictionary.init(dictionaryLiteral:)();
          sub_237F6F330(&qword_2568B63B0);
          Dictionary.init(dictionaryLiteral:)();
          sub_237F70A88();
          v34 = v33;
          swift_bridgeObjectRelease();
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v60[0] = v20;
          sub_237F7A9C8(v34, (uint64_t)sub_237F7A5D4, 0, isUniquelyReferenced_nonNull_native, (uint64_t)v60);
          v15 = v49;
          v20 = v60[0];
          swift_bridgeObjectRelease();
          v13 = v50;
          goto LABEL_7;
        }
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
LABEL_14:
      __break(1u);
      goto LABEL_15;
    }
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
LABEL_7:
  v37 = v58;
  v36 = v59;
  if ((sub_237F70A3C(v58, v59) & 1) != 0)
  {
    sub_237F6F63C(v13, v15);
    v38 = v37;
    v39 = v36;
LABEL_11:
    sub_237F6F63C(v38, v39);
    return v20;
  }
  sub_237F6F330(&qword_2568B63A8);
  v40 = swift_initStackObject();
  *(_OWORD *)(v40 + 16) = v57;
  if (*MEMORY[0x24BE633C0])
  {
    *(_QWORD *)(v40 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(_QWORD *)(v40 + 40) = v41;
    Asset.protector.getter();
    v42 = Asset.Protector.privacyKey.getter();
    v44 = v43;
    v54(v12, v55);
    *(_QWORD *)(v40 + 48) = v42;
    *(_QWORD *)(v40 + 56) = v44;
    Dictionary.init(dictionaryLiteral:)();
    sub_237F70CEC();
    v46 = v45;
    swift_bridgeObjectRelease();
    v47 = swift_isUniquelyReferenced_nonNull_native();
    v60[0] = v20;
    sub_237F7A9C8(v46, (uint64_t)sub_237F7A5D4, 0, v47, (uint64_t)v60);
    v20 = v60[0];
    swift_bridgeObjectRelease();
    sub_237F6F63C(v13, v15);
    v38 = v58;
    v39 = v59;
    goto LABEL_11;
  }
LABEL_16:
  __break(1u);
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_237F70A3C(uint64_t a1, unint64_t a2)
{
  return ((uint64_t (*)(void))((char *)sub_237F70A60 + 4 * byte_237F8B2C0[a2 >> 62]))();
}

BOOL sub_237F70A60(uint64_t a1, uint64_t a2)
{
  return BYTE6(a2) == 0;
}

void sub_237F70A88()
{
  _OWORD *v0;
  uint64_t v1;
  _OWORD *v2;
  _OWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
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
  char v24;
  _QWORD *v25;
  uint64_t v26;
  _OWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _OWORD v35[3];
  _OWORD v36[2];

  sub_237F7CB10();
  if (v1)
  {
    sub_237F6F330(&qword_2568B63B8);
    v4 = (_QWORD *)sub_237F7C53C();
  }
  else
  {
    v4 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  sub_237F7C620();
  v7 = v6 & v5;
  sub_237F7C54C();
  v8 = 0;
  v9 = (uint64_t *)&unk_2568B63B0;
  v10 = MEMORY[0x24BEE4AD8] + 8;
  while (1)
  {
    while (1)
    {
      if (v7)
      {
        v32 = (v7 - 1) & v7;
      }
      else
      {
        if (__OFADD__(v8, 1))
          goto LABEL_36;
        sub_237F7CC2C();
        if (v12 == v13)
        {
LABEL_33:
          sub_237F7C99C();
          sub_237F7C778();
          return;
        }
        if (!*(_QWORD *)(v31 + 8 * v11))
        {
          sub_237F7C6EC();
          if (v12 == v13)
            goto LABEL_33;
          sub_237F7C914();
          if (!v14)
          {
            sub_237F7C6EC();
            if (v12 == v13)
              goto LABEL_33;
            sub_237F7C914();
            if (!v15)
            {
              sub_237F7C6EC();
              if (v12 == v13)
                goto LABEL_33;
              sub_237F7C914();
              if (!v16)
              {
                sub_237F7CC2C();
                if (v12 == v13)
                  goto LABEL_33;
                if (!*(_QWORD *)(v31 + 8 * v17))
                {
                  while (!__OFADD__(v17, 1))
                  {
                    sub_237F7C6EC();
                    if (v12 == v13)
                      goto LABEL_33;
                    v17 = v19 + 1;
                    if (*(_QWORD *)(v31 + 8 * v18))
                      goto LABEL_27;
                  }
                  goto LABEL_37;
                }
              }
            }
          }
        }
LABEL_27:
        sub_237F7C7FC();
      }
      v20 = sub_237F7CA98();
      v33 = v21;
      v34 = v20;
      swift_bridgeObjectRetain();
      sub_237F7C8F0();
      sub_237F6F330(v9);
      swift_dynamicCast();
      sub_237F6FC10(v2, v3);
      sub_237F6FC10(v3, v36);
      sub_237F6FC10(v36, v35);
      v22 = sub_237F7C8D0();
      v23 = v22;
      if ((v24 & 1) == 0)
        break;
      v8 = v3;
      v3 = v2;
      v2 = v0;
      v0 = (_OWORD *)v10;
      v10 = (uint64_t)v9;
      v25 = (_QWORD *)(v4[6] + 16 * v22);
      swift_bridgeObjectRelease();
      *v25 = v33;
      v25[1] = v34;
      v9 = (uint64_t *)v10;
      sub_237F7C8B4();
      v27 = (_OWORD *)(v26 + 32 * v23);
      sub_237F6FBF0((uint64_t)v27);
      sub_237F6FC10(v35, v27);
      v7 = v32;
    }
    if (v4[2] >= v4[3])
      break;
    *(_QWORD *)(v30 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    v28 = (_QWORD *)(v4[6] + 16 * v22);
    *v28 = v33;
    v28[1] = v34;
    sub_237F6FC10(v35, (_OWORD *)(v4[7] + 32 * v22));
    sub_237F7CDE4();
    if (v13)
      goto LABEL_35;
    v4[2] = v29;
    v7 = v32;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
}

void sub_237F70CEC()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  _OWORD *v8;
  uint64_t *v9;
  uint64_t *v10;
  int64_t v11;
  uint64_t v12;
  _OWORD *v13;
  char v14;
  char v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _OWORD *v26;
  char v27;
  uint64_t v28;
  _OWORD *v29;
  uint64_t v30;
  int64_t v31;
  _OWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  _OWORD v39[2];

  sub_237F7CB10();
  if (v1)
  {
    sub_237F6F330(&qword_2568B63B8);
    v2 = (_QWORD *)sub_237F7C53C();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v32 = v0 + 8;
  v3 = -1 << *((_BYTE *)v0 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & v0[8];
  v31 = (unint64_t)(63 - v3) >> 6;
  v6 = &v36;
  v7 = &v38;
  sub_237F7C728();
  v8 = 0;
  v9 = (uint64_t *)(MEMORY[0x24BEE4AD8] + 8);
  v10 = (uint64_t *)MEMORY[0x24BDCDDE8];
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        sub_237F7CD78();
        v33 = v5;
      }
      else
      {
        v11 = (int64_t)v8 + 1;
        if (__OFADD__(v8, 1))
          goto LABEL_38;
        if (v11 >= v31)
        {
LABEL_35:
          sub_237F7C2C8();
          return;
        }
        v12 = *((_QWORD *)v32 + v11);
        v13 = (_OWORD *)((char *)v8 + 1);
        if (!v12)
        {
          sub_237F7CC0C();
          if (v14 == v15)
            goto LABEL_35;
          sub_237F7CD6C();
          if (!v12)
          {
            sub_237F7CC0C();
            if (v14 == v15)
              goto LABEL_35;
            sub_237F7CD6C();
            if (!v12)
            {
              sub_237F7CC0C();
              if (v14 == v15)
                goto LABEL_35;
              sub_237F7CD6C();
              if (!v12)
              {
                v17 = v16 + 4;
                if (v17 >= v31)
                  goto LABEL_35;
                v12 = *((_QWORD *)v32 + v17);
                if (!v12)
                {
                  while (!__OFADD__(v17, 1))
                  {
                    sub_237F7CC0C();
                    if (v14 == v15)
                      goto LABEL_35;
                    sub_237F7CD6C();
                    v17 = v18 + 1;
                    if (v12)
                      goto LABEL_29;
                  }
                  goto LABEL_39;
                }
                v13 = (_OWORD *)v17;
              }
            }
          }
        }
LABEL_29:
        v33 = (v12 - 1) & v12;
        v8 = v13;
      }
      v19 = sub_237F7CA98();
      v22 = (uint64_t *)(v21 + 16 * v20);
      v23 = *v22;
      v24 = v22[1];
      v34 = v25;
      v35 = v19;
      swift_bridgeObjectRetain();
      sub_237F7C1D8(v23, v24);
      sub_237F7C8DC();
      sub_237F6FC10(v6, v7);
      sub_237F6FC10(v7, v39);
      sub_237F6FC10(v39, &v37);
      v26 = (_OWORD *)sub_237F7C8D0();
      if ((v27 & 1) == 0)
        break;
      sub_237F7C670();
      *v9 = v34;
      v9[1] = v35;
      v9 = v10;
      v10 = v0;
      v0 = v6;
      v6 = v7;
      v7 = (uint64_t *)v8;
      sub_237F7CD10(v2[7]);
      sub_237F6FC10(&v37, v26);
      v5 = v33;
    }
    if (v2[2] >= v2[3])
      break;
    sub_237F7CCE4();
    sub_237F7C7B8(v28);
    sub_237F6FC10(&v37, v29);
    sub_237F7CDE4();
    if (v15)
      goto LABEL_37;
    v2[2] = v30;
    v5 = v33;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

void sub_237F70F9C()
{
  uint64_t v0;
  _OWORD *v1;
  _OWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _OWORD v30[3];
  _OWORD v31[2];

  sub_237F7CB10();
  if (v0)
  {
    sub_237F6F330(&qword_2568B63B8);
    v3 = sub_237F7C53C();
  }
  else
  {
    v3 = MEMORY[0x24BEE4B00];
  }
  sub_237F7C620();
  v6 = v5 & v4;
  sub_237F7C54C();
  v7 = (_QWORD *)(MEMORY[0x24BEE4AD8] + 8);
  v8 = (_QWORD *)MEMORY[0x24BEE1768];
  while (v6)
  {
    sub_237F7CD78();
    v27 = v6;
LABEL_27:
    v18 = sub_237F7CA98();
    v28 = v19;
    v29 = v18;
    swift_bridgeObjectRetain();
    sub_237F7C8DC();
    sub_237F6FC10(v1, v2);
    sub_237F6FC10(v2, v31);
    sub_237F6FC10(v31, v30);
    v20 = (_OWORD *)sub_237F7C8D0();
    if ((v21 & 1) != 0)
    {
      sub_237F7C670();
      *v7 = v28;
      v7[1] = v29;
      v7 = v8;
      sub_237F7C8B4();
      sub_237F7CD10(v22);
      sub_237F6FC10(v30, v20);
      v6 = v27;
    }
    else
    {
      if (*(_QWORD *)(v3 + 16) >= *(_QWORD *)(v3 + 24))
      {
        __break(1u);
LABEL_34:
        __break(1u);
        __break(1u);
        goto LABEL_35;
      }
      sub_237F7CCE4();
      sub_237F7C7B8(v23);
      sub_237F6FC10(v30, v24);
      sub_237F7CDE4();
      if (v11)
        goto LABEL_34;
      *(_QWORD *)(v3 + 16) = v25;
      v6 = v27;
    }
  }
  sub_237F7CC2C();
  if (v10 == v11)
    goto LABEL_32;
  if (*(_QWORD *)(v26 + 8 * v9))
    goto LABEL_26;
  sub_237F7C6EC();
  if (v10 == v11)
    goto LABEL_32;
  sub_237F7C914();
  if (v12)
    goto LABEL_26;
  sub_237F7C6EC();
  if (v10 == v11)
    goto LABEL_32;
  sub_237F7C914();
  if (v13)
    goto LABEL_26;
  sub_237F7C6EC();
  if (v10 == v11)
    goto LABEL_32;
  sub_237F7C914();
  if (v14)
    goto LABEL_26;
  sub_237F7CC2C();
  if (v10 == v11)
  {
LABEL_32:
    sub_237F7C99C();
    sub_237F7C778();
    return;
  }
  if (*(_QWORD *)(v26 + 8 * v15))
  {
LABEL_26:
    sub_237F7C7FC();
    goto LABEL_27;
  }
  while (!__OFADD__(v15, 1))
  {
    sub_237F7C6EC();
    if (v10 == v11)
      goto LABEL_32;
    v15 = v17 + 1;
    if (*(_QWORD *)(v26 + 8 * v16))
      goto LABEL_26;
  }
LABEL_35:
  __break(1u);
}

void sub_237F7118C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;

  v34 = sub_237F6F330(&qword_2568B6398);
  v3 = MEMORY[0x24BDAC7A8](v34);
  v33 = (uint64_t *)((char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = MEMORY[0x24BDAC7A8](v3);
  v32 = (uint64_t *)((char *)&v28 - v6);
  MEMORY[0x24BDAC7A8](v5);
  v31 = (char *)&v28 - v7;
  v8 = *(_QWORD *)(a1 + 16);
  if (v8)
  {
    v28 = v1;
    v38 = MEMORY[0x24BEE4AF8];
    sub_237F7B188();
    v9 = sub_237F7C158(a1);
    if ((v9 & 0x8000000000000000) == 0)
    {
      v11 = v9;
      if (v9 < 1 << *(_BYTE *)(a1 + 32))
      {
        v12 = a1 + 64;
        v29 = a1 + 64;
        v30 = a1;
        v13 = v34;
        while ((*(_QWORD *)(v12 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
        {
          if ((_DWORD)v10 != *(_DWORD *)(a1 + 36))
            goto LABEL_20;
          v36 = v10;
          v37 = v11 >> 6;
          v35 = v8;
          v14 = v31;
          v15 = &v31[*(int *)(v13 + 48)];
          v16 = *(_QWORD *)(a1 + 56);
          v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v11);
          v18 = type metadata accessor for Asset();
          v19 = *(_QWORD *)(v18 - 8);
          v20 = v16 + *(_QWORD *)(v19 + 72) * v11;
          v21 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
          v21(v15, v20, v18);
          *v14 = v17;
          v22 = (uint64_t)v32;
          *v32 = v17;
          v21((char *)(v22 + *(int *)(v13 + 48)), (uint64_t)v15, v18);
          v23 = v33;
          sub_237F7C2D0(v22, (uint64_t)v33, &qword_2568B6398);
          sub_237F7C3F8((uint64_t)v14, &qword_2568B6398);
          v24 = sub_237F705A8(*v23, (uint64_t)v23 + *(int *)(v13 + 48));
          sub_237F7C3F8((uint64_t)v23, &qword_2568B6398);
          v25 = v38;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_237F7B188();
            v25 = v38;
          }
          v26 = *(_QWORD *)(v25 + 16);
          a1 = v30;
          if (v26 >= *(_QWORD *)(v25 + 24) >> 1)
          {
            sub_237F7B188();
            v25 = v38;
          }
          *(_QWORD *)(v25 + 16) = v26 + 1;
          *(_QWORD *)(v25 + 8 * v26 + 32) = v24;
          if ((uint64_t)v11 >= -(-1 << *(_BYTE *)(a1 + 32)))
            goto LABEL_21;
          v12 = v29;
          if ((*(_QWORD *)(v29 + 8 * v37) & (1 << v11)) == 0)
            goto LABEL_22;
          if ((_DWORD)v36 != *(_DWORD *)(a1 + 36))
            goto LABEL_23;
          v27 = _HashTable.occupiedBucket(after:)();
          v8 = v35 - 1;
          if (v35 == 1)
            return;
          v11 = v27;
          if ((v27 & 0x8000000000000000) == 0)
          {
            v10 = *(unsigned int *)(a1 + 36);
            if (v27 < 1 << *(_BYTE *)(a1 + 32))
              continue;
          }
          goto LABEL_24;
        }
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
      }
    }
LABEL_24:
    __break(1u);
  }
}

uint64_t sub_237F7148C(uint64_t a1)
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
  unint64_t v14;
  uint64_t v15;
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = type metadata accessor for Asset.ID();
  v18 = *(_QWORD *)(v3 - 8);
  v19 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = MEMORY[0x24BEE4AF8];
  if (v6)
  {
    v17[1] = v1;
    v20 = MEMORY[0x24BEE4AF8];
    sub_237F7B264();
    v8 = *(_QWORD *)(type metadata accessor for Asset() - 8);
    v9 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    v10 = *(_QWORD *)(v8 + 72);
    do
    {
      Asset.id.getter();
      v11 = Asset.ID.signature.getter();
      v13 = v12;
      (*(void (**)(char *, uint64_t))(v18 + 8))(v5, v19);
      v7 = v20;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_237F7B264();
        v7 = v20;
      }
      v14 = *(_QWORD *)(v7 + 16);
      if (v14 >= *(_QWORD *)(v7 + 24) >> 1)
      {
        sub_237F7B264();
        v7 = v20;
      }
      *(_QWORD *)(v7 + 16) = v14 + 1;
      v15 = v7 + 16 * v14;
      *(_QWORD *)(v15 + 32) = v11;
      *(_QWORD *)(v15 + 40) = v13;
      v9 += v10;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_237F71608(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = type metadata accessor for Credential();
  v16 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = MEMORY[0x24BEE4AF8];
  if (v6)
  {
    v15 = v1;
    v17 = MEMORY[0x24BEE4AF8];
    sub_237F7B2BC();
    v8 = (_QWORD *)(a1 + 32);
    do
    {
      sub_237F7C21C(v8, v8[3]);
      dispatch thunk of AssetRequest.credential.getter();
      v9 = Credential.accessToken.getter();
      v11 = v10;
      (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v3);
      v7 = v17;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_237F7B2BC();
        v7 = v17;
      }
      v12 = *(_QWORD *)(v7 + 16);
      if (v12 >= *(_QWORD *)(v7 + 24) >> 1)
      {
        sub_237F7B2BC();
        v7 = v17;
      }
      *(_QWORD *)(v7 + 16) = v12 + 1;
      v13 = v7 + 16 * v12;
      *(_QWORD *)(v13 + 32) = v9;
      *(_QWORD *)(v13 + 40) = v11;
      v8 += 5;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_237F71788(uint64_t a1)
{
  uint64_t v1;
  int64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _OWORD *v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[3];
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v14 = MEMORY[0x24BEE4AF8];
    sub_237F7B354(0, v2, 0);
    v4 = v14;
    v5 = (uint64_t *)(a1 + 32);
    while (1)
    {
      v7 = *v5++;
      result = v7;
      if (v7 < 0)
        break;
      *(_QWORD *)&v13[0] = result;
      sub_237F84F54(result, (uint64_t)v13 + 8);
      if (v1)
      {
        swift_release();
        swift_release();
        return v4;
      }
      v14 = v4;
      v9 = *(_QWORD *)(v4 + 16);
      v8 = *(_QWORD *)(v4 + 24);
      if (v9 >= v8 >> 1)
      {
        sub_237F7B354((char *)(v8 > 1), v9 + 1, 1);
        v4 = v14;
      }
      *(_QWORD *)(v4 + 16) = v9 + 1;
      v10 = (_OWORD *)(v4 + 48 * v9);
      v11 = v13[0];
      v12 = v13[2];
      v10[3] = v13[1];
      v10[4] = v12;
      v10[2] = v11;
      if (!--v2)
      {
        swift_release();
        return v4;
      }
    }
    __break(1u);
  }
  else
  {
    swift_release();
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

unint64_t sub_237F718C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t result;
  unint64_t v12;
  char v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD v19[2];
  uint64_t v20;
  char *v21;
  uint64_t v22;

  v5 = type metadata accessor for Asset();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = *(_QWORD *)(a1 + 16);
  if (v8)
  {
    v19[1] = v2;
    v22 = MEMORY[0x24BEE4AF8];
    v21 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_237F7B328(0, v8, 0);
    v9 = v22;
    v10 = (unint64_t *)(a1 + 32);
    v20 = a2;
    while (1)
    {
      v12 = *v10++;
      result = v12;
      if ((v12 & 0x8000000000000000) != 0)
        break;
      if (!*(_QWORD *)(a2 + 16))
        goto LABEL_13;
      result = sub_237F792D8(result);
      if ((v13 & 1) == 0)
        goto LABEL_14;
      v14 = *(_QWORD *)(v6 + 72);
      v15 = v21;
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v21, *(_QWORD *)(a2 + 56) + v14 * result, v5);
      v22 = v9;
      v16 = v5;
      v18 = *(_QWORD *)(v9 + 16);
      v17 = *(_QWORD *)(v9 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_237F7B328(v17 > 1, v18 + 1, 1);
        v15 = v21;
        v9 = v22;
      }
      *(_QWORD *)(v9 + 16) = v18 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v9 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)) + v18 * v14, v15, v16);
      --v8;
      v5 = v16;
      a2 = v20;
      if (!v8)
      {
        swift_bridgeObjectRelease();
        return v9;
      }
    }
    __break(1u);
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_237F71A70(uint64_t a1)
{
  uint64_t v1;
  int64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  __int128 v10[2];
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v11 = MEMORY[0x24BEE4AF8];
    sub_237F7B30C(0, v2, 0);
    v4 = v11;
    v5 = (uint64_t *)(a1 + 32);
    while (1)
    {
      v7 = *v5++;
      result = v7;
      if (v7 < 0)
        break;
      sub_237F84F54(result, (uint64_t)v10);
      if (v1)
      {
        swift_release();
        swift_release();
        return v4;
      }
      v11 = v4;
      v9 = *(_QWORD *)(v4 + 16);
      v8 = *(_QWORD *)(v4 + 24);
      if (v9 >= v8 >> 1)
      {
        sub_237F7B30C((char *)(v8 > 1), v9 + 1, 1);
        v4 = v11;
      }
      *(_QWORD *)(v4 + 16) = v9 + 1;
      sub_237F7C334(v10, v4 + 40 * v9 + 32);
      if (!--v2)
      {
        swift_release();
        return v4;
      }
    }
    __break(1u);
  }
  else
  {
    swift_release();
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_237F71BA0(void (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t result;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  void (*v37)(char *);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;

  v4 = v3;
  v37 = a1;
  v38 = a2;
  v6 = type metadata accessor for Asset();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v36 = (char *)&v30 - v11;
  v12 = type metadata accessor for AssetSkeleton();
  v34 = *(_QWORD *)(v12 - 8);
  v35 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v43 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(a3 + 16);
  v15 = MEMORY[0x24BEE4AF8];
  if (!v14)
    return v15;
  v32 = v10;
  v33 = v7;
  v44 = MEMORY[0x24BEE4AF8];
  sub_237F7B3A4(0, v14, 0);
  result = sub_237F7C158(a3);
  if ((result & 0x8000000000000000) == 0)
  {
    v18 = result;
    if (result < 1 << *(_BYTE *)(a3 + 32))
    {
      v19 = v6;
      v20 = a3 + 64;
      v31 = v6;
      while (1)
      {
        v42 = v14;
        if ((*(_QWORD *)(v20 + 8 * (v18 >> 6)) & (1 << v18)) == 0)
          break;
        if ((_DWORD)v17 != *(_DWORD *)(a3 + 36))
          goto LABEL_22;
        v40 = v17;
        v41 = v18 >> 6;
        v21 = v20;
        v22 = a3;
        v23 = *(_QWORD *)(a3 + 56);
        v24 = v33;
        v25 = v36;
        (*(void (**)(char *, unint64_t, uint64_t))(v33 + 16))(v36, v23 + *(_QWORD *)(v33 + 72) * v18, v19);
        v26 = v32;
        (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v32, v25, v19);
        v15 = v38;
        v37(v26);
        if (v4)
        {
          (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v19);
          swift_release();
          return v15;
        }
        (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v19);
        v15 = v44;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v39 = 0;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_237F7B3A4(0, *(_QWORD *)(v15 + 16) + 1, 1);
          v15 = v44;
        }
        a3 = v22;
        v20 = v21;
        v29 = *(_QWORD *)(v15 + 16);
        v28 = *(_QWORD *)(v15 + 24);
        if (v29 >= v28 >> 1)
        {
          sub_237F7B3A4(v28 > 1, v29 + 1, 1);
          v15 = v44;
        }
        *(_QWORD *)(v15 + 16) = v29 + 1;
        result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v34 + 32))(v15+ ((*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80))+ *(_QWORD *)(v34 + 72) * v29, v43, v35);
        v44 = v15;
        if ((uint64_t)v18 >= -(-1 << *(_BYTE *)(v22 + 32)))
          goto LABEL_23;
        if ((*(_QWORD *)(v21 + 8 * v41) & (1 << v18)) == 0)
          goto LABEL_24;
        if ((_DWORD)v40 != *(_DWORD *)(v22 + 36))
          goto LABEL_25;
        result = _HashTable.occupiedBucket(after:)();
        v14 = v42 - 1;
        if (v42 == 1)
          return v15;
        v18 = result;
        v4 = v39;
        v19 = v31;
        if ((result & 0x8000000000000000) == 0)
        {
          v17 = *(unsigned int *)(v22 + 36);
          if (result < 1 << *(_BYTE *)(v22 + 32))
            continue;
        }
        goto LABEL_26;
      }
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_237F71ED4()
{
  uint64_t v0;
  uint64_t inited;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  sub_237F6F330(&qword_2568B6388);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_237F8B2B0;
  result = *MEMORY[0x24BE63428];
  if (*MEMORY[0x24BE63428])
  {
    *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(_QWORD *)(inited + 40) = v3;
    v4 = swift_bridgeObjectRetain();
    sub_237F7118C(v4);
    v6 = v5;
    swift_bridgeObjectRelease();
    v7 = sub_237F6F330(&qword_2568B6390);
    *(_QWORD *)(inited + 48) = v6;
    *(_QWORD *)(inited + 72) = v7;
    *(_QWORD *)(inited + 80) = 0xD00000000000001BLL;
    *(_QWORD *)(inited + 88) = 0x8000000237F8C540;
    v8 = *(_BYTE *)(v0 + 24);
    *(_QWORD *)(inited + 120) = MEMORY[0x24BEE1328];
    *(_BYTE *)(inited + 96) = v8;
    return Dictionary.init(dictionaryLiteral:)();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_237F71FC8()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_237F71FEC()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  sub_237F7C3B8(v0, qword_2568B6110);
  sub_237F787D0(v0, (uint64_t)qword_2568B6110);
  static LoggerSubsystem.server.getter();
  type metadata accessor for Uploader();
  sub_237F6F330(&qword_2568B64B0);
  String.init<A>(describing:)();
  return Logger.init(subsystem:category:)();
}

void sub_237F72084(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)(v1 + 16) = a1;
  type metadata accessor for Registerer();
  v3 = sub_237F7CCC4();
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v1 + 24) = v3;
  sub_237F7CAF0();
  sub_237F7028C();
}

uint64_t sub_237F720BC(uint64_t a1)
{
  return sub_237F72104(a1, &qword_2568B6490, (uint64_t (*)(_QWORD))MEMORY[0x24BE17018], &qword_2568B6498, &qword_2568B64A0);
}

uint64_t sub_237F720E0(uint64_t a1)
{
  return sub_237F72104(a1, &qword_2568B6450, (uint64_t (*)(_QWORD))MEMORY[0x24BE16FD0], &qword_2568B6458, &qword_2568B6460);
}

uint64_t sub_237F72104(uint64_t a1, uint64_t *a2, uint64_t (*a3)(_QWORD), uint64_t *a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  sub_237F7CB10();
  if (v5)
  {
    sub_237F6F330(a2);
    v10 = sub_237F7C53C();
  }
  else
  {
    v10 = MEMORY[0x24BEE4B00];
  }
  v13 = v10;
  v11 = sub_237F7C728();
  sub_237F7A63C(v11, 1, &v13, a3, a4, a2, a5);
  sub_237F701AC();
  return v13;
}

uint64_t sub_237F721B0(uint64_t a1)
{
  return sub_237F721D8(a1, (uint64_t)&qword_2568B6420, (void (*)(uint64_t, uint64_t, uint64_t *))sub_237F7ABC4);
}

uint64_t sub_237F721C4(uint64_t a1)
{
  return sub_237F721D8(a1, (uint64_t)&qword_2568B6470, (void (*)(uint64_t, uint64_t, uint64_t *))sub_237F7AE9C);
}

uint64_t sub_237F721D8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t *))
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  sub_237F7CB10();
  if (v3)
  {
    sub_237F6F330(v5);
    v6 = sub_237F7C53C();
  }
  else
  {
    v6 = MEMORY[0x24BEE4B00];
  }
  v9 = v6;
  v7 = sub_237F7C728();
  a3(v7, 1, &v9);
  sub_237F701AC();
  return v9;
}

uint64_t sub_237F72258(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = type metadata accessor for Data.Iterator();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_237F7148C(a1);
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    sub_237F7B240(0, v4, 0);
    __asm { BR              X9 }
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_237F72538(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (v3 = a1 + 8 * a2 > a3) : (v3 = 0), v3))
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    sub_237F6F330(&qword_2568B63D8);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_237F72624(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t *v4;
  unint64_t v5;
  char v6;
  char v7;
  BOOL v8;
  uint64_t result;

  if (a2 < 0)
  {
    sub_237F7C508();
    sub_237F7C690();
  }
  else
  {
    sub_237F7CC74();
    sub_237F6F330(v4);
    sub_237F7C9C8();
    if (!v7 & v6)
      v8 = v5 > a3;
    else
      v8 = 0;
    if (!v8)
    {
      sub_237F7CC38();
      return sub_237F7C718();
    }
    sub_237F7C508();
    sub_237F7C6A0();
  }
  result = sub_237F7C530();
  __break(1u);
  return result;
}

uint64_t sub_237F726B8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_237F72784(char *a1, uint64_t a2, char *a3)
{
  void *result;

  if (a2 < 0)
  {
    sub_237F7C508();
    sub_237F7C690();
  }
  else
  {
    if (&a3[8 * a2] <= a1 || &a1[8 * a2] <= a3)
      return sub_237F7C900(a3, a1, 8 * a2);
    sub_237F7C508();
    sub_237F7C6A0();
  }
  result = (void *)sub_237F7C530();
  __break(1u);
  return result;
}

uint64_t sub_237F72818(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_237F728E4(char *a1, size_t a2, char *a3)
{
  void *result;

  if ((a2 & 0x8000000000000000) != 0)
  {
    sub_237F7C508();
    sub_237F7C690();
  }
  else
  {
    if (&a3[a2] <= a1 || &a1[a2] <= a3)
      return sub_237F7C900(a3, a1, a2);
    sub_237F7C508();
    sub_237F7C6A0();
  }
  result = (void *)sub_237F7C530();
  __break(1u);
  return result;
}

void *sub_237F72974(char *__src, uint64_t a2, char *__dst)
{
  void *result;

  if ((a2 & 0x8000000000000000) == 0 && (&__dst[4 * a2] <= __src || &__src[4 * a2] <= __dst))
    return memcpy(__dst, __src, 4 * a2);
  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_237F72A3C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 40 * a2 > a1 ? (v3 = a1 + 40 * a2 > a3) : (v3 = 0), v3))
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    sub_237F6F330(&qword_2568B6400);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_237F72B2C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 48 * a2 > a1 ? (v3 = a1 + 48 * a2 > a3) : (v3 = 0), v3))
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    sub_237F6F330(&qword_2568B6428);
    return swift_arrayInitWithCopy();
  }
  return result;
}

void *sub_237F72C1C(char *__src, uint64_t a2, char *__dst)
{
  void *result;

  if ((a2 & 0x8000000000000000) == 0 && (&__dst[8 * a2] <= __src || &__src[8 * a2] <= __dst))
    return memcpy(__dst, __src, 8 * a2);
  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_237F72CE4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void (*v4)(_QWORD);
  unint64_t v5;
  char v6;
  char v7;
  BOOL v8;
  uint64_t result;

  if (a2 < 0)
  {
    sub_237F7C508();
    sub_237F7C690();
  }
  else
  {
    sub_237F7CC74();
    v4(0);
    sub_237F7C9C8();
    if (!v7 & v6)
      v8 = v5 > a3;
    else
      v8 = 0;
    if (!v8)
    {
      sub_237F7CC38();
      return sub_237F7C718();
    }
    sub_237F7C508();
    sub_237F7C6A0();
  }
  result = sub_237F7C530();
  __break(1u);
  return result;
}

void *sub_237F72D78(char *__src, uint64_t a2, char *__dst)
{
  void *result;

  if ((a2 & 0x8000000000000000) == 0 && (&__dst[32 * a2] <= __src || &__src[32 * a2] <= __dst))
    return memcpy(__dst, __src, 32 * a2);
  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_237F72E40(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 24 * a2 > a1 ? (v3 = a1 + 24 * a2 > a3) : (v3 = 0), v3))
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    sub_237F6F330(&qword_2568B6488);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_237F72F30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10[2];
  char *v11;
  uint64_t v12;

  v1 = sub_237F71608(a1);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v12 = MEMORY[0x24BEE4AF8];
    sub_237F7B298(0, v2, 0);
    v3 = v12;
    v4 = (uint64_t *)(v1 + 40);
    do
    {
      v5 = *v4;
      v10[0] = *(v4 - 1);
      v10[1] = v5;
      sub_237F73040(v10, &v11);
      v6 = v11;
      v12 = v3;
      v8 = *(_QWORD *)(v3 + 16);
      v7 = *(_QWORD *)(v3 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_237F7B298(v7 > 1, v8 + 1, 1);
        v3 = v12;
      }
      v4 += 2;
      *(_QWORD *)(v3 + 16) = v8 + 1;
      *(_QWORD *)(v3 + 8 * v8 + 32) = v6;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  return v3;
}

void sub_237F73040(uint64_t *a1@<X0>, char **a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];
  uint64_t v21[4];

  v5 = type metadata accessor for String.Encoding();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a1;
  v9 = a1[1];
  v21[0] = *a1;
  v21[1] = v9;
  static String.Encoding.utf8.getter();
  sub_237F7C2F8();
  v11 = StringProtocol.cString(using:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v11)
  {
    v12 = *(_QWORD *)(v11 + 16);
    v13 = (char *)swift_slowAlloc();
    sub_237F728E4((char *)(v11 + 32), v12, v13);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_2568B5DC8 != -1)
      swift_once();
    v14 = type metadata accessor for Logger();
    sub_237F787D0(v14, (uint64_t)qword_2568B6110);
    swift_bridgeObjectRetain_n();
    v15 = Logger.logObject.getter();
    v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v20[1] = v2;
      v21[0] = v18;
      v19 = v18;
      *(_DWORD *)v17 = 136315138;
      swift_bridgeObjectRetain();
      v21[3] = sub_237F787F8(v10, v9, v21);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_237F6A000, v15, v16, "unable to convert token %s to C string.", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B828FE8](v19, -1, -1);
      MEMORY[0x23B828FE8](v17, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v13 = 0;
  }
  *a2 = v13;
}

void sub_237F732A4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  _QWORD *v62;
  NSObject *v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  NSObject *v90;
  NSObject *v91;
  __int128 v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;

  v8 = sub_237F6F330(&qword_2568B6370);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v86 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v12 = *a1;
    if (a5)
    {
      *(_QWORD *)&v94 = 0;
      swift_retain();
      static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
      v13 = v94;
      if ((_QWORD)v94)
      {
        if (!*MEMORY[0x24BE63470])
        {
          __break(1u);
LABEL_71:
          __break(1u);
          return;
        }
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        sub_237F84E60(v13, &v94);
        swift_bridgeObjectRelease();
        v14 = *((_QWORD *)&v95 + 1);
        sub_237F7C3F8((uint64_t)&v94, &qword_2568B64C0);
        if (v14)
        {
          static String._unconditionallyBridgeFromObjectiveC(_:)();
          sub_237F84E60(v13, &v92);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v93)
          {
            sub_237F6FC10(&v92, &v94);
            sub_237F7C428();
            swift_dynamicCast();
            v15 = v91;
            if (-[NSObject code](v91, sel_code) == (id)51)
            {
              v90 = v15;
              v16 = -[NSObject localizedDescription](v15, sel_localizedDescription);
              v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
              v19 = v18;

              *(_QWORD *)&v94 = 44;
              *((_QWORD *)&v94 + 1) = 0xE100000000000000;
              MEMORY[0x24BDAC7A8](v20);
              *(&v86 - 2) = (uint64_t)&v94;
              swift_bridgeObjectRetain();
              v21 = sub_237F77714(0x7FFFFFFFFFFFFFFFLL, 1u, sub_237F7C4E8, (uint64_t)(&v86 - 4), v17, v19);
              swift_bridgeObjectRelease();
              v22 = *(_QWORD *)(v21 + 16);
              if (v22)
              {
                v88 = v12;
                v89 = v11;
                v87 = v9;
                *(_QWORD *)&v94 = MEMORY[0x24BEE4AF8];
                sub_237F7B2BC();
                v23 = v94;
                v24 = (uint64_t *)(v21 + 56);
                do
                {
                  v25 = *(v24 - 3);
                  v26 = *(v24 - 2);
                  v28 = *(v24 - 1);
                  v27 = *v24;
                  swift_bridgeObjectRetain();
                  v29 = MEMORY[0x23B8288EC](v25, v26, v28, v27);
                  v31 = v30;
                  swift_bridgeObjectRelease();
                  *(_QWORD *)&v94 = v23;
                  v32 = *(_QWORD *)(v23 + 16);
                  if (v32 >= *(_QWORD *)(v23 + 24) >> 1)
                  {
                    sub_237F7B2BC();
                    v23 = v94;
                  }
                  *(_QWORD *)(v23 + 16) = v32 + 1;
                  v33 = v23 + 16 * v32;
                  *(_QWORD *)(v33 + 32) = v29;
                  *(_QWORD *)(v33 + 40) = v31;
                  v24 += 4;
                  --v22;
                }
                while (v22);
                swift_bridgeObjectRelease();
                v9 = v87;
                v12 = v88;
                v11 = v89;
              }
              else
              {
                swift_bridgeObjectRelease();
                v23 = MEMORY[0x24BEE4AF8];
              }
              v53 = v12 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_storageReferenceContinuation;
              swift_beginAccess();
              v54 = sub_237F6C928(v53, 1, v8);
              v15 = v90;
              if (v54)
              {
                swift_bridgeObjectRelease();
                goto LABEL_47;
              }
              (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v53, v8);
              v55 = type metadata accessor for SimultaneousTransferError();
              sub_237F7C4B4(&qword_2568B64D0, (void (*)(uint64_t))MEMORY[0x24BE171F8]);
              v56 = swift_allocError();
              *v57 = v23;
              (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v55 - 8) + 104))(v57, *MEMORY[0x24BE171F0], v55);
              *(_QWORD *)&v92 = v56;
            }
            else
            {
              v44 = -[NSObject underlyingErrors](v15, sel_underlyingErrors);
              sub_237F6F330(&qword_2568B62F8);
              v45 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

              v46 = *(_QWORD *)(v45 + 16);
              if (v46)
              {
                v89 = v11;
                v90 = v15;
                swift_bridgeObjectRetain();
                v47 = 0;
                while (1)
                {
                  v48 = *(void **)(v45 + 8 * v47 + 32);
                  v49 = v48;
                  v50 = (void *)_convertErrorToNSError(_:)();
                  v51 = objc_msgSend(v50, sel_code);

                  if (v51 == (id)51)
                    break;
                  ++v47;

                  if (v46 == v47)
                  {
                    swift_bridgeObjectRelease();
                    v11 = v89;
                    v15 = v90;
                    goto LABEL_38;
                  }
                }
                swift_bridgeObjectRelease_n();
                swift_getErrorValue();
                v64 = Error.localizedDescription.getter();
                v66 = v65;
                *(_QWORD *)&v94 = 44;
                *((_QWORD *)&v94 + 1) = 0xE100000000000000;
                MEMORY[0x24BDAC7A8](v64);
                *(&v86 - 2) = (uint64_t)&v94;
                swift_bridgeObjectRetain();
                v67 = sub_237F77714(0x7FFFFFFFFFFFFFFFLL, 1u, sub_237F7C4E8, (uint64_t)(&v86 - 4), v64, v66);
                swift_bridgeObjectRelease();
                v68 = *(_QWORD *)(v67 + 16);
                if (v68)
                {
                  v87 = v9;
                  v88 = v12;
                  *(_QWORD *)&v94 = MEMORY[0x24BEE4AF8];
                  sub_237F7B2BC();
                  v69 = v94;
                  v86 = v67;
                  v70 = (uint64_t *)(v67 + 56);
                  do
                  {
                    v71 = *(v70 - 3);
                    v72 = *(v70 - 2);
                    v74 = *(v70 - 1);
                    v73 = *v70;
                    swift_bridgeObjectRetain();
                    v75 = MEMORY[0x23B8288EC](v71, v72, v74, v73);
                    v77 = v76;
                    swift_bridgeObjectRelease();
                    *(_QWORD *)&v94 = v69;
                    v78 = *(_QWORD *)(v69 + 16);
                    if (v78 >= *(_QWORD *)(v69 + 24) >> 1)
                    {
                      sub_237F7B2BC();
                      v69 = v94;
                    }
                    *(_QWORD *)(v69 + 16) = v78 + 1;
                    v79 = v69 + 16 * v78;
                    *(_QWORD *)(v79 + 32) = v75;
                    *(_QWORD *)(v79 + 40) = v77;
                    v70 += 4;
                    --v68;
                  }
                  while (v68);
                  swift_bridgeObjectRelease();
                  v9 = v87;
                  v12 = v88;
                }
                else
                {
                  swift_bridgeObjectRelease();
                  v69 = MEMORY[0x24BEE4AF8];
                }
                v80 = v12 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_storageReferenceContinuation;
                swift_beginAccess();
                v81 = sub_237F6C928(v80, 1, v8);
                v82 = v89;
                if (v81)
                {
                  swift_bridgeObjectRelease();
                }
                else
                {
                  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v89, v80, v8);
                  v83 = type metadata accessor for SimultaneousTransferError();
                  sub_237F7C4B4(&qword_2568B64D0, (void (*)(uint64_t))MEMORY[0x24BE171F8]);
                  v84 = swift_allocError();
                  *v85 = v69;
                  (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v83 - 8) + 104))(v85, *MEMORY[0x24BE171F0], v83);
                  *(_QWORD *)&v92 = v84;
                  CheckedContinuation.resume(throwing:)();
                  (*(void (**)(char *, uint64_t))(v9 + 8))(v82, v8);
                }
                sub_237F862EC();

                v15 = v90;
                goto LABEL_48;
              }
LABEL_38:
              swift_bridgeObjectRelease();
              v52 = v12 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_storageReferenceContinuation;
              swift_beginAccess();
              if (sub_237F6C928(v52, 1, v8))
              {
LABEL_47:
                sub_237F862EC();
LABEL_48:
                if (qword_2568B5DC8 != -1)
                  swift_once();
                v58 = type metadata accessor for Logger();
                sub_237F787D0(v58, (uint64_t)qword_2568B6110);
                v59 = v15;
                v38 = Logger.logObject.getter();
                v60 = static os_log_type_t.error.getter();
                if (os_log_type_enabled(v38, v60))
                {
                  v61 = (uint8_t *)swift_slowAlloc();
                  v62 = (_QWORD *)swift_slowAlloc();
                  *(_DWORD *)v61 = 138412290;
                  *(_QWORD *)&v92 = v59;
                  v63 = v59;
                  UnsafeMutableRawBufferPointer.copyMemory(from:)();
                  *v62 = v59;

                  _os_log_impl(&dword_237F6A000, v38, v60, "mmcs engine returns error %@", v61, 0xCu);
                  sub_237F6F330(&qword_2568B6300);
                  swift_arrayDestroy();
                  MEMORY[0x23B828FE8](v62, -1, -1);
                  MEMORY[0x23B828FE8](v61, -1, -1);

                  goto LABEL_52;
                }

LABEL_54:
                swift_release();
                return;
              }
              (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v52, v8);
              sub_237F77634();
              *(_QWORD *)&v92 = swift_allocError();
            }
            CheckedContinuation.resume(throwing:)();
            (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
            goto LABEL_47;
          }
          goto LABEL_71;
        }
        sub_237F84E60(v13, &v94);
        if (*((_QWORD *)&v95 + 1))
        {
          if ((swift_dynamicCast() & 1) == 0)
          {
            swift_release();
            swift_bridgeObjectRelease();
            return;
          }
          v41 = v92;
          sub_237F84E60(v13, &v94);
          swift_bridgeObjectRelease();
          if (*((_QWORD *)&v95 + 1))
          {
            if ((swift_dynamicCast() & 1) != 0)
            {
              v42 = v92;
              v43 = v12 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_storageReferenceContinuation;
              swift_beginAccess();
              if (!sub_237F6C928(v43, 1, v8))
              {
                (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v43, v8);
                v94 = v41;
                v95 = v42;
                sub_237F7C1D8(v41, *((unint64_t *)&v41 + 1));
                sub_237F7C1D8(v42, *((unint64_t *)&v42 + 1));
                CheckedContinuation.resume(returning:)();
                (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
              }
              sub_237F862EC();
              swift_release();
              sub_237F6F63C(v42, *((unint64_t *)&v42 + 1));
            }
            else
            {
              swift_release();
            }
            sub_237F6F63C(v41, *((unint64_t *)&v41 + 1));
            return;
          }
          swift_release();
          sub_237F6F63C(v41, *((unint64_t *)&v41 + 1));
        }
        else
        {
          swift_release();
          swift_bridgeObjectRelease();
        }
        sub_237F7C3F8((uint64_t)&v94, &qword_2568B64C0);
        return;
      }
    }
    else
    {
      swift_retain();
    }
    sub_237F77634();
    *(_QWORD *)&v94 = swift_allocError();
    sub_237F6F330(&qword_2568B6360);
    AsyncThrowingStream.Continuation.finish(throwing:)();
    if (qword_2568B5DC8 != -1)
      swift_once();
    v37 = type metadata accessor for Logger();
    sub_237F787D0(v37, (uint64_t)qword_2568B6110);
    v38 = Logger.logObject.getter();
    v39 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_237F6A000, v38, v39, "mmcs engine returns nil results", v40, 2u);
      MEMORY[0x23B828FE8](v40, -1, -1);
LABEL_52:
      swift_release();

      return;
    }

    goto LABEL_54;
  }
  if (qword_2568B5DC8 != -1)
    swift_once();
  v34 = type metadata accessor for Logger();
  sub_237F787D0(v34, (uint64_t)qword_2568B6110);
  v90 = Logger.logObject.getter();
  v35 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v90, v35))
  {
    v36 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v36 = 134349056;
    *(_QWORD *)&v94 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_237F6A000, v90, v35, "context for uploading asset with tracking number %{public}llu can not be loaded", v36, 0xCu);
    MEMORY[0x23B828FE8](v36, -1, -1);
  }

}

void sub_237F73F6C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v10;

  v10 = a5;
  sub_237F732A4(a1, a2, a3, a4, (uint64_t)a5);

}

void sub_237F73FE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  _QWORD *v53;
  NSObject *v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  NSObject *v75;
  NSObject *v76;
  __int128 v77;
  uint64_t v78;
  __int128 v79;
  uint64_t v80;

  v7 = sub_237F6F330(&qword_2568B64B8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    if (a4)
    {
      *(_QWORD *)&v79 = 0;
      swift_retain();
      static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
      v11 = v79;
      if ((_QWORD)v79)
      {
        if (*MEMORY[0x24BE63470])
        {
          static String._unconditionallyBridgeFromObjectiveC(_:)();
          sub_237F84E60(v11, &v79);
          swift_bridgeObjectRelease();
          if (v80)
          {
            sub_237F7C3F8((uint64_t)&v79, &qword_2568B64C0);
            static String._unconditionallyBridgeFromObjectiveC(_:)();
            sub_237F84E60(v11, &v77);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v78)
            {
              sub_237F6FC10(&v77, &v79);
              sub_237F7C428();
              swift_dynamicCast();
              v12 = v76;
              if (-[NSObject code](v76, sel_code) == (id)51)
              {
                v13 = -[NSObject localizedDescription](v12, sel_localizedDescription);
                v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                v16 = v15;

                *(_QWORD *)&v79 = 44;
                *((_QWORD *)&v79 + 1) = 0xE100000000000000;
                MEMORY[0x24BDAC7A8](v17);
                *(&v74 - 2) = (uint64_t)&v79;
                swift_bridgeObjectRetain();
                v18 = sub_237F77714(0x7FFFFFFFFFFFFFFFLL, 1u, sub_237F7C4E8, (uint64_t)(&v74 - 4), v14, v16);
                swift_bridgeObjectRelease();
                v19 = *(_QWORD *)(v18 + 16);
                if (v19)
                {
                  v75 = v12;
                  *(_QWORD *)&v79 = MEMORY[0x24BEE4AF8];
                  sub_237F7B2BC();
                  v20 = v79;
                  v21 = (uint64_t *)(v18 + 56);
                  do
                  {
                    v22 = *(v21 - 3);
                    v23 = *(v21 - 2);
                    v24 = *(v21 - 1);
                    v25 = *v21;
                    swift_bridgeObjectRetain();
                    v26 = MEMORY[0x23B8288EC](v22, v23, v24, v25);
                    v28 = v27;
                    swift_bridgeObjectRelease();
                    *(_QWORD *)&v79 = v20;
                    v29 = *(_QWORD *)(v20 + 16);
                    if (v29 >= *(_QWORD *)(v20 + 24) >> 1)
                    {
                      sub_237F7B2BC();
                      v20 = v79;
                    }
                    *(_QWORD *)(v20 + 16) = v29 + 1;
                    v30 = v20 + 16 * v29;
                    *(_QWORD *)(v30 + 32) = v26;
                    *(_QWORD *)(v30 + 40) = v28;
                    v21 += 4;
                    --v19;
                  }
                  while (v19);
                  swift_bridgeObjectRelease();
                  v12 = v75;
                }
                else
                {
                  swift_bridgeObjectRelease();
                  v20 = MEMORY[0x24BEE4AF8];
                }
                v46 = type metadata accessor for SimultaneousTransferError();
                sub_237F7C4B4(&qword_2568B64D0, (void (*)(uint64_t))MEMORY[0x24BE171F8]);
                v47 = swift_allocError();
                *v48 = v20;
                (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v46 - 8) + 104))(v48, *MEMORY[0x24BE171F0], v46);
                *(_QWORD *)&v79 = v47;
              }
              else
              {
                v38 = -[NSObject underlyingErrors](v12, sel_underlyingErrors);
                sub_237F6F330(&qword_2568B62F8);
                v39 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

                v40 = *(_QWORD *)(v39 + 16);
                if (v40)
                {
                  swift_bridgeObjectRetain();
                  v41 = 0;
                  while (1)
                  {
                    v42 = *(void **)(v39 + 8 * v41 + 32);
                    v43 = v42;
                    v44 = (void *)_convertErrorToNSError(_:)();
                    v45 = objc_msgSend(v44, sel_code);

                    if (v45 == (id)51)
                      break;
                    ++v41;

                    if (v40 == v41)
                    {
                      swift_bridgeObjectRelease();
                      goto LABEL_33;
                    }
                  }
                  v75 = v12;
                  swift_bridgeObjectRelease_n();
                  swift_getErrorValue();
                  v55 = Error.localizedDescription.getter();
                  v57 = v56;
                  *(_QWORD *)&v79 = 44;
                  *((_QWORD *)&v79 + 1) = 0xE100000000000000;
                  MEMORY[0x24BDAC7A8](v55);
                  *(&v74 - 2) = (uint64_t)&v79;
                  swift_bridgeObjectRetain();
                  v58 = sub_237F77714(0x7FFFFFFFFFFFFFFFLL, 1u, sub_237F7C464, (uint64_t)(&v74 - 4), v55, v57);
                  swift_bridgeObjectRelease();
                  v59 = *(_QWORD *)(v58 + 16);
                  if (v59)
                  {
                    *(_QWORD *)&v79 = MEMORY[0x24BEE4AF8];
                    sub_237F7B2BC();
                    v60 = v79;
                    v74 = v58;
                    v61 = (uint64_t *)(v58 + 56);
                    do
                    {
                      v62 = *(v61 - 3);
                      v63 = *(v61 - 2);
                      v64 = *(v61 - 1);
                      v65 = *v61;
                      swift_bridgeObjectRetain();
                      v66 = MEMORY[0x23B8288EC](v62, v63, v64, v65);
                      v68 = v67;
                      swift_bridgeObjectRelease();
                      *(_QWORD *)&v79 = v60;
                      v69 = *(_QWORD *)(v60 + 16);
                      if (v69 >= *(_QWORD *)(v60 + 24) >> 1)
                      {
                        sub_237F7B2BC();
                        v60 = v79;
                      }
                      *(_QWORD *)(v60 + 16) = v69 + 1;
                      v70 = v60 + 16 * v69;
                      *(_QWORD *)(v70 + 32) = v66;
                      *(_QWORD *)(v70 + 40) = v68;
                      v61 += 4;
                      --v59;
                    }
                    while (v59);
                    swift_bridgeObjectRelease();
                  }
                  else
                  {
                    swift_bridgeObjectRelease();
                    v60 = MEMORY[0x24BEE4AF8];
                  }
                  v71 = type metadata accessor for SimultaneousTransferError();
                  sub_237F7C4B4(&qword_2568B64D0, (void (*)(uint64_t))MEMORY[0x24BE171F8]);
                  v72 = swift_allocError();
                  *v73 = v60;
                  (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v71 - 8) + 104))(v73, *MEMORY[0x24BE171F0], v71);
                  *(_QWORD *)&v79 = v72;
                  sub_237F6F330(&qword_2568B6360);
                  AsyncThrowingStream.Continuation.finish(throwing:)();

                  v12 = v75;
                  goto LABEL_37;
                }
LABEL_33:
                swift_bridgeObjectRelease();
                sub_237F77634();
                *(_QWORD *)&v79 = swift_allocError();
              }
              sub_237F6F330(&qword_2568B6360);
              AsyncThrowingStream.Continuation.finish(throwing:)();
LABEL_37:
              if (qword_2568B5DC8 != -1)
                swift_once();
              v49 = type metadata accessor for Logger();
              sub_237F787D0(v49, (uint64_t)qword_2568B6110);
              v50 = v12;
              v35 = Logger.logObject.getter();
              v51 = static os_log_type_t.error.getter();
              if (os_log_type_enabled(v35, v51))
              {
                v52 = (uint8_t *)swift_slowAlloc();
                v53 = (_QWORD *)swift_slowAlloc();
                *(_DWORD *)v52 = 138412290;
                *(_QWORD *)&v79 = v50;
                v54 = v50;
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                *v53 = v50;

                _os_log_impl(&dword_237F6A000, v35, v51, "mmcs engine returns error %@", v52, 0xCu);
                sub_237F6F330(&qword_2568B6300);
                swift_arrayDestroy();
                MEMORY[0x23B828FE8](v53, -1, -1);
                MEMORY[0x23B828FE8](v52, -1, -1);

                goto LABEL_41;
              }

LABEL_43:
              swift_release();
              return;
            }
            goto LABEL_54;
          }
          swift_bridgeObjectRelease();
          sub_237F7C3F8((uint64_t)&v79, &qword_2568B64C0);
          if ((a2 & 0x8000000000000000) == 0)
          {
            *(_QWORD *)&v79 = a2;
            sub_237F6F330(&qword_2568B6360);
            AsyncThrowingStream.Continuation.yield(_:)();
            swift_release();
            (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
            return;
          }
          __break(1u);
        }
        __break(1u);
LABEL_54:
        __break(1u);
        return;
      }
    }
    else
    {
      swift_retain();
    }
    sub_237F77634();
    *(_QWORD *)&v79 = swift_allocError();
    sub_237F6F330(&qword_2568B6360);
    AsyncThrowingStream.Continuation.finish(throwing:)();
    if (qword_2568B5DC8 != -1)
      swift_once();
    v34 = type metadata accessor for Logger();
    sub_237F787D0(v34, (uint64_t)qword_2568B6110);
    v35 = Logger.logObject.getter();
    v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_237F6A000, v35, v36, "mmcs engine returns nil results", v37, 2u);
      MEMORY[0x23B828FE8](v37, -1, -1);
LABEL_41:
      swift_release();

      return;
    }

    goto LABEL_43;
  }
  if (qword_2568B5DC8 != -1)
    swift_once();
  v31 = type metadata accessor for Logger();
  sub_237F787D0(v31, (uint64_t)qword_2568B6110);
  v75 = Logger.logObject.getter();
  v32 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v75, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v33 = 134349056;
    *(_QWORD *)&v79 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_237F6A000, v75, v32, "context for uploading asset with tracking number %{public}llu can not be loaded", v33, 0xCu);
    MEMORY[0x23B828FE8](v33, -1, -1);
  }

}

void sub_237F74A48(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;
  id v8;

  sub_237F7CBB8();
  v8 = a4;
  sub_237F73FE4(v5, v4, a3, (uint64_t)a4);

}

void sub_237F74A9C(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[40];

  v4 = sub_237F7C158(a1);
  if ((v6 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v5)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return;
  }
  if (v4 == 1 << *(_BYTE *)(a1 + 32))
  {
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }
  else
  {
    sub_237F7BCF4((uint64_t)v9, v4, v5, 0, a1);
    v8 = v7;
    *(_QWORD *)a2 = v7;
    sub_237F7C34C((uint64_t)v9, (uint64_t)a2 + 8);
    sub_237F7C3F8((uint64_t)&v8, &qword_2568B6418);
  }
}

uint64_t sub_237F74B58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  v4[19] = a3;
  v4[20] = v3;
  v4[17] = a1;
  v4[18] = a2;
  v4[21] = *v3;
  sub_237F6F330(&qword_2568B6338);
  v4[22] = swift_task_alloc();
  v4[23] = swift_task_alloc();
  sub_237F6F330(&qword_2568B6340);
  v4[24] = swift_task_alloc();
  v5 = type metadata accessor for Credential();
  v4[25] = v5;
  v4[26] = *(_QWORD *)(v5 - 8);
  v4[27] = swift_task_alloc();
  return swift_task_switch();
}

void sub_237F74C1C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
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
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int8x16_t *v39;
  _QWORD *v40;
  int8x16_t v41;
  uint64_t v42;
  uint64_t v43;

  *(_QWORD *)(v0 + 224) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 160) + 16) + 24)
                                    + OBJC_IVAR____TtC16CloudAssetDaemon13TenantContext_requestTracker);
  sub_237F7CAF0();
  v1 = sub_237F7CB84();
  v2 = sub_237F7BC28(v1);
  sub_237F7CD94();
  v3 = v2[2];
  if (v3)
  {
    v42 = MEMORY[0x24BEE4AF8];
    sub_237F7B370();
    v4 = v2[4];
    if ((v4 & 0x8000000000000000) != 0)
    {
LABEL_26:
      sub_237F7C508();
      sub_237F7C908();
      _assertionFailure(_:_:file:line:flags:)();
      sub_237F7C5E4();
      return;
    }
    v5 = v42;
    v6 = *(_QWORD *)(v42 + 16);
    v7 = v6 + 1;
    if (v6 >= *(_QWORD *)(v42 + 24) >> 1)
      goto LABEL_28;
    while (1)
    {
      *(_QWORD *)(v5 + 16) = v7;
      *(_QWORD *)(v5 + 8 * v6 + 32) = v4;
      v4 = v3 - 1;
      if (v3 == 1)
        break;
      v22 = 0;
      v6 += 5;
      while (v22 + 1 < v3)
      {
        v23 = v2[v22 + 5];
        if (v23 < 0)
          goto LABEL_26;
        v42 = v5;
        v7 = v6 - 3;
        if (v6 - 4 >= *(_QWORD *)(v5 + 24) >> 1)
          sub_237F7C894();
        *(_QWORD *)(v5 + 16) = v7;
        *(_QWORD *)(v5 + 8 * v6++) = v23;
        if (v4 == ++v22)
          goto LABEL_5;
      }
      __break(1u);
LABEL_28:
      sub_237F7C894();
      v5 = v42;
    }
LABEL_5:
    sub_237F7C860();
  }
  else
  {
    sub_237F7C860();
    v5 = MEMORY[0x24BEE4AF8];
  }
  *(_QWORD *)(v0 + 104) = v5;
  sub_237F7CAF0();
  v8 = sub_237F7CB84();
  v9 = sub_237F71788(v8);
  sub_237F7CD94();
  v10 = sub_237F721D8(v9, (uint64_t)&qword_2568B6420, (void (*)(uint64_t, uint64_t, uint64_t *))sub_237F7ABC4);
  *(_QWORD *)(v0 + 232) = v10;
  v11 = swift_bridgeObjectRetain();
  sub_237F74A9C(v11, (_OWORD *)(v0 + 16));
  v12 = sub_237F7CA78();
  v13 = *(_QWORD *)(v0 + 48);
  v15 = *(_QWORD *)(v0 + 192);
  v14 = *(_QWORD *)(v0 + 200);
  if (!v13)
  {
    sub_237F7CD8C(v12, &qword_2568B6348);
    sub_237F7CD04(v15, 1);
LABEL_18:
    v24 = sub_237F7CA78();
    sub_237F7CD8C(v24, &qword_2568B6340);
    sub_237F77634();
    sub_237F7CD9C();
    swift_willThrow();
    sub_237F7C6B0();
    sub_237F7C95C();
    sub_237F6FE10();
    sub_237F6FEFC();
    sub_237F6FE24();
    sub_237F6FD68();
    sub_237F7C5E4();
    __asm { BR              X0 }
  }
  sub_237F7C21C((_QWORD *)(v0 + 24), v13);
  dispatch thunk of AssetRequest.credential.getter();
  sub_237F7CD04(v15, 0);
  sub_237F6FBF0(v0 + 24);
  if (sub_237F6C928(v15, 1, v14) == 1)
    goto LABEL_18;
  v16 = *(_QWORD *)(v0 + 144);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 208) + 32))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 200));
  v17 = *(_QWORD *)(v0 + 104);
  swift_bridgeObjectRetain();
  v18 = sub_237F7C8F0();
  v19 = sub_237F718C8(v18, v16);
  sub_237F7C8F8();
  v20 = sub_237F72258(v19);
  sub_237F7CA90();
  *(_QWORD *)(v0 + 96) = v20;
  sub_237F7CAF0();
  v21 = sub_237F7C8F0();
  v26 = sub_237F71A70(v21);
  v27 = v0 + 96;
  sub_237F7C8F8();
  v28 = sub_237F72F30(v26);
  sub_237F7CA90();
  *(_QWORD *)(v0 + 112) = v28;
  v29 = *(_QWORD *)(v17 + 16);
  v30 = MEMORY[0x24BEE4AF8];
  if (v29)
  {
    v43 = MEMORY[0x24BEE4AF8];
    sub_237F7C8F0();
    sub_237F7B2F0(0, v29, 0);
    v30 = v43;
    v31 = *(_QWORD *)(v43 + 16);
    do
    {
      v32 = *(_QWORD *)(v43 + 24);
      if (v31 >= v32 >> 1)
        sub_237F7B2F0((char *)(v32 > 1), v31 + 1, 1);
      *(_QWORD *)(v43 + 16) = v31 + 1;
      *(_DWORD *)(v43 + 4 * v31++ + 32) = 1;
      --v29;
    }
    while (v29);
    sub_237F7C8F8();
    v27 = v0 + 96;
  }
  v33 = *(_QWORD *)(v0 + 216);
  v34 = *(_QWORD *)(v0 + 184);
  v35 = *(_QWORD *)(v0 + 144);
  *(_QWORD *)(v0 + 120) = v30;
  v36 = sub_237F6F330(&qword_2568B62E8);
  *(_QWORD *)(v0 + 240) = v36;
  v41 = *(int8x16_t *)(v0 + 152);
  sub_237F7CC94(v34, v37, v38, v36);
  v39 = (int8x16_t *)swift_task_alloc();
  *(_QWORD *)(v0 + 248) = v39;
  v39[1].i64[0] = v34;
  v39[1].i64[1] = v10;
  v39[2].i64[0] = v27;
  v39[2].i64[1] = v0 + 112;
  v39[3] = vextq_s8(v41, v41, 8uLL);
  v39[4].i64[0] = v33;
  v39[4].i64[1] = v35;
  v39[5].i64[0] = v0 + 104;
  v39[5].i64[1] = v0 + 120;
  v40 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 256) = v40;
  sub_237F6F330(&qword_2568B6350);
  *v40 = v0;
  v40[1] = sub_237F75144;
  sub_237F6FDBC();
  sub_237F7C5E4();
  withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

uint64_t sub_237F75144()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 264) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  sub_237F6FE10();
  sub_237F6FDBC();
  return swift_task_switch();
}

uint64_t sub_237F751BC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = v0[30];
  v2 = v0[22];
  sub_237F7C390(v0[23], v2, &qword_2568B6338);
  result = sub_237F6C928(v2, 1, v1);
  if ((_DWORD)result != 1)
  {
    v4 = v0[30];
    v5 = v0[26];
    v6 = v0[22];
    v7 = v0[17];
    swift_release();
    sub_237F7C970(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
    v8 = sub_237F7CB5C(v7, v6, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32));
    sub_237F7CD8C(v8, &qword_2568B6338);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_237F7019C();
    sub_237F6FDD8();
    sub_237F70240();
    sub_237F6FD68();
    sub_237F7C9FC();
    __asm { BR              X4 }
  }
  __break(1u);
  return result;
}

uint64_t sub_237F752C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 184);
  swift_release();
  sub_237F7C990(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_237F7C3F8(v2, &qword_2568B6338);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_237F7C95C();
  sub_237F6FE10();
  sub_237F6FEFC();
  sub_237F6FE24();
  sub_237F6FD68();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237F75358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  __int128 v24;
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
  __int128 v35;
  uint64_t v36;

  v25 = a7;
  v26 = a8;
  v27 = a2;
  v24 = a9;
  v15 = sub_237F6F330(&qword_2568B6358);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_237F6F330(&qword_2568B6338);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v24 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = a3;
  v29 = a1;
  v30 = a4;
  v31 = a5;
  v32 = a6;
  v33 = v25;
  v34 = v26;
  v35 = v24;
  v36 = a10;
  (*(void (**)(char *, _QWORD, uint64_t))(v16 + 104))(v18, *MEMORY[0x24BEE6CA0], v15);
  AsyncThrowingStream.init<>(_:bufferingPolicy:_:)();
  v22 = sub_237F6F330(&qword_2568B62E8);
  sub_237F6C9A4((uint64_t)v21, 0, 1, v22);
  return sub_237F7C280((uint64_t)v21, v27);
}

uint64_t sub_237F754C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, NSURL *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t inited;
  Class isa;
  uint64_t *v31;
  int v32;
  _QWORD v34[3];
  NSURL *reserved;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v36 = a7;
  v37 = a8;
  reserved = a6;
  v38 = a5;
  v39 = a11;
  v40 = a10;
  v14 = sub_237F6F330(&qword_2568B6360);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_237F6F330(&qword_2568B6368);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_237F6F330(&qword_2568B6370);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v20, a3, v21);
  sub_237F6C9A4((uint64_t)v20, 0, 1, v21);
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v34[1] = v14;
  v34[2] = a1;
  v22(v17, a1, v14);
  type metadata accessor for UploadRequestContext();
  swift_allocObject();
  v23 = swift_bridgeObjectRetain();
  v24 = sub_237F86388(v23, (uint64_t)v20, (uint64_t)v17);
  reserved = (NSURL *)reserved->_baseURL->_reserved;
  URL._bridgeToObjectiveC()(reserved);
  v26 = v25;
  v27 = Credential.requestorID.getter();
  v28 = (void *)MEMORY[0x23B8288A4](v27);
  swift_bridgeObjectRelease();
  v37 = v24;
  type metadata accessor for Uploader.OptionsBuilder();
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 16) = a9;
  *(_BYTE *)(inited + 24) = 1;
  sub_237F71ED4();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_237F77670();
  v40 = a4;
  swift_bridgeObjectRetain();
  v31 = v38;
  sub_237F77670();
  v32 = MMCSPutItems();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v32)
  {
    sub_237F77634();
    v41 = swift_allocError();
    AsyncThrowingStream.Continuation.finish(throwing:)();
  }
  sub_237F757C0(v40, v31);
  return swift_release();
}

uint64_t sub_237F757C0(uint64_t result, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  uint64_t v10;

  v3 = *(_QWORD *)result;
  v4 = *(_QWORD *)(*(_QWORD *)result + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    for (i = 0; i != v4; ++i)
    {
      v6 = *(_QWORD *)(v3 + 8 * i + 32);
      if (v6)
        MEMORY[0x23B828FE8](v6, -1, -1);
    }
    result = swift_bridgeObjectRelease();
  }
  v7 = *a2;
  v8 = *(_QWORD *)(v7 + 16);
  if (v8)
  {
    swift_bridgeObjectRetain();
    for (j = 0; j != v8; ++j)
    {
      v10 = *(_QWORD *)(v7 + 8 * j + 32);
      if (v10)
        MEMORY[0x23B828FE8](v10, -1, -1);
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_237F75878(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[7] = a2;
  v3[8] = v2;
  v3[6] = a1;
  v3[9] = *v2;
  v4 = sub_237F6F330(&qword_2568B6290);
  v3[10] = v4;
  v3[11] = *(_QWORD *)(v4 - 8);
  v3[12] = swift_task_alloc();
  v5 = type metadata accessor for Credential();
  v3[13] = v5;
  v3[14] = *(_QWORD *)(v5 - 8);
  v3[15] = swift_task_alloc();
  v6 = type metadata accessor for URL();
  v3[16] = v6;
  v3[17] = *(_QWORD *)(v6 - 8);
  v3[18] = swift_task_alloc();
  v7 = type metadata accessor for TaskPriority();
  v3[19] = v7;
  v3[20] = *(_QWORD *)(v7 - 8);
  v3[21] = swift_task_alloc();
  return swift_task_switch();
}

void sub_237F75960(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, os_log_type_t type, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  os_log_type_t v32;
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
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  os_log_type_t v54;
  uint64_t v55[9];
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;

  sub_237F6FD80();
  v57 = v27;
  v58 = v28;
  v56 = v26;
  if (qword_2568B5DC8 != -1)
    swift_once();
  v29 = sub_237F7C8AC();
  v30 = sub_237F787D0(v29, (uint64_t)qword_2568B6110);
  v26[22] = v30;
  sub_237F7CDF8();
  v31 = Logger.logObject.getter();
  v32 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v31, v32))
  {
    v54 = v32;
    v33 = v26[21];
    v53 = v26[20];
    v52 = v26[19];
    v34 = sub_237F7C528();
    v55[0] = sub_237F7C528();
    *(_DWORD *)v34 = 136315394;
    v35 = type metadata accessor for AssetUploadRequest();
    v36 = sub_237F7C728();
    v37 = MEMORY[0x23B828958](v36, v35);
    v39 = v38;
    sub_237F701AC();
    v26[4] = sub_237F787F8(v37, v39, v55);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_237F7C5D4();
    *(_WORD *)(v34 + 12) = 2080;
    static Task<>.currentPriority.getter();
    sub_237F7C4B4(&qword_2568B6298, (void (*)(uint64_t))MEMORY[0x24BEE6990]);
    v40 = dispatch thunk of CustomStringConvertible.description.getter();
    v42 = v41;
    (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v33, v52);
    v26[5] = sub_237F787F8(v40, v42, v55);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    sub_237F7CA60();
    _os_log_impl(&dword_237F6A000, v31, v54, "processing stream %s with priority %s", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy();
    sub_237F7C51C();
  }
  sub_237F7C5D4();

  if (*(_QWORD *)(v26[7] + 16))
  {
    v43 = type metadata accessor for AssetUploadRequest();
    sub_237F7CDA8();
    AssetUploadRequest.storageLocation.getter();
    AssetUploadRequest.credential.getter();
    sub_237F7CDF8();
    v44 = v30;
    Logger.logObject.getter();
    v45 = sub_237F7CC8C();
    if (os_log_type_enabled(v30, v45))
    {
      v46 = (uint8_t *)sub_237F7C528();
      v55[0] = sub_237F7C528();
      *(_DWORD *)v46 = 136315138;
      v47 = swift_bridgeObjectRetain();
      v48 = MEMORY[0x23B828958](v47, v43);
      v50 = v49;
      sub_237F7CA90();
      v26[3] = sub_237F787F8(v48, v50, v55);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_237F7C5D4();
      sub_237F7C754(&dword_237F6A000, v44, v45, "start registering assets with requests %s", v46);
      sub_237F7C730();
      sub_237F7C51C();
    }
    sub_237F7C5D4();

    v51 = (_QWORD *)swift_task_alloc();
    v26[23] = v51;
    *v51 = v26;
    v51[1] = sub_237F75D1C;
    sub_237F87240(v26[7]);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_237F75D1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 192) = a1;
  *(_QWORD *)(v3 + 200) = v1;
  swift_task_dealloc();
  sub_237F6FDBC();
  return sub_237F6FCB8();
}

uint64_t sub_237F75D7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
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
  _QWORD *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  sub_237F6FD80();
  v24 = v1;
  v25 = v2;
  v23 = v0;
  v3 = *(NSObject **)(v0 + 176);
  sub_237F7CDF8();
  Logger.logObject.getter();
  v4 = sub_237F7CC8C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)sub_237F7C528();
    v22 = sub_237F7C528();
    *(_DWORD *)v5 = 136315138;
    sub_237F7CDF0();
    sub_237F7C8F0();
    v6 = Dictionary.description.getter();
    v8 = v7;
    sub_237F7C8F8();
    *(_QWORD *)(v0 + 16) = sub_237F787F8(v6, v8, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_237F7C5D4();
    sub_237F7C754(&dword_237F6A000, v3, v4, "start transfer assets %s", v5);
    sub_237F7C730();
    sub_237F7C51C();
  }
  sub_237F7C5D4();

  v9 = *(_QWORD *)(v0 + 192);
  v10 = *(_QWORD *)(v0 + 144);
  v11 = *(_QWORD *)(v0 + 120);
  v21 = *(_QWORD *)(v0 + 128);
  v12 = *(_QWORD *)(v0 + 96);
  v20 = *(_QWORD *)(v0 + 136);
  v14 = *(_QWORD *)(v0 + 80);
  v13 = *(_QWORD *)(v0 + 88);
  v16 = *(_QWORD *)(v0 + 64);
  v15 = *(_QWORD *)(v0 + 72);
  v19 = *(_QWORD *)(v0 + 112);
  v17 = (_QWORD *)swift_task_alloc();
  v17[2] = v16;
  v17[3] = v9;
  v17[4] = v10;
  v17[5] = v11;
  v17[6] = v15;
  type metadata accessor for UploadResponseMessage();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v13 + 104))(v12, *MEMORY[0x24BEE6CA0], v14);
  AsyncThrowingStream.init<>(_:bufferingPolicy:_:)();
  sub_237F7CA90();
  sub_237F7CD60(v19);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v10, v21);
  sub_237F6FE24();
  sub_237F6FFFC();
  sub_237F6FEFC();
  sub_237F6FE10();
  sub_237F70240();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237F75F9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 136);
  v1 = *(_QWORD *)(v0 + 144);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 112) + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 104));
  sub_237F70060(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_237F70240();
  sub_237F6FE10();
  sub_237F6FE24();
  sub_237F6FD68();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237F76014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;

  v34 = a3;
  v35 = a6;
  v31 = a5;
  v32 = a1;
  v29 = a4;
  v33 = a2;
  v38 = sub_237F6F330(&qword_2568B62A8);
  v36 = *(_QWORD *)(v38 - 8);
  v6 = *(_QWORD *)(v36 + 64);
  MEMORY[0x24BDAC7A8](v38);
  v37 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Credential();
  v8 = *(_QWORD *)(v7 - 8);
  v27 = v7;
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v28 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for URL();
  v11 = *(_QWORD *)(v10 - 8);
  v26 = v10;
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_237F6F330(&qword_2568B6030);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = v16;
  v17 = type metadata accessor for TaskPriority();
  sub_237F6C9A4((uint64_t)v16, 1, 1, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v29, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v31, v7);
  v18 = v36;
  (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v37, v32, v38);
  v19 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v20 = (v12 + *(unsigned __int8 *)(v8 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v21 = (v9 + *(unsigned __int8 *)(v18 + 80) + v20) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v22 = (char *)swift_allocObject();
  *((_QWORD *)v22 + 2) = 0;
  *((_QWORD *)v22 + 3) = 0;
  v23 = v34;
  *((_QWORD *)v22 + 4) = v33;
  *((_QWORD *)v22 + 5) = v23;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v22[v19], v13, v26);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v22[v20], v28, v27);
  (*(void (**)(char *, char *, uint64_t))(v36 + 32))(&v22[v21], v37, v38);
  *(_QWORD *)&v22[(v6 + v21 + 7) & 0xFFFFFFFFFFFFFFF8] = v35;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_237F6DD94((uint64_t)v30, (uint64_t)&unk_2568B62B8, (uint64_t)v22);
  return swift_release();
}

uint64_t sub_237F76284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;

  v8[18] = a7;
  v8[19] = a8;
  v8[17] = a5;
  v11 = type metadata accessor for SimultaneousTransferError();
  v8[20] = v11;
  v8[21] = *(_QWORD *)(v11 - 8);
  v8[22] = swift_task_alloc();
  sub_237F6F330(&qword_2568B62C0);
  v8[23] = swift_task_alloc();
  v8[24] = sub_237F6F330(&qword_2568B62C8);
  v8[25] = swift_task_alloc();
  v12 = sub_237F6F330(&qword_2568B62D0);
  v8[26] = v12;
  v8[27] = *(_QWORD *)(v12 - 8);
  v8[28] = swift_task_alloc();
  v8[29] = swift_task_alloc();
  v13 = sub_237F6F330(&qword_2568B62D8);
  v8[30] = v13;
  v8[31] = *(_QWORD *)(v13 - 8);
  v8[32] = swift_task_alloc();
  v14 = type metadata accessor for UploadResponseMessage();
  v8[33] = v14;
  v8[34] = *(_QWORD *)(v14 - 8);
  v8[35] = swift_task_alloc();
  v15 = sub_237F6F330(&qword_2568B62E0);
  v8[36] = v15;
  v8[37] = *(_QWORD *)(v15 - 8);
  v8[38] = swift_task_alloc();
  v16 = sub_237F6F330(&qword_2568B62E8);
  v8[39] = v16;
  v8[40] = *(_QWORD *)(v16 - 8);
  v8[41] = swift_task_alloc();
  v17 = swift_task_alloc();
  v8[42] = v17;
  v18 = (_QWORD *)swift_task_alloc();
  v8[43] = v18;
  *v18 = v8;
  v18[1] = sub_237F7646C;
  return sub_237F74B58(v17, a5, a6);
}

uint64_t sub_237F7646C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  v6 = (_QWORD *)*v5;
  v6[44] = a1;
  v6[45] = a2;
  v6[46] = a3;
  v6[47] = a4;
  v6[48] = v4;
  swift_task_dealloc();
  sub_237F6FDBC();
  return sub_237F6FCB8();
}

uint64_t sub_237F764D4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v1 = v0 + 17;
  v2 = v0[17];
  v3 = v0[47];
  v4 = v0[45];
  v5 = v0[46];
  v6 = v0[44];
  v28 = v0[37];
  v7 = (uint64_t *)v0[35];
  v27 = v0[34];
  v8 = v0[18];
  v9 = (_QWORD *)swift_task_alloc();
  v9[2] = v8;
  v9[3] = v6;
  v9[4] = v4;
  v9[5] = v5;
  v9[6] = v3;
  swift_bridgeObjectRetain();
  v10 = sub_237F71BA0((void (*)(char *))sub_237F790F8, (uint64_t)v9, v2);
  sub_237F7CA60();
  v11 = sub_237F6FD68();
  *v7 = v10;
  v12 = *MEMORY[0x24BE17108];
  v1[32] = *(_QWORD *)(v27 + 104);
  sub_237F7CBD8(v11, v12);
  sub_237F7C868();
  v13 = sub_237F6F330(&qword_2568B62A8);
  v14 = v13;
  v1[33] = v13;
  sub_237F7CA68();
  v1[34] = *(_QWORD *)(v28 + 8);
  sub_237F7CD1C();
  v15 = Signal.init()();
  sub_237F7CBD8(v15, *MEMORY[0x24BE17120]);
  sub_237F7CA68();
  sub_237F7CD1C();
  if (qword_2568B5DC8 != -1)
    swift_once();
  v16 = sub_237F7C8AC();
  v17 = sub_237F787D0(v16, (uint64_t)qword_2568B6110);
  sub_237F7C868();
  Logger.logObject.getter();
  v18 = sub_237F7CC8C();
  if (sub_237F7C6B8(v18))
  {
    v19 = (uint8_t *)sub_237F7C528();
    v30 = sub_237F7C528();
    *(_DWORD *)v19 = 136315138;
    v20 = type metadata accessor for AssetSkeleton();
    v21 = sub_237F7C868();
    v22 = MEMORY[0x23B828958](v21, v20);
    v24 = v23;
    swift_bridgeObjectRelease();
    *(v1 - 1) = sub_237F787F8(v22, v24, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_237F7C5D4();
    sub_237F7C754(&dword_237F6A000, v17, v14, "send back ephemeral assets %s", v19);
    sub_237F7C730();
    sub_237F7C51C();
  }
  sub_237F7C5D4();

  v25 = *(_QWORD *)(v29 + 136);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v29 + 320) + 16))(*(_QWORD *)(v29 + 328), *(_QWORD *)(v29 + 336), *(_QWORD *)(v29 + 312));
  *(_QWORD *)(sub_237F7CCC4() + 16) = v25;
  *(_QWORD *)(v29 + 416) = sub_237F7CDF0();
  sub_237F791F8(&qword_2568B6318, &qword_2568B62E8);
  sub_237F7CB84();
  AsyncMapSequence.init(_:transform:)();
  AsyncMapSequence.base.getter();
  dispatch thunk of AsyncSequence.makeAsyncIterator()();
  AsyncMapSequence.Iterator.transform.getter();
  AsyncMapSequence.Iterator.init(_:transform:)();
  *(_DWORD *)(v29 + 60) = *MEMORY[0x24BE17230];
  *(_DWORD *)(v29 + 464) = *MEMORY[0x24BE17110];
  sub_237F6FDBC();
  sub_237F7C5E4();
  return swift_task_switch();
}

uint64_t sub_237F7685C()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 424) = AsyncMapSequence.Iterator.baseIterator.modify();
  sub_237F791F8(&qword_2568B6320, &qword_2568B62C8);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 432) = v1;
  *v1 = v0;
  v1[1] = sub_237F76904;
  sub_237F6FDBC();
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj();
}

uint64_t sub_237F76904()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (!v0)
    (*(void (**)(uint64_t, _QWORD))(v2 + 424))(v2 + 16, 0);
  sub_237F6FDBC();
  return swift_task_switch();
}

uint64_t sub_237F76970(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  _QWORD *v11;
  int *v12;

  if ((*(_BYTE *)(v3 + 56) & 1) != 0)
  {
    sub_237F7CC94(*(_QWORD *)(v3 + 184), a2, a3, *(_QWORD *)(v3 + 416));
    sub_237F6FDBC();
    return swift_task_switch();
  }
  else
  {
    v6 = *(_QWORD *)(v3 + 224);
    v5 = *(_QWORD *)(v3 + 232);
    v7 = *(_QWORD *)(v3 + 208);
    v8 = *(_QWORD *)(v3 + 216);
    *(_QWORD *)(v3 + 96) = *(_QWORD *)(v3 + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v5, v7);
    v9 = (int *)AsyncMapSequence.Iterator.transform.getter();
    *(_QWORD *)(v3 + 448) = v10;
    sub_237F70060(v6, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
    v12 = (int *)((char *)v9 + *v9);
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v3 + 456) = v11;
    *v11 = v3;
    v11[1] = sub_237F76E48;
    return ((uint64_t (*)(_QWORD, uint64_t))v12)(*(_QWORD *)(v3 + 184), v3 + 96);
  }
}

uint64_t sub_237F76A64()
{
  _QWORD *v0;
  void (*v1)(_QWORD *, uint64_t);

  v1 = (void (*)(_QWORD *, uint64_t))v0[53];
  v0[55] = v0[15];
  v1(v0 + 2, 1);
  sub_237F6FDBC();
  return sub_237F6FCB8();
}

#error "237F76B94: call analysis failed (funcsize=210)"

uint64_t sub_237F76E48()
{
  sub_237F6FDC8();
  sub_237F7CB4C();
  swift_release();
  sub_237F6FDBC();
  return sub_237F6FCB8();
}

uint64_t sub_237F76E84()
{
  uint64_t v0;

  sub_237F6C9A4(*(_QWORD *)(v0 + 184), 0, 1, *(_QWORD *)(v0 + 416));
  sub_237F6FDBC();
  return sub_237F6FCB8();
}

uint64_t sub_237F76EC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 416);
  v2 = *(_QWORD *)(v0 + 184);
  if (sub_237F6C928(v2, 1, v1) == 1)
  {
    v3 = *(_QWORD *)(v0 + 368);
    v4 = *(_QWORD *)(v0 + 376);
    v5 = *(_QWORD *)(v0 + 320);
    v16 = *(_QWORD *)(v0 + 312);
    v18 = *(_QWORD *)(v0 + 336);
    v6 = *(_QWORD *)(v0 + 216);
    sub_237F6F63C(*(_QWORD *)(v0 + 352), *(_QWORD *)(v0 + 360));
    sub_237F6F63C(v3, v4);
    sub_237F7C970(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    sub_237F7CA40();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v18, v16);
    *(_QWORD *)(v0 + 64) = 0;
    sub_237F6F330(&qword_2568B62A8);
    AsyncThrowingStream.Continuation.finish(throwing:)();
    sub_237F6FE10();
    sub_237F6FEFC();
    sub_237F6FE24();
    sub_237F6FD68();
    sub_237F70140();
    sub_237F7019C();
    sub_237F70194();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_237F7C9FC();
    __asm { BR              X0 }
  }
  v8 = *(unsigned int *)(v0 + 464);
  v9 = *(unsigned int *)(v0 + 60);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 392);
  v11 = *(_QWORD *)(v0 + 304);
  v12 = *(_QWORD *)(v0 + 280);
  v17 = *(_QWORD *)(v0 + 288);
  v19 = *(void (**)(uint64_t, uint64_t))(v0 + 408);
  v13 = *(_QWORD *)(v0 + 264);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 32))(v12, v2, v1);
  sub_237F6F330(&qword_2568B6328);
  sub_237F7CBCC();
  (*(void (**)(uint64_t, uint64_t))(v14 + 104))(v12, v9);
  v10(v12, v8, v13);
  AsyncThrowingStream.Continuation.yield(_:)();
  v19(v11, v17);
  sub_237F6FDBC();
  sub_237F7C9FC();
  return swift_task_switch();
}

#error "237F77138: call analysis failed (funcsize=191)"

uint64_t sub_237F773EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[2];

  v20[0] = a2;
  v20[1] = a7;
  v12 = type metadata accessor for Credential();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for Asset();
  MEMORY[0x24BDAC7A8](v16);
  (*(void (**)(char *, uint64_t))(v18 + 16))((char *)v20 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 16))(v15, v20[0], v12);
  sub_237F7C1D8(a3, a4);
  sub_237F7C1D8(a5, a6);
  return AssetSkeleton.init(asset:credential:storageReference:storageReferenceSignature:)();
}

uint64_t sub_237F77518(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v3;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = *a2;
  return swift_task_switch();
}

void sub_237F77538()
{
  uint64_t v0;
  unint64_t v1;
  char v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (*(_QWORD *)(*(_QWORD *)(v0 + 24) + 16))
  {
    v1 = sub_237F792D8(*(_QWORD *)(v0 + 32));
    if ((v2 & 1) != 0)
    {
      v3 = v1;
      v4 = *(_QWORD *)(v0 + 16);
      v5 = *(_QWORD *)(*(_QWORD *)(v0 + 24) + 56);
      sub_237F7CDF0();
      sub_237F7CBCC();
      (*(void (**)(uint64_t, unint64_t))(v6 + 16))(v4, v5 + *(_QWORD *)(v6 + 72) * v3);
      (*(void (**)(void))(v0 + 8))();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_237F775B0()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_237F775D4()
{
  sub_237F775B0();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Uploader()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for Uploader.OptionsBuilder()
{
  return objc_opt_self();
}

unint64_t sub_237F77634()
{
  unint64_t result;

  result = qword_2568B6280;
  if (!qword_2568B6280)
  {
    result = MEMORY[0x23B828F58](&unk_237F8B4C8, &type metadata for ProcessorError);
    atomic_store(result, &qword_2568B6280);
  }
  return result;
}

void sub_237F77670()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  uint64_t v6;

  sub_237F7CBB8();
  v3 = *v0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v2 > *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(v3 + 16) <= v2)
      v5 = v2;
    else
      v5 = *(_QWORD *)(v3 + 16);
    sub_237F77F0C(isUniquelyReferenced_nonNull_native, v5, 0, v3, v1);
    v3 = v6;
  }
  *v0 = v3;
}

uint64_t sub_237F776D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4)
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)() & 1;
}

uint64_t sub_237F77714(uint64_t a1, unsigned __int8 a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
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
  uint64_t result;
  uint64_t v40;
  char **v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  unint64_t v47;
  _QWORD v49[4];

  v49[3] = a4;
  if (a1 < 0)
  {
    sub_237F7C508();
    sub_237F7C908();
    goto LABEL_40;
  }
  v10 = sub_237F7CCC4();
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4AF8];
  v41 = (char **)(v10 + 16);
  v46 = sub_237F7CCC4();
  *(_QWORD *)(v46 + 16) = 15;
  v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v12 = HIBYTE(a6) & 0xF) : (v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v11 = a5 & 0xFFFFFFFFFFFFLL;
    v29 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
      v29 = 11;
    sub_237F77AE4(v29 | (v11 << 16), v46, a2 & 1, v10);
    sub_237F7C8F8();
    v13 = *(char **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_36:
    swift_release();
    return (uint64_t)v13;
  }
  v40 = a1;
  v47 = 4 * v12;
  v13 = (char *)MEMORY[0x24BEE4AF8];
  v14 = 15;
  v15 = 15;
  v16 = 15;
  while (1)
  {
    v49[0] = String.subscript.getter();
    v49[1] = v17;
    v18 = a3(v49);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      sub_237F7C8F8();
      return (uint64_t)v13;
    }
    v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0)
    {
      v14 = sub_237F7CA50();
      goto LABEL_21;
    }
    v20 = (v15 >> 14 == v14 >> 14) & a2;
    if (v20 != 1)
    {
      if (v14 >> 14 < v15 >> 14)
        goto LABEL_38;
      v21 = sub_237F7CCD0();
      v42 = v23;
      v43 = v22;
      v44 = v24;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v13 = sub_237F7CCF8(0, *((_QWORD *)v13 + 2) + 1);
      v26 = *((_QWORD *)v13 + 2);
      v25 = *((_QWORD *)v13 + 3);
      if (v26 >= v25 >> 1)
        v13 = sub_237F7CCF8((char *)(v25 > 1), v26 + 1);
      *((_QWORD *)v13 + 2) = v26 + 1;
      v27 = &v13[32 * v26];
      *((_QWORD *)v27 + 4) = v21;
      *((_QWORD *)v27 + 5) = v44;
      *((_QWORD *)v27 + 6) = v43;
      *((_QWORD *)v27 + 7) = v42;
      *v41 = v13;
    }
    v28 = sub_237F7CA50();
    v14 = v28;
    *(_QWORD *)(v46 + 16) = v28;
    if ((v20 & 1) == 0 && *((_QWORD *)v13 + 2) == v40)
      break;
    v15 = v28;
    v16 = v28;
LABEL_21:
    if (v47 == v14 >> 14)
      goto LABEL_30;
  }
  v16 = v28;
  v15 = v28;
LABEL_30:
  if (v47 == v15 >> 14 && (a2 & 1) != 0)
  {
    sub_237F7C8F8();
LABEL_35:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_36;
  }
  if (v47 >= v16 >> 14)
  {
    v30 = sub_237F7CCD0();
    v32 = v31;
    v34 = v33;
    v36 = v35;
    sub_237F7C8F8();
    sub_237F77BE8();
    v37 = (char *)*((_QWORD *)*v41 + 2);
    sub_237F77C30(v37);
    v13 = *v41;
    *((_QWORD *)v13 + 2) = v37 + 1;
    v38 = &v13[32 * (_QWORD)v37];
    *((_QWORD *)v38 + 4) = v30;
    *((_QWORD *)v38 + 5) = v32;
    *((_QWORD *)v38 + 6) = v34;
    *((_QWORD *)v38 + 7) = v36;
    *v41 = v13;
    goto LABEL_35;
  }
LABEL_38:
  sub_237F7C508();
  sub_237F7C908();
LABEL_40:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_237F77AE4(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
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
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = String.subscript.getter();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    sub_237F77BE8();
    v14 = *(char **)(*(_QWORD *)(a4 + 16) + 16);
    sub_237F77C30(v14);
    v15 = *(_QWORD *)(a4 + 16);
    *(_QWORD *)(v15 + 16) = v14 + 1;
    v16 = (_QWORD *)(v15 + 32 * (_QWORD)v14);
    v16[4] = v7;
    v16[5] = v9;
    v16[6] = v11;
    v16[7] = v13;
    return v5 ^ 1u;
  }
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_237F77BE8()
{
  uint64_t *v0;
  uint64_t v1;
  char *result;

  v1 = *v0;
  result = (char *)swift_isUniquelyReferenced_nonNull_native();
  *v0 = v1;
  if (!(_DWORD)result)
  {
    result = sub_237F77E08(result, *(_QWORD *)(v1 + 16) + 1, 1, v1);
    *v0 = (uint64_t)result;
  }
  return result;
}

char *sub_237F77C30(char *result)
{
  uint64_t *v1;
  unint64_t v2;

  v2 = *(_QWORD *)(*v1 + 24);
  if ((uint64_t)(result + 1) > (uint64_t)(v2 >> 1))
  {
    result = sub_237F77E08((char *)(v2 > 1), (int64_t)(result + 1), 1, *v1);
    *v1 = (uint64_t)result;
  }
  return result;
}

uint64_t sub_237F77C6C(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  size_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    sub_237F7C5C4();
    if (v7 != v8)
    {
      sub_237F7C888();
      if (v7)
      {
        __break(1u);
        goto LABEL_23;
      }
      sub_237F7C5B4();
    }
  }
  else
  {
    v6 = a2;
  }
  v9 = *(_QWORD *)(a4 + 16);
  if (v6 <= v9)
    v10 = *(_QWORD *)(a4 + 16);
  else
    v10 = v6;
  if (!v10)
  {
    v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_18;
  }
  sub_237F6F330(&qword_2568B6500);
  v11 = *(_QWORD *)(sub_237F6F330(&qword_2568B6398) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v14 = (_QWORD *)swift_allocObject();
  v15 = j__malloc_size(v14);
  if (!v12 || (v15 - v13 == 0x8000000000000000 ? (v16 = v12 == -1) : (v16 = 0), v16))
  {
LABEL_23:
    sub_237F7C508();
    sub_237F7C908();
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v14[2] = v9;
  v14[3] = 2 * ((uint64_t)(v15 - v13) / v12);
LABEL_18:
  sub_237F6F330(&qword_2568B6398);
  sub_237F7CDA8();
  if ((a1 & 1) != 0)
  {
    sub_237F78308(a4 + v17, v9);
    *(_QWORD *)(a4 + 16) = 0;
    sub_237F701AC();
  }
  else
  {
    sub_237F77FB0(0, v9, (unint64_t)v14 + v17, a4);
  }
  return (uint64_t)v14;
}

char *sub_237F77E08(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    sub_237F6F330(&qword_2568B64D8);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_237F78490((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_237F780D4(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

void sub_237F77EF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_237F77F0C(a1, a2, a3, a4, &qword_2568B6378);
}

void sub_237F77F00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_237F77F0C(a1, a2, a3, a4, &qword_2568B6380);
}

void sub_237F77F0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  char v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  char *v13;

  v6 = a1;
  if ((a3 & 1) != 0)
  {
    sub_237F7C5C4();
    if (v8 != v9)
    {
      sub_237F7C888();
      if (v8)
      {
        __break(1u);
        return;
      }
      sub_237F7C5B4();
    }
  }
  else
  {
    v7 = a2;
  }
  v10 = *(_QWORD *)(a4 + 16);
  if (v7 <= v10)
    v11 = *(_QWORD *)(a4 + 16);
  else
    v11 = v7;
  if (v11)
  {
    sub_237F7C830(a1, a2, a3, a4, a5);
    v12 = (_QWORD *)sub_237F7C614();
    sub_237F7CA18(v12);
  }
  else
  {
    v11 = MEMORY[0x24BEE4AF8];
  }
  v13 = (char *)(v11 + 32);
  if ((v6 & 1) != 0)
  {
    sub_237F78420((char *)(a4 + 32), v10, v13);
    *(_QWORD *)(a4 + 16) = 0;
    sub_237F701AC();
  }
  else
  {
    sub_237F781C8(0, v10, v13, a4);
  }
  sub_237F6CB38();
}

uint64_t sub_237F77FB0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_237F6F330(&qword_2568B6398) - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_237F780D4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_237F781C8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    sub_237F7C508();
    sub_237F7C690();
    goto LABEL_11;
  }
  v5 = (char *)(a4 + 8 * a1 + 32);
  v6 = &__dst[8 * v4];
  if (v5 >= v6 || &v5[8 * v4] <= __dst)
  {
    memcpy(__dst, v5, 8 * v4);
    sub_237F701AC();
    return v6;
  }
  sub_237F7C508();
  sub_237F7C6A0();
LABEL_11:
  result = (char *)sub_237F7C530();
  __break(1u);
  return result;
}

char *sub_237F78284(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

void sub_237F78308(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  char v5;
  char v6;

  if (a2 < 0)
  {
    sub_237F7C508();
    sub_237F7C530();
    __break(1u);
  }
  else
  {
    sub_237F7CAA8();
    if (v5 && (sub_237F6F330(v4), sub_237F7CDBC(), !v6 & v5))
    {
      if (v3 == v2)
      {
        sub_237F7CAD0();
      }
      else
      {
        sub_237F7C600();
        sub_237F7C708();
      }
    }
    else
    {
      sub_237F6F330(v4);
      sub_237F7C600();
      sub_237F7C6F8();
    }
  }
}

char *sub_237F7839C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_237F78420(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    sub_237F7C508();
    __src = (char *)sub_237F7C530();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_237F78490(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

char *sub_237F78514(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[4 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 4 * a2);
  }
  return __src;
}

char *sub_237F78598(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[40 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 40 * a2);
  }
  return __src;
}

char *sub_237F78624(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[48 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 48 * a2);
  }
  return __src;
}

void sub_237F786B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(_QWORD);
  char v5;
  char v6;

  if (a2 < 0)
  {
    sub_237F7C508();
    sub_237F7C530();
    __break(1u);
  }
  else
  {
    sub_237F7CAA8();
    if (v5 && (v4(0), sub_237F7CDBC(), !v6 & v5))
    {
      if (v3 == v2)
      {
        sub_237F7CAD0();
      }
      else
      {
        sub_237F7C600();
        sub_237F7C708();
      }
    }
    else
    {
      v4(0);
      sub_237F7C600();
      sub_237F7C6F8();
    }
  }
}

char *sub_237F78744(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

uint64_t sub_237F787D0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_237F787E8(uint64_t a1)
{
  uint64_t *v1;

  return sub_237F76014(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_237F787F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;
  uint64_t v4;
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[3];
  uint64_t ObjectType;

  sub_237F7CBB8();
  sub_237F6FDBC();
  v9 = sub_237F788BC(v6, v7, v8, 1, v4, v3);
  v10 = v15[0];
  if (v9)
  {
    v11 = v9;
    ObjectType = swift_getObjectType();
    v15[0] = v11;
    v12 = *a3;
    if (*a3)
    {
      sub_237F78E90((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v15[0] = v4;
    v15[1] = v3;
    v13 = *a3;
    if (*a3)
    {
      sub_237F78E90((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    sub_237F7C868();
  }
  sub_237F6FBF0((uint64_t)v15);
  return v10;
}

uint64_t sub_237F788BC(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_237F78A10((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_237F78AD4(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = _StringObject.sharedUTF8.getter();
    if (!v8)
    {
      result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_237F78A10(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_237F78AD4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_237F78B68(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_237F78D3C(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_237F78D3C((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_237F78B68(uint64_t a1, unint64_t a2)
{
  Swift::Int v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = String.UTF8View._foreignCount()();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_237F78CD8(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = _StringGuts.copyUTF8(into:)();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

_QWORD *sub_237F78CD8(uint64_t a1, uint64_t a2)
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
  sub_237F6F330(&qword_2568B62A0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_237F78D3C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    sub_237F6F330(&qword_2568B62A0);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_237F78E10(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_237F728E4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_237F78E10(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_237F78E90(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_237F78ED0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v12 = sub_237F7C9E4();
  v1 = *(_QWORD *)(v12 - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v11 = type metadata accessor for Credential();
  v4 = *(_QWORD *)(v11 - 8);
  v5 = (v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = sub_237F6F330(&qword_2568B62A8);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = (v5 + v6 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v1 + 8))(v0 + v2, v12);
  (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v5, v11);
  (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v0 + v9, v7);
  return swift_deallocObject();
}

uint64_t sub_237F78FE8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  v4 = *(_QWORD *)(sub_237F7C9E4() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = *(_QWORD *)(type metadata accessor for Credential() - 8);
  v8 = (v5 + v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = *(_QWORD *)(sub_237F6F330(&qword_2568B62A8) - 8);
  v11 = (v8 + v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v12 = v1[2];
  v13 = v1[3];
  v14 = v1[4];
  v15 = v1[5];
  v16 = (uint64_t)v1 + v11;
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v17;
  *v17 = v2;
  v17[1] = sub_237F7C500;
  return sub_237F76284(a1, v12, v13, v14, v15, (uint64_t)v1 + v5, (uint64_t)v1 + v8, v16);
}

uint64_t sub_237F790F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_237F773EC(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), a2);
}

uint64_t sub_237F7911C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  sub_237F7CC74();
  v4 = *(_QWORD *)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v5;
  *v5 = v3;
  v5[1] = sub_237F79180;
  return sub_237F77518(v2, v0, v4);
}

uint64_t sub_237F79180()
{
  uint64_t v0;

  sub_237F6FDC8();
  sub_237F7CB4C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237F791B4(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B828F4C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_237F791F8(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    sub_237F791B4(a2);
    sub_237F7CD40();
  }
  sub_237F7028C();
}

unint64_t sub_237F7922C(_QWORD *a1)
{
  Swift::Int v2;

  sub_237F7CE00();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  type metadata accessor for ProcessorFactory.TenantDomain();
  sub_237F7C9E4();
  sub_237F7C4B4(&qword_2568B5F70, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  dispatch thunk of Hashable.hash(into:)();
  v2 = Hasher._finalize()();
  return sub_237F793C8(a1, v2);
}

unint64_t sub_237F792D8(uint64_t a1)
{
  uint64_t v2;

  v2 = static Hasher._hash(seed:_:)();
  return sub_237F794EC(a1, v2);
}

unint64_t sub_237F79308(uint64_t a1)
{
  uint64_t v2;

  sub_237F7C9E4();
  sub_237F7C4B4(&qword_2568B5F70, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  v2 = dispatch thunk of Hashable._rawHashValue(seed:)();
  return sub_237F79588(a1, v2);
}

unint64_t sub_237F79370()
{
  uint64_t v0;
  uint64_t v1;
  Swift::Int v2;

  sub_237F7CBB8();
  sub_237F7CE00();
  String.hash(into:)();
  v2 = Hasher._finalize()();
  return sub_237F796C8(v1, v0, v2);
}

unint64_t sub_237F793C8(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v15;

  v5 = type metadata accessor for ProcessorFactory.TenantDomain();
  MEMORY[0x24BDAC7A8](v5);
  v8 = (uint64_t *)((char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = -1 << *(_BYTE *)(v2 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    while (1)
    {
      sub_237F6F918(*(_QWORD *)(v2 + 48) + v12 * v10, (uint64_t)v8);
      v13 = *v8 == *a1 && v8[1] == a1[1];
      if ((v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        && (MEMORY[0x23B828748]((char *)v8 + *(int *)(v5 + 20), (char *)a1 + *(int *)(v5 + 20)) & 1) != 0)
      {
        break;
      }
      sub_237F6F6B8((uint64_t)v8);
      v10 = (v10 + 1) & v11;
      if (((*(_QWORD *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        return v10;
    }
    sub_237F6F6B8((uint64_t)v8);
  }
  return v10;
}

unint64_t sub_237F794EC(uint64_t a1, uint64_t a2)
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

unint64_t sub_237F79588(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = type metadata accessor for URL();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_237F7C4B4(&qword_2568B6508, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
      v14 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_237F796C8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

void sub_237F797A8(uint64_t a1, int a2, uint64_t (*a3)(_QWORD), uint64_t *a4)
{
  _QWORD *v4;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t i;
  int64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  char v40;
  char v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD *v47;
  int v48;
  int64_t v49;
  uint64_t v50;
  uint64_t v51;

  v6 = v4;
  v8 = a3(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v46 - v10;
  v12 = *v4;
  sub_237F6F330(a4);
  v13 = static _DictionaryStorage.resize(original:capacity:move:)();
  v14 = (_QWORD *)v13;
  if (*(_QWORD *)(v12 + 16))
  {
    v47 = v6;
    v15 = 0;
    v16 = *(_QWORD *)(v12 + 64);
    v50 = v12 + 64;
    v17 = 1 << *(_BYTE *)(v12 + 32);
    if (v17 < 64)
      v18 = ~(-1 << v17);
    else
      v18 = -1;
    v19 = v18 & v16;
    v49 = (unint64_t)(v17 + 63) >> 6;
    v20 = v13 + 64;
    v48 = a2;
    v21 = 16;
    if ((a2 & 1) != 0)
      v21 = 32;
    v51 = v21;
    if (!v19)
      goto LABEL_9;
LABEL_8:
    sub_237F7C84C();
    for (i = v22 | (v15 << 6); ; i = v26 + (v15 << 6))
    {
      v27 = *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * i);
      v28 = *(_QWORD *)(v9 + 72);
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + v51))(v11, *(_QWORD *)(v12 + 56) + v28 * i, v8);
      static Hasher._hash(seed:_:)();
      sub_237F7CC4C();
      if (((v31 << v30) & ~*(_QWORD *)(v20 + 8 * v29)) == 0)
      {
        sub_237F7C81C();
        while (++v33 != v34 || (v32 & 1) == 0)
        {
          v35 = v33 == v34;
          if (v33 == v34)
            v33 = 0;
          v32 |= v35;
          if (*(_QWORD *)(v20 + 8 * v33) != -1)
          {
            sub_237F7CBF8();
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return;
      }
      sub_237F7CC18();
LABEL_30:
      sub_237F7CBE4();
      *(_QWORD *)(v20 + v36) |= v37;
      *(_QWORD *)(v14[6] + 8 * v38) = v27;
      (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v14[7] + v28 * v38, v11, v8);
      ++v14[2];
      if (v19)
        goto LABEL_8;
LABEL_9:
      v24 = v15 + 1;
      if (__OFADD__(v15, 1))
        goto LABEL_41;
      if (v24 >= v49)
        goto LABEL_32;
      ++v15;
      if (!*(_QWORD *)(v50 + 8 * v24))
      {
        v15 = v24 + 1;
        if (v24 + 1 >= v49)
          goto LABEL_32;
        if (!*(_QWORD *)(v50 + 8 * v15))
        {
          v25 = v24 + 2;
          if (v25 >= v49)
          {
LABEL_32:
            if ((v48 & 1) == 0)
            {
              sub_237F7C860();
              v6 = v47;
              goto LABEL_39;
            }
            sub_237F7CB9C();
            if (v41 != v42)
            {
              *v39 = -1 << v40;
            }
            else
            {
              v43 = sub_237F7CA80();
              sub_237F7A57C(v43, v44, v45);
            }
            v6 = v47;
            *(_QWORD *)(v12 + 16) = 0;
            break;
          }
          if (!*(_QWORD *)(v50 + 8 * v25))
          {
            while (1)
            {
              v15 = v25 + 1;
              if (__OFADD__(v25, 1))
                goto LABEL_42;
              if (v15 >= v49)
                goto LABEL_32;
              ++v25;
              if (*(_QWORD *)(v50 + 8 * v15))
                goto LABEL_20;
            }
          }
          v15 = v25;
        }
      }
LABEL_20:
      sub_237F7C838();
    }
  }
  sub_237F7C860();
LABEL_39:
  *v6 = v14;
  sub_237F7C870();
}

void sub_237F79A50(uint64_t a1, int a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  int64_t i;
  int64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  char v36;
  char v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  int64_t v43;
  _QWORD *v44;
  uint64_t v45;
  int v46;

  v3 = v2;
  v5 = sub_237F7C9E4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  sub_237F6F330(&qword_2568B64F8);
  v46 = a2;
  v10 = static _DictionaryStorage.resize(original:capacity:move:)();
  v11 = (_QWORD *)v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_40;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v44 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = (_QWORD *)(v14 & v13);
  v42 = v2;
  v43 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  swift_retain();
  v17 = 0;
  v45 = v9;
  if (!v15)
    goto LABEL_7;
LABEL_6:
  sub_237F7C84C();
  for (i = v18 | (v17 << 6); ; i = v22 + (v17 << 6))
  {
    v23 = *(_QWORD *)(v6 + 72);
    v24 = *(_QWORD *)(v9 + 48) + v23 * i;
    if ((v46 & 1) != 0)
    {
      sub_237F7CB5C((uint64_t)v8, v24, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 32));
      v25 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * i);
    }
    else
    {
      sub_237F7CB5C((uint64_t)v8, v24, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16));
      v25 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * i);
      swift_bridgeObjectRetain();
    }
    sub_237F7C4B4(&qword_2568B5F70, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
    dispatch thunk of Hashable._rawHashValue(seed:)();
    sub_237F7CC4C();
    v29 = (v28 << v26) & ~*(_QWORD *)(v16 + 8 * v27);
    if (!v29)
    {
      sub_237F7C81C();
      while (++v32 != v33 || (v31 & 1) == 0)
      {
        v34 = v32 == v33;
        if (v32 == v33)
          v32 = 0;
        v31 |= v34;
        v35 = *(_QWORD *)(v16 + 8 * v32);
        if (v35 != -1)
        {
          v30 = __clz(__rbit64(~v35)) + (v32 << 6);
          goto LABEL_31;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return;
    }
    v30 = __clz(__rbit64(v29)) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
    *(_QWORD *)(v16 + ((v30 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v30;
    sub_237F7CB5C(v11[6] + v23 * v30, (uint64_t)v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 32));
    *(_QWORD *)(v11[7] + 8 * v30) = v25;
    ++v11[2];
    v9 = v45;
    if (v15)
      goto LABEL_6;
LABEL_7:
    v20 = v17 + 1;
    if (__OFADD__(v17, 1))
      goto LABEL_42;
    if (v20 >= v43)
    {
      sub_237F7CBC4();
      v3 = v42;
      v15 = v44;
      goto LABEL_35;
    }
    v15 = v44;
    ++v17;
    if (!v44[v20])
    {
      v17 = v20 + 1;
      if (v20 + 1 >= v43)
        goto LABEL_33;
      if (!v44[v17])
        break;
    }
LABEL_18:
    sub_237F7C838();
  }
  v21 = v20 + 2;
  if (v21 < v43)
  {
    if (!v44[v21])
    {
      while (1)
      {
        v17 = v21 + 1;
        if (__OFADD__(v21, 1))
          goto LABEL_43;
        if (v17 >= v43)
          goto LABEL_33;
        ++v21;
        if (v44[v17])
          goto LABEL_18;
      }
    }
    v17 = v21;
    goto LABEL_18;
  }
LABEL_33:
  sub_237F7CBC4();
  v3 = v42;
LABEL_35:
  if ((v46 & 1) != 0)
  {
    sub_237F7CB9C();
    if (v37 != v38)
    {
      *v15 = -1 << v36;
    }
    else
    {
      v39 = sub_237F7CA80();
      sub_237F7A57C(v39, v40, v15);
    }
    *(_QWORD *)(v9 + 16) = 0;
  }
LABEL_40:
  sub_237F7CBC4();
  *v3 = v11;
  sub_237F7C870();
}

void sub_237F79D68(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t i;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD *v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  char v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  _QWORD *v37;
  _OWORD v38[2];

  v3 = v2;
  v5 = *v2;
  sub_237F6F330(&qword_2568B63B8);
  v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v37 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v36 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    swift_retain();
    v12 = 0;
    if (!v10)
      goto LABEL_7;
LABEL_6:
    sub_237F7C84C();
    for (i = v13 | (v12 << 6); ; i = v17 + (v12 << 6))
    {
      v18 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * i);
      v20 = *v18;
      v19 = v18[1];
      v21 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * i);
      if ((a2 & 1) != 0)
      {
        sub_237F6FC10(v21, v38);
      }
      else
      {
        sub_237F78E90((uint64_t)v21, (uint64_t)v38);
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      v22 = Hasher._finalize()() & ~(-1 << *(_BYTE *)(v7 + 32));
      if (((-1 << v22) & ~*(_QWORD *)(v11 + 8 * (v22 >> 6))) == 0)
      {
        sub_237F7C81C();
        while (++v24 != v25 || (v23 & 1) == 0)
        {
          v26 = v24 == v25;
          if (v24 == v25)
            v24 = 0;
          v23 |= v26;
          if (*(_QWORD *)(v11 + 8 * v24) != -1)
          {
            sub_237F7CBF8();
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return;
      }
      sub_237F7CC18();
LABEL_31:
      sub_237F7CBE4();
      *(_QWORD *)(v11 + v27) |= v28;
      v30 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v29);
      *v30 = v20;
      v30[1] = v19;
      sub_237F6FC10(v38, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v29));
      ++*(_QWORD *)(v7 + 16);
      if (v10)
        goto LABEL_6;
LABEL_7:
      v15 = v12 + 1;
      if (__OFADD__(v12, 1))
        goto LABEL_40;
      if (v15 >= v36)
        goto LABEL_33;
      ++v12;
      if (!v37[v15])
      {
        v12 = v15 + 1;
        if (v15 + 1 >= v36)
          goto LABEL_33;
        if (!v37[v12])
        {
          v16 = v15 + 2;
          if (v16 >= v36)
          {
LABEL_33:
            sub_237F7C860();
            v3 = v2;
            if ((a2 & 1) != 0)
            {
              sub_237F7CB9C();
              if (v32 != v33)
              {
                *v37 = -1 << v31;
              }
              else
              {
                v34 = sub_237F7CA80();
                sub_237F7A57C(v34, v35, v37);
              }
              *(_QWORD *)(v5 + 16) = 0;
            }
            break;
          }
          if (!v37[v16])
          {
            while (1)
            {
              v12 = v16 + 1;
              if (__OFADD__(v16, 1))
                goto LABEL_41;
              if (v12 >= v36)
                goto LABEL_33;
              ++v16;
              if (v37[v12])
                goto LABEL_18;
            }
          }
          v12 = v16;
        }
      }
LABEL_18:
      sub_237F7C838();
    }
  }
  sub_237F7C860();
  *v3 = v7;
}

uint64_t sub_237F7A000(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  __int128 *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  __int128 v32[2];

  v3 = v2;
  v5 = *v2;
  sub_237F6F330(&qword_2568B6420);
  result = static _DictionaryStorage.resize(original:capacity:move:)();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v9 = *(_QWORD *)(v5 + 64);
    v31 = (_QWORD *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & v9;
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    if ((v11 & v9) == 0)
      goto LABEL_7;
LABEL_6:
    v15 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    for (i = v15 | (v8 << 6); ; i = __clz(__rbit64(v18)) + (v8 << 6))
    {
      v20 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * i);
      v21 = (__int128 *)(*(_QWORD *)(v5 + 56) + 40 * i);
      if ((a2 & 1) != 0)
        sub_237F7C334(v21, (uint64_t)v32);
      else
        sub_237F7C34C((uint64_t)v21, (uint64_t)v32);
      result = static Hasher._hash(seed:_:)();
      v22 = -1 << *(_BYTE *)(v7 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v14 + 8 * (v23 >> 6))) == 0)
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v22) >> 6;
        while (++v24 != v27 || (v26 & 1) == 0)
        {
          v28 = v24 == v27;
          if (v24 == v27)
            v24 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v14 + 8 * v24);
          if (v29 != -1)
          {
            v25 = __clz(__rbit64(~v29)) + (v24 << 6);
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }
      v25 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v14 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
      *(_QWORD *)(v14 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v25) = v20;
      result = sub_237F7C334(v32, *(_QWORD *)(v7 + 56) + 40 * v25);
      ++*(_QWORD *)(v7 + 16);
      if (v12)
        goto LABEL_6;
LABEL_7:
      v17 = v8 + 1;
      if (__OFADD__(v8, 1))
        goto LABEL_41;
      if (v17 >= v13)
        goto LABEL_33;
      v18 = v31[v17];
      ++v8;
      if (!v18)
      {
        v8 = v17 + 1;
        if (v17 + 1 >= v13)
          goto LABEL_33;
        v18 = v31[v8];
        if (!v18)
        {
          v19 = v17 + 2;
          if (v19 >= v13)
          {
LABEL_33:
            if ((a2 & 1) != 0)
            {
              v30 = 1 << *(_BYTE *)(v5 + 32);
              if (v30 >= 64)
                sub_237F7A57C(0, (unint64_t)(v30 + 63) >> 6, v31);
              else
                *v31 = -1 << v30;
              *(_QWORD *)(v5 + 16) = 0;
            }
            break;
          }
          v18 = v31[v19];
          if (!v18)
          {
            while (1)
            {
              v8 = v19 + 1;
              if (__OFADD__(v19, 1))
                goto LABEL_42;
              if (v8 >= v13)
                goto LABEL_33;
              v18 = v31[v8];
              ++v19;
              if (v18)
                goto LABEL_18;
            }
          }
          v8 = v19;
        }
      }
LABEL_18:
      v12 = (v18 - 1) & v18;
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_237F7A2C0(uint64_t a1, char a2)
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
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  __int128 v31;

  v3 = v2;
  v5 = *v2;
  sub_237F6F330(&qword_2568B6470);
  result = static _DictionaryStorage.resize(original:capacity:move:)();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v30 = v3;
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
    if (!v12)
      goto LABEL_7;
LABEL_6:
    v15 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    for (i = v15 | (v8 << 6); ; i = __clz(__rbit64(v18)) + (v8 << 6))
    {
      v20 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * i);
      v31 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + 16 * i);
      if ((a2 & 1) == 0)
        sub_237F7C1D8(v31, *((unint64_t *)&v31 + 1));
      result = static Hasher._hash(seed:_:)();
      v21 = -1 << *(_BYTE *)(v7 + 32);
      v22 = result & ~v21;
      v23 = v22 >> 6;
      if (((-1 << v22) & ~*(_QWORD *)(v14 + 8 * (v22 >> 6))) == 0)
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v21) >> 6;
        while (++v23 != v26 || (v25 & 1) == 0)
        {
          v27 = v23 == v26;
          if (v23 == v26)
            v23 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v14 + 8 * v23);
          if (v28 != -1)
          {
            v24 = __clz(__rbit64(~v28)) + (v23 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }
      v24 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v14 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v14 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v24) = v20;
      *(_OWORD *)(*(_QWORD *)(v7 + 56) + 16 * v24) = v31;
      ++*(_QWORD *)(v7 + 16);
      if (v12)
        goto LABEL_6;
LABEL_7:
      v17 = v8 + 1;
      if (__OFADD__(v8, 1))
        goto LABEL_41;
      if (v17 >= v13)
        goto LABEL_32;
      v18 = v9[v17];
      ++v8;
      if (!v18)
      {
        v8 = v17 + 1;
        if (v17 + 1 >= v13)
          goto LABEL_32;
        v18 = v9[v8];
        if (!v18)
        {
          v19 = v17 + 2;
          if (v19 >= v13)
          {
LABEL_32:
            if ((a2 & 1) == 0)
            {
              result = swift_release();
              v3 = v30;
              goto LABEL_39;
            }
            v29 = 1 << *(_BYTE *)(v5 + 32);
            if (v29 >= 64)
              sub_237F7A57C(0, (unint64_t)(v29 + 63) >> 6, (_QWORD *)(v5 + 64));
            else
              *v9 = -1 << v29;
            v3 = v30;
            *(_QWORD *)(v5 + 16) = 0;
            break;
          }
          v18 = v9[v19];
          if (!v18)
          {
            while (1)
            {
              v8 = v19 + 1;
              if (__OFADD__(v19, 1))
                goto LABEL_42;
              if (v8 >= v13)
                goto LABEL_32;
              v18 = v9[v8];
              ++v19;
              if (v18)
                goto LABEL_18;
            }
          }
          v8 = v19;
        }
      }
LABEL_18:
      v12 = (v18 - 1) & v18;
    }
  }
  result = swift_release();
LABEL_39:
  *v3 = v7;
  return result;
}

uint64_t sub_237F7A57C(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_237F7A598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_237F78E90(a4, a1);
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t sub_237F7A5D4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = sub_237F7A598((uint64_t)(a2 + 2), *a1, a1[1], (uint64_t)(a1 + 2));
  *a2 = result;
  a2[1] = v4;
  return result;
}

void sub_237F7A608(uint64_t a1, char a2, _QWORD *a3)
{
  sub_237F7A63C(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE16FD0], &qword_2568B6458, &qword_2568B6450, &qword_2568B6460);
}

void sub_237F7A63C(uint64_t a1, char a2, _QWORD *a3, uint64_t (*a4)(_QWORD), uint64_t *a5, uint64_t *a6, uint64_t *a7)
{
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  _QWORD *v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  char v30;
  char v31;
  unint64_t v32;
  char v33;
  _QWORD *v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  Swift::String v39;
  Swift::String v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(_QWORD);
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t *v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  unint64_t v55;
  id v56;
  uint64_t v57;

  v45 = a4;
  v46 = a6;
  v53 = a3;
  v12 = a4(0);
  v52 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v41 - v13;
  v51 = a5;
  v15 = sub_237F6F330(a5);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v19 = (uint64_t *)((char *)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v20 = *(_QWORD *)(a1 + 16);
  if (!v20)
  {
    sub_237F701AC();
    return;
  }
  v42 = a7;
  v43 = v7;
  v50 = (char *)v19 + *(int *)(v16 + 48);
  v21 = a1 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
  v47 = *(_QWORD *)(v17 + 72);
  v44 = a1;
  sub_237F7C728();
  v48 = v12;
  v49 = v14;
  while (1)
  {
    sub_237F7C390(v21, (uint64_t)v19, v51);
    v22 = v19;
    v23 = *v19;
    v57 = v23;
    v24 = *(void (**)(char *, char *, uint64_t))(v52 + 32);
    v24(v14, v50, v12);
    v25 = (_QWORD *)*v53;
    v26 = sub_237F792D8(v23);
    v28 = sub_237F7CDD0(v26, v27);
    if (v30)
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
      goto LABEL_20;
    }
    v31 = v29;
    if (v25[3] < v28)
      break;
    if ((a2 & 1) != 0)
    {
      if ((v29 & 1) != 0)
        goto LABEL_14;
    }
    else
    {
      sub_237F6F330(v42);
      _NativeDictionary.copy()();
      if ((v31 & 1) != 0)
        goto LABEL_14;
    }
LABEL_10:
    v34 = (_QWORD *)*v53;
    *(_QWORD *)(*v53 + 8 * (v26 >> 6) + 64) |= 1 << v26;
    *(_QWORD *)(v34[6] + 8 * v26) = v23;
    v35 = v34[7] + *(_QWORD *)(v52 + 72) * v26;
    v12 = v48;
    v14 = v49;
    v24((char *)v35, v49, v48);
    sub_237F7CDE4();
    if (v30)
      goto LABEL_18;
    v34[2] = v36;
    v21 += v47;
    a2 = 1;
    --v20;
    v19 = v22;
    if (!v20)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_237F797A8(v28, a2 & 1, v45, v46);
  v32 = sub_237F792D8(v23);
  if ((v31 & 1) != (v33 & 1))
    goto LABEL_19;
  v26 = v32;
  if ((v31 & 1) == 0)
    goto LABEL_10;
LABEL_14:
  v37 = (void *)swift_allocError();
  swift_willThrow();
  v56 = v37;
  v38 = v37;
  sub_237F6F330(&qword_2568B62F8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_237F701AC();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v49, v48);
    sub_237F701AC();

    return;
  }
LABEL_20:
  v54 = 0;
  v55 = 0xE000000000000000;
  _StringGuts.grow(_:)(30);
  v39._object = (void *)0x8000000237F8C580;
  v39._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v39);
  _print_unlocked<A, B>(_:_:)();
  v40._countAndFlagsBits = 39;
  v40._object = (void *)0xE100000000000000;
  String.append(_:)(v40);
  sub_237F7C908();
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_237F7A9C8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
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
  unint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  BOOL v23;
  char v24;
  unint64_t v25;
  char v26;
  _OWORD *v27;
  _OWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t result;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;

  v8 = a1;
  sub_237F7BF28(a1, &v55);
  sub_237F7CB84();
  v9 = swift_retain();
  sub_237F7CBAC(v9, v10, v11, v12, v13, v14, v15, v16, a3, v8, v43, v44, v45, v46, v47, *((uint64_t *)&v47 + 1), v48, v49, v50,
    *((uint64_t *)&v50 + 1),
    v51,
    v52,
    v53);
  v17 = *((_QWORD *)&v53 + 1);
  if (!*((_QWORD *)&v53 + 1))
  {
LABEL_14:
    swift_release();
    swift_bridgeObjectRelease();
    sub_237F7C2C8();
    return swift_release();
  }
  while (1)
  {
    v18 = v53;
    sub_237F6FC10(&v54, &v50);
    v19 = sub_237F7C9EC();
    v21 = sub_237F7CDD0(v19, v20);
    if (v23)
      break;
    v24 = v22;
    if (*(_QWORD *)(v8 + 24) >= v21)
    {
      if ((a4 & 1) != 0)
      {
        if ((v22 & 1) != 0)
          goto LABEL_9;
      }
      else
      {
        sub_237F6F330(&qword_2568B6108);
        v8 = a5;
        _NativeDictionary.copy()();
        if ((v24 & 1) != 0)
          goto LABEL_9;
      }
    }
    else
    {
      v8 = a5;
      sub_237F79D68(v21, a4 & 1);
      v25 = sub_237F7C9EC();
      if ((v24 & 1) != (v26 & 1))
        goto LABEL_17;
      v19 = v25;
      if ((v24 & 1) != 0)
      {
LABEL_9:
        sub_237F78E90(*(_QWORD *)(*(_QWORD *)a5 + 56) + 32 * v19, (uint64_t)&v43);
        sub_237F78E90((uint64_t)&v43, (uint64_t)&v47);
        sub_237F6FBF0((uint64_t)&v43);
        sub_237F6FBF0((uint64_t)&v50);
        swift_bridgeObjectRelease();
        v27 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)a5 + 56) + 32 * v19);
        sub_237F6FBF0((uint64_t)v27);
        v28 = sub_237F6FC10(&v47, v27);
        goto LABEL_13;
      }
    }
    v36 = *(_QWORD **)a5;
    *(_QWORD *)(*(_QWORD *)a5 + 8 * (v19 >> 6) + 64) |= 1 << v19;
    v37 = (_QWORD *)(v36[6] + 16 * v19);
    *v37 = v18;
    v37[1] = v17;
    v28 = sub_237F6FC10(&v50, (_OWORD *)(v36[7] + 32 * v19));
    v38 = v36[2];
    v23 = __OFADD__(v38, 1);
    v39 = v38 + 1;
    if (v23)
      goto LABEL_16;
    v36[2] = v39;
LABEL_13:
    sub_237F7CBAC((uint64_t)v28, v29, v30, v31, v32, v33, v34, v35, v41, v42, v43, v44, v45, v46, v47, *((uint64_t *)&v47 + 1), v48, v49, v50,
      *((uint64_t *)&v50 + 1),
      v51,
      v52,
      v53);
    v17 = *((_QWORD *)&v53 + 1);
    a4 = 1;
    if (!*((_QWORD *)&v53 + 1))
      goto LABEL_14;
  }
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void sub_237F7ABC4(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  id v22;
  Swift::String v23;
  Swift::String v24;
  __int128 v25[2];
  uint64_t v26;
  __int128 v27;
  uint64_t v28;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v6 = a1 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_237F7C390(v6, (uint64_t)&v26, &qword_2568B6428);
    v7 = v26;
    v28 = v26;
    sub_237F7C334(&v27, (uint64_t)v25);
    v8 = (_QWORD *)*a3;
    v10 = sub_237F792D8(v7);
    v11 = v8[2];
    v12 = (v9 & 1) == 0;
    v13 = v11 + v12;
    if (__OFADD__(v11, v12))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
      goto LABEL_20;
    }
    v14 = v9;
    if (v8[3] < v13)
      break;
    if ((a2 & 1) != 0)
    {
      if ((v9 & 1) != 0)
        goto LABEL_14;
    }
    else
    {
      sub_237F6F330(&qword_2568B6430);
      _NativeDictionary.copy()();
      if ((v14 & 1) != 0)
        goto LABEL_14;
    }
LABEL_10:
    v17 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v10 >> 6) + 64) |= 1 << v10;
    *(_QWORD *)(v17[6] + 8 * v10) = v7;
    sub_237F7C334(v25, v17[7] + 40 * v10);
    v18 = v17[2];
    v19 = __OFADD__(v18, 1);
    v20 = v18 + 1;
    if (v19)
      goto LABEL_18;
    v17[2] = v20;
    v6 += 48;
    a2 = 1;
    if (!--v3)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_237F7A000(v13, a2 & 1);
  v15 = sub_237F792D8(v7);
  if ((v14 & 1) != (v16 & 1))
    goto LABEL_19;
  v10 = v15;
  if ((v14 & 1) == 0)
    goto LABEL_10;
LABEL_14:
  v21 = (void *)swift_allocError();
  swift_willThrow();
  v22 = v21;
  sub_237F6F330(&qword_2568B62F8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_237F6FBF0((uint64_t)v25);
    swift_bridgeObjectRelease();

    return;
  }
LABEL_20:
  _StringGuts.grow(_:)(30);
  v23._object = (void *)0x8000000237F8C580;
  v23._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v23);
  _print_unlocked<A, B>(_:_:)();
  v24._countAndFlagsBits = 39;
  v24._object = (void *)0xE100000000000000;
  String.append(_:)(v24);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_237F7AE9C(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  void *v24;
  id v25;
  Swift::String v26;
  Swift::String v27;

  v4 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (!v4)
  {
LABEL_18:
    swift_bridgeObjectRelease_n();
    return;
  }
  v5 = 0;
  v6 = (unint64_t *)(a1 + 48);
  while (1)
  {
    if (v5 >= *(_QWORD *)(a1 + 16))
    {
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
      goto LABEL_24;
    }
    v8 = *(v6 - 1);
    v7 = *v6;
    v9 = *(v6 - 2);
    sub_237F7C1D8(v8, *v6);
    if (v7 >> 60 == 15)
      goto LABEL_18;
    v10 = (_QWORD *)*a3;
    v12 = sub_237F792D8(v9);
    v13 = v10[2];
    v14 = (v11 & 1) == 0;
    v15 = v13 + v14;
    if (__OFADD__(v13, v14))
      goto LABEL_21;
    v16 = v11;
    if (v10[3] < v15)
      break;
    if ((a2 & 1) != 0)
    {
      if ((v11 & 1) != 0)
        goto LABEL_16;
    }
    else
    {
      sub_237F6F330(&qword_2568B6478);
      _NativeDictionary.copy()();
      if ((v16 & 1) != 0)
        goto LABEL_16;
    }
LABEL_12:
    v19 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    *(_QWORD *)(v19[6] + 8 * v12) = v9;
    v20 = (uint64_t *)(v19[7] + 16 * v12);
    *v20 = v8;
    v20[1] = v7;
    v21 = v19[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_22;
    ++v5;
    v19[2] = v23;
    v6 += 3;
    a2 = 1;
    if (v4 == v5)
      goto LABEL_18;
  }
  sub_237F7A2C0(v15, a2 & 1);
  v17 = sub_237F792D8(v9);
  if ((v16 & 1) != (v18 & 1))
    goto LABEL_23;
  v12 = v17;
  if ((v16 & 1) == 0)
    goto LABEL_12;
LABEL_16:
  v24 = (void *)swift_allocError();
  swift_willThrow();
  v25 = v24;
  sub_237F6F330(&qword_2568B62F8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_237F6F63C(v8, v7);
    swift_bridgeObjectRelease();

    return;
  }
LABEL_24:
  _StringGuts.grow(_:)(30);
  v26._object = (void *)0x8000000237F8C580;
  v26._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v26);
  _print_unlocked<A, B>(_:_:)();
  v27._countAndFlagsBits = 39;
  v27._object = (void *)0xE100000000000000;
  String.append(_:)(v27);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_237F7B188()
{
  _QWORD *v0;
  uint64_t v1;

  sub_237F7B8DC();
  *v0 = v1;
}

void sub_237F7B1BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_237F7B408(a1, a2, a3, *v3, &qword_2568B6468, &qword_2568B6458);
  *v3 = v4;
}

void sub_237F7B1E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_237F7B408(a1, a2, a3, *v3, &qword_2568B64A8, &qword_2568B6498);
  *v3 = v4;
}

void sub_237F7B214(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_237F7B408(a1, a2, a3, *v3, &qword_2568B64E8, &qword_2568B64F0);
  *v3 = v4;
}

void sub_237F7B240(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_237F7B4E4(a1, a2, a3, *v3, &qword_2568B6380);
  *v3 = v4;
}

void sub_237F7B264()
{
  _QWORD *v0;
  uint64_t v1;

  sub_237F7B57C();
  *v0 = v1;
}

void sub_237F7B298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_237F7B4E4(a1, a2, a3, *v3, &qword_2568B6378);
  *v3 = v4;
}

void sub_237F7B2BC()
{
  _QWORD *v0;
  uint64_t v1;

  sub_237F7B57C();
  *v0 = v1;
}

char *sub_237F7B2F0(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_237F7B62C(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_237F7B30C(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_237F7B70C(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

void sub_237F7B328(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_237F7B980(a1, a2, a3, *v3, &qword_2568B6410, (void (*)(_QWORD))MEMORY[0x24BE16FD0]);
  *v3 = v4;
}

char *sub_237F7B354(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_237F7B7F4(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

void sub_237F7B370()
{
  _QWORD *v0;
  uint64_t v1;

  sub_237F7B8DC();
  *v0 = v1;
}

void sub_237F7B3A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_237F7B980(a1, a2, a3, *v3, &qword_2568B6330, (void (*)(_QWORD))MEMORY[0x24BE170A8]);
  *v3 = v4;
}

char *sub_237F7B3D0(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_237F7BA5C(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_237F7B3EC(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_237F7BB3C(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

void sub_237F7B408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
  uint64_t v6;
  uint64_t v7;
  char v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v10 = a1;
  if ((a3 & 1) != 0)
  {
    sub_237F7C5C4();
    if (v12 != v13)
    {
      sub_237F7C888();
      if (v12)
      {
LABEL_23:
        __break(1u);
        return;
      }
      sub_237F7C5B4();
    }
  }
  else
  {
    v11 = a2;
  }
  v14 = *(_QWORD *)(a4 + 16);
  if (v11 <= v14)
    v15 = *(_QWORD *)(a4 + 16);
  else
    v15 = v11;
  if (!v15)
    goto LABEL_17;
  sub_237F7C830(a1, a2, a3, a4, a5);
  sub_237F6F330(a6);
  v16 = (_QWORD *)sub_237F7C64C();
  v17 = j__malloc_size(v16);
  if (!v6)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v17 - v7 == 0x8000000000000000 && v6 == -1)
    goto LABEL_22;
  v16[2] = v14;
  v16[3] = 2 * ((uint64_t)(v17 - v7) / v6);
LABEL_17:
  v19 = sub_237F6F330(a6);
  v20 = sub_237F7C794(v19);
  if ((v10 & 1) != 0)
  {
    sub_237F78308(v20, v21);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_237F72624(v20, v21, v22);
  }
  sub_237F7C6B0();
  sub_237F7C920();
}

void sub_237F7B4E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  char v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  char *v13;
  char *v14;

  v6 = a1;
  if ((a3 & 1) != 0)
  {
    sub_237F7C5C4();
    if (v8 != v9)
    {
      sub_237F7C888();
      if (v8)
      {
        __break(1u);
        return;
      }
      sub_237F7C5B4();
    }
  }
  else
  {
    v7 = a2;
  }
  v10 = *(_QWORD *)(a4 + 16);
  if (v7 <= v10)
    v11 = *(_QWORD *)(a4 + 16);
  else
    v11 = v7;
  if (v11)
  {
    sub_237F7C830(a1, a2, a3, a4, a5);
    v12 = (_QWORD *)sub_237F7C614();
    sub_237F7CA18(v12);
  }
  else
  {
    v11 = MEMORY[0x24BEE4AF8];
  }
  v13 = (char *)(v11 + 32);
  v14 = (char *)(a4 + 32);
  if ((v6 & 1) != 0)
  {
    sub_237F78420(v14, v10, v13);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_237F72784(v14, v10, v13);
  }
  sub_237F7C6B0();
  sub_237F6CB38();
}

void sub_237F7B57C()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, _QWORD *);
  void (*v2)(uint64_t, uint64_t, _QWORD *);
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  _QWORD *v16;
  uint64_t v17;

  sub_237F7CD4C();
  if ((v6 & 1) != 0)
  {
    sub_237F7C5C4();
    if (v10 != v11)
    {
      sub_237F7C888();
      if (v10)
      {
        __break(1u);
        return;
      }
      sub_237F7C5B4();
    }
  }
  else
  {
    v9 = v5;
  }
  v12 = *(_QWORD *)(v0 + 16);
  if (v9 <= v12)
    v13 = *(_QWORD *)(v0 + 16);
  else
    v13 = v9;
  if (v13)
  {
    sub_237F7C830(v4, v5, v6, v7, v8);
    v14 = (_QWORD *)sub_237F7C614();
    v15 = j__malloc_size(v14);
    v14[2] = v12;
    v14[3] = 2 * ((uint64_t)(v15 - 32) / 16);
  }
  else
  {
    v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v16 = v14 + 4;
  v17 = v0 + 32;
  if ((v3 & 1) != 0)
  {
    v2(v17, v12, v16);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    v1(v17, v12, v16);
  }
  sub_237F7C6B0();
  sub_237F7CAF8();
}

char *sub_237F7B62C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    sub_237F6F330(&qword_2568B63E0);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_237F78514(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_237F72974(v13, v8, v12);
  }
  swift_release();
  return v10;
}

char *sub_237F7B70C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    sub_237F6F330(&qword_2568B63F8);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_237F78598(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_237F72A3C((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_237F7B7F4(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    sub_237F6F330(&qword_2568B6438);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_237F78624(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_237F72B2C((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

void sub_237F7B8DC()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, _QWORD *);
  void (*v2)(uint64_t, uint64_t, _QWORD *);
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;

  sub_237F7CD4C();
  if ((v6 & 1) != 0)
  {
    sub_237F7C5C4();
    if (v10 != v11)
    {
      sub_237F7C888();
      if (v10)
      {
        __break(1u);
        return;
      }
      sub_237F7C5B4();
    }
  }
  else
  {
    v9 = v5;
  }
  v12 = *(_QWORD *)(v0 + 16);
  if (v9 <= v12)
    v13 = *(_QWORD *)(v0 + 16);
  else
    v13 = v9;
  if (v13)
  {
    sub_237F7C830(v4, v5, v6, v7, v8);
    v14 = (_QWORD *)sub_237F7C614();
    j__malloc_size(v14);
    sub_237F7CC60();
    v14[2] = v12;
    v14[3] = v15;
  }
  else
  {
    v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v16 = v14 + 4;
  v17 = v0 + 32;
  if ((v3 & 1) != 0)
  {
    v2(v17, v12, v16);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    v1(v17, v12, v16);
  }
  sub_237F7C6B0();
  sub_237F7CAF8();
}

void sub_237F7B980(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD))
{
  uint64_t v6;
  uint64_t v7;
  char v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v10 = a1;
  if ((a3 & 1) != 0)
  {
    sub_237F7C5C4();
    if (v12 != v13)
    {
      sub_237F7C888();
      if (v12)
      {
LABEL_23:
        __break(1u);
        return;
      }
      sub_237F7C5B4();
    }
  }
  else
  {
    v11 = a2;
  }
  v14 = *(_QWORD *)(a4 + 16);
  if (v11 <= v14)
    v15 = *(_QWORD *)(a4 + 16);
  else
    v15 = v11;
  if (!v15)
    goto LABEL_17;
  sub_237F7C830(a1, a2, a3, a4, a5);
  a6(0);
  v16 = (_QWORD *)sub_237F7C64C();
  v17 = j__malloc_size(v16);
  if (!v6)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v17 - v7 == 0x8000000000000000 && v6 == -1)
    goto LABEL_22;
  v16[2] = v14;
  v16[3] = 2 * ((uint64_t)(v17 - v7) / v6);
LABEL_17:
  v19 = ((uint64_t (*)(_QWORD))a6)(0);
  v20 = sub_237F7C794(v19);
  if ((v10 & 1) != 0)
  {
    sub_237F786B0(v20, v21);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_237F72CE4(v20, v21, v22);
  }
  sub_237F7C6B0();
  sub_237F7C920();
}

char *sub_237F7BA5C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    sub_237F6F330(&qword_2568B64E0);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_237F78490(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_237F72D78(v13, v8, v12);
  }
  swift_release();
  return v10;
}

char *sub_237F7BB3C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    sub_237F6F330(&qword_2568B6480);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_237F78744(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_237F72E40((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

_QWORD *sub_237F7BC28(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  sub_237F6F330(&qword_2568B6448);
  v3 = (_QWORD *)sub_237F7C614();
  j__malloc_size(v3);
  sub_237F7CC60();
  v3[2] = v1;
  v3[3] = v4;
  v5 = sub_237F7BD94(&v7, v3 + 4, v1, a1);
  sub_237F7C868();
  sub_237F7C2C8();
  if (v5 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

void sub_237F7BCF4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    sub_237F7C34C(*(_QWORD *)(a5 + 56) + 40 * a2, a1);
    sub_237F7028C();
    return;
  }
LABEL_8:
  __break(1u);
}

uint64_t sub_237F7BD70@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;

  result = sub_237F7CCA0(a1, a2);
  if (v8 != v9)
    v5 = ~v7;
  v3[1] = result;
  v3[2] = ~v4;
  v3[3] = 0;
  v3[4] = v5 & v6;
  return result;
}

_QWORD *sub_237F7BD94(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;

  v4 = a4 + 64;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v8 = 0;
    a3 = 0;
LABEL_36:
    *result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (_QWORD *)a3;
  }
  if (!a3)
  {
    v8 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v8 = 0;
  v9 = 0;
  v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v12 = v11 | (v8 << 6);
LABEL_19:
    ++v9;
    *a2++ = *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * v12);
    if (v9 == a3)
      goto LABEL_36;
  }
  v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v13 >= v10)
    goto LABEL_31;
  v14 = *(_QWORD *)(v4 + 8 * v13);
  if (v14)
    goto LABEL_18;
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    v7 = 0;
    v8 = v13;
    goto LABEL_35;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_14:
    v13 = v8;
LABEL_18:
    v16 = __clz(__rbit64(v14));
    v7 = (v14 - 1) & v14;
    v12 = v16 + (v13 << 6);
    v8 = v13;
    goto LABEL_19;
  }
  v15 = v13 + 2;
  if (v13 + 2 >= v10)
    goto LABEL_31;
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_17:
    v13 = v15;
    goto LABEL_18;
  }
  v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    v7 = 0;
    v8 = v13 + 2;
    goto LABEL_35;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
    goto LABEL_14;
  v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_31:
    v7 = 0;
LABEL_35:
    a3 = v9;
    goto LABEL_36;
  }
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
    goto LABEL_17;
  while (1)
  {
    v13 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v13 >= v10)
    {
      v7 = 0;
      v8 = v10 - 1;
      goto LABEL_35;
    }
    v14 = *(_QWORD *)(v4 + 8 * v13);
    ++v15;
    if (v14)
      goto LABEL_18;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_237F7BF28@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;

  result = sub_237F7CCA0(a1, a2);
  v5[1] = result;
  v5[2] = ~v9;
  if (v10 != v11)
    v12 = ~v8;
  else
    v12 = v6;
  v5[3] = 0;
  v5[4] = v12 & v7;
  v5[5] = v3;
  v5[6] = v4;
  return result;
}

void sub_237F7BF50(_OWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  void (*v19)(_OWORD *);
  _OWORD v20[3];
  _OWORD v21[3];
  __int128 v22;
  _OWORD v23[2];

  v3 = *v1;
  v4 = v1[1];
  v6 = v1[2];
  v5 = v1[3];
  v7 = v5;
  v8 = v1[4];
  if (v8)
  {
    v9 = (v8 - 1) & v8;
    v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    v11 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    v13 = *v11;
    v12 = v11[1];
    sub_237F78E90(*(_QWORD *)(v3 + 56) + 32 * v10, (uint64_t)v23);
    *(_QWORD *)&v22 = v13;
    *((_QWORD *)&v22 + 1) = v12;
    sub_237F7C868();
    goto LABEL_23;
  }
  v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return;
  }
  v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    v16 = *(_QWORD *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      v9 = (v16 - 1) & v16;
      v10 = __clz(__rbit64(v16)) + (v14 << 6);
      v7 = v14;
      goto LABEL_3;
    }
    v17 = v5 + 2;
    v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      v16 = *(_QWORD *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        v14 = v17;
        goto LABEL_7;
      }
      v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        v16 = *(_QWORD *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          v14 = v5 + 3;
          goto LABEL_7;
        }
        v17 = v5 + 4;
        v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          v16 = *(_QWORD *)(v4 + 8 * v17);
          if (v16)
            goto LABEL_10;
          v14 = v5 + 5;
          v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            v16 = *(_QWORD *)(v4 + 8 * v14);
            if (v16)
              goto LABEL_7;
            v7 = v15 - 1;
            v18 = v5 + 6;
            while (v18 < v15)
            {
              v16 = *(_QWORD *)(v4 + 8 * v18++);
              if (v16)
              {
                v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  v9 = 0;
  memset(v23, 0, sizeof(v23));
  v22 = 0u;
LABEL_23:
  *v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  v19 = (void (*)(_OWORD *))v1[5];
  sub_237F7C2D0((uint64_t)&v22, (uint64_t)v21, &qword_2568B63C0);
  if (*((_QWORD *)&v21[0] + 1))
  {
    v20[0] = v21[0];
    v20[1] = v21[1];
    v20[2] = v21[2];
    v19(v20);
    sub_237F7C3F8((uint64_t)v20, &qword_2568B63C8);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
}

uint64_t sub_237F7C130(uint64_t *a1, uint64_t *a2)
{
  return sub_237F776D4(*a1, a1[1], *a2, a2[1]) & 1;
}

uint64_t sub_237F7C158(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t i;

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
  v2 = 64;
  for (i = 10; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    v1 = *(_QWORD *)(a1 + 8 * i);
    v2 += 64;
    if (v1)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_237F7C1D8(uint64_t a1, unint64_t a2)
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

_QWORD *sub_237F7C21C(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_237F7C240()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  uint64_t v10;

  sub_237F7C6C8();
  return sub_237F75358(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10);
}

uint64_t sub_237F7C260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  NSURL *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_237F7C6C8();
  return sub_237F754C4(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10, v11);
}

uint64_t sub_237F7C280(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_237F6F330(&qword_2568B6338);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_237F7C2C8()
{
  return swift_release();
}

void sub_237F7C2D0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_237F7CAE0(a1, a2, a3);
  sub_237F7CBCC();
  sub_237F7CC80(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 32));
  sub_237F7028C();
}

unint64_t sub_237F7C2F8()
{
  unint64_t result;

  result = qword_2568B63E8;
  if (!qword_2568B63E8)
  {
    result = MEMORY[0x23B828F58](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2568B63E8);
  }
  return result;
}

uint64_t sub_237F7C334(__int128 *a1, uint64_t a2)
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

uint64_t sub_237F7C34C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_237F7C390(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_237F7CAE0(a1, a2, a3);
  sub_237F7CBCC();
  sub_237F7CC80(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16));
  sub_237F7028C();
}

uint64_t *sub_237F7C3B8(uint64_t a1, uint64_t *a2)
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

void sub_237F7C3F8(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = sub_237F6F330(a2);
  sub_237F7CD60(*(_QWORD *)(v2 - 8));
  sub_237F7028C();
}

unint64_t sub_237F7C428()
{
  unint64_t result;

  result = qword_2568B64C8;
  if (!qword_2568B64C8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2568B64C8);
  }
  return result;
}

uint64_t sub_237F7C464(uint64_t *a1)
{
  uint64_t v1;

  return sub_237F7C130(a1, *(uint64_t **)(v1 + 16)) & 1;
}

uint64_t sub_237F7C480()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_237F7C4A4()
{
  return swift_deallocObject();
}

void sub_237F7C4B4(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    sub_237F7CD40();
  }
  sub_237F7028C();
}

uint64_t sub_237F7C4E8(uint64_t *a1)
{
  return sub_237F7C464(a1) & 1;
}

void sub_237F7C51C()
{
  JUMPOUT(0x23B828FE8);
}

uint64_t sub_237F7C528()
{
  return swift_slowAlloc();
}

uint64_t sub_237F7C530()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_237F7C53C()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_237F7C54C()
{
  return swift_bridgeObjectRetain();
}

void sub_237F7C57C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 64) = 0;
}

uint64_t sub_237F7C5D4()
{
  return swift_bridgeObjectRelease_n();
}

id sub_237F7C5DC()
{
  void *v0;

  return v0;
}

uint64_t sub_237F7C600()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F7C614()
{
  return swift_allocObject();
}

uint64_t sub_237F7C64C()
{
  return swift_allocObject();
}

uint64_t sub_237F7C670()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_237F7C6B0()
{
  return swift_release();
}

BOOL sub_237F7C6B8(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

__n128 sub_237F7C6C8()
{
  uint64_t v0;

  return *(__n128 *)(v0 + 72);
}

uint64_t sub_237F7C6F8()
{
  return swift_arrayInitWithTakeFrontToBack();
}

uint64_t sub_237F7C708()
{
  return swift_arrayInitWithTakeBackToFront();
}

uint64_t sub_237F7C718()
{
  return swift_arrayInitWithCopy();
}

uint64_t sub_237F7C728()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_237F7C730()
{
  return swift_arrayDestroy();
}

uint64_t sub_237F7C738()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;

  *v2 = *v4;
  return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v3 + 104))(v2, v0, v1);
}

void sub_237F7C754(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t sub_237F7C75C(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_237F7C794(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  return v1 + ((v2 + 32) & ~v2);
}

void sub_237F7C7B8(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  *(_QWORD *)(v2 + a1) |= v1;
  v7 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v4);
  *v7 = v5;
  v7[1] = v6;
}

uint64_t sub_237F7C7DC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_237F7C7E4()
{
  return swift_dynamicCast();
}

uint64_t sub_237F7C830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return sub_237F6F330(a5);
}

uint64_t sub_237F7C860()
{
  return swift_release();
}

uint64_t sub_237F7C868()
{
  return swift_bridgeObjectRetain();
}

void sub_237F7C894()
{
  sub_237F7B370();
}

uint64_t sub_237F7C8AC()
{
  return type metadata accessor for Logger();
}

unint64_t sub_237F7C8D0()
{
  return sub_237F79370();
}

uint64_t sub_237F7C8DC()
{
  return swift_dynamicCast();
}

uint64_t sub_237F7C8F0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_237F7C8F8()
{
  return swift_bridgeObjectRelease();
}

void *sub_237F7C900(void *__dst, const void *__src, size_t __n)
{
  return memcpy(__dst, __src, __n);
}

uint64_t sub_237F7C934()
{
  return swift_unexpectedError();
}

uint64_t sub_237F7C948(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 80) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_237F7C95C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_237F7C970@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_237F7C97C()
{
  return AsyncThrowingStream.Continuation.yield(_:)();
}

uint64_t sub_237F7C990@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_237F7C99C()
{
  uint64_t v0;

  sub_237F7C2C8();
  return v0;
}

uint64_t sub_237F7C9E4()
{
  return type metadata accessor for URL();
}

unint64_t sub_237F7C9EC()
{
  return sub_237F79370();
}

size_t sub_237F7CA18(_QWORD *a1)
{
  uint64_t v1;
  size_t result;

  result = j__malloc_size(a1);
  a1[2] = v1;
  a1[3] = 2 * ((uint64_t)(result - 32) / 8);
  return result;
}

uint64_t sub_237F7CA40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_237F7CA50()
{
  return String.index(after:)();
}

uint64_t sub_237F7CA60()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_237F7CA68()
{
  return AsyncThrowingStream.Continuation.yield(_:)();
}

uint64_t sub_237F7CA78()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_237F7CA80()
{
  return 0;
}

uint64_t sub_237F7CA90()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_237F7CA98()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(*(_QWORD *)(v1 + 48) + 16 * v0 + 8);
}

uint64_t sub_237F7CAC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a12 + 8))(v13, a13);
}

uint64_t sub_237F7CAE0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_237F6F330(a3);
}

uint64_t sub_237F7CAF0()
{
  return swift_retain();
}

uint64_t sub_237F7CB08()
{
  return static os_log_type_t.error.getter();
}

void sub_237F7CB1C()
{
  uint64_t v0;

}

BOOL sub_237F7CB2C(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_237F7CB3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 104))(v11, a2, a10);
}

uint64_t sub_237F7CB4C()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t sub_237F7CB5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t sub_237F7CB64()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[21] + 8))(v0[22], v0[20]);
}

uint64_t sub_237F7CB74()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[21] + 88))(v0[22], v0[20]);
}

uint64_t sub_237F7CB84()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_237F7CB8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v6;
  uint64_t v7;
  va_list va;

  va_start(va, a6);
  return sub_237F787F8(v7, v6, (uint64_t *)va);
}

void sub_237F7CBAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,__int128 a23)
{
  sub_237F7BF50(&a23);
}

uint64_t sub_237F7CBC4()
{
  return swift_release();
}

uint64_t sub_237F7CBD8(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;

  return v2(v3, a2, v4);
}

uint64_t sub_237F7CC38()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F7CC80@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_237F7CC8C()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_237F7CC94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_237F6C9A4(a1, 1, 1, a4);
}

uint64_t sub_237F7CCA0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = a1;
  return a1 + 64;
}

uint64_t sub_237F7CCC4()
{
  return swift_allocObject();
}

uint64_t sub_237F7CCD0()
{
  return String.subscript.getter();
}

uint64_t sub_237F7CCDC()
{
  return swift_task_dealloc();
}

char *sub_237F7CCF8(char *a1, int64_t a2)
{
  uint64_t v2;

  return sub_237F77E08(a1, a2, 1, v2);
}

uint64_t sub_237F7CD04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_237F6C9A4(a1, a2, 1, v2);
}

uint64_t sub_237F7CD10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_237F6FBF0(a1 + 32 * v1);
}

uint64_t sub_237F7CD1C()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t sub_237F7CD28()
{
  return AsyncThrowingStream.Continuation.finish(throwing:)();
}

uint64_t sub_237F7CD34()
{
  return AsyncThrowingStream.Continuation.finish(throwing:)();
}

void sub_237F7CD40()
{
  JUMPOUT(0x23B828F58);
}

uint64_t sub_237F7CD60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

void sub_237F7CD8C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_237F7C3F8(v2, a2);
}

uint64_t sub_237F7CD94()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_237F7CD9C()
{
  return swift_allocError();
}

uint64_t sub_237F7CDD0(uint64_t a1, char a2)
{
  uint64_t v2;

  return *(_QWORD *)(v2 + 16) + ((a2 & 1) == 0);
}

uint64_t sub_237F7CDF0()
{
  return type metadata accessor for Asset();
}

uint64_t sub_237F7CDF8()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_237F7CE00()
{
  return Hasher.init(_seed:)();
}

void sub_237F7CE0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD v5[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_237F6FC10((_OWORD *)a1, v5);
    sub_237F6F760(v5, a2, a3);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_237F6F680(a1, &qword_2568B64C0);
    sub_237F8449C(v5);
    swift_bridgeObjectRelease();
    sub_237F6F680((uint64_t)v5, &qword_2568B64C0);
  }
}

uint64_t sub_237F7CE9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  v8 = type metadata accessor for DownloadRequestMessage();
  v7[9] = v8;
  v7[10] = *(_QWORD *)(v8 - 8);
  v7[11] = sub_237F6FD58();
  sub_237F6FDBC();
  return sub_237F6FCB8();
}

uint64_t sub_237F7CEF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(v0 + 80);
  v1 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 72);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 16))(v1, *(_QWORD *)(v0 + 24), v3);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v4 == *MEMORY[0x24BE17140] || v4 == *MEMORY[0x24BE17148])
  {
    v6 = *(uint64_t **)(v0 + 88);
    (*(void (**)(uint64_t *, _QWORD))(*(_QWORD *)(v0 + 80) + 96))(v6, *(_QWORD *)(v0 + 72));
    v7 = *v6;
    *(_QWORD *)(v0 + 96) = *v6;
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v8;
    *v8 = v0;
    v8[1] = sub_237F7D01C;
    return sub_237F80694(*(_QWORD *)(v0 + 16), v7, *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 80);
    v9 = *(_QWORD *)(v0 + 88);
    sub_237F77634();
    sub_237F7CD9C();
    sub_237F84DD0();
    sub_237F6FD50(v9, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_237F7D01C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  sub_237F6FDBC();
  return sub_237F6FCB8();
}

uint64_t sub_237F7D074()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_237F70240();
  return sub_237F700B0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F7D0A4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return sub_237F700B0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_237F7D0D8(uint64_t a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
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
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t result;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v2 = v1;
  v47 = sub_237F6F330(&qword_2568B6818);
  v4 = MEMORY[0x24BDAC7A8](v47);
  v53 = (uint64_t)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v46 = (char *)&v41 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v45 = (char *)&v41 - v8;
  v9 = sub_237F6F330(&qword_2568B64F0);
  v43 = *(_QWORD *)(v9 - 8);
  v44 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(a1 + 16);
  v13 = MEMORY[0x24BEE4AF8];
  if (!v12)
    return v13;
  v55 = MEMORY[0x24BEE4AF8];
  sub_237F7B214(0, v12, 0);
  v14 = sub_237F7BCF0(a1);
  if (v14 < 0 || (v16 = v14, v14 >= 1 << *(_BYTE *)(a1 + 32)))
  {
LABEL_23:
    __break(1u);
  }
  else
  {
    v17 = a1 + 64;
    v41 = a1 + 64;
    v42 = a1;
    v18 = (uint64_t)v45;
    while ((*(_QWORD *)(v17 + 8 * (v16 >> 6)) & (1 << v16)) != 0)
    {
      if ((_DWORD)v15 != *(_DWORD *)(a1 + 36))
        goto LABEL_25;
      v50 = 1 << v16;
      v51 = v16 >> 6;
      v48 = v12;
      v49 = v15;
      v52 = v2;
      v19 = v11;
      v20 = v47;
      v21 = *(int *)(v47 + 48);
      v22 = *(_QWORD *)(a1 + 48);
      v23 = type metadata accessor for URL();
      v24 = *(_QWORD *)(v23 - 8);
      v25 = v22 + *(_QWORD *)(v24 + 72) * v16;
      v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16);
      v26(v18, v25, v23);
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v16);
      *(_QWORD *)(v18 + v21) = v27;
      v28 = v46;
      v26((uint64_t)v46, v18, v23);
      *(_QWORD *)&v28[*(int *)(v20 + 48)] = v27;
      v29 = (uint64_t)v28;
      v30 = v53;
      sub_237F84BEC(v29, v53, &qword_2568B6818);
      swift_bridgeObjectRetain_n();
      sub_237F6F680(v18, &qword_2568B6818);
      v31 = *(int *)(v20 + 48);
      v11 = v19;
      v32 = *(_QWORD *)(v30 + v31);
      v26((uint64_t)v19, v30, v23);
      if (*(_QWORD *)(sub_237F7E5B8(v32) + 16))
      {
        sub_237F6F330(&qword_2568B6450);
        v33 = static _DictionaryStorage.allocate(capacity:)();
      }
      else
      {
        v33 = MEMORY[0x24BEE4B00];
      }
      v34 = v52;
      v54 = v33;
      v35 = swift_bridgeObjectRetain();
      sub_237F7A608(v35, 1, &v54);
      v2 = v34;
      v17 = v41;
      if (v34)
        goto LABEL_29;
      swift_bridgeObjectRelease();
      v36 = v53;
      *(_QWORD *)&v11[*(int *)(v44 + 48)] = v54;
      sub_237F6F680(v36, &qword_2568B6818);
      v13 = v55;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_237F7B214(0, *(_QWORD *)(v13 + 16) + 1, 1);
        v13 = v55;
      }
      v38 = *(_QWORD *)(v13 + 16);
      v37 = *(_QWORD *)(v13 + 24);
      if (v38 >= v37 >> 1)
      {
        sub_237F7B214(v37 > 1, v38 + 1, 1);
        v13 = v55;
      }
      *(_QWORD *)(v13 + 16) = v38 + 1;
      sub_237F84BEC((uint64_t)v11, v13+ ((*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80))+ *(_QWORD *)(v43 + 72) * v38, &qword_2568B64F0);
      a1 = v42;
      if ((uint64_t)v16 >= -(-1 << *(_BYTE *)(v42 + 32)))
        goto LABEL_26;
      if ((*(_QWORD *)(v17 + 8 * v51) & v50) == 0)
        goto LABEL_27;
      if ((_DWORD)v49 != *(_DWORD *)(v42 + 36))
        goto LABEL_28;
      v39 = _HashTable.occupiedBucket(after:)();
      v12 = v48 - 1;
      if (v48 == 1)
        return v13;
      v16 = v39;
      if ((v39 & 0x8000000000000000) == 0)
      {
        v15 = *(unsigned int *)(a1 + 36);
        if (v39 < 1 << *(_BYTE *)(a1 + 32))
          continue;
      }
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_237F7D4E4(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  uint64_t v16;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t *v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  _BOOL8 v27;
  Swift::Int v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  char v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t result;
  uint64_t v45;
  void (*v46)(_QWORD, _QWORD, _QWORD);
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  char *v54;
  _QWORD *v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;

  v5 = type metadata accessor for AssetDownloadRequest();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_237F6F330(&qword_2568B6458);
  v50 = *(_QWORD *)(v9 - 8);
  v51 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = *(_QWORD *)(a1 + 16);
  if (v12)
  {
    v45 = v2;
    v61 = MEMORY[0x24BEE4AF8];
    sub_237F7B1BC(0, v12, 0);
    v13 = a1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v54 = v8;
    v55 = a2 + 4;
    v47 = *(_QWORD *)(v6 + 72);
    v48 = v11;
    v14 = *(void (**)(_QWORD, _QWORD, _QWORD))(v6 + 16);
    v49 = v6;
    v46 = v14;
    while (1)
    {
      v53 = v12;
      v14(v8, v13, v5);
      v15 = (void *)a2[2];
      objc_msgSend(v15, sel_lock);
      v16 = a2[3];
      if (__OFADD__(v16, 1))
        break;
      v56 = v13;
      a2[3] = v16 + 1;
      swift_beginAccess();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v60 = (_QWORD *)a2[4];
      v18 = v60;
      v19 = a2;
      a2[4] = 0x8000000000000000;
      v58 = v5;
      sub_237F6FB4C(&qword_2568B6820, (uint64_t (*)(uint64_t))MEMORY[0x24BE17070], MEMORY[0x24BE17068]);
      v59 = v20;
      v21 = sub_237F84C18((uint64_t *)&v57);
      v22 = v8;
      v23 = v5;
      v14(v21, v22, v5);
      v24 = sub_237F792D8(v16);
      v26 = v18[2];
      v27 = (v25 & 1) == 0;
      v28 = v26 + v27;
      if (__OFADD__(v26, v27))
        goto LABEL_20;
      v29 = v24;
      v30 = v25;
      sub_237F6F330(&qword_2568B6430);
      if (_NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v28))
      {
        v31 = sub_237F792D8(v16);
        if ((v30 & 1) != (v32 & 1))
          goto LABEL_21;
        v29 = v31;
      }
      v52 = v15;
      v33 = v60;
      if ((v30 & 1) != 0)
      {
        v34 = v60[7] + 40 * v29;
        sub_237F6FBF0(v34);
        sub_237F7C334(&v57, v34);
      }
      else
      {
        v35 = sub_237F84C54((uint64_t)&v57, v58);
        MEMORY[0x24BDAC7A8](v35);
        v37 = (char *)&v45 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v38 + 16))(v37);
        sub_237F84C7C(v29, v16, (uint64_t)v37, v33);
        sub_237F6FBF0((uint64_t)&v57);
      }
      a2 = v19;
      *v55 = v33;
      swift_bridgeObjectRelease();
      swift_endAccess();
      objc_msgSend(v52, sel_unlock);
      v5 = v23;
      (*(void (**)(char *, uint64_t))(v49 + 8))(v54, v23);
      v39 = (uint64_t)v48;
      *v48 = v16;
      AssetDownloadRequest.asset.getter();
      v40 = v61;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_237F7B1BC(0, *(_QWORD *)(v40 + 16) + 1, 1);
        v40 = v61;
      }
      v41 = v53;
      v8 = v54;
      v43 = *(_QWORD *)(v40 + 16);
      v42 = *(_QWORD *)(v40 + 24);
      if (v43 >= v42 >> 1)
      {
        sub_237F7B1BC(v42 > 1, v43 + 1, 1);
        v40 = v61;
      }
      *(_QWORD *)(v40 + 16) = v43 + 1;
      sub_237F84BEC(v39, v40+ ((*(unsigned __int8 *)(v50 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80))+ *(_QWORD *)(v50 + 72) * v43, &qword_2568B6458);
      v14 = v46;
      v13 = v56 + v47;
      v12 = v41 - 1;
      if (!v12)
      {
        swift_release();
        return v40;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
  }
  else
  {
    swift_release();
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

void sub_237F7D8F8(uint64_t a1, uint64_t (*a2)(_QWORD, char *), uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;
  char *v35;
  uint64_t v36;
  uint64_t (*v37)(_QWORD, char *);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;

  v37 = a2;
  v38 = a3;
  v36 = sub_237F6F330(&qword_2568B6398);
  v5 = MEMORY[0x24BDAC7A8](v36);
  v35 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v34 = (uint64_t *)((char *)&v30 - v8);
  MEMORY[0x24BDAC7A8](v7);
  v33 = (char *)&v30 - v9;
  v10 = *(_QWORD *)(a1 + 16);
  if (v10)
  {
    v30 = v3;
    v42 = MEMORY[0x24BEE4AF8];
    sub_237F7B188();
    v11 = sub_237F7BCF0(a1);
    if ((v11 & 0x8000000000000000) == 0)
    {
      v13 = v11;
      if (v11 < 1 << *(_BYTE *)(a1 + 32))
      {
        v14 = a1 + 64;
        v31 = a1 + 64;
        v32 = a1;
        while ((*(_QWORD *)(v14 + 8 * (v13 >> 6)) & (1 << v13)) != 0)
        {
          if ((_DWORD)v12 != *(_DWORD *)(a1 + 36))
            goto LABEL_20;
          v40 = v12;
          v41 = v13 >> 6;
          v39 = v10;
          v15 = v36;
          v16 = v33;
          v17 = &v33[*(int *)(v36 + 48)];
          v18 = *(_QWORD *)(a1 + 56);
          v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v13);
          v20 = type metadata accessor for Asset();
          v21 = *(_QWORD *)(v20 - 8);
          v22 = v18 + *(_QWORD *)(v21 + 72) * v13;
          v23 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
          v23(v17, v22, v20);
          *v16 = v19;
          v24 = (uint64_t)v34;
          *v34 = v19;
          v23((char *)(v24 + *(int *)(v15 + 48)), (uint64_t)v17, v20);
          v25 = v35;
          sub_237F84BEC(v24, (uint64_t)v35, &qword_2568B6398);
          sub_237F6F680((uint64_t)v16, &qword_2568B6398);
          v26 = v37(*(_QWORD *)v25, &v25[*(int *)(v15 + 48)]);
          sub_237F6F680((uint64_t)v25, &qword_2568B6398);
          v27 = v42;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_237F7B188();
            v27 = v42;
          }
          v28 = *(_QWORD *)(v27 + 16);
          a1 = v32;
          if (v28 >= *(_QWORD *)(v27 + 24) >> 1)
          {
            sub_237F7B188();
            v27 = v42;
          }
          *(_QWORD *)(v27 + 16) = v28 + 1;
          *(_QWORD *)(v27 + 8 * v28 + 32) = v26;
          if ((uint64_t)v13 >= -(-1 << *(_BYTE *)(a1 + 32)))
            goto LABEL_21;
          v14 = v31;
          if ((*(_QWORD *)(v31 + 8 * v41) & (1 << v13)) == 0)
            goto LABEL_22;
          if ((_DWORD)v40 != *(_DWORD *)(a1 + 36))
            goto LABEL_23;
          v29 = _HashTable.occupiedBucket(after:)();
          v10 = v39 - 1;
          if (v39 == 1)
            return;
          v13 = v29;
          if ((v29 & 0x8000000000000000) == 0)
          {
            v12 = *(unsigned int *)(a1 + 36);
            if (v29 < 1 << *(_BYTE *)(a1 + 32))
              continue;
          }
          goto LABEL_24;
        }
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
      }
    }
LABEL_24:
    __break(1u);
  }
}

uint64_t sub_237F7DC00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  char v32[40];
  _OWORD v33[3];
  _OWORD v34[3];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v3 = sub_237F6F330(&qword_2568B67D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = MEMORY[0x24BEE4AF8];
  if (!v6)
    return v7;
  v22[1] = v1;
  v37 = MEMORY[0x24BEE4AF8];
  sub_237F7B3D0(0, v6, 0);
  result = sub_237F7BCF0(a1);
  if ((result & 0x8000000000000000) == 0)
  {
    v10 = result;
    if (result < 1 << *(_BYTE *)(a1 + 32))
    {
      v11 = a1 + 64;
      v27 = &v36;
      v26 = (uint64_t)v34 + 8;
      v25 = (uint64_t)v33 + 8;
      v23 = v5;
      v24 = a1 + 64;
      while ((*(_QWORD *)(v11 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
      {
        if ((_DWORD)v9 != *(_DWORD *)(a1 + 36))
          goto LABEL_23;
        v28 = v9;
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v10);
        v13 = (uint64_t)v27;
        sub_237F7C34C(*(_QWORD *)(a1 + 56) + 40 * v10, (uint64_t)v27);
        v35 = v12;
        *(_QWORD *)&v34[0] = v12;
        sub_237F7C34C(v13, v26);
        v33[0] = v34[0];
        v33[1] = v34[1];
        v33[2] = v34[2];
        sub_237F6F680((uint64_t)&v35, &qword_2568B6418);
        v31 = *(_QWORD *)&v33[0];
        sub_237F7C34C(v25, (uint64_t)v32);
        sub_237F6F330(&qword_2568B6400);
        v14 = type metadata accessor for AssetDownloadRequest();
        if (swift_dynamicCast())
        {
          sub_237F6C9A4((uint64_t)v5, 0, 1, v14);
          v29 = AssetDownloadRequest.range.getter();
          v16 = v15;
          v30 = v17 & 1;
          (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v5, v14);
        }
        else
        {
          v30 = 1;
          sub_237F6C9A4((uint64_t)v5, 1, 1, v14);
          sub_237F6F680((uint64_t)v5, &qword_2568B67D0);
          v29 = 0;
          v16 = 0;
        }
        sub_237F6F680((uint64_t)v33, &qword_2568B6418);
        v7 = v37;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_237F7B3D0(0, *(_QWORD *)(v7 + 16) + 1, 1);
          v7 = v37;
        }
        v19 = *(_QWORD *)(v7 + 16);
        v18 = *(_QWORD *)(v7 + 24);
        if (v19 >= v18 >> 1)
        {
          result = (uint64_t)sub_237F7B3D0((char *)(v18 > 1), v19 + 1, 1);
          v7 = v37;
        }
        *(_QWORD *)(v7 + 16) = v19 + 1;
        v20 = v7 + 32 * v19;
        v21 = v29;
        *(_QWORD *)(v20 + 32) = v31;
        *(_QWORD *)(v20 + 40) = v21;
        *(_QWORD *)(v20 + 48) = v16;
        *(_BYTE *)(v20 + 56) = v30;
        if ((uint64_t)v10 >= -(-1 << *(_BYTE *)(a1 + 32)))
          goto LABEL_24;
        v11 = v24;
        if ((*(_QWORD *)(v24 + 8 * (v10 >> 6)) & (1 << v10)) == 0)
          goto LABEL_25;
        if ((_DWORD)v28 != *(_DWORD *)(a1 + 36))
          goto LABEL_26;
        result = _HashTable.occupiedBucket(after:)();
        if (!--v6)
          return v7;
        v10 = result;
        v5 = v23;
        if ((result & 0x8000000000000000) == 0)
        {
          v9 = *(unsigned int *)(a1 + 36);
          if (result < 1 << *(_BYTE *)(a1 + 32))
            continue;
        }
        goto LABEL_27;
      }
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_237F7DFC0(uint64_t a1)
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
  uint64_t *v14;
  uint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  void (*v30)(_BYTE *, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  _BYTE *v38;
  uint64_t v39;
  char v40;
  unint64_t v41;
  uint64_t v42;
  _BOOL8 v43;
  uint64_t v44;
  char v45;
  unint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  uint64_t v57;
  uint64_t result;
  _BYTE v59[16];
  __int128 v60;
  uint64_t v61;
  int64_t v62;
  _BYTE *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _BYTE *v67;
  uint64_t *v68;
  _QWORD *v69;
  uint64_t v70;
  _BYTE *v71;
  _BYTE *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int64_t v76;
  uint64_t v77;
  _QWORD *v78;
  _QWORD v79[6];
  _QWORD *v80;

  v2 = type metadata accessor for Asset.ID();
  v73 = *(_QWORD *)(v2 - 8);
  v74 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v72 = &v59[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for URL();
  v65 = *(_QWORD *)(v4 - 8);
  v66 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v71 = &v59[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v70 = sub_237F6F330(&qword_2568B6398);
  v64 = *(_QWORD *)(v70 - 8);
  v6 = MEMORY[0x24BDAC7A8](v70);
  v63 = &v59[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = MEMORY[0x24BDAC7A8](v6);
  v69 = &v59[-v9];
  v10 = MEMORY[0x24BDAC7A8](v8);
  v68 = (uint64_t *)&v59[-v11];
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (uint64_t *)&v59[-v13];
  MEMORY[0x24BDAC7A8](v12);
  v67 = &v59[-v15];
  v16 = (_QWORD *)MEMORY[0x24BEE4B00];
  v80 = (_QWORD *)MEMORY[0x24BEE4B00];
  sub_237F7BD70(a1, v79);
  v75 = v79[0];
  v61 = v79[1];
  v76 = v79[3];
  v17 = v79[4];
  v62 = (unint64_t)(v79[2] + 64) >> 6;
  v60 = xmmword_237F8B2A0;
  while (1)
  {
    v78 = v16;
    if (v17)
    {
      v77 = (v17 - 1) & v17;
      v18 = __clz(__rbit64(v17)) | (v76 << 6);
    }
    else
    {
      v19 = v76 + 1;
      if (__OFADD__(v76, 1))
        goto LABEL_35;
      if (v19 >= v62)
        goto LABEL_32;
      v20 = *(_QWORD *)(v61 + 8 * v19);
      v21 = v76 + 1;
      if (!v20)
      {
        v21 = v76 + 2;
        if (v76 + 2 >= v62)
          goto LABEL_32;
        v20 = *(_QWORD *)(v61 + 8 * v21);
        if (!v20)
        {
          v21 = v76 + 3;
          if (v76 + 3 >= v62)
            goto LABEL_32;
          v20 = *(_QWORD *)(v61 + 8 * v21);
          if (!v20)
          {
            v21 = v76 + 4;
            if (v76 + 4 >= v62)
              goto LABEL_32;
            v20 = *(_QWORD *)(v61 + 8 * v21);
            if (!v20)
            {
              v21 = v76 + 5;
              if (v76 + 5 >= v62)
                goto LABEL_32;
              v20 = *(_QWORD *)(v61 + 8 * v21);
              if (!v20)
              {
                v22 = v76 + 6;
                while (v22 < v62)
                {
                  v20 = *(_QWORD *)(v61 + 8 * v22++);
                  if (v20)
                  {
                    v21 = v22 - 1;
                    goto LABEL_19;
                  }
                }
LABEL_32:
                swift_release();
                return (uint64_t)v16;
              }
            }
          }
        }
      }
LABEL_19:
      v76 = v21;
      v77 = (v20 - 1) & v20;
      v18 = __clz(__rbit64(v20)) + (v21 << 6);
    }
    v23 = *(_QWORD *)(v75 + 56);
    v24 = *(_QWORD *)(*(_QWORD *)(v75 + 48) + 8 * v18);
    v25 = type metadata accessor for Asset();
    v26 = *(_QWORD *)(v25 - 8);
    v27 = v23 + *(_QWORD *)(v26 + 72) * v18;
    v28 = v70;
    v29 = v67;
    v30 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v26 + 16);
    v30(&v67[*(int *)(v70 + 48)], v27, v25);
    *v29 = v24;
    sub_237F84BEC((uint64_t)v29, (uint64_t)v14, &qword_2568B6398);
    v31 = *(int *)(v28 + 48);
    v32 = v68;
    v33 = (char *)v68 + v31;
    v34 = (uint64_t)v14;
    v35 = *v14;
    *v68 = *v14;
    v30((_BYTE *)v32 + v31, (uint64_t)v14 + v31, v25);
    v36 = (uint64_t)v69;
    v37 = (char *)v69 + *(int *)(v28 + 48);
    *v69 = v35;
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v37, v33, v25);
    v38 = v72;
    Asset.id.getter();
    v39 = (uint64_t)v71;
    Asset.ID.storageLocation.getter();
    (*(void (**)(_BYTE *, uint64_t))(v73 + 8))(v38, v74);
    sub_237F6F680(v36, &qword_2568B6398);
    v16 = v78;
    v41 = sub_237F79308(v39);
    v42 = v16[2];
    v43 = (v40 & 1) == 0;
    v44 = v42 + v43;
    if (__OFADD__(v42, v43))
      break;
    v45 = v40;
    v14 = (uint64_t *)v34;
    if (v16[3] < v44)
    {
      sub_237F79A50(v44, 1);
      v16 = v80;
      v46 = sub_237F79308(v39);
      if ((v45 & 1) != (v47 & 1))
        goto LABEL_36;
      v41 = v46;
    }
    if ((v45 & 1) != 0)
    {
      (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v39, v66);
      v16 = v80;
      v48 = v80[7];
      sub_237F84BEC(v34, (uint64_t)v63, &qword_2568B6398);
      v49 = *(_QWORD *)(v48 + 8 * v41);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v48 + 8 * v41) = v49;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v49 = sub_237F77C6C(0, *(_QWORD *)(v49 + 16) + 1, 1, v49);
        *(_QWORD *)(v48 + 8 * v41) = v49;
      }
      v52 = *(_QWORD *)(v49 + 16);
      v51 = *(_QWORD *)(v49 + 24);
      if (v52 >= v51 >> 1)
      {
        v49 = sub_237F77C6C(v51 > 1, v52 + 1, 1, v49);
        *(_QWORD *)(v48 + 8 * v41) = v49;
      }
      *(_QWORD *)(v49 + 16) = v52 + 1;
      sub_237F84BEC((uint64_t)v63, v49+ ((*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80))+ *(_QWORD *)(v64 + 72) * v52, &qword_2568B6398);
      v17 = v77;
    }
    else
    {
      sub_237F6F330(&qword_2568B6500);
      v53 = (*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80);
      v54 = swift_allocObject();
      *(_OWORD *)(v54 + 16) = v60;
      sub_237F84BEC(v34, v54 + v53, &qword_2568B6398);
      v16[(v41 >> 6) + 8] |= 1 << v41;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v65 + 32))(v16[6] + *(_QWORD *)(v65 + 72) * v41, v39, v66);
      *(_QWORD *)(v16[7] + 8 * v41) = v54;
      v55 = v16[2];
      v56 = __OFADD__(v55, 1);
      v57 = v55 + 1;
      if (v56)
        goto LABEL_34;
      v16[2] = v57;
      v17 = v77;
    }
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_237F7E5B8(uint64_t a1)
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
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v16 = sub_237F6F330(&qword_2568B6398);
  v2 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_237F6F330(&qword_2568B6458);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = MEMORY[0x24BEE4AF8];
  if (v9)
  {
    v17 = MEMORY[0x24BEE4AF8];
    sub_237F7B1BC(0, v9, 0);
    v11 = a1 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    v12 = *(_QWORD *)(v2 + 72);
    v10 = v17;
    do
    {
      sub_237F84BC0(v11, (uint64_t)v4, &qword_2568B6398);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_237F7B1BC(0, *(_QWORD *)(v10 + 16) + 1, 1);
        v10 = v17;
      }
      v14 = *(_QWORD *)(v10 + 16);
      v13 = *(_QWORD *)(v10 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_237F7B1BC(v13 > 1, v14 + 1, 1);
        v10 = v17;
      }
      *(_QWORD *)(v10 + 16) = v14 + 1;
      sub_237F84BEC((uint64_t)v8, v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v14, &qword_2568B6458);
      v11 += v12;
      --v9;
    }
    while (v9);
  }
  return v10;
}

uint64_t sub_237F7E778(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  *(_OWORD *)(v1 + 32) = xmmword_237F8B350;
  *(_OWORD *)(v1 + 48) = xmmword_237F8B350;
  *(_QWORD *)(v1 + 72) = 0;
  *(_QWORD *)(v1 + 80) = 0;
  *(_QWORD *)(v1 + 16) = a1;
  sub_237F6F330(&qword_2568B6810);
  *(_QWORD *)(v1 + 24) = Dictionary.init(dictionaryLiteral:)();
  v2 = *(_QWORD *)(v1 + 32);
  v3 = *(_QWORD *)(v1 + 40);
  *(_OWORD *)(v1 + 32) = xmmword_237F8B350;
  sub_237F84BA4(v2, v3);
  v4 = *(_QWORD *)(v1 + 48);
  v5 = *(_QWORD *)(v1 + 56);
  *(_OWORD *)(v1 + 48) = xmmword_237F8B350;
  sub_237F84BA4(v4, v5);
  *(_BYTE *)(v1 + 64) = 0;
  return v1;
}

uint64_t sub_237F7E800()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = swift_bridgeObjectRetain();
  sub_237F7D8F8(v1, (uint64_t (*)(_QWORD, char *))sub_237F84BB8, v0);
  v3 = v2;
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_237F7E85C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t inited;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t result;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  __int128 v56;
  uint64_t v57;
  unint64_t v58;
  _QWORD v59[3];

  v5 = type metadata accessor for Asset.ID();
  v53 = *(_QWORD *)(v5 - 8);
  v54 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v52 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Asset.Protector();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v50 - v12;
  Asset.protector.getter();
  v57 = Asset.Protector.securityKey.getter();
  v58 = v14;
  v55 = *(void (**)(char *, uint64_t))(v8 + 8);
  v55(v13, v7);
  sub_237F6F330(&qword_2568B6388);
  inited = swift_initStackObject();
  v56 = xmmword_237F8B2A0;
  *(_OWORD *)(inited + 16) = xmmword_237F8B2A0;
  if (!*MEMORY[0x24BE633F0])
    goto LABEL_16;
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 40) = v16;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 48) = a1;
  v17 = Dictionary.init(dictionaryLiteral:)();
  swift_beginAccess();
  v18 = sub_237F84F08(a1, *(_QWORD *)(a3 + 24));
  v20 = v19;
  v22 = v21;
  swift_endAccess();
  if ((v22 & 1) != 0)
    goto LABEL_7;
  sub_237F6F330(&qword_2568B6808);
  v23 = swift_initStackObject();
  *(_OWORD *)(v23 + 16) = xmmword_237F8B2B0;
  if (!*MEMORY[0x24BE63460])
    goto LABEL_17;
  *(_QWORD *)(v23 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(v23 + 40) = v24;
  *(_QWORD *)(v23 + 48) = v18;
  if (!*MEMORY[0x24BE63468])
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  *(_QWORD *)(v23 + 56) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(v23 + 64) = v25;
  if (__OFSUB__(v20, v18))
  {
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  *(_QWORD *)(v23 + 72) = v20 - v18;
  Dictionary.init(dictionaryLiteral:)();
  sub_237F70F9C();
  v27 = v26;
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v59[0] = v17;
  sub_237F845C0(v27, (uint64_t)sub_237F7A5D4, 0, isUniquelyReferenced_nonNull_native, (uint64_t)v59);
  v17 = v59[0];
  swift_bridgeObjectRelease();
LABEL_7:
  v30 = v57;
  v29 = v58;
  if ((sub_237F70A3C(v57, v58) & 1) != 0)
  {
    v31 = v30;
    v32 = v29;
LABEL_14:
    sub_237F6F63C(v31, v32);
    return v17;
  }
  v51 = 0;
  sub_237F6F330(&qword_2568B63A0);
  v33 = swift_initStackObject();
  *(_OWORD *)(v33 + 16) = v56;
  if (!*MEMORY[0x24BE63490])
    goto LABEL_19;
  *(_QWORD *)(v33 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(v33 + 40) = v34;
  sub_237F6F330(&qword_2568B63A8);
  v35 = swift_initStackObject();
  *(_OWORD *)(v35 + 16) = xmmword_237F8B2B0;
  if (!*MEMORY[0x24BE633F8])
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  *(_QWORD *)(v35 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(v35 + 40) = v36;
  Asset.protector.getter();
  v37 = Asset.Protector.securityKey.getter();
  v39 = v38;
  v55(v11, v7);
  *(_QWORD *)(v35 + 48) = v37;
  *(_QWORD *)(v35 + 56) = v39;
  if (!*MEMORY[0x24BE63400])
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  *(_QWORD *)(v35 + 64) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(v35 + 72) = v40;
  v41 = v52;
  Asset.id.getter();
  v42 = Asset.ID.referenceSignature.getter();
  v44 = v43;
  (*(void (**)(char *, uint64_t))(v53 + 8))(v41, v54);
  *(_QWORD *)(v35 + 80) = v42;
  *(_QWORD *)(v35 + 88) = v44;
  *(_QWORD *)(v33 + 48) = Dictionary.init(dictionaryLiteral:)();
  sub_237F6F330(&qword_2568B63B0);
  Dictionary.init(dictionaryLiteral:)();
  sub_237F70A88();
  v46 = v45;
  swift_bridgeObjectRelease();
  v47 = swift_isUniquelyReferenced_nonNull_native();
  v59[0] = v17;
  v48 = v51;
  sub_237F845C0(v46, (uint64_t)sub_237F7A5D4, 0, v47, (uint64_t)v59);
  if (!v48)
  {
    v17 = v59[0];
    swift_bridgeObjectRelease();
    v31 = v57;
    v32 = v58;
    goto LABEL_14;
  }
LABEL_22:
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_237F7ECD8(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v4;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v9 = v4[4];
  v10 = v4[5];
  v4[4] = a1;
  v4[5] = a2;
  sub_237F84BA4(v9, v10);
  v11 = v4[6];
  v12 = v4[7];
  v4[6] = a3;
  v4[7] = a4;
  sub_237F7C1D8(a1, a2);
  sub_237F84BA4(v11, v12);
  sub_237F7C1D8(a3, a4);
  return swift_retain();
}

uint64_t sub_237F7ED54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 80) = a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t sub_237F7ED8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t inited;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
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
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = v0;
  sub_237F6F330(&qword_2568B6388);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_237F8B2B0;
  result = *MEMORY[0x24BE63428];
  if (!*MEMORY[0x24BE63428])
  {
    __break(1u);
    goto LABEL_13;
  }
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 40) = v4;
  v5 = sub_237F7E800();
  v6 = sub_237F6F330(&qword_2568B6390);
  *(_QWORD *)(inited + 48) = v5;
  *(_QWORD *)(inited + 72) = v6;
  *(_QWORD *)(inited + 80) = 0xD00000000000001BLL;
  *(_QWORD *)(inited + 88) = 0x8000000237F8C540;
  v7 = *(_BYTE *)(v1 + 64);
  *(_QWORD *)(inited + 120) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 96) = v7;
  v8 = MEMORY[0x24BEE0D00];
  v32 = Dictionary.init(dictionaryLiteral:)();
  v9 = *(_QWORD *)(v1 + 40);
  if (v9 >> 60 == 15 || (v10 = *(_QWORD *)(v1 + 56), v10 >> 60 == 15))
  {
LABEL_6:
    v17 = *(_QWORD *)(v1 + 80);
    if (!v17)
      return v32;
    result = *MEMORY[0x24BE63418];
    if (*MEMORY[0x24BE63418])
    {
      v18 = *(_QWORD *)(v1 + 72);
      v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v21 = v20;
      v31 = v8;
      v29 = v18;
      v30 = v17;
      swift_bridgeObjectRetain_n();
      sub_237F7CE0C((uint64_t)&v29, v19, v21);
      result = *MEMORY[0x24BE63458];
      if (*MEMORY[0x24BE63458])
      {
        v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v24 = v23;
        sub_237F6F330(&qword_2568B67E8);
        v25 = swift_initStackObject();
        *(_OWORD *)(v25 + 16) = xmmword_237F8B2A0;
        result = *MEMORY[0x24BE63420];
        if (*MEMORY[0x24BE63420])
        {
          *(_QWORD *)(v25 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
          *(_QWORD *)(v25 + 40) = v26;
          sub_237F6F330(&qword_2568B67F0);
          v27 = swift_initStackObject();
          *(_OWORD *)(v27 + 16) = xmmword_237F8B2A0;
          *(_QWORD *)(v27 + 32) = 0xD000000000000014;
          *(_QWORD *)(v27 + 40) = 0x8000000237F8C830;
          *(_QWORD *)(v27 + 48) = v18;
          *(_QWORD *)(v27 + 56) = v17;
          *(_QWORD *)(v25 + 48) = Dictionary.init(dictionaryLiteral:)();
          sub_237F6F330(&qword_2568B67F8);
          v28 = Dictionary.init(dictionaryLiteral:)();
          v31 = sub_237F6F330(&qword_2568B6800);
          v29 = v28;
          sub_237F7CE0C((uint64_t)&v29, v22, v24);
          return v32;
        }
        goto LABEL_15;
      }
LABEL_14:
      __break(1u);
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  result = *MEMORY[0x24BE63430];
  if (*MEMORY[0x24BE63430])
  {
    v11 = *(_QWORD *)(v1 + 32);
    v12 = *(_QWORD *)(v1 + 48);
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v15 = v14;
    v16 = MEMORY[0x24BDCDDE8];
    v31 = MEMORY[0x24BDCDDE8];
    v29 = v11;
    v30 = v9;
    sub_237F84B90(v11, v9);
    sub_237F84B90(v11, v9);
    sub_237F84B90(v12, v10);
    sub_237F7CE0C((uint64_t)&v29, v13, v15);
    v31 = v16;
    v29 = v12;
    v30 = v10;
    sub_237F7C1D8(v12, v10);
    sub_237F7CE0C((uint64_t)&v29, 0xD00000000000002BLL, 0x8000000237F8C850);
    sub_237F84BA4(v11, v9);
    sub_237F84BA4(v12, v10);
    goto LABEL_6;
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_237F7F0D0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_237F84BA4(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  sub_237F84BA4(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_237F7F10C()
{
  sub_237F7F0D0();
  return swift_deallocClassInstance();
}

uint64_t sub_237F7F128()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  sub_237F7C3B8(v0, qword_2568B6510);
  sub_237F787D0(v0, (uint64_t)qword_2568B6510);
  static LoggerSubsystem.server.getter();
  type metadata accessor for Downloader();
  sub_237F6F330(&qword_2568B6748);
  String.init<A>(describing:)();
  return Logger.init(subsystem:category:)();
}

void sub_237F7F1C8(uint64_t *a1, uint64_t a2, uint64_t a3, const char *a4, void *a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  uint8_t *v35;
  _QWORD *v36;
  id v37;
  uint64_t v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  _QWORD *v57;
  NSObject *v58;
  uint64_t v59;
  id v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  _QWORD *v65;
  id v66;
  id v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  NSObject *v86;
  os_log_type_t v87;
  uint8_t *v88;
  uint64_t v89;
  NSObject *v90;
  os_log_type_t v91;
  uint8_t *v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  uint64_t v96;
  uint64_t v97;
  NSObject *v98;
  NSObject *v99;
  os_log_type_t v100;
  uint8_t *v101;
  _QWORD *v102;
  NSObject *v103;
  uint64_t v104;
  uint64_t v105;
  _QWORD *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t *v109;
  id v110;
  uint64_t v111;
  unint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  NSObject *v129;
  os_log_type_t v130;
  uint8_t *v131;
  uint64_t v132;
  uint64_t v133;
  _QWORD *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  Class isa;
  char *v142;
  NSObject *v143;
  id v144;
  __int128 v145;
  uint64_t v146;
  __int128 v147;
  uint64_t v148;

  v140 = type metadata accessor for Downloader.AssetDownloadResult();
  MEMORY[0x24BDAC7A8](v140);
  v142 = (char *)&v135 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v143 = sub_237F6F330(&qword_2568B6728);
  isa = v143[-1].isa;
  MEMORY[0x24BDAC7A8](v143);
  v13 = (char *)&v135 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for URL.DirectoryHint();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v135 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_237F6F330(&qword_2568B6730);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v135 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for URL();
  v22 = MEMORY[0x24BDAC7A8](v21);
  if (a1)
  {
    v25 = *a1;
    if (a5)
    {
      type metadata accessor for CFError(0);
      sub_237F6FB4C(&qword_2568B6740, (uint64_t (*)(uint64_t))type metadata accessor for CFError, MEMORY[0x24BDCFD90]);
      v26 = (void *)swift_allocError();
      *v27 = a5;
      v28 = a5;
      swift_retain();
      v29 = (void *)_convertErrorToNSError(_:)();

      if (objc_msgSend(v29, sel_code) == (id)51)
      {
        if (qword_2568B5DD0 != -1)
          swift_once();
        v139 = v25;
        v30 = type metadata accessor for Logger();
        sub_237F787D0(v30, (uint64_t)qword_2568B6510);
        v31 = v29;
        v32 = Logger.logObject.getter();
        v33 = static os_log_type_t.error.getter();
        v34 = os_log_type_enabled(v32, v33);
        v143 = v28;
        if (v34)
        {
          v35 = (uint8_t *)swift_slowAlloc();
          v36 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v35 = 138412290;
          *(_QWORD *)&v147 = v31;
          v37 = v31;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *v36 = v31;

          _os_log_impl(&dword_237F6A000, v32, v33, "download failed due to server blocking %@", v35, 0xCu);
          sub_237F6F330(&qword_2568B6300);
          swift_arrayDestroy();
          MEMORY[0x23B828FE8](v36, -1, -1);
          MEMORY[0x23B828FE8](v35, -1, -1);

        }
        else
        {

        }
        v67 = objc_msgSend(v31, sel_localizedDescription);
        v68 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v70 = v69;

        *(_QWORD *)&v147 = 44;
        *((_QWORD *)&v147 + 1) = 0xE100000000000000;
        MEMORY[0x24BDAC7A8](v71);
        *(&v135 - 2) = (uint64_t)&v147;
        swift_bridgeObjectRetain();
        v72 = sub_237F77714(0x7FFFFFFFFFFFFFFFLL, 1u, sub_237F7C4E8, (uint64_t)(&v135 - 4), v68, v70);
        swift_bridgeObjectRelease();
        v73 = *(_QWORD *)(v72 + 16);
        if (v73)
        {
          *(_QWORD *)&v147 = MEMORY[0x24BEE4AF8];
          sub_237F7B2BC();
          v74 = v147;
          v75 = (uint64_t *)(v72 + 56);
          do
          {
            v76 = *(v75 - 3);
            v77 = *(v75 - 2);
            v78 = *(v75 - 1);
            v79 = *v75;
            swift_bridgeObjectRetain();
            v80 = MEMORY[0x23B8288EC](v76, v77, v78, v79);
            v82 = v81;
            swift_bridgeObjectRelease();
            *(_QWORD *)&v147 = v74;
            v83 = *(_QWORD *)(v74 + 16);
            if (v83 >= *(_QWORD *)(v74 + 24) >> 1)
            {
              sub_237F7B2BC();
              v74 = v147;
            }
            *(_QWORD *)(v74 + 16) = v83 + 1;
            v84 = v74 + 16 * v83;
            *(_QWORD *)(v84 + 32) = v80;
            *(_QWORD *)(v84 + 40) = v82;
            v75 += 4;
            --v73;
          }
          while (v73);
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          v74 = MEMORY[0x24BEE4AF8];
        }
        v93 = type metadata accessor for SimultaneousTransferError();
        sub_237F6FB4C(&qword_2568B64D0, (uint64_t (*)(uint64_t))MEMORY[0x24BE171F8], MEMORY[0x24BE17200]);
        v94 = swift_allocError();
        *v95 = v74;
        (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v93 - 8) + 104))(v95, *MEMORY[0x24BE171F0], v93);
        *(_QWORD *)&v147 = v94;
        sub_237F6F330(&qword_2568B6738);
        AsyncThrowingStream.Continuation.finish(throwing:)();
        swift_release();

      }
      else
      {
        if (qword_2568B5DD0 != -1)
          swift_once();
        v59 = type metadata accessor for Logger();
        sub_237F787D0(v59, (uint64_t)qword_2568B6510);
        v60 = v29;
        v61 = Logger.logObject.getter();
        v62 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v61, v62))
        {
          v63 = (uint8_t *)swift_slowAlloc();
          v64 = swift_slowAlloc();
          v143 = v28;
          v65 = (_QWORD *)v64;
          *(_DWORD *)v63 = 138412290;
          *(_QWORD *)&v147 = v60;
          v66 = v60;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *v65 = v60;

          _os_log_impl(&dword_237F6A000, v61, v62, "mmcs engine returns error %@", v63, 0xCu);
          sub_237F6F330(&qword_2568B6300);
          swift_arrayDestroy();
          v28 = v143;
          MEMORY[0x23B828FE8](v65, -1, -1);
          MEMORY[0x23B828FE8](v63, -1, -1);

        }
        else
        {

        }
        sub_237F77634();
        *(_QWORD *)&v147 = swift_allocError();
        sub_237F6F330(&qword_2568B6738);
        AsyncThrowingStream.Continuation.finish(throwing:)();
        swift_release();

      }
      return;
    }
    if (a4)
    {
      v135 = a2;
      v136 = v24;
      v138 = (char *)&v135 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
      v41 = v22;
      v42 = (void *)objc_opt_self();
      v139 = v25;
      swift_retain();
      v43 = objc_msgSend(v42, sel_defaultManager);
      v44 = objc_msgSend(v43, sel_stringWithFileSystemRepresentation_length_, a4, strlen(a4));

      static String._unconditionallyBridgeFromObjectiveC(_:)();
      v137 = v41;
      v45 = v41;
      v46 = v138;
      sub_237F6C9A4((uint64_t)v20, 1, 1, v45);
      (*(void (**)(char *, _QWORD, uint64_t))(v15 + 104))(v17, *MEMORY[0x24BDCD7A0], v14);
      URL.init(filePath:directoryHint:relativeTo:)();
      if (!a6
        || (*(_QWORD *)&v147 = 0, static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)(), (v47 = v147) == 0))
      {
        sub_237F77634();
        *(_QWORD *)&v147 = swift_allocError();
        sub_237F6F330(&qword_2568B6738);
        AsyncThrowingStream.Continuation.finish(throwing:)();
        if (qword_2568B5DD0 != -1)
          swift_once();
        v85 = type metadata accessor for Logger();
        sub_237F787D0(v85, (uint64_t)qword_2568B6510);
        v86 = Logger.logObject.getter();
        v87 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v86, v87))
        {
          v88 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v88 = 0;
          _os_log_impl(&dword_237F6A000, v86, v87, "mmcs engine returns nil results", v88, 2u);
          MEMORY[0x23B828FE8](v88, -1, -1);
        }
        swift_release();

        goto LABEL_89;
      }
      if (!*MEMORY[0x24BE63470])
        goto LABEL_93;
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      sub_237F84E60(v47, &v147);
      swift_bridgeObjectRelease();
      v48 = v148;
      sub_237F6F680((uint64_t)&v147, &qword_2568B64C0);
      if (v48)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        sub_237F84E60(v47, &v145);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v146)
        {
          sub_237F6FC10(&v145, &v147);
          sub_237F7C428();
          swift_dynamicCast();
          v49 = v144;
          v50 = objc_msgSend(v144, sel_code);
          v51 = qword_2568B5DD0;
          if (v50 == (id)51)
          {
            if (qword_2568B5DD0 != -1)
              swift_once();
            v52 = type metadata accessor for Logger();
            sub_237F787D0(v52, (uint64_t)qword_2568B6510);
            v53 = v49;
            v54 = Logger.logObject.getter();
            v55 = static os_log_type_t.error.getter();
            if (os_log_type_enabled(v54, v55))
            {
              v56 = (uint8_t *)swift_slowAlloc();
              v57 = (_QWORD *)swift_slowAlloc();
              *(_DWORD *)v56 = 138412290;
              *(_QWORD *)&v147 = v53;
              v58 = v53;
              v46 = v138;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              *v57 = v53;

              _os_log_impl(&dword_237F6A000, v54, v55, "download failed due to server blocking %@", v56, 0xCu);
              sub_237F6F330(&qword_2568B6300);
              swift_arrayDestroy();
              MEMORY[0x23B828FE8](v57, -1, -1);
              MEMORY[0x23B828FE8](v56, -1, -1);
            }
            else
            {

              v54 = v53;
            }

            v110 = -[NSObject description](v53, sel_description);
            v111 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            v113 = v112;

            *(_QWORD *)&v147 = 44;
            *((_QWORD *)&v147 + 1) = 0xE100000000000000;
            MEMORY[0x24BDAC7A8](v114);
            *(&v135 - 2) = (uint64_t)&v147;
            swift_bridgeObjectRetain();
            v115 = sub_237F77714(0x7FFFFFFFFFFFFFFFLL, 1u, sub_237F7C464, (uint64_t)(&v135 - 4), v111, v113);
            swift_bridgeObjectRelease();
            v116 = *(_QWORD *)(v115 + 16);
            if (v116)
            {
              *(_QWORD *)&v147 = MEMORY[0x24BEE4AF8];
              sub_237F7B2BC();
              v117 = v147;
              v118 = (uint64_t *)(v115 + 56);
              do
              {
                v119 = *(v118 - 3);
                v120 = *(v118 - 2);
                v121 = *(v118 - 1);
                v122 = *v118;
                swift_bridgeObjectRetain();
                v123 = MEMORY[0x23B8288EC](v119, v120, v121, v122);
                v125 = v124;
                swift_bridgeObjectRelease();
                *(_QWORD *)&v147 = v117;
                v126 = *(_QWORD *)(v117 + 16);
                if (v126 >= *(_QWORD *)(v117 + 24) >> 1)
                {
                  sub_237F7B2BC();
                  v117 = v147;
                }
                *(_QWORD *)(v117 + 16) = v126 + 1;
                v127 = v117 + 16 * v126;
                *(_QWORD *)(v127 + 32) = v123;
                *(_QWORD *)(v127 + 40) = v125;
                v118 += 4;
                --v116;
              }
              while (v116);
              swift_bridgeObjectRelease();
              v46 = v138;
            }
            else
            {
              swift_bridgeObjectRelease();
              v117 = MEMORY[0x24BEE4AF8];
            }
            v132 = type metadata accessor for SimultaneousTransferError();
            sub_237F6FB4C(&qword_2568B64D0, (uint64_t (*)(uint64_t))MEMORY[0x24BE171F8], MEMORY[0x24BE17200]);
            v133 = swift_allocError();
            *v134 = v117;
            (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v132 - 8) + 104))(v134, *MEMORY[0x24BE171F0], v132);
            *(_QWORD *)&v147 = v133;
            sub_237F6F330(&qword_2568B6738);
            AsyncThrowingStream.Continuation.finish(throwing:)();

LABEL_88:
            swift_release();
LABEL_89:
            (*(void (**)(char *, uint64_t))(v136 + 8))(v46, v137);
            return;
          }
LABEL_59:
          if (v51 != -1)
            swift_once();
          v97 = type metadata accessor for Logger();
          sub_237F787D0(v97, (uint64_t)qword_2568B6510);
          v98 = v49;
          v99 = Logger.logObject.getter();
          v100 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v99, v100))
          {
            v101 = (uint8_t *)swift_slowAlloc();
            v102 = (_QWORD *)swift_slowAlloc();
            *(_DWORD *)v101 = 138412290;
            *(_QWORD *)&v147 = v98;
            v103 = v98;
            v46 = v138;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *v102 = v98;

            _os_log_impl(&dword_237F6A000, v99, v100, "mmcs engine returns error %@", v101, 0xCu);
            sub_237F6F330(&qword_2568B6300);
            swift_arrayDestroy();
            MEMORY[0x23B828FE8](v102, -1, -1);
            MEMORY[0x23B828FE8](v101, -1, -1);
          }
          else
          {

            v99 = v98;
          }

          sub_237F77634();
          *(_QWORD *)&v147 = swift_allocError();
          sub_237F6F330(&qword_2568B6738);
          AsyncThrowingStream.Continuation.finish(throwing:)();

          goto LABEL_88;
        }
        goto LABEL_94;
      }
      if (!*MEMORY[0x24BE63478])
      {
LABEL_95:
        __break(1u);
        goto LABEL_96;
      }
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      sub_237F84E60(v47, &v147);
      swift_bridgeObjectRelease();
      if (!v148)
        goto LABEL_63;
      if ((swift_dynamicCast() & 1) == 0)
        goto LABEL_64;
      if (!*MEMORY[0x24BE63480])
      {
LABEL_97:
        __break(1u);
        return;
      }
      v96 = v145;
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      sub_237F84E60(v47, &v147);
      swift_bridgeObjectRelease();
      if (v148)
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v51 = v145;
          v49 = (id)(v96 + v145);
          if (__OFADD__(v96, (_QWORD)v145))
          {
LABEL_92:
            __break(1u);
LABEL_93:
            __break(1u);
LABEL_94:
            __break(1u);
            goto LABEL_95;
          }
          if ((uint64_t)v49 < v96)
          {
            __break(1u);
            goto LABEL_59;
          }
          goto LABEL_69;
        }
      }
      else
      {
LABEL_63:
        sub_237F6F680((uint64_t)&v147, &qword_2568B64C0);
      }
LABEL_64:
      if (!*MEMORY[0x24BE633E8])
      {
LABEL_96:
        __break(1u);
        goto LABEL_97;
      }
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      sub_237F84E60(v47, &v147);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v148)
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v49 = (id)v145;
          if ((v145 & 0x8000000000000000) != 0)
          {
LABEL_91:
            __break(1u);
            goto LABEL_92;
          }
          v96 = 0;
LABEL_69:
          v104 = v135;
          if ((v135 & 0x8000000000000000) == 0)
          {
            v105 = v140;
            v106 = v142;
            v108 = v136;
            v107 = v137;
            (*(void (**)(char *, char *, uint64_t))(v136 + 16))(&v142[*(int *)(v140 + 20)], v46, v137);
            *v106 = v104;
            v109 = (_QWORD *)((char *)v106 + *(int *)(v105 + 24));
            *v109 = v96;
            v109[1] = (uint64_t)v49;
            sub_237F6F330(&qword_2568B6738);
            AsyncThrowingStream.Continuation.yield(_:)();
            swift_release();
            (*((void (**)(char *, NSObject *))isa + 1))(v13, v143);
            (*(void (**)(char *, uint64_t))(v108 + 8))(v46, v107);
            return;
          }
          __break(1u);
          goto LABEL_91;
        }
      }
      else
      {
        sub_237F6F680((uint64_t)&v147, &qword_2568B64C0);
      }
      if (qword_2568B5DD0 != -1)
        swift_once();
      v128 = type metadata accessor for Logger();
      sub_237F787D0(v128, (uint64_t)qword_2568B6510);
      v129 = Logger.logObject.getter();
      v130 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v129, v130))
      {
        v131 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v131 = 0;
        _os_log_impl(&dword_237F6A000, v129, v130, "", v131, 2u);
        MEMORY[0x23B828FE8](v131, -1, -1);
      }

      sub_237F77634();
      *(_QWORD *)&v147 = swift_allocError();
      sub_237F6F330(&qword_2568B6738);
      AsyncThrowingStream.Continuation.finish(throwing:)();
      goto LABEL_88;
    }
    sub_237F77634();
    *(_QWORD *)&v147 = swift_allocError();
    swift_retain();
    sub_237F6F330(&qword_2568B6738);
    AsyncThrowingStream.Continuation.finish(throwing:)();
    if (qword_2568B5DD0 != -1)
      swift_once();
    v89 = type metadata accessor for Logger();
    sub_237F787D0(v89, (uint64_t)qword_2568B6510);
    v90 = Logger.logObject.getter();
    v91 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v90, v91))
    {
      v92 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v92 = 134349056;
      *(_QWORD *)&v147 = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_237F6A000, v90, v91, "file path for asset with tracking number %{public}llu is nil", v92, 0xCu);
      MEMORY[0x23B828FE8](v92, -1, -1);
      swift_release();

    }
    else
    {

      swift_release();
    }
  }
  else
  {
    if (qword_2568B5DD0 != -1)
      swift_once();
    v38 = type metadata accessor for Logger();
    sub_237F787D0(v38, (uint64_t)qword_2568B6510);
    v143 = Logger.logObject.getter();
    v39 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v143, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v40 = 134349056;
      *(_QWORD *)&v147 = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_237F6A000, v143, v39, "context for downloading asset with tracking number %{public}llu can not be loaded", v40, 0xCu);
      MEMORY[0x23B828FE8](v40, -1, -1);
    }

  }
}

void sub_237F80610(uint64_t *a1, uint64_t a2, uint64_t a3, const char *a4, void *a5, void *a6)
{
  id v12;
  id v13;

  v12 = a5;
  v13 = a6;
  sub_237F7F1C8(a1, a2, a3, a4, a5, (uint64_t)a6);

}

uint64_t sub_237F80694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7[11] = a6;
  v7[12] = v6;
  v7[9] = a4;
  v7[10] = a5;
  v7[7] = a2;
  v7[8] = a3;
  v7[6] = a1;
  v7[13] = *v6;
  v8 = sub_237F6F330(&qword_2568B6760);
  v7[14] = v8;
  v7[15] = *(_QWORD *)(v8 - 8);
  v7[16] = swift_task_alloc();
  v9 = sub_237F6F330(&qword_2568B6768);
  v7[17] = v9;
  v7[18] = *(_QWORD *)(v9 - 8);
  v7[19] = swift_task_alloc();
  v10 = type metadata accessor for TaskPriority();
  v7[20] = v10;
  v7[21] = *(_QWORD *)(v10 - 8);
  v7[22] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237F80760()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
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
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  os_log_type_t type;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29[2];

  if (qword_2568B5DD0 != -1)
    swift_once();
  v1 = v0[7];
  v2 = sub_237F7C8AC();
  sub_237F787D0(v2, (uint64_t)qword_2568B6510);
  swift_bridgeObjectRetain_n();
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (sub_237F84D9C(v4))
  {
    v5 = v0[22];
    v27 = v0[20];
    v28 = v0[21];
    v6 = sub_237F7C528();
    v29[0] = sub_237F7C528();
    *(_DWORD *)v6 = 136315394;
    v7 = type metadata accessor for AssetDownloadRequest();
    v8 = sub_237F7C7DC();
    v9 = MEMORY[0x23B828958](v8, v7);
    type = v1;
    v11 = v10;
    sub_237F7CA78();
    v0[4] = sub_237F787F8(v9, v11, v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    sub_237F701AC();
    sub_237F84D60();
    *(_WORD *)(v6 + 12) = 2080;
    static Task<>.currentPriority.getter();
    sub_237F6FB4C(&qword_2568B6298, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6990], MEMORY[0x24BEE69A0]);
    v12 = dispatch thunk of CustomStringConvertible.description.getter();
    v14 = v13;
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v5, v27);
    v0[5] = sub_237F787F8(v12, v14, v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237F6A000, v3, type, "processing %s with priority %s", (uint8_t *)v6, 0x16u);
    sub_237F84E14();
    sub_237F7C51C();
  }
  sub_237F7C5D4();

  v15 = v0[7];
  v16 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(v0[12] + 16) + 24)
                   + OBJC_IVAR____TtC16CloudAssetDaemon13TenantContext_requestTracker);
  v0[23] = v16;
  swift_retain_n();
  v17 = sub_237F7D4E4(v15, v16);
  v18 = sub_237F720E0(v17);
  v0[24] = v18;
  swift_bridgeObjectRetain_n();
  v19 = Logger.logObject.getter();
  v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)sub_237F7C528();
    v29[0] = sub_237F7C528();
    *(_DWORD *)v21 = 136315138;
    type metadata accessor for Asset();
    swift_bridgeObjectRetain();
    Dictionary.Keys.description.getter();
    v22 = swift_bridgeObjectRelease();
    v0[3] = sub_237F84DC4(v22, v23, v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_237F7C5D4();
    sub_237F7C754(&dword_237F6A000, v19, v20, "start downloading assets with tracking numbers %s", v21);
    sub_237F7C730();
    sub_237F7C51C();
  }
  sub_237F7C5D4();

  v24 = (_QWORD *)swift_task_alloc();
  v0[25] = v24;
  *v24 = v0;
  v24[1] = sub_237F80B40;
  return sub_237F80D38(v0[19], v18);
}

uint64_t sub_237F80B40()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  sub_237F84D8C();
  *v3 = *v2;
  *(_QWORD *)(v0 + 208) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  sub_237F6FDBC();
  return sub_237F84D54();
}

uint64_t sub_237F80B98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(v0 + 152);
  v14 = *(_QWORD *)(v0 + 136);
  v11 = *(_QWORD *)(v0 + 128);
  v12 = *(_QWORD *)(v0 + 112);
  v13 = *(_QWORD *)(v0 + 144);
  v8 = *(_QWORD *)(v0 + 184);
  v9 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 72);
  v5 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 88);
  v10 = *(_QWORD *)(v0 + 120);
  v6 = (_QWORD *)swift_task_alloc();
  v6[2] = v1;
  v6[3] = v8;
  v6[4] = v3;
  v6[5] = v2;
  v6[6] = v5;
  v6[7] = v4;
  v6[8] = v9;
  type metadata accessor for DownloadResponseMessage();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v10 + 104))(v11, *MEMORY[0x24BEE6CA0], v12);
  AsyncThrowingStream.init<>(_:bufferingPolicy:_:)();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v1, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  sub_237F6FE10();
  sub_237F70240();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237F80CE8()
{
  uint64_t v0;

  swift_release();
  sub_237F70240();
  sub_237F6FE10();
  sub_237F6FEFC();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237F80D38(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  v3[6] = *v2;
  v4 = sub_237F6F330(&qword_2568B67C8);
  v3[7] = v4;
  v3[8] = *(_QWORD *)(v4 - 8);
  v3[9] = sub_237F6FD58();
  sub_237F6FDBC();
  return sub_237F6FCB8();
}

uint64_t sub_237F80D90()
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
  __int128 v10;

  v2 = *(_QWORD *)(v0 + 64);
  v1 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 56);
  v10 = *(_OWORD *)(v0 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v10 + 16) + 24)
                 + OBJC_IVAR____TtC16CloudAssetDaemon13TenantContext_requestTracker);
  swift_retain();
  v5 = swift_bridgeObjectRetain();
  v6 = sub_237F7DFC0(v5);
  v7 = sub_237F7D0D8(v6);
  swift_bridgeObjectRelease();
  v8 = swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = v4;
  *(_OWORD *)(v8 + 32) = v10;
  type metadata accessor for Downloader.AssetDownloadResult();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BEE6CA0], v3);
  AsyncThrowingStream.init<>(_:bufferingPolicy:_:)();
  swift_bridgeObjectRelease();
  swift_release();
  sub_237F70140();
  sub_237F70240();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237F80EB8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  _DWORD *v27;
  int v28;
  int v29;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;

  v35 = a4;
  v36 = a3;
  v33 = a1;
  v37 = HIDWORD(a4);
  v38 = a5;
  v39 = HIDWORD(a5);
  v40 = a6;
  v41 = HIDWORD(a6);
  v42 = a7;
  v43 = HIDWORD(a7);
  v44 = a8;
  v9 = sub_237F6F330(&qword_2568B6778);
  v10 = *(_QWORD *)(v9 - 8);
  v31 = v9;
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v32 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_237F6F330(&qword_2568B6768);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_237F6F330(&qword_2568B6030);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = v18;
  v19 = type metadata accessor for TaskPriority();
  sub_237F6C9A4((uint64_t)v18, 1, 1, v19);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a2, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v33, v9);
  v20 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v21 = (v14 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  v22 = (v21 + 11) & 0xFFFFFFFFFFFFFFF8;
  v23 = (*(unsigned __int8 *)(v10 + 80) + v22 + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v24 = (v11 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = 0;
  *(_QWORD *)(v25 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v25 + v20, v15, v12);
  v26 = v35;
  *(_QWORD *)(v25 + v21) = v36;
  v27 = (_DWORD *)(v25 + v22);
  v28 = v37;
  *v27 = v26;
  v27[1] = v28;
  v29 = v39;
  v27[2] = v38;
  v27[3] = v29;
  v27[4] = v40;
  v27[5] = v41;
  v27[6] = v42;
  v27[7] = v43;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v25 + v23, v32, v31);
  *(_QWORD *)(v25 + v24) = v44;
  swift_retain();
  sub_237F6DD94((uint64_t)v34, (uint64_t)&unk_2568B6788, v25);
  return swift_release();
}

uint64_t sub_237F8110C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v8[23] = v17;
  v8[24] = v18;
  v8[21] = a7;
  v8[22] = a8;
  v8[19] = a5;
  v8[20] = a6;
  v8[18] = a4;
  v9 = type metadata accessor for SimultaneousTransferError();
  v8[25] = v9;
  v8[26] = *(_QWORD *)(v9 - 8);
  v8[27] = swift_task_alloc();
  v10 = type metadata accessor for URL();
  v8[28] = v10;
  v8[29] = *(_QWORD *)(v10 - 8);
  v8[30] = swift_task_alloc();
  type metadata accessor for Asset();
  v8[31] = swift_task_alloc();
  v11 = type metadata accessor for UUID();
  v8[32] = v11;
  v8[33] = *(_QWORD *)(v11 - 8);
  v8[34] = swift_task_alloc();
  v12 = type metadata accessor for DownloadResponseMessage();
  v8[35] = v12;
  v8[36] = *(_QWORD *)(v12 - 8);
  v8[37] = swift_task_alloc();
  v13 = sub_237F6F330(&qword_2568B6790);
  v8[38] = v13;
  v8[39] = *(_QWORD *)(v13 - 8);
  v8[40] = swift_task_alloc();
  v14 = type metadata accessor for AssetDownloadRequest();
  v8[41] = v14;
  v8[42] = *(_QWORD *)(v14 - 8);
  v8[43] = swift_task_alloc();
  v8[44] = swift_task_alloc();
  v8[45] = swift_task_alloc();
  v8[46] = type metadata accessor for Downloader.AssetDownloadResult();
  v8[47] = swift_task_alloc();
  v8[48] = swift_task_alloc();
  v8[49] = swift_task_alloc();
  v8[50] = swift_task_alloc();
  v8[51] = swift_task_alloc();
  sub_237F6F330(&qword_2568B6798);
  v8[52] = swift_task_alloc();
  v15 = sub_237F6F330(&qword_2568B67A0);
  v8[53] = v15;
  v8[54] = *(_QWORD *)(v15 - 8);
  v8[55] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237F8132C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = sub_237F6F330(&qword_2568B6768);
  MEMORY[0x23B8289F4](v1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 448) = v2;
  *v2 = v0;
  v2[1] = sub_237F813A8;
  sub_237F84DDC();
  return _sScs8IteratorV4next9isolationxSgScA_pSgYi_tYaq_YKF();
}

uint64_t sub_237F813A8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  sub_237F84D8C();
  sub_237F84DB8(v2);
  if (!v1)
  {
    v3 = *MEMORY[0x24BDAC008];
    *(_DWORD *)(v0 + 512) = *MEMORY[0x24BE17230];
    *(_DWORD *)(v0 + 516) = *MEMORY[0x24BE17170];
    *(_QWORD *)(v0 + 456) = v3;
    *(_QWORD *)(v0 + 464) = 0;
  }
  sub_237F6FDBC();
  return sub_237F84D54();
}

uint64_t sub_237F8141C()
{
  uint64_t *v0;
  uint64_t *v1;
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
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
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
  void (*v38)(uint64_t, _QWORD);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  _BOOL4 v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
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
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  void (*v74)(uint64_t, uint64_t);
  uint64_t v75;
  NSObject *v76;
  os_log_type_t v77;
  uint8_t *v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  BOOL v89;
  uint64_t v90;
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
  void (*v101)(uint64_t, uint64_t);
  _QWORD *v102;
  void (*v104)(uint64_t, uint64_t);
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  unsigned int v115;
  uint64_t v116;
  os_log_t log;
  NSObject *loga;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  os_log_type_t type[8];
  unsigned int typea;
  os_log_type_t typeb;
  os_log_type_t typec[8];
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132[2];

  v1 = v0;
  v2 = v0[52];
  if (sub_237F6C928(v2, 1, v0[46]) == 1)
  {
    sub_237F6FF68(v0[54]);
LABEL_28:
    v1[7] = 0;
    sub_237F6F330(&qword_2568B6778);
    sub_237F7CD34();
    swift_task_dealloc();
    sub_237F6FE10();
    sub_237F6FEFC();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_237F70140();
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
    return ((uint64_t (*)(void))v1[1])();
  }
  v3 = v0[58];
  v4 = (uint64_t *)v0[51];
  sub_237F84A2C(v2, (uint64_t)v4);
  sub_237F84F54(*v4, (uint64_t)(v0 + 2));
  if (v3)
  {
    v5 = v3;
    v6 = v0[54];
    v7 = v0[55];
    v8 = v0[53];
    sub_237F84A70(v1[51]);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
    goto LABEL_5;
  }
  v26 = v0[51];
  v27 = v1[46];
  v29 = v1[22];
  v28 = v1[23];
  v31 = v1[20];
  v30 = v1[21];
  sub_237F6F330(&qword_2568B6400);
  sub_237F84DAC();
  swift_dynamicCast();
  v32 = v26 + *(int *)(v27 + 20);
  URL.path(percentEncoded:)(1);
  String.utf8CString.getter();
  sub_237F7CD94();
  v1[60] = v31;
  v1[61] = v30;
  v1[62] = v29;
  v1[63] = v28;
  v33 = sandbox_extension_issue_file_to_process();
  swift_release();
  if (!v33)
  {
    if (qword_2568B5DD0 != -1)
      swift_once();
    v81 = v1[50];
    v83 = v1[44];
    v82 = v1[45];
    v85 = v1[41];
    v84 = v1[42];
    v86 = sub_237F7C8AC();
    sub_237F787D0(v86, (uint64_t)qword_2568B6510);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v84 + 16))(v83, v82, v85);
    sub_237F84E08();
    v87 = Logger.logObject.getter();
    v88 = static os_log_type_t.error.getter();
    v89 = sub_237F84D9C(v88);
    v5 = v1[50];
    if (v89)
    {
      v116 = v1[44];
      v121 = v1[42];
      *(_QWORD *)typec = v1[41];
      v90 = v1[34];
      v114 = v1[33];
      v91 = v1[32];
      v92 = sub_237F7C528();
      v132[0] = sub_237F7C528();
      *(_DWORD *)v92 = 136315394;
      AssetDownloadRequest.id.getter();
      sub_237F6FB4C(&qword_2568B67B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v93 = dispatch thunk of CustomStringConvertible.description.getter();
      v95 = v94;
      (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v90, v91);
      v1[12] = sub_237F787F8(v93, v95, v132);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, os_log_type_t *))(v121 + 8))(v116, *(os_log_type_t **)typec);
      *(_WORD *)(v92 + 12) = 2080;
      sub_237F6FB4C(&qword_2568B67C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
      v96 = dispatch thunk of CustomStringConvertible.description.getter();
      v1[13] = sub_237F84DF0(v96, v97);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      sub_237F7CD94();
      sub_237F84A70(v5);
      _os_log_impl(&dword_237F6A000, v87, (os_log_type_t)v81, "[request id = %s] failed to issue sandbox extension token for file at %s", (uint8_t *)v92, 0x16u);
      sub_237F84E14();
      sub_237F7C51C();
    }
    v104 = *(void (**)(uint64_t, uint64_t))(v1[42] + 8);
    v104(v1[44], v1[41]);
    sub_237F84A70(v5);

    v106 = v1[54];
    v105 = v1[55];
    v107 = v1[51];
    v108 = v1[45];
    v109 = v1[41];
    sub_237F77634();
    sub_237F7CD9C();
    sub_237F84DD0();
    sub_237F84A70(v107);
    sub_237F6FD50(v105, *(uint64_t (**)(uint64_t, uint64_t))(v106 + 8));
    v104(v108, v109);
LABEL_5:
    v1[10] = v5;
    sub_237F7C5DC();
    sub_237F6F330(&qword_2568B62F8);
    sub_237F84DAC();
    if (swift_dynamicCast())
    {
      v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v1[26] + 88))(v1[27], v1[25]);
      if ((_DWORD)v9 == *MEMORY[0x24BE171F0])
      {
        v10 = v9;
        v11 = v1[40];
        v12 = (_QWORD *)v1[37];
        *(_QWORD *)type = v1[39];
        v126 = v1[38];
        v14 = v1[35];
        v13 = v1[36];
        v15 = v1[26];
        v16 = (_QWORD *)v1[27];
        v17 = v1[25];
        sub_237F70270();
        sub_237F6FD50((uint64_t)v16, *(uint64_t (**)(uint64_t, uint64_t))(v15 + 96));
        *v12 = *v16;
        (*(void (**)(_QWORD *, uint64_t, uint64_t))(v15 + 104))(v12, v10, v17);
        (*(void (**)(_QWORD *, _QWORD, uint64_t))(v13 + 104))(v12, *MEMORY[0x24BE17168], v14);
        sub_237F7C7DC();
        sub_237F6F330(&qword_2568B6778);
        AsyncThrowingStream.Continuation.yield(_:)();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)type + 8))(v11, v126);
        if (qword_2568B5DD0 != -1)
          swift_once();
        v18 = sub_237F7C8AC();
        v19 = sub_237F787D0(v18, (uint64_t)qword_2568B6510);
        sub_237F7C7DC();
        Logger.logObject.getter();
        v20 = sub_237F7CB08();
        if (sub_237F7CB2C(v20))
        {
          v21 = (uint8_t *)sub_237F7C528();
          v132[0] = sub_237F7C528();
          *(_DWORD *)v21 = 136315138;
          v22 = sub_237F7C7DC();
          v23 = MEMORY[0x23B828958](v22, MEMORY[0x24BEE0D00]);
          v25 = v24;
          sub_237F7CA78();
          v1[9] = sub_237F787F8(v23, v25, v132);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          sub_237F701AC();
          sub_237F84D60();
          sub_237F7C754(&dword_237F6A000, v19, (os_log_type_t)v12, "failed to download due to server blocking %s", v21);
          sub_237F7C730();
          sub_237F7C51C();
        }
        sub_237F84D60();

        goto LABEL_28;
      }
      sub_237F6FF68(v1[26]);
    }
    v68 = v1[39];
    v67 = v1[40];
    v69 = v1[37];
    v131 = v1[38];
    v70 = v1[35];
    v71 = v1[36];

    v72 = (_QWORD *)(v69 + *(int *)(sub_237F6F330(&qword_2568B67A8) + 48));
    v73 = *MEMORY[0x24BE17228];
    sub_237F6F330(&qword_2568B67B0);
    sub_237F84D7C();
    v74(v69, v73);
    *v72 = 0;
    v72[1] = 0xE000000000000000;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v71 + 104))(v69, *MEMORY[0x24BE17170], v70);
    sub_237F6F330(&qword_2568B6778);
    AsyncThrowingStream.Continuation.yield(_:)();
    (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v67, v131);
    if (qword_2568B5DD0 != -1)
      swift_once();
    v75 = sub_237F7C8AC();
    v76 = sub_237F787D0(v75, (uint64_t)qword_2568B6510);
    sub_237F7C5DC();
    sub_237F7C5DC();
    Logger.logObject.getter();
    v77 = sub_237F7CB08();
    if (sub_237F7C6B8(v77))
    {
      v78 = (uint8_t *)sub_237F7C528();
      v79 = (_QWORD *)sub_237F7C528();
      *(_DWORD *)v78 = 138412290;
      sub_237F7C5DC();
      v80 = _swift_stdlib_bridgeErrorToNSError();
      v1[8] = v80;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v79 = v80;
      sub_237F70270();
      sub_237F70270();
      sub_237F7C754(&dword_237F6A000, v76, (os_log_type_t)v72, "failed to download assets with %@", v78);
      sub_237F6F330(&qword_2568B6300);
      sub_237F7C730();
      sub_237F7C51C();
    }
    sub_237F70270();
    sub_237F70270();
    sub_237F70270();

    goto LABEL_28;
  }
  typea = *((_DWORD *)v1 + 129);
  v115 = *((_DWORD *)v1 + 128);
  v127 = v1[40];
  v128 = v1[39];
  v34 = v1[37];
  v129 = v1[38];
  log = (os_log_t)v1[36];
  v35 = v1[30];
  v37 = v1[28];
  v36 = v1[29];
  v119 = v1[35];
  v113 = (uint64_t *)(v34 + *(int *)(sub_237F6F330(&qword_2568B67A8) + 48));
  AssetDownloadRequest.id.getter();
  AssetDownloadRequest.asset.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v35, v32, v37);
  AssetDownloadResponse.init(id:asset:fileURL:range:)();
  sub_237F6F330(&qword_2568B67B0);
  sub_237F84D7C();
  v38(v34, v115);
  *v113 = String.init(cString:)();
  v113[1] = v39;
  ((void (*)(uint64_t, _QWORD, uint64_t))log[13].isa)(v34, typea, v119);
  sub_237F6F330(&qword_2568B6778);
  AsyncThrowingStream.Continuation.yield(_:)();
  (*(void (**)(uint64_t, uint64_t))(v128 + 8))(v127, v129);
  if (qword_2568B5DD0 != -1)
    swift_once();
  v40 = v1[51];
  v41 = v1[48];
  v42 = v1[47];
  v43 = v1[45];
  v45 = v1[42];
  v44 = v1[43];
  v46 = v1[41];
  v47 = sub_237F7C8AC();
  sub_237F787D0(v47, (uint64_t)qword_2568B6510);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16))(v44, v43, v46);
  sub_237F84E08();
  sub_237F84AAC(v40, v41);
  sub_237F84AAC(v40, v42);
  v48 = Logger.logObject.getter();
  v49 = static os_log_type_t.default.getter();
  v50 = os_log_type_enabled(v48, v49);
  v130 = v1[51];
  v52 = v1[48];
  v51 = (uint64_t *)v1[49];
  v53 = v1[47];
  if (v50)
  {
    v120 = v1[47];
    v54 = v1[43];
    v110 = v1[42];
    v111 = v1[41];
    v112 = v1[48];
    v56 = v1[33];
    v55 = v1[34];
    v57 = v1[32];
    v58 = sub_237F7C528();
    v132[0] = sub_237F7C528();
    *(_DWORD *)v58 = 136315906;
    typeb = v49;
    AssetDownloadRequest.id.getter();
    sub_237F6FB4C(&qword_2568B67B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v59 = dispatch thunk of CustomStringConvertible.description.getter();
    loga = v48;
    v61 = v60;
    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v57);
    v1[14] = sub_237F787F8(v59, v61, v132);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    sub_237F7CA78();
    (*(void (**)(uint64_t, uint64_t))(v110 + 8))(v54, v111);
    *(_WORD *)(v58 + 12) = 2050;
    v62 = *v51;
    sub_237F84A70((uint64_t)v51);
    v1[15] = v62;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v58 + 22) = 2080;
    sub_237F6FB4C(&qword_2568B67C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v63 = dispatch thunk of CustomStringConvertible.description.getter();
    v1[16] = sub_237F84DF0(v63, v64);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    sub_237F7CD94();
    sub_237F84A70(v112);
    *(_WORD *)(v58 + 32) = 2080;
    v65 = sub_237F84AF0();
    v1[17] = sub_237F787F8(v65, v66, v132);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    sub_237F701AC();
    sub_237F84A70(v120);
    _os_log_impl(&dword_237F6A000, loga, typeb, "[request id = %s] downloaded asset with tracking number %{public}ld at %s for range %s", (uint8_t *)v58, 0x2Au);
    swift_arrayDestroy();
    sub_237F7C51C();
  }
  v99 = v1[42];
  v98 = v1[43];
  v100 = v1[41];
  sub_237F84A70(v1[49]);

  sub_237F84A70(v53);
  sub_237F84A70(v52);
  v101 = *(void (**)(uint64_t, uint64_t))(v99 + 8);
  v101(v98, v100);
  sub_237F84A70(v130);
  v101(v1[45], v1[41]);
  v102 = (_QWORD *)swift_task_alloc();
  v1[59] = (uint64_t)v102;
  *v102 = v1;
  v102[1] = sub_237F82200;
  sub_237F84DDC();
  return _sScs8IteratorV4next9isolationxSgScA_pSgYi_tYaq_YKF();
}

uint64_t sub_237F82200()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  sub_237F84D8C();
  sub_237F84DB8(v2);
  if (!v1)
    *(_QWORD *)(v0 + 464) = 0;
  sub_237F6FDBC();
  return sub_237F84D54();
}

uint64_t sub_237F82248()
{
  _QWORD *v0;
  _QWORD *v1;
  id *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
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
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t *v43;
  uint8_t *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v48;
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
  uint64_t v61;

  v1 = v0;
  sub_237F6FF68(v0[54]);
  v0[10] = v0[11];
  v2 = (id *)(v0 + 10);
  sub_237F7C5DC();
  sub_237F6F330(&qword_2568B62F8);
  sub_237F84DAC();
  if ((swift_dynamicCast() & 1) != 0)
  {
    v3 = (*(uint64_t (**)(_QWORD, _QWORD))(v1[26] + 88))(v1[27], v1[25]);
    if ((_DWORD)v3 == *MEMORY[0x24BE171F0])
    {
      v4 = v3;
      v5 = (_QWORD *)v1[37];
      v57 = v1[39];
      v59 = v1[38];
      v6 = v1[36];
      v7 = v1[26];
      v8 = (_QWORD *)v1[27];
      v9 = v1[25];
      v54 = v1[35];
      v56 = v1[24];
      sub_237F70270();
      (*(void (**)(_QWORD *, uint64_t))(v7 + 96))(v8, v9);
      *v5 = *v8;
      (*(void (**)(_QWORD *, uint64_t, uint64_t))(v7 + 104))(v5, v4, v9);
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v5, *MEMORY[0x24BE17168], v54);
      sub_237F7C7DC();
      sub_237F6F330(&qword_2568B6778);
      v10 = AsyncThrowingStream.Continuation.yield(_:)();
      sub_237F84D6C(v10, v11, v12, v13, v14, v15, v16, v17, v48, v49, v50, v51, v52, v54, v56, v57, v59);
      if (qword_2568B5DD0 != -1)
        swift_once();
      v18 = sub_237F7C8AC();
      v19 = sub_237F787D0(v18, (uint64_t)qword_2568B6510);
      sub_237F7C7DC();
      Logger.logObject.getter();
      v20 = sub_237F7CB08();
      if (sub_237F7CB2C(v20))
      {
        v21 = (uint8_t *)sub_237F7C528();
        v61 = sub_237F7C528();
        *(_DWORD *)v21 = 136315138;
        v22 = sub_237F7C7DC();
        MEMORY[0x23B828958](v22, MEMORY[0x24BEE0D00]);
        v23 = sub_237F7CA78();
        *(v2 - 1) = (id)sub_237F84DC4(v23, v24, &v61);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        sub_237F84D60();
        sub_237F7C754(&dword_237F6A000, v19, (os_log_type_t)v6, "failed to download due to server blocking %s", v21);
        sub_237F7C730();
        sub_237F7C51C();
      }
      sub_237F84D60();

      goto LABEL_14;
    }
    sub_237F6FF68(v1[26]);
  }
  v25 = v1[40];
  v26 = v1[37];
  v58 = v1[39];
  v60 = v1[38];
  v27 = v1[35];
  v28 = v1[36];

  v29 = (_QWORD *)(v26 + *(int *)(sub_237F6F330(&qword_2568B67A8) + 48));
  v30 = *MEMORY[0x24BE17228];
  sub_237F6F330(&qword_2568B67B0);
  sub_237F84D7C();
  v31(v26, v30);
  *v29 = 0;
  v29[1] = 0xE000000000000000;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v28 + 104))(v26, *MEMORY[0x24BE17170], v27);
  sub_237F6F330(&qword_2568B6778);
  v32 = AsyncThrowingStream.Continuation.yield(_:)();
  sub_237F84D6C(v32, v33, v34, v35, v36, v37, v38, v39, v48, v49, v50, v51, v52, v53, v55, v58, v60);
  if (qword_2568B5DD0 != -1)
    swift_once();
  v40 = sub_237F7C8AC();
  v41 = sub_237F787D0(v40, (uint64_t)qword_2568B6510);
  sub_237F7C5DC();
  sub_237F7C5DC();
  Logger.logObject.getter();
  v42 = sub_237F7CB08();
  if (sub_237F7C6B8(v42))
  {
    v43 = (uint64_t *)(v2 - 2);
    v44 = (uint8_t *)sub_237F7C528();
    v45 = (_QWORD *)sub_237F7C528();
    *(_DWORD *)v44 = 138412290;
    sub_237F7C5DC();
    v46 = _swift_stdlib_bridgeErrorToNSError();
    *v43 = v46;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v45 = v46;
    sub_237F70270();
    sub_237F70270();
    sub_237F7C754(&dword_237F6A000, v41, (os_log_type_t)v25, "failed to download assets with %@", v44);
    sub_237F6F330(&qword_2568B6300);
    sub_237F7C730();
    sub_237F7C51C();
  }
  sub_237F70270();
  sub_237F70270();
  sub_237F70270();

LABEL_14:
  v1[7] = 0;
  sub_237F6F330(&qword_2568B6778);
  sub_237F7CD34();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_237F6FEFC();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_237F70140();
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
  return ((uint64_t (*)(void))v1[1])();
}

void sub_237F8276C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  void (*v48)(char *, uint64_t);
  char *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE *v68;
  uint64_t v69;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v71;
  unint64_t v72;
  char v73;
  uint64_t v74;
  _BOOL8 v75;
  Swift::Int v76;
  unint64_t v77;
  char v78;
  Swift::Bool v79;
  unint64_t v80;
  char v81;
  _QWORD *v82;
  uint64_t v83;
  BOOL v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(char *, uint64_t, uint64_t);
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  size_t v108;
  void *v109;
  void *v111;
  uint64_t v112;
  NSObject *v113;
  os_log_type_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  unint64_t v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  NSDictionary v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  int v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  NSObject *v132;
  os_log_type_t v133;
  _BOOL4 v134;
  uint8_t *v135;
  _QWORD *v136;
  uint64_t v137;
  uint64_t *v138;
  uint64_t v139;
  unint64_t v140;
  uint64_t v141;
  _QWORD v142[2];
  __int128 v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  _QWORD *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  uint64_t v163;
  unint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  char *v168;
  uint64_t v169;
  uint64_t v170;
  char *v171;
  uint64_t v172;
  unint64_t v173;
  char *v174;
  uint64_t v175;
  __int128 v176;
  uint64_t *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  char *v185;
  uint64_t v186;
  uint64_t v187;
  __int128 v188;
  uint64_t v189;
  uint64_t v190;
  __int128 v191;
  uint64_t v192;
  __int128 __src;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;

  v148 = a4;
  v170 = a3;
  v160 = a1;
  v196 = *MEMORY[0x24BDAC8D0];
  v187 = type metadata accessor for String.Encoding();
  v186 = *(_QWORD *)(v187 - 8);
  MEMORY[0x24BDAC7A8](v187);
  v185 = (char *)v142 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v183 = type metadata accessor for Data.Iterator();
  v182 = *(_QWORD *)(v183 - 8);
  MEMORY[0x24BDAC7A8](v183);
  v181 = (char *)v142 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v159 = sub_237F6F330(&qword_2568B6738);
  v150 = *(_QWORD *)(v159 - 8);
  MEMORY[0x24BDAC7A8](v159);
  v149 = (char *)v142 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_237F6F330(&qword_2568B67D0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v142 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v175 = type metadata accessor for AssetDownloadRequest();
  v154 = *(_QWORD *)(v175 - 8);
  MEMORY[0x24BDAC7A8](v175);
  v168 = (char *)v142 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_237F6F330(&qword_2568B6340);
  MEMORY[0x24BDAC7A8](v12);
  v156 = (uint64_t)v142 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for Credential();
  v167 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v174 = (char *)v142 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for URL();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v171 = (char *)v142 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_237F6F330(&qword_2568B64F0);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v157 = (uint64_t)v142 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v147 = *(_QWORD *)(a2 + 16);
  if (!v147)
    return;
  v153 = *(int *)(v20 + 48);
  v152 = a2 + ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80));
  v151 = *(_QWORD *)(v21 + 72);
  v158 = (_QWORD *)&__src + 1;
  v142[1] = a2;
  swift_bridgeObjectRetain();
  v23 = 0;
  v24 = 0;
  v144 = MEMORY[0x24BEE4AD8] + 8;
  *(_QWORD *)&v25 = 138412290;
  v143 = v25;
  *(_QWORD *)&v25 = 136315138;
  v176 = v25;
  v162 = v10;
  v146 = v16;
  v161 = v14;
  v145 = v17;
  v26 = v171;
  while (1)
  {
    v169 = v23;
    v27 = v157;
    sub_237F84BC0(v152 + v151 * v23, v157, &qword_2568B64F0);
    v28 = *(_QWORD *)(v27 + v153);
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 32))(v26, v27, v16);
    v29 = swift_bridgeObjectRetain();
    v30 = sub_237F7BC24(v29);
    v178 = v28;
    swift_bridgeObjectRelease();
    v31 = *(_QWORD *)(v30 + 16);
    if (v31)
    {
      *(_QWORD *)&__src = MEMORY[0x24BEE4AF8];
      sub_237F7B370();
      v32 = *(_QWORD *)(v30 + 32);
      if (v32 < 0)
        goto LABEL_99;
      v33 = __src;
      v34 = *(_QWORD *)(__src + 16);
      if (v34 >= *(_QWORD *)(__src + 24) >> 1)
      {
        sub_237F7B370();
        v33 = __src;
      }
      *(_QWORD *)(v33 + 16) = v34 + 1;
      *(_QWORD *)(v33 + 8 * v34 + 32) = v32;
      if (v31 != 1)
      {
        v139 = 0;
        v140 = v34 + 5;
        while (1)
        {
          if (v139 + 1 >= v31)
          {
            __break(1u);
LABEL_91:
            __break(1u);
            JUMPOUT(0x237F83EE8);
          }
          v141 = *(_QWORD *)(v30 + 40 + 8 * v139);
          if (v141 < 0)
            break;
          *(_QWORD *)&__src = v33;
          if (v140 - 4 >= *(_QWORD *)(v33 + 24) >> 1)
          {
            sub_237F7B370();
            v33 = __src;
          }
          *(_QWORD *)(v33 + 16) = v140 - 3;
          *(_QWORD *)(v33 + 8 * v140++) = v141;
          if (v31 - 1 == ++v139)
            goto LABEL_8;
        }
LABEL_99:
        _assertionFailure(_:_:file:line:flags:)();
LABEL_100:
        __break(1u);
LABEL_101:
        KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
        __break(1u);
LABEL_102:
        swift_bridgeObjectRelease();
        swift_unexpectedError();
        __break(1u);
        JUMPOUT(0x237F8402CLL);
      }
LABEL_8:
      swift_release();
      v10 = v162;
      v14 = v161;
    }
    else
    {
      swift_release();
      v33 = MEMORY[0x24BEE4AF8];
    }
    swift_retain();
    v35 = swift_bridgeObjectRetain();
    v36 = sub_237F71788(v35);
    if (v24)
      goto LABEL_102;
    v37 = v36;
    swift_bridgeObjectRelease();
    v38 = sub_237F721B0(v37);
    v39 = swift_bridgeObjectRetain();
    sub_237F74A9C(v39, &__src);
    v180 = v38;
    swift_bridgeObjectRelease();
    if (!v195)
      break;
    v40 = v158;
    sub_237F7C21C(v158, v195);
    v179 = v33;
    v41 = v156;
    dispatch thunk of AssetRequest.credential.getter();
    v42 = v179;
    sub_237F6C9A4(v41, 0, 1, v14);
    sub_237F6FBF0((uint64_t)v40);
    if (sub_237F6C928(v41, 1, v14) == 1)
      goto LABEL_88;
    (*(void (**)(char *, uint64_t, uint64_t))(v167 + 32))(v174, v41, v14);
    if (!*(_QWORD *)(v42 + 16))
    {
      __break(1u);
LABEL_94:
      __break(1u);
LABEL_95:
      __break(1u);
LABEL_96:
      __break(1u);
      JUMPOUT(0x237F83F18);
    }
    v43 = *(_QWORD *)(v42 + 32);
    v177 = (uint64_t *)(v42 + 32);
    if (v43 < 0)
      goto LABEL_94;
    sub_237F84EB0(v43, v180, (uint64_t)&v191);
    if (!v192)
    {
      __break(1u);
LABEL_98:
      __break(1u);
      JUMPOUT(0x237F83F2CLL);
    }
    sub_237F7C334(&v191, (uint64_t)&__src);
    sub_237F6F330(&qword_2568B6400);
    v44 = v168;
    v45 = v175;
    swift_dynamicCast();
    v46 = AssetDownloadRequest.storageReference.getter();
    v173 = v47;
    v48 = *(void (**)(char *, uint64_t))(v154 + 8);
    v48(v44, v45);
    if (*v177 < 0)
      goto LABEL_95;
    sub_237F84EB0(*v177, v180, (uint64_t)&v191);
    if (!v192)
      goto LABEL_98;
    sub_237F7C334(&v191, (uint64_t)&__src);
    v49 = v168;
    v50 = v175;
    swift_dynamicCast();
    v51 = AssetDownloadRequest.storageReferenceSignature.getter();
    v53 = v52;
    v48(v49, v50);
    type metadata accessor for Downloader.OptionsBuilder();
    swift_initStackObject();
    v54 = swift_bridgeObjectRetain();
    v55 = sub_237F7E778(v54);
    v56 = v173;
    v57 = sub_237F70A3C(v46, v173);
    v165 = v51;
    v164 = v53;
    if ((v57 & 1) == 0)
    {
      v58 = sub_237F7ECD8(v46, v56, v51, v53);
      *(_BYTE *)(v58 + 64) = 1;
      swift_release();
      v55 = v58;
    }
    if (*v177 < 0)
      goto LABEL_96;
    sub_237F84EB0(*v177, v180, (uint64_t)&__src);
    v163 = v46;
    if (!v194)
    {
      sub_237F6F680((uint64_t)&__src, &qword_2568B67D8);
      sub_237F6C9A4((uint64_t)v10, 1, 1, v175);
LABEL_26:
      sub_237F6F680((uint64_t)v10, &qword_2568B67D0);
LABEL_27:
      v65 = v55;
      goto LABEL_28;
    }
    v59 = v175;
    v60 = swift_dynamicCast();
    sub_237F6C9A4((uint64_t)v10, v60 ^ 1u, 1, v59);
    if (sub_237F6C928((uint64_t)v10, 1, v59) == 1)
      goto LABEL_26;
    v61 = AssetDownloadRequest.applicationID.getter();
    v63 = v62;
    v48(v10, v175);
    if (!v63)
      goto LABEL_27;
    swift_retain();
    v64 = sub_237F7ED54(v61, v63);
    swift_release_n();
    swift_bridgeObjectRelease();
    v65 = v64;
LABEL_28:
    v66 = sub_237F7DC00(v180);
    v166 = 0;
    v67 = *(_QWORD *)(v66 + 16);
    v184 = v65;
    if (v67)
    {
      v68 = (_BYTE *)(v66 + 56);
      do
      {
        if ((*v68 & 1) == 0)
        {
          v69 = *((_QWORD *)v68 - 3);
          v188 = *((_OWORD *)v68 - 1);
          swift_beginAccess();
          swift_retain();
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(_QWORD *)&v191 = *(_QWORD *)(v65 + 24);
          v71 = v191;
          *(_QWORD *)(v65 + 24) = 0x8000000000000000;
          v72 = sub_237F792D8(v69);
          v74 = *(_QWORD *)(v71 + 16);
          v75 = (v73 & 1) == 0;
          v76 = v74 + v75;
          if (__OFADD__(v74, v75))
            goto LABEL_91;
          v77 = v72;
          v78 = v73;
          sub_237F6F330(&qword_2568B67E0);
          v79 = _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v76);
          v65 = v184;
          if (v79)
          {
            v80 = sub_237F792D8(v69);
            if ((v78 & 1) != (v81 & 1))
              goto LABEL_101;
            v77 = v80;
          }
          v82 = (_QWORD *)v191;
          if ((v78 & 1) != 0)
          {
            *(_OWORD *)(*(_QWORD *)(v191 + 56) + 16 * v77) = v188;
          }
          else
          {
            *(_QWORD *)(v191 + 8 * (v77 >> 6) + 64) |= 1 << v77;
            *(_QWORD *)(v82[6] + 8 * v77) = v69;
            *(_OWORD *)(v82[7] + 16 * v77) = v188;
            v83 = v82[2];
            v84 = __OFADD__(v83, 1);
            v85 = v83 + 1;
            if (v84)
            {
              __break(1u);
              JUMPOUT(0x237F83EF0);
            }
            v82[2] = v85;
          }
          *(_QWORD *)(v65 + 24) = v82;
          swift_bridgeObjectRelease();
          swift_endAccess();
          swift_release();
        }
        v68 += 32;
        --v67;
      }
      while (v67);
    }
    swift_bridgeObjectRelease();
    v86 = v150;
    v87 = *(void (**)(char *, uint64_t, uint64_t))(v150 + 16);
    v88 = v149;
    v89 = v159;
    v87(v149, v160, v159);
    type metadata accessor for DownloadRequestContext();
    v90 = swift_allocObject();
    v87((char *)(v90 + OBJC_IVAR____TtC16CloudAssetDaemon22DownloadRequestContext_continuation), (uint64_t)v88, v89);
    v172 = sub_237F85CEC(v180);
    (*(void (**)(char *, uint64_t))(v86 + 8))(v88, v89);
    v91 = v178;
    swift_bridgeObjectRetain();
    v92 = swift_bridgeObjectRetain();
    v93 = v166;
    v94 = sub_237F718C8(v92, v91);
    swift_bridgeObjectRelease();
    v95 = sub_237F7148C(v94);
    swift_bridgeObjectRelease();
    v96 = *(_QWORD *)(v95 + 16);
    if (v96)
    {
      v166 = v93;
      *(_QWORD *)&v191 = MEMORY[0x24BEE4AF8];
      sub_237F7B240(0, v96, 0);
      v155 = v95;
      __asm { BR              X8 }
    }
    swift_bridgeObjectRelease();
    *(_QWORD *)&v191 = MEMORY[0x24BEE4AF8];
    swift_retain();
    v97 = swift_bridgeObjectRetain();
    v98 = sub_237F71A70(v97);
    if (v93)
      goto LABEL_102;
    v99 = v98;
    swift_bridgeObjectRelease();
    v100 = sub_237F71608(v99);
    *(_QWORD *)&v188 = 0;
    swift_bridgeObjectRelease();
    v101 = *(_QWORD *)(v100 + 16);
    if (v101)
    {
      v189 = MEMORY[0x24BEE4AF8];
      sub_237F7B298(0, v101, 0);
      v102 = v189;
      v103 = (uint64_t *)(v100 + 40);
      while (1)
      {
        v105 = *(v103 - 1);
        v104 = *v103;
        *(_QWORD *)&__src = v105;
        *((_QWORD *)&__src + 1) = v104;
        v106 = v185;
        static String.Encoding.utf8.getter();
        sub_237F7C2F8();
        v107 = StringProtocol.cString(using:)();
        (*(void (**)(char *, uint64_t))(v186 + 8))(v106, v187);
        if (v107)
        {
          v108 = *(_QWORD *)(v107 + 16);
          v109 = (void *)swift_slowAlloc();
          if (v107 + 32 < (unint64_t)v109 + v108 && (unint64_t)v109 < v107 + 32 + v108)
          {
            _fatalErrorMessage(_:_:file:line:flags:)();
            goto LABEL_100;
          }
          v111 = v109;
          memcpy(v109, (const void *)(v107 + 32), v108);
          swift_bridgeObjectRelease();
        }
        else
        {
          if (qword_2568B5DD0 != -1)
            swift_once();
          v112 = type metadata accessor for Logger();
          sub_237F787D0(v112, (uint64_t)qword_2568B6510);
          swift_bridgeObjectRetain_n();
          v113 = Logger.logObject.getter();
          v114 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v113, v114))
          {
            v115 = swift_slowAlloc();
            v116 = swift_slowAlloc();
            *(_QWORD *)&__src = v116;
            *(_DWORD *)v115 = v176;
            swift_bridgeObjectRetain();
            *(_QWORD *)(v115 + 4) = sub_237F787F8(v105, v104, (uint64_t *)&__src);
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_237F6A000, v113, v114, "unable to convert token %s to C string.", (uint8_t *)v115, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x23B828FE8](v116, -1, -1);
            MEMORY[0x23B828FE8](v115, -1, -1);

          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          v111 = 0;
        }
        v189 = v102;
        v118 = *(_QWORD *)(v102 + 16);
        v117 = *(_QWORD *)(v102 + 24);
        if (v118 >= v117 >> 1)
        {
          sub_237F7B298(v117 > 1, v118 + 1, 1);
          v102 = v189;
        }
        v103 += 2;
        *(_QWORD *)(v102 + 16) = v118 + 1;
        *(_QWORD *)(v102 + 8 * v118 + 32) = v111;
        if (!--v101)
        {
          swift_bridgeObjectRelease();
          goto LABEL_64;
        }
      }
    }
    swift_bridgeObjectRelease();
    v102 = MEMORY[0x24BEE4AF8];
LABEL_64:
    v190 = 0;
    URL._bridgeToObjectiveC()(*(NSURL **)(v148 + 16));
    v120 = v119;
    v121 = Credential.requestorID.getter();
    v122 = (void *)MEMORY[0x23B8288A4](v121);
    swift_bridgeObjectRelease();
    swift_retain();
    sub_237F7ED8C();
    swift_release();
    v123.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v124 = v191;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_237F77F00(0, *(_QWORD *)(v124 + 16), 0, v124);
      v124 = v125;
    }
    *(_QWORD *)&v191 = v124;
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_237F77EF4(0, *(_QWORD *)(v102 + 16), 0, v102);
      v102 = v126;
    }
    v189 = v102;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v127 = MMCSGetItems();
    swift_endAccess();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v127)
    {
      v10 = v162;
      v14 = v161;
      v128 = v169;
      v129 = v165;
      v130 = v164;
      v24 = v188;
    }
    else
    {
      sub_237F77634();
      *(_QWORD *)&__src = swift_allocError();
      AsyncThrowingStream.Continuation.finish(throwing:)();
      v10 = v162;
      v14 = v161;
      v128 = v169;
      v130 = v164;
      if (qword_2568B5DD0 != -1)
        swift_once();
      v131 = type metadata accessor for Logger();
      sub_237F787D0(v131, (uint64_t)qword_2568B6510);
      v132 = Logger.logObject.getter();
      v133 = static os_log_type_t.error.getter();
      v134 = os_log_type_enabled(v132, v133);
      v24 = v188;
      if (v134)
      {
        v135 = (uint8_t *)swift_slowAlloc();
        v136 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v135 = v143;
        v137 = v190;
        if (v190)
        {
          type metadata accessor for CFError(0);
          sub_237F6FB4C(&qword_2568B6740, (uint64_t (*)(uint64_t))type metadata accessor for CFError, MEMORY[0x24BDCFD90]);
          swift_allocError();
          *v138 = v137;
          v137 = _swift_stdlib_bridgeErrorToNSError();
          *(_QWORD *)&__src = v137;
        }
        else
        {
          *(_QWORD *)&__src = 0;
        }
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *v136 = v137;
        _os_log_impl(&dword_237F6A000, v132, v133, "failed to create download request due to error %@", v135, 0xCu);
        sub_237F6F330(&qword_2568B6300);
        swift_arrayDestroy();
        MEMORY[0x23B828FE8](v136, -1, -1);
        MEMORY[0x23B828FE8](v135, -1, -1);
        v10 = v162;
        v14 = v161;
        v128 = v169;
      }

      v129 = v165;
    }
    v23 = v128 + 1;
    sub_237F757C0((uint64_t)&v191, &v189);
    sub_237F6F63C(v129, v130);
    swift_release();
    sub_237F6F63C(v163, v173);
    (*(void (**)(char *, uint64_t))(v167 + 8))(v174, v14);
    v17 = v145;
    v26 = v171;
    v16 = v146;
    (*(void (**)(char *, uint64_t))(v145 + 8))(v171, v146);
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    if (v23 == v147)
    {
      swift_bridgeObjectRelease();
      return;
    }
  }
  sub_237F6F680((uint64_t)&__src, &qword_2568B6348);
  v41 = v156;
  sub_237F6C9A4(v156, 1, 1, v14);
LABEL_88:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v145 + 8))(v171, v146);
  swift_bridgeObjectRelease();
  sub_237F6F680(v41, &qword_2568B6340);
}

uint64_t sub_237F8403C()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Downloader()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for Downloader.OptionsBuilder()
{
  return objc_opt_self();
}

uint64_t *sub_237F840A0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    v7 = *(int *)(a3 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = type metadata accessor for URL();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    *(_OWORD *)((char *)v4 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t sub_237F84144(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_QWORD *sub_237F8417C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_237F841F4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  return a1;
}

_QWORD *sub_237F8427C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_237F842F4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_237F8436C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237F84378(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  sub_237F84DFC();
  v3 = sub_237F84DAC();
  return sub_237F6C928(v3, a2, v4);
}

uint64_t sub_237F843A4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237F843B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = sub_237F84DFC();
  return sub_237F6C9A4(v2, a2, a2, v4);
}

uint64_t type metadata accessor for Downloader.AssetDownloadResult()
{
  uint64_t result;

  result = qword_2568B66E8;
  if (!qword_2568B66E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_237F8441C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

double sub_237F8449C@<D0>(_OWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  char v6;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  Swift::Int v9;
  double result;
  uint64_t v11;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_237F79370();
  v6 = v5;
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v2;
    v8 = *v2;
    *v2 = 0x8000000000000000;
    v9 = *(_QWORD *)(v8 + 24);
    sub_237F6F330(&qword_2568B6108);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v9);
    swift_bridgeObjectRelease();
    sub_237F6FC10((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v4), a1);
    _NativeDictionary._delete(at:)();
    *v2 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a1 = 0u;
    a1[1] = 0u;
  }
  return result;
}

uint64_t sub_237F845C0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
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
  char v19;
  unint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  char v24;
  unint64_t v25;
  char v26;
  _OWORD *v27;
  _OWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v8 = a1;
  sub_237F7BF28(a1, &v56);
  swift_bridgeObjectRetain();
  v9 = swift_retain();
  sub_237F7CBAC(v9, v10, v11, v12, v13, v14, v15, v16, a3, v8, v44, v45, v46, v47, v48, *((uint64_t *)&v48 + 1), v49, v50, v51,
    *((uint64_t *)&v51 + 1),
    v52,
    v53,
    v54);
  v17 = *((_QWORD *)&v54 + 1);
  if (!*((_QWORD *)&v54 + 1))
  {
LABEL_14:
    swift_release();
    swift_bridgeObjectRelease();
    sub_237F7C2C8();
    return swift_release();
  }
  while (1)
  {
    v18 = v54;
    sub_237F6FC10(&v55, &v51);
    v20 = sub_237F7C9EC();
    v21 = *(_QWORD *)(v8 + 16);
    v22 = (v19 & 1) == 0;
    v23 = v21 + v22;
    if (__OFADD__(v21, v22))
      break;
    v24 = v19;
    if (*(_QWORD *)(v8 + 24) >= v23)
    {
      if ((a4 & 1) != 0)
      {
        if ((v19 & 1) != 0)
          goto LABEL_9;
      }
      else
      {
        sub_237F6F330(&qword_2568B6108);
        v8 = a5;
        _NativeDictionary.copy()();
        if ((v24 & 1) != 0)
          goto LABEL_9;
      }
    }
    else
    {
      v8 = a5;
      sub_237F79D68(v23, a4 & 1);
      v25 = sub_237F7C9EC();
      if ((v24 & 1) != (v26 & 1))
        goto LABEL_17;
      v20 = v25;
      if ((v24 & 1) != 0)
      {
LABEL_9:
        sub_237F78E90(*(_QWORD *)(*(_QWORD *)a5 + 56) + 32 * v20, (uint64_t)&v44);
        sub_237F78E90((uint64_t)&v44, (uint64_t)&v48);
        sub_237F6FBF0((uint64_t)&v44);
        sub_237F6FBF0((uint64_t)&v51);
        swift_bridgeObjectRelease();
        v27 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)a5 + 56) + 32 * v20);
        sub_237F6FBF0((uint64_t)v27);
        v28 = sub_237F6FC10(&v48, v27);
        goto LABEL_13;
      }
    }
    v36 = *(_QWORD **)a5;
    *(_QWORD *)(*(_QWORD *)a5 + 8 * (v20 >> 6) + 64) |= 1 << v20;
    v37 = (_QWORD *)(v36[6] + 16 * v20);
    *v37 = v18;
    v37[1] = v17;
    v28 = sub_237F6FC10(&v51, (_OWORD *)(v36[7] + 32 * v20));
    v38 = v36[2];
    v39 = __OFADD__(v38, 1);
    v40 = v38 + 1;
    if (v39)
      goto LABEL_16;
    v36[2] = v40;
LABEL_13:
    sub_237F7CBAC((uint64_t)v28, v29, v30, v31, v32, v33, v34, v35, v42, v43, v44, v45, v46, v47, v48, *((uint64_t *)&v48 + 1), v49, v50, v51,
      *((uint64_t *)&v51 + 1),
      v52,
      v53,
      v54);
    v17 = *((_QWORD *)&v54 + 1);
    a4 = 1;
    if (!*((_QWORD *)&v54 + 1))
      goto LABEL_14;
  }
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_237F847CC(uint64_t a1)
{
  uint64_t v1;

  return sub_237F80EB8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64));
}

uint64_t sub_237F847E0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = *(_QWORD *)(sub_237F6F330(&qword_2568B6768) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  v4 = sub_237F6F330(&qword_2568B6778);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + ((v3 + 11) & 0xFFFFFFFFFFFFFFF8) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  swift_unknownObjectRelease();
  sub_237F6FD50(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v6, v4);
  return swift_deallocObject();
}

uint64_t sub_237F848C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v15;

  v3 = *(_QWORD *)(sub_237F6F330(&qword_2568B6768) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = (v5 + 11) & 0xFFFFFFFFFFFFFFF8;
  sub_237F6F330(&qword_2568B6778);
  v7 = *(_QWORD *)(v1 + 24);
  v15 = *(_QWORD *)(v1 + 16);
  v8 = *(_QWORD *)(v1 + v5);
  v9 = v1 + v6;
  v10 = *(_QWORD *)(v1 + v6);
  v11 = *(_QWORD *)(v9 + 8);
  v12 = *(_QWORD *)(v9 + 16);
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v13;
  *v13 = v2;
  v13[1] = sub_237F849E4;
  return sub_237F8110C(a1, v15, v7, v1 + v4, v8, v10, v11, v12);
}

uint64_t sub_237F849E4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_237F84A2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Downloader.AssetDownloadResult();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_237F84A70(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Downloader.AssetDownloadResult();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_237F84AAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Downloader.AssetDownloadResult();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237F84AF0()
{
  Swift::String v0;

  _print_unlocked<A, B>(_:_:)();
  v0._countAndFlagsBits = 3943982;
  v0._object = (void *)0xE300000000000000;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  return 0;
}

void sub_237F84B84(uint64_t a1)
{
  uint64_t *v1;

  sub_237F8276C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_237F84B90(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_237F7C1D8(a1, a2);
  return a1;
}

uint64_t sub_237F84BA4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_237F6F63C(a1, a2);
  return a1;
}

uint64_t sub_237F84BB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_237F7E85C(a1, a2, v2);
}

void sub_237F84BC0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_237F7CAE0(a1, a2, a3);
  sub_237F7CC80(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  sub_237F7028C();
}

void sub_237F84BEC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_237F7CAE0(a1, a2, a3);
  sub_237F7CC80(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  sub_237F7028C();
}

uint64_t *sub_237F84C18(uint64_t *a1)
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

uint64_t sub_237F84C54(uint64_t a1, uint64_t a2)
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

uint64_t sub_237F84C7C(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v8 = type metadata accessor for AssetDownloadRequest();
  v16 = v8;
  sub_237F6FB4C(&qword_2568B6820, (uint64_t (*)(uint64_t))MEMORY[0x24BE17070], MEMORY[0x24BE17068]);
  v17 = v9;
  v10 = sub_237F84C18((uint64_t *)&v15);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v10, a3, v8);
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  result = sub_237F7C334(&v15, a4[7] + 40 * a1);
  v12 = a4[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a4[2] = v14;
  return result;
}

uint64_t sub_237F84D54()
{
  return swift_task_switch();
}

uint64_t sub_237F84D60()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_237F84D6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v17;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a16 + 8))(v17, a17);
}

void sub_237F84D8C()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

BOOL sub_237F84D9C(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_237F84DAC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_237F84DB8@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  return swift_task_dealloc();
}

uint64_t sub_237F84DC4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  return sub_237F787F8(v4, v3, a3);
}

uint64_t sub_237F84DD0()
{
  return swift_willThrow();
}

uint64_t sub_237F84DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_237F787F8(a1, a2, (uint64_t *)(v2 - 88));
}

uint64_t sub_237F84DFC()
{
  return type metadata accessor for URL();
}

uint64_t sub_237F84E08()
{
  uint64_t v0;
  uint64_t v1;

  return sub_237F84AAC(v1, v0);
}

uint64_t sub_237F84E14()
{
  return swift_arrayDestroy();
}

uint64_t sub_237F84E20(_QWORD *a1, uint64_t a2)
{
  char v2;

  if (*(_QWORD *)(a2 + 16) && (sub_237F7922C(a1), (v2 & 1) != 0))
    return swift_retain();
  else
    return 0;
}

double sub_237F84E60@<D0>(uint64_t a1@<X2>, _OWORD *a2@<X8>)
{
  unint64_t v4;
  char v5;
  double result;

  if (*(_QWORD *)(a1 + 16) && (v4 = sub_237F79370(), (v5 & 1) != 0))
  {
    sub_237F78E90(*(_QWORD *)(a1 + 56) + 32 * v4, (uint64_t)a2);
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

double sub_237F84EB0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v5;
  char v6;
  double result;

  if (*(_QWORD *)(a2 + 16) && (v5 = sub_237F792D8(a1), (v6 & 1) != 0))
  {
    sub_237F7C34C(*(_QWORD *)(a2 + 56) + 40 * v5, a3);
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

uint64_t sub_237F84F08(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  char v4;

  if (*(_QWORD *)(a2 + 16) && (v3 = sub_237F792D8(a1), (v4 & 1) != 0))
    return *(_QWORD *)(*(_QWORD *)(a2 + 56) + 16 * v3);
  else
    return 0;
}

id sub_237F84F54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  void *v5;
  __int128 v7;
  uint64_t v8;

  v5 = *(void **)(v2 + 16);
  objc_msgSend(v5, sel_lock);
  swift_beginAccess();
  sub_237F84EB0(a1, *(_QWORD *)(v2 + 32), (uint64_t)&v7);
  if (v8)
  {
    sub_237F7C334(&v7, a2);
    swift_endAccess();
  }
  else
  {
    sub_237F850F0((uint64_t)&v7);
    swift_endAccess();
    sub_237F77634();
    swift_allocError();
    swift_willThrow();
  }
  return objc_msgSend(v5, sel_unlock);
}

_QWORD *sub_237F8502C()
{
  _QWORD *v0;

  v0[2] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1648]), sel_init);
  v0[3] = 0;
  sub_237F6F330(&qword_2568B6400);
  v0[4] = Dictionary.init(dictionaryLiteral:)();
  return v0;
}

uint64_t sub_237F8508C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_237F850B0()
{
  sub_237F8508C();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RequestTracker()
{
  return objc_opt_self();
}

uint64_t sub_237F850F0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_237F6F330(&qword_2568B67D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProcessorError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ProcessorError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_237F851C4 + 4 * asc_237F8B440[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_237F851E4 + 4 * byte_237F8B445[v4]))();
}

_BYTE *sub_237F851C4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_237F851E4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F851EC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F851F4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237F851FC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237F85204(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_237F85210()
{
  return 0;
}

ValueMetadata *type metadata accessor for ProcessorError()
{
  return &type metadata for ProcessorError;
}

unint64_t sub_237F8522C()
{
  unint64_t result;

  result = qword_2568B68D8;
  if (!qword_2568B68D8)
  {
    result = MEMORY[0x23B828F58](&unk_237F8B4A0, &type metadata for ProcessorError);
    atomic_store(result, (unint64_t *)&qword_2568B68D8);
  }
  return result;
}

void sub_237F85268()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_237F8528C()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t sub_237F852CC()
{
  return 1;
}

Swift::Int sub_237F852DC()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t sub_237F85328()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  sub_237F7C3B8(v0, qword_2568B68E0);
  sub_237F787D0(v0, (uint64_t)qword_2568B68E0);
  static LoggerSubsystem.server.getter();
  type metadata accessor for Engine();
  sub_237F6F330(&qword_2568B69C8);
  String.init<A>(describing:)();
  return Logger.init(subsystem:category:)();
}

void sub_237F853C0(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  Class isa;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[3];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  unint64_t v42;
  uint64_t v43;

  v2 = v1;
  v4 = *v1;
  v5 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v39 = *(_QWORD *)(v5 - 8);
  v40 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x24BDAC7A8](v37);
  sub_237F85CCC();
  v38 = v8;
  v9 = type metadata accessor for DispatchQoS();
  MEMORY[0x24BDAC7A8](v9);
  sub_237F85CCC();
  v36[2] = v10;
  if (qword_2568B5DD8 != -1)
    swift_once();
  v11 = type metadata accessor for Logger();
  v12 = sub_237F787D0(v11, (uint64_t)qword_2568B68E0);
  sub_237F85CB8();
  v13 = Logger.logObject.getter();
  v14 = static os_log_type_t.debug.getter();
  v15 = os_log_type_enabled(v13, v14);
  v36[1] = v12;
  v41 = v7;
  if (v15)
  {
    v16 = (uint8_t *)sub_237F7C528();
    v17 = sub_237F7C528();
    v36[0] = v4;
    v43 = v17;
    *(_DWORD *)v16 = 136315138;
    sub_237F85CE0();
    sub_237F85CC4();
    v18 = sub_237F85CAC();
    v20 = sub_237F787F8(v18, v19, &v43);
    sub_237F85C98(v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    sub_237F85C80();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237F6A000, v13, v14, "creating mmcs engine for %s", v16, 0xCu);
    sub_237F85C8C();
    sub_237F7C51C();
  }

  sub_237F85C80();
  v2[2] = sub_237F85E24();
  v2[3] = a1;
  sub_237F85CC4();
  v21 = v42;
  sub_237F858B4();
  if (v21)
  {
    swift_release();
    swift_release();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v36[0] = 0;
    v42 = sub_237F85BC0();
    static DispatchQoS.unspecified.getter();
    v43 = MEMORY[0x24BEE4AF8];
    sub_237F85BFC();
    sub_237F6F330(&qword_2568B69B8);
    sub_237F85C3C();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    (*(void (**)(char *, _QWORD, uint64_t))(v39 + 104))(v41, *MEMORY[0x24BEE5750], v40);
    v22 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
    URL._bridgeToObjectiveC()((NSURL *)OBJC_IVAR____TtC16CloudAssetDaemon13TenantContext_workingDirectory);
    v24 = v23;
    v25 = (void *)MEMORY[0x23B8288A4](0xD00000000000001ELL, 0x8000000237F8C920);
    v26 = sub_237F85EB4();
    v27 = (void *)MEMORY[0x23B8288A4](v26);
    swift_bridgeObjectRelease();
    sub_237F85A70();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v29 = MMCSEngineCreateWithTargetDispatchQueue();

    if (v29)
    {
      v2[4] = v29;
      sub_237F85CB8();
      v30 = Logger.logObject.getter();
      v31 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v30, v31))
      {
        v32 = (uint8_t *)sub_237F7C528();
        v43 = sub_237F7C528();
        *(_DWORD *)v32 = 136315138;
        sub_237F85CE0();
        sub_237F85CC4();
        v33 = sub_237F85CAC();
        v35 = sub_237F787F8(v33, v34, &v43);
        sub_237F85C98(v35);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        sub_237F85C80();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_237F6A000, v30, v31, "created mmcs engine for %s", v32, 0xCu);
        sub_237F85C8C();
        sub_237F7C51C();
      }

      swift_release_n();
    }
    else
    {
      __break(1u);
    }
  }
}

id sub_237F858B4()
{
  void *v0;
  id v1;
  uint64_t countAndFlagsBits;
  void *v3;
  unsigned int v4;
  id v5;
  NSURL *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  id v11;
  id v12;
  NSURL *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v18;
  id v19[2];

  v19[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_defaultManager);
  countAndFlagsBits = URL.path(percentEncoded:)(1)._countAndFlagsBits;
  v3 = (void *)MEMORY[0x23B8288A4](countAndFlagsBits);
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v1, sel_fileExistsAtPath_, v3);

  if (v4)
  {
    v5 = objc_msgSend(v0, sel_defaultManager);
    URL._bridgeToObjectiveC()(v6);
    v8 = v7;
    v19[0] = 0;
    v9 = objc_msgSend(v5, sel_removeItemAtURL_error_, v7, v19);

    v10 = v19[0];
    if (!v9)
      goto LABEL_6;
    v11 = v19[0];
  }
  v12 = objc_msgSend(v0, sel_defaultManager);
  URL._bridgeToObjectiveC()(v13);
  v15 = v14;
  v19[0] = 0;
  v16 = objc_msgSend(v12, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v14, 1, 0, v19);

  v10 = v19[0];
  if (v16)
    return v19[0];
LABEL_6:
  v18 = v10;
  _convertNSErrorToError(_:)();

  return (id)swift_willThrow();
}

uint64_t sub_237F85A70()
{
  uint64_t inited;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_237F6F330(&qword_2568B6388);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_237F8B510;
  result = *MEMORY[0x24BE633D0];
  if (!*MEMORY[0x24BE633D0])
  {
    __break(1u);
    goto LABEL_6;
  }
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 40) = v2;
  v3 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 48) = 1;
  result = *MEMORY[0x24BE633D8];
  if (!*MEMORY[0x24BE633D8])
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 88) = v4;
  *(_QWORD *)(inited + 120) = v3;
  *(_BYTE *)(inited + 96) = 0;
  result = *MEMORY[0x24BE633C8];
  if (*MEMORY[0x24BE633C8])
  {
    *(_QWORD *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(_QWORD *)(inited + 136) = v5;
    *(_QWORD *)(inited + 168) = v3;
    *(_BYTE *)(inited + 144) = 1;
    return Dictionary.init(dictionaryLiteral:)();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_237F85B54()
{
  uint64_t v0;

  MEMORY[0x23B828FE8](*(_QWORD *)(v0 + 16), -1, -1);
  swift_release();
  return v0;
}

uint64_t sub_237F85B80()
{
  sub_237F85B54();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Engine()
{
  return objc_opt_self();
}

unint64_t sub_237F85BC0()
{
  unint64_t result;

  result = qword_2568B69A8;
  if (!qword_2568B69A8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2568B69A8);
  }
  return result;
}

unint64_t sub_237F85BFC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2568B69B0;
  if (!qword_2568B69B0)
  {
    v1 = type metadata accessor for OS_dispatch_queue.Attributes();
    result = MEMORY[0x23B828F58](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_2568B69B0);
  }
  return result;
}

unint64_t sub_237F85C3C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2568B69C0;
  if (!qword_2568B69C0)
  {
    v1 = sub_237F791B4(&qword_2568B69B8);
    result = MEMORY[0x23B828F58](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2568B69C0);
  }
  return result;
}

uint64_t sub_237F85C80()
{
  return swift_release_n();
}

uint64_t sub_237F85C8C()
{
  return swift_arrayDestroy();
}

uint64_t sub_237F85C98(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = a1;
  return v1 - 88;
}

uint64_t sub_237F85CAC()
{
  return String.init<A>(describing:)();
}

uint64_t sub_237F85CB8()
{
  return swift_retain_n();
}

uint64_t sub_237F85CC4()
{
  return swift_retain();
}

uint64_t sub_237F85CE0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = v0;
  return type metadata accessor for TenantContext();
}

uint64_t sub_237F85CEC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_slowAlloc();
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v1 + 24) = a1;
  *v3 = v1;
  swift_retain();
  swift_release();
  return v1;
}

uint64_t sub_237F85D34()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 16);
  if (result)
  {
    MEMORY[0x23B828FE8](result, -1, -1);
    swift_bridgeObjectRelease();
    return v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_237F85D68()
{
  sub_237F85D34();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RequestContext()
{
  return objc_opt_self();
}

uint64_t sub_237F85DA8(uint64_t result)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  if (result)
  {
    v1 = *(void (**)(uint64_t))(**(_QWORD **)result + 104);
    v2 = swift_retain();
    v1(v2);
    return swift_release();
  }
  return result;
}

void sub_237F85DE4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  sub_237F85DA8(a1);

}

_QWORD *sub_237F85E24()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_slowAlloc();
  v2 = (_QWORD *)swift_slowAlloc();
  *v2 = v0;
  *v1 = 9;
  v1[1] = v2;
  v1[2] = sub_237F88920;
  v1[3] = j_nullsub_1;
  v1[4] = sub_237F80610;
  v1[5] = sub_237F73F6C;
  v1[6] = sub_237F74A48;
  v1[7] = sub_237F85DE4;
  v1[9] = 0;
  v1[10] = 0;
  v1[8] = 0;
  swift_retain();
  return v1;
}

unint64_t sub_237F85EB4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  Swift::String v3;

  _StringGuts.grow(_:)(22);
  swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(void **)(v0 + 24);
  swift_bridgeObjectRetain();
  v3._countAndFlagsBits = v2;
  v3._object = v1;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  return 0xD000000000000014;
}

uint64_t sub_237F85F40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  v7 = v4 + OBJC_IVAR____TtC16CloudAssetDaemon13TenantContext_workingDirectory;
  v8 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, a3, v8);
  *(_QWORD *)(v4 + OBJC_IVAR____TtC16CloudAssetDaemon13TenantContext_requestTracker) = a4;
  return v4;
}

uint64_t sub_237F85FA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16CloudAssetDaemon13TenantContext_workingDirectory;
  v2 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return v0;
}

uint64_t sub_237F86004()
{
  sub_237F85FA8();
  return swift_deallocClassInstance();
}

uint64_t sub_237F86028()
{
  return type metadata accessor for TenantContext();
}

uint64_t type metadata accessor for TenantContext()
{
  uint64_t result;

  result = qword_2568B6AA8;
  if (!qword_2568B6AA8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_237F86068()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_237F860EC()
{
  sub_237F6F330(&qword_2568B6738);
  return AsyncThrowingStream.Continuation.finish(throwing:)();
}

uint64_t sub_237F86134()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC16CloudAssetDaemon22DownloadRequestContext_continuation;
  v2 = sub_237F6F330(&qword_2568B6738);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

uint64_t sub_237F86174()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_237F85D34() + OBJC_IVAR____TtC16CloudAssetDaemon22DownloadRequestContext_continuation;
  v1 = sub_237F6F330(&qword_2568B6738);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
  return swift_deallocClassInstance();
}

uint64_t sub_237F861D0()
{
  return type metadata accessor for DownloadRequestContext();
}

uint64_t type metadata accessor for DownloadRequestContext()
{
  uint64_t result;

  result = qword_2568B6B68;
  if (!qword_2568B6B68)
    return swift_getSingletonMetadata();
  return result;
}

void sub_237F86210()
{
  unint64_t v0;

  sub_237F8627C();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_237F8627C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2568B6B78[0])
  {
    type metadata accessor for Downloader.AssetDownloadResult();
    sub_237F791B4(&qword_2568B62F8);
    v0 = type metadata accessor for AsyncThrowingStream.Continuation();
    if (!v1)
      atomic_store(v0, qword_2568B6B78);
  }
}

uint64_t sub_237F862EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v1 = sub_237F6F330(&qword_2568B6368);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_237F6F330(&qword_2568B6370);
  sub_237F7CC94((uint64_t)v3, v5, v6, v4);
  v7 = v0 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_storageReferenceContinuation;
  sub_237F867D8();
  sub_237F86790((uint64_t)v3, v7);
  return swift_endAccess();
}

uint64_t sub_237F86388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = v3 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_storageReferenceContinuation;
  v8 = sub_237F6F330(&qword_2568B6370);
  sub_237F7CC94(v7, v9, v10, v8);
  sub_237F867D8();
  swift_retain();
  sub_237F86708(a2, v7);
  swift_endAccess();
  v11 = v3 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_trackingNumberContinutation;
  v12 = sub_237F6F330(&qword_2568B6360);
  v13 = *(_QWORD *)(v12 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v11, a3, v12);
  swift_release();
  v14 = sub_237F85CEC(a1);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a3, v12);
  sub_237F86750(a2);
  return v14;
}

uint64_t sub_237F8647C()
{
  sub_237F6F330(&qword_2568B6360);
  return AsyncThrowingStream.Continuation.finish(throwing:)();
}

uint64_t sub_237F864C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_237F86750(v0 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_storageReferenceContinuation);
  v1 = v0 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_trackingNumberContinutation;
  v2 = sub_237F6F330(&qword_2568B6360);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

uint64_t sub_237F86514()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_237F85D34();
  sub_237F86750(v0 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_storageReferenceContinuation);
  v1 = v0 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_trackingNumberContinutation;
  v2 = sub_237F6F330(&qword_2568B6360);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_237F86580()
{
  return type metadata accessor for UploadRequestContext();
}

uint64_t type metadata accessor for UploadRequestContext()
{
  uint64_t result;

  result = qword_2568B6C40;
  if (!qword_2568B6C40)
    return swift_getSingletonMetadata();
  return result;
}

void sub_237F865C0()
{
  unint64_t v0;
  unint64_t v1;

  sub_237F86648();
  if (v0 <= 0x3F)
  {
    sub_237F866A0();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_237F86648()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2568B6C50)
  {
    sub_237F791B4(&qword_2568B6370);
    v0 = type metadata accessor for Optional();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2568B6C50);
  }
}

void sub_237F866A0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2568B6C58[0])
  {
    sub_237F791B4(&qword_2568B62F8);
    v0 = type metadata accessor for AsyncThrowingStream.Continuation();
    if (!v1)
      atomic_store(v0, qword_2568B6C58);
  }
}

uint64_t sub_237F86708(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_237F6F330(&qword_2568B6368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_237F86750(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_237F6F330(&qword_2568B6368);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_237F86790(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_237F6F330(&qword_2568B6368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_237F867D8()
{
  return swift_beginAccess();
}

void sub_237F867E4(uint64_t a1, uint64_t (*a2)(_QWORD, char *), uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;
  char *v35;
  uint64_t v36;
  uint64_t (*v37)(_QWORD, char *);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;

  v37 = a2;
  v38 = a3;
  v36 = sub_237F6F330(&qword_2568B6F38);
  v5 = MEMORY[0x24BDAC7A8](v36);
  v35 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v34 = (uint64_t *)((char *)&v30 - v8);
  MEMORY[0x24BDAC7A8](v7);
  v33 = (char *)&v30 - v9;
  v10 = *(_QWORD *)(a1 + 16);
  if (v10)
  {
    v30 = v3;
    v42 = MEMORY[0x24BEE4AF8];
    sub_237F7B188();
    v11 = sub_237F7BCF0(a1);
    if ((v11 & 0x8000000000000000) == 0)
    {
      v13 = v11;
      if (v11 < 1 << *(_BYTE *)(a1 + 32))
      {
        v14 = a1 + 64;
        v31 = a1 + 64;
        v32 = a1;
        while ((*(_QWORD *)(v14 + 8 * (v13 >> 6)) & (1 << v13)) != 0)
        {
          if ((_DWORD)v12 != *(_DWORD *)(a1 + 36))
            goto LABEL_20;
          v40 = v12;
          v41 = v13 >> 6;
          v39 = v10;
          v15 = v36;
          v16 = v33;
          v17 = &v33[*(int *)(v36 + 48)];
          v18 = *(_QWORD *)(a1 + 56);
          v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v13);
          v20 = type metadata accessor for AssetUploadRequest();
          v21 = *(_QWORD *)(v20 - 8);
          v22 = v18 + *(_QWORD *)(v21 + 72) * v13;
          v23 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
          v23(v17, v22, v20);
          *v16 = v19;
          v24 = (uint64_t)v34;
          *v34 = v19;
          v23((char *)(v24 + *(int *)(v15 + 48)), (uint64_t)v17, v20);
          v25 = v35;
          sub_237F89688(v24, (uint64_t)v35, &qword_2568B6F38);
          sub_237F896C8((uint64_t)v16, &qword_2568B6F38);
          v26 = v37(*(_QWORD *)v25, &v25[*(int *)(v15 + 48)]);
          sub_237F896C8((uint64_t)v25, &qword_2568B6F38);
          v27 = v42;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_237F7B188();
            v27 = v42;
          }
          v28 = *(_QWORD *)(v27 + 16);
          a1 = v32;
          if (v28 >= *(_QWORD *)(v27 + 24) >> 1)
          {
            sub_237F7B188();
            v27 = v42;
          }
          *(_QWORD *)(v27 + 16) = v28 + 1;
          *(_QWORD *)(v27 + 8 * v28 + 32) = v26;
          if ((uint64_t)v13 >= -(-1 << *(_BYTE *)(a1 + 32)))
            goto LABEL_21;
          v14 = v31;
          if ((*(_QWORD *)(v31 + 8 * v41) & (1 << v13)) == 0)
            goto LABEL_22;
          if ((_DWORD)v40 != *(_DWORD *)(a1 + 36))
            goto LABEL_23;
          v29 = _HashTable.occupiedBucket(after:)();
          v10 = v39 - 1;
          if (v39 == 1)
            return;
          v13 = v29;
          if ((v29 & 0x8000000000000000) == 0)
          {
            v12 = *(unsigned int *)(a1 + 36);
            if (v29 < 1 << *(_BYTE *)(a1 + 32))
              continue;
          }
          goto LABEL_24;
        }
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
      }
    }
LABEL_24:
    __break(1u);
  }
}

uint64_t sub_237F86AEC(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  _BOOL8 v25;
  Swift::Int v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  char v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t result;
  uint64_t v48;
  void (*v49)(_QWORD, _QWORD, _QWORD);
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  _QWORD *v59;
  uint64_t *v60;
  __int128 v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;

  v5 = type metadata accessor for AssetUploadRequest();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = sub_237F6F330(&qword_2568B6498);
  v52 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v60 = (uint64_t *)((char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = *(_QWORD *)(a1 + 16);
  if (v10)
  {
    v48 = v2;
    v68 = MEMORY[0x24BEE4AF8];
    sub_237F7B1E8(0, v10, 0);
    v11 = a1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v59 = a2 + 4;
    v50 = *(_QWORD *)(v6 + 72);
    v12 = *(void (**)(_QWORD, _QWORD, _QWORD))(v6 + 16);
    v51 = a2;
    v54 = v6;
    v58 = v8;
    v49 = v12;
    while (1)
    {
      v57 = v11;
      v12(v8, v11, v5);
      v13 = (void *)a2[2];
      objc_msgSend(v13, sel_lock);
      v14 = a2[3];
      if (__OFADD__(v14, 1))
        break;
      v55 = v13;
      v56 = v10;
      a2[3] = v14 + 1;
      swift_beginAccess();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v67 = (_QWORD *)a2[4];
      v16 = v67;
      a2[4] = 0x8000000000000000;
      v65 = v5;
      sub_237F6FB4C(&qword_2568B6F40, (uint64_t (*)(uint64_t))MEMORY[0x24BE17018], MEMORY[0x24BE17010]);
      v18 = v17;
      v66 = v17;
      v19 = sub_237F84C18((uint64_t *)&v64);
      v20 = v8;
      v21 = v5;
      v12(v19, v20, v5);
      v22 = sub_237F792D8(v14);
      v24 = v16[2];
      v25 = (v23 & 1) == 0;
      v26 = v24 + v25;
      if (__OFADD__(v24, v25))
        goto LABEL_21;
      v27 = v22;
      v28 = v23;
      sub_237F6F330(&qword_2568B6430);
      if (_NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v26))
      {
        v29 = sub_237F792D8(v14);
        if ((v28 & 1) != (v30 & 1))
          goto LABEL_23;
        v27 = v29;
      }
      v31 = v67;
      if ((v28 & 1) != 0)
      {
        v32 = v67[7] + 40 * v27;
        sub_237F6FBF0(v32);
        sub_237F7C334(&v64, v32);
      }
      else
      {
        v33 = sub_237F84C54((uint64_t)&v64, v65);
        MEMORY[0x24BDAC7A8](v33);
        v35 = (char *)&v48 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v36 + 16))(v35);
        v62 = v21;
        v63 = v18;
        v37 = sub_237F84C18((uint64_t *)&v61);
        (*(void (**)(uint64_t *, char *, uint64_t))(v54 + 32))(v37, v35, v21);
        v31[(v27 >> 6) + 8] |= 1 << v27;
        *(_QWORD *)(v31[6] + 8 * v27) = v14;
        sub_237F7C334(&v61, v31[7] + 40 * v27);
        v38 = v31[2];
        v39 = __OFADD__(v38, 1);
        v40 = v38 + 1;
        if (v39)
          goto LABEL_22;
        v31[2] = v40;
        sub_237F6FBF0((uint64_t)&v64);
        v31 = v67;
      }
      v41 = v60;
      v42 = (char *)v60 + *(int *)(v53 + 48);
      *v59 = v31;
      swift_bridgeObjectRelease();
      swift_endAccess();
      objc_msgSend(v55, sel_unlock);
      v5 = v21;
      (*(void (**)(char *, uint64_t))(v54 + 8))(v58, v21);
      *v41 = v14;
      v43 = v57;
      v12 = v49;
      v49(v42, v57, v21);
      v44 = v68;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_237F7B1E8(0, *(_QWORD *)(v44 + 16) + 1, 1);
        v44 = v68;
      }
      v46 = *(_QWORD *)(v44 + 16);
      v45 = *(_QWORD *)(v44 + 24);
      v8 = v58;
      if (v46 >= v45 >> 1)
      {
        sub_237F7B1E8(v45 > 1, v46 + 1, 1);
        v44 = v68;
      }
      *(_QWORD *)(v44 + 16) = v46 + 1;
      sub_237F89688((uint64_t)v60, v44+ ((*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80))+ *(_QWORD *)(v52 + 72) * v46, &qword_2568B6498);
      v11 = v43 + v50;
      v10 = v56 - 1;
      a2 = v51;
      if (v56 == 1)
      {
        swift_release();
        return v44;
      }
    }
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
  }
  else
  {
    swift_release();
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

void sub_237F86FB0(uint64_t a1, uint64_t (*a2)(char *, uint64_t, uint64_t, unint64_t), uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(char *, uint64_t, uint64_t, unint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v31 = a2;
  v32 = a3;
  v5 = sub_237F6F330(&qword_2568B6458);
  v29 = *(_QWORD *)(v5 - 8);
  v30 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a1 + 16);
  if (v8)
  {
    v35 = v3;
    v36 = MEMORY[0x24BEE4AF8];
    sub_237F7B1BC(0, v8, 0);
    v9 = v36;
    v10 = sub_237F7BCF0(a1);
    if ((v10 & 0x8000000000000000) == 0)
    {
      v12 = v10;
      if (v10 < 1 << *(_BYTE *)(a1 + 32))
      {
        v13 = a1 + 64;
        v27 = a1 + 64;
        v28 = a1;
        while (1)
        {
          v34 = v8;
          if ((*(_QWORD *)(v13 + 8 * (v12 >> 6)) & (1 << v12)) == 0)
            break;
          if ((_DWORD)v11 != *(_DWORD *)(a1 + 36))
            goto LABEL_20;
          v33 = v11;
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v12);
          v15 = (uint64_t *)(*(_QWORD *)(a1 + 56) + 16 * v12);
          v16 = (uint64_t *)v7;
          v18 = *v15;
          v17 = v15[1];
          v19 = (char *)v16 + *(int *)(v30 + 48);
          sub_237F7C1D8(*v15, v17);
          v20 = v35;
          v21 = v31(v19, v14, v18, v17);
          v35 = v20;
          if (v20)
          {
            sub_237F6F63C(v18, v17);
            swift_release();
            return;
          }
          v22 = v21;
          sub_237F6F63C(v18, v17);
          *v16 = v22;
          v36 = v9;
          v24 = *(_QWORD *)(v9 + 16);
          v23 = *(_QWORD *)(v9 + 24);
          v7 = (char *)v16;
          if (v24 >= v23 >> 1)
          {
            sub_237F7B1BC(v23 > 1, v24 + 1, 1);
            v9 = v36;
          }
          *(_QWORD *)(v9 + 16) = v24 + 1;
          sub_237F89688((uint64_t)v16, v9+ ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80))+ *(_QWORD *)(v29 + 72) * v24, &qword_2568B6458);
          a1 = v28;
          if ((uint64_t)v12 >= -(-1 << *(_BYTE *)(v28 + 32)))
            goto LABEL_21;
          v13 = v27;
          if ((*(_QWORD *)(v27 + 8 * (v12 >> 6)) & (1 << v12)) == 0)
            goto LABEL_22;
          if ((_DWORD)v33 != *(_DWORD *)(v28 + 36))
            goto LABEL_23;
          v25 = _HashTable.occupiedBucket(after:)();
          v8 = v34 - 1;
          if (v34 == 1)
            return;
          v12 = v25;
          if ((v25 & 0x8000000000000000) == 0)
          {
            v11 = *(unsigned int *)(a1 + 36);
            if (v25 < 1 << *(_BYTE *)(a1 + 32))
              continue;
          }
          goto LABEL_24;
        }
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
      }
    }
LABEL_24:
    __break(1u);
  }
}

uint64_t sub_237F87240(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[9] = a1;
  v2[10] = v1;
  v3 = type metadata accessor for TaskPriority();
  v2[11] = v3;
  v2[12] = *(_QWORD *)(v3 - 8);
  v2[13] = swift_task_alloc();
  sub_237F6FDBC();
  return swift_task_switch();
}

uint64_t sub_237F8729C()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
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
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v22;
  uint64_t v23;
  os_log_type_t type;
  uint64_t v25[2];

  if (qword_2568B5DE0 != -1)
    swift_once();
  v1 = type metadata accessor for Logger();
  v0[14] = sub_237F787D0(v1, (uint64_t)qword_2568B6D00);
  swift_bridgeObjectRetain_n();
  v2 = Logger.logObject.getter();
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    type = v3;
    v4 = v0[13];
    v23 = v0[12];
    v22 = v0[11];
    v5 = sub_237F7C528();
    v25[0] = sub_237F7C528();
    *(_DWORD *)v5 = 136315394;
    v6 = type metadata accessor for AssetUploadRequest();
    v7 = swift_bridgeObjectRetain();
    v8 = MEMORY[0x23B828958](v7, v6);
    v10 = v9;
    swift_bridgeObjectRelease();
    v0[7] = sub_237F787F8(v8, v10, v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_237F7C5D4();
    *(_WORD *)(v5 + 12) = 2080;
    static Task<>.currentPriority.getter();
    sub_237F6FB4C(&qword_2568B6298, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6990], MEMORY[0x24BEE69A0]);
    v11 = dispatch thunk of CustomStringConvertible.description.getter();
    v13 = v12;
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v4, v22);
    v0[8] = sub_237F787F8(v11, v13, v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237F6A000, v2, type, "processing %s with priority %s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    sub_237F7C51C();
  }
  sub_237F7C5D4();

  v14 = v0[9];
  v15 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(v0[10] + 16) + 24)
                   + OBJC_IVAR____TtC16CloudAssetDaemon13TenantContext_requestTracker);
  v0[15] = v15;
  swift_retain_n();
  v16 = sub_237F86AEC(v14, v15);
  v17 = sub_237F720BC(v16);
  v18 = sub_237F7BC24(v17);
  v0[16] = v18;
  type metadata accessor for Registerer.OptionsBuilder();
  *(_QWORD *)(swift_initStackObject() + 16) = v17;
  v19 = sub_237F87EF4();
  v0[17] = v19;
  sub_237F701AC();
  v20 = (_QWORD *)swift_task_alloc();
  v0[18] = v20;
  *v20 = v0;
  v20[1] = sub_237F875A8;
  return sub_237F88938(v18, v19);
}

uint64_t sub_237F875A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 152) = a1;
  *(_QWORD *)(v3 + 160) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    sub_237F70068();
  }
  sub_237F6FDBC();
  return sub_237F84D54();
}

uint64_t sub_237F87614()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  swift_bridgeObjectRetain_n();
  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)sub_237F7C528();
    v14 = sub_237F7C528();
    *(_DWORD *)v3 = 136315138;
    v4 = type metadata accessor for AssetUploadRequest();
    v5 = swift_bridgeObjectRetain();
    v6 = MEMORY[0x23B828958](v5, v4);
    v8 = v7;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 48) = sub_237F787F8(v6, v8, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_237F7C5D4();
    _os_log_impl(&dword_237F6A000, v1, v2, "finish processing %s", v3, 0xCu);
    swift_arrayDestroy();
    sub_237F7C51C();
  }
  sub_237F7C5D4();

  v9 = *(_QWORD *)(v0 + 160);
  sub_237F86FB0(*(_QWORD *)(v0 + 152), (uint64_t (*)(char *, uint64_t, uint64_t, unint64_t))sub_237F89510, *(_QWORD *)(v0 + 120));
  if (v9)
  {
    sub_237F70068();
    sub_237F701AC();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v12 = v10;
    sub_237F701AC();
    v13 = sub_237F720E0(v12);
    sub_237F70068();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v13);
  }
}

uint64_t sub_237F8780C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_237F70068();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_237F87858()
{
  Asset.Protector.securityKey.getter();
  __asm { BR              X10 }
}

uint64_t sub_237F8789C()
{
  uint64_t v0;
  unint64_t v1;
  CFDataRef v2;
  void *v3;
  uint64_t v4;

  v2 = sub_237F895B0(v0, v1 & 0xFFFFFFFFFFFFLL, BYTE6(v1));
  sub_237F6F63C(v0, v1);
  v3 = (void *)MMCSReferenceSignatureCreateWithReferenceObject();

  if (!v3)
  {
    __break(1u);
    JUMPOUT(0x237F879ACLL);
  }
  v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
}

uint64_t sub_237F879BC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];

  v5[2] = *v0;
  v1 = swift_bridgeObjectRetain();
  sub_237F867E4(v1, (uint64_t (*)(_QWORD, char *))sub_237F89680, (uint64_t)v5);
  v3 = v2;
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_237F87A20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void (*v11)(char *, uint64_t);
  unint64_t v12;
  uint64_t inited;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t result;
  __int128 v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  __int128 v55;
  _QWORD v56[29];

  v52 = a3;
  v4 = type metadata accessor for Asset.Protector();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssetUploadRequest.protector.getter();
  v8 = Asset.Protector.securityKey.getter();
  v10 = v9;
  v11 = *(void (**)(char *, uint64_t))(v5 + 8);
  v11(v7, v4);
  AssetUploadRequest.protector.getter();
  v53 = Asset.Protector.privacyKey.getter();
  v54 = v12;
  v11(v7, v4);
  sub_237F6F330(&qword_2568B6388);
  inited = swift_initStackObject();
  v55 = xmmword_237F8B2A0;
  *(_OWORD *)(inited + 16) = xmmword_237F8B2A0;
  if (!*MEMORY[0x24BE633F0])
  {
    __break(1u);
    goto LABEL_16;
  }
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 40) = v14;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 48) = a1;
  v15 = Dictionary.init(dictionaryLiteral:)();
  v16 = v8;
  if ((sub_237F70A3C(v8, v10) & 1) == 0)
  {
    v50 = v8;
    v51 = v10;
    v24 = swift_initStackObject();
    v49 = xmmword_237F8B2B0;
    *(_OWORD *)(v24 + 16) = xmmword_237F8B2B0;
    if (*MEMORY[0x24BE634A0])
    {
      *(_QWORD *)(v24 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
      *(_QWORD *)(v24 + 40) = v25;
      sub_237F6F330(&qword_2568B63A8);
      v26 = swift_initStackObject();
      *(_OWORD *)(v26 + 16) = v49;
      if (*MEMORY[0x24BE633F8])
      {
        *(_QWORD *)(v26 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
        *(_QWORD *)(v26 + 40) = v27;
        v29 = v50;
        v28 = v51;
        *(_QWORD *)(v26 + 48) = v50;
        *(_QWORD *)(v26 + 56) = v28;
        if (*MEMORY[0x24BE63400])
        {
          *(_QWORD *)(v26 + 64) = static String._unconditionallyBridgeFromObjectiveC(_:)();
          *(_QWORD *)(v26 + 72) = v30;
          sub_237F7C1D8(v29, v28);
          AssetUploadRequest.protector.getter();
          sub_237F87858();
          v32 = v31;
          v34 = v33;
          v11(v7, v4);
          *(_QWORD *)(v26 + 80) = v32;
          *(_QWORD *)(v26 + 88) = v34;
          v35 = Dictionary.init(dictionaryLiteral:)();
          *(_QWORD *)(v24 + 72) = sub_237F6F330(&qword_2568B63B0);
          *(_QWORD *)(v24 + 48) = v35;
          if (*MEMORY[0x24BE63408])
          {
            *(_QWORD *)(v24 + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
            *(_QWORD *)(v24 + 88) = v36;
            *(_QWORD *)(v24 + 120) = MEMORY[0x24BEE1328];
            *(_BYTE *)(v24 + 96) = 1;
            v37 = Dictionary.init(dictionaryLiteral:)();
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v56[0] = v15;
            sub_237F845C0(v37, (uint64_t)sub_237F7A5D4, 0, isUniquelyReferenced_nonNull_native, (uint64_t)v56);
            v22 = v53;
            v21 = v54;
            v23 = v56[0];
            swift_bridgeObjectRelease();
            v16 = v50;
            v10 = v51;
            goto LABEL_10;
          }
LABEL_20:
          __break(1u);
          goto LABEL_21;
        }
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
LABEL_18:
      __break(1u);
      goto LABEL_19;
    }
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v17 = swift_initStackObject();
  *(_OWORD *)(v17 + 16) = v55;
  if (!*MEMORY[0x24BE63410])
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  *(_QWORD *)(v17 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(v17 + 40) = v18;
  *(_QWORD *)(v17 + 72) = MEMORY[0x24BEE1328];
  *(_BYTE *)(v17 + 48) = 1;
  v19 = Dictionary.init(dictionaryLiteral:)();
  v20 = swift_isUniquelyReferenced_nonNull_native();
  v56[0] = v15;
  sub_237F845C0(v19, (uint64_t)sub_237F7A5D4, 0, v20, (uint64_t)v56);
  v22 = v53;
  v21 = v54;
  v23 = v56[0];
  swift_bridgeObjectRelease();
LABEL_10:
  if ((sub_237F70A3C(v22, v21) & 1) != 0)
  {
    v39 = v16;
    v40 = v10;
LABEL_14:
    sub_237F6F63C(v39, v40);
    sub_237F6F63C(v22, v21);
    return v23;
  }
  v41 = v16;
  v42 = v10;
  sub_237F6F330(&qword_2568B63A8);
  v43 = swift_initStackObject();
  *(_OWORD *)(v43 + 16) = v55;
  if (*MEMORY[0x24BE633C0])
  {
    *(_QWORD *)(v43 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(_QWORD *)(v43 + 40) = v44;
    *(_QWORD *)(v43 + 48) = v22;
    *(_QWORD *)(v43 + 56) = v21;
    sub_237F7C1D8(v22, v21);
    Dictionary.init(dictionaryLiteral:)();
    sub_237F70CEC();
    v46 = v45;
    swift_bridgeObjectRelease();
    v47 = swift_isUniquelyReferenced_nonNull_native();
    v56[0] = v23;
    sub_237F845C0(v46, (uint64_t)sub_237F7A5D4, 0, v47, (uint64_t)v56);
    v23 = v56[0];
    swift_bridgeObjectRelease();
    v39 = v41;
    v40 = v42;
    goto LABEL_14;
  }
LABEL_21:
  __break(1u);
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_237F87EF4()
{
  uint64_t inited;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_237F6F330(&qword_2568B6388);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_237F8B510;
  result = *MEMORY[0x24BE63440];
  if (!*MEMORY[0x24BE63440])
  {
    __break(1u);
    goto LABEL_6;
  }
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 40) = v2;
  v3 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 48) = 1;
  result = *MEMORY[0x24BE63408];
  if (!*MEMORY[0x24BE63408])
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 88) = v4;
  *(_QWORD *)(inited + 120) = v3;
  *(_BYTE *)(inited + 96) = 1;
  result = *MEMORY[0x24BE63428];
  if (*MEMORY[0x24BE63428])
  {
    *(_QWORD *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(_QWORD *)(inited + 136) = v5;
    v6 = sub_237F879BC();
    *(_QWORD *)(inited + 168) = sub_237F6F330(&qword_2568B6390);
    *(_QWORD *)(inited + 144) = v6;
    return Dictionary.init(dictionaryLiteral:)();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_237F87FF0()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_237F88014()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  sub_237F7C3B8(v0, qword_2568B6D00);
  sub_237F787D0(v0, (uint64_t)qword_2568B6D00);
  static LoggerSubsystem.server.getter();
  type metadata accessor for Registerer();
  sub_237F6F330(&qword_2568B6F48);
  String.init<A>(describing:)();
  return Logger.init(subsystem:category:)();
}

uint64_t sub_237F880AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v1 + 16) = sub_237F7C528();
  v3 = v1 + OBJC_IVAR____TtCC16CloudAssetDaemon10Registerer7Context_continutation;
  v4 = sub_237F6F330(&qword_2568B6F30);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, a1, v4);
  **(_QWORD **)(v1 + 16) = v1;
  swift_retain();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v1;
}

void sub_237F88148()
{
  sub_237F7C51C();
}

uint64_t sub_237F8815C()
{
  uint64_t v0;

  v0 = sub_237F6F330(&qword_2568B6F30);
  sub_237F8972C(v0);
  return swift_deallocClassInstance();
}

uint64_t sub_237F88194(uint64_t *a1, uint64_t a2, _DWORD *a3, _QWORD *a4)
{
  uint64_t v7;
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
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  int v22;
  int v23;
  uint64_t v24;
  os_log_type_t v25;
  uint8_t *v26;
  int v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  char *v32;
  _DWORD *v33;
  uint64_t v34;
  uint64_t v35[5];

  v33 = a3;
  v7 = type metadata accessor for URL();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_237F6F330(&qword_2568B6F50);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for AssetUploadRequest();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  MEMORY[0x24BDAC7A8](v16);
  if (!a1)
  {
    if (qword_2568B5DE0 != -1)
      swift_once();
    v18 = type metadata accessor for Logger();
    sub_237F787D0(v18, (uint64_t)qword_2568B6D00);
    v19 = Logger.logObject.getter();
    v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_237F6A000, v19, v20, "context for registering assets can not be loaded", v21, 2u);
      MEMORY[0x23B828FE8](v21, -1, -1);
    }
    goto LABEL_12;
  }
  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  v31 = a4;
  v32 = (char *)&v30 - v17;
  v34 = *a1;
  swift_retain();
  sub_237F84F54(a2, (uint64_t)v35);
  sub_237F6F330(&qword_2568B6400);
  v22 = swift_dynamicCast();
  sub_237F6C9A4((uint64_t)v13, v22 ^ 1u, 1, v14);
  v23 = sub_237F6C928((uint64_t)v13, 1, v14);
  if (v23 == 1)
  {
    sub_237F896C8((uint64_t)v13, &qword_2568B6F50);
    if (qword_2568B5DE0 == -1)
    {
LABEL_10:
      v24 = type metadata accessor for Logger();
      sub_237F787D0(v24, (uint64_t)qword_2568B6D00);
      v19 = Logger.logObject.getter();
      v25 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v19, v25))
      {

        swift_release();
        return 0;
      }
      v26 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v26 = 134349056;
      v35[0] = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_237F6A000, v19, v25, "asset request with tracking number %{public}llu can not be found", v26, 0xCu);
      MEMORY[0x23B828FE8](v26, -1, -1);
      swift_release();
LABEL_12:

      return 0;
    }
LABEL_22:
    swift_once();
    goto LABEL_10;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v32, v13, v14);
  AssetUploadRequest.fileURL.getter();
  URL.path(percentEncoded:)(1);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v28 = sub_237F888A4();
  swift_release();
  if (v33)
    *v33 = v28;
  v29 = v31;
  if (v31)
  {
    *v29 = MEMORY[0x23B8288A4](6584422, 0xE300000000000000);
    swift_release();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v32, v14);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v32, v14);
    swift_release();
  }
  return 1;
}

uint64_t sub_237F888A4()
{
  uint64_t v0;
  _DWORD *v1;

  v0 = static FileDescriptor._open(_:_:options:permissions:retryOnInterrupt:)();
  if ((v0 & 0x100000000) != 0)
  {
    sub_237F896F0();
    swift_willThrowTypedImpl();
    swift_allocError();
    *v1 = v0;
  }
  return v0;
}

uint64_t sub_237F88920(uint64_t *a1, uint64_t a2, _DWORD *a3, _QWORD *a4)
{
  return sub_237F88194(a1, a2, a3, a4);
}

uint64_t sub_237F88938(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 24) = a2;
  *(_QWORD *)(v3 + 32) = v2;
  return swift_task_switch();
}

uint64_t sub_237F88950()
{
  uint64_t v0;
  int8x16_t *v1;
  _QWORD *v2;

  v1 = (int8x16_t *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  v1[1] = vextq_s8(*(int8x16_t *)(v0 + 24), *(int8x16_t *)(v0 + 24), 8uLL);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  sub_237F6F330(qword_2568B6E98);
  *v2 = v0;
  v2[1] = sub_237F88A00;
  sub_237F6FDBC();
  return withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

uint64_t sub_237F88A00()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  sub_237F6FDBC();
  return sub_237F84D54();
}

uint64_t sub_237F88A60()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_237F88A6C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_237F88AA0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  Class isa;
  uint64_t v7;

  v2 = sub_237F6F330(&qword_2568B6F30);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  type metadata accessor for Registerer.Context();
  swift_allocObject();
  sub_237F880AC((uint64_t)v4);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  MMCSRegisterItems();
  swift_release();

}

void sub_237F88B94(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  NSObject *oslog;
  __int128 v11;
  _OWORD v12[3];

  if (a1)
  {
    v2 = *a1;
    if (a2)
    {
      *(_QWORD *)&v11 = 0;
      swift_retain();
      static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
    }
    else
    {
      swift_retain();
    }
    memset(v12, 0, 32);
    sub_237F896C8((uint64_t)v12, &qword_2568B64C0);
    sub_237F77634();
    *(_QWORD *)&v12[0] = swift_allocError();
    sub_237F6F330(&qword_2568B6F30);
    CheckedContinuation.resume(throwing:)();
    if (qword_2568B5DE0 != -1)
      swift_once();
    v6 = type metadata accessor for Logger();
    sub_237F787D0(v6, (uint64_t)qword_2568B6D00);
    v7 = Logger.logObject.getter();
    v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_237F6A000, v7, v8, "mmcs engine returns nil results", v9, 2u);
      MEMORY[0x23B828FE8](v9, -1, -1);
    }

    MEMORY[0x23B828FE8](*(_QWORD *)(v2 + 16), -1, -1);
    swift_release();
  }
  else
  {
    if (qword_2568B5DE0 != -1)
      swift_once();
    v3 = type metadata accessor for Logger();
    sub_237F787D0(v3, (uint64_t)qword_2568B6D00);
    oslog = Logger.logObject.getter();
    v4 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_237F6A000, oslog, v4, "context for registering assets can not be loaded", v5, 2u);
      MEMORY[0x23B828FE8](v5, -1, -1);
    }

  }
}

void sub_237F8910C(uint64_t *a1, void *a2)
{
  id v4;

  v4 = a2;
  sub_237F88B94(a1, (uint64_t)a2);

}

uint64_t sub_237F8914C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
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
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  _BYTE v29[40];
  unint64_t v30;

  v30 = a4;
  v28 = a3;
  v26 = a1;
  v6 = type metadata accessor for URL();
  MEMORY[0x24BDAC7A8](v6);
  v27 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Asset.ID();
  MEMORY[0x24BDAC7A8](v8);
  v9 = type metadata accessor for Asset.Protector();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for AssetUploadRequest();
  v25 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237F84F54(a2, (uint64_t)v29);
  if (!v4)
  {
    sub_237F6F330(&qword_2568B6400);
    v23 = v13;
    swift_dynamicCast();
    type metadata accessor for Registerer.OptionsBuilder();
    v24 = a2;
    AssetUploadRequest.protector.getter();
    sub_237F87858();
    v17 = v16;
    v19 = v18;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    AssetUploadRequest.storageLocation.getter();
    sub_237F7C1D8(v28, v30);
    sub_237F7C1D8(v17, v19);
    Asset.ID.init(storageLocation:signature:referenceSignature:)();
    AssetUploadRequest.protector.getter();
    Asset.init(id:protector:size:)();
    v20 = v17;
    a2 = v24;
    sub_237F6F63C(v20, v19);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v15, v23);
  }
  return a2;
}

uint64_t type metadata accessor for Registerer()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for Registerer.OptionsBuilder()
{
  return objc_opt_self();
}

uint64_t sub_237F893E0()
{
  return type metadata accessor for Registerer.Context();
}

uint64_t type metadata accessor for Registerer.Context()
{
  uint64_t result;

  result = qword_2568B6E80;
  if (!qword_2568B6E80)
    return swift_getSingletonMetadata();
  return result;
}

void sub_237F89420()
{
  unint64_t v0;

  sub_237F8949C();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_237F8949C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2568B6E90)
  {
    sub_237F791B4(qword_2568B6E98);
    sub_237F791B4(&qword_2568B62F8);
    v0 = type metadata accessor for CheckedContinuation();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2568B6E90);
  }
}

uint64_t sub_237F89510(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_237F8914C(a1, a2, a3, a4);
}

CFDataRef sub_237F89528(uint64_t a1, uint64_t a2)
{
  CFDataRef result;
  const UInt8 *v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  CFIndex v9;
  CFIndex v10;

  result = (CFDataRef)__DataStorage._bytes.getter();
  v5 = (const UInt8 *)result;
  if (result)
  {
    result = (CFDataRef)__DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v5 += a1 - (_QWORD)result;
  }
  v6 = __OFSUB__(a2, a1);
  v7 = a2 - a1;
  if (v6)
  {
    __break(1u);
    goto LABEL_13;
  }
  v8 = __DataStorage._length.getter();
  if (v8 >= v7)
    v9 = v7;
  else
    v9 = v8;
  if (v5)
    v10 = v9;
  else
    v10 = 0;
  return CFDataCreate(0, v5, v10);
}

CFDataRef sub_237F895B0(uint64_t a1, uint64_t a2, CFIndex a3)
{
  uint64_t bytes;
  __int16 v5;
  char v6;
  char v7;
  char v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  bytes = a1;
  v5 = a2;
  v6 = BYTE2(a2);
  v7 = BYTE3(a2);
  v8 = BYTE4(a2);
  v9 = BYTE5(a2);
  return CFDataCreate(0, (const UInt8 *)&bytes, a3);
}

void sub_237F89678(uint64_t a1)
{
  sub_237F88AA0(a1);
}

uint64_t sub_237F89680(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_237F87A20(a1, a2, *(_QWORD *)(v2 + 16));
}

void sub_237F89688(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_237F6F330(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  sub_237F7028C();
}

void sub_237F896C8(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = sub_237F6F330(a2);
  sub_237F8972C(v2);
  sub_237F7028C();
}

unint64_t sub_237F896F0()
{
  unint64_t result;

  result = qword_2568B6F58;
  if (!qword_2568B6F58)
  {
    result = MEMORY[0x23B828F58](MEMORY[0x24BEE6000], MEMORY[0x24BEE5FF8]);
    atomic_store(result, (unint64_t *)&qword_2568B6F58);
  }
  return result;
}

uint64_t sub_237F8972C(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t Asset.ID.storageLocation.getter()
{
  return MEMORY[0x24BE16F78]();
}

uint64_t Asset.ID.init(storageLocation:signature:referenceSignature:)()
{
  return MEMORY[0x24BE16F80]();
}

uint64_t Asset.ID.referenceSignature.getter()
{
  return MEMORY[0x24BE16F88]();
}

uint64_t Asset.ID.signature.getter()
{
  return MEMORY[0x24BE16F90]();
}

uint64_t type metadata accessor for Asset.ID()
{
  return MEMORY[0x24BE16F98]();
}

uint64_t Asset.init(id:protector:size:)()
{
  return MEMORY[0x24BE16FA0]();
}

uint64_t Asset.id.getter()
{
  return MEMORY[0x24BE16FA8]();
}

uint64_t Asset.Protector.privacyKey.getter()
{
  return MEMORY[0x24BE16FB0]();
}

uint64_t Asset.Protector.securityKey.getter()
{
  return MEMORY[0x24BE16FB8]();
}

uint64_t type metadata accessor for Asset.Protector()
{
  return MEMORY[0x24BE16FC0]();
}

uint64_t Asset.protector.getter()
{
  return MEMORY[0x24BE16FC8]();
}

uint64_t type metadata accessor for Asset()
{
  return MEMORY[0x24BE16FD0]();
}

uint64_t AssetUploadRequest.credential.getter()
{
  return MEMORY[0x24BE16FE0]();
}

uint64_t AssetUploadRequest.tenantName.getter()
{
  return MEMORY[0x24BE16FE8]();
}

uint64_t AssetUploadRequest.storageLocation.getter()
{
  return MEMORY[0x24BE16FF0]();
}

uint64_t AssetUploadRequest.workingDirectory.getter()
{
  return MEMORY[0x24BE16FF8]();
}

uint64_t AssetUploadRequest.fileURL.getter()
{
  return MEMORY[0x24BE17000]();
}

uint64_t AssetUploadRequest.protector.getter()
{
  return MEMORY[0x24BE17008]();
}

uint64_t type metadata accessor for AssetUploadRequest()
{
  return MEMORY[0x24BE17018]();
}

uint64_t AssetDownloadRequest.tenantName.getter()
{
  return MEMORY[0x24BE17028]();
}

uint64_t AssetDownloadRequest.applicationID.getter()
{
  return MEMORY[0x24BE17030]();
}

uint64_t AssetDownloadRequest.storageReference.getter()
{
  return MEMORY[0x24BE17038]();
}

uint64_t AssetDownloadRequest.workingDirectory.getter()
{
  return MEMORY[0x24BE17040]();
}

uint64_t AssetDownloadRequest.storageReferenceSignature.getter()
{
  return MEMORY[0x24BE17048]();
}

uint64_t AssetDownloadRequest.id.getter()
{
  return MEMORY[0x24BE17050]();
}

uint64_t AssetDownloadRequest.asset.getter()
{
  return MEMORY[0x24BE17058]();
}

uint64_t AssetDownloadRequest.range.getter()
{
  return MEMORY[0x24BE17060]();
}

uint64_t type metadata accessor for AssetDownloadRequest()
{
  return MEMORY[0x24BE17070]();
}

uint64_t AssetDownloadResponse.init(id:asset:fileURL:range:)()
{
  return MEMORY[0x24BE17080]();
}

uint64_t dispatch thunk of AssetRequest.credential.getter()
{
  return MEMORY[0x24BE17098]();
}

uint64_t AssetSkeleton.init(asset:credential:storageReference:storageReferenceSignature:)()
{
  return MEMORY[0x24BE170A0]();
}

uint64_t type metadata accessor for AssetSkeleton()
{
  return MEMORY[0x24BE170A8]();
}

uint64_t Credential.accessToken.getter()
{
  return MEMORY[0x24BE170B8]();
}

uint64_t Credential.requestorID.getter()
{
  return MEMORY[0x24BE170C0]();
}

uint64_t type metadata accessor for Credential()
{
  return MEMORY[0x24BE170C8]();
}

uint64_t static LoggerSubsystem.server.getter()
{
  return MEMORY[0x24BE170D8]();
}

uint64_t type metadata accessor for UploadRequestMessage()
{
  return MEMORY[0x24BE170F0]();
}

uint64_t type metadata accessor for UploadResponseMessage()
{
  return MEMORY[0x24BE17128]();
}

uint64_t type metadata accessor for DownloadRequestMessage()
{
  return MEMORY[0x24BE17150]();
}

uint64_t type metadata accessor for DownloadResponseMessage()
{
  return MEMORY[0x24BE17178]();
}

uint64_t XPCAsyncSequenceRequest.id.getter()
{
  return MEMORY[0x24BE17190]();
}

uint64_t XPCAsyncSequenceRequest.data.getter()
{
  return MEMORY[0x24BE17198]();
}

uint64_t type metadata accessor for XPCAsyncSequenceRequest()
{
  return MEMORY[0x24BE171A0]();
}

uint64_t XPCAsyncSequenceResponse.init(id:event:)()
{
  return MEMORY[0x24BE171B8]();
}

uint64_t type metadata accessor for XPCAsyncSequenceResponse.Event()
{
  return MEMORY[0x24BE171D8]();
}

uint64_t type metadata accessor for XPCAsyncSequenceResponse()
{
  return MEMORY[0x24BE171E0]();
}

uint64_t type metadata accessor for SimultaneousTransferError()
{
  return MEMORY[0x24BE171F8]();
}

uint64_t Signal.init()()
{
  return MEMORY[0x24BE17208]();
}

uint64_t type metadata accessor for XPCError()
{
  return MEMORY[0x24BE17218]();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t JSONEncoder.init()()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return MEMORY[0x24BDCD7B8]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x24BDCD8D0](retstr);
}

uint64_t static URL.== infix(_:_:)()
{
  return MEMORY[0x24BDCD988]();
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1;
  void *v2;
  Swift::String result;

  v1 = MEMORY[0x24BDCD9E8](percentEncoded);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t URL.init(filePath:directoryHint:relativeTo:)()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t Data._copyContents(initializing:)()
{
  return MEMORY[0x24BDCDBF8]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t type metadata accessor for Data.Iterator()
{
  return MEMORY[0x24BDCDD78]();
}

uint64_t Data.Iterator.init(_:at:)()
{
  return MEMORY[0x24BDCDD88]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t dispatch thunk of XPCSession.send<A>(_:)()
{
  return MEMORY[0x24BEE6570]();
}

uint64_t dispatch thunk of XPCListener.IncomingSessionRequest.accept<A>(_:)()
{
  return MEMORY[0x24BEE6618]();
}

uint64_t XPCPeerHandler.handleCancellation(error:)()
{
  return MEMORY[0x24BEE66E8]();
}

uint64_t XPCReceivedMessage.auditToken.getter()
{
  return MEMORY[0x24BEE6728]();
}

uint64_t XPCReceivedMessage.decode<A>(as:)()
{
  return MEMORY[0x24BEE6750]();
}

uint64_t type metadata accessor for XPCReceivedMessage()
{
  return MEMORY[0x24BEE6760]();
}

uint64_t static FileDescriptor._open(_:_:options:permissions:retryOnInterrupt:)()
{
  return MEMORY[0x24BEE5F78]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x24BEE5500]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCF828]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t Dictionary.Keys.description.getter()
{
  return MEMORY[0x24BEE02C0]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x24BEE0980]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t String.index(after:)()
{
  return MEMORY[0x24BEE0B70]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x24BEE0BE8]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x24BEE0D98]();
}

{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t type metadata accessor for CheckedContinuation()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj()
{
  return MEMORY[0x24BEE68D8]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t static Task<>.currentPriority.getter()
{
  return MEMORY[0x24BEE6B18]();
}

uint64_t dispatch thunk of AsyncSequence.makeAsyncIterator()()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t AsyncThrowingStream.Continuation.yield(_:)()
{
  return MEMORY[0x24BEE6CC0]();
}

uint64_t AsyncThrowingStream.Continuation.finish(throwing:)()
{
  return MEMORY[0x24BEE6CC8]();
}

uint64_t type metadata accessor for AsyncThrowingStream.Continuation()
{
  return MEMORY[0x24BEE6CD0]();
}

uint64_t AsyncThrowingStream.makeAsyncIterator()()
{
  return MEMORY[0x24BEE6CE0]();
}

uint64_t _sScs8IteratorV4next9isolationxSgScA_pSgYi_tYaq_YKF()
{
  return MEMORY[0x24BEE6CE8]();
}

uint64_t AsyncThrowingStream.init<>(_:bufferingPolicy:_:)()
{
  return MEMORY[0x24BEE6D30]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t StringProtocol.cString(using:)()
{
  return MEMORY[0x24BDD0618]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t _HashTable.occupiedBucket(after:)()
{
  return MEMORY[0x24BEE22D8]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t AsyncMapSequence.base.getter()
{
  return MEMORY[0x24BEE6EB0]();
}

uint64_t AsyncMapSequence.Iterator.baseIterator.modify()
{
  return MEMORY[0x24BEE6EB8]();
}

uint64_t AsyncMapSequence.Iterator.transform.getter()
{
  return MEMORY[0x24BEE6EC0]();
}

uint64_t AsyncMapSequence.Iterator.init(_:transform:)()
{
  return MEMORY[0x24BEE6ED8]();
}

uint64_t AsyncMapSequence.transform.getter()
{
  return MEMORY[0x24BEE6EE8]();
}

uint64_t AsyncMapSequence.init(_:transform:)()
{
  return MEMORY[0x24BEE6F00]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x24BEE2E58](isUnique, capacity);
}

Swift::Void __swiftcall _NativeDictionary.copy()()
{
  MEMORY[0x24BEE2E68]();
}

uint64_t _NativeDictionary._delete(at:)()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

{
  return MEMORY[0x24BEE2F48]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t withCheckedThrowingContinuation<A>(isolation:function:_:)()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

uint64_t MMCSEngineCreateWithTargetDispatchQueue()
{
  return MEMORY[0x24BE63340]();
}

uint64_t MMCSGetItems()
{
  return MEMORY[0x24BE63368]();
}

uint64_t MMCSPutItems()
{
  return MEMORY[0x24BE63380]();
}

uint64_t MMCSReferenceSignatureCreateWithReferenceObject()
{
  return MEMORY[0x24BE63388]();
}

uint64_t MMCSRegisterItems()
{
  return MEMORY[0x24BE63390]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
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

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x24BDAFC10]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

