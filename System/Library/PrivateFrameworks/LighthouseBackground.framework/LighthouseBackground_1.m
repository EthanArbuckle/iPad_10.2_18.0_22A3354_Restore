uint64_t static LedgerStateMachine.meanEdgeLatencySumForPath(path:computedAnalytics:)(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  unint64_t v17;
  char v18;
  double v19;

  v2 = *(_QWORD *)(result + 16);
  if (v2)
  {
    v3 = result;
    v4 = v2 - 1;
    swift_bridgeObjectRetain();
    v5 = sub_2402B73D4(0, v4, v3);
    swift_bridgeObjectRelease();
    v6 = *(_QWORD *)(v5 + 16);
    if (v6)
    {
      v7 = (uint64_t *)(v5 + 56);
      v8 = 0.0;
      while (1)
      {
        v10 = *(v7 - 3);
        v9 = *(v7 - 2);
        v12 = *(v7 - 1);
        v11 = *v7;
        v13 = a2[3];
        v14 = a2[4];
        __swift_project_boxed_opaque_existential_1(a2, v13);
        v15 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v16 = v15(v13, v14);
        if (!*(_QWORD *)(v16 + 16))
          break;
        v17 = sub_2402587B4(v10, v9, v12, v11);
        if ((v18 & 1) == 0)
          break;
        v7 += 4;
        v19 = *(double *)(*(_QWORD *)(v16 + 56) + 32 * v17 + 16);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v8 = v8 + v19;
        if (!--v6)
        {
          swift_bridgeObjectRelease();
          return *(_QWORD *)&v8;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 0;
    }
    else
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static LedgerStateMachine.averageLatencyAcrossPaths(paths:computedAnalytics:)(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double v8;
  char v9;
  char v10;

  v2 = *(_QWORD *)(result + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    v4 = 0;
    v5 = 0;
    v6 = 0.0;
    while (1)
    {
      v7 = swift_bridgeObjectRetain();
      v8 = COERCE_DOUBLE(static LedgerStateMachine.meanEdgeLatencySumForPath(path:computedAnalytics:)(v7, a2));
      v10 = v9;
      result = swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
      {
        if (__OFADD__(v4++, 1))
        {
          __break(1u);
          return result;
        }
        v6 = v6 + (v8 - v6) / (double)v4;
      }
      if (v2 == ++v5)
        return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t *LedgerStateMachine.deinit()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_release();
  sub_24023D378((uint64_t)v0 + qword_256FE1408, &qword_256FDEAE0);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 112));
  return v0;
}

uint64_t LedgerStateMachine.__deallocating_deinit()
{
  LedgerStateMachine.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2402B73D4(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v20 = result;
  v3 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v4 = MEMORY[0x24BEE4AF8];
  if (!v3)
    return v4;
  v6 = a2;
  v21 = MEMORY[0x24BEE4AF8];
  result = sub_24029BE4C(0, v3 & ~(v3 >> 63), 0);
  if (v6 >= v20 && (v3 & 0x8000000000000000) == 0)
  {
    v17 = v6;
    v4 = v21;
    v7 = *(_QWORD *)(a3 + 16);
    v8 = v20;
    v18 = v7;
    if (v7 <= v20)
      v7 = v20;
    v19 = v7;
    v9 = (uint64_t *)(a3 + 16 * v20 + 56);
    while (v6 != v8)
    {
      if (v20 < 0)
        goto LABEL_17;
      if (v19 == v8)
        goto LABEL_18;
      if (++v8 >= v18)
        goto LABEL_19;
      v11 = *(v9 - 3);
      v10 = *(v9 - 2);
      v13 = *(v9 - 1);
      v12 = *v9;
      v15 = *(_QWORD *)(v21 + 16);
      v14 = *(_QWORD *)(v21 + 24);
      swift_bridgeObjectRetain();
      result = swift_bridgeObjectRetain();
      if (v15 >= v14 >> 1)
        result = sub_24029BE4C(v14 > 1, v15 + 1, 1);
      *(_QWORD *)(v21 + 16) = v15 + 1;
      v16 = (_QWORD *)(v21 + 32 * v15);
      v16[4] = v11;
      v16[5] = v10;
      v16[6] = v13;
      v16[7] = v12;
      v9 += 2;
      v6 = v17;
      if (v17 == v8)
        return v4;
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
LABEL_21:
  __break(1u);
  return result;
}

char *sub_2402B7544(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v16;

  v2 = v1;
  v4 = *(_QWORD *)v1;
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v16 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDEAE0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = &v2[qword_256FE1408];
  v12 = type metadata accessor for LedgerState();
  v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56);
  v13(v11, 1, 1, v12);
  *((_QWORD *)v2 + 2) = a1;
  v13(v10, 1, 1, v12);
  v14 = (uint64_t)&v2[qword_256FE1408];
  swift_beginAccess();
  swift_retain();
  sub_240287C78((uint64_t)v10, v14);
  swift_endAccess();
  (*(void (**)(uint64_t))(*(_QWORD *)(v4 + 88) + 144))(v5);
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(&v2[*(_QWORD *)(*(_QWORD *)v2 + 112)], v7, v5);
  return v2;
}

unint64_t sub_2402B76B8()
{
  unint64_t result;

  result = qword_256FE13F8;
  if (!qword_256FE13F8)
  {
    result = MEMORY[0x2426820F8](&unk_2402C8548, &type metadata for LedgerTransitionStatistics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256FE13F8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for LedgerTransitionStatistics(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for LedgerTransitionStatistics(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for LedgerTransitionStatistics()
{
  return &type metadata for LedgerTransitionStatistics;
}

uint64_t dispatch thunk of StateMachineAnalytics.stateCountMap.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of StateMachineAnalytics.stateCountMap.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of StateMachineAnalytics.stateCountMap.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of StateMachineAnalytics.transitionStatsMap.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of StateMachineAnalytics.transitionStatsMap.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of StateMachineAnalytics.transitionStatsMap.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of StateMachineAnalytics.firstValidState.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of StateMachineAnalytics.firstValidState.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of StateMachineAnalytics.firstValidState.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of StateMachineAnalytics.latestValidState.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of StateMachineAnalytics.latestValidState.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of StateMachineAnalytics.latestValidState.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 120))();
}

uint64_t dispatch thunk of StateMachineAnalytics.firstEventTimestamp.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t dispatch thunk of StateMachineAnalytics.lastEventTimestamp.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 136))();
}

uint64_t dispatch thunk of StateMachineAnalytics.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 144))();
}

void sub_2402B77D0()
{
  unint64_t v0;
  unint64_t v1;

  sub_24028955C();
  if (v0 <= 0x3F)
  {
    swift_checkMetadataState();
    if (v1 <= 0x3F)
      swift_initClassMetadata2();
  }
}

uint64_t type metadata accessor for LedgerStateMachine(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LedgerStateMachine);
}

uint64_t method lookup function for LedgerStateMachine()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LedgerStateMachine.__allocating_init(inputGraph:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of LedgerStateMachine.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of LedgerStateMachine.state.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of LedgerStateMachine.reset(startState:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of LedgerStateMachine.nextState(nextState:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of LedgerStateMachine.processStates(states:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of LedgerStateMachine.setInitialState(currentState:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of LedgerStateMachine.processStateTransition(currentState:nextState:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t storeEnumTagSinglePayload for LedgerTransitionStatistics.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2402B792C + 4 * byte_2402C8389[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2402B7960 + 4 * byte_2402C8384[v4]))();
}

uint64_t sub_2402B7960(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2402B7968(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2402B7970);
  return result;
}

uint64_t sub_2402B797C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2402B7984);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2402B7988(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2402B7990(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LedgerTransitionStatistics.CodingKeys()
{
  return &type metadata for LedgerTransitionStatistics.CodingKeys;
}

unint64_t sub_2402B79B0()
{
  unint64_t result;

  result = qword_256FE1490;
  if (!qword_256FE1490)
  {
    result = MEMORY[0x2426820F8](&unk_2402C8520, &type metadata for LedgerTransitionStatistics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256FE1490);
  }
  return result;
}

unint64_t sub_2402B79F8()
{
  unint64_t result;

  result = qword_256FE1498;
  if (!qword_256FE1498)
  {
    result = MEMORY[0x2426820F8](&unk_2402C8490, &type metadata for LedgerTransitionStatistics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256FE1498);
  }
  return result;
}

unint64_t sub_2402B7A40()
{
  unint64_t result;

  result = qword_256FE14A0;
  if (!qword_256FE14A0)
  {
    result = MEMORY[0x2426820F8](&unk_2402C84B8, &type metadata for LedgerTransitionStatistics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256FE14A0);
  }
  return result;
}

uint64_t sub_2402B7A84(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 7235949 && a2 == 0xE300000000000000;
  if (v2 || (sub_2402BDD8C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7889261 && a2 == 0xE300000000000000 || (sub_2402BDD8C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1851876717 && a2 == 0xE400000000000000 || (sub_2402BDD8C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746E756F63 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_2402BDD8C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t SandboxExtension.__allocating_init(token:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)(result + 32) = 0;
  *(_BYTE *)(result + 40) = 1;
  *(_QWORD *)(result + 16) = a1;
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SandboxExtension.consume()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;

  v1 = v0;
  if ((*(_BYTE *)(v0 + 40) & 1) != 0)
  {
    sub_2402BD690();
    v2 = sandbox_extension_consume();
    v3 = swift_release();
    if (v2 < 0)
    {
      v12 = MEMORY[0x2426812F4](v3);
      v13 = MEMORY[0x2426812F4]();
      if (strerror(v13))
      {
        v14 = sub_2402BD630();
        v16 = v15;
        sub_2402B7EF0();
        swift_allocError();
        *v17 = v12;
        v17[1] = v14;
        v17[2] = v16;
        swift_willThrow();
      }
      else
      {
        __break(1u);
      }
    }
    else
    {
      *(_QWORD *)(v1 + 32) = v2;
      *(_BYTE *)(v1 + 40) = 0;
    }
  }
  else
  {
    if (qword_2543528A0 != -1)
      swift_once();
    v4 = sub_2402BD4E0();
    __swift_project_value_buffer(v4, (uint64_t)qword_2543529A0);
    swift_retain_n();
    v5 = sub_2402BD4C8();
    v6 = sub_2402BD960();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = swift_slowAlloc();
      v18 = v8;
      *(_DWORD *)v7 = 136315138;
      swift_retain();
      v9 = SandboxExtension.description.getter();
      v11 = v10;
      swift_release();
      sub_24023D440(v9, v11, &v18);
      sub_2402BD9FC();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24022D000, v5, v6, "SandboxExtension already consumed: %s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242682188](v8, -1, -1);
      MEMORY[0x242682188](v7, -1, -1);

    }
    else
    {

      swift_release_n();
    }
  }
}

uint64_t SandboxExtension.token.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SandboxExtension.init(token:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a2;
  *(_QWORD *)(v2 + 32) = 0;
  *(_BYTE *)(v2 + 40) = 1;
  *(_QWORD *)(v2 + 16) = a1;
  return v2;
}

unint64_t sub_2402B7EF0()
{
  unint64_t result;

  result = qword_256FE14A8;
  if (!qword_256FE14A8)
  {
    result = MEMORY[0x2426820F8](&protocol conformance descriptor for SandboxError, &type metadata for SandboxError);
    atomic_store(result, (unint64_t *)&qword_256FE14A8);
  }
  return result;
}

uint64_t SandboxExtension.deinit()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + 40) & 1) == 0)
    sandbox_extension_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SandboxExtension.__deallocating_deinit()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + 40) & 1) == 0)
    sandbox_extension_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

unint64_t SandboxExtension.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_2402BDA98();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v0 = sub_2402B82D4(16);
  v2 = v1;
  v4 = v3;
  v6 = v5;
  swift_bridgeObjectRelease();
  MEMORY[0x242681468](v0, v2, v4, v6);
  sub_2402BD6C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2402BD6C0();
  sub_2402BDD68();
  sub_2402BD6C0();
  swift_bridgeObjectRelease();
  sub_2402BD6C0();
  return 0xD000000000000018;
}

char *static SandboxExtension.issue(auditToken:url:readonly:)()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  char *result;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  sub_2402BD384();
  v0 = sub_2402BD690();
  swift_bridgeObjectRelease();
  v1 = (void *)sandbox_extension_issue_file_to_process();
  v2 = swift_release();
  if (v1)
  {
    v3 = sub_2402BD630();
    if (v4)
    {
      v5 = v3;
      v6 = v4;
      v0 = swift_allocObject();
      *(_QWORD *)(v0 + 24) = v6;
      *(_QWORD *)(v0 + 32) = 0;
      *(_BYTE *)(v0 + 40) = 1;
      *(_QWORD *)(v0 + 16) = v5;
    }
    else
    {
      sub_2402B7EF0();
      swift_allocError();
      *v13 = 0;
      v13[1] = 0;
      v13[2] = 1;
      swift_willThrow();
    }
    free(v1);
    return (char *)v0;
  }
  v7 = MEMORY[0x2426812F4](v2);
  v8 = MEMORY[0x2426812F4]();
  result = strerror(v8);
  if (result)
  {
    v10 = sub_2402BD630();
    v0 = v11;
    sub_2402B7EF0();
    swift_allocError();
    *v12 = v7;
    v12[1] = v10;
    v12[2] = v0;
    swift_willThrow();
    return (char *)v0;
  }
  __break(1u);
  return result;
}

unint64_t sub_2402B82B4()
{
  return SandboxExtension.description.getter();
}

uint64_t sub_2402B82D4(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_2402BD6B4();
    return sub_2402BD720();
  }
  return result;
}

