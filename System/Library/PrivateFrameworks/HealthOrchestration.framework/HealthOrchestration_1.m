uint64_t dispatch thunk of MockDispatchTarget.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_23DEFB69C(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

BOOL static WorkPlanIdentifier.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v5;
  _BOOL8 result;

  v2 = a1[2];
  v3 = a2[2];
  if (*a1 == *a2 && a1[1] == a2[1])
    return v2 == v3;
  v5 = sub_23DF15400();
  result = 0;
  if ((v5 & 1) != 0)
    return v2 == v3;
  return result;
}

HealthOrchestration::WorkPlanIdentifier __swiftcall WorkPlanIdentifier.init(domain:code:)(Swift::String domain, Swift::Int code)
{
  Swift::String *v2;
  HealthOrchestration::WorkPlanIdentifier result;

  *v2 = domain;
  v2[1]._countAndFlagsBits = code;
  result.domain = domain;
  result.code = code;
  return result;
}

uint64_t WorkPlanIdentifier.domain.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WorkPlanIdentifier.domain.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*WorkPlanIdentifier.domain.modify())()
{
  return nullsub_1;
}

uint64_t WorkPlanIdentifier.code.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t WorkPlanIdentifier.code.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*WorkPlanIdentifier.code.modify())()
{
  return nullsub_1;
}

void static WorkPlanIdentifier.singleWorkPlanIdentifier.getter(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "SingleWorkPlan");
  *(_BYTE *)(a1 + 15) = -18;
  *(_QWORD *)(a1 + 16) = 0;
}

uint64_t WorkPlanIdentifier.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_23DF14E3C();
  swift_bridgeObjectRelease();
  return sub_23DF15484();
}

uint64_t sub_23DEFB870()
{
  _BYTE *v0;

  if (*v0)
    return 1701080931;
  else
    return 0x6E69616D6F64;
}

uint64_t sub_23DEFB8A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23DEFC300(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23DEFB8C4()
{
  sub_23DEFBA44();
  return sub_23DF154CC();
}

uint64_t sub_23DEFB8EC()
{
  sub_23DEFBA44();
  return sub_23DF154D8();
}

uint64_t WorkPlanIdentifier.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[2];
  char v12;
  char v13;

  sub_23DEFBDE0(0, &qword_256D0FD28, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x24BEE3520]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v6);
  v8 = (char *)v11 - v7;
  v11[0] = *(_QWORD *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DEFBA44();
  sub_23DF154C0();
  v13 = 0;
  v9 = v11[1];
  sub_23DF15364();
  if (!v9)
  {
    v12 = 1;
    sub_23DF1537C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

unint64_t sub_23DEFBA44()
{
  unint64_t result;

  result = qword_256D0FD30;
  if (!qword_256D0FD30)
  {
    result = MEMORY[0x2426483D0](&unk_23DF1B1A0, &type metadata for WorkPlanIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D0FD30);
  }
  return result;
}

uint64_t WorkPlanIdentifier.hashValue.getter()
{
  sub_23DF15478();
  swift_bridgeObjectRetain();
  sub_23DF14E3C();
  swift_bridgeObjectRelease();
  sub_23DF15484();
  return sub_23DF154A8();
}

uint64_t WorkPlanIdentifier.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v16;
  char v17;
  char v18;

  sub_23DEFBDE0(0, &qword_256D0FD38, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x24BEE33E0]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v8);
  v10 = (char *)&v16 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DEFBA44();
  sub_23DF154B4();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v18 = 0;
  v11 = sub_23DF15310();
  v13 = v12;
  v17 = 1;
  swift_bridgeObjectRetain();
  v14 = sub_23DF15328();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  *a2 = v11;
  a2[1] = v13;
  a2[2] = v14;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DEFBC84@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return WorkPlanIdentifier.init(from:)(a1, a2);
}

uint64_t sub_23DEFBC98(_QWORD *a1)
{
  return WorkPlanIdentifier.encode(to:)(a1);
}

uint64_t sub_23DEFBCAC()
{
  sub_23DF15478();
  swift_bridgeObjectRetain();
  sub_23DF14E3C();
  swift_bridgeObjectRelease();
  sub_23DF15484();
  return sub_23DF154A8();
}

uint64_t sub_23DEFBD1C()
{
  swift_bridgeObjectRetain();
  sub_23DF14E3C();
  swift_bridgeObjectRelease();
  return sub_23DF15484();
}

uint64_t sub_23DEFBD74()
{
  sub_23DF15478();
  swift_bridgeObjectRetain();
  sub_23DF14E3C();
  swift_bridgeObjectRelease();
  sub_23DF15484();
  return sub_23DF154A8();
}

void sub_23DEFBDE0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_23DEFBA44();
    v7 = a3(a1, &type metadata for WorkPlanIdentifier.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

BOOL sub_23DEFBE3C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v5;
  _BOOL8 result;

  v2 = a1[2];
  v3 = a2[2];
  if (*a1 == *a2 && a1[1] == a2[1])
    return v2 == v3;
  v5 = sub_23DF15400();
  result = 0;
  if ((v5 & 1) != 0)
    return v2 == v3;
  return result;
}

uint64_t WorkPlanIdentifier.description.getter()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_bridgeObjectRetain();
  sub_23DF14E60();
  sub_23DF153C4();
  sub_23DF14E60();
  swift_bridgeObjectRelease();
  sub_23DF14E60();
  return v2;
}

unint64_t sub_23DEFBF1C()
{
  unint64_t result;

  result = qword_25432D538[0];
  if (!qword_25432D538[0])
  {
    result = MEMORY[0x2426483D0](&protocol conformance descriptor for WorkPlanIdentifier, &type metadata for WorkPlanIdentifier);
    atomic_store(result, qword_25432D538);
  }
  return result;
}

uint64_t sub_23DEFBF60()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_bridgeObjectRetain();
  sub_23DF14E60();
  sub_23DF153C4();
  sub_23DF14E60();
  swift_bridgeObjectRelease();
  sub_23DF14E60();
  return v2;
}

_QWORD *sub_23DEFBFE8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for WorkPlanIdentifier(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

_QWORD *assignWithTake for WorkPlanIdentifier(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkPlanIdentifier(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for WorkPlanIdentifier(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for WorkPlanIdentifier()
{
  return &type metadata for WorkPlanIdentifier;
}

uint64_t dispatch thunk of WorkPlan.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of WorkPlan.priority.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of WorkPlan.merged(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t storeEnumTagSinglePayload for WorkPlanIdentifier.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23DEFC1A8 + 4 * byte_23DF1AFC5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23DEFC1DC + 4 * byte_23DF1AFC0[v4]))();
}

uint64_t sub_23DEFC1DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DEFC1E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DEFC1ECLL);
  return result;
}

uint64_t sub_23DEFC1F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DEFC200);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23DEFC204(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DEFC20C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WorkPlanIdentifier.CodingKeys()
{
  return &type metadata for WorkPlanIdentifier.CodingKeys;
}

unint64_t sub_23DEFC22C()
{
  unint64_t result;

  result = qword_256D0FD40;
  if (!qword_256D0FD40)
  {
    result = MEMORY[0x2426483D0](&unk_23DF1B178, &type metadata for WorkPlanIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D0FD40);
  }
  return result;
}

unint64_t sub_23DEFC274()
{
  unint64_t result;

  result = qword_256D0FD48;
  if (!qword_256D0FD48)
  {
    result = MEMORY[0x2426483D0](&unk_23DF1B0E8, &type metadata for WorkPlanIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D0FD48);
  }
  return result;
}

unint64_t sub_23DEFC2BC()
{
  unint64_t result;

  result = qword_256D0FD50;
  if (!qword_256D0FD50)
  {
    result = MEMORY[0x2426483D0](&unk_23DF1B110, &type metadata for WorkPlanIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D0FD50);
  }
  return result;
}

uint64_t sub_23DEFC300(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E69616D6F64 && a2 == 0xE600000000000000;
  if (v2 || (sub_23DF15400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701080931 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23DF15400();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t MultiDispatcher.__allocating_init(target:width:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  MultiDispatcher.init(target:width:)(a1, a2);
  return v4;
}

uint64_t MultiDispatcher.init(target:width:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = v2;
  v20 = a2;
  v18 = a1;
  v19 = sub_23DF1504C();
  v5 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19, v6);
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23DF15040();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v9, v11);
  v12 = sub_23DF14D34();
  MEMORY[0x24BDAC7A8](v12, v13);
  sub_23DE902F4(a1, v2 + 16);
  v17[1] = sub_23DE95920();
  sub_23DF14D28();
  sub_23DE95234(0, &qword_25432DD38, v10, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_23DF16970;
  sub_23DF15034();
  v21 = v14;
  sub_23DE8F998((unint64_t *)&qword_25432D9B0, v10, MEMORY[0x24BEE5698]);
  sub_23DE95234(0, (unint64_t *)&qword_25432D950, v10, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
  sub_23DEC0E44((unint64_t *)&qword_25432D960, (unint64_t *)&qword_25432D950, v10);
  sub_23DF15148();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v8, *MEMORY[0x24BEE5750], v19);
  *(_QWORD *)(v2 + 56) = sub_23DF15064();
  sub_23DEFC68C();
  v15 = swift_allocObject();
  *(_DWORD *)(v15 + 36) = 0;
  *(_QWORD *)(v15 + 16) = v20;
  *(_QWORD *)(v15 + 24) = 0;
  *(_BYTE *)(v15 + 32) = 0;
  __swift_destroy_boxed_opaque_existential_1(v18);
  *(_QWORD *)(v3 + 64) = v15;
  return v3;
}

void sub_23DEFC68C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432E2D8)
  {
    type metadata accessor for os_unfair_lock_s(255);
    v0 = sub_23DF151E4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432E2D8);
  }
}

void sub_23DEFC6EC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void (*)(uint64_t), uint64_t, uint64_t, uint64_t);
  __int128 v9[2];

  v3 = *(_QWORD *)(v1 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 36));
  if (*(_QWORD *)(v3 + 24) >= *(_QWORD *)(v3 + 16) || *(_BYTE *)(v3 + 32) == 1)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 36));
  }
  else
  {
    *(_BYTE *)(v3 + 32) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 36));
    v4 = a1[3];
    v5 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v4);
    v6 = swift_allocObject();
    swift_weakInit();
    sub_23DE902F4((uint64_t)a1, (uint64_t)v9);
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    sub_23DE902DC(v9, v7 + 24);
    v8 = *(void (**)(void (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v5 + 8);
    swift_retain();
    v8(sub_23DEFD134, v7, v4, v5);
    swift_release();
    swift_release();
  }
}

uint64_t MultiDispatcher.width.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = (os_unfair_lock_s *)(v1 + 36);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 36));
  v3 = *(_QWORD *)(v1 + 16);
  os_unfair_lock_unlock(v2);
  return v3;
}

void sub_23DEFC85C(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  uint64_t v6;

  v3 = *(os_unfair_lock_s **)(*(_QWORD *)a1 + 64);
  v4 = v3 + 4;
  v5 = v3 + 9;
  os_unfair_lock_lock(v3 + 9);
  sub_23DEDC358(v4, &v6);
  os_unfair_lock_unlock(v5);
  *a2 = v6;
}

void sub_23DEFC8C4(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;

  v2 = *(os_unfair_lock_s **)(*(_QWORD *)a2 + 64);
  v3 = v2 + 4;
  v4 = v2 + 9;
  os_unfair_lock_lock(v2 + 9);
  sub_23DEFD0D8(v3);
  os_unfair_lock_unlock(v4);
}

void MultiDispatcher.width.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 36));
  *(_QWORD *)(v3 + 16) = a1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 36));
}

void (*MultiDispatcher.width.modify(_QWORD *a1))(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;

  v3 = *(_QWORD *)(v1 + 64);
  a1[1] = v3;
  v4 = (os_unfair_lock_s *)(v3 + 36);
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 36));
  v5 = *(_QWORD *)(v3 + 16);
  os_unfair_lock_unlock(v4);
  *a1 = v5;
  return sub_23DEFC9AC;
}

void sub_23DEFC9AC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *a1;
  v1 = a1[1];
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 36));
  *(_QWORD *)(v1 + 16) = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 36));
}

void sub_23DEFC9E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t Strong;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v6 = *(_QWORD *)(Strong + 64);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v6 + 36));
    *(_BYTE *)(v6 + 32) = 0;
    v7 = *(_QWORD *)(v6 + 24);
    v8 = __OFADD__(v7, 1);
    v9 = v7 + 1;
    if (v8)
    {
      __break(1u);
    }
    else
    {
      *(_QWORD *)(v6 + 24) = v9;
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 36));
      swift_release();
      sub_23DEFCAA4(a1, a3);
      sub_23DEFC6EC(a3);
      swift_release();
    }
  }
}

uint64_t sub_23DEFCAA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[6];
  __int128 v27[2];
  _OWORD v28[8];
  uint64_t v29;

  v3 = v2;
  v6 = sub_23DF14D10();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v24 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23DF14D34();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = *(_QWORD *)(v3 + 56);
  sub_23DEAC648(a1, (uint64_t)v28);
  sub_23DE902F4(a2, (uint64_t)v27);
  v16 = swift_allocObject();
  v17 = v28[4];
  *(_OWORD *)(v16 + 104) = v28[5];
  v18 = v28[7];
  *(_OWORD *)(v16 + 120) = v28[6];
  *(_OWORD *)(v16 + 136) = v18;
  v19 = v28[0];
  *(_OWORD *)(v16 + 40) = v28[1];
  v20 = v28[3];
  *(_OWORD *)(v16 + 56) = v28[2];
  *(_OWORD *)(v16 + 72) = v20;
  *(_OWORD *)(v16 + 88) = v17;
  *(_QWORD *)(v16 + 16) = v3;
  *(_QWORD *)(v16 + 152) = v29;
  *(_OWORD *)(v16 + 24) = v19;
  sub_23DE902DC(v27, v16 + 160);
  aBlock[4] = sub_23DEFD1A4;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23DE9F35C;
  aBlock[3] = &block_descriptor_11;
  v21 = _Block_copy(aBlock);
  swift_retain();
  sub_23DF14D28();
  v25 = MEMORY[0x24BEE4AF8];
  sub_23DE8F998(&qword_25432C290, v7, MEMORY[0x24BEE5468]);
  sub_23DE95234(0, (unint64_t *)&unk_25432D910, v7, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
  sub_23DEC0E44((unint64_t *)&unk_25432D920, (unint64_t *)&unk_25432D910, v7);
  sub_23DF15148();
  MEMORY[0x242647AA0](0, v15, v10, v21);
  _Block_release(v21);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v6);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  return swift_release();
}

uint64_t sub_23DEFCD44(_QWORD *a1, uint64_t *a2, uint64_t a3)
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
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void (*v20)(_BYTE *, _QWORD *, uint64_t, uint64_t, void (*)(void *), uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  __int128 v23[2];
  _OWORD v24[8];
  uint64_t v25;
  _QWORD v26[6];
  _BYTE v27[48];

  v6 = a1[5];
  v7 = a1[6];
  __swift_project_boxed_opaque_existential_1(a1 + 2, v6);
  sub_23DE902F4((uint64_t)(a2 + 8), (uint64_t)v27);
  v8 = a2[3];
  v9 = a2[4];
  v10 = a2[5];
  v11 = a2[6];
  v12 = a2[7];
  v26[0] = a2[2];
  v26[1] = v8;
  v26[2] = v9;
  v26[3] = v10;
  v26[4] = v11;
  v26[5] = v12;
  v13 = a2[1];
  v22 = *a2;
  sub_23DEAC648((uint64_t)a2, (uint64_t)v24);
  sub_23DE902F4(a3, (uint64_t)v23);
  v14 = swift_allocObject();
  v15 = v24[7];
  *(_OWORD *)(v14 + 112) = v24[6];
  *(_OWORD *)(v14 + 128) = v15;
  v16 = v25;
  v17 = v24[3];
  *(_OWORD *)(v14 + 48) = v24[2];
  *(_OWORD *)(v14 + 64) = v17;
  v18 = v24[5];
  *(_OWORD *)(v14 + 80) = v24[4];
  *(_OWORD *)(v14 + 96) = v18;
  v19 = v24[1];
  *(_OWORD *)(v14 + 16) = v24[0];
  *(_OWORD *)(v14 + 32) = v19;
  *(_QWORD *)(v14 + 144) = v16;
  *(_QWORD *)(v14 + 152) = a1;
  sub_23DE902DC(v23, v14 + 160);
  v20 = *(void (**)(_BYTE *, _QWORD *, uint64_t, uint64_t, void (*)(void *), uint64_t, uint64_t, uint64_t))(v7 + 8);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20(v27, v26, v22, v13, sub_23DEFD230, v14, v6, v7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
}

void sub_23DEFCEC0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v8)(uint64_t, void *);
  id v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (a1)
  {
    v8 = *(void (**)(uint64_t, void *))(a2 + 120);
    v9 = a1;
    v8(a2, a1);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(a2 + 120))(a2, 0);
  }
  v10 = *(_QWORD *)(a3 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(v10 + 36));
  v11 = *(_QWORD *)(v10 + 24);
  v12 = __OFSUB__(v11, 1);
  v13 = v11 - 1;
  if (v12)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v10 + 24) = v13;
    os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 36));
    sub_23DEFC6EC(a4);
  }
}

uint64_t MultiDispatcher.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  swift_release();
  return v0;
}

uint64_t MultiDispatcher.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  swift_release();
  return swift_deallocClassInstance();
}

void sub_23DEFCFCC(_QWORD *a1)
{
  sub_23DEFC6EC(a1);
}

uint64_t dispatch thunk of DispatchTarget.run(_:for:context:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 8))();
}

uint64_t type metadata accessor for MultiDispatcher()
{
  return objc_opt_self();
}

uint64_t method lookup function for MultiDispatcher()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MultiDispatcher.__allocating_init(target:width:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t getEnumTagSinglePayload for MultiDispatcher.State(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for MultiDispatcher.State(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_BYTE *)(result + 16) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for MultiDispatcher.State()
{
  return &type metadata for MultiDispatcher.State;
}

_QWORD *sub_23DEFD0D8(_QWORD *result)
{
  uint64_t v1;

  *result = *(_QWORD *)(v1 + 16);
  return result;
}

uint64_t sub_23DEFD0E4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23DEFD108()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return swift_deallocObject();
}

void sub_23DEFD134(uint64_t a1)
{
  uint64_t v1;

  sub_23DEFC9E4(a1, *(_QWORD *)(v1 + 16), v1 + 24);
}

uint64_t sub_23DEFD140()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 88);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 160);
  return swift_deallocObject();
}

uint64_t sub_23DEFD1A4()
{
  uint64_t v0;

  return sub_23DEFCD44(*(_QWORD **)(v0 + 16), (uint64_t *)(v0 + 24), v0 + 160);
}

uint64_t block_copy_helper_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_11()
{
  return swift_release();
}

uint64_t sub_23DEFD1CC()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 160);
  return swift_deallocObject();
}

void sub_23DEFD230(void *a1)
{
  uint64_t v1;

  sub_23DEFCEC0(a1, v1 + 16, *(_QWORD *)(v1 + 152), v1 + 160);
}

uint64_t sub_23DEFD240(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t NotificationInputSignal.__allocating_init(context:observer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  NotificationInputSignal.init(context:observer:)(a1, a2, a3, a4);
  return v8;
}

uint64_t sub_23DEFD2E0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_23DF15478();
    sub_23DF14E3C();
    v6 = sub_23DF154A8();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_23DF15400() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_23DF15400() & 1) != 0)
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

void static InputSignalSet.LookupKey.notification.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000017;
  a1[1] = 0x800000023DF1B250;
  a1[2] = 0;
  a1[3] = 0;
}

uint64_t (*NotificationInputSignal.Anchor.notificationTimestamps.modify())()
{
  return nullsub_1;
}

uint64_t NotificationInputSignal.Anchor.relevantTimestamps(for:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *a1;
  swift_bridgeObjectRetain();
  v2 = swift_bridgeObjectRetain();
  v3 = sub_23DEFFB54(v2, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

BOOL NotificationInputSignal.Anchor.hasDifference(from:for:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v3 = *a1;
  v4 = *a2;
  v5 = *v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = sub_23DEFFB54(v5, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3)
  {
    swift_bridgeObjectRetain();
    v7 = swift_bridgeObjectRetain();
    v8 = sub_23DEFFB54(v7, v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = sub_23DE92FCC(MEMORY[0x24BEE4AF8]);
  }
  v9 = sub_23DEA3C24(v6, v8);
  swift_release();
  swift_bridgeObjectRelease();
  return (v9 & 1) == 0;
}

HealthOrchestration::NotificationInputSignal::Anchor __swiftcall NotificationInputSignal.Anchor.merged(with:)(HealthOrchestration::NotificationInputSignal::Anchor with)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  HealthOrchestration::NotificationInputSignal::Anchor result;

  v2 = v1;
  v3 = swift_bridgeObjectRetain();
  v4 = sub_23DEFF624(v3, (uint64_t (*)(uint64_t, uint64_t, double))sub_23DEFFD08);
  swift_bridgeObjectRelease();
  v5 = (_QWORD *)sub_23DE92FCC(MEMORY[0x24BEE4AF8]);
  v6 = *(_QWORD *)(v4 + 16);
  if (!v6)
  {
LABEL_17:
    result.notificationTimestamps._rawValue = (void *)swift_bridgeObjectRelease();
    *v2 = v5;
    return result;
  }
  swift_bridgeObjectRetain();
  v7 = (uint64_t *)(v4 + 48);
  while (1)
  {
    v9 = *(v7 - 2);
    v8 = *(v7 - 1);
    v10 = *v7;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v13 = sub_23DE946E8(v9, v8);
    v14 = v5[2];
    v15 = (v12 & 1) == 0;
    v16 = v14 + v15;
    if (__OFADD__(v14, v15))
      break;
    v17 = v12;
    if (v5[3] >= v16)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v12 & 1) != 0)
          goto LABEL_3;
      }
      else
      {
        sub_23DECA63C();
        if ((v17 & 1) != 0)
          goto LABEL_3;
      }
    }
    else
    {
      sub_23DEC7408(v16, isUniquelyReferenced_nonNull_native);
      v18 = sub_23DE946E8(v9, v8);
      if ((v17 & 1) != (v19 & 1))
        goto LABEL_20;
      v13 = v18;
      if ((v17 & 1) != 0)
      {
LABEL_3:
        *(_QWORD *)(v5[7] + 8 * v13) = v10;
        goto LABEL_4;
      }
    }
    v5[(v13 >> 6) + 8] |= 1 << v13;
    v20 = (uint64_t *)(v5[6] + 16 * v13);
    *v20 = v9;
    v20[1] = v8;
    *(_QWORD *)(v5[7] + 8 * v13) = v10;
    v21 = v5[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_19;
    v5[2] = v23;
    swift_bridgeObjectRetain();
LABEL_4:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v7 += 3;
    if (!--v6)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  result.notificationTimestamps._rawValue = (void *)sub_23DF15424();
  __break(1u);
  return result;
}

uint64_t sub_23DEFD784(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5;

  if (!*(_QWORD *)(a3 + 16))
    return 0;
  swift_bridgeObjectRetain();
  sub_23DE946E8(a1, a2);
  if ((v5 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t static NotificationInputSignal.Anchor.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_23DEA3C24(*a1, *a2);
}

unint64_t sub_23DEFD830()
{
  return 0xD000000000000016;
}

uint64_t sub_23DEFD84C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23DF002E0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23DEFD874()
{
  sub_23DEFFD10();
  return sub_23DF154CC();
}

uint64_t sub_23DEFD89C()
{
  sub_23DEFFD10();
  return sub_23DF154D8();
}

uint64_t NotificationInputSignal.Anchor.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[2];

  sub_23DEFFD54(0, &qword_256D0FD58, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x24BEE3520]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v6);
  v8 = (char *)v11 - v7;
  v9 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DEFFD10();
  sub_23DF154C0();
  v11[1] = v9;
  sub_23DF003D8(0, &qword_256D0FD68, MEMORY[0x24BEE0D00], MEMORY[0x24BEE0D10], (uint64_t (*)(_QWORD, uint64_t, _QWORD))MEMORY[0x24BEE0460]);
  sub_23DEFFDB0(&qword_256D0FD70, MEMORY[0x24BEE0D08], MEMORY[0x24BEE13D8], MEMORY[0x24BEE04C0]);
  sub_23DF15388();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t NotificationInputSignal.Anchor.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v12[2];

  sub_23DEFFD54(0, &qword_256D0FD78, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x24BEE33E0]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v8);
  v10 = (char *)v12 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DEFFD10();
  sub_23DF154B4();
  if (!v2)
  {
    sub_23DF003D8(0, &qword_256D0FD68, MEMORY[0x24BEE0D00], MEMORY[0x24BEE0D10], (uint64_t (*)(_QWORD, uint64_t, _QWORD))MEMORY[0x24BEE0460]);
    sub_23DEFFDB0(&qword_256D0FD80, MEMORY[0x24BEE0D38], MEMORY[0x24BEE1400], MEMORY[0x24BEE04E0]);
    sub_23DF15334();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    *a2 = v12[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23DEFDB98@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return NotificationInputSignal.Anchor.init(from:)(a1, a2);
}

uint64_t sub_23DEFDBAC(_QWORD *a1)
{
  return NotificationInputSignal.Anchor.encode(to:)(a1);
}

uint64_t sub_23DEFDBC0(uint64_t *a1, uint64_t *a2)
{
  return sub_23DEA3C24(*a1, *a2);
}

void NotificationInputSignal.Configuration.identifier.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000017;
  a1[1] = 0x800000023DF1B250;
  a1[2] = 0;
  a1[3] = 0;
}

uint64_t NotificationInputSignal.Configuration.notifications.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t NotificationInputSignal.Configuration.notifications.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*NotificationInputSignal.Configuration.notifications.modify())()
{
  return nullsub_1;
}

uint64_t NotificationInputSignal.Configuration.init(notifications:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t static NotificationInputSignal.Configuration.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_23DEA1E24(*a1, *a2);
}

uint64_t NotificationInputSignal.Configuration.hash(into:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  swift_bridgeObjectRetain();
  sub_23DEA83A0(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t NotificationInputSignal.Configuration.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_23DF15478();
  swift_bridgeObjectRetain();
  sub_23DEA83A0((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_23DF154A8();
}

uint64_t sub_23DEFDCD0(uint64_t *a1, uint64_t *a2)
{
  return sub_23DEA1E24(*a1, *a2);
}

void sub_23DEFDCDC(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000017;
  a1[1] = 0x800000023DF1B250;
  a1[2] = 0;
  a1[3] = 0;
}

uint64_t sub_23DEFDD00()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_23DF15478();
  swift_bridgeObjectRetain();
  sub_23DEA83A0((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_23DF154A8();
}

uint64_t sub_23DEFDD54(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  swift_bridgeObjectRetain();
  sub_23DEA83A0(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DEFDD8C()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_23DF15478();
  swift_bridgeObjectRetain();
  sub_23DEA83A0((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_23DF154A8();
}

void NotificationInputSignal.identifier.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000017;
  a1[1] = 0x800000023DF1B250;
  a1[2] = 0;
  a1[3] = 0;
}

uint64_t NotificationInputSignal.observer.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_23DEFDE24(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t ObjectType;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  int out_token[2];
  uint64_t aBlock[7];

  v3 = v2;
  aBlock[6] = *MEMORY[0x24BDAC8D0];
  v6 = sub_23DF14C80();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(v2 + 40);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v11 + 40))(ObjectType, v11);
  swift_bridgeObjectRetain_n();
  v13 = sub_23DF14C68();
  v14 = sub_23DF1501C();
  if (os_log_type_enabled(v13, v14))
  {
    v27 = v6;
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v26 = v7;
    v17 = a1;
    v18 = v16;
    aBlock[0] = v16;
    *(_DWORD *)v15 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)out_token = sub_23DEC1518(v17, a2, aBlock);
    sub_23DF15100();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23DE8B000, v13, v14, "Beginning observation for %s", v15, 0xCu);
    swift_arrayDestroy();
    v19 = v18;
    a1 = v17;
    MEMORY[0x242648490](v19, -1, -1);
    MEMORY[0x242648490](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v27);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  out_token[0] = -1;
  v20 = *(NSObject **)(v3 + 56);
  v21 = swift_allocObject();
  swift_weakInit();
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = v21;
  v22[3] = a1;
  v22[4] = a2;
  aBlock[4] = (uint64_t)sub_23DF003B4;
  aBlock[5] = (uint64_t)v22;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_23DEFD240;
  aBlock[3] = (uint64_t)&block_descriptor_12;
  v23 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  v24 = sub_23DF14E24();
  notify_register_dispatch((const char *)(v24 + 32), out_token, v20, v23);
  swift_release();
  _Block_release(v23);
  return out_token[0];
}

uint64_t sub_23DEFE11C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  _QWORD *v12;
  double Current;
  os_unfair_lock_s *v14;
  uint64_t v15;
  uint64_t ObjectType;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v6 = sub_23DF14C80();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v12 = (_QWORD *)result;
    Current = CFAbsoluteTimeGetCurrent();
    v14 = (os_unfair_lock_s *)v12[6];
    swift_retain();
    os_unfair_lock_lock(v14 + 8);
    sub_23DEFE418((uint64_t)&v14[4], a3, a4, &v31, Current);
    os_unfair_lock_unlock(v14 + 8);
    swift_release();
    v29 = v31;
    v15 = v12[5];
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v15 + 40))(ObjectType, v15);
    swift_bridgeObjectRetain_n();
    v17 = sub_23DF14C68();
    v18 = sub_23DF1501C();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = swift_slowAlloc();
      v20 = swift_slowAlloc();
      v28 = v6;
      v21 = v20;
      v31 = v20;
      *(_DWORD *)v19 = 136315394;
      swift_bridgeObjectRetain();
      v30 = sub_23DEC1518(a3, a4, &v31);
      sub_23DF15100();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v19 + 12) = 2048;
      v30 = *(_QWORD *)&Current;
      sub_23DF15100();
      _os_log_impl(&dword_23DE8B000, v17, v18, "Received notification %s at %f", (uint8_t *)v19, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x242648490](v21, -1, -1);
      MEMORY[0x242648490](v19, -1, -1);

      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v28);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
    v22 = v12[3];
    v23 = swift_getObjectType();
    v31 = v29;
    v30 = (uint64_t)v12;
    v24 = *(void (**)(uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 8);
    v25 = type metadata accessor for NotificationInputSignal();
    v27 = sub_23DEA068C(qword_25432D688, v26, (uint64_t (*)(uint64_t))type metadata accessor for NotificationInputSignal, (uint64_t)&protocol conformance descriptor for NotificationInputSignal);
    v24(&v31, &v30, v25, v27, v23, v22);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_23DEFE418@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>, double a5@<D0>)
{
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;

  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v12 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0x8000000000000000;
  sub_23DEEAC3C(a2, a3, isUniquelyReferenced_nonNull_native, a5);
  *(_QWORD *)(a1 + 8) = v12;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *a4 = *(_QWORD *)(a1 + 8);
  return swift_bridgeObjectRetain();
}

Swift::Void __swiftcall NotificationInputSignal.beginObservation(from:configurations:)(HealthOrchestration::NotificationInputSignal::Anchor_optional from, Swift::OpaquePointer configurations)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  unint64_t *p_os_unfair_lock_opaque;
  os_unfair_lock_s *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t ObjectType;
  void (*v16)(_QWORD *, _QWORD **, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD v20[2];

  v3 = v2;
  v4 = *(_QWORD *)&from.is_nil;
  v5 = *v2;
  v6 = (os_unfair_lock_s *)v2[6];
  p_os_unfair_lock_opaque = (unint64_t *)&v6[4]._os_unfair_lock_opaque;
  v8 = v6 + 8;
  os_unfair_lock_lock(v6 + 8);
  sub_23DEFE95C(p_os_unfair_lock_opaque);
  os_unfair_lock_unlock(v8);
  v9 = MEMORY[0x24BEE4B08];
  v20[0] = MEMORY[0x24BEE4B08];
  v10 = *(_QWORD *)(v4 + 16);
  if (v10)
  {
    swift_bridgeObjectRetain();
    for (i = 0; i != v10; ++i)
    {
      v12 = swift_bridgeObjectRetain();
      sub_23DEE5888(v12);
    }
    swift_bridgeObjectRelease();
    v9 = v20[0];
  }
  os_unfair_lock_lock(v8);
  sub_23DEFE668(p_os_unfair_lock_opaque, v9, v20);
  os_unfair_lock_unlock(v8);
  swift_bridgeObjectRelease();
  v13 = v20[0];
  v14 = v3[3];
  ObjectType = swift_getObjectType();
  v19 = v3;
  v20[0] = v13;
  v16 = *(void (**)(_QWORD *, _QWORD **, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 8);
  v18 = sub_23DEA068C(qword_25432D688, v17, (uint64_t (*)(uint64_t))type metadata accessor for NotificationInputSignal, (uint64_t)&protocol conformance descriptor for NotificationInputSignal);
  v16(v20, &v19, v5, v18, ObjectType, v14);
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall NotificationInputSignal.stopObservation()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  unint64_t *p_os_unfair_lock_opaque;
  os_unfair_lock_s *v3;

  v1 = *(os_unfair_lock_s **)(v0 + 48);
  p_os_unfair_lock_opaque = (unint64_t *)&v1[4]._os_unfair_lock_opaque;
  v3 = v1 + 8;
  os_unfair_lock_lock(v1 + 8);
  sub_23DEFE95C(p_os_unfair_lock_opaque);
  os_unfair_lock_unlock(v3);
}

uint64_t sub_23DEFE668@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t i;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v19;
  char v20;
  unint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  char v25;
  unint64_t v26;
  char v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t result;
  uint64_t v35;
  int64_t v36;
  int64_t v38;
  _QWORD *v39;

  v35 = a2 + 56;
  v4 = 1 << *(_BYTE *)(a2 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a2 + 56);
  v36 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain();
  for (i = 0; ; i = v38)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v38 = i;
      v9 = v8 | (i << 6);
    }
    else
    {
      v10 = i + 1;
      if (__OFADD__(i, 1))
        goto LABEL_36;
      if (v10 >= v36)
      {
LABEL_33:
        swift_release();
        *a3 = a1[1];
        return swift_bridgeObjectRetain();
      }
      v11 = *(_QWORD *)(v35 + 8 * v10);
      v12 = i + 1;
      if (!v11)
      {
        v12 = i + 2;
        if (i + 2 >= v36)
          goto LABEL_33;
        v11 = *(_QWORD *)(v35 + 8 * v12);
        if (!v11)
        {
          v12 = i + 3;
          if (i + 3 >= v36)
            goto LABEL_33;
          v11 = *(_QWORD *)(v35 + 8 * v12);
          if (!v11)
          {
            v13 = i + 4;
            if (i + 4 >= v36)
              goto LABEL_33;
            v11 = *(_QWORD *)(v35 + 8 * v13);
            if (!v11)
            {
              while (1)
              {
                v12 = v13 + 1;
                if (__OFADD__(v13, 1))
                  goto LABEL_37;
                if (v12 >= v36)
                  goto LABEL_33;
                v11 = *(_QWORD *)(v35 + 8 * v12);
                ++v13;
                if (v11)
                  goto LABEL_21;
              }
            }
            v12 = i + 4;
          }
        }
      }
LABEL_21:
      v6 = (v11 - 1) & v11;
      v38 = v12;
      v9 = __clz(__rbit64(v11)) + (v12 << 6);
    }
    v14 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v9);
    v16 = *v14;
    v15 = v14[1];
    swift_bridgeObjectRetain();
    v17 = sub_23DEFDE24(v16, v15);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v19 = (_QWORD *)*a1;
    v39 = (_QWORD *)*a1;
    *a1 = 0x8000000000000000;
    v21 = sub_23DE946E8(v16, v15);
    v22 = v19[2];
    v23 = (v20 & 1) == 0;
    v24 = v22 + v23;
    if (__OFADD__(v22, v23))
      break;
    v25 = v20;
    if (v19[3] >= v24)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v28 = v39;
        if ((v20 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_23DECBDA8();
        v28 = v39;
        if ((v25 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_23DEC9B58(v24, isUniquelyReferenced_nonNull_native);
      v26 = sub_23DE946E8(v16, v15);
      if ((v25 & 1) != (v27 & 1))
        goto LABEL_38;
      v21 = v26;
      v28 = v39;
      if ((v25 & 1) != 0)
      {
LABEL_4:
        *(_DWORD *)(v28[7] + 4 * v21) = v17;
        goto LABEL_5;
      }
    }
    v28[(v21 >> 6) + 8] |= 1 << v21;
    v29 = (uint64_t *)(v28[6] + 16 * v21);
    *v29 = v16;
    v29[1] = v15;
    *(_DWORD *)(v28[7] + 4 * v21) = v17;
    v30 = v28[2];
    v31 = __OFADD__(v30, 1);
    v32 = v30 + 1;
    if (v31)
      goto LABEL_35;
    v28[2] = v32;
    swift_bridgeObjectRetain();
LABEL_5:
    *a1 = v28;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  result = sub_23DF15424();
  __break(1u);
  return result;
}

uint64_t sub_23DEFE95C(unint64_t *a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;

  v2 = *a1;
  v3 = *a1 + 64;
  v4 = 1 << *(_BYTE *)(*a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(*a1 + 64);
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
    v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v12 >= v7)
      goto LABEL_23;
    v13 = *(_QWORD *)(v3 + 8 * v12);
    ++v9;
    if (!v13)
    {
      v9 = v12 + 1;
      if (v12 + 1 >= v7)
        goto LABEL_23;
      v13 = *(_QWORD *)(v3 + 8 * v9);
      if (!v13)
      {
        v9 = v12 + 2;
        if (v12 + 2 >= v7)
          goto LABEL_23;
        v13 = *(_QWORD *)(v3 + 8 * v9);
        if (!v13)
        {
          v9 = v12 + 3;
          if (v12 + 3 >= v7)
            goto LABEL_23;
          v13 = *(_QWORD *)(v3 + 8 * v9);
          if (!v13)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v9 << 6);
LABEL_5:
    result = notify_cancel(*(_DWORD *)(*(_QWORD *)(v2 + 56) + 4 * v11));
  }
  v14 = v12 + 4;
  if (v14 >= v7)
  {
LABEL_23:
    swift_release();
    v15 = sub_23DE9371C(MEMORY[0x24BEE4AF8]);
    result = swift_bridgeObjectRelease();
    *a1 = v15;
    return result;
  }
  v13 = *(_QWORD *)(v3 + 8 * v14);
  if (v13)
  {
    v9 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    v9 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v9 >= v7)
      goto LABEL_23;
    v13 = *(_QWORD *)(v3 + 8 * v9);
    ++v14;
    if (v13)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

_QWORD *NotificationInputSignal.init(context:observer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v25 = a3;
  v26 = a4;
  v23 = a1;
  v24 = a2;
  v5 = sub_23DF1504C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23DF15040();
  v11 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v10, v12);
  v13 = sub_23DF14D34();
  MEMORY[0x24BDAC7A8](v13, v14);
  v15 = MEMORY[0x24BEE4AF8];
  v16 = sub_23DE9371C(MEMORY[0x24BEE4AF8]);
  sub_23DEFFE50();
  v17 = swift_allocObject();
  *(_DWORD *)(v17 + 32) = 0;
  v18 = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v17 + 16) = v16;
  *(_QWORD *)(v17 + 24) = v18;
  v4[6] = v17;
  sub_23DE95920();
  sub_23DF14D28();
  v27 = v15;
  sub_23DEA068C((unint64_t *)&qword_25432D9B0, 255, v11, MEMORY[0x24BEE5698]);
  sub_23DEEC26C();
  sub_23DEA068C((unint64_t *)&qword_25432D960, 255, (uint64_t (*)(uint64_t))sub_23DEEC26C, MEMORY[0x24BEE12C8]);
  sub_23DF15148();
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v9, *MEMORY[0x24BEE5750], v5);
  v4[7] = sub_23DF15064();
  v19 = v24;
  v4[4] = v23;
  v4[5] = v19;
  v20 = v26;
  v4[2] = v25;
  v4[3] = v20;
  return v4;
}

uint64_t NotificationInputSignal.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  return v0;
}

uint64_t NotificationInputSignal.__deallocating_deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

void sub_23DEFED64(HealthOrchestration::NotificationInputSignal::Anchor_optional a1, Swift::OpaquePointer a2)
{
  NotificationInputSignal.beginObservation(from:configurations:)(a1, a2);
}

void sub_23DEFED84()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  unint64_t *p_os_unfair_lock_opaque;
  os_unfair_lock_s *v3;

  v1 = *(os_unfair_lock_s **)(*(_QWORD *)v0 + 48);
  p_os_unfair_lock_opaque = (unint64_t *)&v1[4]._os_unfair_lock_opaque;
  v3 = v1 + 8;
  os_unfair_lock_lock(v1 + 8);
  sub_23DEFE95C(p_os_unfair_lock_opaque);
  os_unfair_lock_unlock(v3);
}

unint64_t sub_23DEFEDD8()
{
  return 0xD000000000000017;
}

uint64_t sub_23DEFEDF4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;

  if (!a3)
    return MEMORY[0x24BEE4B00];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  sub_23DF003D8(0, (unint64_t *)&qword_256D0E3E8, MEMORY[0x24BEE3F88], MEMORY[0x24BEE3F98], (uint64_t (*)(_QWORD, uint64_t, _QWORD))MEMORY[0x24BEE30A0]);
  result = sub_23DF152BC();
  v9 = result;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
    }
    else
    {
      v15 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_40;
      if (v15 >= a2)
        return v9;
      v16 = a1[v15];
      ++v11;
      if (!v16)
      {
        v11 = v15 + 1;
        if (v15 + 1 >= a2)
          return v9;
        v16 = a1[v11];
        if (!v16)
        {
          v11 = v15 + 2;
          if (v15 + 2 >= a2)
            return v9;
          v16 = a1[v11];
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= a2)
              return v9;
            v16 = a1[v17];
            if (!v16)
            {
              while (1)
              {
                v11 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_41;
                if (v11 >= a2)
                  return v9;
                v16 = a1[v11];
                ++v17;
                if (v16)
                  goto LABEL_24;
              }
            }
            v11 = v17;
          }
        }
      }
LABEL_24:
      v10 = (v16 - 1) & v16;
      v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    v18 = *(_DWORD *)(*(_QWORD *)(v4 + 48) + 4 * v14);
    v19 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v14);
    result = MEMORY[0x242647EB4](*(_QWORD *)(v9 + 40), v18, 4);
    v20 = -1 << *(_BYTE *)(v9 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v12 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v12 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v12 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v12 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(_DWORD *)(*(_QWORD *)(v9 + 48) + 4 * v23) = v18;
    *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v23) = v19;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    if (!v5)
      return v9;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_23DEFF070(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v31;

  if (!a3)
    return MEMORY[0x24BEE4B00];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  sub_23DF003D8(0, &qword_256D0E3B0, MEMORY[0x24BEE0D00], MEMORY[0x24BEE0D10], (uint64_t (*)(_QWORD, uint64_t, _QWORD))MEMORY[0x24BEE30A0]);
  result = sub_23DF152BC();
  v8 = result;
  v31 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
    }
    else
    {
      v14 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_40;
      if (v14 >= v31)
        return v8;
      v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        v10 = v14 + 1;
        if (v14 + 1 >= v31)
          return v8;
        v15 = a1[v10];
        if (!v15)
        {
          v10 = v14 + 2;
          if (v14 + 2 >= v31)
            return v8;
          v15 = a1[v10];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v31)
              return v8;
            v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                v10 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_41;
                if (v10 >= v31)
                  return v8;
                v15 = a1[v10];
                ++v16;
                if (v15)
                  goto LABEL_24;
              }
            }
            v10 = v16;
          }
        }
      }
LABEL_24:
      v9 = (v15 - 1) & v15;
      v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v19 = *v17;
    v18 = v17[1];
    v20 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v13);
    sub_23DF15478();
    swift_bridgeObjectRetain();
    sub_23DF14E3C();
    result = sub_23DF154A8();
    v21 = -1 << *(_BYTE *)(v8 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v11 + 8 * (v22 >> 6))) != 0)
    {
      v24 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v11 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v27 = v23 == v26;
        if (v23 == v26)
          v23 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v23);
      }
      while (v28 == -1);
      v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(_QWORD *)(v11 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    v29 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v24);
    *v29 = v19;
    v29[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v24) = v20;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    if (!v5)
      return v8;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_23DEFF338(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v33;
  uint64_t v35;
  __int128 v36[2];
  __int128 v37[3];

  if (!a3)
    return MEMORY[0x24BEE4B00];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  sub_23DE954A8();
  result = sub_23DF152BC();
  v8 = result;
  v33 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 64;
  v35 = v4;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
    }
    else
    {
      v14 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_40;
      if (v14 >= v33)
        return v8;
      v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        v10 = v14 + 1;
        if (v14 + 1 >= v33)
          return v8;
        v15 = a1[v10];
        if (!v15)
        {
          v10 = v14 + 2;
          if (v14 + 2 >= v33)
            return v8;
          v15 = a1[v10];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v33)
              return v8;
            v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                v10 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_41;
                if (v10 >= v33)
                  return v8;
                v15 = a1[v10];
                ++v16;
                if (v15)
                  goto LABEL_24;
              }
            }
            v10 = v16;
          }
        }
      }
LABEL_24:
      v9 = (v15 - 1) & v15;
      v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    v17 = *(_QWORD *)(v4 + 56);
    v18 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 32 * v13);
    v20 = *v18;
    v19 = v18[1];
    v21 = v18[2];
    v22 = v18[3];
    sub_23DE902F4(v17 + 40 * v13, (uint64_t)v37);
    sub_23DE902DC(v37, (uint64_t)v36);
    sub_23DF15478();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    sub_23DF14E3C();
    swift_bridgeObjectRelease();
    result = sub_23DF154A8();
    v23 = -1 << *(_BYTE *)(v8 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v11 + 8 * (v24 >> 6))) != 0)
    {
      v26 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v11 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v29 = v25 == v28;
        if (v25 == v28)
          v25 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v25);
      }
      while (v30 == -1);
      v26 = __clz(__rbit64(~v30)) + (v25 << 6);
    }
    *(_QWORD *)(v11 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
    v31 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 32 * v26);
    *v31 = v20;
    v31[1] = v19;
    v31[2] = v21;
    v31[3] = v22;
    result = sub_23DE902DC(v36, *(_QWORD *)(v8 + 56) + 40 * v26);
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    v4 = v35;
    if (!v5)
      return v8;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_23DEFF624(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, double))
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t i;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  int64_t v29;

  v28 = a1 + 64;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v29 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  v27 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (!v6)
    goto LABEL_7;
LABEL_4:
  v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (i = v9 | (v8 << 6); ; i = __clz(__rbit64(v21)) + (v8 << 6))
  {
    v11 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
    v12 = *v11;
    v13 = v11[1];
    v14 = *(double *)(*(_QWORD *)(a1 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    v15 = a2(v12, v13, v14);
    v17 = v16;
    v19 = v18;
    result = swift_bridgeObjectRelease();
    if (v17)
    {
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_23DF065E0(0, v27[2] + 1, 1, v27);
        v27 = (_QWORD *)result;
      }
      v24 = v27[2];
      v23 = v27[3];
      v25 = v24 + 1;
      if (v24 >= v23 >> 1)
      {
        result = (uint64_t)sub_23DF065E0((_QWORD *)(v23 > 1), v24 + 1, 1, v27);
        v25 = v24 + 1;
        v27 = (_QWORD *)result;
      }
      v27[2] = v25;
      v26 = &v27[3 * v24];
      v26[4] = v15;
      v26[5] = v17;
      v26[6] = v19;
      if (v6)
        goto LABEL_4;
    }
    else if (v6)
    {
      goto LABEL_4;
    }
LABEL_7:
    v20 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v20 >= v29)
      goto LABEL_29;
    v21 = *(_QWORD *)(v28 + 8 * v20);
    ++v8;
    if (!v21)
    {
      v8 = v20 + 1;
      if (v20 + 1 >= v29)
        goto LABEL_29;
      v21 = *(_QWORD *)(v28 + 8 * v8);
      if (!v21)
      {
        v8 = v20 + 2;
        if (v20 + 2 >= v29)
          goto LABEL_29;
        v21 = *(_QWORD *)(v28 + 8 * v8);
        if (!v21)
        {
          v8 = v20 + 3;
          if (v20 + 3 >= v29)
            goto LABEL_29;
          v21 = *(_QWORD *)(v28 + 8 * v8);
          if (!v21)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v21 - 1) & v21;
  }
  v22 = v20 + 4;
  if (v22 >= v29)
  {
LABEL_29:
    swift_release();
    return (uint64_t)v27;
  }
  v21 = *(_QWORD *)(v28 + 8 * v22);
  if (v21)
  {
    v8 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    v8 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v8 >= v29)
      goto LABEL_29;
    v21 = *(_QWORD *)(v28 + 8 * v8);
    ++v22;
    if (v21)
      goto LABEL_22;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_23DEFF898(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  BOOL v30;
  unint64_t *v32;
  uint64_t v33;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;

  v4 = a4;
  v32 = (unint64_t *)result;
  v33 = 0;
  v5 = 0;
  v8 = *(_QWORD *)(a3 + 64);
  v6 = a3 + 64;
  v7 = v8;
  v9 = 1 << *(_BYTE *)(v6 - 32);
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & v7;
  v35 = v6;
  v36 = (unint64_t)(v9 + 63) >> 6;
  v37 = a4 + 56;
  while (1)
  {
    while (v11)
    {
      v12 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v13 = v12 | (v5 << 6);
      if (*(_QWORD *)(v4 + 16))
        goto LABEL_23;
    }
    v14 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_41;
    }
    if (v14 >= v36)
      return sub_23DEFF070(v32, a2, v33, a3);
    v15 = *(_QWORD *)(v35 + 8 * v14);
    ++v5;
    if (!v15)
    {
      v5 = v14 + 1;
      if (v14 + 1 >= v36)
        return sub_23DEFF070(v32, a2, v33, a3);
      v15 = *(_QWORD *)(v35 + 8 * v5);
      if (!v15)
      {
        v5 = v14 + 2;
        if (v14 + 2 >= v36)
          return sub_23DEFF070(v32, a2, v33, a3);
        v15 = *(_QWORD *)(v35 + 8 * v5);
        if (!v15)
          break;
      }
    }
LABEL_22:
    v11 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v5 << 6);
    if (*(_QWORD *)(v4 + 16))
    {
LABEL_23:
      v17 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * v13);
      v19 = *v17;
      v18 = v17[1];
      sub_23DF15478();
      swift_bridgeObjectRetain();
      sub_23DF14E3C();
      v20 = sub_23DF154A8();
      v21 = v4;
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = v20 & ~v22;
      if (((*(_QWORD *)(v37 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
        goto LABEL_5;
      v24 = *(_QWORD *)(v21 + 48);
      v25 = (_QWORD *)(v24 + 16 * v23);
      v26 = *v25 == v19 && v25[1] == v18;
      if (v26 || (sub_23DF15400() & 1) != 0)
      {
LABEL_36:
        result = swift_bridgeObjectRelease();
        *(unint64_t *)((char *)v32 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
        v30 = __OFADD__(v33++, 1);
        v4 = v21;
        if (v30)
        {
          __break(1u);
          return sub_23DEFF070(v32, a2, v33, a3);
        }
      }
      else
      {
        v27 = ~v22;
        while (1)
        {
          v23 = (v23 + 1) & v27;
          if (((*(_QWORD *)(v37 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
            break;
          v28 = (_QWORD *)(v24 + 16 * v23);
          v29 = *v28 == v19 && v28[1] == v18;
          if (v29 || (sub_23DF15400() & 1) != 0)
            goto LABEL_36;
        }
LABEL_5:
        result = swift_bridgeObjectRelease();
        v4 = v21;
      }
    }
  }
  v16 = v14 + 3;
  if (v16 >= v36)
    return sub_23DEFF070(v32, a2, v33, a3);
  v15 = *(_QWORD *)(v35 + 8 * v16);
  if (v15)
  {
    v5 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    v5 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v5 >= v36)
      return sub_23DEFF070(v32, a2, v33, a3);
    v15 = *(_QWORD *)(v35 + 8 * v5);
    ++v16;
    if (v15)
      goto LABEL_22;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_23DEFFB54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v5;
  unsigned int v6;
  unint64_t v7;
  size_t v8;
  uint64_t isStackAllocationSafe;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v7 = (unint64_t)((1 << v5) + 63) >> 6;
  v8 = 8 * v7;
  isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe, v10);
    bzero((char *)v14 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain();
    v11 = sub_23DEFF898((uint64_t)v14 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, a1, a2);
    swift_bridgeObjectRelease();
    if (v2)
      swift_willThrow();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v12 = (void *)swift_slowAlloc();
    bzero(v12, v8);
    swift_bridgeObjectRetain();
    v11 = sub_23DEFF898((uint64_t)v12, v7, a1, a2);
    swift_bridgeObjectRelease();
    MEMORY[0x242648490](v12, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v11;
}

uint64_t sub_23DEFFD08(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23DEFD784(a1, a2, *(_QWORD *)(v2 + 16));
}

unint64_t sub_23DEFFD10()
{
  unint64_t result;

  result = qword_256D0FD60;
  if (!qword_256D0FD60)
  {
    result = MEMORY[0x2426483D0](&unk_23DF1B518, &type metadata for NotificationInputSignal.Anchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D0FD60);
  }
  return result;
}

void sub_23DEFFD54(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_23DEFFD10();
    v7 = a3(a1, &type metadata for NotificationInputSignal.Anchor.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_23DEFFDB0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    sub_23DF003D8(255, &qword_256D0FD68, MEMORY[0x24BEE0D00], MEMORY[0x24BEE0D10], (uint64_t (*)(_QWORD, uint64_t, _QWORD))MEMORY[0x24BEE0460]);
    v10[0] = a2;
    v10[1] = a3;
    result = MEMORY[0x2426483D0](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for NotificationInputSignal()
{
  return objc_opt_self();
}

void sub_23DEFFE50()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432DA50)
  {
    type metadata accessor for os_unfair_lock_s(255);
    v0 = sub_23DF151E4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432DA50);
  }
}

unint64_t sub_23DEFFEB0()
{
  unint64_t result;

  result = qword_256D0FD88;
  if (!qword_256D0FD88)
  {
    result = MEMORY[0x2426483D0](&protocol conformance descriptor for NotificationInputSignal.Configuration, &type metadata for NotificationInputSignal.Configuration);
    atomic_store(result, (unint64_t *)&qword_256D0FD88);
  }
  return result;
}

unint64_t sub_23DEFFEF4(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_23DEFFF28();
  a1[2] = sub_23DEFFF6C();
  result = sub_23DEFFFB0();
  a1[3] = result;
  return result;
}

unint64_t sub_23DEFFF28()
{
  unint64_t result;

  result = qword_256D0FDD8;
  if (!qword_256D0FDD8)
  {
    result = MEMORY[0x2426483D0](&protocol conformance descriptor for NotificationInputSignal.Anchor, &type metadata for NotificationInputSignal.Anchor);
    atomic_store(result, (unint64_t *)&qword_256D0FDD8);
  }
  return result;
}

unint64_t sub_23DEFFF6C()
{
  unint64_t result;

  result = qword_256D0FDE0;
  if (!qword_256D0FDE0)
  {
    result = MEMORY[0x2426483D0](&protocol conformance descriptor for NotificationInputSignal.Anchor, &type metadata for NotificationInputSignal.Anchor);
    atomic_store(result, (unint64_t *)&qword_256D0FDE0);
  }
  return result;
}

unint64_t sub_23DEFFFB0()
{
  unint64_t result;

  result = qword_256D0FDE8;
  if (!qword_256D0FDE8)
  {
    result = MEMORY[0x2426483D0](&protocol conformance descriptor for NotificationInputSignal.Anchor, &type metadata for NotificationInputSignal.Anchor);
    atomic_store(result, (unint64_t *)&qword_256D0FDE8);
  }
  return result;
}

unint64_t sub_23DEFFFF4(uint64_t a1)
{
  unint64_t result;

  result = sub_23DF00018();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23DF00018()
{
  unint64_t result;

  result = qword_256D0FDF0;
  if (!qword_256D0FDF0)
  {
    result = MEMORY[0x2426483D0](&protocol conformance descriptor for NotificationInputSignal.Configuration, &type metadata for NotificationInputSignal.Configuration);
    atomic_store(result, (unint64_t *)&qword_256D0FDF0);
  }
  return result;
}

unint64_t sub_23DF00060()
{
  unint64_t result;

  result = qword_256D0FDF8;
  if (!qword_256D0FDF8)
  {
    result = MEMORY[0x2426483D0](&protocol conformance descriptor for NotificationInputSignal.Configuration, &type metadata for NotificationInputSignal.Configuration);
    atomic_store(result, (unint64_t *)&qword_256D0FDF8);
  }
  return result;
}

unint64_t sub_23DF000A8()
{
  unint64_t result;

  result = qword_256D0FE00;
  if (!qword_256D0FE00)
  {
    result = MEMORY[0x2426483D0](&protocol conformance descriptor for NotificationInputSignal.Anchor, &type metadata for NotificationInputSignal.Anchor);
    atomic_store(result, (unint64_t *)&qword_256D0FE00);
  }
  return result;
}

uint64_t sub_23DF000EC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_23DEA068C(&qword_25432E2C0, a2, (uint64_t (*)(uint64_t))type metadata accessor for NotificationInputSignal, (uint64_t)&protocol conformance descriptor for NotificationInputSignal);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t method lookup function for NotificationInputSignal()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NotificationInputSignal.__allocating_init(context:observer:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

ValueMetadata *type metadata accessor for NotificationInputSignal.Anchor()
{
  return &type metadata for NotificationInputSignal.Anchor;
}

ValueMetadata *type metadata accessor for NotificationInputSignal.Configuration()
{
  return &type metadata for NotificationInputSignal.Configuration;
}

ValueMetadata *type metadata accessor for NotificationInputSignal.State()
{
  return &type metadata for NotificationInputSignal.State;
}

uint64_t storeEnumTagSinglePayload for NotificationInputSignal.Anchor.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23DF001AC + 4 * asc_23DF1B260[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23DF001CC + 4 * byte_23DF1B265[v4]))();
}

_BYTE *sub_23DF001AC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23DF001CC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DF001D4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DF001DC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DF001E4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DF001EC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for NotificationInputSignal.Anchor.CodingKeys()
{
  return &type metadata for NotificationInputSignal.Anchor.CodingKeys;
}

unint64_t sub_23DF0020C()
{
  unint64_t result;

  result = qword_256D0FE60;
  if (!qword_256D0FE60)
  {
    result = MEMORY[0x2426483D0](&unk_23DF1B4F0, &type metadata for NotificationInputSignal.Anchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D0FE60);
  }
  return result;
}

unint64_t sub_23DF00254()
{
  unint64_t result;

  result = qword_256D0FE68;
  if (!qword_256D0FE68)
  {
    result = MEMORY[0x2426483D0](&unk_23DF1B460, &type metadata for NotificationInputSignal.Anchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D0FE68);
  }
  return result;
}

unint64_t sub_23DF0029C()
{
  unint64_t result;

  result = qword_256D0FE70;
  if (!qword_256D0FE70)
  {
    result = MEMORY[0x2426483D0](&unk_23DF1B488, &type metadata for NotificationInputSignal.Anchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D0FE70);
  }
  return result;
}

uint64_t sub_23DF002E0(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000016 && a2 == 0x800000023DF1D910)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_23DF15400();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_23DF00364()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23DF00388()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23DF003B4(uint64_t a1)
{
  uint64_t v1;

  return sub_23DEFE11C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t block_copy_helper_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_12()
{
  return swift_release();
}

void sub_23DF003D8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t, _QWORD))
{
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v6 = a5(0, a3, MEMORY[0x24BEE13C8]);
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_23DF00440(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = a2;
  sub_23DF01C9C(a1, (uint64_t)sub_23DF01C58, 0, isUniquelyReferenced_nonNull_native, &v8);
  v6 = v8;
  swift_bridgeObjectRelease();
  if (v2)
    swift_bridgeObjectRelease();
  return v6;
}

uint64_t InputSignalAnchorSet.merged(with:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  uint64_t *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t result;
  __int128 v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29[2];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[40];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[56];

  v0 = swift_bridgeObjectRetain();
  v1 = sub_23DF029B8(v0, (void (*)(_OWORD *__return_ptr, _QWORD *, _BYTE *))sub_23DF00C60);
  swift_bridgeObjectRelease();
  v2 = (_QWORD *)sub_23DE93368(MEMORY[0x24BEE4AF8]);
  v3 = *(_QWORD *)(v1 + 16);
  if (!v3)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v2;
    return result;
  }
  v4 = v1 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_23DE955B4(v4, (uint64_t)&v35);
    v6 = v35;
    v7 = v36;
    v8 = v37;
    v9 = v38;
    v30 = v35;
    v31 = v36;
    v32 = v37;
    v33 = v38;
    sub_23DE902F4((uint64_t)v39, (uint64_t)v34);
    v25 = v6;
    v26 = v7;
    v27 = v8;
    v28 = v9;
    sub_23DE902F4((uint64_t)v39, (uint64_t)v29);
    sub_23DE902DC(v29, (uint64_t)v24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v12 = sub_23DEA6458(v6, v7, v8, v9);
    v13 = v2[2];
    v14 = (v11 & 1) == 0;
    v15 = v13 + v14;
    if (__OFADD__(v13, v14))
      break;
    v16 = v11;
    if (v2[3] >= v15)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v11 & 1) != 0)
          goto LABEL_3;
      }
      else
      {
        sub_23DECAE98();
        if ((v16 & 1) != 0)
          goto LABEL_3;
      }
    }
    else
    {
      sub_23DEC8164(v15, isUniquelyReferenced_nonNull_native);
      v17 = sub_23DEA6458(v6, v7, v8, v9);
      if ((v16 & 1) != (v18 & 1))
        goto LABEL_20;
      v12 = v17;
      if ((v16 & 1) != 0)
      {
LABEL_3:
        v5 = v2[7] + 40 * v12;
        __swift_destroy_boxed_opaque_existential_1(v5);
        sub_23DE902DC(v24, v5);
        goto LABEL_4;
      }
    }
    v2[(v12 >> 6) + 8] |= 1 << v12;
    v19 = (uint64_t *)(v2[6] + 32 * v12);
    *v19 = v6;
    v19[1] = v7;
    v19[2] = v8;
    v19[3] = v9;
    sub_23DE902DC(v24, v2[7] + 40 * v12);
    v20 = v2[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (v21)
      goto LABEL_19;
    v2[2] = v22;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_4:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
    sub_23DE9A9BC((uint64_t)&v35, (uint64_t (*)(_QWORD))sub_23DE955F8);
    v4 += 72;
    if (!--v3)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  result = sub_23DF15424();
  __break(1u);
  return result;
}

uint64_t InputSignalAnchorSet.updated(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  v2 = swift_bridgeObjectRetain();
  v3 = sub_23DF00440(v2, v1);
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v3;
  return result;
}

uint64_t InputSignalAnchorSet.__allocating_init(signalAnchors:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

{
  uint64_t v2;

  swift_allocObject();
  v2 = sub_23DF02C88(a1);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t InputSignalAnchorSet.anchor<A>(for:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t AssociatedTypeWitness;
  int v9;
  _OWORD v11[2];
  uint64_t v12;
  uint64_t v13[4];

  v5 = *(_QWORD *)(v3 + 16);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 40))(v13, a1, a2);
  if (*(_QWORD *)(v5 + 16) && (v6 = sub_23DEA6458(v13[0], v13[1], v13[2], v13[3]), (v7 & 1) != 0))
  {
    sub_23DE902F4(*(_QWORD *)(v5 + 56) + 40 * v6, (uint64_t)v11);
  }
  else
  {
    v12 = 0;
    memset(v11, 0, sizeof(v11));
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23DF02FA0(0, (unint64_t *)&qword_25432D450, qword_25432C070);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = swift_dynamicCast();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(a3, v9 ^ 1u, 1, AssociatedTypeWitness);
}

uint64_t InputSignalAnchorSet.updated(anchor:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = a1[3];
  v3 = a1[4];
  v4 = __swift_project_boxed_opaque_existential_1(a1, v2);
  return sub_23DF01F0C((uint64_t)v4, v1, v2, v3);
}

uint64_t InputSignalAnchorSet.signalAnchors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t InputSignalAnchorSet.subscript.getter@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t AssociatedTypeWitness;
  int v12;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v4 = *(_QWORD *)(v2 + 16);
  if (*(_QWORD *)(v4 + 16))
  {
    v6 = *a1;
    v5 = a1[1];
    v8 = a1[2];
    v7 = a1[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = sub_23DEA6458(v6, v5, v8, v7);
    if ((v10 & 1) != 0)
    {
      sub_23DE902F4(*(_QWORD *)(v4 + 56) + 40 * v9, (uint64_t)&v14);
    }
    else
    {
      v16 = 0;
      v14 = 0u;
      v15 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v16 = 0;
    v14 = 0u;
    v15 = 0u;
  }
  sub_23DF02FA0(0, (unint64_t *)&qword_25432D450, qword_25432C070);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v12 = swift_dynamicCast();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(a2, v12 ^ 1u, 1, AssociatedTypeWitness);
}

double sub_23DF00AEC@<D0>(uint64_t *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *boxed_opaque_existential_1;
  double result;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _BYTE v20[40];

  v5 = *(_QWORD *)(a3 + 16);
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = *a1;
    v7 = a1[1];
    v10 = a1[2];
    v9 = a1[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11 = sub_23DEA6458(v8, v7, v10, v9);
    if ((v12 & 1) != 0)
    {
      sub_23DE902F4(*(_QWORD *)(v5 + 56) + 40 * v11, (uint64_t)&v17);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v18 + 1))
      {
        sub_23DE902DC(&v17, (uint64_t)v20);
        *(_QWORD *)a4 = v8;
        *(_QWORD *)(a4 + 8) = v7;
        *(_QWORD *)(a4 + 16) = v10;
        *(_QWORD *)(a4 + 24) = v9;
        v13 = a2[3];
        v14 = a2[4];
        __swift_project_boxed_opaque_existential_1(a2, v13);
        *(_QWORD *)(a4 + 56) = v13;
        *(_QWORD *)(a4 + 64) = v14;
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(a4 + 32));
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_23DE8FADC((uint64_t)v20, v13, v14, (uint64_t)boxed_opaque_existential_1);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
        return result;
      }
    }
    else
    {
      v19 = 0;
      v17 = 0u;
      v18 = 0u;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v19 = 0;
    v17 = 0u;
    v18 = 0u;
  }
  sub_23DF02F64((uint64_t)&v17, (unint64_t *)&qword_25432D450, qword_25432C070);
  *(_QWORD *)(a4 + 64) = 0;
  result = 0.0;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  return result;
}

double sub_23DF00C60@<D0>(uint64_t *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_23DF00AEC(a1, a2, v3, a3);
}

uint64_t InputSignalAnchorSet.hasDifference(from:for:)(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21[4];
  uint64_t v22[3];
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 16);
    v5 = a2[3];
    v6 = a2[4];
    __swift_project_boxed_opaque_existential_1(a2, v5);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v6 + 16))(v22, v5, v6);
    if (*(_QWORD *)(v4 + 16) && (v7 = sub_23DEA6458(v22[0], v22[1], v22[2], v23), (v8 & 1) != 0))
    {
      sub_23DE902F4(*(_QWORD *)(v4 + 56) + 40 * v7, (uint64_t)&v25);
    }
    else
    {
      v27 = 0;
      v25 = 0u;
      v26 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v27 = 0;
    v25 = 0u;
    v26 = 0u;
  }
  v9 = *(_QWORD *)(v2 + 16);
  v10 = a2[3];
  v11 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v10);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v11 + 16))(v21, v10, v11);
  if (*(_QWORD *)(v9 + 16) && (v12 = sub_23DEA6458(v21[0], v21[1], v21[2], v21[3]), (v13 & 1) != 0))
  {
    sub_23DE902F4(*(_QWORD *)(v9 + 56) + 40 * v12, (uint64_t)&v18);
  }
  else
  {
    v20 = 0;
    v18 = 0u;
    v19 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v19 + 1))
  {
    sub_23DE902DC(&v18, (uint64_t)v22);
    v14 = v23;
    v15 = v24;
    __swift_project_boxed_opaque_existential_1(v22, v23);
    v16 = sub_23DE8FDD0((uint64_t)&v25, (uint64_t)a2, v14, v15);
    sub_23DF02F64((uint64_t)&v25, (unint64_t *)&qword_25432D450, qword_25432C070);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  }
  else
  {
    sub_23DF02F64((uint64_t)&v25, (unint64_t *)&qword_25432D450, qword_25432C070);
    sub_23DF02F64((uint64_t)&v18, (unint64_t *)&qword_25432D450, qword_25432C070);
    v16 = 0;
  }
  return v16 & 1;
}

uint64_t InputSignalAnchorSet.init(signalAnchors:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

{
  uint64_t v1;

  v1 = sub_23DF02C88(a1);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t InputSignalAnchorSet.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t InputSignalAnchorSet.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_23DF00F48(_QWORD *a1)
{
  __int128 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  sub_23DF0321C(0, &qword_25432DB10, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x24BEE3520]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v6);
  v8 = (char *)&v14 - v7;
  v16 = *v1;
  v10 = *((_QWORD *)v1 + 2);
  v9 = *((_QWORD *)v1 + 3);
  v11 = *((_QWORD *)v1 + 4);
  v14 = *((_QWORD *)v1 + 5);
  v15 = v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DF031D8();
  sub_23DF154C0();
  v18 = v16;
  v19 = v10;
  v20 = v9;
  v21 = 0;
  sub_23DE90E54();
  v12 = v17;
  sub_23DF15388();
  if (!v12)
  {
    *(_QWORD *)&v18 = v15;
    *((_QWORD *)&v18 + 1) = v14;
    v21 = 1;
    sub_23DE90E10();
    sub_23DF15388();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t sub_23DF010B8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  sub_23DF0321C(0, &qword_25432DB00, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x24BEE33E0]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v8);
  v10 = (char *)&v16 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DF031D8();
  sub_23DF154B4();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v22 = 0;
  sub_23DE90B4C();
  sub_23DF15334();
  v11 = v19;
  v12 = v21;
  v16 = v20;
  v17 = v18;
  v22 = 1;
  sub_23DE90AC4();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23DF15334();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  v13 = v18;
  v14 = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23DEB18A4(v13, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *a2 = v17;
  a2[1] = v11;
  a2[2] = v16;
  a2[3] = v12;
  a2[4] = v13;
  a2[5] = v14;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_23DE90B08(v13, v14);
}

uint64_t sub_23DF012F4(uint64_t *a1, uint64_t *a2)
{
  return _s19HealthOrchestration20InputSignalAnchorSetC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t sub_23DF01300()
{
  _BYTE *v0;

  if (*v0)
    return 0x536465646F636E65;
  else
    return 0xD000000000000010;
}

uint64_t sub_23DF0134C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23DF03470(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23DF01370()
{
  sub_23DF031D8();
  return sub_23DF154CC();
}

uint64_t sub_23DF01398()
{
  sub_23DF031D8();
  return sub_23DF154D8();
}

uint64_t sub_23DF013C0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23DF010B8(a1, a2);
}

uint64_t sub_23DF013D4(_QWORD *a1)
{
  return sub_23DF00F48(a1);
}

uint64_t InputSignalAnchorSet.archived()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = v0;
  sub_23DF14B24();
  swift_allocObject();
  v3 = sub_23DF14B18();
  v4 = *(_QWORD *)(v2 + 16);
  v5 = swift_bridgeObjectRetain();
  sub_23DF02680(v5, (void (*)(_QWORD *__return_ptr, _OWORD *, _OWORD *))sub_23DF02E0C, v3);
  if (v1)
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_23DF02E24();
    sub_23DF02EBC(&qword_25432D8E8, (uint64_t (*)(void))sub_23DF02E78, MEMORY[0x24BEE12A0]);
    v4 = sub_23DF14B0C();
    swift_bridgeObjectRelease();
    swift_release();
  }
  return v4;
}

uint64_t sub_23DF014EC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v6 = *a1;
  v5 = a1[1];
  v8 = a1[2];
  v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  result = sub_23DF14B0C();
  if (!v3)
  {
    *a3 = v6;
    a3[1] = v5;
    a3[2] = v8;
    a3[3] = v7;
    a3[4] = result;
    a3[5] = v10;
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t InputSignalAnchorSet.__allocating_init(from:signals:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  unint64_t v23;
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
  unint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[24];
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t AssociatedConformanceWitness;
  _QWORD v48[4];
  unint64_t v49;

  v41 = *a3;
  sub_23DF14B00();
  swift_allocObject();
  v7 = sub_23DF14AF4();
  sub_23DF02E24();
  sub_23DF02EBC((unint64_t *)&unk_25432D8F0, (uint64_t (*)(void))sub_23DF02F20, MEMORY[0x24BEE12D0]);
  sub_23DF14AE8();
  v40 = v4;
  if (v4)
  {
    sub_23DE90B08(a1, a2);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  v9 = *(_QWORD *)(v48[0] + 16);
  if (v9)
  {
    v31 = v3;
    v33 = v7;
    v34 = a1;
    v35 = a2;
    v32 = swift_bridgeObjectRetain();
    v10 = (unint64_t *)(v32 + 72);
    v11 = MEMORY[0x24BEE4B00];
    while (1)
    {
      v14 = *(v10 - 4);
      v16 = *(v10 - 2);
      v15 = *(v10 - 1);
      v17 = *v10;
      if (!*(_QWORD *)(v41 + 16))
        break;
      v18 = *(v10 - 5);
      v19 = *(v10 - 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23DEB18A4(v15, v17);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v39 = v19;
      v20 = sub_23DEA6458(v18, v14, v19, v16);
      if ((v21 & 1) != 0)
      {
        sub_23DE902F4(*(_QWORD *)(v41 + 56) + 40 * v20, (uint64_t)&v45);
      }
      else
      {
        AssociatedConformanceWitness = 0;
        v45 = 0u;
        v46 = 0u;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!*((_QWORD *)&v46 + 1))
        goto LABEL_6;
      v36 = v18;
      v38 = v11;
      sub_23DE902DC(&v45, (uint64_t)v48);
      v37 = __swift_project_boxed_opaque_existential_1(v48, v48[3]);
      *((_QWORD *)&v46 + 1) = swift_getAssociatedTypeWitness();
      AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v45);
      v22 = v40;
      sub_23DF01A7C();
      v40 = v22;
      if (v22)
      {
        __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v45);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_23DE90B08(v15, v17);
        swift_bridgeObjectRelease();
        sub_23DE90B08(v34, v35);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return swift_release();
      }
      sub_23DE902F4((uint64_t)&v45, (uint64_t)v42);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v23 = v38;
      LODWORD(v37) = swift_isUniquelyReferenced_nonNull_native();
      v49 = v23;
      v38 = v17;
      v24 = v43;
      v25 = v44;
      v26 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v42, v43);
      MEMORY[0x24BDAC7A8](v26, v26);
      v28 = v15;
      v29 = (char *)&v31 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v30 + 16))(v29);
      sub_23DF02080((uint64_t)v29, v36, v14, v39, v16, (char)v37, &v49, v24, v25);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
      v11 = v49;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v45);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v12 = v28;
      v13 = v38;
LABEL_7:
      sub_23DE90B08(v12, v13);
      v10 += 6;
      if (!--v9)
      {
        swift_bridgeObjectRelease();
        a2 = v35;
        a1 = v34;
        goto LABEL_17;
      }
    }
    AssociatedConformanceWitness = 0;
    v45 = 0u;
    v46 = 0u;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23DEB18A4(v15, v17);
LABEL_6:
    sub_23DF02F64((uint64_t)&v45, qword_25432D318, (unint64_t *)&qword_25432D308);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v12 = v15;
    v13 = v17;
    goto LABEL_7;
  }
  v11 = MEMORY[0x24BEE4B00];
LABEL_17:
  swift_release();
  sub_23DE90B08(a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v11;
  return result;
}

uint64_t sub_23DF01A7C()
{
  sub_23DF14B00();
  swift_allocObject();
  sub_23DF14AF4();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  sub_23DF14AE8();
  return swift_release();
}

unint64_t InputSignalAnchorSet.description.getter()
{
  sub_23DF15190();
  swift_bridgeObjectRelease();
  sub_23DE90254(0, qword_25432C070);
  sub_23DE95570();
  swift_bridgeObjectRetain();
  sub_23DF14DA0();
  sub_23DF14E60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23DF14E60();
  return 0xD000000000000015;
}

unint64_t sub_23DF01C38()
{
  return InputSignalAnchorSet.description.getter();
}

uint64_t sub_23DF01C58@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[1];
  v3 = a1[2];
  v4 = a1[3];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v3;
  a2[3] = v4;
  sub_23DE902F4((uint64_t)(a1 + 4), (uint64_t)(a2 + 4));
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23DF01C9C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
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
  char v18;
  unint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  char v23;
  unint64_t v24;
  char v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t result;
  __int128 v32[2];
  __int128 v33[2];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[13];
  __int128 *v39;

  v7 = -1 << *(_BYTE *)(a1 + 32);
  v8 = ~v7;
  v9 = *(_QWORD *)(a1 + 64);
  v10 = -v7;
  v38[5] = a1;
  v38[6] = a1 + 64;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  else
    v11 = -1;
  v38[7] = v8;
  v38[8] = 0;
  v38[9] = v11 & v9;
  v38[10] = a2;
  v38[11] = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23DEE2F4C((uint64_t)&v34);
  v12 = v35;
  if (!v35)
  {
LABEL_19:
    swift_release();
    swift_bridgeObjectRelease();
    sub_23DEA8AD4();
    return swift_release();
  }
  v39 = (__int128 *)v38;
  while (1)
  {
    v14 = v34;
    v15 = v36;
    v16 = v37;
    sub_23DE902DC(v39, (uint64_t)v33);
    v17 = *a5;
    v19 = sub_23DEA6458(v14, v12, v15, v16);
    v20 = *(_QWORD *)(v17 + 16);
    v21 = (v18 & 1) == 0;
    v22 = v20 + v21;
    if (__OFADD__(v20, v21))
      break;
    v23 = v18;
    if (*(_QWORD *)(v17 + 24) >= v22)
    {
      if ((a4 & 1) != 0)
      {
        if ((v18 & 1) != 0)
          goto LABEL_6;
      }
      else
      {
        sub_23DECAE98();
        if ((v23 & 1) != 0)
          goto LABEL_6;
      }
    }
    else
    {
      sub_23DEC8164(v22, a4 & 1);
      v24 = sub_23DEA6458(v14, v12, v15, v16);
      if ((v23 & 1) != (v25 & 1))
        goto LABEL_22;
      v19 = v24;
      if ((v23 & 1) != 0)
      {
LABEL_6:
        sub_23DE902F4((uint64_t)v33, (uint64_t)v32);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v13 = *(_QWORD *)(*a5 + 56) + 40 * v19;
        __swift_destroy_boxed_opaque_existential_1(v13);
        sub_23DE902DC(v32, v13);
        goto LABEL_7;
      }
    }
    v26 = (_QWORD *)*a5;
    *(_QWORD *)(*a5 + 8 * (v19 >> 6) + 64) |= 1 << v19;
    v27 = (uint64_t *)(v26[6] + 32 * v19);
    *v27 = v14;
    v27[1] = v12;
    v27[2] = v15;
    v27[3] = v16;
    sub_23DE902DC(v33, v26[7] + 40 * v19);
    v28 = v26[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
      goto LABEL_21;
    v26[2] = v30;
LABEL_7:
    sub_23DEE2F4C((uint64_t)&v34);
    v12 = v35;
    a4 = 1;
    if (!v35)
      goto LABEL_19;
  }
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  result = sub_23DF15424();
  __break(1u);
  return result;
}

uint64_t sub_23DF01F0C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *);
  uint64_t v16;
  void (*v17)(_QWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];

  v7 = *a2;
  v25 = *(_QWORD *)(a3 - 8);
  v26 = v7;
  v8 = MEMORY[0x24BDAC7A8](a1, a1);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8, v11);
  v13 = (char *)&v24 - v12;
  v15 = *(void (**)(char *))(v14 + 16);
  v15((char *)&v24 - v12);
  v16 = a2[2];
  v17 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(a4 + 48);
  swift_bridgeObjectRetain();
  v17(v28, a3, a4);
  v18 = v28[1];
  v24 = v28[0];
  v19 = v28[2];
  v20 = v28[3];
  LOBYTE(v17) = swift_isUniquelyReferenced_nonNull_native();
  v27 = v16;
  ((void (*)(char *, char *, uint64_t))v15)(v10, v13, a3);
  sub_23DF02080((uint64_t)v10, v24, v18, v19, v20, (char)v17, &v27, a3, a4);
  v21 = v27;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v21;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v13, a3);
  return v22;
}

uint64_t sub_23DF02080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, _QWORD *a7, uint64_t a8, uint64_t a9)
{
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v18;
  char v19;
  unint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t result;
  unint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;

  v37 = a8;
  v38 = a9;
  v35 = a9;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v36);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a8 - 8) + 32))(boxed_opaque_existential_1, a1, a8);
  v18 = (_QWORD *)*a7;
  v20 = sub_23DEA6458(a2, a3, a4, a5);
  v21 = v18[2];
  v22 = (v19 & 1) == 0;
  v23 = v21 + v22;
  if (__OFADD__(v21, v22))
  {
    __break(1u);
    goto LABEL_14;
  }
  v24 = v19;
  v25 = v18[3];
  if (v25 >= v23 && (a6 & 1) != 0)
  {
LABEL_7:
    v26 = (_QWORD *)*a7;
    if ((v24 & 1) != 0)
    {
LABEL_8:
      v27 = v26[7] + 40 * v20;
      __swift_destroy_boxed_opaque_existential_1(v27);
      return sub_23DE902DC(&v36, v27);
    }
    goto LABEL_11;
  }
  if (v25 >= v23 && (a6 & 1) == 0)
  {
    sub_23DECAE98();
    goto LABEL_7;
  }
  sub_23DEC8164(v23, a6 & 1);
  v29 = sub_23DEA6458(a2, a3, a4, a5);
  if ((v24 & 1) != (v30 & 1))
  {
LABEL_14:
    result = sub_23DF15424();
    __break(1u);
    return result;
  }
  v20 = v29;
  v26 = (_QWORD *)*a7;
  if ((v24 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  v31 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v36, v37);
  MEMORY[0x24BDAC7A8](v31, v31);
  v33 = (char *)&v35 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v34 + 16))(v33);
  sub_23DF02280(v20, a2, a3, a4, a5, (uint64_t)v33, v26, a8, v35);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v36);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23DF02280(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7, uint64_t a8, uint64_t a9)
{
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v18;
  uint64_t result;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  v24 = a8;
  v25 = a9;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v23);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a8 - 8) + 32))(boxed_opaque_existential_1, a6, a8);
  a7[(a1 >> 6) + 8] |= 1 << a1;
  v18 = (_QWORD *)(a7[6] + 32 * a1);
  *v18 = a2;
  v18[1] = a3;
  v18[2] = a4;
  v18[3] = a5;
  result = sub_23DE902DC(&v23, a7[7] + 40 * a1);
  v20 = a7[2];
  v21 = __OFADD__(v20, 1);
  v22 = v20 + 1;
  if (v21)
    __break(1u);
  else
    a7[2] = v22;
  return result;
}

uint64_t _s19HealthOrchestration20InputSignalAnchorSetC2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  _QWORD v31[3];
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  _OWORD v35[2];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41[3];

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(v2 + 16) != *(_QWORD *)(v3 + 16))
    return 0;
  v26 = v2 + 64;
  v4 = 1 << *(_BYTE *)(v2 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(v2 + 64);
  v27 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  if (!v6)
    goto LABEL_7;
LABEL_5:
  v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  v10 = v9 | (v8 << 6);
  while (2)
  {
    v11 = *(_QWORD *)(v2 + 56);
    v12 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 32 * v10);
    v13 = v12[1];
    v14 = v12[2];
    v15 = v12[3];
    *(_QWORD *)&v33 = *v12;
    *((_QWORD *)&v33 + 1) = v13;
    *(_QWORD *)&v34 = v14;
    *((_QWORD *)&v34 + 1) = v15;
    sub_23DE902F4(v11 + 40 * v10, (uint64_t)v35);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_23DF03278((uint64_t)&v33, (uint64_t)&v37);
      v19 = v38;
      if (!v38)
      {
        swift_release();
        return 1;
      }
      v20 = v37;
      v21 = v39;
      v22 = v40;
      sub_23DE902DC(v41, (uint64_t)&v33);
      if (*(_QWORD *)(v3 + 16) && (v23 = sub_23DEA6458(v20, v19, v21, v22), (v24 & 1) != 0))
      {
        sub_23DE902F4(*(_QWORD *)(v3 + 56) + 40 * v23, (uint64_t)&v28);
      }
      else
      {
        v30 = 0;
        v28 = 0u;
        v29 = 0u;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!*((_QWORD *)&v29 + 1))
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v33);
        swift_release();
        sub_23DF02F64((uint64_t)&v28, (unint64_t *)&qword_25432D450, qword_25432C070);
        return 0;
      }
      sub_23DE902DC(&v28, (uint64_t)v31);
      v25 = v32;
      __swift_project_boxed_opaque_existential_1(v31, v32);
      LOBYTE(v25) = sub_23DE8FC5C((uint64_t)&v33, v25);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v33);
      if ((v25 & 1) == 0)
      {
        swift_release();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
        return 0;
      }
      result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
      if (v6)
        goto LABEL_5;
LABEL_7:
      v16 = v8 + 1;
      if (__OFADD__(v8, 1))
      {
        __break(1u);
        goto LABEL_39;
      }
      if (v16 < v27)
      {
        v17 = *(_QWORD *)(v26 + 8 * v16);
        if (v17)
          goto LABEL_10;
        v18 = v8 + 2;
        ++v8;
        if (v16 + 1 < v27)
        {
          v17 = *(_QWORD *)(v26 + 8 * v18);
          if (v17)
            goto LABEL_13;
          v8 = v16 + 1;
          if (v16 + 2 < v27)
          {
            v17 = *(_QWORD *)(v26 + 8 * (v16 + 2));
            if (v17)
            {
              v16 += 2;
              goto LABEL_10;
            }
            v18 = v16 + 3;
            v8 = v16 + 2;
            if (v16 + 3 < v27)
              break;
          }
        }
      }
LABEL_24:
      v6 = 0;
      v36 = 0;
      memset(v35, 0, sizeof(v35));
      v33 = 0u;
      v34 = 0u;
    }
    v17 = *(_QWORD *)(v26 + 8 * v18);
    if (v17)
    {
LABEL_13:
      v16 = v18;
LABEL_10:
      v6 = (v17 - 1) & v17;
      v10 = __clz(__rbit64(v17)) + (v16 << 6);
      v8 = v16;
      continue;
    }
    break;
  }
  while (1)
  {
    v16 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v16 >= v27)
    {
      v8 = v27 - 1;
      goto LABEL_24;
    }
    v17 = *(_QWORD *)(v26 + 8 * v16);
    ++v18;
    if (v17)
      goto LABEL_10;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_23DF02680(uint64_t a1, void (*a2)(_QWORD *__return_ptr, _OWORD *, _OWORD *), uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  int64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _OWORD v45[2];
  _OWORD v46[2];
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  _OWORD v50[2];
  uint64_t v51;
  _QWORD v52[4];
  _BYTE v53[40];
  _QWORD v54[7];
  uint64_t v55;

  v4 = v3;
  v5 = *(_QWORD *)(a1 + 16);
  v6 = MEMORY[0x24BEE4AF8];
  if (!v5)
    return v6;
  v7 = a1;
  v55 = MEMORY[0x24BEE4AF8];
  sub_23DEAA4DC(0, v5, 0);
  result = sub_23DECC8A8(v7);
  v10 = result;
  v11 = 0;
  v12 = v7 + 64;
  v39 = v7;
  v13 = *(_BYTE *)(v7 + 32);
  v35 = v7 + 80;
  v36 = v5;
  v37 = v9;
  v38 = v7 + 64;
  while ((v10 & 0x8000000000000000) == 0 && v10 < 1 << v13)
  {
    v16 = (unint64_t)v10 >> 6;
    if ((*(_QWORD *)(v12 + 8 * ((unint64_t)v10 >> 6)) & (1 << v10)) == 0)
      goto LABEL_27;
    if (*(_DWORD *)(v7 + 36) != v9)
      goto LABEL_28;
    v44 = v11;
    v17 = *(_QWORD *)(v7 + 56);
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 32 * v10);
    v20 = v18[1];
    v22 = v18[2];
    v21 = v18[3];
    v52[0] = *v18;
    v19 = v52[0];
    v52[1] = v20;
    v52[2] = v22;
    v52[3] = v21;
    sub_23DE902F4(v17 + 40 * v10, (uint64_t)v53);
    *(_QWORD *)&v48 = v19;
    *((_QWORD *)&v48 + 1) = v20;
    *(_QWORD *)&v49 = v22;
    *((_QWORD *)&v49 + 1) = v21;
    sub_23DE902F4((uint64_t)v53, (uint64_t)v50);
    v46[0] = v50[0];
    v46[1] = v50[1];
    v47 = v51;
    v45[0] = v48;
    v45[1] = v49;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    sub_23DE9A9BC((uint64_t)v52, (uint64_t (*)(_QWORD))sub_23DECDEF8);
    v6 = a3;
    a2(v54, v45, v46);
    sub_23DE9A9BC((uint64_t)v45, (uint64_t (*)(_QWORD))sub_23DECDEF8);
    if (v4)
    {
      swift_release();
      return v6;
    }
    v23 = v54[0];
    v24 = v54[1];
    v26 = v54[2];
    v25 = v54[3];
    v42 = v54[5];
    v43 = v54[4];
    v6 = v55;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = sub_23DEAA4DC(0, *(_QWORD *)(v6 + 16) + 1, 1);
      v6 = v55;
    }
    v28 = *(_QWORD *)(v6 + 16);
    v27 = *(_QWORD *)(v6 + 24);
    if (v28 >= v27 >> 1)
    {
      result = sub_23DEAA4DC(v27 > 1, v28 + 1, 1);
      v6 = v55;
    }
    *(_QWORD *)(v6 + 16) = v28 + 1;
    v29 = (_QWORD *)(v6 + 48 * v28);
    v29[4] = v23;
    v29[5] = v24;
    v29[6] = v26;
    v29[7] = v25;
    v29[8] = v43;
    v29[9] = v42;
    v7 = v39;
    v13 = *(_BYTE *)(v39 + 32);
    v14 = 1 << v13;
    if (v10 >= 1 << v13)
      goto LABEL_29;
    v12 = v38;
    v30 = *(_QWORD *)(v38 + 8 * v16);
    if ((v30 & (1 << v10)) == 0)
      goto LABEL_30;
    v9 = v37;
    if (*(_DWORD *)(v39 + 36) != v37)
      goto LABEL_31;
    v31 = v30 & (-2 << (v10 & 0x3F));
    if (v31)
    {
      v14 = __clz(__rbit64(v31)) | v10 & 0xFFFFFFFFFFFFFFC0;
      v4 = 0;
      v15 = v36;
    }
    else
    {
      v32 = v16 + 1;
      v33 = (v14 + 63) >> 6;
      v4 = 0;
      v15 = v36;
      if (v16 + 1 < v33)
      {
        v34 = *(_QWORD *)(v38 + 8 * v32);
        if (v34)
        {
LABEL_23:
          v14 = __clz(__rbit64(v34)) + (v32 << 6);
        }
        else
        {
          while (v33 - 2 != v16)
          {
            v34 = *(_QWORD *)(v35 + 8 * v16++);
            if (v34)
            {
              v32 = v16 + 1;
              goto LABEL_23;
            }
          }
        }
      }
    }
    v11 = v44 + 1;
    v10 = v14;
    if (v44 + 1 == v15)
      return v6;
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_23DF029B8(uint64_t a1, void (*a2)(_OWORD *__return_ptr, _QWORD *, _BYTE *))
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t result;
  int64_t v7;
  unint64_t v8;
  unint64_t i;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  int64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  _OWORD v29[4];
  uint64_t v30;
  _QWORD v31[4];
  _BYTE v32[48];
  void (*v33)(_OWORD *__return_ptr, _QWORD *, _BYTE *);

  v33 = a2;
  v22 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v23 = (unint64_t)(v3 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  v21 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (!v5)
    goto LABEL_7;
LABEL_4:
  v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  for (i = v8 | (v7 << 6); ; i = __clz(__rbit64(v16)) + (v7 << 6))
  {
    v10 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 32 * i);
    v11 = *v10;
    v12 = v10[1];
    v13 = v10[2];
    v14 = v10[3];
    sub_23DE902F4(*(_QWORD *)(a1 + 56) + 40 * i, (uint64_t)v32);
    v31[0] = v11;
    v31[1] = v12;
    v31[2] = v13;
    v31[3] = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v33(v29, v31, v32);
    sub_23DE9A9BC((uint64_t)v31, (uint64_t (*)(_QWORD))sub_23DECDEF8);
    if (*((_QWORD *)&v29[0] + 1))
    {
      v26 = v29[2];
      v27 = v29[3];
      v28 = v30;
      v24 = v29[0];
      v25 = v29[1];
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_23DF0684C(0, v21[2] + 1, 1, v21);
        v21 = (_QWORD *)result;
      }
      v19 = v21[2];
      v18 = v21[3];
      if (v19 >= v18 >> 1)
      {
        result = (uint64_t)sub_23DF0684C((_QWORD *)(v18 > 1), v19 + 1, 1, v21);
        v21 = (_QWORD *)result;
      }
      v21[2] = v19 + 1;
      v20 = &v21[9 * v19];
      *((_OWORD *)v20 + 2) = v24;
      v20[12] = v28;
      *((_OWORD *)v20 + 4) = v26;
      *((_OWORD *)v20 + 5) = v27;
      *((_OWORD *)v20 + 3) = v25;
      if (v5)
        goto LABEL_4;
    }
    else
    {
      result = sub_23DECEBD0((uint64_t)v29);
      if (v5)
        goto LABEL_4;
    }
LABEL_7:
    v15 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v15 >= v23)
      goto LABEL_29;
    v16 = *(_QWORD *)(v22 + 8 * v15);
    ++v7;
    if (!v16)
    {
      v7 = v15 + 1;
      if (v15 + 1 >= v23)
        goto LABEL_29;
      v16 = *(_QWORD *)(v22 + 8 * v7);
      if (!v16)
      {
        v7 = v15 + 2;
        if (v15 + 2 >= v23)
          goto LABEL_29;
        v16 = *(_QWORD *)(v22 + 8 * v7);
        if (!v16)
        {
          v7 = v15 + 3;
          if (v15 + 3 >= v23)
            goto LABEL_29;
          v16 = *(_QWORD *)(v22 + 8 * v7);
          if (!v16)
            break;
        }
      }
    }
LABEL_22:
    v5 = (v16 - 1) & v16;
  }
  v17 = v15 + 4;
  if (v17 >= v23)
  {
LABEL_29:
    swift_release();
    return (uint64_t)v21;
  }
  v16 = *(_QWORD *)(v22 + 8 * v17);
  if (v16)
  {
    v7 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    v7 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v7 >= v23)
      goto LABEL_29;
    v16 = *(_QWORD *)(v22 + 8 * v7);
    ++v17;
    if (v16)
      goto LABEL_22;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_23DF02C88(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[24];
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  _QWORD v25[3];
  uint64_t v26;
  uint64_t v27;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = a1 + 32;
    v3 = MEMORY[0x24BEE4B00];
    do
    {
      sub_23DE902F4(v2, (uint64_t)v25);
      v4 = v26;
      v5 = v27;
      __swift_project_boxed_opaque_existential_1(v25, v26);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v5 + 48))(v24, v4, v5);
      v6 = v24[1];
      v19 = v24[0];
      v8 = v24[2];
      v7 = v24[3];
      sub_23DE902F4((uint64_t)v25, (uint64_t)v21);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v20 = v3;
      v11 = v22;
      v10 = v23;
      v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v22);
      MEMORY[0x24BDAC7A8](v12, v12);
      v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v15 + 16))(v14);
      sub_23DF02080((uint64_t)v14, v19, v6, v8, v7, isUniquelyReferenced_nonNull_native, &v20, v11, v10);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
      v3 = v20;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      v2 += 40;
      --v1;
    }
    while (v1);
  }
  else
  {
    v3 = MEMORY[0x24BEE4B00];
  }
  result = v18;
  *(_QWORD *)(v18 + 16) = v3;
  return result;
}

uint64_t sub_23DF02E0C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  return sub_23DF014EC(a1, a2, a3);
}

void sub_23DF02E24()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432C298)
  {
    v0 = sub_23DF14F14();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432C298);
  }
}

unint64_t sub_23DF02E78()
{
  unint64_t result;

  result = qword_25432C270;
  if (!qword_25432C270)
  {
    result = MEMORY[0x2426483D0](&unk_23DF1B640, &type metadata for InputSignalAnchorSet.EncodedAnchor);
    atomic_store(result, (unint64_t *)&qword_25432C270);
  }
  return result;
}

uint64_t sub_23DF02EBC(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    sub_23DF02E24();
    v8 = v7;
    v9 = a2();
    result = MEMORY[0x2426483D0](a3, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23DF02F20()
{
  unint64_t result;

  result = qword_25432D658;
  if (!qword_25432D658)
  {
    result = MEMORY[0x2426483D0](&unk_23DF1B618, &type metadata for InputSignalAnchorSet.EncodedAnchor);
    atomic_store(result, (unint64_t *)&qword_25432D658);
  }
  return result;
}

uint64_t sub_23DF02F64(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  uint64_t v4;

  sub_23DF02FA0(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_23DF02FA0(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_23DE90254(255, a3);
    v4 = sub_23DF150F4();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x242648490);
  return result;
}

uint64_t type metadata accessor for InputSignalAnchorSet()
{
  return objc_opt_self();
}

uint64_t method lookup function for InputSignalAnchorSet()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InputSignalAnchorSet.__allocating_init(signalAnchors:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t destroy for InputSignalAnchorSet.EncodedAnchor(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_23DE90B08(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

_QWORD *initializeWithCopy for InputSignalAnchorSet.EncodedAnchor(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[4];
  v6 = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23DEB18A4(v5, v6);
  a1[4] = v5;
  a1[5] = v6;
  return a1;
}

_QWORD *assignWithCopy for InputSignalAnchorSet.EncodedAnchor(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = a2[4];
  v4 = a2[5];
  sub_23DEB18A4(v5, v4);
  v6 = a1[4];
  v7 = a1[5];
  a1[4] = v5;
  a1[5] = v4;
  sub_23DE90B08(v6, v7);
  return a1;
}

_QWORD *assignWithTake for InputSignalAnchorSet.EncodedAnchor(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a1[4];
  v7 = a1[5];
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  sub_23DE90B08(v6, v7);
  return a1;
}

ValueMetadata *type metadata accessor for InputSignalAnchorSet.EncodedAnchor()
{
  return &type metadata for InputSignalAnchorSet.EncodedAnchor;
}

unint64_t sub_23DF031D8()
{
  unint64_t result;

  result = qword_25432D640;
  if (!qword_25432D640)
  {
    result = MEMORY[0x2426483D0](&unk_23DF1B72C, &type metadata for InputSignalAnchorSet.EncodedAnchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25432D640);
  }
  return result;
}

void sub_23DF0321C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_23DF031D8();
    v7 = a3(a1, &type metadata for InputSignalAnchorSet.EncodedAnchor.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_23DF03278(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DEA8A88(0, &qword_25432DD00, (void (*)(uint64_t))sub_23DECDEF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t storeEnumTagSinglePayload for InputSignalAnchorSet.EncodedAnchor.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23DF03318 + 4 * byte_23DF1B575[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23DF0334C + 4 * byte_23DF1B570[v4]))();
}

uint64_t sub_23DF0334C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF03354(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DF0335CLL);
  return result;
}

uint64_t sub_23DF03368(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DF03370);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23DF03374(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF0337C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InputSignalAnchorSet.EncodedAnchor.CodingKeys()
{
  return &type metadata for InputSignalAnchorSet.EncodedAnchor.CodingKeys;
}

unint64_t sub_23DF0339C()
{
  unint64_t result;

  result = qword_256D0FE78;
  if (!qword_256D0FE78)
  {
    result = MEMORY[0x2426483D0](&unk_23DF1B704, &type metadata for InputSignalAnchorSet.EncodedAnchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D0FE78);
  }
  return result;
}

unint64_t sub_23DF033E4()
{
  unint64_t result;

  result = qword_25432D650;
  if (!qword_25432D650)
  {
    result = MEMORY[0x2426483D0](&unk_23DF1B674, &type metadata for InputSignalAnchorSet.EncodedAnchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25432D650);
  }
  return result;
}

unint64_t sub_23DF0342C()
{
  unint64_t result;

  result = qword_25432D648;
  if (!qword_25432D648)
  {
    result = MEMORY[0x2426483D0](&unk_23DF1B69C, &type metadata for InputSignalAnchorSet.EncodedAnchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25432D648);
  }
  return result;
}

uint64_t sub_23DF03470(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x800000023DF1D990 || (sub_23DF15400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x536465646F636E65 && a2 == 0xED00006C616E6769)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_23DF15400();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

_QWORD *AutoPriorityThresholdController.__allocating_init(target:environment:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t ObjectType;
  char v8;
  uint64_t v9;
  os_unfair_lock_s *v10;
  uint64_t v11;
  os_unfair_lock_s *v12;
  uint64_t v14;

  v6 = (_QWORD *)swift_allocObject();
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 8))(&v14, ObjectType, a2);
  v8 = v14;
  sub_23DF04204();
  v9 = swift_allocObject();
  *(_DWORD *)(v9 + 36) = 0;
  *(_WORD *)(v9 + 16) = 1028;
  *(_BYTE *)(v9 + 18) = v8;
  *(_QWORD *)(v9 + 24) = 0;
  *(_BYTE *)(v9 + 32) = 0;
  v6[2] = v9;
  v6[3] = a1;
  v6[4] = a2;
  v6[5] = a3;
  v10 = *(os_unfair_lock_s **)(a3 + 16);
  v11 = (uint64_t)&v10[4];
  v12 = v10 + 10;
  swift_retain_n();
  swift_unknownObjectRetain();
  swift_retain();
  os_unfair_lock_lock(v12);
  sub_23DF0506C(v11, (uint64_t)v6, (uint64_t)&protocol witness table for AutoPriorityThresholdController);
  os_unfair_lock_unlock(v12);
  swift_release();
  swift_unknownObjectRelease();
  swift_release_n();
  return v6;
}

_QWORD *AutoPriorityThresholdController.init(target:environment:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3 = sub_23DF0410C(a1, a2, a3);
  swift_release();
  return v3;
}

Swift::Void __swiftcall AutoPriorityThresholdController.autoUpdatePriorityThreshold(using:)(HealthOrchestration::PriorityRuleSet using)
{
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  unsigned __int8 *v4;
  os_unfair_lock_s *v5;
  unsigned __int8 v6;

  v2 = *(_QWORD *)using.orderedRules._rawValue;
  v3 = *(os_unfair_lock_s **)(v1 + 16);
  v4 = (unsigned __int8 *)&v3[4];
  v5 = v3 + 9;
  v6 = *((_BYTE *)using.orderedRules._rawValue + 8);
  os_unfair_lock_lock(v3 + 9);
  sub_23DF0372C(v4, v2, v6, v1);
  os_unfair_lock_unlock(v5);
}

void sub_23DF0372C(unsigned __int8 *a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  uint64_t v4;
  int v9;
  char v10;
  uint64_t v11;
  _QWORD *v12;
  os_unfair_lock_s *v13;
  unsigned __int8 rawValue;
  unsigned __int8 v15;
  char v16;
  uint64_t v17;
  uint64_t ObjectType;
  Swift::OpaquePointer fora;
  uint64_t v20;
  unsigned __int8 v21;

  *((_QWORD *)a1 + 1) = a2;
  a1[16] = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = *a1;
  v10 = a1[2];
  v20 = a2;
  v21 = a3;
  v11 = *(_QWORD *)(*(_QWORD *)(a4 + 40) + 16);
  v12 = (_QWORD *)(v11 + 16);
  v13 = (os_unfair_lock_s *)(v11 + 40);
  swift_bridgeObjectRetain();
  os_unfair_lock_lock(v13);
  sub_23DED7914(v12, &fora);
  if (v4)
  {
    os_unfair_lock_unlock(v13);
    __break(1u);
  }
  else
  {
    os_unfair_lock_unlock(v13);
    PriorityRuleSet.priority(for:)(fora);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    rawValue = fora._rawValue;
    a1[1] = fora._rawValue;
    if (v9 == 4)
      v15 = rawValue;
    else
      v15 = v9;
    sub_23DE8D7D0(v10);
    if ((v16 & 1) == 0)
    {
      a1[2] = v15;
      v17 = *(_QWORD *)(a4 + 32);
      ObjectType = swift_getObjectType();
      LOBYTE(v20) = v15;
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v17 + 16))(&v20, ObjectType, v17);
    }
  }
}

Swift::Void __swiftcall AutoPriorityThresholdController.autoUpdatePriorityThreshold(pauseIfAnyMatches:)(Swift::OpaquePointer pauseIfAnyMatches)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 *v5;
  os_unfair_lock_s *v6;

  sub_23DF04260();
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23DF16970;
  *(Swift::OpaquePointer *)(v3 + 32) = pauseIfAnyMatches;
  *(_BYTE *)(v3 + 40) = 1;
  v4 = *(_QWORD *)(v1 + 16);
  v5 = (unsigned __int8 *)(v4 + 16);
  v6 = (os_unfair_lock_s *)(v4 + 36);
  swift_bridgeObjectRetain();
  os_unfair_lock_lock(v6);
  sub_23DF0372C(v5, v3, 3u, v1);
  os_unfair_lock_unlock(v6);
  swift_bridgeObjectRelease();
}

void sub_23DF0390C(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_23DF03994()
{
  uint64_t v0;

  return ((uint64_t (*)(uint64_t))((char *)sub_23DF039F4 + 4 * byte_23DF1B784[v0]))(0x746E65677275);
}

uint64_t sub_23DF039F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t result;
  char v6;
  uint64_t v7;
  uint64_t ObjectType;
  char v9;

  if (a1 == 0x746E65677275 && v3 == 0xE600000000000000)
    return swift_bridgeObjectRelease_n();
  v6 = sub_23DF15400();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v6 & 1) == 0)
  {
    *(_BYTE *)(v1 + 2) = v4;
    v7 = *(_QWORD *)(v2 + 32);
    ObjectType = swift_getObjectType();
    v9 = v4;
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 16))(&v9, ObjectType, v7);
  }
  return result;
}

void AutoPriorityThresholdController.manualPriorityThreshold.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 36));
  *a1 = *(_BYTE *)(v3 + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 36));
}

void sub_23DF03B18(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  char v6;

  v3 = *(os_unfair_lock_s **)(*(_QWORD *)a1 + 16);
  v4 = v3 + 4;
  v5 = v3 + 9;
  os_unfair_lock_lock(v3 + 9);
  sub_23DF03C38(v4, &v6);
  os_unfair_lock_unlock(v5);
  *a2 = v6;
}

void sub_23DF03B80(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;

  v2 = *(os_unfair_lock_s **)(*(_QWORD *)a2 + 16);
  v3 = v2 + 4;
  v4 = v2 + 9;
  os_unfair_lock_lock(v2 + 9);
  sub_23DF044C0(v3);
  os_unfair_lock_unlock(v4);
}

void AutoPriorityThresholdController.manualPriorityThreshold.setter(char *a1)
{
  uint64_t v1;
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  char v5;

  v2 = *(os_unfair_lock_s **)(v1 + 16);
  v3 = v2 + 4;
  v4 = v2 + 9;
  v5 = *a1;
  os_unfair_lock_lock(v2 + 9);
  sub_23DF03C44(v3, v5);
  os_unfair_lock_unlock(v4);
}

_BYTE *sub_23DF03C38@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_23DF03C44(_BYTE *a1, char a2)
{
  *a1 = a2;
  __asm { BR              X10 }
}

uint64_t sub_23DF03CD8()
{
  uint64_t v0;

  return ((uint64_t (*)(uint64_t))((char *)sub_23DF03D38 + 4 * byte_23DF1B78C[v0]))(0x746E65677275);
}

uint64_t sub_23DF03D38(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t result;
  char v6;
  uint64_t v7;
  uint64_t ObjectType;
  char v9;

  if (a1 == 0x746E65677275 && v3 == 0xE600000000000000)
    return swift_bridgeObjectRelease_n();
  v6 = sub_23DF15400();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v6 & 1) == 0)
  {
    *(_BYTE *)(v2 + 2) = v4;
    v7 = *(_QWORD *)(v1 + 32);
    ObjectType = swift_getObjectType();
    v9 = v4;
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 16))(&v9, ObjectType, v7);
  }
  return result;
}

void (*AutoPriorityThresholdController.manualPriorityThreshold.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v3;
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 36));
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(v3 + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 36));
  return sub_23DF03E74;
}

void sub_23DF03E74(uint64_t a1)
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  char v4;

  v1 = *(os_unfair_lock_s **)(a1 + 8);
  v2 = v1 + 9;
  v3 = v1 + 4;
  v4 = *(_BYTE *)(a1 + 16);
  os_unfair_lock_lock(v1 + 9);
  sub_23DF03C44(v3, v4);
  os_unfair_lock_unlock(v2);
}

void AutoPriorityThresholdController.priorityThreshold.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  int v4;
  int v5;

  v3 = *(_QWORD *)(v1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 36));
  v4 = *(unsigned __int8 *)(v3 + 16);
  v5 = *(unsigned __int8 *)(v3 + 17);
  if (v5 == 4)
    LOBYTE(v5) = *(_BYTE *)(v3 + 18);
  if (v4 == 4)
    LOBYTE(v4) = v5;
  *a1 = v4;
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 36));
}

Swift::Void __swiftcall AutoPriorityThresholdController.didUpdate(environmentalState:)(Swift::OpaquePointer environmentalState)
{
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;

  v2 = *(os_unfair_lock_s **)(v1 + 16);
  v3 = (uint64_t)&v2[4];
  v4 = v2 + 9;
  os_unfair_lock_lock(v2 + 9);
  sub_23DF03F74(v3, v1);
  os_unfair_lock_unlock(v4);
}

void sub_23DF03F74(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v4;
  uint64_t v5;
  _QWORD *v6;
  os_unfair_lock_s *v7;
  char rawValue;
  Swift::OpaquePointer fora;
  uint64_t v10;
  char v11;

  if (!*(_QWORD *)(a1 + 8))
  {
    swift_bridgeObjectRelease();
    rawValue = 4;
    goto LABEL_5;
  }
  v4 = *(_BYTE *)(a1 + 16);
  v10 = *(_QWORD *)(a1 + 8);
  v11 = v4;
  v5 = *(_QWORD *)(*(_QWORD *)(a2 + 40) + 16);
  v6 = (_QWORD *)(v5 + 16);
  v7 = (os_unfair_lock_s *)(v5 + 40);
  swift_bridgeObjectRetain();
  os_unfair_lock_lock(v7);
  sub_23DED7914(v6, &fora);
  if (!v2)
  {
    os_unfair_lock_unlock(v7);
    PriorityRuleSet.priority(for:)(fora);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    rawValue = (char)fora._rawValue;
LABEL_5:
    *(_BYTE *)(a1 + 1) = rawValue;
    sub_23DF0390C(a1);
    return;
  }
  os_unfair_lock_unlock(v7);
  __break(1u);
}

uint64_t AutoPriorityThresholdController.deinit()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  return v0;
}

uint64_t AutoPriorityThresholdController.__deallocating_deinit()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

void sub_23DF040C0()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;
  os_unfair_lock_s *v3;

  v1 = *(os_unfair_lock_s **)(v0 + 16);
  v2 = (uint64_t)&v1[4];
  v3 = v1 + 9;
  os_unfair_lock_lock(v1 + 9);
  sub_23DF044DC(v2);
  os_unfair_lock_unlock(v3);
}

_QWORD *sub_23DF0410C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t ObjectType;
  char v9;
  uint64_t v10;
  os_unfair_lock_s *v11;
  uint64_t v12;
  os_unfair_lock_s *v13;
  uint64_t v15;

  v4 = v3;
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 8))(&v15, ObjectType, a2);
  v9 = v15;
  sub_23DF04204();
  v10 = swift_allocObject();
  *(_DWORD *)(v10 + 36) = 0;
  *(_WORD *)(v10 + 16) = 1028;
  *(_BYTE *)(v10 + 18) = v9;
  *(_QWORD *)(v10 + 24) = 0;
  *(_BYTE *)(v10 + 32) = 0;
  v4[2] = v10;
  v4[3] = a1;
  v4[4] = a2;
  v4[5] = a3;
  v11 = *(os_unfair_lock_s **)(a3 + 16);
  v12 = (uint64_t)&v11[4];
  v13 = v11 + 10;
  swift_retain_n();
  swift_unknownObjectRetain();
  swift_retain();
  os_unfair_lock_lock(v13);
  sub_23DF0506C(v12, (uint64_t)v4, (uint64_t)&protocol witness table for AutoPriorityThresholdController);
  os_unfair_lock_unlock(v13);
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  return v4;
}

void sub_23DF04204()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432E2E0)
  {
    type metadata accessor for os_unfair_lock_s(255);
    v0 = sub_23DF151E4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432E2E0);
  }
}

void sub_23DF04260()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432E328)
  {
    v0 = sub_23DF153D0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432E328);
  }
}

uint64_t dispatch thunk of PriorityThresholdControllable.priorityThreshold.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PriorityThresholdControllable.priorityThreshold.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of PriorityThresholdControllable.priorityThreshold.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t type metadata accessor for AutoPriorityThresholdController()
{
  return objc_opt_self();
}

uint64_t method lookup function for AutoPriorityThresholdController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AutoPriorityThresholdController.__allocating_init(target:environment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_23DF0430C(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AutoPriorityThresholdController.State(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 2);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for AutoPriorityThresholdController.State(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AutoPriorityThresholdController.State(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AutoPriorityThresholdController.State(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AutoPriorityThresholdController.State()
{
  return &type metadata for AutoPriorityThresholdController.State;
}

void sub_23DF044C0(_BYTE *a1)
{
  uint64_t v1;

  sub_23DF03C44(a1, *(_BYTE *)(v1 + 16));
}

void sub_23DF044DC(uint64_t a1)
{
  uint64_t v1;

  sub_23DF03F74(a1, v1);
}

void sub_23DF044F4(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  os_unfair_lock_s *v5;

  v4 = a3 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)a3 + 16);
  v5 = (os_unfair_lock_s *)(a3 + ((*(unsigned int *)(*(_QWORD *)a3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  a1(v4);
  os_unfair_lock_unlock(v5);
}

void IndependentAtomicProperty.wrappedValue.getter(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  os_unfair_lock_s *v7;

  v4 = *v2;
  v5 = *(_QWORD *)(a1 + 16);
  v6 = v4 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v4 + 16);
  v7 = (os_unfair_lock_s *)(v4 + ((*(unsigned int *)(*(_QWORD *)v4 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v6, v5);
  os_unfair_lock_unlock(v7);
}

uint64_t IndependentAtomicProperty.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  sub_23DF04834(a1, a2);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))(a1);
}

uint64_t IndependentAtomicProperty.init(wrappedValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t result;

  v6 = sub_23DF047C4();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  *a3 = v6;
  return result;
}

void (*IndependentAtomicProperty.wrappedValue.modify(_QWORD *a1, uint64_t a2))(uint64_t **a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  void *v9;

  v5 = malloc(0x30uLL);
  *a1 = v5;
  *v5 = a2;
  v5[1] = v2;
  v6 = *(_QWORD *)(a2 + 16);
  v5[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v5[4] = malloc(v8);
  v9 = malloc(v8);
  v5[5] = v9;
  IndependentAtomicProperty.wrappedValue.getter(a2, (uint64_t)v9);
  return sub_23DF0471C;
}

void sub_23DF0471C(uint64_t **a1, char a2)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, uint64_t);

  v2 = *a1;
  v3 = (void *)(*a1)[4];
  v4 = (void *)(*a1)[5];
  v5 = (*a1)[2];
  v6 = (*a1)[3];
  v7 = **a1;
  if ((a2 & 1) != 0)
  {
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[4], v4, v5);
    sub_23DF04834((uint64_t)v3, v7);
    v8 = *(void (**)(void *, uint64_t))(v6 + 8);
    v8(v3, v5);
  }
  else
  {
    sub_23DF04834((*a1)[5], v7);
    v8 = *(void (**)(void *, uint64_t))(v6 + 8);
  }
  v8(v4, v5);
  free(v4);
  free(v3);
  free(v2);
}

uint64_t sub_23DF047C4()
{
  type metadata accessor for os_unfair_lock_s(255);
  sub_23DF151E4();
  return sub_23DF151D8();
}

void sub_23DF04834(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  uint64_t v8;

  v4 = *v2;
  v5 = *(_QWORD *)(a2 + 16);
  v6 = v4 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v4 + 16);
  v7 = (os_unfair_lock_s *)(v4 + ((*(unsigned int *)(*(_QWORD *)v4 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v7);
  v8 = *(_QWORD *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, a1, v5);
  os_unfair_lock_unlock(v7);
}

void sub_23DF048C8(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v5;

  v5 = type metadata accessor for IndependentAtomicProperty(0, *(_QWORD *)(a2 + a1 - 8), a2, a3);
  IndependentAtomicProperty.wrappedValue.getter(v5, a4);
}

void sub_23DF04910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  v5 = type metadata accessor for IndependentAtomicProperty(0, *(_QWORD *)(a4 + a3 - 8), a3, a4);
  sub_23DF04834(a1, v5);
}

uint64_t sub_23DF0494C()
{
  return 8;
}

_QWORD *sub_23DF04958(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t type metadata accessor for IndependentAtomicProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for IndependentAtomicProperty);
}

uint64_t sub_23DF04970@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v2 + 16);
  v4 = *a1;
  *(_DWORD *)((char *)a1 + ((*(unsigned int *)(*a1 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v4 + *MEMORY[0x24BEE27A8]) - 8) + 16))(a2, v3);
}

uint64_t sub_23DF049C8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *a1;
  swift_beginAccess();
  v5 = *(_QWORD *)(v3 + 16);
  v4 = *(_QWORD *)(v3 + 24);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = v4;
  *a2 = sub_23DECFF48;
  a2[1] = v6;
  return swift_retain();
}

uint64_t sub_23DF04A3C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a1;
  v3 = a1[1];
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v3;
  v6 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v6 + 16) = sub_23DEFB69C;
  *(_QWORD *)(v6 + 24) = v5;
  swift_retain();
  return swift_release();
}

uint64_t MockContextProviderDelegate.updateHandler.getter()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t MockContextProviderDelegate.updateHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_release();
}

uint64_t (*MockContextProviderDelegate.updateHandler.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

Swift::Void __swiftcall MockContextProviderDelegate.didUpdate(contexts:)(Swift::OpaquePointer contexts)
{
  uint64_t v1;
  void (*v3)(void *);

  swift_beginAccess();
  v3 = *(void (**)(void *))(v1 + 16);
  swift_retain();
  v3(contexts._rawValue);
  swift_release();
}

uint64_t MockContextProviderDelegate.__allocating_init()()
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = nullsub_1;
  *(_QWORD *)(result + 24) = 0;
  return result;
}

uint64_t MockContextProviderDelegate.init()()
{
  uint64_t v0;
  uint64_t result;

  result = v0;
  *(_QWORD *)(v0 + 16) = nullsub_1;
  *(_QWORD *)(v0 + 24) = 0;
  return result;
}

uint64_t MockContextProviderDelegate.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t MockContextProviderDelegate.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_23DF04C74(uint64_t a1)
{
  uint64_t v1;
  void (*v3)(uint64_t);

  swift_beginAccess();
  v3 = *(void (**)(uint64_t))(v1 + 16);
  swift_retain();
  v3(a1);
  return swift_release();
}

uint64_t type metadata accessor for MockContextProviderDelegate()
{
  return objc_opt_self();
}

uint64_t method lookup function for MockContextProviderDelegate()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MockContextProviderDelegate.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_23DF04D0C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t dispatch thunk of InputSignalProvider.inputSignals(for:observer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t sub_23DF04D3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v3 = a1;
  v29 = MEMORY[0x24BEE4AF8];
  sub_23DF15220();
  result = sub_23DF01F08(v3);
  v6 = result;
  v7 = 0;
  v8 = v3 + 64;
  v24 = v3 + 80;
  v25 = v1;
  v26 = v5;
  v27 = v3;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(v3 + 32))
  {
    v10 = (unint64_t)v6 >> 6;
    if ((*(_QWORD *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
      goto LABEL_22;
    if (*(_DWORD *)(v3 + 36) != v5)
      goto LABEL_23;
    v11 = v8;
    v28 = v7;
    v12 = *(_QWORD *)(v3 + 56);
    v13 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v6);
    v15 = *v13;
    v14 = v13[1];
    v16 = *(_QWORD *)(v12 + 8 * v6);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v17 = sub_23DE935F0(v2);
    type metadata accessor for DebugSnapshot();
    v18 = (_QWORD *)swift_allocObject();
    v18[2] = v15;
    v18[3] = v14;
    v3 = v27;
    v18[4] = v16;
    v18[5] = v17;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23DF151FC();
    sub_23DF1522C();
    sub_23DF15238();
    result = sub_23DF15208();
    v9 = 1 << *(_BYTE *)(v27 + 32);
    if (v6 >= v9)
      goto LABEL_24;
    v19 = *(_QWORD *)(v11 + 8 * v10);
    if ((v19 & (1 << v6)) == 0)
      goto LABEL_25;
    v5 = v26;
    if (*(_DWORD *)(v27 + 36) != v26)
      goto LABEL_26;
    v8 = v11;
    v20 = v19 & (-2 << (v6 & 0x3F));
    if (v20)
    {
      v9 = __clz(__rbit64(v20)) | v6 & 0xFFFFFFFFFFFFFFC0;
      v2 = MEMORY[0x24BEE4AF8];
    }
    else
    {
      v21 = v10 + 1;
      v22 = (unint64_t)(v9 + 63) >> 6;
      v2 = MEMORY[0x24BEE4AF8];
      if (v10 + 1 < v22)
      {
        v23 = *(_QWORD *)(v11 + 8 * v21);
        if (v23)
        {
LABEL_18:
          v9 = __clz(__rbit64(v23)) + (v21 << 6);
        }
        else
        {
          while (v22 - 2 != v10)
          {
            v23 = *(_QWORD *)(v24 + 8 * v10++);
            if (v23)
            {
              v21 = v10 + 1;
              goto LABEL_18;
            }
          }
        }
      }
    }
    v7 = v28 + 1;
    v6 = v9;
    if (v28 + 1 == v25)
      return v29;
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
LABEL_26:
  __break(1u);
  return result;
}

uint64_t EnvironmentalStateManager.debugSnapshot.getter()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v3;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + 16) + 40);
  os_unfair_lock_lock(v1);
  sub_23DF061D0(&v3);
  os_unfair_lock_unlock(v1);
  return v3;
}

void EnvironmentalStateManager.register(observer:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType();
  sub_23DF075E4(a1, v2, ObjectType, a2);
}

uint64_t EnvironmentalStateManager.currentState.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = (os_unfair_lock_s *)(v1 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 40));
  v3 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v2);
  return v3;
}

uint64_t sub_23DF0506C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t *__return_ptr, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;

  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(v6 + 16);
  if (v7)
  {
    swift_bridgeObjectRetain();
    v8 = v6 + 40;
    do
    {
      v9 = *(void (**)(uint64_t *__return_ptr, uint64_t))(v8 - 8);
      v10 = swift_retain();
      v9(&v18, v10);
      v11 = v18;
      swift_release();
      if (v11)
      {
        swift_unknownObjectRelease();
        if (v11 == a2)
          return swift_bridgeObjectRelease();
      }
      v8 += 16;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
  }
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 24) = a3;
  swift_unknownObjectWeakInit();
  v14 = *(_QWORD **)(a1 + 16);
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v14 = sub_23DF07094(0, v14[2] + 1, 1, v14, &qword_25432DB58, (uint64_t (*)(uint64_t))sub_23DF08D04);
  v16 = v14[2];
  v15 = v14[3];
  if (v16 >= v15 >> 1)
    v14 = sub_23DF07094((_QWORD *)(v15 > 1), v16 + 1, 1, v14, &qword_25432DB58, (uint64_t (*)(uint64_t))sub_23DF08D04);
  v14[2] = v16 + 1;
  v17 = &v14[2 * v16];
  v17[4] = sub_23DF09188;
  v17[5] = v13;
  result = swift_release();
  *(_QWORD *)(a1 + 16) = v14;
  return result;
}

void EnvironmentalStateManager.remove(observer:)(uint64_t a1)
{
  uint64_t v1;
  os_unfair_lock_s *v3;
  uint64_t v4;
  os_unfair_lock_s *v5;

  v3 = *(os_unfair_lock_s **)(v1 + 16);
  v4 = (uint64_t)&v3[4];
  v5 = v3 + 10;
  os_unfair_lock_lock(v3 + 10);
  sub_23DF05260(v4, a1);
  os_unfair_lock_unlock(v5);
}

uint64_t sub_23DF05260(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  int64_t v7;

  v4 = a1 + 16;
  swift_unknownObjectRetain();
  v5 = sub_23DF08928(v4, a2);
  result = swift_unknownObjectRelease();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 16);
  if (v7 >= v5)
    return sub_23DF08B1C(v5, v7, &qword_25432DB58, (uint64_t (*)(uint64_t))sub_23DF08D04);
  __break(1u);
  return result;
}

uint64_t EnvironmentalStateManager.__allocating_init(logger:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = swift_allocObject();
  sub_23DE9B2F8(0, &qword_25432DA88);
  v3 = swift_allocObject();
  *(_DWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v2 + 24) = v3;
  v4 = MEMORY[0x24BEE4AF8];
  v5 = sub_23DE93224(MEMORY[0x24BEE4AF8]);
  v6 = sub_23DE93D50(v4);
  sub_23DE9B2F8(0, &qword_25432C238);
  v7 = swift_allocObject();
  *(_DWORD *)(v7 + 40) = 0;
  *(_QWORD *)(v7 + 16) = v5;
  *(_QWORD *)(v7 + 24) = v6;
  *(_QWORD *)(v7 + 32) = v4;
  *(_QWORD *)(v2 + 16) = v7;
  v8 = v2 + OBJC_IVAR____TtC19HealthOrchestration25EnvironmentalStateManager_logger;
  v9 = sub_23DF14C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8, a1, v9);
  return v2;
}

uint64_t EnvironmentalStateManager.init(logger:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_23DE9B2F8(0, &qword_25432DA88);
  v3 = swift_allocObject();
  *(_DWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v1 + 24) = v3;
  v4 = MEMORY[0x24BEE4AF8];
  v5 = sub_23DE93224(MEMORY[0x24BEE4AF8]);
  v6 = sub_23DE93D50(v4);
  sub_23DE9B2F8(0, &qword_25432C238);
  v7 = swift_allocObject();
  *(_DWORD *)(v7 + 40) = 0;
  *(_QWORD *)(v7 + 16) = v5;
  *(_QWORD *)(v7 + 24) = v6;
  *(_QWORD *)(v7 + 32) = v4;
  *(_QWORD *)(v1 + 16) = v7;
  v8 = v1 + OBJC_IVAR____TtC19HealthOrchestration25EnvironmentalStateManager_logger;
  v9 = sub_23DF14C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8, a1, v9);
  return v1;
}

Swift::Void __swiftcall EnvironmentalStateManager.start(providers:)(Swift::OpaquePointer providers)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t *v6;
  os_unfair_lock_s *v7;

  type metadata accessor for EnvironmentalStateManager.ObservationShim();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v3 + 24) = &protocol witness table for EnvironmentalStateManager;
  swift_unknownObjectWeakAssign();
  swift_retain();
  v4 = sub_23DF08374((uint64_t)providers._rawValue, v3);
  swift_release();
  v5 = *(os_unfair_lock_s **)(v1 + 16);
  v6 = (uint64_t *)&v5[4];
  v7 = v5 + 10;
  os_unfair_lock_lock(v5 + 10);
  sub_23DF0558C(v6, v1, v4);
  os_unfair_lock_unlock(v7);
  swift_bridgeObjectRelease();
  swift_release();
}

void sub_23DF0558C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v4 = v3;
  if (*(_QWORD *)(a1[1] + 16))
  {
    swift_retain_n();
    v7 = sub_23DF14C68();
    v8 = sub_23DF15010();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = swift_slowAlloc();
      *(_QWORD *)&v17 = v10;
      *(_DWORD *)v9 = 136315138;
      v18 = a2;
      type metadata accessor for EnvironmentalStateManager();
      swift_retain();
      v11 = sub_23DF14E18();
      v18 = sub_23DEC1518(v11, v12, (uint64_t *)&v17);
      sub_23DF15100();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DE8B000, v7, v8, "Attempt to start %s more than once.", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242648490](v10, -1, -1);
      MEMORY[0x242648490](v9, -1, -1);
    }
    else
    {
      swift_release_n();
    }

  }
  else
  {
    v14 = MEMORY[0x24BEE4B00];
    v18 = MEMORY[0x24BEE4B00];
    v15 = *(_QWORD *)(a3 + 16);
    if (v15)
    {
      swift_bridgeObjectRetain();
      v16 = 0;
      while (1)
      {
        v17 = *(_OWORD *)(a3 + 16 * v16 + 32);
        swift_unknownObjectRetain();
        sub_23DF057D8(&v18, (uint64_t *)&v17, a2, a1);
        if (v4)
          break;
        v4 = 0;
        ++v16;
        swift_unknownObjectRelease();
        if (v15 == v16)
        {
          swift_bridgeObjectRelease();
          v14 = v18;
          goto LABEL_9;
        }
      }
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      __break(1u);
    }
    else
    {
LABEL_9:
      swift_bridgeObjectRelease();
      a1[1] = v14;
    }
  }
}

void sub_23DF057D8(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v6 = *a2;
  v7 = a2[1];
  ObjectType = swift_getObjectType();
  v9 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  v10 = v9(ObjectType, v7);
  if (!*(_QWORD *)(*a1 + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  sub_23DE946E8(v10, v11);
  v13 = v12;
  swift_bridgeObjectRelease();
  if ((v13 & 1) == 0)
  {
LABEL_6:
    v21 = v9(ObjectType, v7);
    v23 = v22;
    swift_unknownObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v31 = *a1;
    *a1 = 0x8000000000000000;
    sub_23DEEB88C(v6, v7, v21, v23, isUniquelyReferenced_nonNull_native);
    *a1 = v31;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v25 = v9(ObjectType, v7);
    v27 = v26;
    v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(ObjectType, v7);
    v29 = swift_isUniquelyReferenced_nonNull_native();
    v32 = *a4;
    *a4 = 0x8000000000000000;
    sub_23DEEB730(v28, v25, v27, v29);
    *a4 = v32;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  swift_unknownObjectRetain_n();
  v14 = sub_23DF14C68();
  v15 = sub_23DF15010();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v30 = swift_slowAlloc();
    v33 = v30;
    *(_DWORD *)v16 = 136315394;
    v17 = v9(ObjectType, v7);
    sub_23DEC1518(v17, v18, &v33);
    sub_23DF15100();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    sub_23DE95524(0, qword_25432C180);
    swift_unknownObjectRetain();
    v19 = sub_23DF14E18();
    sub_23DEC1518(v19, v20, &v33);
    sub_23DF15100();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DE8B000, v14, v15, "Two environmental state components have the same identifier (%s). Ignoring the second (%s)", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242648490](v30, -1, -1);
    MEMORY[0x242648490](v16, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

}

uint64_t sub_23DF05B14()
{
  uint64_t v0;

  sub_23DEC0F1C(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_23DF05B38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v8;
  uint64_t ObjectType;

  result = MEMORY[0x24264855C](v3 + 16);
  if (result)
  {
    v8 = *(_QWORD *)(v3 + 24);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 8))(a1, a2, a3, ObjectType, v8);
    return swift_unknownObjectRelease();
  }
  return result;
}

void EnvironmentalStateManager.didUpdate(state:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  os_unfair_lock_s *v7;

  v7 = (os_unfair_lock_s *)(*(_QWORD *)(v3 + 24) + 16);
  os_unfair_lock_lock(v7);
  sub_23DF05C24(v3, a2, a3, a1);
  os_unfair_lock_unlock(v7);
}

void sub_23DF05C24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  os_unfair_lock_s *v7;
  os_unfair_lock_s *v8;
  os_unfair_lock_s *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t ObjectType;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;

  v7 = *(os_unfair_lock_s **)(a1 + 16);
  v8 = v7 + 4;
  v9 = v7 + 10;
  os_unfair_lock_lock(v7 + 10);
  sub_23DF05D24(v8, a3, a4, &v16);
  if (v4)
  {
    os_unfair_lock_unlock(v9);
    __break(1u);
  }
  else
  {
    os_unfair_lock_unlock(v9);
    v10 = v16;
    v11 = *(_QWORD *)(v17 + 16);
    if (v11)
    {
      v12 = (uint64_t *)(v17 + 40);
      do
      {
        v13 = *v12;
        ObjectType = swift_getObjectType();
        v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 8);
        swift_unknownObjectRetain();
        v15(v10, ObjectType, v13);
        swift_unknownObjectRelease();
        v12 += 2;
        --v11;
      }
      while (v11);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_23DF05D24(_QWORD *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  uint64_t ObjectType;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void (*v16)(__int128 *__return_ptr, uint64_t);
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  __int128 v20;
  _QWORD *v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  ObjectType = swift_getObjectType();
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 8))(ObjectType, a2);
  v10 = v9;
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)&v33 = *a1;
  *a1 = 0x8000000000000000;
  sub_23DEEB730(a3, v8, v10, isUniquelyReferenced_nonNull_native);
  *a1 = v33;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = a1[2];
  v13 = *(_QWORD *)(v12 + 16);
  if (v13)
  {
    swift_bridgeObjectRetain();
    v14 = v12 + 40;
    v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      v16 = *(void (**)(__int128 *__return_ptr, uint64_t))(v14 - 8);
      v17 = swift_retain();
      v16(&v33, v17);
      swift_release();
      if ((_QWORD)v33)
      {
        v32 = v33;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v15 = sub_23DF072E0(0, v15[2] + 1, 1, v15, (unint64_t *)&unk_25432C2B0, &qword_25432D840, (uint64_t)&protocol descriptor for EnvironmentalStateManagerObserver);
        v19 = v15[2];
        v18 = v15[3];
        v20 = v32;
        if (v19 >= v18 >> 1)
        {
          v21 = sub_23DF072E0((_QWORD *)(v18 > 1), v19 + 1, 1, v15, (unint64_t *)&unk_25432C2B0, &qword_25432D840, (uint64_t)&protocol descriptor for EnvironmentalStateManagerObserver);
          v20 = v32;
          v15 = v21;
        }
        v15[2] = v19 + 1;
        *(_OWORD *)&v15[2 * v19 + 4] = v20;
      }
      v14 += 16;
      --v13;
    }
    while (v13);
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v22 = *a1;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v23 = sub_23DF14C68();
  v24 = sub_23DF1501C();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = swift_slowAlloc();
    v26 = swift_slowAlloc();
    *(_QWORD *)&v33 = v26;
    *(_DWORD *)v25 = 136315394;
    sub_23DEB3464();
    swift_bridgeObjectRetain();
    v27 = sub_23DF14DA0();
    v29 = v28;
    swift_bridgeObjectRelease();
    v34 = sub_23DEC1518(v27, v29, (uint64_t *)&v33);
    sub_23DF15100();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2048;
    v30 = v15[2];
    swift_bridgeObjectRelease();
    v34 = v30;
    sub_23DF15100();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DE8B000, v23, v24, "Updated environmental state: %s, notifying %ld observers", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242648490](v26, -1, -1);
    MEMORY[0x242648490](v25, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease_n();

    swift_bridgeObjectRelease_n();
  }
  *a4 = v22;
  a4[1] = v15;
}

uint64_t EnvironmentalStateManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC19HealthOrchestration25EnvironmentalStateManager_logger;
  v2 = sub_23DF14C80();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t EnvironmentalStateManager.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC19HealthOrchestration25EnvironmentalStateManager_logger;
  v2 = sub_23DF14C80();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

void sub_23DF0616C()
{
  uint64_t v0;
  os_unfair_lock_s *v1;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + 24) + 16);
  os_unfair_lock_lock(v1);
  sub_23DF08698();
  os_unfair_lock_unlock(v1);
}

_QWORD *sub_23DF061D0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *result;
  unint64_t v10;
  uint64_t v11;

  v3 = sub_23DE930F0(MEMORY[0x24BEE4AF8]);
  sub_23DE95234(0, (unint64_t *)&unk_256D0EE90, (uint64_t (*)(uint64_t))sub_23DE9AD3C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23DF16970;
  *(_QWORD *)(inited + 32) = 0x6E656E6F706D6F43;
  *(_QWORD *)(inited + 40) = 0xEA00000000007374;
  v5 = swift_bridgeObjectRetain();
  v6 = sub_23DF04D3C(v5);
  swift_bridgeObjectRelease();
  if (v6 < 0 || (v6 & 0x4000000000000000) != 0)
  {
    v10 = swift_bridgeObjectRetain();
    v7 = (uint64_t)sub_23DF0F790(v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  v11 = v7;
  sub_23DE99598(&v11);
  if (v1)
  {
    result = (_QWORD *)swift_release();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)(inited + 48) = v11;
    v8 = sub_23DE935F0(inited);
    type metadata accessor for DebugSnapshot();
    result = (_QWORD *)swift_allocObject();
    result[2] = 0x6D6E6F7269766E45;
    result[3] = 0xEB00000000746E65;
    result[4] = v3;
    result[5] = v8;
    *a1 = result;
  }
  return result;
}

uint64_t sub_23DF06348()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v3;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)v0 + 16) + 40);
  os_unfair_lock_lock(v1);
  sub_23DF061D0(&v3);
  os_unfair_lock_unlock(v1);
  return v3;
}

_QWORD *sub_23DF063A8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_23DEDF428(0, &qword_256D0FFC0);
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
    sub_23DF07660(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23DF064C0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_23DF08D64(0, &qword_256D0FFB0, &qword_256D0FFB8);
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
    sub_23DF07750(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23DF065E0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_23DF08D64(0, &qword_256D0FFA0, &qword_256D0FFA8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4])
          memmove(v12, a4 + 4, 24 * v8);
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
    sub_23DF07838(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23DF06718(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_23DF06AC4(a1, a2, a3, a4, &qword_25432DB48, (unint64_t *)&qword_25432C280);
}

_QWORD *sub_23DF06734(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_23DEDF428(0, &qword_25432DB98);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
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
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23DF07D60(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23DF0684C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_23DE95234(0, (unint64_t *)&unk_25432E340, (uint64_t (*)(uint64_t))sub_23DE955F8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 72);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[9 * v8 + 4])
          memmove(v12, a4 + 4, 72 * v8);
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
    sub_23DF07C58(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23DF06988(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_23DE95234(0, &qword_25432DB78, (uint64_t (*)(uint64_t))sub_23DEABD0C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
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
    sub_23DF07A40(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23DF06AA8(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_23DF06AC4(a1, a2, a3, a4, &qword_25432DB18, (unint64_t *)&qword_25432D308);
}

_QWORD *sub_23DF06AC4(_QWORD *result, int64_t a2, char a3, _QWORD *a4, unint64_t *a5, unint64_t *a6)
{
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  _QWORD *v15;

  v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    v10 = a2;
    goto LABEL_8;
  }
  v9 = a4[3];
  v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2)
    goto LABEL_8;
  if (v10 + 0x4000000000000000 >= 0)
  {
    v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v10 = a2;
LABEL_8:
    v11 = a4[2];
    if (v10 <= v11)
      v12 = a4[2];
    else
      v12 = v10;
    if (v12)
    {
      sub_23DF091DC(0, a5, a6);
      v13 = (_QWORD *)swift_allocObject();
      v14 = _swift_stdlib_malloc_size(v13);
      v13[2] = v11;
      v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
      v15 = v13 + 4;
      if ((v8 & 1) != 0)
      {
LABEL_13:
        if (v13 != a4 || v15 >= &a4[5 * v11 + 4])
          memmove(v15, a4 + 4, 40 * v11);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v15 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_23DF07B44(0, v11, (unint64_t)v15, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

uint64_t sub_23DF06C04(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  sub_23DE95234(0, &qword_256D0FFC8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v10 = *(_QWORD *)(sub_23DF14BA8() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_23DF15280();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_23DF14BA8() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23DF0805C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

_QWORD *sub_23DF06E20(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_23DEDF428(0, &qword_25432DB68);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 104);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[13 * v8 + 4])
          memmove(v12, a4 + 4, 104 * v8);
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
    sub_23DF086B8(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23DF06F54(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_23DEDF428(0, &qword_25432DB70);
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
    sub_23DF07950(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23DF0706C(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_23DF07094(a1, a2, a3, a4, &qword_25432C250, (uint64_t (*)(uint64_t))sub_23DF08DB8);
}

_QWORD *sub_23DF07080(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_23DF07094(a1, a2, a3, a4, &qword_25432DBB0, (uint64_t (*)(uint64_t))sub_23DEEE310);
}

_QWORD *sub_23DF07094(_QWORD *result, int64_t a2, char a3, _QWORD *a4, unint64_t *a5, uint64_t (*a6)(uint64_t))
{
  char v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  int64_t v13;
  uint64_t v14;
  _QWORD *v15;

  v7 = (char)result;
  if ((a3 & 1) == 0)
  {
    v9 = a2;
    goto LABEL_8;
  }
  v8 = a4[3];
  v9 = v8 >> 1;
  if ((uint64_t)(v8 >> 1) >= a2)
    goto LABEL_8;
  if (v9 + 0x4000000000000000 >= 0)
  {
    v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v8 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v9 = a2;
LABEL_8:
    v10 = a4[2];
    if (v9 <= v10)
      v11 = a4[2];
    else
      v11 = v9;
    if (v11)
    {
      sub_23DE95234(0, a5, a6, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
      v12 = (_QWORD *)swift_allocObject();
      v13 = _swift_stdlib_malloc_size(v12);
      v14 = v13 - 32;
      if (v13 < 32)
        v14 = v13 - 17;
      v12[2] = v10;
      v12[3] = 2 * (v14 >> 4);
      v15 = v12 + 4;
      if ((v7 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v15 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v12 != a4 || v15 >= &a4[2 * v10 + 4])
          memmove(v15, a4 + 4, 16 * v10);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23DF07F38(0, v10, (unint64_t)v15, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v12;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23DF071AC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_23DEDF428(0, &qword_25432E330);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 216);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[27 * v8 + 4])
          memmove(v12, a4 + 4, 216 * v8);
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
    sub_23DF07E48(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23DF072E0(_QWORD *result, int64_t a2, char a3, _QWORD *a4, unint64_t *a5, unint64_t *a6, uint64_t a7)
{
  char v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  int64_t v15;
  uint64_t v16;
  _QWORD *v17;

  v9 = (char)result;
  if ((a3 & 1) == 0)
  {
    v11 = a2;
    goto LABEL_8;
  }
  v10 = a4[3];
  v11 = v10 >> 1;
  if ((uint64_t)(v10 >> 1) >= a2)
    goto LABEL_8;
  if (v11 + 0x4000000000000000 >= 0)
  {
    v11 = v10 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v10 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v11 = a2;
LABEL_8:
    v12 = a4[2];
    if (v11 <= v12)
      v13 = a4[2];
    else
      v13 = v11;
    if (v13)
    {
      sub_23DF08CA0(0, a5, a6, a7, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
      v14 = (_QWORD *)swift_allocObject();
      v15 = _swift_stdlib_malloc_size(v14);
      v16 = v15 - 32;
      if (v15 < 32)
        v16 = v15 - 17;
      v14[2] = v12;
      v14[3] = 2 * (v16 >> 4);
      v17 = v14 + 4;
      if ((v9 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v17 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v14 != a4 || v17 >= &a4[2 * v12 + 4])
          memmove(v17, a4 + 4, 16 * v12);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23DF08264(0, v12, (unint64_t)v17, (uint64_t)a4, a6);
LABEL_24:
    swift_bridgeObjectRelease();
    return v14;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23DF07418(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_23DEDF428(0, &qword_25432E338);
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
    sub_23DF08174(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23DF07534(_QWORD *a1)
{
  return sub_23DF071AC(0, a1[2], 0, a1);
}

_QWORD *sub_23DF07548(_QWORD *a1)
{
  return sub_23DF07094(0, a1[2], 0, a1, &qword_25432DB58, (uint64_t (*)(uint64_t))sub_23DF08D04);
}

void sub_23DF0757C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_23DF15298();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x242647BFCLL);
}

void sub_23DF075E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  os_unfair_lock_s *v6;
  uint64_t v7;
  os_unfair_lock_s *v8;

  v6 = *(os_unfair_lock_s **)(a2 + 16);
  v7 = (uint64_t)&v6[4];
  v8 = v6 + 10;
  os_unfair_lock_lock(v6 + 10);
  sub_23DF0506C(v7, a1, a4);
  os_unfair_lock_unlock(v8);
}

uint64_t type metadata accessor for EnvironmentalStateManager.ObservationShim()
{
  return objc_opt_self();
}

uint64_t sub_23DF07660(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_23DF152D4();
  __break(1u);
  return result;
}

char *sub_23DF07750(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 16 * a1 + 32);
    v6 = 16 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_23DF152D4();
  __break(1u);
  return result;
}

uint64_t sub_23DF07838(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 24 * a1 + 32;
    v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      sub_23DF08E04(0, &qword_256D0FFA8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23DF152D4();
  __break(1u);
  return result;
}

uint64_t sub_23DF07950(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_23DF152D4();
  __break(1u);
  return result;
}

uint64_t sub_23DF07A40(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_23DEABD0C();
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23DF152D4();
  __break(1u);
  return result;
}

uint64_t sub_23DF07B44(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t *a5)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v6 = a4 + 40 * a1 + 32;
    v7 = a3 + 40 * v5;
    if (v6 >= v7 || v6 + 40 * v5 <= a3)
    {
      sub_23DE95524(0, a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  result = sub_23DF152D4();
  __break(1u);
  return result;
}

uint64_t sub_23DF07C58(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 72 * a1 + 32;
    v6 = a3 + 72 * v4;
    if (v5 >= v6 || v5 + 72 * v4 <= a3)
    {
      sub_23DE955F8();
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23DF152D4();
  __break(1u);
  return result;
}

char *sub_23DF07D60(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_23DF152D4();
  __break(1u);
  return result;
}

uint64_t sub_23DF07E48(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 216 * a1 + 32;
    v6 = a3 + 216 * v4;
    if (v5 >= v6 || v5 + 216 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23DF152D4();
  __break(1u);
  return result;
}

uint64_t sub_23DF07F38(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_23DE9AA5C();
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23DF152D4();
  __break(1u);
  return result;
}

uint64_t sub_23DF0803C(uint64_t a1, int64_t a2)
{
  return sub_23DF08B1C(a1, a2, &qword_25432C250, (uint64_t (*)(uint64_t))sub_23DF08DB8);
}

uint64_t sub_23DF08050(uint64_t a1, uint64_t a2)
{
  return sub_23DF08E68(a1, a2, (void (*)(_QWORD))type metadata accessor for Orchestrator);
}

uint64_t sub_23DF0805C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(sub_23DF14BA8() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_23DF152D4();
  __break(1u);
  return result;
}

uint64_t sub_23DF08174(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_23DF152D4();
  __break(1u);
  return result;
}

uint64_t sub_23DF08264(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t *a5)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v6 = a4 + 16 * a1 + 32;
    v7 = a3 + 16 * v5;
    if (v6 >= v7 || v6 + 16 * v5 <= a3)
    {
      sub_23DE95524(0, a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  result = sub_23DF152D4();
  __break(1u);
  return result;
}

uint64_t sub_23DF08374(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return MEMORY[0x24BEE4AF8];
  v4 = (_QWORD *)(a1 + 32);
  swift_bridgeObjectRetain();
  v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    v6 = v4[3];
    v7 = v4[4];
    __swift_project_boxed_opaque_existential_1(v4, v6);
    v8 = (*(uint64_t (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v7 + 8))(a2, &off_250EB4038, v6, v7);
    v9 = *(_QWORD *)(v8 + 16);
    v10 = v5[2];
    v11 = v10 + v9;
    if (__OFADD__(v10, v9))
      break;
    v12 = v8;
    isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
    if ((_DWORD)isUniquelyReferenced_nonNull_native && v11 <= v5[3] >> 1)
    {
      if (*(_QWORD *)(v12 + 16))
        goto LABEL_14;
    }
    else
    {
      if (v10 <= v11)
        v14 = v10 + v9;
      else
        v14 = v10;
      v5 = sub_23DF072E0(isUniquelyReferenced_nonNull_native, v14, 1, v5, &qword_25432DB50, qword_25432C180, (uint64_t)&protocol descriptor for EnvironmentalStateComponent);
      if (*(_QWORD *)(v12 + 16))
      {
LABEL_14:
        v15 = v5[2];
        if ((v5[3] >> 1) - v15 < v9)
          goto LABEL_28;
        v16 = (unint64_t)&v5[2 * v15 + 4];
        if (v12 + 32 < v16 + 16 * v9 && v16 < v12 + 32 + 16 * v9)
          goto LABEL_30;
        sub_23DE95524(0, qword_25432C180);
        swift_arrayInitWithCopy();
        if (v9)
        {
          v18 = v5[2];
          v19 = __OFADD__(v18, v9);
          v20 = v18 + v9;
          if (v19)
            goto LABEL_29;
          v5[2] = v20;
        }
        goto LABEL_4;
      }
    }
    if (v9)
      goto LABEL_27;
LABEL_4:
    swift_bridgeObjectRelease();
    v4 += 5;
    if (!--v2)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v5;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  swift_release();
  result = sub_23DF152D4();
  __break(1u);
  return result;
}

uint64_t dispatch thunk of EnvironmentalStateManagerObserver.didUpdate(environmentalState:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_23DF08598()
{
  return type metadata accessor for EnvironmentalStateManager();
}

uint64_t type metadata accessor for EnvironmentalStateManager()
{
  uint64_t result;

  result = qword_25432D728;
  if (!qword_25432D728)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23DF085DC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23DF14C80();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for EnvironmentalStateManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EnvironmentalStateManager.__allocating_init(logger:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

ValueMetadata *type metadata accessor for EnvironmentalStateManager.State()
{
  return &type metadata for EnvironmentalStateManager.State;
}

void sub_23DF0867C()
{
  uint64_t *v0;

  sub_23DF05C24(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_23DF08698()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_23DF086B8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 104 * a1 + 32;
    v6 = a3 + 104 * v4;
    if (v5 >= v6 || v5 + 104 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23DF152D4();
  __break(1u);
  return result;
}

uint64_t sub_23DF087A8(uint64_t a1, uint64_t a2)
{
  return sub_23DF08E68(a1, a2, (void (*)(_QWORD))type metadata accessor for WorkEpoch);
}

uint64_t sub_23DF087B4(uint64_t a1, int64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_23DF071AC(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_20;
  v13 = v4[2];
  v14 = __OFSUB__(v13, a2);
  v15 = v13 - a2;
  if (v14)
    goto LABEL_26;
  if ((v15 & 0x8000000000000000) == 0)
  {
    v16 = (char *)&v4[27 * a2 + 4];
    if (a1 != a2 || &v4[27 * a1 + 4] >= (_QWORD *)&v16[216 * v15])
      result = (uint64_t)memmove(&v4[27 * a1 + 4], v16, 216 * v15);
    v17 = v4[2];
    v14 = __OFADD__(v17, v8);
    v18 = v17 - v7;
    if (!v14)
    {
      v4[2] = v18;
LABEL_20:
      *(_QWORD *)v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  result = sub_23DF152D4();
  __break(1u);
  return result;
}

uint64_t sub_23DF08928(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  void (*v8)(_QWORD *__return_ptr, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v15;
  void (*v16)(_QWORD *__return_ptr, uint64_t);
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  __int128 v23;
  _QWORD v24[2];

  v2 = *(_QWORD **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v3)
    return 0;
  swift_bridgeObjectRetain();
  v6 = 0;
  v7 = 0;
  while (1)
  {
    v8 = (void (*)(_QWORD *__return_ptr, uint64_t))v2[v6 + 4];
    v9 = swift_retain();
    v8(v24, v9);
    v10 = v24[0];
    swift_release();
    if (v10)
    {
      swift_unknownObjectRelease();
      if (v10 == a2)
        break;
    }
    ++v7;
    v6 += 2;
    if (v3 == v7)
    {
      swift_bridgeObjectRelease();
      return v2[2];
    }
  }
  result = swift_bridgeObjectRelease();
  v12 = v7 + 1;
  if (!__OFADD__(v7, 1))
  {
    v13 = v2[2];
    while (v12 != v13)
    {
      if (v12 >= v13)
      {
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
      v15 = &v2[v6];
      v16 = (void (*)(_QWORD *__return_ptr, uint64_t))v2[v6 + 6];
      v17 = swift_retain();
      v16(v24, v17);
      v18 = v24[0];
      result = swift_release();
      if (!v18 || (result = swift_unknownObjectRelease(), v18 != a2))
      {
        if (v12 != v7)
        {
          if ((v7 & 0x8000000000000000) != 0)
            goto LABEL_28;
          v19 = v2[2];
          if (v7 >= v19)
            goto LABEL_29;
          if (v12 >= v19)
            goto LABEL_30;
          v21 = v15[6];
          v20 = v15[7];
          v23 = *(_OWORD *)&v2[2 * v7 + 4];
          swift_retain();
          swift_retain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v2 = sub_23DF07548(v2);
          v22 = &v2[2 * v7];
          v22[4] = v21;
          v22[5] = v20;
          result = swift_release();
          if (v12 >= v2[2])
            goto LABEL_31;
          *(_OWORD *)&v2[v6 + 6] = v23;
          result = swift_release();
          *(_QWORD *)a1 = v2;
        }
        if (__OFADD__(v7++, 1))
          goto LABEL_27;
      }
      ++v12;
      v13 = v2[2];
      v6 += 2;
    }
    return v7;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_23DF08B1C(uint64_t a1, int64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v4;
  _QWORD *v6;
  int64_t v7;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v15;
  uint64_t result;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  v6 = *(_QWORD **)v4;
  v7 = *(_QWORD *)(*(_QWORD *)v4 + 16);
  if (v7 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v10 = a1 - a2;
  if (__OFSUB__(0, v9))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v11 = v7 - v9;
  if (__OFADD__(v7, v10))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v11 > v6[3] >> 1)
  {
    if (v7 <= v11)
      v15 = v7 + v10;
    else
      v15 = v7;
    v6 = sub_23DF07094(isUniquelyReferenced_nonNull_native, v15, 1, v6, a3, a4);
  }
  sub_23DE9AA5C();
  result = swift_arrayDestroy();
  if (!v9)
    goto LABEL_20;
  v17 = v6[2];
  v18 = __OFSUB__(v17, a2);
  v19 = v17 - a2;
  if (v18)
    goto LABEL_26;
  if ((v19 & 0x8000000000000000) == 0)
  {
    v20 = (char *)&v6[2 * a2 + 4];
    if (a1 != a2 || &v6[2 * a1 + 4] >= (_QWORD *)&v20[16 * v19])
      result = (uint64_t)memmove(&v6[2 * a1 + 4], v20, 16 * v19);
    v21 = v6[2];
    v18 = __OFADD__(v21, v10);
    v22 = v21 - v9;
    if (!v18)
    {
      v6[2] = v22;
LABEL_20:
      *(_QWORD *)v4 = v6;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  result = sub_23DF152D4();
  __break(1u);
  return result;
}

void sub_23DF08CA0(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    v8 = sub_23DE95524(255, a3);
    v9 = a5(a1, v8);
    if (!v10)
      atomic_store(v9, a2);
  }
}

unint64_t sub_23DF08D04()
{
  unint64_t result;

  result = qword_25432D850;
  if (!qword_25432D850)
  {
    sub_23DF08CA0(255, &qword_25432D848, &qword_25432D840, (uint64_t)&protocol descriptor for EnvironmentalStateManagerObserver, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    result = swift_getFunctionTypeMetadata0();
    atomic_store(result, (unint64_t *)&qword_25432D850);
  }
  return result;
}

void sub_23DF08D64(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_23DF08E04(255, a3);
    v4 = sub_23DF153D0();
    if (!v5)
      atomic_store(v4, a2);
  }
}

unint64_t sub_23DF08DB8()
{
  unint64_t result;

  result = qword_25432C258;
  if (!qword_25432C258)
  {
    result = swift_getFunctionTypeMetadata1();
    atomic_store(result, (unint64_t *)&qword_25432C258);
  }
  return result;
}

void sub_23DF08E04(uint64_t a1, unint64_t *a2)
{
  unint64_t TupleTypeMetadata2;
  uint64_t v4;

  if (!*a2)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v4)
      atomic_store(TupleTypeMetadata2, a2);
  }
}

uint64_t sub_23DF08E5C(uint64_t a1, uint64_t a2)
{
  return sub_23DF08E68(a1, a2, (void (*)(_QWORD))type metadata accessor for WorkCriteriaRecord.Epoch);
}

uint64_t sub_23DF08E68(uint64_t a1, uint64_t a2, void (*a3)(_QWORD))
{
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  void (*v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v6 = a3;
    v3 = a2;
    v5 = a1;
    if (!(*v4 >> 62))
    {
      if (*(_QWORD *)((*v4 & 0xFFFFFFFFFFFFF8) + 0x10) >= a2)
        goto LABEL_4;
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRetain();
  v23 = sub_23DF15298();
  swift_bridgeObjectRelease();
  if (v23 < v3)
    goto LABEL_31;
LABEL_4:
  v8 = v3 - v5;
  if (__OFSUB__(v3, v5))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v7 = v5 - v3;
  if (__OFSUB__(0, v8))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    v9 = sub_23DF15298();
    swift_bridgeObjectRelease();
    v10 = v9 + v7;
    if (!__OFADD__(v9, v7))
      goto LABEL_8;
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    v14 = sub_23DF15298();
    swift_bridgeObjectRelease();
    v11 = *v4;
    goto LABEL_15;
  }
  if (*v4 >> 62)
    goto LABEL_34;
  v9 = *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v10 = v9 - v8;
  if (__OFADD__(v9, v7))
    goto LABEL_36;
LABEL_8:
  v11 = *v4;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v4 = v11;
  v9 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject
    && (v11 & 0x8000000000000000) == 0
    && (v11 & 0x4000000000000000) == 0)
  {
    v13 = v11 & 0xFFFFFFFFFFFFFF8;
    if (v10 <= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v9 = 1;
  }
  if (v11 >> 62)
    goto LABEL_37;
  v14 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v14 <= v10)
    v14 = v10;
  swift_bridgeObjectRetain();
  *v4 = MEMORY[0x242647BFC](v9, v14, 1, v11);
  swift_bridgeObjectRelease();
  v13 = *v4 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v15 = v13 + 32;
  v16 = (char *)(v13 + 32 + 8 * v5);
  v6(0);
  swift_arrayDestroy();
  if (!v7)
    return sub_23DF14ED8();
  if (!(*v4 >> 62))
  {
    v17 = *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    v18 = v17 - v3;
    if (!__OFSUB__(v17, v3))
      goto LABEL_21;
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  v24 = sub_23DF15298();
  swift_bridgeObjectRelease();
  v18 = v24 - v3;
  if (__OFSUB__(v24, v3))
    goto LABEL_40;
LABEL_21:
  if ((v18 & 0x8000000000000000) == 0)
  {
    v19 = (char *)(v15 + 8 * v3);
    if (v5 != v3 || v16 >= &v19[8 * v18])
      memmove(v16, v19, 8 * v18);
    if (!(*v4 >> 62))
    {
      v20 = *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFF8) + 0x10);
      v21 = v20 + v7;
      if (!__OFADD__(v20, v7))
      {
LABEL_27:
        *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFF8) + 0x10) = v21;
        return sub_23DF14ED8();
      }
      goto LABEL_43;
    }
LABEL_41:
    swift_bridgeObjectRetain();
    v25 = sub_23DF15298();
    swift_bridgeObjectRelease();
    v21 = v25 + v7;
    if (!__OFADD__(v25, v7))
      goto LABEL_27;
LABEL_43:
    __break(1u);
  }
  result = sub_23DF152D4();
  __break(1u);
  return result;
}

uint64_t sub_23DF09164()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23DF09188@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  swift_beginAccess();
  result = MEMORY[0x24264855C](v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_23DF091DC(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_23DE95524(255, a3);
    v4 = sub_23DF153D0();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t static InputSignalIdentifier.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_23DF15400();
}

HealthOrchestration::InputSignalIdentifier __swiftcall InputSignalIdentifier.init(stringLiteral:)(Swift::String stringLiteral)
{
  Swift::String *v1;
  HealthOrchestration::InputSignalIdentifier result;

  *v1 = stringLiteral;
  v1[1]._countAndFlagsBits = 0;
  v1[1]._object = 0;
  result.value = stringLiteral;
  return result;
}

__n128 InputSignalSet.LookupKey.init(identifier:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  unint64_t v2;
  __n128 result;

  v2 = a1->n128_u64[1];
  a2->n128_u64[0] = a1->n128_u64[0];
  a2->n128_u64[1] = v2;
  result = a1[1];
  a2[1] = result;
  return result;
}

uint64_t sub_23DF09284()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t InputSignal.dependencyConfigurations(for:)()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t InputSignal.description.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[4];

  (*(void (**)(_QWORD *__return_ptr))(a2 + 40))(v4);
  if (v4[3])
  {
    v2 = v4[2];
  }
  else
  {
    v2 = v4[0];
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return v2;
}

HealthOrchestration::InputSignalSet __swiftcall InputSignalSet.init(signals:)(HealthOrchestration::InputSignalSet signals)
{
  HealthOrchestration::InputSignalSet *v1;

  v1->signals._rawValue = signals.signals._rawValue;
  return signals;
}

uint64_t static InputSignalIdentifier.< infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 0;
  else
    return sub_23DF15400();
}

uint64_t InputSignalIdentifier.value.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InputSignalIdentifier.value.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*InputSignalIdentifier.value.modify())()
{
  return nullsub_1;
}

uint64_t InputSignalIdentifier.logDescription.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InputSignalIdentifier.logDescription.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*InputSignalIdentifier.logDescription.modify())()
{
  return nullsub_1;
}

HealthOrchestration::InputSignalIdentifier __swiftcall InputSignalIdentifier.init(_:logDescription:)(Swift::String _, Swift::String_optional logDescription)
{
  Swift::String_optional *v2;
  HealthOrchestration::InputSignalIdentifier result;

  v2->value = _;
  v2[1] = logDescription;
  result.logDescription = logDescription;
  result.value = _;
  return result;
}

uint64_t sub_23DF0941C()
{
  sub_23DF09870();
  return sub_23DF154CC();
}

uint64_t sub_23DF09444()
{
  sub_23DF09870();
  return sub_23DF154D8();
}

uint64_t InputSignalIdentifier.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];
  char v13;
  char v14;

  sub_23DF098B4(0, &qword_25432DD28, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x24BEE3520]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v6);
  v8 = (char *)v12 - v7;
  v9 = *(_QWORD *)(v1 + 16);
  v12[1] = *(_QWORD *)(v1 + 24);
  v12[2] = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DF09870();
  sub_23DF154C0();
  v14 = 0;
  v10 = v12[3];
  sub_23DF15364();
  if (!v10)
  {
    v13 = 1;
    sub_23DF1534C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t InputSignalIdentifier.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;

  sub_23DF098B4(0, &qword_25432E320, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x24BEE33E0]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v8);
  v10 = (char *)&v20 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DF09870();
  sub_23DF154B4();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v22 = 0;
    v12 = sub_23DF15310();
    v14 = v13;
    v21 = 1;
    swift_bridgeObjectRetain();
    v15 = sub_23DF152F8();
    v17 = v16;
    v18 = *(void (**)(char *, uint64_t))(v7 + 8);
    v19 = v15;
    v18(v10, v6);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *a2 = v12;
    a2[1] = v14;
    a2[2] = v19;
    a2[3] = v17;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DF0975C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return InputSignalIdentifier.init(from:)(a1, a2);
}

uint64_t sub_23DF09770(_QWORD *a1)
{
  return InputSignalIdentifier.encode(to:)(a1);
}

uint64_t InputSignalIdentifier.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_23DF14E3C();
  return swift_bridgeObjectRelease();
}

uint64_t InputSignalIdentifier.hashValue.getter()
{
  sub_23DF15478();
  swift_bridgeObjectRetain();
  sub_23DF14E3C();
  swift_bridgeObjectRelease();
  return sub_23DF154A8();
}

uint64_t InputSignalIdentifier.description.getter()
{
  uint64_t *v0;
  uint64_t v1;

  if (v0[3])
  {
    v1 = v0[2];
  }
  else
  {
    v1 = *v0;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_23DF09870()
{
  unint64_t result;

  result = qword_25432E1D8;
  if (!qword_25432E1D8)
  {
    result = MEMORY[0x2426483D0](&unk_23DF1BDBC, &type metadata for InputSignalIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25432E1D8);
  }
  return result;
}

void sub_23DF098B4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_23DF09870();
    v7 = a3(a1, &type metadata for InputSignalIdentifier.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t InputSignalSet.LookupKey.identifier.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v1[1];
  v4 = v1[2];
  v3 = v1[3];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v4;
  a1[3] = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

__n128 InputSignalSet.LookupKey.identifier.setter(__n128 *a1)
{
  __n128 *v1;
  unint64_t v2;
  unint64_t v3;
  __n128 result;
  __n128 v5;

  v5 = *a1;
  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u64[1];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = v5;
  *v1 = v5;
  v1[1].n128_u64[0] = v2;
  v1[1].n128_u64[1] = v3;
  return result;
}

uint64_t (*InputSignalSet.LookupKey.identifier.modify())()
{
  return nullsub_1;
}

uint64_t static InputSignalSet.LookupKey.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_23DF15400();
}

uint64_t InputSignalSet.LookupKey.hash(into:)()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  sub_23DF14E3C();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease_n();
}

uint64_t InputSignalSet.LookupKey.hashValue.getter()
{
  sub_23DF15478();
  InputSignalSet.LookupKey.hash(into:)();
  return sub_23DF154A8();
}

uint64_t sub_23DF09A94()
{
  sub_23DF15478();
  InputSignalSet.LookupKey.hash(into:)();
  return sub_23DF154A8();
}

uint64_t InputSignalSet.signals.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t InputSignalSet.signals.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*InputSignalSet.signals.modify())()
{
  return nullsub_1;
}

uint64_t InputSignalSet.subscript.getter@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  int v13;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v6 = *v3;
  if (*(_QWORD *)(v6 + 16))
  {
    v8 = *a1;
    v7 = a1[1];
    v10 = a1[2];
    v9 = a1[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11 = sub_23DEA6458(v8, v7, v10, v9);
    if ((v12 & 1) != 0)
    {
      sub_23DE902F4(*(_QWORD *)(v6 + 56) + 40 * v11, (uint64_t)&v15);
    }
    else
    {
      v17 = 0;
      v15 = 0u;
      v16 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = 0;
    v15 = 0u;
    v16 = 0u;
  }
  sub_23DF09C08();
  v13 = swift_dynamicCast();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(a3, v13 ^ 1u, 1, a2);
}

void sub_23DF09C08()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432D318[0])
  {
    sub_23DF09C5C();
    v0 = sub_23DF150F4();
    if (!v1)
      atomic_store(v0, qword_25432D318);
  }
}

unint64_t sub_23DF09C5C()
{
  unint64_t result;

  result = qword_25432D308;
  if (!qword_25432D308)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_25432D308);
  }
  return result;
}

unint64_t sub_23DF09CB4()
{
  unint64_t result;

  result = qword_256D0FFD0;
  if (!qword_256D0FFD0)
  {
    result = MEMORY[0x2426483D0](&protocol conformance descriptor for InputSignalIdentifier, &type metadata for InputSignalIdentifier);
    atomic_store(result, (unint64_t *)&qword_256D0FFD0);
  }
  return result;
}

unint64_t sub_23DF09CFC()
{
  unint64_t result;

  result = qword_256D0FFD8;
  if (!qword_256D0FFD8)
  {
    result = MEMORY[0x2426483D0](&protocol conformance descriptor for InputSignalIdentifier, &type metadata for InputSignalIdentifier);
    atomic_store(result, (unint64_t *)&qword_256D0FFD8);
  }
  return result;
}

unint64_t sub_23DF09D44()
{
  unint64_t result;

  result = qword_256D0FFE0;
  if (!qword_256D0FFE0)
  {
    result = MEMORY[0x2426483D0](&protocol conformance descriptor for InputSignalIdentifier, &type metadata for InputSignalIdentifier);
    atomic_store(result, (unint64_t *)&qword_256D0FFE0);
  }
  return result;
}

unint64_t sub_23DF09D8C()
{
  unint64_t result;

  result = qword_25432E208;
  if (!qword_25432E208)
  {
    result = MEMORY[0x2426483D0](&protocol conformance descriptor for InputSignalIdentifier, &type metadata for InputSignalIdentifier);
    atomic_store(result, (unint64_t *)&qword_25432E208);
  }
  return result;
}

void sub_23DF09DD0()
{
  JUMPOUT(0x2426483D0);
}

ValueMetadata *type metadata accessor for InputSignalIdentifier()
{
  return &type metadata for InputSignalIdentifier;
}

uint64_t dispatch thunk of InputSignal.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of InputSignal.observer.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of InputSignal.beginObservation(from:configurations:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of InputSignal.stopObservation()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of InputSignal.dependencyConfigurations(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of InputSignal.dependencyDidUpdate(anchors:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

ValueMetadata *type metadata accessor for InputSignalSet()
{
  return &type metadata for InputSignalSet;
}

uint64_t type metadata accessor for InputSignalSet.LookupKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for InputSignalSet.LookupKey);
}

uint64_t storeEnumTagSinglePayload for InputSignalIdentifier.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23DF09EA0 + 4 * byte_23DF1B9C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23DF09ED4 + 4 * byte_23DF1B9C0[v4]))();
}

uint64_t sub_23DF09ED4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF09EDC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DF09EE4);
  return result;
}

uint64_t sub_23DF09EF0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DF09EF8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23DF09EFC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF09F04(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InputSignalIdentifier.CodingKeys()
{
  return &type metadata for InputSignalIdentifier.CodingKeys;
}

unint64_t sub_23DF09F24()
{
  unint64_t result;

  result = qword_256D0FFE8;
  if (!qword_256D0FFE8)
  {
    result = MEMORY[0x2426483D0](&unk_23DF1BD94, &type metadata for InputSignalIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D0FFE8);
  }
  return result;
}

unint64_t sub_23DF09F6C()
{
  unint64_t result;

  result = qword_25432DCF8;
  if (!qword_25432DCF8)
  {
    result = MEMORY[0x2426483D0](&unk_23DF1BD04, &type metadata for InputSignalIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25432DCF8);
  }
  return result;
}

unint64_t sub_23DF09FB4()
{
  unint64_t result;

  result = qword_25432E1E0;
  if (!qword_25432E1E0)
  {
    result = MEMORY[0x2426483D0](&unk_23DF1BD2C, &type metadata for InputSignalIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25432E1E0);
  }
  return result;
}

uint64_t dispatch thunk of InputSignalConfiguration.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t XPCDispatcher.maxConcurrentItems.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = (os_unfair_lock_s *)(v1 + 72);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 72));
  v3 = *(_QWORD *)(v1 + 56);
  os_unfair_lock_unlock(v2);
  return v3;
}

void sub_23DF0A038(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  os_unfair_lock_s *v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t v6;

  v3 = *(os_unfair_lock_s **)(*(_QWORD *)a1 + 16);
  v4 = (uint64_t)&v3[4];
  v5 = v3 + 18;
  os_unfair_lock_lock(v3 + 18);
  sub_23DF0A134(v4, &v6);
  os_unfair_lock_unlock(v5);
  *a2 = v6;
}

void sub_23DF0A0A0(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;

  v2 = *(os_unfair_lock_s **)(*(_QWORD *)a2 + 16);
  v3 = (uint64_t)&v2[4];
  v4 = v2 + 18;
  os_unfair_lock_lock(v2 + 18);
  sub_23DF0AE1C(v3);
  os_unfair_lock_unlock(v4);
}

void XPCDispatcher.maxConcurrentItems.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 72));
  *(_QWORD *)(v3 + 56) = a1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 72));
}

uint64_t sub_23DF0A134@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(result + 40);
  return result;
}

void (*XPCDispatcher.maxConcurrentItems.modify(_QWORD *a1))(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;

  v3 = *(_QWORD *)(v1 + 16);
  a1[1] = v3;
  v4 = (os_unfair_lock_s *)(v3 + 72);
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 72));
  v5 = *(_QWORD *)(v3 + 56);
  os_unfair_lock_unlock(v4);
  *a1 = v5;
  return sub_23DF0A194;
}

void sub_23DF0A194(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *a1;
  v1 = a1[1];
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 72));
  *(_QWORD *)(v1 + 56) = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
}

uint64_t XPCDispatcher.__allocating_init(serviceName:)()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;

  v0 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v1 = (void *)sub_23DF14DE8();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithServiceName_, v1);

  swift_allocObject();
  v3 = sub_23DF0AAC4(v2);

  return v3;
}

uint64_t XPCDispatcher.__allocating_init(connection:)(void *a1)
{
  uint64_t v2;

  swift_allocObject();
  v2 = sub_23DF0AAC4(a1);

  return v2;
}

uint64_t XPCDispatcher.init(connection:)(void *a1)
{
  uint64_t v2;

  v2 = sub_23DF0AAC4(a1);

  return v2;
}

uint64_t XPCDispatcher.start(source:)(uint64_t a1)
{
  uint64_t v1;
  os_unfair_lock_s *v3;
  uint64_t v4;
  os_unfair_lock_s *v5;

  v3 = *(os_unfair_lock_s **)(v1 + 16);
  v4 = (uint64_t)&v3[4];
  v5 = v3 + 18;
  os_unfair_lock_lock(v3 + 18);
  sub_23DF0AE58(v4);
  sub_23DE902F4(a1, v4);
  os_unfair_lock_unlock(v5);
  return sub_23DF0A324();
}

uint64_t sub_23DF0A324()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t i;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t (*)(uint64_t *), uint64_t, uint64_t, uint64_t);
  __int128 v8;
  uint64_t v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 72));
  sub_23DF0B050(v1 + 16, (uint64_t)&v8);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
  if (!v9)
    return sub_23DF0AE58((uint64_t)&v8);
  sub_23DE902DC(&v8, (uint64_t)v10);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 72));
  for (i = *(_QWORD *)(v1 + 64); i < *(_QWORD *)(v1 + 56); i = *(_QWORD *)(v1 + 64))
  {
    *(_QWORD *)(v1 + 64) = i + 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
    v3 = v11;
    v4 = v12;
    __swift_project_boxed_opaque_existential_1(v10, v11);
    v5 = swift_allocObject();
    swift_weakInit();
    v6 = *(void (**)(uint64_t (*)(uint64_t *), uint64_t, uint64_t, uint64_t))(v4 + 8);
    swift_retain();
    v6(sub_23DF0AF60, v5, v3, v4);
    swift_release_n();
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 72));
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
}

void sub_23DF0A468(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  char *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  void *aBlock;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v2 = v1;
  v4 = *(void **)(v1 + 24);
  sub_23DEAC648((uint64_t)a1, (uint64_t)&v30);
  v5 = swift_allocObject();
  v6 = v36;
  *(_OWORD *)(v5 + 104) = v35;
  *(_OWORD *)(v5 + 120) = v6;
  *(_OWORD *)(v5 + 136) = v37;
  v7 = v30;
  *(_OWORD *)(v5 + 40) = v31;
  v8 = v33;
  *(_OWORD *)(v5 + 56) = v32;
  *(_OWORD *)(v5 + 72) = v8;
  *(_OWORD *)(v5 + 88) = v34;
  *(_QWORD *)(v5 + 16) = v2;
  *(_QWORD *)(v5 + 152) = v38;
  *(_OWORD *)(v5 + 24) = v7;
  v28 = sub_23DF0AF6C;
  v29 = v5;
  v9 = (void *)MEMORY[0x24BDAC760];
  aBlock = (void *)MEMORY[0x24BDAC760];
  v25 = 1107296256;
  v26 = sub_23DF0A81C;
  v27 = &block_descriptor_13;
  v10 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v11 = objc_msgSend(v4, sel_remoteObjectProxyWithErrorHandler_, v10);
  _Block_release(v10);
  sub_23DF15130();
  swift_unknownObjectRelease();
  sub_23DF0AF90();
  if (swift_dynamicCast())
  {
    v12 = aBlock;
    sub_23DE902F4((uint64_t)(a1 + 8), (uint64_t)&v30);
    v13 = *a1;
    v14 = a1[1];
    v15 = objc_allocWithZone((Class)type metadata accessor for SecurelyCodableWorkPlan());
    swift_unknownObjectRetain();
    v16 = SecurelyCodableWorkPlan.init(_:context:)(&v30, v13, v14);
    v17 = (void *)sub_23DF14DE8();
    swift_bridgeObjectRetain();
    v18 = (void *)sub_23DF14DE8();
    swift_bridgeObjectRelease();
    sub_23DEAC648((uint64_t)a1, (uint64_t)&v30);
    v19 = swift_allocObject();
    v20 = v36;
    *(_OWORD *)(v19 + 104) = v35;
    *(_OWORD *)(v19 + 120) = v20;
    *(_OWORD *)(v19 + 136) = v37;
    v21 = v30;
    *(_OWORD *)(v19 + 40) = v31;
    v22 = v33;
    *(_OWORD *)(v19 + 56) = v32;
    *(_OWORD *)(v19 + 72) = v22;
    *(_OWORD *)(v19 + 88) = v34;
    *(_QWORD *)(v19 + 16) = v2;
    *(_QWORD *)(v19 + 152) = v38;
    *(_OWORD *)(v19 + 24) = v21;
    v28 = sub_23DF0B044;
    v29 = v19;
    aBlock = v9;
    v25 = 1107296256;
    v26 = sub_23DF0A964;
    v27 = &block_descriptor_13;
    v23 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v12, sel_remote_runWithWorkPlan_provider_executor_with_, v16, v17, v18, v23);
    swift_unknownObjectRelease();
    _Block_release(v23);

  }
}

void sub_23DF0A7B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  (*(void (**)(uint64_t, uint64_t))(a3 + 120))(a3, a1);
  v4 = *(_QWORD *)(a2 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 72));
  v5 = *(_QWORD *)(v4 + 64);
  v6 = __OFSUB__(v5, 1);
  v7 = v5 - 1;
  if (v6)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v4 + 64) = v7;
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 72));
    sub_23DF0A324();
  }
}

void sub_23DF0A81C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_23DF0A86C(void *a1, uint64_t a2, uint64_t a3)
{
  void (*v6)(uint64_t, void *);
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  if (a1)
  {
    v6 = *(void (**)(uint64_t, void *))(a3 + 120);
    v14 = a1;
    v6(a3, a1);
    v7 = *(_QWORD *)(a2 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(v7 + 72));
    v8 = *(_QWORD *)(v7 + 64);
    v9 = __OFSUB__(v8, 1);
    v10 = v8 - 1;
    if (!v9)
    {
      *(_QWORD *)(v7 + 64) = v10;
      os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 72));
      sub_23DF0A324();

      return;
    }
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(a3 + 120))(a3, 0);
    v11 = *(_QWORD *)(a2 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(v11 + 72));
    v12 = *(_QWORD *)(v11 + 64);
    v9 = __OFSUB__(v12, 1);
    v13 = v12 - 1;
    if (!v9)
    {
      *(_QWORD *)(v11 + 64) = v13;
      os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 72));
      sub_23DF0A324();
      return;
    }
  }
  __break(1u);
}

void sub_23DF0A964(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_23DF0A9B8(uint64_t *a1)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_23DF0A468(a1);
    return swift_release();
  }
  return result;
}

uint64_t XPCDispatcher.deinit()
{
  uint64_t v0;

  swift_release();

  return v0;
}

uint64_t XPCDispatcher.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_23DF0AA64()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;
  os_unfair_lock_s *v3;

  v1 = *(os_unfair_lock_s **)(*(_QWORD *)v0 + 16);
  v2 = (uint64_t)&v1[4];
  v3 = v1 + 18;
  os_unfair_lock_lock(v1 + 18);
  sub_23DF0AE28(v2);
  os_unfair_lock_unlock(v3);
  return sub_23DF0A324();
}

uint64_t sub_23DF0AAC4(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;

  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  v11 = xmmword_23DF1BE30;
  sub_23DF0B094();
  v3 = swift_allocObject();
  *(_DWORD *)(v3 + 72) = 0;
  sub_23DF0B0F0(&v8, v3 + 16);
  sub_23DF0B154((uint64_t)&v8);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v1 + 24) = a1;
  v4 = (void *)objc_opt_self();
  v5 = a1;
  v6 = objc_msgSend(v4, sel_interfaceWithProtocol_, &unk_256D19C48, v8, v9, v10, v11);
  objc_msgSend(v5, sel_setRemoteObjectInterface_, v6);

  objc_msgSend(v5, sel_resume);
  return v1;
}

uint64_t type metadata accessor for XPCDispatcher()
{
  return objc_opt_self();
}

uint64_t method lookup function for XPCDispatcher()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCDispatcher.__allocating_init(connection:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t destroy for XPCDispatcher.State(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24))
    return __swift_destroy_boxed_opaque_existential_1(a1);
  return a1;
}

uint64_t initializeWithCopy for XPCDispatcher.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v4 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    v5 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = v5;
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1, a2);
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  }
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  return a1;
}

uint64_t assignWithCopy for XPCDispatcher.State(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  v4 = *((_QWORD *)a2 + 3);
  if (!*(_QWORD *)(a1 + 24))
  {
    if (v4)
    {
      *(_QWORD *)(a1 + 24) = v4;
      *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
      (**(void (***)(uint64_t, __int128 *))(v4 - 8))(a1, a2);
      goto LABEL_8;
    }
LABEL_7:
    v5 = *a2;
    v6 = a2[1];
    *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
    *(_OWORD *)a1 = v5;
    *(_OWORD *)(a1 + 16) = v6;
    goto LABEL_8;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
LABEL_8:
  *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
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

uint64_t assignWithTake for XPCDispatcher.State(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCDispatcher.State(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 56))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCDispatcher.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCDispatcher.State()
{
  return &type metadata for XPCDispatcher.State;
}

uint64_t sub_23DF0AE1C(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(result + 40) = *(_QWORD *)(v1 + 16);
  return result;
}

uint64_t sub_23DF0AE28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 16);
  sub_23DF0AE58(a1);
  return sub_23DE902F4(v3, a1);
}

uint64_t sub_23DF0AE58(uint64_t a1)
{
  uint64_t v2;

  sub_23DF0AE94();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_23DF0AE94()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432D300)
  {
    sub_23DF0AEE8();
    v0 = sub_23DF150F4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432D300);
  }
}

unint64_t sub_23DF0AEE8()
{
  unint64_t result;

  result = qword_25432C260;
  if (!qword_25432C260)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_25432C260);
  }
  return result;
}

uint64_t sub_23DF0AF3C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23DF0AF60(uint64_t *a1)
{
  return sub_23DF0A9B8(a1);
}

void sub_23DF0AF6C(uint64_t a1)
{
  uint64_t v1;

  sub_23DF0A7B4(a1, *(_QWORD *)(v1 + 16), v1 + 24);
}

uint64_t block_copy_helper_13(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_13()
{
  return swift_release();
}

unint64_t sub_23DF0AF90()
{
  unint64_t result;

  result = qword_256D10098;
  if (!qword_256D10098)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_256D10098);
  }
  return result;
}

uint64_t objectdestroy_6Tm()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 88);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_23DF0B044(void *a1)
{
  uint64_t v1;

  sub_23DF0A86C(a1, *(_QWORD *)(v1 + 16), v1 + 24);
}

uint64_t sub_23DF0B050(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DF0AE94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_23DF0B094()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D100A0)
  {
    type metadata accessor for os_unfair_lock_s(255);
    v0 = sub_23DF151E4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D100A0);
  }
}

uint64_t sub_23DF0B0F0(__int128 *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  v4 = *((_QWORD *)a1 + 3);
  if (v4)
  {
    v5 = *((_QWORD *)a1 + 4);
    *(_QWORD *)(a2 + 24) = v4;
    *(_QWORD *)(a2 + 32) = v5;
    (**(void (***)(uint64_t, __int128 *))(v4 - 8))(a2, a1);
  }
  else
  {
    v6 = *a1;
    v7 = a1[1];
    *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v7;
  }
  *(_OWORD *)(a2 + 40) = *(__int128 *)((char *)a1 + 40);
  return a2;
}

uint64_t sub_23DF0B154(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_1(a1);
  return a1;
}

uint64_t dispatch thunk of WorkQueueStatusObserver.didEnqueue(count:context:queueLength:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of WorkQueueStatusObserver.didFinish(workPlan:after:analytics:result:executor:context:remaining:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(void))(a9 + 16))();
}

uint64_t WorkCriteriaRecord.__allocating_init(context:executorIdentifier:planner:criteria:)(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;

  swift_allocObject();
  v12 = sub_23DF122AC(a1, a2, a3, a4, a5, a6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return v12;
}

void WorkCriteriaRecord.recheck(timestamp:)(_OWORD *a1@<X8>, double a2@<D0>)
{
  uint64_t v2;
  os_unfair_lock_s *v5;
  uint64_t v6;
  os_unfair_lock_s *v7;

  v5 = *(os_unfair_lock_s **)(v2 + 112);
  v6 = (uint64_t)&v5[4];
  v7 = v5 + 16;
  os_unfair_lock_lock(v5 + 16);
  sub_23DF0B9E4(v6, a1, a2);
  os_unfair_lock_unlock(v7);
}

void WorkCriteriaRecord.check(timestamp:anchorUpdates:)(uint64_t a1@<X0>, _OWORD *a2@<X8>, double a3@<D0>)
{
  uint64_t v3;
  os_unfair_lock_s *v7;
  uint64_t *v8;
  os_unfair_lock_s *v9;

  v7 = *(os_unfair_lock_s **)(v3 + 112);
  v8 = (uint64_t *)&v7[4];
  v9 = v7 + 16;
  os_unfair_lock_lock(v7 + 16);
  sub_23DF0B388(v8, a1, a2, a3);
  os_unfair_lock_unlock(v9);
}

uint64_t WorkCriteriaRecord.init(context:executorIdentifier:planner:criteria:)(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  v6 = sub_23DF122AC(a1, a2, a3, a4, a5, a6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return v6;
}

uint64_t sub_23DF0B35C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X2>, _OWORD *a3@<X8>, double a4@<D0>)
{
  return sub_23DF0B388(a1, a2, a3, a4);
}

uint64_t sub_23DF0B388@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>, double a4@<D0>)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t inited;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t result;
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
  uint64_t ObjectType;
  char *v39;
  NSObject *v40;
  int v41;
  _BOOL4 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  os_log_t v54;
  uint64_t v55;
  _QWORD v56[2];
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  os_log_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69[2];

  v5 = v4;
  v10 = sub_23DF14C80();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v66 = (char *)v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1[2];
  if (v14)
  {
    v15 = *(_QWORD *)(v14 + 16);
    swift_retain();
    swift_bridgeObjectRetain();
    v16 = swift_bridgeObjectRetain();
    v17 = sub_23DF00440(v16, v15);
    type metadata accessor for InputSignalAnchorSet();
    inited = swift_initStackObject();
    *(_QWORD *)(inited + 16) = v17;
    v19 = (_QWORD *)v5[12];
    swift_retain();
    v20 = sub_23DF120F8(inited, (uint64_t)v19);
    swift_release();
  }
  else
  {
    v19 = (_QWORD *)v5[12];
    swift_retain();
    swift_retain();
    v20 = sub_23DF120F8(a2, (uint64_t)v19);
  }
  swift_retain();
  swift_release();
  a1[2] = v20;
  v21 = *a1;
  if (!*a1)
    goto LABEL_9;
  swift_retain();
  swift_retain();
  v22 = _s19HealthOrchestration20InputSignalAnchorSetC2eeoiySbAC_ACtFZ_0(v20, v21);
  swift_release();
  swift_release();
  if ((v22 & 1) != 0)
  {
    result = swift_release();
    v24 = 1;
    goto LABEL_25;
  }
  v25 = *a1;
  if (*a1)
  {
    v65 = v11;
    v26 = v10;
    v27 = *(_QWORD *)(v25 + 16);
    swift_bridgeObjectRetain();
    v28 = swift_bridgeObjectRetain();
    v29 = sub_23DF00440(v28, v27);
    type metadata accessor for InputSignalAnchorSet();
    v30 = swift_allocObject();
    *(_QWORD *)(v30 + 16) = v29;
  }
  else
  {
LABEL_9:
    v65 = v11;
    v26 = v10;
    swift_retain();
    v30 = v20;
  }
  swift_retain();
  swift_retain();
  v31 = sub_23DF120F8(v30, (uint64_t)v19);
  v32 = swift_bridgeObjectRetain();
  v33 = sub_23DEB42A0(v32);
  v34 = v5[13];
  if ((sub_23DEA28F4(v33, v34) & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_23DF0BA8C((uint64_t)a1, v31, a3, a4);
    swift_release();
    swift_release();
    return swift_release();
  }
  v63 = v31;
  v64 = v30;
  if (*(_QWORD *)(v33 + 16) <= *(_QWORD *)(v34 + 16) >> 3)
  {
    v67 = v34;
    swift_bridgeObjectRetain();
    sub_23DF0FDE0(v33);
    swift_bridgeObjectRelease();
    v35 = v67;
  }
  else
  {
    swift_bridgeObjectRetain();
    v35 = sub_23DF0FFAC(v33, v34);
    swift_bridgeObjectRelease();
  }
  v36 = v26;
  v37 = v5[3];
  ObjectType = swift_getObjectType();
  v39 = v66;
  (*(void (**)(uint64_t, uint64_t))(v37 + 40))(ObjectType, v37);
  swift_retain_n();
  swift_bridgeObjectRetain();
  v40 = sub_23DF14C68();
  v41 = sub_23DF1501C();
  v42 = os_log_type_enabled(v40, (os_log_type_t)v41);
  v43 = v65;
  if (v42)
  {
    v59 = v41;
    v60 = v35;
    v61 = v40;
    v62 = v36;
    v44 = swift_slowAlloc();
    v45 = swift_slowAlloc();
    v58 = v45;
    *(_DWORD *)v44 = 136315650;
    v46 = v5[8];
    v47 = v5[9];
    v56[1] = v5[6];
    v57 = v46;
    v67 = 60;
    v68 = 0xE100000000000000;
    v69[0] = v45;
    swift_bridgeObjectRetain();
    sub_23DF14E60();
    swift_bridgeObjectRelease();
    sub_23DF14E60();
    if (!v47)
      swift_bridgeObjectRetain();
    v57 = v44 + 4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    sub_23DF14E60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23DF14E60();
    v67 = sub_23DEC1518(v67, v68, v69);
    sub_23DF15100();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2080;
    if (v19[5])
    {
      v48 = v19[4];
      v49 = v19[5];
    }
    else
    {
      v48 = v19[2];
      v49 = v19[3];
      swift_bridgeObjectRetain();
    }
    v50 = v65;
    swift_bridgeObjectRetain();
    v67 = sub_23DEC1518(v48, v49, v69);
    sub_23DF15100();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 22) = 2080;
    sub_23DE95570();
    swift_bridgeObjectRetain();
    v51 = sub_23DF14F8C();
    v53 = v52;
    swift_bridgeObjectRelease();
    v67 = sub_23DEC1518(v51, v53, v69);
    sub_23DF15100();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v54 = v61;
    _os_log_impl(&dword_23DE8B000, v61, (os_log_type_t)v59, "%s:%s: Queuing update while awaiting signals: %s.", (uint8_t *)v44, 0x20u);
    v55 = v58;
    swift_arrayDestroy();
    MEMORY[0x242648490](v55, -1, -1);
    MEMORY[0x242648490](v44, -1, -1);
    swift_release();
    swift_release();
    swift_release();

    result = (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v66, v62);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    swift_release();
    swift_release();
    swift_release();
    result = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v39, v36);
  }
  v24 = 2;
LABEL_25:
  *(_QWORD *)a3 = v24;
  *(_OWORD *)((char *)a3 + 8) = 0u;
  *(_OWORD *)((char *)a3 + 24) = 0u;
  *(_OWORD *)((char *)a3 + 40) = 0u;
  *(_OWORD *)((char *)a3 + 56) = 0u;
  *(_OWORD *)((char *)a3 + 72) = 0u;
  *(_OWORD *)((char *)a3 + 88) = 0u;
  return result;
}

uint64_t sub_23DF0B9E4@<X0>(uint64_t result@<X0>, _OWORD *a2@<X8>, double a3@<D0>)
{
  uint64_t v4;
  uint64_t v5;

  if (*(_BYTE *)(result + 24) == 1 && (v4 = result, *(_BYTE *)(result + 24) = 0, (v5 = *(_QWORD *)(result + 8)) != 0))
  {
    *(_QWORD *)(result + 8) = *(_QWORD *)result;
    swift_retain();
    sub_23DF0BA8C(v4, v5, a2, a3);
    return swift_release();
  }
  else
  {
    *(_QWORD *)a2 = 2;
    *(_OWORD *)((char *)a2 + 8) = 0u;
    *(_OWORD *)((char *)a2 + 24) = 0u;
    *(_OWORD *)((char *)a2 + 40) = 0u;
    *(_OWORD *)((char *)a2 + 56) = 0u;
    *(_OWORD *)((char *)a2 + 72) = 0u;
    *(_OWORD *)((char *)a2 + 88) = 0u;
  }
  return result;
}

uint64_t sub_23DF0BA8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>, double a4@<D0>)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  NSObject *v25;
  int v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t ObjectType;
  NSObject *v31;
  int v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t *v36;
  uint64_t v37;
  unint64_t v38;
  uint8_t *v39;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  __int128 v45;
  unint64_t v46;
  unint64_t v47;
  uint8_t *v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  os_log_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  char v75;
  unint64_t v76;
  uint64_t v77;
  _BOOL8 v78;
  uint64_t v79;
  char v80;
  unint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  uint64_t v86;
  char isUniquelyReferenced_nonNull_native;
  char v88;
  unint64_t v89;
  uint64_t v90;
  _BOOL8 v91;
  uint64_t v92;
  char v93;
  unint64_t v94;
  char v95;
  uint64_t *v96;
  uint64_t v97;
  BOOL v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  _QWORD *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t result;
  __int128 v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _OWORD *v120;
  uint64_t v121;
  int v122;
  os_log_t v123;
  uint64_t v124;
  uint64_t v125;
  _QWORD *v126;
  uint8_t *v127;
  uint64_t v128;
  _OWORD *v129;
  uint64_t v130;
  uint64_t v131;
  _QWORD *v132;
  uint64_t v133;
  char *v134;
  _QWORD *v135;
  __int128 v136;
  uint64_t v137;
  _QWORD v138[3];
  __int128 v139;
  __int128 v140;
  uint64_t v141;
  __int128 v142;
  __int128 v143;
  uint64_t v144;
  uint64_t v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  uint64_t v149;
  __int128 v150;
  uint64_t v151;
  uint64_t v152;

  v5 = v4;
  v129 = a3;
  v9 = sub_23DF14C80();
  v10 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x24BDAC7A8](v9, v11);
  v14 = (char *)&v121 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12, v15);
  v134 = (char *)&v121 - v16;
  v17 = (_QWORD *)v4[12];
  swift_retain();
  swift_retain();
  v18 = swift_bridgeObjectRetain();
  v19 = sub_23DF1386C(v18, a1, a2, v4);
  swift_bridgeObjectRelease();
  v131 = a2;
  swift_release();
  swift_release();
  v128 = a1;
  if (*(_QWORD *)(a1 + 8))
  {
    v130 = *(_QWORD *)(a1 + 8);
    swift_retain();
  }
  else
  {
    v20 = sub_23DE93368(MEMORY[0x24BEE4AF8]);
    type metadata accessor for InputSignalAnchorSet();
    v130 = swift_allocObject();
    *(_QWORD *)(v130 + 16) = v20;
  }
  v21 = v19[2];
  v132 = v5;
  if (!v21)
  {
    swift_bridgeObjectRelease();
    v29 = v5[3];
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v29 + 40))(ObjectType, v29);
    swift_retain_n();
    v31 = sub_23DF14C68();
    v32 = sub_23DF14FF8();
    if (os_log_type_enabled(v31, (os_log_type_t)v32))
    {
      LODWORD(v134) = v32;
      v125 = v9;
      v126 = v17;
      v124 = v10;
      v33 = v5;
      v34 = swift_slowAlloc();
      v133 = swift_slowAlloc();
      *(_QWORD *)&v150 = v133;
      *(_DWORD *)v34 = 136315394;
      v127 = (uint8_t *)v33[6];
      v35 = v33[9];
      *(_QWORD *)&v139 = 60;
      *((_QWORD *)&v139 + 1) = 0xE100000000000000;
      swift_bridgeObjectRetain();
      sub_23DF14E60();
      swift_bridgeObjectRelease();
      sub_23DF14E60();
      if (!v35)
        swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      sub_23DF14E60();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_23DF14E60();
      *(_QWORD *)&v139 = sub_23DEC1518(v139, *((unint64_t *)&v139 + 1), (uint64_t *)&v150);
      sub_23DF15100();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v34 + 12) = 2080;
      if (v126[5])
      {
        v104 = v126[4];
        v105 = v126[5];
      }
      else
      {
        v104 = v126[2];
        v105 = v126[3];
        swift_bridgeObjectRetain();
      }
      v107 = v124;
      v106 = v125;
      v108 = v133;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v139 = sub_23DEC1518(v104, v105, (uint64_t *)&v150);
      sub_23DF15100();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DE8B000, v31, (os_log_type_t)v134, "%s:%s: Updated anchor has no relevant changes; ignoring.",
        (uint8_t *)v34,
        0x16u);
      swift_arrayDestroy();
      MEMORY[0x242648490](v108, -1, -1);
      MEMORY[0x242648490](v34, -1, -1);

      (*(void (**)(char *, uint64_t))(v107 + 8))(v14, v106);
    }
    else
    {

      swift_release_n();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
    }
    v56 = MEMORY[0x24BEE4AF8];
    v57 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    if (v57)
      goto LABEL_27;
LABEL_66:
    v59 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_67:
    v109 = sub_23DF0FCD4((uint64_t)v59);
    swift_bridgeObjectRelease();
    v110 = v128;
    v111 = v131;
    swift_retain();
    swift_bridgeObjectRelease();
    swift_release();
    *(_QWORD *)(v110 + 8) = v111;
    if (v57)
    {
      sub_23DF0D6F0(v110, v111, (uint64_t)v109, (uint64_t)&v139, a4);
      swift_release();
      result = swift_release();
      v113 = v140;
      v114 = v141;
      v115 = v144;
      v116 = v145;
      v117 = v142;
      v118 = v143;
      v119 = v146;
      v120 = v129;
      *v129 = v139;
      v120[1] = v113;
      *((_QWORD *)v120 + 4) = v114;
      *(_OWORD *)((char *)v120 + 40) = v117;
      *(_OWORD *)((char *)v120 + 56) = v118;
      *((_QWORD *)v120 + 9) = v115;
      *((_QWORD *)v120 + 10) = v116;
      *(_OWORD *)((char *)v120 + 88) = v119;
    }
    else
    {
      swift_release();
      sub_23DF0D570(v110, v111, (uint64_t)v129);
      return swift_release();
    }
    return result;
  }
  v133 = (uint64_t)v19;
  v22 = v5[3];
  v23 = swift_getObjectType();
  v24 = v134;
  (*(void (**)(uint64_t, uint64_t))(v22 + 40))(v23, v22);
  swift_retain_n();
  swift_bridgeObjectRetain();
  v25 = sub_23DF14C68();
  v26 = sub_23DF1501C();
  if (os_log_type_enabled(v25, (os_log_type_t)v26))
  {
    v122 = v26;
    v123 = v25;
    v126 = v17;
    v27 = (uint8_t *)swift_slowAlloc();
    v121 = swift_slowAlloc();
    *(_QWORD *)&v150 = v121;
    v127 = v27;
    *(_DWORD *)v27 = 136315650;
    v28 = v5[9];
    *(_QWORD *)&v139 = 60;
    *((_QWORD *)&v139 + 1) = 0xE100000000000000;
    swift_bridgeObjectRetain();
    sub_23DF14E60();
    swift_bridgeObjectRelease();
    sub_23DF14E60();
    if (!v28)
      swift_bridgeObjectRetain();
    v36 = v127;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    sub_23DF14E60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23DF14E60();
    *(_QWORD *)&v139 = sub_23DEC1518(v139, *((unint64_t *)&v139 + 1), (uint64_t *)&v150);
    sub_23DF15100();
    swift_release_n();
    swift_bridgeObjectRelease();
    *((_WORD *)v36 + 6) = 2080;
    v17 = v126;
    if (v126[5])
    {
      v37 = v126[4];
      v38 = v126[5];
    }
    else
    {
      v37 = v126[2];
      v38 = v126[3];
      swift_bridgeObjectRetain();
    }
    v39 = v127;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v139 = sub_23DEC1518(v37, v38, (uint64_t *)&v150);
    sub_23DF15100();
    swift_release_n();
    swift_bridgeObjectRelease();
    *((_WORD *)v39 + 11) = 2080;
    v40 = v133;
    v41 = *(_QWORD *)(v133 + 16);
    v42 = MEMORY[0x24BEE4AF8];
    if (v41)
    {
      v124 = v10;
      v125 = v9;
      *(_QWORD *)&v147 = MEMORY[0x24BEE4AF8];
      sub_23DEAA1B4(0, v41, 0);
      v42 = v147;
      v43 = (uint64_t *)(v40 + 56);
      do
      {
        v44 = *v43;
        *(_QWORD *)&v139 = 0;
        *((_QWORD *)&v139 + 1) = 0xE000000000000000;
        if (!v44)
          swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        sub_23DF14E60();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v45 = v139;
        *(_QWORD *)&v147 = v42;
        v47 = *(_QWORD *)(v42 + 16);
        v46 = *(_QWORD *)(v42 + 24);
        if (v47 >= v46 >> 1)
        {
          sub_23DEAA1B4(v46 > 1, v47 + 1, 1);
          v42 = v147;
        }
        v43 += 4;
        *(_QWORD *)(v42 + 16) = v47 + 1;
        *(_OWORD *)(v42 + 16 * v47 + 32) = v45;
        --v41;
      }
      while (v41);
      v10 = v124;
      v9 = v125;
      v17 = v126;
    }
    v48 = v127;
    *(_QWORD *)&v139 = v42;
    sub_23DEABD84(0, (unint64_t *)&qword_25432D930, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    sub_23DEAA1D0();
    v49 = sub_23DF14DD0();
    v51 = v50;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v139 = sub_23DEC1518(v49, v51, (uint64_t *)&v150);
    sub_23DF15100();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v52 = v123;
    _os_log_impl(&dword_23DE8B000, v123, (os_log_type_t)v122, "%s:%s: Updated anchor has relevant changes for input signals (%s), requesting work plans.", v48, 0x20u);
    v53 = v121;
    swift_arrayDestroy();
    MEMORY[0x242648490](v53, -1, -1);
    MEMORY[0x242648490](v48, -1, -1);

    (*(void (**)(char *, uint64_t))(v10 + 8))(v134, v9);
    v5 = v132;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v24, v9);
  }
  v54 = v5[11];
  v55 = swift_getObjectType();
  (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(v54 + 40))(v17, v131, v130, v55, v54);
  swift_getAssociatedTypeWitness();
  sub_23DE95524(0, (unint64_t *)&qword_25432D878);
  v56 = sub_23DF15268();
  swift_bridgeObjectRelease();
  v57 = *(_QWORD *)(v56 + 16);
  if (!v57)
    goto LABEL_66;
LABEL_27:
  v58 = v56 + 32;
  v127 = (uint8_t *)v56;
  swift_bridgeObjectRetain_n();
  v59 = (_QWORD *)MEMORY[0x24BEE4B00];
  v60 = (char *)v57;
  v133 = v57;
  while (1)
  {
    v134 = v60;
    sub_23DE902F4(v58, (uint64_t)&v139);
    v63 = *((_QWORD *)&v140 + 1);
    v64 = v141;
    __swift_project_boxed_opaque_existential_1(&v139, *((uint64_t *)&v140 + 1));
    (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v64 + 24))(&v136, v63, v64);
    if (v59[2] && (v65 = sub_23DEA661C(v136, *((uint64_t *)&v136 + 1), v137), (v66 & 1) != 0))
    {
      sub_23DE902F4(v59[7] + 40 * v65, (uint64_t)&v147);
    }
    else
    {
      v149 = 0;
      v147 = 0u;
      v148 = 0u;
    }
    swift_bridgeObjectRelease();
    if (!*((_QWORD *)&v148 + 1))
    {
      sub_23DF13EE4((uint64_t)&v147, (uint64_t)&unk_25432D880, (uint64_t)&qword_25432D878, (uint64_t)&protocol descriptor for WorkPlan, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))sub_23DECE884);
      v83 = *((_QWORD *)&v140 + 1);
      v84 = v141;
      __swift_project_boxed_opaque_existential_1(&v139, *((uint64_t *)&v140 + 1));
      (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v84 + 24))(&v147, v83, v84);
      v85 = v147;
      v86 = v148;
      sub_23DE902F4((uint64_t)&v139, (uint64_t)&v150);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)&v136 = v59;
      v89 = sub_23DEA661C(v85, *((uint64_t *)&v85 + 1), v86);
      v90 = v59[2];
      v91 = (v88 & 1) == 0;
      v92 = v90 + v91;
      if (__OFADD__(v90, v91))
        goto LABEL_71;
      v93 = v88;
      if (v59[3] < v92)
      {
        sub_23DECA178(v92, isUniquelyReferenced_nonNull_native);
        v94 = sub_23DEA661C(v85, *((uint64_t *)&v85 + 1), v86);
        if ((v93 & 1) != (v95 & 1))
          goto LABEL_74;
        v89 = v94;
        v59 = (_QWORD *)v136;
        if ((v93 & 1) == 0)
          goto LABEL_56;
LABEL_52:
        v100 = v59[7] + 40 * v89;
        __swift_destroy_boxed_opaque_existential_1(v100);
        sub_23DE902DC(&v150, v100);
LABEL_58:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_30;
      }
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v59 = (_QWORD *)v136;
        if ((v88 & 1) != 0)
          goto LABEL_52;
      }
      else
      {
        sub_23DECC124();
        v59 = (_QWORD *)v136;
        if ((v93 & 1) != 0)
          goto LABEL_52;
      }
LABEL_56:
      v59[(v89 >> 6) + 8] |= 1 << v89;
      v101 = v59[6] + 24 * v89;
      *(_OWORD *)v101 = v85;
      *(_QWORD *)(v101 + 16) = v86;
      sub_23DE902DC(&v150, v59[7] + 40 * v89);
      v102 = v59[2];
      v98 = __OFADD__(v102, 1);
      v103 = v102 + 1;
      if (v98)
        goto LABEL_73;
      v59[2] = v103;
      swift_bridgeObjectRetain();
      goto LABEL_58;
    }
    sub_23DE902DC(&v147, (uint64_t)&v150);
    v67 = *((_QWORD *)&v140 + 1);
    v68 = v141;
    __swift_project_boxed_opaque_existential_1(&v139, *((uint64_t *)&v140 + 1));
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v68 + 24))(v138, v67, v68);
    v70 = v138[0];
    v69 = v138[1];
    v71 = v138[2];
    v72 = v151;
    v73 = v152;
    __swift_project_boxed_opaque_existential_1(&v150, v151);
    sub_23DEEEE88((uint64_t)&v139, v72, v73, (uint64_t *)&v147);
    sub_23DE902DC(&v147, (uint64_t)&v136);
    v74 = swift_isUniquelyReferenced_nonNull_native();
    v135 = v59;
    v76 = sub_23DEA661C(v70, v69, v71);
    v77 = v59[2];
    v78 = (v75 & 1) == 0;
    v79 = v77 + v78;
    if (__OFADD__(v77, v78))
      break;
    v80 = v75;
    if (v59[3] >= v79)
    {
      if ((v74 & 1) != 0)
      {
        v59 = v135;
        if ((v75 & 1) == 0)
          goto LABEL_48;
      }
      else
      {
        sub_23DECC124();
        v59 = v135;
        if ((v80 & 1) == 0)
          goto LABEL_48;
      }
    }
    else
    {
      sub_23DECA178(v79, v74);
      v81 = sub_23DEA661C(v70, v69, v71);
      if ((v80 & 1) != (v82 & 1))
        goto LABEL_74;
      v76 = v81;
      v59 = v135;
      if ((v80 & 1) == 0)
      {
LABEL_48:
        v59[(v76 >> 6) + 8] |= 1 << v76;
        v96 = (uint64_t *)(v59[6] + 24 * v76);
        *v96 = v70;
        v96[1] = v69;
        v96[2] = v71;
        sub_23DE902DC(&v136, v59[7] + 40 * v76);
        v97 = v59[2];
        v98 = __OFADD__(v97, 1);
        v99 = v97 + 1;
        if (v98)
          goto LABEL_72;
        v59[2] = v99;
        swift_bridgeObjectRetain();
        goto LABEL_29;
      }
    }
    v61 = v59[7] + 40 * v76;
    __swift_destroy_boxed_opaque_existential_1(v61);
    sub_23DE902DC(&v136, v61);
LABEL_29:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v150);
LABEL_30:
    v57 = v133;
    v62 = v134;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v139);
    v58 += 40;
    v60 = v62 - 1;
    if (!v60)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_67;
    }
  }
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  result = sub_23DF15424();
  __break(1u);
  return result;
}

uint64_t sub_23DF0C8BC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t *__return_ptr, uint64_t, uint64_t);
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t ObjectType;
  void (*v36)(uint64_t, uint64_t);
  char *v37;
  NSObject *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t result;
  NSObject *v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  unint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  os_log_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  os_log_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  os_log_t v79;
  _QWORD *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  _BYTE v88[40];
  uint64_t v89[5];
  __int128 v90;
  __int128 v91;
  uint64_t v92;
  uint64_t v93[3];
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;
  uint64_t v99;

  v10 = sub_23DF14C80();
  v82 = *(_QWORD *)(v10 - 8);
  v83 = v10;
  v12 = MEMORY[0x24BDAC7A8](v10, v11);
  v14 = (char *)&v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12, v15);
  v81 = (char *)&v76 - v16;
  v17 = *(_QWORD *)(a2 + 8);
  if (v17)
  {
    v80 = a4;
    v18 = v14;
    v19 = a5;
    v20 = *(_QWORD *)(v17 + 16);
    v21 = a1[3];
    v22 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v21);
    v23 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v22 + 16);
    swift_bridgeObjectRetain();
    v23(v93, v21, v22);
    if (*(_QWORD *)(v20 + 16) && (v24 = sub_23DEA6458(v93[0], v93[1], v93[2], v94), (v25 & 1) != 0))
    {
      sub_23DE902F4(*(_QWORD *)(v20 + 56) + 40 * v24, (uint64_t)&v96);
    }
    else
    {
      v98 = 0;
      v96 = 0u;
      v97 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a5 = v19;
    v14 = v18;
    a4 = v80;
  }
  else
  {
    v98 = 0;
    v96 = 0u;
    v97 = 0u;
  }
  v26 = *(_QWORD *)(a3 + 16);
  v27 = a1[3];
  v28 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v27);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v28 + 16))(v89, v27, v28);
  if (*(_QWORD *)(v26 + 16) && (v29 = sub_23DEA6458(v89[0], v89[1], v89[2], v89[3]), (v30 & 1) != 0))
  {
    sub_23DE902F4(*(_QWORD *)(v26 + 56) + 40 * v29, (uint64_t)&v90);
  }
  else
  {
    v92 = 0;
    v90 = 0u;
    v91 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v91 + 1))
  {
    sub_23DE902DC(&v90, (uint64_t)v93);
    v31 = v94;
    v32 = v95;
    __swift_project_boxed_opaque_existential_1(v93, v94);
    v33 = sub_23DE8FDD0((uint64_t)&v96, (uint64_t)a1, v31, v32);
    v34 = a4[3];
    ObjectType = swift_getObjectType();
    v36 = *(void (**)(uint64_t, uint64_t))(v34 + 40);
    if ((v33 & 1) != 0)
    {
      v37 = v81;
      v36(ObjectType, v34);
      sub_23DE902F4((uint64_t)a1, (uint64_t)&v90);
      sub_23DE901AC((uint64_t)&v96, (uint64_t)v89);
      sub_23DE902F4((uint64_t)v93, (uint64_t)v88);
      swift_retain_n();
      v38 = sub_23DF14C68();
      v39 = sub_23DF14FF8();
      if (os_log_type_enabled(v38, (os_log_type_t)v39))
      {
        v78 = v39;
        v79 = v38;
        v80 = a5;
        v40 = swift_slowAlloc();
        v77 = swift_slowAlloc();
        v99 = v77;
        *(_DWORD *)v40 = 136316162;
        v76 = a4[6];
        v41 = a4[9];
        v84 = 60;
        v85 = 0xE100000000000000;
        swift_bridgeObjectRetain();
        sub_23DF14E60();
        swift_bridgeObjectRelease();
        sub_23DF14E60();
        if (!v41)
          swift_bridgeObjectRetain();
        v76 = v40 + 4;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        sub_23DF14E60();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_23DF14E60();
        v84 = sub_23DEC1518(v84, v85, &v99);
        sub_23DF15100();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v40 + 12) = 2080;
        v47 = (_QWORD *)a4[12];
        if (v47[5])
        {
          v48 = v47[4];
          v49 = v47[5];
        }
        else
        {
          v48 = v47[2];
          v49 = v47[3];
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRetain();
        v84 = sub_23DEC1518(v48, v49, &v99);
        sub_23DF15100();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v40 + 22) = 2080;
        v53 = *((_QWORD *)&v91 + 1);
        v54 = v92;
        __swift_project_boxed_opaque_existential_1(&v90, *((uint64_t *)&v91 + 1));
        (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v54 + 16))(&v84, v53, v54);
        v55 = v87;
        if (v87)
        {
          v56 = v86;
        }
        else
        {
          v56 = v84;
          v55 = swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        v84 = sub_23DEC1518(v56, v55, &v99);
        sub_23DF15100();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v90);
        *(_WORD *)(v40 + 32) = 2080;
        sub_23DE901AC((uint64_t)v89, (uint64_t)&v84);
        sub_23DECE884(0, (unint64_t *)&qword_25432D450, qword_25432C070, (uint64_t)&protocol descriptor for InputSignalAnchor, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
        v61 = sub_23DF14E18();
        v84 = sub_23DEC1518(v61, v62, &v99);
        sub_23DF15100();
        swift_bridgeObjectRelease();
        sub_23DF13EE4((uint64_t)v89, (uint64_t)&qword_25432D450, (uint64_t)qword_25432C070, (uint64_t)&protocol descriptor for InputSignalAnchor, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))sub_23DECE884);
        *(_WORD *)(v40 + 42) = 2080;
        sub_23DE902F4((uint64_t)v88, (uint64_t)&v84);
        sub_23DE95524(0, qword_25432C070);
        v63 = sub_23DF14E18();
        v84 = sub_23DEC1518(v63, v64, &v99);
        sub_23DF15100();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
        v65 = v79;
        _os_log_impl(&dword_23DE8B000, v79, (os_log_type_t)v78, "%s:%s: Anchor difference for %s %s -> (%s.", (uint8_t *)v40, 0x34u);
        v66 = v77;
        swift_arrayDestroy();
        MEMORY[0x242648490](v66, -1, -1);
        MEMORY[0x242648490](v40, -1, -1);

        (*(void (**)(char *, uint64_t))(v82 + 8))(v81, v83);
        a5 = v80;
      }
      else
      {
        swift_release_n();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v90);
        sub_23DF13EE4((uint64_t)v89, (uint64_t)&qword_25432D450, (uint64_t)qword_25432C070, (uint64_t)&protocol descriptor for InputSignalAnchor, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))sub_23DECE884);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);

        (*(void (**)(char *, uint64_t))(v82 + 8))(v37, v83);
      }
      v67 = a1[3];
      v68 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v67);
      (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v68 + 16))(&v90, v67, v68);
      sub_23DF13EE4((uint64_t)&v96, (uint64_t)&qword_25432D450, (uint64_t)qword_25432C070, (uint64_t)&protocol descriptor for InputSignalAnchor, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))sub_23DECE884);
      v69 = *((_QWORD *)&v90 + 1);
      *a5 = v90;
      a5[1] = v69;
      *((_OWORD *)a5 + 1) = v91;
    }
    else
    {
      v36(ObjectType, v34);
      sub_23DE902F4((uint64_t)a1, (uint64_t)&v90);
      sub_23DE901AC((uint64_t)&v96, (uint64_t)v89);
      sub_23DE902F4((uint64_t)v93, (uint64_t)v88);
      swift_retain_n();
      v43 = sub_23DF14C68();
      v44 = sub_23DF14FF8();
      if (os_log_type_enabled(v43, (os_log_type_t)v44))
      {
        v78 = v44;
        v79 = v43;
        v80 = a5;
        v81 = v14;
        v45 = swift_slowAlloc();
        v77 = swift_slowAlloc();
        v99 = v77;
        *(_DWORD *)v45 = 136316162;
        v46 = a4[9];
        v84 = 60;
        v85 = 0xE100000000000000;
        swift_bridgeObjectRetain();
        sub_23DF14E60();
        swift_bridgeObjectRelease();
        sub_23DF14E60();
        if (!v46)
          swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        sub_23DF14E60();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_23DF14E60();
        v84 = sub_23DEC1518(v84, v85, &v99);
        sub_23DF15100();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v45 + 12) = 2080;
        v50 = (_QWORD *)a4[12];
        if (v50[5])
        {
          v51 = v50[4];
          v52 = v50[5];
        }
        else
        {
          v51 = v50[2];
          v52 = v50[3];
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRetain();
        v84 = sub_23DEC1518(v51, v52, &v99);
        sub_23DF15100();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v45 + 22) = 2080;
        v57 = *((_QWORD *)&v91 + 1);
        v58 = v92;
        __swift_project_boxed_opaque_existential_1(&v90, *((uint64_t *)&v91 + 1));
        (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v58 + 16))(&v84, v57, v58);
        v59 = v87;
        if (v87)
        {
          v60 = v86;
        }
        else
        {
          v60 = v84;
          v59 = swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        v84 = sub_23DEC1518(v60, v59, &v99);
        sub_23DF15100();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v90);
        *(_WORD *)(v45 + 32) = 2080;
        sub_23DE901AC((uint64_t)v89, (uint64_t)&v84);
        sub_23DECE884(0, (unint64_t *)&qword_25432D450, qword_25432C070, (uint64_t)&protocol descriptor for InputSignalAnchor, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
        v70 = sub_23DF14E18();
        v84 = sub_23DEC1518(v70, v71, &v99);
        sub_23DF15100();
        swift_bridgeObjectRelease();
        sub_23DF13EE4((uint64_t)v89, (uint64_t)&qword_25432D450, (uint64_t)qword_25432C070, (uint64_t)&protocol descriptor for InputSignalAnchor, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))sub_23DECE884);
        *(_WORD *)(v45 + 42) = 2080;
        sub_23DE902F4((uint64_t)v88, (uint64_t)&v84);
        sub_23DE95524(0, qword_25432C070);
        v72 = sub_23DF14E18();
        v84 = sub_23DEC1518(v72, v73, &v99);
        sub_23DF15100();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
        v74 = v79;
        _os_log_impl(&dword_23DE8B000, v79, (os_log_type_t)v78, "%s:%s: No anchor difference for %s %s -> (%s.", (uint8_t *)v45, 0x34u);
        v75 = v77;
        swift_arrayDestroy();
        MEMORY[0x242648490](v75, -1, -1);
        MEMORY[0x242648490](v45, -1, -1);

        (*(void (**)(char *, uint64_t))(v82 + 8))(v81, v83);
        sub_23DF13EE4((uint64_t)&v96, (uint64_t)&qword_25432D450, (uint64_t)qword_25432C070, (uint64_t)&protocol descriptor for InputSignalAnchor, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))sub_23DECE884);
        a5 = v80;
      }
      else
      {

        __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
        sub_23DF13EE4((uint64_t)v89, (uint64_t)&qword_25432D450, (uint64_t)qword_25432C070, (uint64_t)&protocol descriptor for InputSignalAnchor, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))sub_23DECE884);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v90);
        swift_release_n();
        swift_release();
        (*(void (**)(char *, uint64_t))(v82 + 8))(v14, v83);
        sub_23DF13EE4((uint64_t)&v96, (uint64_t)&qword_25432D450, (uint64_t)qword_25432C070, (uint64_t)&protocol descriptor for InputSignalAnchor, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))sub_23DECE884);
      }
      *(_OWORD *)a5 = 0u;
      *((_OWORD *)a5 + 1) = 0u;
    }
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v93);
  }
  else
  {
    sub_23DF13EE4((uint64_t)&v96, (uint64_t)&qword_25432D450, (uint64_t)qword_25432C070, (uint64_t)&protocol descriptor for InputSignalAnchor, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))sub_23DECE884);
    result = sub_23DF13EE4((uint64_t)&v90, (uint64_t)&qword_25432D450, (uint64_t)qword_25432C070, (uint64_t)&protocol descriptor for InputSignalAnchor, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))sub_23DECE884);
    *(_OWORD *)a5 = 0u;
    *((_OWORD *)a5 + 1) = 0u;
  }
  return result;
}

unint64_t sub_23DF0D570@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v6;
  uint64_t v7;
  unint64_t result;
  uint64_t v9;
  uint64_t v10;

  v6 = *(_QWORD *)(a1 + 40);
  if (!(v6 >> 62))
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7)
      goto LABEL_3;
LABEL_10:
    result = swift_bridgeObjectRelease();
    if ((*(_BYTE *)(a1 + 24) & 1) != 0)
      goto LABEL_11;
    swift_retain();
    result = swift_release();
    *(_QWORD *)a1 = a2;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_QWORD *)(a3 + 96) = 0;
    return result;
  }
  swift_bridgeObjectRetain();
  v7 = sub_23DF15298();
  if (!v7)
    goto LABEL_10;
LABEL_3:
  result = v7 - 1;
  if (__OFSUB__(v7, 1))
  {
    __break(1u);
    goto LABEL_14;
  }
  if ((v6 & 0xC000000000000001) != 0)
  {
LABEL_14:
    v9 = MEMORY[0x242647BF0](result, v6);
    goto LABEL_8;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v9 = *(_QWORD *)(v6 + 8 * result + 32);
    swift_retain();
LABEL_8:
    swift_bridgeObjectRelease();
    v10 = *(_QWORD *)(v9 + 16);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v10 + 36));
    swift_retain();
    swift_release();
    *(_QWORD *)(v10 + 16) = a2;
    os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 36));
    swift_release();
    result = swift_release();
LABEL_11:
    *(_QWORD *)a3 = 2;
    *(_OWORD *)(a3 + 8) = 0u;
    *(_OWORD *)(a3 + 24) = 0u;
    *(_OWORD *)(a3 + 40) = 0u;
    *(_OWORD *)(a3 + 56) = 0u;
    *(_OWORD *)(a3 + 72) = 0u;
    *(_OWORD *)(a3 + 88) = 0u;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_23DF0D6F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
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
  uint64_t v40;
  __int128 v45;
  _QWORD v46[3];
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[3];
  uint64_t v50;

  v6 = v5;
  v7 = a2;
  v9 = a1;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a3 + 16);
  v12 = MEMORY[0x24BEE4AF8];
  if (v11)
  {
    v40 = *(_QWORD *)(a1 + 32);
    v50 = MEMORY[0x24BEE4AF8];
    sub_23DEAA4F8(0, v11, 0);
    v14 = a3 + 32;
    v12 = v50;
    do
    {
      sub_23DE902F4(v14, (uint64_t)v46);
      v16 = v47;
      v15 = v48;
      __swift_project_boxed_opaque_existential_1(v46, v47);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v15 + 24))(v49, v16, v15);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
      v17 = v49[0];
      v18 = v49[1];
      v19 = v49[2];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23DEAA4F8(0, *(_QWORD *)(v12 + 16) + 1, 1);
        v12 = v50;
      }
      v21 = *(_QWORD *)(v12 + 16);
      v20 = *(_QWORD *)(v12 + 24);
      if (v21 >= v20 >> 1)
      {
        sub_23DEAA4F8(v20 > 1, v21 + 1, 1);
        v12 = v50;
      }
      *(_QWORD *)(v12 + 16) = v21 + 1;
      v22 = (_QWORD *)(v12 + 24 * v21);
      v22[4] = v17;
      v22[5] = v18;
      v22[6] = v19;
      v14 += 40;
      --v11;
    }
    while (v11);
    v7 = a2;
    v9 = a1;
    v6 = v5;
    v10 = v40;
  }
  v23 = sub_23DECE394(v12);
  swift_bridgeObjectRelease();
  v24 = *(_BYTE *)(v9 + 24);
  type metadata accessor for WorkCriteriaRecord.Epoch();
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 24) = v10;
  sub_23DE9B2F8(0, &qword_25432DA30);
  v26 = swift_allocObject();
  *(_DWORD *)(v26 + 36) = 0;
  *(_QWORD *)(v26 + 16) = v7;
  *(_QWORD *)(v26 + 24) = v23;
  *(_BYTE *)(v26 + 32) = (v24 & 1) == 0;
  *(_QWORD *)(v25 + 16) = v26;
  v27 = *(_QWORD *)(v9 + 32);
  v28 = __OFADD__(v27, 1);
  v29 = v27 + 1;
  if (v28)
  {
    __break(1u);
    goto LABEL_13;
  }
  *(_QWORD *)(v9 + 32) = v29;
  swift_retain();
  v30 = swift_retain();
  MEMORY[0x242647908](v30);
  if (*(_QWORD *)((*(_QWORD *)(v9 + 40) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v9 + 40) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
LABEL_13:
    sub_23DF14EE4();
  sub_23DF14F08();
  sub_23DF14ED8();
  v31 = *(_QWORD *)(v6 + 32);
  v32 = *(_QWORD *)(v6 + 40);
  v34 = *(_QWORD *)(v6 + 48);
  v33 = *(_QWORD *)(v6 + 56);
  v35 = *(_QWORD *)(v6 + 64);
  v36 = *(_QWORD *)(v6 + 72);
  v37 = swift_allocObject();
  v45 = *(_OWORD *)(v6 + 16);
  swift_weakInit();
  v38 = swift_allocObject();
  *(_QWORD *)(v38 + 16) = v37;
  *(_QWORD *)(v38 + 24) = v25;
  *(_QWORD *)a4 = a3;
  *(_QWORD *)(a4 + 8) = v31;
  *(_QWORD *)(a4 + 16) = v32;
  *(_QWORD *)(a4 + 24) = v34;
  *(_QWORD *)(a4 + 32) = v33;
  *(_QWORD *)(a4 + 40) = v35;
  *(_QWORD *)(a4 + 48) = v36;
  *(_QWORD *)(a4 + 56) = v7;
  *(_OWORD *)(a4 + 64) = v45;
  *(double *)(a4 + 80) = a5;
  *(_QWORD *)(a4 + 88) = sub_23DF13A0C;
  *(_QWORD *)(a4 + 96) = v38;
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23DF0D9E8(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  os_unfair_lock_s *v8;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v8 = *(os_unfair_lock_s **)(result + 112);
    swift_retain();
    os_unfair_lock_lock(v8 + 16);
    sub_23DF0DAA8((uint64_t)&v8[4], a1, a2, a4);
    os_unfair_lock_unlock(v8 + 16);
    swift_release();
    return swift_release();
  }
  return result;
}

void sub_23DF0DAA8(uint64_t a1, _QWORD *a2, void *a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  os_log_t v27;
  double v28;
  uint64_t v29;
  _QWORD *v30;
  NSObject *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  os_log_t v37;
  double v38;
  uint64_t ObjectType;
  _QWORD *v40;
  NSObject *v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  NSObject *v47;
  double v48;
  uint64_t v49;
  void (*isa)(_QWORD, _QWORD);
  id v51;
  NSObject *v52;
  _BYTE *v53;
  _QWORD *v54;
  NSObject *v55;
  int v56;
  BOOL v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  void (*v62)(_BYTE *, uint64_t);
  _BYTE *v63;
  uint64_t v64;
  uint64_t v65;
  _BYTE *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  os_log_t v70;
  void (*v71)(_QWORD, _QWORD);
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  os_log_t v75;
  void (*v76)(_QWORD, _QWORD);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  double v81;
  _QWORD *v82;
  os_log_t v83;
  uint64_t v84;
  os_log_t v85;
  uint64_t v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  unint64_t v91;
  os_log_t v92;
  uint64_t v93;
  NSObject *v94;
  os_log_type_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  unint64_t v100;
  double v101;
  uint64_t v102;
  uint64_t v103;
  NSObject *v104;
  os_log_type_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  os_unfair_lock_s *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  int v132;
  unint64_t *v133;
  unint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  os_unfair_lock_s *v139;
  uint64_t v140;
  unint64_t v141;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  _QWORD *v152;
  _QWORD *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void (*v157)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v158;
  uint64_t v159;
  _BYTE v160[12];
  int v161;
  _QWORD *v162;
  uint64_t v163;
  os_log_t v164;
  _BYTE *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void (*v169)(_QWORD, _QWORD);
  double v170;
  os_log_t v171;
  _QWORD *v172;
  uint64_t v173;
  double v174;
  uint64_t v175;
  id v176;
  uint64_t v177;
  _QWORD *v178;
  _BYTE *v179;
  uint64_t v180;
  double v181;
  os_log_t v182;
  double v183;
  os_log_t v184;
  uint64_t v185;
  uint64_t v186[2];
  uint64_t v187[14];
  double v188;
  uint64_t v189;
  os_log_t v190;
  uint64_t v191;
  uint64_t v192;
  _QWORD v193[3];
  uint64_t v194;
  uint64_t v195;
  char v196[8];
  uint64_t v197;
  _BYTE v198[80];

  v5 = v4;
  v177 = a4;
  v178 = a2;
  v175 = a1;
  v7 = 0.0;
  v8 = sub_23DF14C80();
  v9 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x24BDAC7A8](v8, v10);
  v13 = MEMORY[0x24BDAC7A8](v11, v12);
  v15 = MEMORY[0x24BDAC7A8](v13, v14);
  v17 = &v160[-v16];
  v19 = MEMORY[0x24BDAC7A8](v15, v18);
  v21 = &v160[-v20];
  MEMORY[0x24BDAC7A8](v19, v22);
  v26 = &v160[-v25];
  v172 = v5;
  v176 = a3;
  if (!a3)
  {
    v179 = (_BYTE *)v9;
    v174 = 0.0;
    v38 = *((double *)v5 + 2);
    v37 = (os_log_t)v5[3];
    ObjectType = swift_getObjectType();
    ((void (*)(uint64_t, os_log_t))v37[5].isa)(ObjectType, v37);
    v40 = v178;
    sub_23DEAC648((uint64_t)v178, (uint64_t)v196);
    sub_23DEAC648((uint64_t)v40, (uint64_t)&v189);
    sub_23DEAC648((uint64_t)v40, (uint64_t)v187);
    swift_retain_n();
    v41 = sub_23DF14C68();
    v42 = sub_23DF1501C();
    if (os_log_type_enabled(v41, (os_log_type_t)v42))
    {
      LODWORD(v170) = v42;
      v171 = v41;
      v173 = v8;
      v43 = swift_slowAlloc();
      v169 = (void (*)(_QWORD, _QWORD))swift_slowAlloc();
      v186[0] = (uint64_t)v169;
      *(_DWORD *)v43 = 136315906;
      v183 = v38;
      v184 = v37;
      sub_23DE95524(0, (unint64_t *)&qword_25432C268);
      swift_unknownObjectRetain();
      v44 = sub_23DF14E18();
      v183 = COERCE_DOUBLE(sub_23DEC1518(v44, v45, v186));
      sub_23DF15100();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      v46 = v197;
      *(_QWORD *)&v183 = 60;
      v184 = (os_log_t)0xE100000000000000;
      swift_bridgeObjectRetain();
      sub_23DF14E60();
      swift_bridgeObjectRelease();
      sub_23DF14E60();
      if (!v46)
        swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      sub_23DF14E60();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_23DF14E60();
      v183 = COERCE_DOUBLE(sub_23DEC1518(*(uint64_t *)&v183, (unint64_t)v184, v186));
      sub_23DF15100();
      swift_bridgeObjectRelease();
      sub_23DEAC67C((uint64_t)v196);
      *(_WORD *)(v43 + 22) = 2080;
      v72 = v194;
      v73 = v195;
      __swift_project_boxed_opaque_existential_1(v193, v194);
      (*(void (**)(double *__return_ptr, uint64_t, uint64_t))(v73 + 24))(&v183, v72, v73);
      v74 = v185;
      v181 = v183;
      v182 = v184;
      swift_bridgeObjectRetain();
      sub_23DF14E60();
      v180 = v74;
      sub_23DF153C4();
      sub_23DF14E60();
      swift_bridgeObjectRelease();
      sub_23DF14E60();
      swift_bridgeObjectRelease();
      v183 = COERCE_DOUBLE(sub_23DEC1518(*(uint64_t *)&v181, (unint64_t)v182, v186));
      sub_23DF15100();
      swift_bridgeObjectRelease();
      sub_23DEAC67C((uint64_t)&v189);
      *(_WORD *)(v43 + 32) = 2048;
      v183 = CFAbsoluteTimeGetCurrent() - v188;
      sub_23DF15100();
      sub_23DEAC67C((uint64_t)v187);
      v75 = v171;
      _os_log_impl(&dword_23DE8B000, v171, LOBYTE(v170), "[%s]: [%s - %s]: Finished run after %fs.", (uint8_t *)v43, 0x2Au);
      v76 = v169;
      swift_arrayDestroy();
      MEMORY[0x242648490](v76, -1, -1);
      MEMORY[0x242648490](v43, -1, -1);

      v62 = (void (*)(_BYTE *, uint64_t))*((_QWORD *)v179 + 1);
      v63 = v26;
      goto LABEL_20;
    }
    swift_release_n();
    sub_23DEAC67C((uint64_t)v196);
    sub_23DEAC67C((uint64_t)&v189);
    sub_23DEAC67C((uint64_t)v187);

    v62 = (void (*)(_BYTE *, uint64_t))*((_QWORD *)v179 + 1);
    v63 = v26;
LABEL_14:
    v64 = v8;
LABEL_21:
    v62(v63, v64);
    v65 = (uint64_t)v176;
    goto LABEL_52;
  }
  if (a3 == (void *)1)
  {
    v179 = (_BYTE *)v9;
    v174 = 0.0;
    v28 = *((double *)v5 + 2);
    v27 = (os_log_t)v5[3];
    v29 = swift_getObjectType();
    ((void (*)(uint64_t, os_log_t))v27[5].isa)(v29, v27);
    v30 = v178;
    sub_23DEAC648((uint64_t)v178, (uint64_t)v196);
    sub_23DEAC648((uint64_t)v30, (uint64_t)&v189);
    sub_23DEAC648((uint64_t)v30, (uint64_t)v187);
    swift_retain_n();
    v31 = sub_23DF14C68();
    v32 = sub_23DF1501C();
    if (os_log_type_enabled(v31, (os_log_type_t)v32))
    {
      LODWORD(v170) = v32;
      v171 = v31;
      v173 = v8;
      v33 = swift_slowAlloc();
      v169 = (void (*)(_QWORD, _QWORD))swift_slowAlloc();
      v186[0] = (uint64_t)v169;
      *(_DWORD *)v33 = 136315906;
      v183 = v28;
      v184 = v27;
      sub_23DE95524(0, (unint64_t *)&qword_25432C268);
      swift_unknownObjectRetain();
      v34 = sub_23DF14E18();
      v183 = COERCE_DOUBLE(sub_23DEC1518(v34, v35, v186));
      sub_23DF15100();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2080;
      v36 = v197;
      *(_QWORD *)&v183 = 60;
      v184 = (os_log_t)0xE100000000000000;
      swift_bridgeObjectRetain();
      sub_23DF14E60();
      swift_bridgeObjectRelease();
      sub_23DF14E60();
      if (!v36)
        swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      sub_23DF14E60();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_23DF14E60();
      v183 = COERCE_DOUBLE(sub_23DEC1518(*(uint64_t *)&v183, (unint64_t)v184, v186));
      sub_23DF15100();
      swift_bridgeObjectRelease();
      sub_23DEAC67C((uint64_t)v196);
      *(_WORD *)(v33 + 22) = 2080;
      v67 = v194;
      v68 = v195;
      __swift_project_boxed_opaque_existential_1(v193, v194);
      (*(void (**)(double *__return_ptr, uint64_t, uint64_t))(v68 + 24))(&v183, v67, v68);
      v69 = v185;
      v181 = v183;
      v182 = v184;
      swift_bridgeObjectRetain();
      sub_23DF14E60();
      v180 = v69;
      sub_23DF153C4();
      sub_23DF14E60();
      swift_bridgeObjectRelease();
      sub_23DF14E60();
      swift_bridgeObjectRelease();
      v183 = COERCE_DOUBLE(sub_23DEC1518(*(uint64_t *)&v181, (unint64_t)v182, v186));
      sub_23DF15100();
      swift_bridgeObjectRelease();
      sub_23DEAC67C((uint64_t)&v189);
      *(_WORD *)(v33 + 32) = 2048;
      v183 = CFAbsoluteTimeGetCurrent() - v188;
      sub_23DF15100();
      sub_23DEAC67C((uint64_t)v187);
      v70 = v171;
      _os_log_impl(&dword_23DE8B000, v171, LOBYTE(v170), "[%s]: [%s - %s]: Replaced after %fs.", (uint8_t *)v33, 0x2Au);
      v71 = v169;
      swift_arrayDestroy();
      MEMORY[0x242648490](v71, -1, -1);
      MEMORY[0x242648490](v33, -1, -1);

      v62 = (void (*)(_BYTE *, uint64_t))*((_QWORD *)v179 + 1);
      v63 = v17;
LABEL_20:
      v64 = v173;
      goto LABEL_21;
    }
    swift_release_n();
    sub_23DEAC67C((uint64_t)v196);
    sub_23DEAC67C((uint64_t)&v189);
    sub_23DEAC67C((uint64_t)v187);

    v62 = (void (*)(_BYTE *, uint64_t))*((_QWORD *)v179 + 1);
    v63 = v17;
    goto LABEL_14;
  }
  v173 = v8;
  v166 = v24;
  v167 = v23;
  v48 = *((double *)v5 + 2);
  v47 = v5[3];
  v49 = swift_getObjectType();
  isa = (void (*)(_QWORD, _QWORD))v47[5].isa;
  v51 = a3;
  v168 = v49;
  v169 = isa;
  v171 = v47;
  v52 = v47;
  v53 = v21;
  isa(v49, v52);
  v54 = v178;
  sub_23DEAC648((uint64_t)v178, (uint64_t)v196);
  sub_23DEAC648((uint64_t)v54, (uint64_t)&v189);
  sub_23DEAC648((uint64_t)v54, (uint64_t)v187);
  swift_retain();
  sub_23DEF2FC4(a3);
  swift_retain();
  sub_23DEF2FC4(a3);
  v55 = sub_23DF14C68();
  v56 = sub_23DF15004();
  v57 = os_log_type_enabled(v55, (os_log_type_t)v56);
  v170 = v48;
  if (v57)
  {
    v161 = v56;
    v164 = v55;
    v165 = v53;
    v179 = (_BYTE *)v9;
    v174 = 0.0;
    v58 = swift_slowAlloc();
    v162 = (_QWORD *)swift_slowAlloc();
    v163 = swift_slowAlloc();
    v186[0] = v163;
    *(_DWORD *)v58 = 136316162;
    v183 = v48;
    v184 = v171;
    sub_23DE95524(0, (unint64_t *)&qword_25432C268);
    swift_unknownObjectRetain();
    v59 = sub_23DF14E18();
    v183 = COERCE_DOUBLE(sub_23DEC1518(v59, v60, v186));
    sub_23DF15100();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v58 + 12) = 2080;
    v61 = v197;
    *(_QWORD *)&v183 = 60;
    v184 = (os_log_t)0xE100000000000000;
    swift_bridgeObjectRetain();
    sub_23DF14E60();
    swift_bridgeObjectRelease();
    sub_23DF14E60();
    if (!v61)
      swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    sub_23DF14E60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23DF14E60();
    v183 = COERCE_DOUBLE(sub_23DEC1518(*(uint64_t *)&v183, (unint64_t)v184, v186));
    sub_23DF15100();
    swift_bridgeObjectRelease();
    sub_23DEAC67C((uint64_t)v196);
    *(_WORD *)(v58 + 22) = 2080;
    v77 = v194;
    v78 = v195;
    __swift_project_boxed_opaque_existential_1(v193, v194);
    (*(void (**)(double *__return_ptr, uint64_t, uint64_t))(v78 + 24))(&v183, v77, v78);
    v79 = v185;
    v181 = v183;
    v182 = v184;
    swift_bridgeObjectRetain();
    sub_23DF14E60();
    v180 = v79;
    sub_23DF153C4();
    sub_23DF14E60();
    swift_bridgeObjectRelease();
    sub_23DF14E60();
    swift_bridgeObjectRelease();
    v183 = COERCE_DOUBLE(sub_23DEC1518(*(uint64_t *)&v181, (unint64_t)v182, v186));
    sub_23DF15100();
    swift_bridgeObjectRelease();
    sub_23DEAC67C((uint64_t)&v189);
    *(_WORD *)(v58 + 32) = 2048;
    v183 = CFAbsoluteTimeGetCurrent() - v188;
    sub_23DF15100();
    sub_23DEAC67C((uint64_t)v187);
    *(_WORD *)(v58 + 42) = 2112;
    v65 = (uint64_t)v176;
    v80 = v176;
    v81 = COERCE_DOUBLE(_swift_stdlib_bridgeErrorToNSError());
    v183 = v81;
    sub_23DF15100();
    v82 = v162;
    *(double *)v162 = v81;
    sub_23DEAC6A8((id)v65);
    sub_23DEAC6A8((id)v65);
    v83 = v164;
    _os_log_impl(&dword_23DE8B000, v164, (os_log_type_t)v161, "[%s]: [%s - %s]: Failed after %fs: %@.", (uint8_t *)v58, 0x34u);
    sub_23DF13E18(0, (unint64_t *)&qword_25432D9F0, 255, (uint64_t (*)(uint64_t))sub_23DEA8774, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    swift_arrayDestroy();
    MEMORY[0x242648490](v82, -1, -1);
    v84 = v163;
    swift_arrayDestroy();
    MEMORY[0x242648490](v84, -1, -1);
    MEMORY[0x242648490](v58, -1, -1);

    v66 = (_BYTE *)*((_QWORD *)v179 + 1);
    ((void (*)(_BYTE *, uint64_t))v66)(v165, v173);
    v5 = v172;
    v7 = v174;
  }
  else
  {
    v65 = (uint64_t)a3;
    swift_release_n();
    sub_23DEAC67C((uint64_t)v196);
    sub_23DEAC67C((uint64_t)&v189);
    sub_23DEAC67C((uint64_t)v187);
    sub_23DEAC6A8(a3);
    sub_23DEAC6A8(a3);

    v66 = *(_BYTE **)(v9 + 8);
    ((void (*)(_BYTE *, uint64_t))v66)(v53, v173);
  }
  v85 = v171;
  v86 = v5[10];
  v87 = v5[11];
  v88 = swift_getObjectType();
  sub_23DF0F2EC((uint64_t)(v178 + 8), v65, v88, (uint64_t)v87);
  if (v7 == 0.0)
  {
    *(double *)&v89 = 0.0;
  }
  else
  {
    v171 = v87;
    v179 = v66;
    *(double *)&v89 = 0.0;
    v183 = v7;
    v90 = *(id *)&v7;
    sub_23DE95524(0, (unint64_t *)&qword_25432DBB8);
    if (swift_dynamicCast())
    {

      v91 = v187[1];
      v166 = v187[0];
      v92 = v85;
      v93 = v167;
      v169(v168, v92);
      sub_23DEAC648((uint64_t)v178, (uint64_t)v196);
      swift_retain_n();
      swift_bridgeObjectRetain();
      v94 = sub_23DF14C68();
      v95 = sub_23DF15010();
      if (os_log_type_enabled(v94, v95))
      {
        v96 = swift_slowAlloc();
        v170 = COERCE_DOUBLE(swift_slowAlloc());
        v181 = v170;
        *(_DWORD *)v96 = 136315650;
        v174 = 0.0;
        sub_23DE902F4((uint64_t)v198, (uint64_t)&v189);
        __swift_project_boxed_opaque_existential_1(&v189, v192);
        swift_getDynamicType();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v189);
        v97 = sub_23DF154E4();
        v189 = sub_23DEC1518(v97, v98, (uint64_t *)&v181);
        sub_23DF15100();
        swift_bridgeObjectRelease();
        sub_23DEAC67C((uint64_t)v196);
        *(_WORD *)(v96 + 12) = 2080;
        v189 = v86;
        v190 = v171;
        sub_23DE95524(0, &qword_25432D868);
        swift_unknownObjectRetain();
        v99 = sub_23DF14E18();
        v189 = sub_23DEC1518(v99, v100, (uint64_t *)&v181);
        sub_23DF15100();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v96 + 22) = 2080;
        swift_bridgeObjectRetain();
        v189 = sub_23DEC1518(v166, v91, (uint64_t *)&v181);
        *(double *)&v89 = v174;
        sub_23DF15100();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23DE8B000, v94, v95, "Work item of type %s associated with a Planner (%s) that expects a %s", (uint8_t *)v96, 0x20u);
        v101 = v170;
        swift_arrayDestroy();
        MEMORY[0x242648490](*(_QWORD *)&v101, -1, -1);
        v102 = v96;
        v65 = (uint64_t)v176;
        MEMORY[0x242648490](v102, -1, -1);

      }
      else
      {
        sub_23DEAC67C((uint64_t)v196);
        swift_bridgeObjectRelease();
        swift_release_n();

        swift_bridgeObjectRelease();
      }
      ((void (*)(uint64_t, uint64_t))v179)(v93, v173);

    }
    else
    {

      v103 = v166;
      v169(v168, v85);
      sub_23DEAC648((uint64_t)v178, (uint64_t)v196);
      swift_retain_n();
      v104 = sub_23DF14C68();
      v105 = sub_23DF15010();
      if (os_log_type_enabled(v104, v105))
      {
        v106 = swift_slowAlloc();
        v107 = swift_slowAlloc();
        v187[0] = v107;
        *(_DWORD *)v106 = 136315394;
        v174 = 0.0;
        sub_23DE902F4((uint64_t)v198, (uint64_t)&v189);
        __swift_project_boxed_opaque_existential_1(&v189, v192);
        swift_getDynamicType();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v189);
        v108 = sub_23DF154E4();
        v189 = sub_23DEC1518(v108, v109, v187);
        sub_23DF15100();
        swift_bridgeObjectRelease();
        sub_23DEAC67C((uint64_t)v196);
        *(_WORD *)(v106 + 12) = 2080;
        v189 = v86;
        v190 = v171;
        sub_23DE95524(0, &qword_25432D868);
        swift_unknownObjectRetain();
        v110 = sub_23DF14E18();
        v189 = sub_23DEC1518(v110, v111, v187);
        *(double *)&v89 = v174;
        sub_23DF15100();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23DE8B000, v104, v105, "Caught an unexpected exception handling failure of work item of type %s associated with %s", (uint8_t *)v106, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x242648490](v107, -1, -1);
        v112 = v106;
        v65 = (uint64_t)v176;
        MEMORY[0x242648490](v112, -1, -1);
      }
      else
      {
        sub_23DEAC67C((uint64_t)v196);
        swift_release_n();
      }

      ((void (*)(uint64_t, uint64_t))v179)(v103, v173);
    }
  }
  v113 = v175;
  *(_BYTE *)(v175 + 24) = 1;
  v114 = *(_QWORD *)(v113 + 40);
  if (v114 >> 62)
  {
LABEL_49:
    swift_bridgeObjectRetain_n();
    v115 = sub_23DF15298();
    swift_bridgeObjectRelease();
    v174 = *(double *)&v89;
    if (v115)
      goto LABEL_37;
  }
  else
  {
    v115 = *(_QWORD *)((v114 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v174 = *(double *)&v89;
    if (v115)
    {
LABEL_37:
      v116 = *(_QWORD *)(v177 + 24);
      v117 = v114 & 0xC000000000000001;
      v65 = 4;
      while (1)
      {
        v123 = v65 - 4;
        if (v117)
        {
          *(double *)&v89 = COERCE_DOUBLE(MEMORY[0x242647BF0](v65 - 4, v114));
          v124 = v65 - 3;
          if (__OFADD__(v123, 1))
            goto LABEL_48;
        }
        else
        {
          v89 = *(uint64_t *)(v114 + 8 * v65);
          swift_retain();
          v124 = v65 - 3;
          if (__OFADD__(v123, 1))
          {
LABEL_48:
            __break(1u);
            goto LABEL_49;
          }
        }
        if (v116 < *(_QWORD *)(v89 + 24))
        {
          v179 = v160;
          v118 = v116;
          v119 = v115;
          v120 = v114;
          v121 = *(_QWORD *)(v89 + 16);
          v122 = (os_unfair_lock_s *)(v121 + 36);
          os_unfair_lock_lock((os_unfair_lock_t)(v121 + 36));
          *(_BYTE *)(v121 + 32) = 0;
          v114 = v120;
          v115 = v119;
          v116 = v118;
          os_unfair_lock_unlock(v122);
        }
        swift_release();
        ++v65;
        if (v124 == v115)
        {
          swift_bridgeObjectRelease();
          v65 = (uint64_t)v176;
          goto LABEL_51;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_51:
  sub_23DEAC6A8((id)v65);
LABEL_52:
  v125 = v178[11];
  v126 = v178[12];
  __swift_project_boxed_opaque_existential_1(v178 + 8, v125);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v126 + 24))(&v189, v125, v126);
  v128 = v189;
  v127 = (uint64_t)v190;
  v129 = v191;
  v130 = *(_QWORD *)(v177 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(v130 + 36));
  sub_23DF10614(v128, v127, v129, (uint64_t)v196);
  swift_bridgeObjectRelease();
  if (v65)
    *(_BYTE *)(v130 + 32) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(v130 + 36));
  swift_bridgeObjectRelease();
  os_unfair_lock_lock((os_unfair_lock_t)(v130 + 36));
  v131 = *(_QWORD *)(*(_QWORD *)(v130 + 24) + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)(v130 + 36));
  if (v131)
    return;
  os_unfair_lock_lock((os_unfair_lock_t)(v130 + 36));
  v132 = *(unsigned __int8 *)(v130 + 32);
  os_unfair_lock_unlock((os_unfair_lock_t)(v130 + 36));
  v133 = (unint64_t *)(v175 + 40);
  if (v132 != 1)
  {
    v149 = v177;
    swift_retain();
    v150 = sub_23DF13B00(v133, v149);
    swift_release();
    if (*v133 >> 62)
    {
      swift_bridgeObjectRetain();
      v151 = sub_23DF15298();
      swift_bridgeObjectRelease();
      if (v151 >= v150)
        goto LABEL_76;
    }
    else
    {
      v151 = *(_QWORD *)((*v133 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v151 >= v150)
      {
LABEL_76:
        sub_23DF08E5C(v150, v151);
        return;
      }
    }
    __break(1u);
    return;
  }
  v134 = *v133;
  if (*v133 >> 62)
    goto LABEL_81;
  v135 = *(_QWORD *)((v134 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v135)
  {
    while (1)
    {
      v136 = 0;
      while ((v134 & 0xC000000000000001) != 0)
      {
        v137 = MEMORY[0x242647BF0](0, v134);
LABEL_62:
        swift_bridgeObjectRelease();
        v138 = *(_QWORD *)(v137 + 16);
        v139 = (os_unfair_lock_s *)(v138 + 36);
        os_unfair_lock_lock((os_unfair_lock_t)(v138 + 36));
        v134 = *(_QWORD *)(*(_QWORD *)(v138 + 24) + 16);
        os_unfair_lock_unlock((os_unfair_lock_t)(v138 + 36));
        if (v134)
        {
          swift_release();
          if (!v136)
            return;
          goto LABEL_78;
        }
        os_unfair_lock_lock((os_unfair_lock_t)(v138 + 36));
        v140 = *(_QWORD *)(v138 + 16);
        swift_retain();
        os_unfair_lock_unlock(v139);
        swift_release();
        v141 = *v133;
        isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
        *v133 = v141;
        if (!isUniquelyReferenced_nonNull_bridgeObject
          || (v141 & 0x8000000000000000) != 0
          || (v141 & 0x4000000000000000) != 0)
        {
          sub_23DF07530(v141);
        }
        v143 = v141 & 0xFFFFFFFFFFFFFF8;
        v144 = *(_QWORD *)(v143 + 16);
        if (!v144)
          goto LABEL_80;
        v145 = v144 - 1;
        v146 = v143 + 32;
        memmove((void *)v146, (const void *)(v146 + 8), 8 * (v144 - 1));
        *(_QWORD *)(v146 - 16) = v145;
        sub_23DF14ED8();
        swift_release();
        swift_release();
        v134 = *v133;
        if (*v133 >> 62)
        {
          swift_bridgeObjectRetain_n();
          v148 = sub_23DF15298();
          swift_bridgeObjectRelease();
          v136 = v140;
          if (!v148)
          {
LABEL_73:
            swift_bridgeObjectRelease();
            v136 = v140;
LABEL_78:
            v152 = (_QWORD *)v175;
            swift_retain_n();
            swift_release();
            *v152 = v136;
            v153 = v172;
            v154 = v172[11];
            v155 = swift_getObjectType();
            v156 = v153[12];
            v157 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v154 + 56);
            v158 = swift_retain();
            v157(v158, v156, v155, v154);
            swift_release_n();
            return;
          }
        }
        else
        {
          v147 = *(_QWORD *)((v134 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          v136 = v140;
          if (!v147)
            goto LABEL_73;
        }
      }
      if (*(_QWORD *)((v134 & 0xFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_80:
      __break(1u);
LABEL_81:
      swift_bridgeObjectRetain_n();
      v159 = sub_23DF15298();
      swift_bridgeObjectRelease();
      if (!v159)
        goto LABEL_82;
    }
    v137 = *(_QWORD *)(v134 + 32);
    swift_retain();
    goto LABEL_62;
  }
LABEL_82:
  swift_bridgeObjectRelease();
}

uint64_t sub_23DF0F2EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t AssociatedTypeWitness;
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
  char v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27[5];

  v26 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = sub_23DF150F4();
  v9 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x24BDAC7A8](v8, v10);
  v13 = (char *)&v25 - v12;
  v14 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v11, v15);
  v17 = (char *)&v25 - v16;
  sub_23DE902F4(a1, (uint64_t)v27);
  sub_23DE95524(0, (unint64_t *)&qword_25432D878);
  v18 = swift_dynamicCast();
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  if ((v18 & 1) != 0)
  {
    v19(v13, 0, 1, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v17, v13, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(a4 + 48))(v17, v26, a3, a4);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v17, AssociatedTypeWitness);
  }
  else
  {
    v19(v13, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
    v27[0] = AssociatedTypeWitness;
    swift_getMetatypeMetadata();
    v21 = sub_23DF14E18();
    v23 = v22;
    sub_23DF13E70();
    swift_allocError();
    *v24 = v21;
    v24[1] = v23;
    return swift_willThrow();
  }
}

uint64_t sub_23DF0F4D4()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t WorkCriteriaRecord.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t WorkCriteriaRecord.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t WorkCriteriaRecord.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  swift_retain();
  WorkCriteria.description.getter();
  sub_23DF14E60();
  swift_release();
  swift_bridgeObjectRelease();
  sub_23DF14E60();
  v1 = *(_QWORD *)(v0 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_23DF14E60();
  swift_bridgeObjectRelease();
  sub_23DF14E60();
  if (!v1)
    swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  sub_23DF14E60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23DF14E60();
  sub_23DF14E60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23DF14E60();
  return 60;
}

uint64_t sub_23DF0F770()
{
  return WorkCriteriaRecord.description.getter();
}

_QWORD *sub_23DF0F790(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      sub_23DEABD84(0, (unint64_t *)&qword_25432DBA8, MEMORY[0x24BEE4AD0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 25;
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_23DF10F28((unint64_t)(v3 + 4), v2, v1, (uint64_t (*)(uint64_t))type metadata accessor for DebugSnapshot, (unint64_t *)&qword_256D0E3C0, &qword_256D100B0, (uint64_t (*)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))sub_23DE9A434);
    v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v2 = sub_23DF15298();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_23DF0F8BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  size_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  sub_23DEABD84(0, &qword_25432DB28, (uint64_t)&type metadata for Orchestrator.InputSignalRecord, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v3 = swift_allocObject();
  v4 = _swift_stdlib_malloc_size((const void *)v3);
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = 2 * ((uint64_t)(v4 - 32) / 48);
  v5 = sub_23DF116E8((uint64_t)&v7, (_OWORD *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_23DEA8AD4();
  if (v5 != v1)
  {
    __break(1u);
    return MEMORY[0x24BEE4AF8];
  }
  return v3;
}

_QWORD *sub_23DF0F9C8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  sub_23DEABD84(0, &qword_256D0EC60, (uint64_t)&type metadata for ScopedExecutorIdentifier, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 48);
  v5 = sub_23DF11B04(&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_23DEA8AD4();
  if (v5 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

_QWORD *sub_23DF0FAD0(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      sub_23DEABD84(0, (unint64_t *)&qword_25432DBA8, MEMORY[0x24BEE4AD0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 25;
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_23DF11150((unint64_t)(v3 + 4), v2, v1);
    v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v2 = sub_23DF15298();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

_QWORD *sub_23DF0FBDC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  sub_23DEABD84(0, &qword_25432E338, (uint64_t)&type metadata for InputSignalIdentifier, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 1;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 5);
  v6 = sub_23DF118EC((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_23DEA8AD4();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

_QWORD *sub_23DF0FCD4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  sub_23DECE884(0, &qword_25432DB60, (unint64_t *)&qword_25432D878, (uint64_t)&protocol descriptor for WorkPlan, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 40);
  v5 = sub_23DF11D38((uint64_t)&v7, (uint64_t)(v3 + 4), v1, a1);
  swift_bridgeObjectRetain();
  sub_23DEA8AD4();
  if (v5 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_23DF0FDE0(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17[2];

  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return result;
  v2 = result;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v14 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      v8 = v14 + 1;
      if (v14 + 1 >= v7)
        return swift_release();
      v15 = *(_QWORD *)(v3 + 8 * v8);
      if (!v15)
      {
        v8 = v14 + 2;
        if (v14 + 2 >= v7)
          return swift_release();
        v15 = *(_QWORD *)(v3 + 8 * v8);
        if (!v15)
        {
          v8 = v14 + 3;
          if (v14 + 3 >= v7)
            return swift_release();
          v15 = *(_QWORD *)(v3 + 8 * v8);
          if (!v15)
            break;
        }
      }
    }
LABEL_23:
    v6 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    v11 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 32 * v10);
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23DF10450(v12, v13, (uint64_t)v17);
    sub_23DF13EB4(v17[0], v17[1]);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v7)
    return swift_release();
  v15 = *(_QWORD *)(v3 + 8 * v16);
  if (v15)
  {
    v8 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v8 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v8 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v8);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_23DF0FFAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  BOOL v23;
  uint64_t v24;
  _QWORD *v25;
  BOOL v26;
  uint64_t isStackAllocationSafe;
  uint64_t v28;
  char v29;
  unint64_t v30;
  size_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  unint64_t v44;
  uint64_t v45;

  v2 = a2;
  v45 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a2 + 16))
  {
    v4 = *(_QWORD *)(a1 + 56);
    v38 = a1 + 56;
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v36 = ~v5;
    if (-v5 < 64)
      v6 = ~(-1 << -(char)v5);
    else
      v6 = -1;
    v7 = v6 & v4;
    v37 = (unint64_t)(63 - v5) >> 6;
    v8 = a2 + 56;
    swift_bridgeObjectRetain();
    v39 = 0;
    while (1)
    {
      if (v7)
      {
        v9 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v10 = v9 | (v39 << 6);
      }
      else
      {
        v11 = v39 + 1;
        if (__OFADD__(v39, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v11 >= v37)
          goto LABEL_47;
        v12 = *(_QWORD *)(v38 + 8 * v11);
        v13 = v39 + 1;
        if (!v12)
        {
          v13 = v39 + 2;
          if (v39 + 2 >= v37)
            goto LABEL_47;
          v12 = *(_QWORD *)(v38 + 8 * v13);
          if (!v12)
          {
            v13 = v39 + 3;
            if (v39 + 3 >= v37)
              goto LABEL_47;
            v12 = *(_QWORD *)(v38 + 8 * v13);
            if (!v12)
            {
              v13 = v39 + 4;
              if (v39 + 4 >= v37)
                goto LABEL_47;
              v12 = *(_QWORD *)(v38 + 8 * v13);
              if (!v12)
              {
                v14 = v39 + 5;
                if (v39 + 5 >= v37)
                {
LABEL_47:
                  sub_23DEA8AD4();
                  return v2;
                }
                v12 = *(_QWORD *)(v38 + 8 * v14);
                if (!v12)
                {
                  while (1)
                  {
                    v13 = v14 + 1;
                    if (__OFADD__(v14, 1))
                      break;
                    if (v13 >= v37)
                      goto LABEL_47;
                    v12 = *(_QWORD *)(v38 + 8 * v13);
                    ++v14;
                    if (v12)
                      goto LABEL_24;
                  }
LABEL_49:
                  __break(1u);
                }
                v13 = v39 + 5;
              }
            }
          }
        }
LABEL_24:
        v7 = (v12 - 1) & v12;
        v10 = __clz(__rbit64(v12)) + (v13 << 6);
        v39 = v13;
      }
      v15 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 32 * v10);
      v17 = *v15;
      v16 = v15[1];
      sub_23DF15478();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      sub_23DF14E3C();
      swift_bridgeObjectRelease();
      v18 = sub_23DF154A8();
      v19 = -1 << *(_BYTE *)(v2 + 32);
      v20 = v18 & ~v19;
      if (((*(_QWORD *)(v8 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) != 0)
        break;
LABEL_6:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    v21 = *(_QWORD *)(v2 + 48);
    v22 = (_QWORD *)(v21 + 32 * v20);
    v23 = *v22 == v17 && v22[1] == v16;
    if (v23 || (sub_23DF15400() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      isStackAllocationSafe = swift_bridgeObjectRelease();
      v40 = a1;
      v41 = v38;
      v42 = v36;
      v43 = v39;
      v44 = v7;
    }
    else
    {
      v24 = ~v19;
      do
      {
        v20 = (v20 + 1) & v24;
        if (((*(_QWORD *)(v8 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
          goto LABEL_6;
        v25 = (_QWORD *)(v21 + 32 * v20);
        v26 = *v25 == v17 && v25[1] == v16;
      }
      while (!v26 && (sub_23DF15400() & 1) == 0);
      v40 = a1;
      v41 = v38;
      v42 = v36;
      v43 = v39;
      v44 = v7;
      swift_bridgeObjectRelease();
      isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    v29 = *(_BYTE *)(v2 + 32);
    v30 = (unint64_t)((1 << v29) + 63) >> 6;
    v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
    {
      MEMORY[0x24BDAC7A8](isStackAllocationSafe, v28);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      v32 = sub_23DF107E0((uint64_t)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), v30, v2, v20, &v40);
      swift_release();
      sub_23DEA8AD4();
    }
    else
    {
      v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      v32 = sub_23DF107E0((uint64_t)v33, v30, v2, v20, &v40);
      swift_release();
      sub_23DEA8AD4();
      MEMORY[0x242648490](v33, -1, -1);
    }
    return v32;
  }
  else
  {
    swift_release();
    return MEMORY[0x24BEE4B08];
  }
}

double sub_23DF10450@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double result;
  uint64_t v19;
  _QWORD *v20;
  BOOL v21;
  uint64_t v22;

  v7 = *v3;
  sub_23DF15478();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23DF14E3C();
  swift_bridgeObjectRelease();
  v8 = sub_23DF154A8();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return result;
  }
  v11 = *(_QWORD *)(v7 + 48);
  v12 = (_QWORD *)(v11 + 32 * v10);
  v13 = *v12 == a1 && v12[1] == a2;
  if (!v13 && (sub_23DF15400() & 1) == 0)
  {
    v19 = ~v9;
    do
    {
      v10 = (v10 + 1) & v19;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        goto LABEL_18;
      v20 = (_QWORD *)(v11 + 32 * v10);
      v21 = *v20 == a1 && v20[1] == a2;
    }
    while (!v21 && (sub_23DF15400() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v15 = *v3;
  v22 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_23DEE93B4();
    v15 = v22;
  }
  v16 = *(_QWORD *)(v15 + 48) + 32 * v10;
  v17 = *(_QWORD *)(v16 + 8);
  *(_QWORD *)a3 = *(_QWORD *)v16;
  *(_QWORD *)(a3 + 8) = v17;
  *(_OWORD *)(a3 + 16) = *(_OWORD *)(v16 + 16);
  sub_23DF10B0C(v10);
  *v3 = v22;
  swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_23DF10614@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v25;

  v8 = *v4;
  sub_23DF15478();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23DF14E3C();
  swift_bridgeObjectRelease();
  sub_23DF15484();
  v9 = sub_23DF154A8();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  v11 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0)
  {
    v12 = ~v10;
    v13 = *(_QWORD *)(v8 + 48);
    while (1)
    {
      v14 = (_QWORD *)(v13 + 24 * v11);
      v15 = v14[2];
      v16 = *v14 == a1 && v14[1] == a2;
      if ((v16 || (sub_23DF15400() & 1) != 0) && v15 == a3)
        break;
      v11 = (v11 + 1) & v12;
      if (((*(_QWORD *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
        goto LABEL_11;
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v19 = *v23;
    v25 = *v23;
    *v23 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_23DEE97C0();
      v19 = v25;
    }
    v20 = *(_QWORD *)(v19 + 48) + 24 * v11;
    v21 = *(_OWORD *)v20;
    v22 = *(_QWORD *)(v20 + 16);
    *(_OWORD *)a4 = v21;
    *(_QWORD *)(a4 + 16) = v22;
    sub_23DF10CF8(v11);
    *v23 = v25;
    return swift_bridgeObjectRelease();
  }
  else
  {
LABEL_11:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    *(_QWORD *)(a4 + 16) = 0;
  }
  return result;
}

uint64_t sub_23DF107E0(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  BOOL v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t i;
  unint64_t v32;
  _QWORD *v33;
  BOOL v34;
  int64_t v35;
  uint64_t v37;
  unint64_t *v38;
  uint64_t v40;

  v6 = *(_QWORD *)(a3 + 16);
  v38 = (unint64_t *)result;
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v7 = v6 - 1;
  v40 = a3 + 56;
  while (2)
  {
    v37 = v7;
    do
    {
      while (1)
      {
        v8 = a5[3];
        v9 = a5[4];
        if (v9)
        {
          v10 = (v9 - 1) & v9;
          v11 = __clz(__rbit64(v9)) | (v8 << 6);
          goto LABEL_16;
        }
        v12 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
          __break(1u);
          goto LABEL_47;
        }
        v13 = (unint64_t)(a5[2] + 64) >> 6;
        v14 = a5[3];
        if (v12 >= v13)
          goto LABEL_45;
        v15 = a5[1];
        v16 = *(_QWORD *)(v15 + 8 * v12);
        if (!v16)
        {
          v17 = v8 + 2;
          v14 = v8 + 1;
          if (v8 + 2 >= v13)
            goto LABEL_45;
          v16 = *(_QWORD *)(v15 + 8 * v17);
          if (!v16)
          {
            v14 = v8 + 2;
            if (v8 + 3 >= v13)
              goto LABEL_45;
            v16 = *(_QWORD *)(v15 + 8 * (v8 + 3));
            if (v16)
            {
              v12 = v8 + 3;
              goto LABEL_15;
            }
            v17 = v8 + 4;
            v14 = v8 + 3;
            if (v8 + 4 >= v13)
              goto LABEL_45;
            v16 = *(_QWORD *)(v15 + 8 * v17);
            if (!v16)
            {
              v12 = v8 + 5;
              v14 = v8 + 4;
              if (v8 + 5 >= v13)
                goto LABEL_45;
              v16 = *(_QWORD *)(v15 + 8 * v12);
              if (!v16)
              {
                v14 = v13 - 1;
                v35 = v8 + 6;
                while (v13 != v35)
                {
                  v16 = *(_QWORD *)(v15 + 8 * v35++);
                  if (v16)
                  {
                    v12 = v35 - 1;
                    goto LABEL_15;
                  }
                }
LABEL_45:
                a5[3] = v14;
                a5[4] = 0;
                swift_retain();
                return sub_23DECC31C(v38, a2, v37, a3);
              }
              goto LABEL_15;
            }
          }
          v12 = v17;
        }
LABEL_15:
        v10 = (v16 - 1) & v16;
        v11 = __clz(__rbit64(v16)) + (v12 << 6);
        v8 = v12;
LABEL_16:
        v18 = (uint64_t *)(*(_QWORD *)(*a5 + 48) + 32 * v11);
        v19 = *v18;
        v20 = v18[1];
        a5[3] = v8;
        a5[4] = v10;
        sub_23DF15478();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        sub_23DF14E3C();
        swift_bridgeObjectRelease();
        v21 = sub_23DF154A8();
        v22 = -1 << *(_BYTE *)(a3 + 32);
        v23 = v21 & ~v22;
        v24 = v23 >> 6;
        v25 = 1 << v23;
        if (((1 << v23) & *(_QWORD *)(v40 + 8 * (v23 >> 6))) == 0)
          goto LABEL_3;
        v26 = *(_QWORD *)(a3 + 48);
        v27 = (_QWORD *)(v26 + 32 * v23);
        v28 = *v27 == v19 && v27[1] == v20;
        if (v28 || (sub_23DF15400() & 1) != 0)
          break;
        v30 = ~v22;
        for (i = v23 + 1; ; i = v32 + 1)
        {
          v32 = i & v30;
          if (((*(_QWORD *)(v40 + (((i & v30) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v30)) & 1) == 0)
            break;
          v33 = (_QWORD *)(v26 + 32 * v32);
          v34 = *v33 == v19 && v33[1] == v20;
          if (v34 || (sub_23DF15400() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            result = swift_bridgeObjectRelease();
            v24 = v32 >> 6;
            v25 = 1 << v32;
            goto LABEL_23;
          }
        }
LABEL_3:
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
LABEL_23:
      v29 = v38[v24];
      v38[v24] = v29 & ~v25;
    }
    while ((v25 & v29) == 0);
    v7 = v37 - 1;
    if (__OFSUB__(v37, 1))
    {
LABEL_47:
      __break(1u);
      return result;
    }
    if (v37 != 1)
      continue;
    return MEMORY[0x24BEE4B08];
  }
}

unint64_t sub_23DF10B0C(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_23DF15154();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_23DF15478();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        sub_23DF14E3C();
        swift_bridgeObjectRelease();
        v11 = sub_23DF154A8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v12 = v11 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 < v9)
            goto LABEL_5;
        }
        else if (v12 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v12)
        {
LABEL_11:
          v13 = *(_QWORD *)(v3 + 48);
          v14 = (_OWORD *)(v13 + 32 * v2);
          v15 = (_OWORD *)(v13 + 32 * v6);
          if (v2 != v6 || (v2 = v6, v14 >= v15 + 2))
          {
            v10 = v15[1];
            *v14 = *v15;
            v14[1] = v10;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v16 = *(_QWORD *)(v3 + 16);
  v17 = __OFSUB__(v16, 1);
  v18 = v16 - 1;
  if (v17)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v18;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

unint64_t sub_23DF10CF8(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  __int128 *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_23DF15154();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_23DF15478();
        swift_bridgeObjectRetain();
        sub_23DF14E3C();
        sub_23DF15484();
        v11 = sub_23DF154A8();
        swift_bridgeObjectRelease();
        v12 = v11 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 < v9)
            goto LABEL_5;
        }
        else if (v12 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v12)
        {
LABEL_11:
          v13 = *(_QWORD *)(v3 + 48);
          v14 = v13 + 24 * v2;
          v15 = (__int128 *)(v13 + 24 * v6);
          if (v2 != v6 || (v2 = v6, v14 >= (unint64_t)v15 + 24))
          {
            v10 = *v15;
            *(_QWORD *)(v14 + 16) = *((_QWORD *)v15 + 2);
            *(_OWORD *)v14 = v10;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v16 = *(_QWORD *)(v3 + 16);
  v17 = __OFSUB__(v16, 1);
  v18 = v16 - 1;
  if (v17)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v18;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_23DF10EE0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_23DF10F28(a1, a2, a3, (uint64_t (*)(uint64_t))type metadata accessor for WorkCriteria, &qword_256D100C8, &qword_256D100D0, (uint64_t (*)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))sub_23DE9A434);
}

uint64_t sub_23DF10F04(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_23DF10F28(a1, a2, a3, (uint64_t (*)(uint64_t))type metadata accessor for Orchestrator, &qword_256D100B8, &qword_256D100C0, (uint64_t (*)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))sub_23DE9A3E0);
}

uint64_t sub_23DF10F28(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(uint64_t), unint64_t *a5, unint64_t *a6, uint64_t (*a7)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void (*v23)(_BYTE *, _QWORD);
  uint64_t *v24;
  uint64_t v25;
  uint64_t result;
  _BYTE v27[32];

  v14 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v15 = sub_23DF15298();
    swift_bridgeObjectRelease();
    if (!v15)
      return a3;
  }
  else
  {
    v15 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v15)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v16 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v14)
  {
    swift_bridgeObjectRetain();
    v18 = sub_23DF15298();
    swift_bridgeObjectRelease();
    if (v18 <= a2)
    {
      if (v15 >= 1)
      {
        sub_23DF13E18(0, a5, 255, a4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
        v20 = v19;
        v21 = sub_23DF13F2C(a6, a5, 255, a4);
        swift_bridgeObjectRetain();
        for (i = 0; i != v15; ++i)
        {
          v23 = (void (*)(_BYTE *, _QWORD))a7(v27, i, a3, v20, v21);
          v25 = *v24;
          swift_retain();
          v23(v27, 0);
          *(_QWORD *)(a1 + 8 * i) = v25;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v17 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v17 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v16 + 32 >= a1 + 8 * v17 || v16 + 32 + 8 * v17 <= a1)
  {
    a4(0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_23DF152D4();
  __break(1u);
  return result;
}

uint64_t sub_23DF11150(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t i;
  uint64_t (*v14)();
  uint64_t *v15;
  uint64_t v16;
  uint64_t result;
  uint64_t (*v18[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_23DF15298();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_23DF15298();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_23DF13E18(0, (unint64_t *)&unk_25432D8D0, v11, (uint64_t (*)(uint64_t))type metadata accessor for WorkCriteriaRecord, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
        sub_23DF13F2C(qword_256D100D8, (unint64_t *)&unk_25432D8D0, v12, (uint64_t (*)(uint64_t))type metadata accessor for WorkCriteriaRecord);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          v14 = sub_23DE9A434(v18, i, a3);
          v16 = *v15;
          swift_retain();
          ((void (*)(uint64_t (**)(), _QWORD))v14)(v18, 0);
          *(_QWORD *)(a1 + 8 * i) = v16;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for WorkCriteriaRecord();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_23DF152D4();
  __break(1u);
  return result;
}

uint64_t sub_23DF11370(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;

  sub_23DF13E18(0, &qword_256D0E858, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&v35 - v10;
  v12 = sub_23DF14BA8();
  v43 = *(_QWORD *)(v12 - 8);
  result = MEMORY[0x24BDAC7A8](v12, v13);
  v42 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = a4;
  v17 = a4 + 56;
  v16 = *(_QWORD *)(a4 + 56);
  v18 = -1 << *(_BYTE *)(a4 + 32);
  v37 = a1;
  v38 = v18;
  v19 = -v18;
  if (v19 < 64)
    v20 = ~(-1 << v19);
  else
    v20 = -1;
  v21 = v20 & v16;
  if (!a2)
  {
    v22 = 0;
    v23 = 0;
LABEL_39:
    v33 = v37;
    v34 = ~v38;
    *v37 = v44;
    v33[1] = v17;
    v33[2] = v34;
    v33[3] = v22;
    v33[4] = v21;
    return v23;
  }
  if (!a3)
  {
    v22 = 0;
    v23 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v22 = 0;
  v23 = 0;
  v39 = a4 + 56;
  v40 = (unint64_t)(63 - v38) >> 6;
  v36 = v40 - 1;
  v41 = a3;
  v24 = v42;
  v25 = v43;
  if (!v21)
    goto LABEL_9;
LABEL_8:
  v26 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  v27 = v26 | (v22 << 6);
  while (1)
  {
    v31 = *(_QWORD *)(v25 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v25 + 16))(v11, *(_QWORD *)(v44 + 48) + v31 * v27, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v11, 0, 1, v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v11, 1, v12) == 1)
    {
      v17 = v39;
      goto LABEL_38;
    }
    ++v23;
    v32 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
    v32(v24, v11, v12);
    result = ((uint64_t (*)(uint64_t, char *, uint64_t))v32)(a2, v24, v12);
    if (v23 == v41)
    {
      v23 = v41;
      v17 = v39;
      goto LABEL_39;
    }
    a2 += v31;
    v25 = v43;
    if (v21)
      goto LABEL_8;
LABEL_9:
    v28 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    v17 = v39;
    if (v28 >= v40)
      goto LABEL_37;
    v29 = *(_QWORD *)(v39 + 8 * v28);
    if (!v29)
    {
      v30 = v22 + 2;
      ++v22;
      if (v28 + 1 >= v40)
        goto LABEL_37;
      v29 = *(_QWORD *)(v39 + 8 * v30);
      if (v29)
        goto LABEL_14;
      v22 = v28 + 1;
      if (v28 + 2 >= v40)
        goto LABEL_37;
      v29 = *(_QWORD *)(v39 + 8 * (v28 + 2));
      if (v29)
      {
        v28 += 2;
      }
      else
      {
        v22 = v28 + 2;
        if (v28 + 3 >= v40)
          goto LABEL_37;
        v29 = *(_QWORD *)(v39 + 8 * (v28 + 3));
        if (!v29)
        {
          v30 = v28 + 4;
          v22 = v28 + 3;
          if (v28 + 4 < v40)
          {
            v29 = *(_QWORD *)(v39 + 8 * v30);
            if (!v29)
            {
              while (1)
              {
                v28 = v30 + 1;
                if (__OFADD__(v30, 1))
                  goto LABEL_42;
                if (v28 >= v40)
                {
                  v22 = v36;
                  goto LABEL_37;
                }
                v29 = *(_QWORD *)(v39 + 8 * v28);
                ++v30;
                if (v29)
                  goto LABEL_21;
              }
            }
LABEL_14:
            v28 = v30;
            goto LABEL_21;
          }
LABEL_37:
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56))(v11, 1, 1, v12);
          v21 = 0;
LABEL_38:
          sub_23DF13EE4((uint64_t)v11, (uint64_t)&qword_256D0E858, 255, (uint64_t)MEMORY[0x24BDCDAC0], (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))sub_23DF13E18);
          goto LABEL_39;
        }
        v28 += 3;
      }
    }
LABEL_21:
    v21 = (v29 - 1) & v29;
    v27 = __clz(__rbit64(v29)) + (v28 << 6);
    v22 = v28;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_23DF116E8(uint64_t result, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _OWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  __int128 v17;
  __int128 v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  _OWORD v23[3];

  v5 = (_QWORD *)result;
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
    v13 = 0;
LABEL_36:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v13;
  }
  if (!a3)
  {
    v12 = 0;
    v13 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  v22 = -1 << *(_BYTE *)(a4 + 32);
  while (v9)
  {
    v15 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    v16 = v15 | (v12 << 6);
LABEL_9:
    ++v13;
    result = sub_23DECD914(*(_QWORD *)(a4 + 56) + 48 * v16, (uint64_t)v23);
    v18 = v23[1];
    v17 = v23[2];
    *v11 = v23[0];
    v11[1] = v18;
    v11[2] = v17;
    v11 += 3;
    if (v13 == a3)
    {
      v13 = a3;
LABEL_35:
      v7 = v22;
      goto LABEL_36;
    }
  }
  v19 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v19 >= v14)
    goto LABEL_34;
  v20 = *(_QWORD *)(v6 + 8 * v19);
  if (v20)
    goto LABEL_23;
  v21 = v12 + 2;
  ++v12;
  if (v19 + 1 >= v14)
    goto LABEL_34;
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
    goto LABEL_16;
  v12 = v19 + 1;
  if (v19 + 2 >= v14)
    goto LABEL_34;
  v20 = *(_QWORD *)(v6 + 8 * (v19 + 2));
  if (v20)
  {
    v19 += 2;
    goto LABEL_23;
  }
  v12 = v19 + 2;
  if (v19 + 3 >= v14)
    goto LABEL_34;
  v20 = *(_QWORD *)(v6 + 8 * (v19 + 3));
  if (v20)
  {
    v19 += 3;
    goto LABEL_23;
  }
  v21 = v19 + 4;
  v12 = v19 + 3;
  if (v19 + 4 >= v14)
  {
LABEL_34:
    v9 = 0;
    goto LABEL_35;
  }
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
LABEL_16:
    v19 = v21;
LABEL_23:
    v9 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v19 << 6);
    v12 = v19;
    goto LABEL_9;
  }
  while (1)
  {
    v19 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v19 >= v14)
    {
      v12 = v14 - 1;
      goto LABEL_34;
    }
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v21;
    if (v20)
      goto LABEL_23;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_23DF118EC(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_39:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  v24 = -1 << *(_BYTE *)(a4 + 32);
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 32 * v16);
    v21 = v20[1];
    v23 = v20[2];
    v22 = v20[3];
    *v11 = *v20;
    v11[1] = v21;
    v11[2] = v23;
    v11[3] = v22;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 4;
    swift_bridgeObjectRetain();
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        v9 = 0;
        v12 = v17;
      }
      else
      {
        v18 = *(_QWORD *)(v6 + 8 * v12);
        if (v18)
          goto LABEL_14;
        v19 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_33;
        v18 = *(_QWORD *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          v17 = v19;
          goto LABEL_18;
        }
        v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
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
            goto LABEL_37;
          }
          v18 = *(_QWORD *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              v17 = v19 + 1;
              if (__OFADD__(v19, 1))
                goto LABEL_42;
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
          }
          goto LABEL_17;
        }
        v9 = 0;
        v12 = v17 + 2;
      }
LABEL_37:
      v10 = v13;
LABEL_38:
      v7 = v24;
      goto LABEL_39;
    }
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

_QWORD *sub_23DF11B04(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;

  v5 = a4 + 64;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v7 = ~(-1 << -(char)v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v11 = 0;
    v9 = 0;
LABEL_39:
    *result = a4;
    result[1] = v5;
    result[2] = ~v6;
    result[3] = v11;
    result[4] = v8;
    return (_QWORD *)v9;
  }
  v9 = a3;
  if (!a3)
  {
    v11 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v10 = a2;
  v25 = -1 << *(_BYTE *)(a4 + 32);
  v26 = result;
  v11 = 0;
  v12 = 0;
  v13 = (unint64_t)(63 - v6) >> 6;
  if (!v8)
    goto LABEL_9;
LABEL_8:
  v14 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  v15 = v14 | (v11 << 6);
  while (1)
  {
    ++v12;
    v19 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 48 * v15);
    v20 = v19[1];
    v21 = v19[2];
    v22 = v19[3];
    v24 = v19[4];
    v23 = v19[5];
    *v10 = *v19;
    v10[1] = v20;
    v10[2] = v21;
    v10[3] = v22;
    v10[4] = v24;
    v10[5] = v23;
    if (v12 == v9)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v10 += 6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (_QWORD *)swift_bridgeObjectRetain();
    if (v8)
      goto LABEL_8;
LABEL_9:
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v16 >= v13)
      goto LABEL_33;
    v17 = *(_QWORD *)(v5 + 8 * v16);
    if (!v17)
    {
      v11 += 2;
      if (v16 + 1 >= v13)
      {
        v8 = 0;
        v11 = v16;
      }
      else
      {
        v17 = *(_QWORD *)(v5 + 8 * v11);
        if (v17)
          goto LABEL_14;
        v18 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_33;
        v17 = *(_QWORD *)(v5 + 8 * v18);
        if (v17)
        {
LABEL_17:
          v16 = v18;
          goto LABEL_18;
        }
        v11 = v16 + 3;
        if (v16 + 3 < v13)
        {
          v17 = *(_QWORD *)(v5 + 8 * v11);
          if (v17)
          {
LABEL_14:
            v16 = v11;
            goto LABEL_18;
          }
          v18 = v16 + 4;
          if (v16 + 4 >= v13)
          {
LABEL_33:
            v8 = 0;
            goto LABEL_37;
          }
          v17 = *(_QWORD *)(v5 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              v16 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_42;
              if (v16 >= v13)
              {
                v8 = 0;
                v11 = v13 - 1;
                goto LABEL_37;
              }
              v17 = *(_QWORD *)(v5 + 8 * v16);
              ++v18;
              if (v17)
                goto LABEL_18;
            }
          }
          goto LABEL_17;
        }
        v8 = 0;
        v11 = v16 + 2;
      }
LABEL_37:
      v9 = v12;
LABEL_38:
      v6 = v25;
      result = v26;
      goto LABEL_39;
    }
LABEL_18:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v16 << 6);
    v11 = v16;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_23DF11D38(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  __int128 v21[2];
  __int128 v22[2];

  v5 = (_QWORD *)result;
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
    v13 = 0;
LABEL_36:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v13;
  }
  if (!a3)
  {
    v12 = 0;
    v13 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  v20 = -1 << *(_BYTE *)(a4 + 32);
  while (v9)
  {
    v15 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    v16 = v15 | (v12 << 6);
LABEL_9:
    ++v13;
    sub_23DE902F4(*(_QWORD *)(a4 + 56) + 40 * v16, (uint64_t)v21);
    sub_23DE902DC(v21, (uint64_t)v22);
    result = sub_23DE902DC(v22, v11);
    v11 += 40;
    if (v13 == a3)
    {
      v13 = a3;
LABEL_35:
      v7 = v20;
      goto LABEL_36;
    }
  }
  v17 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v17 >= v14)
    goto LABEL_34;
  v18 = *(_QWORD *)(v6 + 8 * v17);
  if (v18)
    goto LABEL_23;
  v19 = v12 + 2;
  ++v12;
  if (v17 + 1 >= v14)
    goto LABEL_34;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_16;
  v12 = v17 + 1;
  if (v17 + 2 >= v14)
    goto LABEL_34;
  v18 = *(_QWORD *)(v6 + 8 * (v17 + 2));
  if (v18)
  {
    v17 += 2;
    goto LABEL_23;
  }
  v12 = v17 + 2;
  if (v17 + 3 >= v14)
    goto LABEL_34;
  v18 = *(_QWORD *)(v6 + 8 * (v17 + 3));
  if (v18)
  {
    v17 += 3;
    goto LABEL_23;
  }
  v19 = v17 + 4;
  v12 = v17 + 3;
  if (v17 + 4 >= v14)
  {
LABEL_34:
    v9 = 0;
    goto LABEL_35;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_16:
    v17 = v19;
LABEL_23:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
    goto LABEL_9;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v12 = v14 - 1;
      goto LABEL_34;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_23;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_23DF11F44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v5;
  unsigned int v6;
  unint64_t v7;
  size_t v8;
  uint64_t isStackAllocationSafe;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v7 = (unint64_t)((1 << v5) + 63) >> 6;
  v8 = 8 * v7;
  isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe, v10);
    bzero((char *)v14 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain();
    v11 = sub_23DECDC40((uint64_t)v14 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, a1, a2);
    swift_bridgeObjectRelease();
    if (v2)
      swift_willThrow();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v12 = (void *)swift_slowAlloc();
    bzero(v12, v8);
    swift_bridgeObjectRetain();
    v11 = sub_23DECDC40((uint64_t)v12, v7, a1, a2);
    swift_bridgeObjectRelease();
    MEMORY[0x242648490](v12, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v11;
}

uint64_t sub_23DF120F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  uint64_t v22;

  v2 = *(_QWORD *)(a2 + 56);
  v3 = *(_QWORD *)(v2 + 16);
  v4 = MEMORY[0x24BEE4AF8];
  if (v3)
  {
    v22 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_23DEAA400(0, v3, 0);
    v5 = v2 + 32;
    v4 = v22;
    do
    {
      sub_23DE902F4(v5, (uint64_t)v18);
      v6 = v19;
      v7 = v20;
      __swift_project_boxed_opaque_existential_1(v18, v19);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v7 + 16))(v21, v6, v7);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
      v8 = v21[0];
      v9 = v21[1];
      v10 = v21[2];
      v11 = v21[3];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23DEAA400(0, *(_QWORD *)(v4 + 16) + 1, 1);
        v4 = v22;
      }
      v13 = *(_QWORD *)(v4 + 16);
      v12 = *(_QWORD *)(v4 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_23DEAA400(v12 > 1, v13 + 1, 1);
        v4 = v22;
      }
      *(_QWORD *)(v4 + 16) = v13 + 1;
      v14 = (_QWORD *)(v4 + 32 * v13);
      v14[4] = v8;
      v14[5] = v9;
      v14[6] = v10;
      v14[7] = v11;
      v5 += 40;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  v15 = swift_bridgeObjectRetain();
  v16 = sub_23DF11F44(v15, v4);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  type metadata accessor for InputSignalAnchorSet();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v16;
  return result;
}

uint64_t sub_23DF122AC(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
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
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t result;
  int64_t v45;
  __int128 v46;
  unint64_t v47;
  unint64_t i;
  int64_t v49;
  unint64_t v50;
  int64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t ObjectType;
  NSObject *v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD v81[2];
  __int128 v82;
  unint64_t *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  int64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95[2];
  unint64_t v96;
  uint64_t v97;
  _BYTE v98[40];
  _QWORD v99[3];
  uint64_t v100;
  uint64_t v101;
  uint64_t v102[5];
  __int128 v103;
  uint64_t v104;
  uint64_t v105;

  v7 = v6;
  v93 = sub_23DF14C80();
  v92 = *(_QWORD *)(v93 - 8);
  v15 = MEMORY[0x24BDAC7A8](v93, v14);
  v17 = (char *)v81 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15, v18);
  v20 = (char *)v81 - v19;
  v21 = *a3;
  v22 = *((_QWORD *)a3 + 2);
  v23 = *((_QWORD *)a3 + 3);
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  *(_OWORD *)(v7 + 32) = v21;
  *(_QWORD *)(v7 + 48) = v22;
  *(_QWORD *)(v7 + 56) = v23;
  *(_OWORD *)(v7 + 64) = a3[2];
  *(_QWORD *)(v7 + 80) = a4;
  *(_QWORD *)(v7 + 88) = a5;
  *(_QWORD *)(v7 + 96) = a6;
  v24 = *(_QWORD *)(a6 + 56);
  v25 = *(_QWORD *)(v24 + 16);
  v85 = v17;
  if (v25)
  {
    v91 = (char *)v81 - v19;
    v90 = v7;
    v99[0] = MEMORY[0x24BEE4AF8];
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    v89 = a6;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_23DEAA400(0, v25, 0);
    v88 = v24;
    v26 = v24 + 32;
    v27 = v99[0];
    do
    {
      sub_23DE902F4(v26, (uint64_t)&v103);
      v28 = v104;
      v29 = v105;
      __swift_project_boxed_opaque_existential_1(&v103, v104);
      (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v29 + 16))(v102, v28, v29);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v103);
      v30 = v102[0];
      v31 = v102[1];
      v32 = v102[2];
      v33 = v102[3];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23DEAA400(0, *(_QWORD *)(v27 + 16) + 1, 1);
        v27 = v99[0];
      }
      v35 = *(_QWORD *)(v27 + 16);
      v34 = *(_QWORD *)(v27 + 24);
      if (v35 >= v34 >> 1)
      {
        sub_23DEAA400(v34 > 1, v35 + 1, 1);
        v27 = v99[0];
      }
      *(_QWORD *)(v27 + 16) = v35 + 1;
      v36 = (_QWORD *)(v27 + 32 * v35);
      v36[4] = v30;
      v36[5] = v31;
      v36[6] = v32;
      v36[7] = v33;
      v26 += 40;
      --v25;
    }
    while (v25);
    swift_bridgeObjectRelease();
    v7 = v90;
    v17 = v85;
    v20 = v91;
    a6 = v89;
  }
  else
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_retain();
    v27 = MEMORY[0x24BEE4AF8];
  }
  v37 = sub_23DECD990(v27);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v7 + 104) = v37;
  if (!*(_QWORD *)(a6 + 48))
  {
    v69 = *(_QWORD *)(v7 + 24);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v69 + 40))(ObjectType, v69);
    swift_retain_n();
    v71 = sub_23DF14C68();
    v72 = sub_23DF14FF8();
    if (os_log_type_enabled(v71, (os_log_type_t)v72))
    {
      LODWORD(v90) = v72;
      v91 = v20;
      v73 = swift_slowAlloc();
      v89 = swift_slowAlloc();
      v102[0] = v89;
      *(_DWORD *)v73 = 136315394;
      v74 = *(_QWORD *)(v7 + 72);
      *(_QWORD *)&v103 = 60;
      *((_QWORD *)&v103 + 1) = 0xE100000000000000;
      swift_bridgeObjectRetain();
      sub_23DF14E60();
      swift_bridgeObjectRelease();
      sub_23DF14E60();
      if (!v74)
        swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      sub_23DF14E60();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_23DF14E60();
      *(_QWORD *)&v103 = sub_23DEC1518(v103, *((unint64_t *)&v103 + 1), v102);
      sub_23DF15100();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v73 + 12) = 2080;
      v75 = *(_QWORD **)(v7 + 96);
      if (v75[5])
      {
        v76 = v75[4];
        v77 = v75[5];
      }
      else
      {
        v76 = v75[2];
        v77 = v75[3];
        swift_bridgeObjectRetain();
      }
      v78 = v91;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v103 = sub_23DEC1518(v76, v77, v102);
      sub_23DF15100();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DE8B000, v71, (os_log_type_t)v90, "%s:%s: Nil initial anchor.", (uint8_t *)v73, 0x16u);
      v79 = v89;
      swift_arrayDestroy();
      MEMORY[0x242648490](v79, -1, -1);
      MEMORY[0x242648490](v73, -1, -1);

      (*(void (**)(char *, uint64_t))(v92 + 8))(v78, v93);
    }
    else
    {

      swift_release_n();
      (*(void (**)(char *, uint64_t))(v92 + 8))(v20, v93);
    }
    v68 = 0;
    goto LABEL_55;
  }
  swift_retain();
  v38 = swift_retain();
  v81[0] = sub_23DF120F8(v38, a6);
  v39 = *(_QWORD *)(v81[0] + 16);
  v40 = *(_QWORD *)(v39 + 64);
  v86 = v39 + 64;
  v41 = 1 << *(_BYTE *)(v39 + 32);
  v42 = -1;
  if (v41 < 64)
    v42 = ~(-1 << v41);
  v43 = v42 & v40;
  v87 = (unint64_t)(v41 + 63) >> 6;
  result = swift_bridgeObjectRetain_n();
  v45 = 0;
  *(_QWORD *)&v46 = 136315906;
  v82 = v46;
  v81[1] = MEMORY[0x24BEE4AD8] + 8;
  v84 = v39;
  v83 = v95;
  if (v43)
    goto LABEL_16;
LABEL_17:
  v49 = v45 + 1;
  if (!__OFADD__(v45, 1))
  {
    if (v49 < v87)
    {
      v50 = *(_QWORD *)(v86 + 8 * v49);
      ++v45;
      if (v50)
        goto LABEL_32;
      v45 = v49 + 1;
      if (v49 + 1 < v87)
      {
        v50 = *(_QWORD *)(v86 + 8 * v45);
        if (v50)
          goto LABEL_32;
        v45 = v49 + 2;
        if (v49 + 2 < v87)
        {
          v50 = *(_QWORD *)(v86 + 8 * v45);
          if (v50)
            goto LABEL_32;
          v45 = v49 + 3;
          if (v49 + 3 < v87)
          {
            v50 = *(_QWORD *)(v86 + 8 * v45);
            if (!v50)
            {
              v51 = v49 + 4;
              if (v51 < v87)
              {
                v50 = *(_QWORD *)(v86 + 8 * v51);
                if (v50)
                {
                  v45 = v51;
                  goto LABEL_32;
                }
                while (1)
                {
                  v45 = v51 + 1;
                  if (__OFADD__(v51, 1))
                    goto LABEL_57;
                  if (v45 >= v87)
                    goto LABEL_44;
                  v50 = *(_QWORD *)(v86 + 8 * v45);
                  ++v51;
                  if (v50)
                    goto LABEL_32;
                }
              }
              goto LABEL_44;
            }
LABEL_32:
            v43 = (v50 - 1) & v50;
            for (i = __clz(__rbit64(v50)) + (v45 << 6); ; i = v47 | (v45 << 6))
            {
              sub_23DE902F4(*(_QWORD *)(v39 + 56) + 40 * i, (uint64_t)&v103);
              sub_23DE902DC(&v103, (uint64_t)v102);
              v52 = *(_QWORD *)(v7 + 24);
              v53 = swift_getObjectType();
              (*(void (**)(uint64_t, uint64_t))(v52 + 40))(v53, v52);
              sub_23DE902F4((uint64_t)v102, (uint64_t)v99);
              sub_23DE902F4((uint64_t)v102, (uint64_t)v98);
              swift_retain_n();
              v54 = sub_23DF14C68();
              v55 = sub_23DF14FF8();
              if (os_log_type_enabled(v54, (os_log_type_t)v55))
              {
                LODWORD(v89) = v55;
                v90 = v43;
                v91 = (char *)v45;
                v56 = swift_slowAlloc();
                v88 = swift_slowAlloc();
                v97 = v88;
                *(_DWORD *)v56 = v82;
                v57 = *(_QWORD *)(v7 + 72);
                v94 = 60;
                v95[0] = 0xE100000000000000;
                swift_bridgeObjectRetain();
                sub_23DF14E60();
                swift_bridgeObjectRelease();
                sub_23DF14E60();
                if (!v57)
                  swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain_n();
                sub_23DF14E60();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                sub_23DF14E60();
                v94 = sub_23DEC1518(v94, v95[0], &v97);
                sub_23DF15100();
                swift_release_n();
                swift_bridgeObjectRelease();
                *(_WORD *)(v56 + 12) = 2080;
                v58 = *(_QWORD **)(v7 + 96);
                if (v58[5])
                {
                  v59 = v58[4];
                  v60 = v58[5];
                }
                else
                {
                  v59 = v58[2];
                  v60 = v58[3];
                  swift_bridgeObjectRetain();
                }
                v17 = v85;
                swift_bridgeObjectRetain();
                v94 = sub_23DEC1518(v59, v60, &v97);
                sub_23DF15100();
                swift_release_n();
                swift_bridgeObjectRelease();
                *(_WORD *)(v56 + 22) = 2080;
                v61 = v100;
                v62 = v101;
                __swift_project_boxed_opaque_existential_1(v99, v100);
                (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v62 + 48))(&v94, v61, v62);
                v63 = v96;
                if (v96)
                {
                  v64 = v95[1];
                }
                else
                {
                  v64 = v94;
                  v63 = swift_bridgeObjectRetain();
                }
                swift_bridgeObjectRelease();
                v94 = sub_23DEC1518(v64, v63, &v97);
                sub_23DF15100();
                swift_bridgeObjectRelease();
                __swift_destroy_boxed_opaque_existential_1((uint64_t)v99);
                *(_WORD *)(v56 + 32) = 2080;
                sub_23DE902F4((uint64_t)v98, (uint64_t)&v94);
                sub_23DE95524(0, qword_25432C070);
                v65 = sub_23DF14E18();
                v94 = sub_23DEC1518(v65, v66, &v97);
                sub_23DF15100();
                swift_bridgeObjectRelease();
                __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
                _os_log_impl(&dword_23DE8B000, v54, (os_log_type_t)v89, "%s:%s: Initial anchor: %s %s.", (uint8_t *)v56, 0x2Au);
                v67 = v88;
                swift_arrayDestroy();
                MEMORY[0x242648490](v67, -1, -1);
                MEMORY[0x242648490](v56, -1, -1);

                (*(void (**)(char *, uint64_t))(v92 + 8))(v17, v93);
                result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v102);
                v39 = v84;
                v45 = (int64_t)v91;
                v43 = v90;
                if (!v90)
                  goto LABEL_17;
              }
              else
              {

                __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
                __swift_destroy_boxed_opaque_existential_1((uint64_t)v99);
                swift_release_n();
                (*(void (**)(char *, uint64_t))(v92 + 8))(v17, v93);
                result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v102);
                if (!v43)
                  goto LABEL_17;
              }
LABEL_16:
              v47 = __clz(__rbit64(v43));
              v43 &= v43 - 1;
            }
          }
        }
      }
    }
LABEL_44:
    swift_release();
    swift_bridgeObjectRelease();
    v68 = v81[0];
LABEL_55:
    sub_23DE9B2F8(0, &qword_25432C230);
    v80 = swift_allocObject();
    *(_DWORD *)(v80 + 64) = 0;
    *(_QWORD *)(v80 + 16) = v68;
    *(_QWORD *)(v80 + 24) = v68;
    *(_QWORD *)(v80 + 32) = 0;
    *(_BYTE *)(v80 + 40) = 0;
    *(_QWORD *)(v80 + 48) = 0;
    *(_QWORD *)(v80 + 56) = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v7 + 112) = v80;
    swift_retain();
    return v7;
  }
  __break(1u);
LABEL_57:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for WorkCriteriaRecord()
{
  return objc_opt_self();
}

uint64_t method lookup function for WorkCriteriaRecord()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WorkCriteriaRecord.__allocating_init(context:executorIdentifier:planner:criteria:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

unint64_t destroy for WorkCriteriaRecord.CheckResult(unint64_t *a1)
{
  unint64_t result;

  result = *a1;
  if (result >= 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_unknownObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for WorkCriteriaRecord.CheckResult(uint64_t a1, uint64_t a2)
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
  __int128 v12;
  __int128 v13;
  __int128 v14;

  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    v12 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v12;
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    v13 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v13;
    v14 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v14;
  }
  else
  {
    v3 = *(_QWORD *)(a2 + 8);
    v4 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    v5 = *(_QWORD *)(a2 + 24);
    v6 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v5;
    v7 = *(_QWORD *)(a2 + 40);
    v8 = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 32) = v6;
    *(_QWORD *)(a1 + 40) = v7;
    v9 = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 48) = v8;
    *(_QWORD *)(a1 + 56) = v9;
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    v10 = *(_QWORD *)(a2 + 88);
    v11 = *(_QWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 88) = v10;
    *(_QWORD *)(a1 + 96) = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_unknownObjectRetain();
    swift_retain();
  }
  return a1;
}

uint64_t assignWithCopy for WorkCriteriaRecord.CheckResult(uint64_t a1, __int128 *a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)a2;
  if (v4 < 0xFFFFFFFF)
  {
    if (v5 >= 0xFFFFFFFF)
    {
      *(_QWORD *)a1 = v5;
      *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
      *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
      *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
      *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
      *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
      *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
      *(_QWORD *)(a1 + 56) = *((_QWORD *)a2 + 7);
      *(_OWORD *)(a1 + 64) = a2[4];
      *(_QWORD *)(a1 + 80) = *((_QWORD *)a2 + 10);
      v8 = *((_QWORD *)a2 + 12);
      *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 11);
      *(_QWORD *)(a1 + 96) = v8;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_unknownObjectRetain();
      swift_retain();
      return a1;
    }
LABEL_7:
    v9 = *a2;
    v10 = a2[2];
    *(_OWORD *)(a1 + 16) = a2[1];
    *(_OWORD *)(a1 + 32) = v10;
    *(_OWORD *)a1 = v9;
    v11 = a2[3];
    v12 = a2[4];
    v13 = a2[5];
    *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
    *(_OWORD *)(a1 + 64) = v12;
    *(_OWORD *)(a1 + 80) = v13;
    *(_OWORD *)(a1 + 48) = v11;
    return a1;
  }
  if (v5 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_unknownObjectRelease();
    swift_release();
    goto LABEL_7;
  }
  *(_QWORD *)a1 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
  *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *((_QWORD *)a2 + 7);
  swift_retain();
  swift_release();
  v6 = *((_QWORD *)a2 + 9);
  *(_QWORD *)(a1 + 64) = *((_QWORD *)a2 + 8);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 72) = v6;
  *(_QWORD *)(a1 + 80) = *((_QWORD *)a2 + 10);
  v7 = *((_QWORD *)a2 + 12);
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 11);
  *(_QWORD *)(a1 + 96) = v7;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for WorkCriteriaRecord.CheckResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  if (*(_QWORD *)a1 < 0xFFFFFFFFuLL)
    goto LABEL_5;
  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_unknownObjectRelease();
    swift_release();
LABEL_5:
    v6 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v6;
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    v7 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    v8 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v8;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  swift_unknownObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkCriteriaRecord.CheckResult(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFD && *((_BYTE *)a1 + 104))
    return (*(_DWORD *)a1 + 2147483645);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 2;
  if (v4 >= 4)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for WorkCriteriaRecord.CheckResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(_QWORD *)(result + 96) = 0;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 80) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 104) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 104) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 2;
  }
  return result;
}

uint64_t sub_23DF1341C(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    v2 = a2 ^ 0x80000000;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
  }
  else
  {
    if (!a2)
      return result;
    v2 = (a2 - 1);
  }
  *(_QWORD *)result = v2;
  return result;
}

ValueMetadata *type metadata accessor for WorkCriteriaRecord.CheckResult()
{
  return &type metadata for WorkCriteriaRecord.CheckResult;
}

uint64_t type metadata accessor for WorkCriteriaRecord.Epoch()
{
  return objc_opt_self();
}

uint64_t destroy for WorkCriteriaRecord.Epoch.State()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t _s19HealthOrchestration18WorkCriteriaRecordC5EpochC5StateVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WorkCriteriaRecord.Epoch.State(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for WorkCriteriaRecord.Epoch.State(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkCriteriaRecord.Epoch.State(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WorkCriteriaRecord.Epoch.State(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkCriteriaRecord.Epoch.State()
{
  return &type metadata for WorkCriteriaRecord.Epoch.State;
}

uint64_t destroy for WorkCriteriaRecord.State()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for WorkCriteriaRecord.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WorkCriteriaRecord.State(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for WorkCriteriaRecord.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkCriteriaRecord.State(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WorkCriteriaRecord.State(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkCriteriaRecord.State()
{
  return &type metadata for WorkCriteriaRecord.State;
}

_QWORD *sub_23DF1386C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  _QWORD *v20;

  v20 = a4;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v7 = (_QWORD *)(a1 + 32);
  swift_bridgeObjectRetain();
  v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    sub_23DF0C8BC(v7, a2, a3, v20, &v17);
    if (v4)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v8;
    }
    v10 = v18;
    if (v18)
    {
      v11 = v17;
      v16 = v19;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v8 = sub_23DF07418(0, v8[2] + 1, 1, v8);
      v13 = v8[2];
      v12 = v8[3];
      if (v13 >= v12 >> 1)
        v8 = sub_23DF07418((_QWORD *)(v12 > 1), v13 + 1, 1, v8);
      v8[2] = v13 + 1;
      v9 = &v8[4 * v13];
      v9[4] = v11;
      v9[5] = v10;
      *((_OWORD *)v9 + 3) = v16;
    }
    v7 += 5;
    --v5;
  }
  while (v5);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_23DF139BC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23DF139E0()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DF13A0C(_QWORD *a1, void *a2)
{
  uint64_t v2;

  return sub_23DF0D9E8(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_23DF13A14(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a1 >> 62)
    goto LABEL_13;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    v5 = 0;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v6 = MEMORY[0x242647BF0](v5, a1);
        swift_unknownObjectRelease();
        if (v6 == a2)
          return v5;
      }
      else if (*(_QWORD *)(a1 + 8 * v5 + 32) == a2)
      {
        return v5;
      }
      if (__OFADD__(v5, 1))
        break;
      if (++v5 == v4)
        return 0;
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
    v4 = sub_23DF15298();
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_23DF13B00(unint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v5;
  unint64_t v6;
  char v7;
  char v8;
  unint64_t v9;
  unint64_t i;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int isUniquelyReferenced_nonNull_bridgeObject;
  int v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v5 = swift_bridgeObjectRetain();
  v6 = sub_23DF13A14(v5, a2);
  v8 = v7;
  swift_bridgeObjectRelease();
  if (v2)
    return v6;
  if ((v8 & 1) == 0)
  {
    v9 = v6 + 1;
    if (__OFADD__(v6, 1))
      goto LABEL_54;
    if (*a1 >> 62)
    {
LABEL_55:
      swift_bridgeObjectRetain();
      v22 = sub_23DF15298();
      swift_bridgeObjectRelease();
      if (v9 != v22)
        goto LABEL_6;
    }
    else if (v9 != *(_QWORD *)((*a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      for (i = v6 + 5; ; ++i)
      {
        v11 = i - 4;
        v12 = *a1;
        if ((*a1 & 0xC000000000000001) != 0)
          break;
        if ((v11 & 0x8000000000000000) != 0)
        {
          __break(1u);
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
LABEL_48:
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
LABEL_53:
          __break(1u);
LABEL_54:
          __break(1u);
          goto LABEL_55;
        }
        if (v11 >= *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_45;
        if (*(_QWORD *)(v12 + 8 * i) != a2)
          goto LABEL_11;
LABEL_31:
        v9 = i - 3;
        if (__OFADD__(v11, 1))
          goto LABEL_46;
        if (*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          v18 = sub_23DF15298();
          swift_bridgeObjectRelease();
        }
        else
        {
          v18 = *(_QWORD *)((*a1 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        if (v9 == v18)
          return v6;
      }
      v19 = MEMORY[0x242647BF0](i - 4);
      swift_unknownObjectRelease();
      if (v19 == a2)
        goto LABEL_31;
LABEL_11:
      if (v11 == v6)
      {
LABEL_30:
        if (__OFADD__(v6++, 1))
          goto LABEL_47;
        goto LABEL_31;
      }
      v9 = *a1;
      if ((*a1 & 0xC000000000000001) != 0)
      {
        v13 = MEMORY[0x242647BF0](v6, *a1);
        v9 = *a1;
        if ((*a1 & 0xC000000000000001) == 0)
        {
LABEL_16:
          if ((v11 & 0x8000000000000000) != 0)
            goto LABEL_50;
          if (v11 >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_51;
          v14 = *(_QWORD *)(v9 + 8 * i);
          swift_retain();
          goto LABEL_19;
        }
      }
      else
      {
        if ((v6 & 0x8000000000000000) != 0)
          goto LABEL_48;
        if (v6 >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_49;
        v13 = *(_QWORD *)(v9 + 8 * v6 + 32);
        swift_retain();
        if ((v9 & 0xC000000000000001) == 0)
          goto LABEL_16;
      }
      v14 = MEMORY[0x242647BF0](i - 4, v9);
      v9 = *a1;
LABEL_19:
      isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!isUniquelyReferenced_nonNull_bridgeObject
        || (v9 & 0x8000000000000000) != 0
        || (v9 & 0x4000000000000000) != 0)
      {
        sub_23DF07530(v9);
      }
      *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 8 * v6 + 0x20) = v14;
      swift_release();
      sub_23DF14ED8();
      v9 = *a1;
      v16 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!v16 || (v9 & 0x8000000000000000) != 0 || (v9 & 0x4000000000000000) != 0)
        sub_23DF07530(v9);
      if ((v11 & 0x8000000000000000) != 0)
        goto LABEL_52;
      if (v11 >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_53;
      *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 8 * i) = v13;
      swift_release();
      sub_23DF14ED8();
      goto LABEL_30;
    }
    return v6;
  }
  v20 = *a1;
  if (!(v20 >> 62))
    return *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v23 = sub_23DF15298();
  swift_bridgeObjectRelease();
  return v23;
}

void sub_23DF13E18(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    v8 = a4(a3);
    v9 = a5(a1, v8);
    if (!v10)
      atomic_store(v9, a2);
  }
}

unint64_t sub_23DF13E70()
{
  unint64_t result;

  result = qword_256D100A8;
  if (!qword_256D100A8)
  {
    result = MEMORY[0x2426483D0](&unk_23DF1BFA4, &type metadata for InternalError);
    atomic_store(result, (unint64_t *)&qword_256D100A8);
  }
  return result;
}

uint64_t sub_23DF13EB4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23DF13EE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))
{
  uint64_t v6;

  v6 = a5(0, a2, a3, a4, MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

uint64_t sub_23DF13F2C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    sub_23DF13E18(255, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    result = MEMORY[0x2426483D0](MEMORY[0x24BEE12E0], v6);
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for InternalError()
{
  return &type metadata for InternalError;
}

ValueMetadata *type metadata accessor for SanitizedAnchorSet()
{
  return &type metadata for SanitizedAnchorSet;
}

uint64_t sub_23DF13F94@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (**a4)()@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;

  v5 = *a1;
  v10 = *(_OWORD *)(a3 + a2 - 16);
  swift_beginAccess();
  v7 = *(_QWORD *)(v5 + 16);
  v6 = *(_QWORD *)(v5 + 24);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = v10;
  *(_QWORD *)(v8 + 32) = v7;
  *(_QWORD *)(v8 + 40) = v6;
  *a4 = sub_23DF14AB8;
  a4[1] = (uint64_t (*)())v8;
  return swift_retain();
}

uint64_t sub_23DF1401C(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a4 + a3;
  v7 = *a1;
  v6 = a1[1];
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = *(_OWORD *)(v5 - 16);
  *(_QWORD *)(v8 + 32) = v7;
  *(_QWORD *)(v8 + 40) = v6;
  v9 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v9 + 16) = sub_23DF14AB8;
  *(_QWORD *)(v9 + 24) = v8;
  swift_retain();
  return swift_release();
}

uint64_t (*MockInputSignalObserver.handler.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t MockInputSignalObserver.didUpdate<A>(anchor:signal:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
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
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t);
  int v40;
  void (*v41)(char *, uint64_t, uint64_t, uint64_t);
  void (*v42)(char *, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  char *v45;
  int v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v49;
  void (*v50)(char *, char *);
  uint64_t result;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;

  v61 = a2;
  v65 = a1;
  v7 = *(_QWORD *)(*(_QWORD *)v4 + 80);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = sub_23DF150F4();
  v56 = *(_QWORD *)(v9 - 8);
  v57 = v9;
  MEMORY[0x24BDAC7A8](v9, v10);
  v63 = (char *)&v52 - v11;
  v59 = a4;
  v64 = swift_getAssociatedTypeWitness();
  v60 = *(_QWORD *)(v64 - 8);
  v13 = MEMORY[0x24BDAC7A8](v64, v12);
  v58 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13, v15);
  v18 = (char *)&v52 - v17;
  v62 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v16, v19);
  v21 = (char *)&v52 - v20;
  v22 = sub_23DF150F4();
  v53 = *(_QWORD *)(v22 - 8);
  v54 = v22;
  v24 = MEMORY[0x24BDAC7A8](v22, v23);
  v26 = (char *)&v52 - v25;
  v28 = MEMORY[0x24BDAC7A8](v24, v27);
  v55 = (char *)&v52 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = MEMORY[0x24BDAC7A8](v28, v30);
  v33 = (char *)&v52 - v32;
  v34 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v31, v35);
  v37 = (char *)&v52 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = *(void (**)(char *, uint64_t, uint64_t))(v38 + 16);
  v39(v33, v61, a3);
  v40 = swift_dynamicCast();
  v41 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56);
  if (v40)
  {
    v41(v26, 0, 1, v7);
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v37, v26, v7);
    v42 = *(void (**)(char *, uint64_t, uint64_t))(v60 + 16);
    v44 = v64;
    v43 = v65;
    v42(v18, v65, v64);
    v45 = v63;
    v46 = swift_dynamicCast();
    v47 = v62;
    v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v62 + 56);
    if (v46)
    {
      v48(v45, 0, 1, AssociatedTypeWitness);
      (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v21, v45, AssociatedTypeWitness);
      v49 = v66;
      swift_beginAccess();
      v50 = *(void (**)(char *, char *))(v49 + 16);
      swift_retain();
      v50(v21, v37);
      swift_release();
      (*(void (**)(char *, uint64_t))(v47 + 8))(v21, AssociatedTypeWitness);
      return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v37, v7);
    }
    v48(v45, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v56 + 8))(v45, v57);
    v42(v58, v43, v44);
    v67 = 0;
    v68 = 0xE000000000000000;
    sub_23DF15190();
    sub_23DF14E60();
    sub_23DF153E8();
  }
  else
  {
    v41(v26, 1, 1, v7);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v26, v54);
    v39(v55, v61, a3);
    v67 = 0;
    v68 = 0xE000000000000000;
    sub_23DF15190();
    sub_23DF14E60();
    sub_23DF153F4();
  }
  result = sub_23DF1528C();
  __break(1u);
  return result;
}

uint64_t *MockInputSignalObserver.__allocating_init()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v0 = (uint64_t *)swift_allocObject();
  v1 = *v0;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = *(_QWORD *)(v1 + 80);
  *(_QWORD *)(v2 + 24) = *(_QWORD *)(v1 + 88);
  v0[2] = (uint64_t)nullsub_1;
  v0[3] = v2;
  return v0;
}

uint64_t *MockInputSignalObserver.init()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = *(_QWORD *)(v1 + 80);
  *(_QWORD *)(v2 + 24) = *(_QWORD *)(v1 + 88);
  v0[2] = (uint64_t)nullsub_1;
  v0[3] = v2;
  return v0;
}

uint64_t sub_23DF14628()
{
  return swift_deallocObject();
}

uint64_t MockInputSignalObserver.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t sub_23DF1465C@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *a1;
  swift_beginAccess();
  v5 = *(_QWORD *)(v3 + 16);
  v4 = *(_QWORD *)(v3 + 24);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = v4;
  *a2 = sub_23DE9A540;
  a2[1] = (uint64_t (*)())v6;
  return swift_retain();
}

uint64_t sub_23DF146D0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a1;
  v3 = a1[1];
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v3;
  v6 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v6 + 16) = sub_23DE9A540;
  *(_QWORD *)(v6 + 24) = v5;
  swift_retain();
  return swift_release();
}

uint64_t _s19HealthOrchestration23MockInputSignalObserverC7handleryy6AnchorQz_xtcvg_0()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t _s19HealthOrchestration23MockInputSignalObserverC7handleryy6AnchorQz_xtcvs_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_release();
}

uint64_t (*MockAnyInputSignalObserver.handler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t MockAnyInputSignalObserver.didUpdate<A>(anchor:signal:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void (*v9)(uint64_t *, uint64_t *);
  uint64_t AssociatedTypeWitness;
  uint64_t *boxed_opaque_existential_1;
  uint64_t *v12;
  uint64_t v14[5];
  uint64_t v15[5];

  swift_beginAccess();
  v9 = *(void (**)(uint64_t *, uint64_t *))(v4 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v15[3] = AssociatedTypeWitness;
  v15[4] = swift_getAssociatedConformanceWitness();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v15);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(boxed_opaque_existential_1, a1, AssociatedTypeWitness);
  v14[3] = a3;
  v14[4] = a4;
  v12 = __swift_allocate_boxed_opaque_existential_1(v14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))(v12, a2, a3);
  swift_retain();
  v9(v15, v14);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
}

uint64_t MockAnyInputSignalObserver.__allocating_init()()
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = nullsub_1;
  *(_QWORD *)(result + 24) = 0;
  return result;
}

uint64_t MockAnyInputSignalObserver.init()()
{
  uint64_t v0;
  uint64_t result;

  result = v0;
  *(_QWORD *)(v0 + 16) = nullsub_1;
  *(_QWORD *)(v0 + 24) = 0;
  return result;
}

uint64_t _s19HealthOrchestration23MockInputSignalObserverCfD_0()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_23DF149B8()
{
  return 16;
}

__n128 sub_23DF149C4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_23DF149D8()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for MockInputSignalObserver(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MockInputSignalObserver);
}

uint64_t method lookup function for MockInputSignalObserver()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MockInputSignalObserver.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t type metadata accessor for MockAnyInputSignalObserver()
{
  return objc_opt_self();
}

uint64_t method lookup function for MockAnyInputSignalObserver()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MockAnyInputSignalObserver.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_23DF14A70()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DF14A94()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DF14AB8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t sub_23DF14AE8()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_23DF14AF4()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_23DF14B00()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_23DF14B0C()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_23DF14B18()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_23DF14B24()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_23DF14B30()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_23DF14B3C()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_23DF14B48()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_23DF14B54()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_23DF14B60()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_23DF14B6C()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23DF14B78()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23DF14B84()
{
  return MEMORY[0x24BDCD730]();
}

uint64_t sub_23DF14B90()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23DF14B9C()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_23DF14BA8()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23DF14BB4()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23DF14BC0()
{
  return MEMORY[0x24BDCDCD8]();
}

uint64_t sub_23DF14BCC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23DF14BD8()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_23DF14BE4()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_23DF14BF0()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23DF14BFC()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_23DF14C08()
{
  return MEMORY[0x24BDCEBF8]();
}

uint64_t sub_23DF14C14()
{
  return MEMORY[0x24BDCEC58]();
}

uint64_t sub_23DF14C20()
{
  return MEMORY[0x24BDCECE0]();
}

uint64_t sub_23DF14C2C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23DF14C38()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_23DF14C44()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_23DF14C50()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_23DF14C5C()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_23DF14C68()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23DF14C74()
{
  return MEMORY[0x24BEE78C8]();
}

uint64_t sub_23DF14C80()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23DF14C8C()
{
  return MEMORY[0x24BEE76D0]();
}

uint64_t sub_23DF14C98()
{
  return MEMORY[0x24BDE0410]();
}

uint64_t sub_23DF14CA4()
{
  return MEMORY[0x24BDE0428]();
}

uint64_t sub_23DF14CB0()
{
  return MEMORY[0x24BDE0438]();
}

uint64_t sub_23DF14CBC()
{
  return MEMORY[0x24BDE0440]();
}

uint64_t sub_23DF14CC8()
{
  return MEMORY[0x24BDE05D0]();
}

uint64_t sub_23DF14CD4()
{
  return MEMORY[0x24BDE0630]();
}

uint64_t sub_23DF14CE0()
{
  return MEMORY[0x24BDE0640]();
}

uint64_t sub_23DF14CEC()
{
  return MEMORY[0x24BDE0650]();
}

uint64_t sub_23DF14CF8()
{
  return MEMORY[0x24BDE0660]();
}

uint64_t sub_23DF14D04()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_23DF14D10()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_23DF14D1C()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_23DF14D28()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23DF14D34()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23DF14D40()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_23DF14D4C()
{
  return MEMORY[0x24BEE5578]();
}

uint64_t sub_23DF14D58()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_23DF14D64()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_23DF14D70()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_23DF14D7C()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_23DF14D88()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23DF14D94()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23DF14DA0()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_23DF14DAC()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_23DF14DB8()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23DF14DC4()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23DF14DD0()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23DF14DDC()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23DF14DE8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23DF14DF4()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_23DF14E00()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_23DF14E0C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23DF14E18()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23DF14E24()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_23DF14E30()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_23DF14E3C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23DF14E48()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_23DF14E54()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_23DF14E60()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23DF14E6C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23DF14E78()
{
  return MEMORY[0x24BEE0CE8]();
}

uint64_t sub_23DF14E84()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_23DF14E90()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23DF14E9C()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_23DF14EA8()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_23DF14EB4()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_23DF14EC0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23DF14ECC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23DF14ED8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23DF14EE4()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23DF14EF0()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_23DF14EFC()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23DF14F08()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23DF14F14()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23DF14F20()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_23DF14F2C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23DF14F38()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_23DF14F44()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_23DF14F50()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23DF14F5C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23DF14F68()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_23DF14F74()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_23DF14F80()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_23DF14F8C()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_23DF14F98()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23DF14FA4()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_23DF14FB0()
{
  return MEMORY[0x24BEE16F8]();
}

uint64_t sub_23DF14FBC()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_23DF14FC8()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_23DF14FD4()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_23DF14FE0()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_23DF14FEC()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t sub_23DF14FF8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23DF15004()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23DF15010()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23DF1501C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23DF15028()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_23DF15034()
{
  return MEMORY[0x24BEE5678]();
}

uint64_t sub_23DF15040()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_23DF1504C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23DF15058()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_23DF15064()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_23DF15070()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_23DF1507C()
{
  return MEMORY[0x24BEE57C0]();
}

uint64_t sub_23DF15088()
{
  return MEMORY[0x24BEE5828]();
}

uint64_t sub_23DF15094()
{
  return MEMORY[0x24BEE5830]();
}

uint64_t sub_23DF150A0()
{
  return MEMORY[0x24BEE58B8]();
}

uint64_t sub_23DF150AC()
{
  return MEMORY[0x24BEE58D0]();
}

uint64_t sub_23DF150B8()
{
  return MEMORY[0x24BEE58D8]();
}

uint64_t sub_23DF150C4()
{
  return MEMORY[0x24BEE58E8]();
}

uint64_t sub_23DF150D0()
{
  return MEMORY[0x24BEE5958]();
}

uint64_t sub_23DF150DC()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_23DF150E8()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23DF150F4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23DF15100()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23DF1510C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23DF15118()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_23DF15124()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_23DF15130()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23DF1513C()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_23DF15148()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23DF15154()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23DF15160()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23DF1516C()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23DF15178()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23DF15184()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_23DF15190()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23DF1519C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23DF151A8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23DF151B4()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_23DF151C0()
{
  return MEMORY[0x24BEE26C0]();
}

uint64_t sub_23DF151CC()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23DF151D8()
{
  return MEMORY[0x24BEE2788]();
}

uint64_t sub_23DF151E4()
{
  return MEMORY[0x24BEE2798]();
}

uint64_t sub_23DF151F0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23DF151FC()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23DF15208()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23DF15214()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_23DF15220()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_23DF1522C()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23DF15238()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23DF15244()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_23DF15250()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_23DF1525C()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_23DF15268()
{
  return MEMORY[0x24BEE2BD8]();
}

uint64_t sub_23DF15274()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23DF15280()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23DF1528C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23DF15298()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23DF152A4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23DF152B0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23DF152BC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23DF152C8()
{
  return MEMORY[0x24BEE30A0]();
}

uint64_t sub_23DF152D4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23DF152E0()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_23DF152EC()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23DF152F8()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_23DF15304()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23DF15310()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23DF1531C()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_23DF15328()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23DF15334()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23DF15340()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_23DF1534C()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_23DF15358()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23DF15364()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23DF15370()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_23DF1537C()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23DF15388()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23DF15394()
{
  return MEMORY[0x24BEE3518]();
}

uint64_t sub_23DF153A0()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_23DF153AC()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_23DF153B8()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23DF153C4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23DF153D0()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_23DF153DC()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_23DF153E8()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_23DF153F4()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_23DF15400()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23DF1540C()
{
  return MEMORY[0x24BEE3D80]();
}

uint64_t sub_23DF15418()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23DF15424()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23DF15430()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23DF1543C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23DF15448()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23DF15454()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23DF15460()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_23DF1546C()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_23DF15478()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23DF15484()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23DF15490()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23DF1549C()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_23DF154A8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23DF154B4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23DF154C0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23DF154CC()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23DF154D8()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_23DF154E4()
{
  return MEMORY[0x24BEE4A98]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x24BE67140]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

uint64_t MobileGestalt_copy_buildVersion_obj()
{
  return MEMORY[0x24BED84E8]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x24BED8580]();
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

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC8](queue, block);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF450](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x24BDAFE00](*(_QWORD *)&a1, a2);
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x24BEE4D28]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getFunctionTypeMetadata()
{
  return MEMORY[0x24BEE4D50]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x24BEE4D58]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x24BEE4D60]();
}

uint64_t swift_getFunctionTypeMetadata2()
{
  return MEMORY[0x24BEE4D68]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x24BEE4FB8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x24BEE4FC0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x24BEE4FE0]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x24BEE4FE8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
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