unint64_t destroy for SandboxError(uint64_t a1)
{
  unint64_t result;
  int v2;

  result = *(_QWORD *)(a1 + 16);
  v2 = -1;
  if (result < 0xFFFFFFFF)
    v2 = result;
  if (v2 - 1 < 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s20LighthouseBackground12SandboxErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 16);
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF)
    v4 = *(_QWORD *)(a2 + 16);
  if ((int)v4 - 1 < 0)
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a1 + 16) = v3;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  }
  return a1;
}

uint64_t assignWithCopy for SandboxError(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  __int128 v8;

  LODWORD(v4) = -1;
  if (*(_QWORD *)(a1 + 16) >= 0xFFFFFFFFuLL)
    LODWORD(v5) = -1;
  else
    v5 = *(_QWORD *)(a1 + 16);
  v6 = v5 - 1;
  if (*((_QWORD *)a2 + 2) < 0xFFFFFFFFuLL)
    v4 = *((_QWORD *)a2 + 2);
  v7 = v4 - 1;
  if (v6 < 0)
  {
    if (v7 < 0)
    {
      *(_DWORD *)a1 = *(_DWORD *)a2;
      *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
      *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if ((v7 & 0x80000000) == 0)
  {
LABEL_11:
    v8 = *a2;
    *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)a1 = v8;
    return a1;
  }
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithTake for SandboxError(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = -1;
  if (v4 < 0xFFFFFFFF)
    v5 = v4;
  if (v5 - 1 < 0)
  {
    v6 = *(_QWORD *)(a2 + 16);
    LODWORD(v7) = -1;
    if (v6 < 0xFFFFFFFF)
      v7 = *(_QWORD *)(a2 + 16);
    if ((int)v7 - 1 < 0)
    {
      *(_DWORD *)a1 = *(_DWORD *)a2;
      *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
      *(_QWORD *)(a1 + 16) = v6;
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SandboxError(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;
  unsigned int v5;
  unsigned int v6;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFD && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 2147483645);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  v5 = v4 + 1;
  v6 = v4 - 1;
  if (v5 >= 3)
    return v6;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SandboxError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_DWORD *)result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2 + 2;
  }
  return result;
}

uint64_t sub_2402B85D8(uint64_t a1)
{
  unint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  v2 = v1 - 1;
  if (v2 < 0)
    v2 = -1;
  return (v2 + 1);
}

_QWORD *sub_2402B85FC(_QWORD *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    result[1] = 0;
    result[2] = 0;
    *result = a2 - 0x7FFFFFFF;
  }
  else if (a2)
  {
    result[2] = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SandboxError()
{
  return &type metadata for SandboxError;
}

uint64_t type metadata accessor for SandboxExtension()
{
  return objc_opt_self();
}

uint64_t method lookup function for SandboxExtension()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SandboxExtension.__allocating_init(token:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_2402B8670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDEC70);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDEC78);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 48))(a1, 1) == 1)
  {
    sub_24024D8E0(a1);
    sub_2402BA138(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_24024D8E0((uint64_t)v10);
  }
  else
  {
    sub_24024FB00(a1, (uint64_t)v13);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v4;
    *v4 = 0x8000000000000000;
    sub_24025A15C((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

void (*sub_2402B87C4(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *a1)
{
  _QWORD *v6;

  v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_2402BA474(v6, a2, a3);
  return sub_2402B8830;
}

void sub_2402B8830(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 40))(*a1, 0);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t LedgerStateDefinition.index.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LedgerStateDefinition.index.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*LedgerStateDefinition.index.modify())()
{
  return nullsub_1;
}

LighthouseBackground::LedgerStateDefinition __swiftcall LedgerStateDefinition.init(index:)(LighthouseBackground::LedgerStateDefinition index)
{
  LighthouseBackground::LedgerStateDefinition *v1;

  *v1 = index;
  return index;
}

uint64_t LedgerStateDefinition.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_2402BD6A8();
  return swift_bridgeObjectRelease();
}

uint64_t static LedgerStateDefinition.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_2402BDD8C();
}

uint64_t sub_2402B8954()
{
  return 0x7865646E69;
}

uint64_t sub_2402B8968@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x7865646E69 && a2 == 0xE500000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_2402BDD8C();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_2402B89F4()
{
  sub_2402B8B30();
  return sub_2402BDE88();
}

uint64_t sub_2402B8A1C()
{
  sub_2402B8B30();
  return sub_2402BDE94();
}

uint64_t LedgerStateDefinition.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FE1558);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2402B8B30();
  sub_2402BDE70();
  sub_2402BDCFC();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_2402B8B30()
{
  unint64_t result;

  result = qword_256FE1560;
  if (!qword_256FE1560)
  {
    result = MEMORY[0x2426820F8](&unk_2402C89B0, &type metadata for LedgerStateDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256FE1560);
  }
  return result;
}

uint64_t LedgerStateDefinition.hashValue.getter()
{
  sub_2402BDE04();
  swift_bridgeObjectRetain();
  sub_2402BD6A8();
  swift_bridgeObjectRelease();
  return sub_2402BDE34();
}

uint64_t LedgerStateDefinition.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FE1568);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2402B8B30();
  sub_2402BDE64();
  if (!v2)
  {
    v9 = sub_2402BDC24();
    v11 = v10;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2402B8CE8()
{
  sub_2402BDE04();
  swift_bridgeObjectRetain();
  sub_2402BD6A8();
  swift_bridgeObjectRelease();
  return sub_2402BDE34();
}

uint64_t sub_2402B8D40()
{
  swift_bridgeObjectRetain();
  sub_2402BD6A8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2402B8D84()
{
  sub_2402BDE04();
  swift_bridgeObjectRetain();
  sub_2402BD6A8();
  swift_bridgeObjectRelease();
  return sub_2402BDE34();
}

uint64_t sub_2402B8DD8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return LedgerStateDefinition.init(from:)(a1, a2);
}

uint64_t sub_2402B8DEC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FE1558);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2402B8B30();
  sub_2402BDE70();
  sub_2402BDCFC();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_2402B8ED8(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_2402BDD8C();
}

uint64_t LedgerRecipe.project.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LedgerRecipe.project.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*LedgerRecipe.project.modify())()
{
  return nullsub_1;
}

uint64_t LedgerRecipe.events.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t LedgerRecipe.events.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*LedgerRecipe.events.modify())()
{
  return nullsub_1;
}

uint64_t LedgerRecipe.transitions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t LedgerRecipe.transitions.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 24) = a1;
  return result;
}

uint64_t (*LedgerRecipe.transitions.modify())()
{
  return nullsub_1;
}

LighthouseBackground::LedgerRecipe __swiftcall LedgerRecipe.init(project:events:transitions:)(Swift::String project, Swift::OpaquePointer events, Swift::OpaquePointer transitions)
{
  uint64_t v3;
  LighthouseBackground::LedgerRecipe result;

  *(Swift::String *)v3 = project;
  *(Swift::OpaquePointer *)(v3 + 16) = events;
  *(Swift::OpaquePointer *)(v3 + 24) = transitions;
  result.project = project;
  result.transitions = transitions;
  result.events = events;
  return result;
}

uint64_t sub_2402B9004()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x73746E657665;
  if (*v0 != 1)
    v1 = 0x697469736E617274;
  if (*v0)
    return v1;
  else
    return 0x7463656A6F7270;
}

uint64_t sub_2402B9064@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2402BB3B4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2402B9088()
{
  sub_2402B9288();
  return sub_2402BDE88();
}

uint64_t sub_2402B90B0()
{
  sub_2402B9288();
  return sub_2402BDE94();
}

uint64_t LedgerRecipe.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FE1570);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v11 = *(_QWORD *)(v1 + 24);
  v12 = v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2402B9288();
  sub_2402BDE70();
  LOBYTE(v15) = 0;
  v8 = v13;
  sub_2402BDCFC();
  if (!v8)
  {
    v9 = v11;
    v15 = v12;
    v14 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256FE1580);
    sub_2402B95A4(&qword_256FE1588, (uint64_t (*)(void))sub_2402B92CC, MEMORY[0x24BEE12A0]);
    sub_2402BDD2C();
    v15 = v9;
    v14 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256FDF300);
    sub_240263F24();
    sub_2402BDD2C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_2402B9288()
{
  unint64_t result;

  result = qword_256FE1578;
  if (!qword_256FE1578)
  {
    result = MEMORY[0x2426820F8](&unk_2402C8960, &type metadata for LedgerRecipe.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256FE1578);
  }
  return result;
}

unint64_t sub_2402B92CC()
{
  unint64_t result;

  result = qword_256FE1590;
  if (!qword_256FE1590)
  {
    result = MEMORY[0x2426820F8](&protocol conformance descriptor for LedgerStateDefinition, &type metadata for LedgerStateDefinition);
    atomic_store(result, (unint64_t *)&qword_256FE1590);
  }
  return result;
}

uint64_t LedgerRecipe.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FE1598);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2402B9288();
  sub_2402BDE64();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v20) = 0;
  v9 = sub_2402BDC24();
  v11 = v10;
  v18 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FE1580);
  v19 = 1;
  sub_2402B95A4(&qword_256FE15A0, (uint64_t (*)(void))sub_2402B960C, MEMORY[0x24BEE12D0]);
  swift_bridgeObjectRetain();
  sub_2402BDC54();
  v12 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDF300);
  v19 = 2;
  sub_2402640CC();
  v17 = v12;
  swift_bridgeObjectRetain();
  sub_2402BDC54();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v13 = v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = v17;
  *a2 = v18;
  a2[1] = v11;
  a2[2] = v14;
  a2[3] = v13;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2402B95A4(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FE1580);
    v8 = a2();
    result = MEMORY[0x2426820F8](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2402B960C()
{
  unint64_t result;

  result = qword_256FE15A8;
  if (!qword_256FE15A8)
  {
    result = MEMORY[0x2426820F8](&protocol conformance descriptor for LedgerStateDefinition, &type metadata for LedgerStateDefinition);
    atomic_store(result, (unint64_t *)&qword_256FE15A8);
  }
  return result;
}

uint64_t sub_2402B9650@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return LedgerRecipe.init(from:)(a1, a2);
}

uint64_t sub_2402B9664(_QWORD *a1)
{
  return LedgerRecipe.encode(to:)(a1);
}

uint64_t LedgerState.init(def:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  type metadata accessor for LedgerState();
  return sub_2402BD414();
}

uint64_t Graph<>.init(recipe:)(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)();
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v30;
  char v31;
  unint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  char v38;
  _QWORD *v39;
  uint64_t *v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t *v55;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  uint64_t v59;
  int64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  void (*v71)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v72)(uint64_t, uint64_t, uint64_t);
  uint64_t v73;
  unint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t (*v79)();
  void (*v80)(_QWORD *);
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  char v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  _QWORD *v91;
  _QWORD *v92;
  uint64_t result;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  int64_t v97;
  uint64_t v98;
  uint64_t v99;
  void (*v100)(_QWORD *, _QWORD);
  uint64_t (*v101)();
  _QWORD *v102;
  unint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD *v107;
  char *v108;
  uint64_t *v109;
  uint64_t v110;
  _QWORD *v111;
  _QWORD v112[5];
  _QWORD v113[5];

  v105 = 0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDEC70);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v108 = (char *)&v94 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v94 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDEC78);
  v8 = *(_QWORD **)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v94 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v107 = (uint64_t *)((char *)&v94 - v12);
  v106 = type metadata accessor for LedgerState();
  MEMORY[0x24BDAC7A8](v106);
  v109 = (uint64_t *)((char *)&v94 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = *a1;
  v15 = (uint64_t (*)())a1[1];
  v16 = a1[3];
  v103 = a1[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDEB40);
  v17 = (_QWORD *)swift_allocObject();
  swift_bridgeObjectRetain();
  v18 = MEMORY[0x24BEE4AF8];
  v17[4] = sub_240249150(MEMORY[0x24BEE4AF8]);
  v19 = v17 + 4;
  v17[2] = v14;
  v17[3] = v15;
  v20 = sub_240249150(v18);
  v21 = v103;
  swift_beginAccess();
  v17[4] = v20;
  swift_bridgeObjectRelease();
  v22 = *(_QWORD *)(v21 + 16);
  v99 = v16;
  v111 = v17 + 4;
  v102 = v17;
  if (v22)
  {
    v101 = v15;
    swift_retain();
    swift_bridgeObjectRetain();
    v23 = (uint64_t *)(v21 + 40);
    v24 = v109;
    v104 = v11;
    while (1)
    {
      v110 = v22;
      v25 = v19;
      v27 = *(v23 - 1);
      v26 = *v23;
      *v24 = v27;
      v24[1] = v26;
      swift_bridgeObjectRetain();
      sub_2402BD414();
      v28 = (uint64_t)v107;
      sub_240231EBC((uint64_t)v24, (uint64_t)v107);
      *(_QWORD *)(v28 + *(int *)(v7 + 52)) = MEMORY[0x24BEE4AF8];
      swift_beginAccess();
      sub_24024FB00(v28, (uint64_t)v11);
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v113[0] = *v25;
      v30 = v113[0];
      *v25 = 0x8000000000000000;
      v32 = sub_240258860(v27, v26);
      v33 = *(_QWORD *)(v30 + 16);
      v34 = (v31 & 1) == 0;
      v35 = v33 + v34;
      if (__OFADD__(v33, v34))
        goto LABEL_82;
      v36 = v31;
      if (*(_QWORD *)(v30 + 24) >= v35)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          v39 = (_QWORD *)v113[0];
          if ((v31 & 1) == 0)
            goto LABEL_12;
        }
        else
        {
          sub_24025A904();
          v39 = (_QWORD *)v113[0];
          if ((v36 & 1) == 0)
            goto LABEL_12;
        }
      }
      else
      {
        sub_240258AA0(v35, isUniquelyReferenced_nonNull_native);
        v37 = sub_240258860(v27, v26);
        if ((v36 & 1) != (v38 & 1))
          goto LABEL_86;
        v32 = v37;
        v39 = (_QWORD *)v113[0];
        if ((v36 & 1) == 0)
        {
LABEL_12:
          v39[(v32 >> 6) + 8] |= 1 << v32;
          v40 = (uint64_t *)(v39[6] + 16 * v32);
          *v40 = v27;
          v40[1] = v26;
          v11 = v104;
          sub_24024FB00((uint64_t)v104, v39[7] + v8[9] * v32);
          v41 = v39[2];
          v42 = __OFADD__(v41, 1);
          v43 = v41 + 1;
          if (v42)
            goto LABEL_84;
          v39[2] = v43;
          swift_bridgeObjectRetain();
          goto LABEL_4;
        }
      }
      v11 = v104;
      sub_24025CAD0((uint64_t)v104, v39[7] + v8[9] * v32);
LABEL_4:
      v23 += 2;
      v19 = v111;
      *v111 = v39;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      v24 = v109;
      sub_240231F00((uint64_t)v109);
      v22 = v110 - 1;
      if (v110 == 1)
      {
        swift_bridgeObjectRelease();
        v16 = v99;
        goto LABEL_18;
      }
    }
  }
  swift_retain();
LABEL_18:
  v44 = *(_QWORD *)(v16 + 64);
  v96 = v16 + 64;
  v45 = 1 << *(_BYTE *)(v16 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v46 = 0;
  v47 = -1;
  if (v45 < 64)
    v47 = ~(-1 << v45);
  v48 = v47 & v44;
  v97 = (unint64_t)(v45 + 63) >> 6;
  v107 = v8;
  while (1)
  {
    if (v48)
    {
      v49 = __clz(__rbit64(v48));
      v50 = (v48 - 1) & v48;
      v51 = v49 | (v46 << 6);
    }
    else
    {
      v42 = __OFADD__(v46++, 1);
      if (v42)
        goto LABEL_83;
      if (v46 >= v97)
      {
LABEL_79:
        v92 = v102;
        swift_release();
        swift_release();
        return (uint64_t)v92;
      }
      v52 = *(_QWORD *)(v96 + 8 * v46);
      if (!v52)
      {
        v53 = v46 + 1;
        if (v46 + 1 >= v97)
          goto LABEL_79;
        v52 = *(_QWORD *)(v96 + 8 * v53);
        if (!v52)
        {
          v53 = v46 + 2;
          if (v46 + 2 >= v97)
            goto LABEL_79;
          v52 = *(_QWORD *)(v96 + 8 * v53);
          if (!v52)
          {
            v53 = v46 + 3;
            if (v46 + 3 >= v97)
              goto LABEL_79;
            v52 = *(_QWORD *)(v96 + 8 * v53);
            if (!v52)
            {
              while (1)
              {
                v46 = v53 + 1;
                if (__OFADD__(v53, 1))
                  goto LABEL_85;
                if (v46 >= v97)
                  goto LABEL_79;
                v52 = *(_QWORD *)(v96 + 8 * v46);
                ++v53;
                if (v52)
                  goto LABEL_34;
              }
            }
          }
        }
        v46 = v53;
      }
LABEL_34:
      v50 = (v52 - 1) & v52;
      v51 = __clz(__rbit64(v52)) + (v46 << 6);
    }
    v54 = *(_QWORD **)(*(_QWORD *)(v16 + 56) + 8 * v51);
    if (!v54[2])
      break;
    v55 = (uint64_t *)(*(_QWORD *)(v16 + 48) + 16 * v51);
    v56 = v55[1];
    v109 = (uint64_t *)*v55;
    v57 = v54[4] == 42 && v54[5] == 0xE100000000000000;
    v104 = (char *)v46;
    v103 = v50;
    if (v57 || (sub_2402BDD8C() & 1) != 0)
    {
      v58 = *v19;
      v59 = *(_QWORD *)(*v19 + 16);
      if (v59)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2543524E0);
        v54 = (_QWORD *)swift_allocObject();
        v60 = _swift_stdlib_malloc_size(v54);
        v61 = v60 - 32;
        if (v60 < 32)
          v61 = v60 - 17;
        v54[2] = v59;
        v54[3] = 2 * (v61 >> 4);
        v110 = sub_2402BAB08((uint64_t)v112, v54 + 4, v59, v58);
        v106 = v112[1];
        v101 = (uint64_t (*)())v112[2];
        v100 = (void (*)(_QWORD *, _QWORD))v112[3];
        v98 = v112[4];
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        sub_240248E88();
        if (v110 != v59)
          goto LABEL_81;
        swift_bridgeObjectRelease();
        v19 = v111;
      }
      else
      {
        swift_bridgeObjectRetain();
        v54 = (_QWORD *)MEMORY[0x24BEE4AF8];
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRetain();
    v62 = v105;
    v63 = sub_2402BAD04((uint64_t)v54, (uint64_t)v109, v56);
    v105 = v62;
    swift_bridgeObjectRelease();
    v110 = v56;
    swift_bridgeObjectRelease();
    v106 = v63;
    v64 = *(_QWORD *)(v63 + 16);
    if (v64)
    {
      v65 = (uint64_t *)(v106 + 40);
      do
      {
        v66 = *v65;
        v67 = *v19;
        if (*(_QWORD *)(*v19 + 16))
        {
          v68 = *(v65 - 1);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v69 = sub_240258860(v68, v66);
          if ((v70 & 1) != 0)
          {
            sub_2402391FC(*(_QWORD *)(v67 + 56) + v8[9] * v69, (uint64_t)v6, &qword_256FDEC78);
            v71 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v8[7];
            v71(v6, 0, 1, v7);
          }
          else
          {
            v71 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v8[7];
            v71(v6, 1, 1, v7);
          }
          swift_bridgeObjectRelease();
          v72 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v8[6];
          if (v72((uint64_t)v6, 1, v7) != 1)
          {
            sub_24024D8E0((uint64_t)v6);
            v73 = *v111;
            if (*(_QWORD *)(*v111 + 16))
            {
              swift_bridgeObjectRetain();
              v74 = sub_240258860((uint64_t)v109, v110);
              if ((v75 & 1) != 0)
              {
                v76 = *(_QWORD *)(v73 + 56) + v8[9] * v74;
                v77 = (uint64_t)v108;
                sub_2402391FC(v76, (uint64_t)v108, &qword_256FDEC78);
                v78 = 0;
              }
              else
              {
                v78 = 1;
                v77 = (uint64_t)v108;
              }
              v71((char *)v77, v78, 1, v7);
              swift_bridgeObjectRelease();
              if (v72(v77, 1, v7) == 1)
              {
LABEL_63:
                sub_24024D8E0(v77);
              }
              else
              {
                sub_24024D8E0(v77);
                swift_bridgeObjectRetain();
                v79 = sub_24022EA40();
                v80 = sub_2402B87C4(v113, v68, v66);
                v82 = v81;
                if (!v72(v81, 1, v7))
                {
                  v101 = v79;
                  v83 = *(int *)(v7 + 52);
                  v84 = *(_QWORD **)(v82 + v83);
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  v85 = swift_isUniquelyReferenced_nonNull_native();
                  v98 = v83;
                  *(_QWORD *)(v82 + v83) = v84;
                  v8 = v107;
                  v100 = (void (*)(_QWORD *, _QWORD))v80;
                  if ((v85 & 1) == 0)
                  {
                    v84 = sub_240258060(0, v84[2] + 1, 1, v84);
                    *(_QWORD *)(v82 + v98) = v84;
                  }
                  v87 = v84[2];
                  v86 = v84[3];
                  v88 = v87 + 1;
                  if (v87 >= v86 >> 1)
                  {
                    v95 = v87 + 1;
                    v91 = sub_240258060((_QWORD *)(v86 > 1), v87 + 1, 1, v84);
                    v88 = v95;
                    v84 = v91;
                    *(_QWORD *)(v82 + v98) = v91;
                  }
                  v84[2] = v88;
                  v89 = &v84[4 * v87];
                  v89[4] = v68;
                  v89[5] = v66;
                  v90 = v110;
                  v19 = v111;
                  v89[6] = v109;
                  v89[7] = v90;
                  v100(v113, 0);
                  swift_bridgeObjectRelease();
                  ((void (*)(_QWORD *, _QWORD))v101)(v112, 0);
                  goto LABEL_68;
                }
                ((void (*)(_QWORD *, _QWORD))v80)(v113, 0);
                swift_bridgeObjectRelease();
                ((void (*)(_QWORD *, _QWORD))v79)(v112, 0);
              }
              v8 = v107;
              goto LABEL_67;
            }
            v77 = (uint64_t)v108;
            v71(v108, 1, 1, v7);
            goto LABEL_63;
          }
        }
        else
        {
          ((void (*)(char *, uint64_t, uint64_t, uint64_t))v8[7])(v6, 1, 1, v7);
          swift_bridgeObjectRetain();
        }
        sub_24024D8E0((uint64_t)v6);
LABEL_67:
        v19 = v111;
LABEL_68:
        v65 += 2;
        swift_bridgeObjectRelease();
        --v64;
      }
      while (v64);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v16 = v99;
    v46 = (uint64_t)v104;
    v48 = v103;
  }
  __break(1u);
LABEL_81:
  __break(1u);
LABEL_82:
  __break(1u);
LABEL_83:
  __break(1u);
LABEL_84:
  __break(1u);
LABEL_85:
  __break(1u);
LABEL_86:
  result = sub_2402BDDC8();
  __break(1u);
  return result;
}

uint64_t sub_2402BA138@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_240258860(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v17 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_24025A904();
      v11 = v17;
    }
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 56);
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDEC78);
    v14 = *(_QWORD *)(v13 - 8);
    sub_24024FB00(v12 + *(_QWORD *)(v14 + 72) * v8, a3);
    sub_2402BA268(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a3, 0, 1, v13);
  }
  else
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDEC78);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a3, 1, 1, v16);
  }
}

unint64_t sub_2402BA268(unint64_t result, uint64_t a2)
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
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_2402BDA50();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      while (1)
      {
        sub_2402BDE04();
        swift_bridgeObjectRetain();
        sub_2402BD6A8();
        v9 = sub_2402BDE34();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v10 < v8)
          goto LABEL_11;
LABEL_12:
        v11 = *(_QWORD *)(a2 + 48);
        v12 = (_OWORD *)(v11 + 16 * v3);
        v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1)
          *v12 = *v13;
        v14 = *(_QWORD *)(a2 + 56);
        v15 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256FDEC78) - 8) + 72);
        v16 = v15 * v3;
        result = v14 + v15 * v3;
        v17 = v15 * v6;
        v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v16 == v17)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v10 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v10)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void (*sub_2402BA474(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  _QWORD *v6;
  char isUniquelyReferenced_nonNull_native;

  v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_2402BA738(v6);
  v6[10] = sub_2402BA554(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_2402BA504;
}

void sub_2402BA504(uint64_t a1)
{
  void *v1;
  void (*v2)(void *, _QWORD);

  v1 = *(void **)a1;
  v2 = *(void (**)(void *, _QWORD))(*(_QWORD *)a1 + 72);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 80))(*(_QWORD *)a1 + 32, 0);
  swift_bridgeObjectRelease();
  v2(v1, 0);
  free(v1);
}

void (*sub_2402BA554(_QWORD *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  void (*result)(uint64_t **);

  v5 = v4;
  v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[1] = a3;
  v10[2] = v4;
  *v10 = a2;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDEC70);
  v12 = malloc(*(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  v10[3] = v12;
  v13 = *v4;
  v15 = sub_240258860(a2, a3);
  *((_BYTE *)v10 + 40) = v14 & 1;
  v16 = *(_QWORD *)(v13 + 16);
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
  }
  else
  {
    v19 = v14;
    v20 = *(_QWORD *)(v13 + 24);
    if (v20 >= v18 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v15;
      if ((v19 & 1) != 0)
      {
LABEL_8:
        v21 = *(_QWORD *)(*v5 + 56);
        v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDEC78);
        v23 = *(_QWORD *)(v22 - 8);
        sub_24024FB00(v21 + *(_QWORD *)(v23 + 72) * v15, (uint64_t)v12);
        v24 = 0;
LABEL_12:
        (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v12, v24, 1, v22);
        return sub_2402BA6F0;
      }
LABEL_11:
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDEC78);
      v23 = *(_QWORD *)(v22 - 8);
      v24 = 1;
      goto LABEL_12;
    }
    if (v20 >= v18 && (a4 & 1) == 0)
    {
      sub_24025A904();
      goto LABEL_7;
    }
    sub_240258AA0(v18, a4 & 1);
    v25 = sub_240258860(a2, a3);
    if ((v19 & 1) == (v26 & 1))
    {
      v15 = v25;
      v10[4] = v25;
      if ((v19 & 1) != 0)
        goto LABEL_8;
      goto LABEL_11;
    }
  }
  result = (void (*)(uint64_t **))sub_2402BDDC8();
  __break(1u);
  return result;
}

void sub_2402BA6F0(uint64_t **a1)
{
  uint64_t *v1;
  void *v2;

  v1 = *a1;
  v2 = (void *)(*a1)[3];
  sub_2402BA764((uint64_t)v2, *((_BYTE *)*a1 + 40), (uint64_t *)(*a1)[2], (*a1)[4], **a1, (*a1)[1]);
  sub_24024D8E0((uint64_t)v2);
  free(v2);
  free(v1);
}

uint64_t (*sub_2402BA738(_QWORD *a1))(uint64_t result)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_2402BA758;
}

uint64_t sub_2402BA758(uint64_t result)
{
  **(_QWORD **)(result + 8) = *(_QWORD *)result;
  return result;
}

unint64_t sub_2402BA764(uint64_t a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  unint64_t result;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;

  v22 = a5;
  v23 = a6;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDEC70);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDEC78);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v22 - v18;
  sub_2402391FC(a1, (uint64_t)v12, &qword_256FDEC70);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    result = sub_24024D8E0((uint64_t)v12);
    if ((a2 & 1) != 0)
    {
      swift_arrayDestroy();
      return sub_2402BA268(a4, *a3);
    }
  }
  else
  {
    sub_24024FB00((uint64_t)v12, (uint64_t)v19);
    v21 = (_QWORD *)*a3;
    if ((a2 & 1) != 0)
    {
      return sub_24024FB00((uint64_t)v19, v21[7] + *(_QWORD *)(v14 + 72) * a4);
    }
    else
    {
      sub_24024FB00((uint64_t)v19, (uint64_t)v17);
      sub_24025A72C(a4, v22, v23, (uint64_t)v17, v21);
      return swift_bridgeObjectRetain();
    }
  }
  return result;
}

uint64_t sub_2402BA908(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
LABEL_38:
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
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
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

uint64_t sub_2402BAB08(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
    v10 = 0;
LABEL_38:
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
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
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

uint64_t sub_2402BAD04(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t *i;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;

  v3 = *(_QWORD *)(result + 16);
  if (!v3)
    return MEMORY[0x24BEE4AF8];
  v6 = 0;
  v7 = result + 40;
  v8 = -(uint64_t)v3;
  v9 = MEMORY[0x24BEE4AF8];
  v19 = result + 40;
  do
  {
    if (v6 <= v3)
      v10 = v3;
    else
      v10 = v6;
    v11 = -(uint64_t)v10;
    for (i = (uint64_t *)(v7 + 16 * v6++); ; i += 2)
    {
      if (v11 + v6 == 1)
      {
        __break(1u);
        return result;
      }
      v13 = *(i - 1);
      v14 = *i;
      if (v13 != a2 || v14 != a3)
      {
        result = sub_2402BDD8C();
        if ((result & 1) == 0)
          break;
      }
      ++v6;
      if (v8 + v6 == 1)
        return v9;
    }
    swift_bridgeObjectRetain();
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
      result = sub_24029BDAC(0, *(_QWORD *)(v9 + 16) + 1, 1);
    v17 = *(_QWORD *)(v9 + 16);
    v16 = *(_QWORD *)(v9 + 24);
    if (v17 >= v16 >> 1)
      result = sub_24029BDAC(v16 > 1, v17 + 1, 1);
    *(_QWORD *)(v9 + 16) = v17 + 1;
    v18 = v9 + 16 * v17;
    *(_QWORD *)(v18 + 32) = v13;
    *(_QWORD *)(v18 + 40) = v14;
    v3 = v20;
    v7 = v19;
  }
  while (v8 + v6);
  return v9;
}

unint64_t sub_2402BAE70(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_2402B960C();
  a1[2] = sub_2402B92CC();
  result = sub_2402BAEA4();
  a1[3] = result;
  return result;
}

unint64_t sub_2402BAEA4()
{
  unint64_t result;

  result = qword_256FE15F8;
  if (!qword_256FE15F8)
  {
    result = MEMORY[0x2426820F8](&protocol conformance descriptor for LedgerStateDefinition, &type metadata for LedgerStateDefinition);
    atomic_store(result, (unint64_t *)&qword_256FE15F8);
  }
  return result;
}

unint64_t sub_2402BAEEC()
{
  unint64_t result;

  result = qword_256FE1600;
  if (!qword_256FE1600)
  {
    result = MEMORY[0x2426820F8](&protocol conformance descriptor for LedgerStateDefinition, &type metadata for LedgerStateDefinition);
    atomic_store(result, (unint64_t *)&qword_256FE1600);
  }
  return result;
}

ValueMetadata *type metadata accessor for LedgerStateDefinition()
{
  return &type metadata for LedgerStateDefinition;
}

uint64_t destroy for LedgerRecipe()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for LedgerRecipe(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for LedgerRecipe(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for LedgerRecipe(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for LedgerRecipe()
{
  return &type metadata for LedgerRecipe;
}

uint64_t storeEnumTagSinglePayload for LedgerRecipe.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2402BB0E8 + 4 * byte_2402C8675[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2402BB11C + 4 * byte_2402C8670[v4]))();
}

uint64_t sub_2402BB11C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2402BB124(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2402BB12CLL);
  return result;
}

uint64_t sub_2402BB138(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2402BB140);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2402BB144(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2402BB14C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LedgerRecipe.CodingKeys()
{
  return &type metadata for LedgerRecipe.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for LedgerStateDefinition.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2402BB1A8 + 4 * byte_2402C867A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2402BB1C8 + 4 * byte_2402C867F[v4]))();
}

_BYTE *sub_2402BB1A8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2402BB1C8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2402BB1D0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2402BB1D8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2402BB1E0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2402BB1E8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for LedgerStateDefinition.CodingKeys()
{
  return &type metadata for LedgerStateDefinition.CodingKeys;
}

unint64_t sub_2402BB208()
{
  unint64_t result;

  result = qword_256FE1608;
  if (!qword_256FE1608)
  {
    result = MEMORY[0x2426820F8](&unk_2402C8880, &type metadata for LedgerStateDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256FE1608);
  }
  return result;
}

unint64_t sub_2402BB250()
{
  unint64_t result;

  result = qword_256FE1610;
  if (!qword_256FE1610)
  {
    result = MEMORY[0x2426820F8](&unk_2402C8938, &type metadata for LedgerRecipe.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256FE1610);
  }
  return result;
}

unint64_t sub_2402BB298()
{
  unint64_t result;

  result = qword_256FE1618;
  if (!qword_256FE1618)
  {
    result = MEMORY[0x2426820F8](&unk_2402C88A8, &type metadata for LedgerRecipe.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256FE1618);
  }
  return result;
}

unint64_t sub_2402BB2E0()
{
  unint64_t result;

  result = qword_256FE1620;
  if (!qword_256FE1620)
  {
    result = MEMORY[0x2426820F8](&unk_2402C88D0, &type metadata for LedgerRecipe.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256FE1620);
  }
  return result;
}

unint64_t sub_2402BB328()
{
  unint64_t result;

  result = qword_256FE1628;
  if (!qword_256FE1628)
  {
    result = MEMORY[0x2426820F8](&unk_2402C87F0, &type metadata for LedgerStateDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256FE1628);
  }
  return result;
}

unint64_t sub_2402BB370()
{
  unint64_t result;

  result = qword_256FE1630;
  if (!qword_256FE1630)
  {
    result = MEMORY[0x2426820F8](&unk_2402C8818, &type metadata for LedgerStateDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256FE1630);
  }
  return result;
}

uint64_t sub_2402BB3B4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x7463656A6F7270 && a2 == 0xE700000000000000;
  if (v2 || (sub_2402BDD8C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73746E657665 && a2 == 0xE600000000000000 || (sub_2402BDD8C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x697469736E617274 && a2 == 0xEB00000000736E6FLL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_2402BDD8C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

id XPCActivityCriteria.getSystemTaskRequest(identifier:)()
{
  __int128 *v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  id v11;
  double v12;
  id v13;
  void *v14;
  id v15;
  id result;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _OWORD v33[2];

  v1 = v0[11];
  v31 = v0[10];
  v32 = v1;
  v33[0] = v0[12];
  *(_OWORD *)((char *)v33 + 12) = *(__int128 *)((char *)v0 + 204);
  v2 = v0[7];
  v27 = v0[6];
  v28 = v2;
  v3 = v0[9];
  v29 = v0[8];
  v30 = v3;
  v4 = v0[3];
  v23 = v0[2];
  v24 = v4;
  v5 = v0[5];
  v25 = v0[4];
  v26 = v5;
  v6 = v0[1];
  v21 = *v0;
  v22 = v6;
  if ((BYTE8(v21) & 1) == 0)
  {
    v7 = objc_allocWithZone(MEMORY[0x24BE0B710]);
    swift_bridgeObjectRetain();
    v8 = (void *)sub_2402BD63C();
    swift_bridgeObjectRelease();
    v9 = objc_msgSend(v7, sel_initWithIdentifier_, v8);

    v20 = v9;
    if (BYTE8(v22))
      v10 = 0.0;
    else
      v10 = (double)(uint64_t)v22;
    v11 = v9;
    objc_msgSend(v11, sel_setScheduleAfter_, v10);
    v12 = (double)(uint64_t)v23;
    if (BYTE8(v23))
      v12 = 0.0;
    objc_msgSend(v11, sel_setTrySchedulingBefore_, v12);

    sub_2402BB708(&v20);
    return v11;
  }
  v13 = objc_allocWithZone(MEMORY[0x24BE0B718]);
  swift_bridgeObjectRetain();
  v14 = (void *)sub_2402BD63C();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v13, sel_initWithIdentifier_, v14);

  v20 = v15;
  v11 = v15;
  result = objc_msgSend(v11, sel_setInterval_, (double)(uint64_t)v21);
  v17 = v23;
  if (BYTE8(v23))
    v17 = 0;
  v18 = __OFSUB__((_QWORD)v21, v17);
  v19 = v21 - v17;
  if (!v18)
  {
    objc_msgSend(v11, sel_setMinDurationBetweenInstances_, (double)v19);

    sub_2402BB708(&v20);
    return v11;
  }
  __break(1u);
  return result;
}

void sub_2402BB708(void **a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  double v12;
  char v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  double v47;
  char v48;
  char v49;
  void *v50;
  void *v51;
  char v52;
  char v53;
  char v54;
  _BYTE v55[8];
  _BYTE v56[13];
  char v57;
  char v58;
  char v59;
  char v60;
  char v61;
  char v62;
  char v63;
  char v64;
  char v65;
  char v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  char v70;

  v2 = *a1;
  v3 = *(_BYTE *)(v1 + 174) & 1;
  sub_240238F2C(v1 + 41, (uint64_t)&v61, &qword_2543521E0);
  sub_240238F2C(v1 + 42, (uint64_t)&v60, &qword_254352240);
  objc_msgSend(v2, sel_setRequiresNetworkConnectivity_, v3);
  sub_240238F2C((uint64_t)&v60, (uint64_t)&v64, &qword_254352240);
  if (v64 == 2)
  {
    sub_240238F2C((uint64_t)&v61, (uint64_t)&v63, &qword_2543521E0);
    v4 = v63 == 2 || (v63 & 1) == 0;
  }
  else
  {
    v4 = (v64 & 1) == 0;
  }
  objc_msgSend(v2, sel_setRequiresExternalPower_, v4);
  sub_240238F2C((uint64_t)&v61, (uint64_t)&v62, &qword_2543521E0);
  v5 = 1;
  if ((v62 & 1) != 0)
    v5 = 2;
  if (v62 == 2)
    v6 = 0;
  else
    v6 = v5;
  sub_240238F2C(v1 + 170, (uint64_t)&v59, &qword_254352240);
  objc_msgSend(v2, sel_setPriority_, v6);
  sub_240238F2C((uint64_t)&v59, (uint64_t)&v65, &qword_254352240);
  if ((v65 & 1) != 0)
  {
    v7 = 3;
  }
  else
  {
    sub_240238F2C(v1 + 171, (uint64_t)&v58, &qword_254352240);
    sub_240238F2C((uint64_t)&v58, (uint64_t)&v66, &qword_254352240);
    if ((v66 & 1) != 0)
    {
      v7 = 2;
    }
    else
    {
      sub_240238F2C(v1 + 172, (uint64_t)&v57, &qword_254352240);
      sub_240238F2C((uint64_t)&v57, (uint64_t)&v67, &qword_254352240);
      v7 = v67 & 1;
    }
  }
  v8 = *(_BYTE *)(v1 + 44);
  objc_msgSend(v2, sel_setRequiresProtectionClass_, v7);
  v9 = v8 & 1;
  v10 = *(unsigned __int8 *)(v1 + 136);
  v11 = *(_QWORD *)(v1 + 128);
  objc_msgSend(v2, sel_setPreventsDeviceSleep_, v9);
  v12 = (double)v11;
  v13 = *(_BYTE *)(v1 + 169);
  if (v10)
    v12 = 0.0;
  objc_msgSend(v2, sel_setRandomInitialDelay_, v12);
  v14 = *(_BYTE *)(v1 + 175);
  objc_msgSend(v2, sel_setPostInstall_, v13 & 1);
  v15 = v14 & 1;
  v16 = *(_BYTE *)(v1 + 46);
  objc_msgSend(v2, sel_setRequiresInexpensiveNetworkConnectivity_, v15);
  v17 = v16 & 1;
  v18 = *(_BYTE *)(v1 + 43);
  objc_msgSend(v2, sel_setAppRefresh_, v17);
  v19 = v18 & 1;
  v20 = *(_BYTE *)(v1 + 48);
  objc_msgSend(v2, sel_setRequiresUserInactivity_, v19);
  v21 = v20 & 1;
  v22 = *(_BYTE *)(v1 + 45);
  objc_msgSend(v2, sel_setRequiresSignificantUserInactivity_, v21);
  v23 = v22 & 1;
  v24 = *(_BYTE *)(v1 + 122);
  objc_msgSend(v2, sel_setPowerNap_, v23);
  if ((v24 & 1) != 0 || (*(_BYTE *)(v1 + 121) & 1) != 0)
    v25 = 1;
  else
    v25 = *(_BYTE *)(v1 + 123) & 1;
  v26 = *(_BYTE *)(v1 + 49);
  objc_msgSend(v2, sel_setResourceIntensive_, v25);
  v27 = v26 & 1;
  v28 = *(_BYTE *)(v1 + 217);
  objc_msgSend(v2, sel_setMayRebootDevice_, v27);
  v29 = v28 & 1;
  v30 = *(_QWORD *)(v1 + 176);
  v31 = *(unsigned __int8 *)(v1 + 184);
  objc_msgSend(v2, sel_setUserRequestedBackupTask_, v29);
  if (v31)
    v32 = 0;
  else
    v32 = v30;
  if (v32 < 0)
  {
    __break(1u);
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
    return;
  }
  v33 = *(unsigned __int8 *)(v1 + 200);
  v34 = *(_QWORD *)(v1 + 192);
  objc_msgSend(v2, sel_setNetworkDownloadSize_);
  if (v33)
    v35 = 0;
  else
    v35 = v34;
  if (v35 < 0)
    goto LABEL_47;
  v36 = *(_BYTE *)(v1 + 218);
  objc_msgSend(v2, sel_setNetworkUploadSize_);
  v37 = v36 & 1;
  v38 = *(_BYTE *)(v1 + 47);
  objc_msgSend(v2, sel_setCommunicatesWithPairedDevice_, v37);
  v39 = v38 & 1;
  v40 = *(_QWORD *)(v1 + 152);
  objc_msgSend(v2, sel_setShouldWakeDevice_, v39);
  if (v40)
  {
    swift_bridgeObjectRetain();
    v41 = (void *)sub_2402BD63C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v41 = 0;
  }
  v42 = *(_QWORD *)(v1 + 160);
  v43 = *(unsigned __int8 *)(v1 + 168);
  objc_msgSend(v2, sel_setGroupName_, v41);

  if (v43)
    v44 = 1;
  else
    v44 = v42;
  if (v44 < 0)
    goto LABEL_48;
  v45 = *(unsigned __int8 *)(v1 + 216);
  v46 = *(_QWORD *)(v1 + 208);
  objc_msgSend(v2, sel_setGroupConcurrencyLimit_);
  v47 = (double)v46;
  v48 = *(_BYTE *)(v1 + 50);
  if (v45)
    v47 = 0.0;
  objc_msgSend(v2, sel_setExpectedDuration_, v47);
  v49 = *(_BYTE *)(v1 + 51);
  objc_msgSend(v2, sel_setPowerBudgeted_, v48 & 1);
  sub_240238F2C(v1 + 72, (uint64_t)v56, &qword_254352238);
  objc_msgSend(v2, sel_setDataBudgeted_, v49 & 1);
  sub_240238F2C((uint64_t)v56, (uint64_t)&v68, &qword_254352238);
  if (v68)
    v50 = (void *)sub_2402BD798();
  else
    v50 = 0;
  sub_240238F2C(v1 + 80, (uint64_t)v55, &qword_254352238);
  objc_msgSend(v2, sel_setRelatedApplications_, v50);

  sub_240238F2C((uint64_t)v55, (uint64_t)&v69, &qword_254352238);
  if (v69)
    v51 = (void *)sub_2402BD798();
  else
    v51 = 0;
  v52 = *(_BYTE *)(v1 + 88);
  objc_msgSend(v2, sel_setInvolvedProcesses_, v51);

  v53 = *(_BYTE *)(v1 + 173);
  objc_msgSend(v2, sel_setRunOnAppForeground_, v52 & 1);
  sub_240238F2C(v1 + 219, (uint64_t)&v54, &qword_254352208);
  objc_msgSend(v2, sel_setRequiresBuddyComplete_, v53 & 1);
  sub_240238F2C((uint64_t)&v54, (uint64_t)&v70, &qword_254352208);
  objc_msgSend(v2, sel_setRunOnMotionState_, qword_2402C8A00[v70]);
}

uint64_t sub_2402BBC80(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v14[2];
  uint64_t v15;
  __int128 v16;
  _QWORD v17[7];

  v17[5] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v16 = a1;
  *((_QWORD *)&v16 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254352678);
  if (!swift_dynamicCast())
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_2402BC950((uint64_t)v14);
    if ((a2 & 0x1000000000000000) != 0)
      goto LABEL_20;
    if ((a2 & 0x2000000000000000) != 0)
    {
      v17[0] = a1;
      v17[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      v4 = (char *)v17 + (HIBYTE(a2) & 0xF);
      v5 = v17;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        v2 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v3 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v2 = sub_2402BDAEC();
      }
      if (v2)
        v4 = (_BYTE *)(v2 + v3);
      else
        v4 = 0;
      v5 = (_BYTE *)v2;
    }
    v6 = sub_2402BD0BC(v5, v4);
    v8 = v7;
    if (v7 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(_QWORD *)&v14[0] = v6;
      *((_QWORD *)&v14[0] + 1) = v8;
      return *(_QWORD *)&v14[0];
    }
    if ((a2 & 0x1000000000000000) != 0)
    {
LABEL_20:
      v9 = sub_2402BD6D8();
    }
    else if ((a2 & 0x2000000000000000) != 0)
    {
      v9 = HIBYTE(a2) & 0xF;
    }
    else
    {
      v9 = a1 & 0xFFFFFFFFFFFFLL;
    }
    *(_QWORD *)&v14[0] = sub_2402BD120(v9);
    *((_QWORD *)&v14[0] + 1) = v10;
    MEMORY[0x24BDAC7A8](*(_QWORD *)&v14[0]);
    sub_2402BCA08();
    __asm { BR              X12 }
  }
  sub_240272CD8(v14, (uint64_t)v17);
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  sub_2402BD354();
  swift_bridgeObjectRelease();
  v14[0] = v16;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return *(_QWORD *)&v14[0];
}

double defaultStreamMaxAge.getter()
{
  return 5184000.0;
}

uint64_t defaultStreamMaxSize.getter()
{
  return 0x200000;
}

id getDefaultStorageConfig(basePath:)()
{
  void *v0;
  void *v1;
  id v2;
  id v3;

  v0 = (void *)objc_opt_self();
  v1 = (void *)sub_2402BD63C();
  v2 = objc_msgSend(v0, sel_newPrivateStreamDefaultConfigurationWithStoreBasePath_, v1);

  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C9B8]), sel_initPruneOnAccess_filterByAgeOnRead_maxAge_maxStreamSize_, 1, 1, 0x200000, 5184000.0);
  objc_msgSend(v2, sel_setPruningPolicy_, v3);

  return v2;
}

void getStorageStream(stream:basePath:)(unsigned __int8 *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  id v5;

  v1 = *a1;
  v2 = (void *)objc_opt_self();
  v3 = (void *)sub_2402BD63C();
  v4 = objc_msgSend(v2, sel_newPrivateStreamDefaultConfigurationWithStoreBasePath_, v3);

  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C9B8]), sel_initPruneOnAccess_filterByAgeOnRead_maxAge_maxStreamSize_, 1, 1, 0x200000, 5184000.0);
  objc_msgSend(v4, sel_setPruningPolicy_, v5);

  __asm { BR              X9 }
}

id sub_2402BC320()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  id v4;

  type metadata accessor for LHStoreItem();
  v1 = objc_allocWithZone(MEMORY[0x24BE0CD88]);
  v2 = v0;
  v3 = (void *)sub_2402BD63C();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v1, sel_initWithPrivateStreamIdentifier_storeConfig_eventDataClass_, v3, v2, swift_getObjCClassFromMetadata());

  return v4;
}

uint64_t createStorageItem<A>(payload:)(uint64_t a1, uint64_t a2, uint64_t (**a3)(_QWORD, id))
{
  uint64_t v3;
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
  uint64_t v16;
  uint64_t (**v17)(_QWORD, id);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  objc_class *v33;
  char *v34;
  uint64_t *v35;
  char *v36;
  _QWORD v37[2];
  uint64_t (**v38)(_QWORD, id);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  objc_super v44;

  v42 = a1;
  v38 = a3;
  v39 = a2;
  v3 = sub_2402BD66C();
  MEMORY[0x24BDAC7A8](v3);
  v37[1] = (char *)v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2402BD48C();
  v40 = *(_QWORD *)(v5 - 8);
  v41 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2402BD2AC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2402BD2B8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2402BD2F4();
  swift_allocObject();
  sub_2402BD2E8();
  v16 = v12;
  v17 = v38;
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BDCB358], v16);
  v18 = v39;
  sub_2402BD2D0();
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BDCB320], v8);
  sub_2402BD2C4();
  sub_2402BD480();
  sub_2402BD408();
  v20 = v19;
  (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v41);
  v21 = v43;
  v22 = sub_2402BD2DC();
  if (v21)
  {
    swift_release();
    return (uint64_t)v17;
  }
  v24 = v22;
  v25 = v23;
  sub_2402BD660();
  result = sub_2402BD654();
  if (v27)
  {
    v28 = result;
    v29 = v27;
    v30 = v17[6](v18, v17);
    v32 = v31;
    v33 = (objc_class *)type metadata accessor for LHStoreItem();
    v34 = (char *)objc_allocWithZone(v33);
    *(_DWORD *)&v34[OBJC_IVAR____TtC20LighthouseBackground11LHStoreItem_dataVersion] = 1;
    *(_QWORD *)&v34[OBJC_IVAR____TtC20LighthouseBackground11LHStoreItem_messageTimestamp] = v20;
    v35 = (uint64_t *)&v34[OBJC_IVAR____TtC20LighthouseBackground11LHStoreItem_messageType];
    *v35 = v30;
    v35[1] = v32;
    v36 = &v34[OBJC_IVAR____TtC20LighthouseBackground11LHStoreItem_messagePayload];
    *(_QWORD *)v36 = v28;
    *((_QWORD *)v36 + 1) = v29;
    v44.receiver = v34;
    v44.super_class = v33;
    v17 = (uint64_t (**)(_QWORD, id))objc_msgSendSuper2(&v44, sel_init);
    sub_24027F72C(v24, v25);
    swift_release();
    return (uint64_t)v17;
  }
  __break(1u);
  return result;
}

uint64_t parseStorageItem<A>(item:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  char v20;
  _BYTE *v21;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = a4;
  v7 = sub_2402BD234();
  v29 = *(_QWORD *)(v7 - 8);
  v30 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2402BD240();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = a1;
  v14 = (uint64_t *)(a1 + OBJC_IVAR____TtC20LighthouseBackground11LHStoreItem_messageType);
  swift_beginAccess();
  v16 = *v14;
  v15 = v14[1];
  v17 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 48);
  swift_bridgeObjectRetain();
  if (v16 == v17(a2, a3) && v15 == v18)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v20 = sub_2402BDD8C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0)
    {
      sub_24027F6A4();
      swift_allocError();
      *v21 = 1;
      return swift_willThrow();
    }
  }
  sub_2402BD27C();
  swift_allocObject();
  sub_2402BD270();
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x24BDCB1D8], v10);
  sub_2402BD258();
  (*(void (**)(char *, _QWORD, uint64_t))(v29 + 104))(v9, *MEMORY[0x24BDCB1B8], v30);
  sub_2402BD24C();
  v23 = (uint64_t *)(v31 + OBJC_IVAR____TtC20LighthouseBackground11LHStoreItem_messagePayload);
  swift_beginAccess();
  v25 = *v23;
  v24 = v23[1];
  swift_bridgeObjectRetain();
  v26 = sub_2402BBC80(v25, v24);
  v28 = v27;
  sub_2402BD264();
  sub_24027F72C(v26, v28);
  return swift_release();
}

uint64_t sub_2402BC950(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254352680);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2402BC990(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_2402BD708();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x2426814BC](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

void sub_2402BCA08()
{
  __asm { BR              X11 }
}

_QWORD *sub_2402BCA68@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(_QWORD **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  _QWORD *result;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  v10 = BYTE4(a1);
  v11 = BYTE5(a1);
  v12 = BYTE6(a1);
  result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2)
    result = v7;
  v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  *v1 = v8;
  v1[1] = v6;
  return result;
}

_BYTE *sub_2402BCCF8@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
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
    result = (_BYTE *)sub_2402BCF04(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_2402BCFC4((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_2402BD03C((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

_QWORD *sub_2402BCD6C(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a3)
  {
    result = a1(&v6, a3, a4 - a3);
    if (v4)
      return result;
    return (_QWORD *)v6;
  }
  result = a1(&v6, 0, 0);
  if (!v4)
    return (_QWORD *)v6;
  return result;
}

char *sub_2402BCDD0(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = (char *)sub_2402BD318();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)sub_2402BD33C();
  v9 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = sub_2402BD330();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

uint64_t sub_2402BCE7C@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  char v3;
  uint64_t v4;

  if (result)
  {
    swift_bridgeObjectRetain();
    result = sub_2402BDAA4();
    if ((v3 & 1) == 0)
    {
      v4 = result;
      result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2402BCF04(_BYTE *__src, _BYTE *a2)
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

uint64_t sub_2402BCFC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_2402BD348();
  swift_allocObject();
  result = sub_2402BD30C();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_2402BD3C0();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_2402BD03C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_2402BD348();
  swift_allocObject();
  result = sub_2402BD30C();
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

_BYTE *sub_2402BD0BC(_BYTE *result, _BYTE *a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (_BYTE *)sub_2402BCF04(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (_BYTE *)sub_2402BCFC4((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (_BYTE *)sub_2402BD03C((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_2402BD120(uint64_t result)
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
      sub_2402BD348();
      swift_allocObject();
      sub_2402BD324();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_2402BD3C0();
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

_QWORD *sub_2402BD1BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[2];

  v5 = *(uint64_t **)(v3 + 16);
  v7 = *v5;
  v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  result = sub_2402BCD6C((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_2402BD218, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_2402BD218@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2402BCE7C(a1, a2);
}

uint64_t sub_2402BD234()
{
  return MEMORY[0x24BDCB1C0]();
}

uint64_t sub_2402BD240()
{
  return MEMORY[0x24BDCB1E0]();
}

uint64_t sub_2402BD24C()
{
  return MEMORY[0x24BDCB1E8]();
}

uint64_t sub_2402BD258()
{
  return MEMORY[0x24BDCB1F0]();
}

uint64_t sub_2402BD264()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_2402BD270()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_2402BD27C()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_2402BD288()
{
  return MEMORY[0x24BDCB290]();
}

uint64_t sub_2402BD294()
{
  return MEMORY[0x24BDCB2A8]();
}

uint64_t sub_2402BD2A0()
{
  return MEMORY[0x24BDCB2E0]();
}

uint64_t sub_2402BD2AC()
{
  return MEMORY[0x24BDCB330]();
}

uint64_t sub_2402BD2B8()
{
  return MEMORY[0x24BDCB360]();
}

uint64_t sub_2402BD2C4()
{
  return MEMORY[0x24BDCB370]();
}

uint64_t sub_2402BD2D0()
{
  return MEMORY[0x24BDCB378]();
}

uint64_t sub_2402BD2DC()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_2402BD2E8()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_2402BD2F4()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_2402BD300()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_2402BD30C()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_2402BD318()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_2402BD324()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_2402BD330()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_2402BD33C()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_2402BD348()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_2402BD354()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t sub_2402BD360()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2402BD36C()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_2402BD378()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2402BD384()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_2402BD390()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t sub_2402BD39C()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_2402BD3A8()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2402BD3B4()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_2402BD3C0()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_2402BD3CC()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_2402BD3D8()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_2402BD3E4()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2402BD3F0()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2402BD3FC()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_2402BD408()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_2402BD414()
{
  return MEMORY[0x24BDCE2D8]();
}

uint64_t sub_2402BD420()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_2402BD42C()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_2402BD438()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2402BD444()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_2402BD450()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_2402BD45C()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_2402BD468()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_2402BD474()
{
  return MEMORY[0x24BDCE8B0]();
}

uint64_t sub_2402BD480()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_2402BD48C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2402BD498()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2402BD4A4()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2402BD4B0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2402BD4BC()
{
  return MEMORY[0x24BEE7448]();
}

uint64_t sub_2402BD4C8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2402BD4D4()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2402BD4E0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2402BD4EC()
{
  return MEMORY[0x24BEE6470]();
}

uint64_t sub_2402BD4F8()
{
  return MEMORY[0x24BEE64B0]();
}

uint64_t sub_2402BD504()
{
  return MEMORY[0x24BEE64B8]();
}

uint64_t sub_2402BD510()
{
  return MEMORY[0x24BEE64C8]();
}

uint64_t sub_2402BD51C()
{
  return MEMORY[0x24BEE64D8]();
}

uint64_t sub_2402BD528()
{
  return MEMORY[0x24BEE76B0]();
}

uint64_t sub_2402BD534()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_2402BD540()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2402BD54C()
{
  return MEMORY[0x24BEE54E0]();
}

uint64_t sub_2402BD558()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2402BD564()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_2402BD570()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2402BD57C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2402BD588()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_2402BD594()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_2402BD5A0()
{
  return MEMORY[0x24BEE0300]();
}

uint64_t sub_2402BD5AC()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_2402BD5B8()
{
  return MEMORY[0x24BEE04A0]();
}

uint64_t sub_2402BD5C4()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_2402BD5D0()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_2402BD5DC()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_2402BD5E8()
{
  return MEMORY[0x24BEE75C8]();
}

uint64_t sub_2402BD5F4()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_2402BD600()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_2402BD60C()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_2402BD618()
{
  return MEMORY[0x24BEE0850]();
}

uint64_t sub_2402BD624()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2402BD630()
{
  return MEMORY[0x24BDCF880]();
}

uint64_t sub_2402BD63C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2402BD648()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2402BD654()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_2402BD660()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_2402BD66C()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_2402BD678()
{
  return MEMORY[0x24BDCFB30]();
}

uint64_t sub_2402BD684()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2402BD690()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_2402BD69C()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_2402BD6A8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2402BD6B4()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_2402BD6C0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2402BD6CC()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_2402BD6D8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2402BD6E4()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_2402BD6F0()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_2402BD6FC()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_2402BD708()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_2402BD714()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_2402BD720()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2402BD72C()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_2402BD738()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t sub_2402BD744()
{
  return MEMORY[0x24BEE0EE8]();
}

uint64_t sub_2402BD750()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_2402BD75C()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_2402BD768()
{
  return MEMORY[0x24BEE1008]();
}

uint64_t sub_2402BD774()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_2402BD780()
{
  return MEMORY[0x24BEE1088]();
}

uint64_t sub_2402BD78C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2402BD798()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2402BD7A4()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t sub_2402BD7B0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2402BD7BC()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2402BD7C8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2402BD7D4()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_2402BD7E0()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2402BD7EC()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_2402BD7F8()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2402BD804()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_2402BD810()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2402BD81C()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_2402BD828()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_2402BD834()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_2402BD840()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_2402BD84C()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_2402BD858()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t sub_2402BD864()
{
  return MEMORY[0x24BDCFC20]();
}

uint64_t sub_2402BD870()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2402BD87C()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_2402BD888()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_2402BD894()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_2402BD8A0()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2402BD8AC()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2402BD8B8()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_2402BD8C4()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_2402BD8D0()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_2402BD8DC()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_2402BD8E8()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_2402BD8F4()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_2402BD900()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_2402BD90C()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_2402BD918()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_2402BD924()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_2402BD930()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_2402BD93C()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_2402BD948()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t sub_2402BD954()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2402BD960()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2402BD96C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2402BD978()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_2402BD984()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2402BD990()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2402BD99C()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_2402BD9A8()
{
  return MEMORY[0x24BEE5930]();
}

uint64_t sub_2402BD9B4()
{
  return MEMORY[0x24BEE5948]();
}

uint64_t sub_2402BD9C0()
{
  return MEMORY[0x24BEE59A0]();
}

uint64_t sub_2402BD9CC()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_2402BD9D8()
{
  return MEMORY[0x24BDD0278]();
}

uint64_t sub_2402BD9E4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2402BD9F0()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_2402BD9FC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2402BDA08()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2402BDA14()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_2402BDA20()
{
  return MEMORY[0x24BEE2110]();
}

uint64_t sub_2402BDA2C()
{
  return MEMORY[0x24BEE2130]();
}

uint64_t sub_2402BDA38()
{
  return MEMORY[0x24BEE2148]();
}

uint64_t sub_2402BDA44()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2402BDA50()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2402BDA5C()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2402BDA68()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2402BDA74()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2402BDA80()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2402BDA8C()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_2402BDA98()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2402BDAA4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2402BDAB0()
{
  return MEMORY[0x24BEE2548]();
}

uint64_t sub_2402BDABC()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_2402BDAC8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2402BDAD4()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_2402BDAE0()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_2402BDAEC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2402BDAF8()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_2402BDB04()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_2402BDB10()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_2402BDB1C()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_2402BDB28()
{
  return MEMORY[0x24BEE2B80]();
}

uint64_t sub_2402BDB34()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2402BDB40()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2402BDB4C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2402BDB58()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2402BDB64()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2402BDB70()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2402BDB7C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2402BDB88()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2402BDB94()
{
  return MEMORY[0x24BEE30D0]();
}

uint64_t sub_2402BDBA0()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2402BDBAC()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_2402BDBB8()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_2402BDBC4()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_2402BDBD0()
{
  return MEMORY[0x24BEE32E0]();
}

uint64_t sub_2402BDBDC()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_2402BDBE8()
{
  return MEMORY[0x24BEE32F8]();
}

uint64_t sub_2402BDBF4()
{
  return MEMORY[0x24BEE3300]();
}

uint64_t sub_2402BDC00()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_2402BDC0C()
{
  return MEMORY[0x24BEE3328]();
}

uint64_t sub_2402BDC18()
{
  return MEMORY[0x24BEE3348]();
}

uint64_t sub_2402BDC24()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2402BDC30()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_2402BDC3C()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_2402BDC48()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_2402BDC54()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2402BDC60()
{
  return MEMORY[0x24BEE33A0]();
}

uint64_t sub_2402BDC6C()
{
  return MEMORY[0x24BEE33B8]();
}

uint64_t sub_2402BDC78()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_2402BDC84()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_2402BDC90()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_2402BDC9C()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_2402BDCA8()
{
  return MEMORY[0x24BEE3430]();
}

uint64_t sub_2402BDCB4()
{
  return MEMORY[0x24BEE3438]();
}

uint64_t sub_2402BDCC0()
{
  return MEMORY[0x24BEE3448]();
}

uint64_t sub_2402BDCCC()
{
  return MEMORY[0x24BEE3450]();
}

uint64_t sub_2402BDCD8()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_2402BDCE4()
{
  return MEMORY[0x24BEE3470]();
}

uint64_t sub_2402BDCF0()
{
  return MEMORY[0x24BEE3490]();
}

uint64_t sub_2402BDCFC()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2402BDD08()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_2402BDD14()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_2402BDD20()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_2402BDD2C()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2402BDD38()
{
  return MEMORY[0x24BEE34F0]();
}

uint64_t sub_2402BDD44()
{
  return MEMORY[0x24BEE3508]();
}

uint64_t sub_2402BDD50()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_2402BDD5C()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2402BDD68()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2402BDD74()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_2402BDD80()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_2402BDD8C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2402BDD98()
{
  return MEMORY[0x24BEE3BB8]();
}

uint64_t sub_2402BDDA4()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_2402BDDB0()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_2402BDDBC()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2402BDDC8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2402BDDD4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2402BDDE0()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2402BDDEC()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2402BDDF8()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2402BDE04()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2402BDE10()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2402BDE1C()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2402BDE28()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_2402BDE34()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2402BDE40()
{
  return MEMORY[0x24BEE4358]();
}

uint64_t sub_2402BDE4C()
{
  return MEMORY[0x24BEE43D0]();
}

uint64_t sub_2402BDE58()
{
  return MEMORY[0x24BEE43D8]();
}

uint64_t sub_2402BDE64()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2402BDE70()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2402BDE7C()
{
  return MEMORY[0x24BEE49E8]();
}

uint64_t sub_2402BDE88()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2402BDE94()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_2402BDEA0()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x24BDAFC10]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x24BDAFC20]();
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

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x24BEE4C88]();
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
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

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x24BDB0728]();
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x24BDB0730](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x24BDB0758]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x24BDB0788](connection);
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

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x24BDB09F8](connection);
}

