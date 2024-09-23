unint64_t ModelContext.debugDescription.getter()
{
  return 0xD000000000000016;
}

uint64_t sub_2356F38AC(uint64_t a1, uint64_t a2)
{
  return sub_2356F3A20(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_2356F38CC(uint64_t a1, uint64_t a2)
{
  return sub_2356F3A20(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_2356F38DC(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_235705D10();
  *a2 = 0;
  return result;
}

uint64_t sub_2356F3954(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_235705D1C();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2356F39D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_235705D28();
  v2 = sub_235705D04();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2356F3A14(uint64_t a1, uint64_t a2)
{
  return sub_2356F3A20(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_2356F3A20(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_235705D28();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2356F3A60()
{
  sub_235705D28();
  sub_235705D40();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2356F3AA4()
{
  uint64_t v0;

  sub_235705D28();
  sub_235705F44();
  sub_235705D40();
  v0 = sub_235705F5C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2356F3B1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_235705D28();
  v2 = v1;
  if (v0 == sub_235705D28() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_235705EFC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2356F3BA8()
{
  sub_2356F3DE4(&qword_256262948, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_235706780);
  sub_2356F3DE4(&qword_256262950, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_23570657C);
  return sub_235705EE4();
}

uint64_t sub_2356F3C30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_235705D04();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2356F3C74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_235705D28();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2356F3C9C()
{
  sub_2356F3DE4(&qword_256262938, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_2357066F0);
  sub_2356F3DE4(&qword_256262940, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_235706690);
  return sub_235705EE4();
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
  sub_2356F3D48(a1, &qword_2562628F8);
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
  sub_2356F3D48(a1, &qword_256262900);
}

void sub_2356F3D48(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2356F3D8C()
{
  return sub_2356F3DE4(&qword_256262908, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_235706540);
}

uint64_t sub_2356F3DB8()
{
  return sub_2356F3DE4(&qword_256262910, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_235706514);
}

uint64_t sub_2356F3DE4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B7D41F0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2356F3E24()
{
  return sub_2356F3DE4(&qword_256262918, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_235706654);
}

uint64_t sub_2356F3E50()
{
  return sub_2356F3DE4(&qword_256262920, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_235706628);
}

uint64_t sub_2356F3E7C()
{
  return sub_2356F3DE4(&qword_256262928, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_2357066C4);
}

uint64_t sub_2356F3EA8()
{
  return sub_2356F3DE4(&qword_256262930, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_2357065B0);
}

uint64_t sub_2356F3EDC()
{
  uint64_t result;

  sub_235705C14();
  MEMORY[0x24BDAC7A8]();
  sub_235705C2C();
  MEMORY[0x24BDAC7A8]();
  sub_235705BC0();
  sub_235705CC8();
  swift_allocObject();
  sub_235705CBC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256262958);
  sub_235705C44();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_2357067D0;
  sub_235705C20();
  sub_235705C08();
  sub_235705C50();
  result = sub_235705B90();
  qword_256264650 = result;
  return result;
}

uint64_t sub_2356F406C()
{
  uint64_t result;

  if (qword_2562628D8 != -1)
    swift_once();
  sub_235705B54();
  swift_allocObject();
  swift_retain();
  result = sub_235705B60();
  qword_256264658 = result;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7D41D8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t AppStorage.init<A>(wrappedValue:_:store:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v8 = sub_235705C74();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  v12 = sub_2356F4214(&qword_256262960, MEMORY[0x24BDEAAE0]);
  v13 = sub_2356F4214(&qword_256262968, MEMORY[0x24BDEAAC0]);
  v14 = MEMORY[0x23B7D3830](v11, a2, a3, a4, v8, v12, v13);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  return v14;
}

uint64_t sub_2356F4214(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_235705C74();
    result = MEMORY[0x23B7D41F0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t AppStorage.init<A>(_:store:)()
{
  sub_235705C74();
  sub_2356F4214(&qword_256262960, MEMORY[0x24BDEAAE0]);
  sub_2356F4214(&qword_256262968, MEMORY[0x24BDEAAC0]);
  return sub_23570592C();
}

uint64_t SceneStorage.init<A>(wrappedValue:_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_235705C74();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_2356F43C4(&qword_256262960, MEMORY[0x24BDEAAE0]);
  sub_2356F43C4(&qword_256262968, MEMORY[0x24BDEAAC0]);
  sub_23570595C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t sub_2356F43C4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_235705C74();
    result = MEMORY[0x23B7D41F0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t SceneStorage.init<A>(_:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256262970);
  sub_2356F44FC(&qword_256262978, &qword_256262960, MEMORY[0x24BDEAAE0], MEMORY[0x24BEE4AC0]);
  sub_2356F44FC(&qword_256262980, &qword_256262968, MEMORY[0x24BDEAAC0], MEMORY[0x24BEE4AA8]);
  sub_2356F4578();
  return sub_235705968();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7D41E4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2356F44FC(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256262970);
    v10 = sub_2356F43C4(a2, a3);
    result = MEMORY[0x23B7D41F0](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2356F4578()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256262988;
  if (!qword_256262988)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256262970);
    result = MEMORY[0x23B7D41F0](MEMORY[0x24BEE4AC8], v1);
    atomic_store(result, (unint64_t *)&qword_256262988);
  }
  return result;
}

uint64_t View.modelContext(_:)()
{
  swift_getKeyPath();
  swift_retain();
  sub_235705A7C();
  swift_release();
  return swift_release();
}

uint64_t sub_2356F4648@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  sub_2356F48CC();
  result = sub_235705A4C();
  *a1 = v3;
  return result;
}

uint64_t sub_2356F4694@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  sub_2356F48CC();
  result = sub_235705A4C();
  *a1 = v3;
  return result;
}

uint64_t sub_2356F46E0()
{
  sub_2356F48CC();
  swift_retain();
  return sub_235705A58();
}

uint64_t Scene.modelContext(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD v8[2];

  v8[0] = swift_getKeyPath();
  v8[1] = a1;
  swift_retain();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262990);
  MEMORY[0x23B7D39B0](v8, a2, v6, a3);
  swift_release();
  return swift_release();
}

uint64_t sub_2356F47D0(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVy0A4Data12ModelContextCSgGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(a1, &qword_256262998, MEMORY[0x24BDF1028], MEMORY[0x24BDED308]);
}

uint64_t sub_2356F47EC(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVy0A4Data12ModelContextCSgGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(a1, &qword_2562629A0, MEMORY[0x24BDF1030], MEMORY[0x24BDED310]);
}

uint64_t get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVy0A4Data12ModelContextCSgGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v7 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256262990);
  v8 = sub_2357059E0();
  v10[0] = v7;
  v10[1] = sub_2356F4888(a2, a3);
  return MEMORY[0x23B7D41F0](a4, v8, v10);
}

uint64_t sub_2356F4888(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256262990);
    result = MEMORY[0x23B7D41F0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2356F48CC()
{
  unint64_t result;

  result = qword_2562629A8[0];
  if (!qword_2562629A8[0])
  {
    result = MEMORY[0x23B7D41F0](&unk_23570741C, &type metadata for ModelContextEnvironmentKey);
    atomic_store(result, qword_2562629A8);
  }
  return result;
}

uint64_t sub_2356F4910(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (uint64_t *)(v1 + *(int *)(a1 + 48));
  v3 = *v2;
  v4 = *((unsigned __int8 *)v2 + 8);
  j__swift_retain(*v2, v4);
  v5 = sub_2356F55D8(v3, v4);
  j__swift_release(v3, v4);
  return v5;
}

uint64_t sub_2356F496C()
{
  uint64_t v1;

  swift_getObjectType();
  sub_235705AC4();
  return v1;
}

uint64_t sub_2356F49AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  type metadata accessor for QueryController(255, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 32), a4);
  sub_235705ADC();
  sub_235705AD0();
  return v5;
}

uint64_t Query.modelContext.getter(uint64_t a1)
{
  uint64_t result;

  result = sub_2356F4910(a1);
  if (!result)
  {
    if (qword_2562628E0 != -1)
      swift_once();
    return swift_retain();
  }
  return result;
}

void *Query.fetchError.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)sub_2356F49AC(a1, a2, a3, a4);
  v5 = (void *)sub_2356F8058();
  v6 = v5;

  return v5;
}

uint64_t Query.wrappedValue.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;

  v4 = (void *)sub_2356F49AC(a1, a2, a3, a4);
  sub_2356F61BC();

  sub_235705D94();
  return swift_dynamicCast();
}

Swift::Void __swiftcall Query.update()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _OWORD v3[2];
  uint64_t v4;
  uint64_t v5;

  v2 = v0;
  sub_235705DB8();
  v3[1] = *(_OWORD *)(v2 + 16);
  v4 = *(_QWORD *)(v2 + 32);
  v5 = v1;
  sub_2356F4BE4((void (*)(void))sub_2356F596C, (uint64_t)v3);
}

uint64_t sub_2356F4B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v5 = type metadata accessor for Query(0, a2, a3, a4);
  v9 = (void *)sub_2356F49AC(v5, v6, v7, v8);
  v10 = sub_2356F4910(v5);
  sub_2356F6950(v10, a1, *(_QWORD *)(a1 + *(int *)(v5 + 44)));

  return swift_release();
}

uint64_t sub_2356F4BE4(void (*a1)(void), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  char isEscapingClosureAtFileLocation;

  sub_235705DAC();
  swift_release();
  swift_task_getMainExecutor();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    goto LABEL_6;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  a1();
  if (v2)
    return swift_release();
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
LABEL_6:
    sub_235705E78();
    sub_235705D4C();
    sub_235705F68();
    sub_235705D4C();
    swift_bridgeObjectRelease();
    sub_235705D4C();
    result = sub_235705EB4();
    __break(1u);
  }
  return result;
}

uint64_t static Query._propertyBehaviors.getter()
{
  return 2;
}

uint64_t Query.init<A>(filter:sort:order:animation:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  return sub_2356F4E88(a1, a2, a3, a4, a5, a6, (void (*)(uint64_t, _QWORD, uint64_t))MEMORY[0x24BDCBF10], a7);
}

{
  return sub_2356F4E88(a1, a2, a3, a4, a5, a6, MEMORY[0x24BDCBF18], a7);
}

uint64_t sub_2356F4D84()
{
  return sub_235705770();
}

uint64_t Query.init<>(_:transaction:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;

  v10 = sub_235705D94();
  v11 = (int *)type metadata accessor for Query(0, a3, v10, a4);
  v12 = v11[11];
  *(_QWORD *)(a5 + v12) = 1;
  v13 = a5 + v11[12];
  *(_QWORD *)v13 = swift_getKeyPath();
  *(_BYTE *)(v13 + 8) = 0;
  v14 = (uint64_t *)(a5 + v11[13]);
  type metadata accessor for QueryController(0, a3, a4, v15);
  sub_2356F6174();
  *v14 = sub_2356F496C();
  v14[1] = v16;
  v17 = sub_235705BF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(a5, a1, v17);
  result = sub_2356F599C(*(_QWORD *)(a5 + v12));
  *(_QWORD *)(a5 + v12) = a2;
  return result;
}

uint64_t sub_2356F4E88@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void (*a7)(uint64_t, _QWORD, uint64_t)@<X6>, uint64_t a8@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  void (*v25)(uint64_t, _QWORD, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v24 = a6;
  v25 = a7;
  v26 = a4;
  v27 = a8;
  v22 = a1;
  v23 = a3 & 1;
  v28 = *(_QWORD *)(*a2 + *MEMORY[0x24BEE46A8]);
  v10 = v28;
  sub_23570583C();
  v11 = sub_235705E18();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v21 - v13;
  v15 = sub_235705BF0();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v21 - v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  sub_235705764();
  sub_235705EF0();
  swift_allocObject();
  sub_235705D70();
  v18 = swift_retain();
  v25(v18, v23, v24);
  sub_235705D94();
  sub_235705BE4();
  swift_retain();
  v19 = sub_235705944();
  Query.init<>(_:transaction:)((uint64_t)v17, v19, v10, a5, v27);
  swift_release();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v22, v11);
}

uint64_t Query.init<A>(filter:sort:order:transaction:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  return sub_2356F507C(a1, a2, a3, a4, a5, a6, (void (*)(uint64_t, _QWORD, uint64_t))MEMORY[0x24BDCBF10], a7);
}

{
  return sub_2356F507C(a1, a2, a3, a4, a5, a6, MEMORY[0x24BDCBF18], a7);
}

uint64_t sub_2356F507C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void (*a7)(uint64_t, _QWORD, uint64_t)@<X6>, uint64_t a8@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  void (*v24)(uint64_t, _QWORD, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v23 = a6;
  v24 = a7;
  v25 = a8;
  v26 = a4;
  v21 = a1;
  v22 = a3 & 1;
  v27 = *(_QWORD *)(*a2 + *MEMORY[0x24BEE46A8]);
  v10 = v27;
  sub_23570583C();
  v11 = sub_235705E18();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v20 - v13;
  v15 = sub_235705BF0();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v20 - v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  sub_235705764();
  sub_235705EF0();
  swift_allocObject();
  sub_235705D70();
  v18 = swift_retain();
  v24(v18, v22, v23);
  sub_235705D94();
  sub_235705BE4();
  Query.init<>(_:transaction:)((uint64_t)v17, v26, v10, a5, v25);
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v21, v11);
}

uint64_t Query.init<>(filter:sort:animation:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD v17[2];

  v17[1] = a2;
  sub_23570583C();
  v8 = sub_235705E18();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v17 - v10;
  v12 = sub_235705BF0();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v17 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  sub_235705BE4();
  swift_retain();
  v15 = sub_235705944();
  Query.init<>(_:transaction:)((uint64_t)v14, v15, a2, a3, a4);
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
}

uint64_t Query.init<>(filter:sort:transaction:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _QWORD v18[2];

  v18[1] = a3;
  sub_23570583C();
  v10 = sub_235705E18();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v18 - v12;
  v14 = sub_235705BF0();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v18 - v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  sub_235705BE4();
  Query.init<>(_:transaction:)((uint64_t)v16, a2, a3, a4, a5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
}

uint64_t Query.init<>(_:animation:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;

  v8 = sub_235705D94();
  v9 = (int *)type metadata accessor for Query(0, a2, v8, a3);
  v10 = v9[11];
  *(_QWORD *)(a4 + v10) = 1;
  v11 = a4 + v9[12];
  *(_QWORD *)v11 = swift_getKeyPath();
  *(_BYTE *)(v11 + 8) = 0;
  v12 = (uint64_t *)(a4 + v9[13]);
  type metadata accessor for QueryController(0, a2, a3, v13);
  sub_2356F6174();
  *v12 = sub_2356F496C();
  v12[1] = v14;
  v15 = sub_235705BF0();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(a4, a1, v15);
  v17 = sub_235705944();
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a1, v15);
  result = sub_2356F599C(*(_QWORD *)(a4 + v10));
  *(_QWORD *)(a4 + v10) = v17;
  return result;
}

uint64_t sub_2356F55BC()
{
  return sub_2357059C8();
}

uint64_t sub_2356F55CC()
{
  return 2;
}

uint64_t sub_2356F55D8(uint64_t a1, char a2)
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

  v4 = sub_235705A40();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    v8 = sub_235705DF4();
    v9 = sub_235705A70();
    v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v15 = v12;
      *(_DWORD *)v11 = 136315138;
      v14 = sub_235703238(0xD000000000000016, 0x8000000235707520, &v15);
      sub_235705E24();
      _os_log_impl(&dword_2356F2000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7D4298](v12, -1, -1);
      MEMORY[0x23B7D4298](v11, -1, -1);
    }

    sub_235705A34();
    swift_getAtKeyPath();
    j__swift_release(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v15;
  }
  return a1;
}

uint64_t sub_2356F5798(void *a1, char a2)
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
  uint64_t v13;
  unint64_t v14;
  id v15;
  _QWORD v17[3];
  uint64_t v18;

  v4 = sub_235705A40();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    v15 = a1;
  }
  else
  {
    swift_retain();
    v8 = sub_235705DF4();
    v9 = sub_235705A70();
    v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v18 = v12;
      *(_DWORD *)v11 = 136315138;
      v17[1] = v11 + 4;
      __swift_instantiateConcreteTypeFromMangledName(qword_256262A30);
      v13 = sub_235705F68();
      v17[2] = sub_235703238(v13, v14, &v18);
      sub_235705E24();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2356F2000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7D4298](v12, -1, -1);
      MEMORY[0x23B7D4298](v11, -1, -1);
    }

    sub_235705A34();
    swift_getAtKeyPath();
    sub_2356F60A8(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v18;
  }
  return (uint64_t)a1;
}

uint64_t sub_2356F596C()
{
  uint64_t *v0;

  return sub_2356F4B70(v0[5], v0[2], v0[3], v0[4]);
}

uint64_t type metadata accessor for Query(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Query);
}

uint64_t sub_2356F599C(uint64_t result)
{
  if (result != 1)
    return swift_release();
  return result;
}

uint64_t sub_2356F59AC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2356F59B4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_235705BF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_2356F5A40(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  _QWORD *v16;
  char *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_235705BF0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v4, a2, v7);
    v8 = a3[11];
    v9 = *(uint64_t *)((char *)a2 + v8);
    if (v9 != 1)
      v9 = swift_retain();
    *(uint64_t *)((char *)v4 + v8) = v9;
    v10 = a3[12];
    v11 = (char *)v4 + v10;
    v12 = (char *)a2 + v10;
    v13 = *(_QWORD *)v12;
    v14 = v12[8];
    j__swift_retain(*(_QWORD *)v12, v14);
    *(_QWORD *)v11 = v13;
    v11[8] = v14;
    v15 = a3[13];
    v16 = (uint64_t *)((char *)v4 + v15);
    v17 = (char *)a2 + v15;
    v18 = *(void **)v17;
    v19 = *((_QWORD *)v17 + 1);
    *v16 = *(_QWORD *)v17;
    v16[1] = v19;
    v20 = v18;
  }
  swift_retain();
  return v4;
}

uint64_t sub_2356F5B2C(uint64_t a1, int *a2)
{
  uint64_t v4;

  v4 = sub_235705BF0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  if (*(_QWORD *)(a1 + a2[11]) != 1)
    swift_release();
  j__swift_release(*(_QWORD *)(a1 + a2[12]), *(unsigned __int8 *)(a1 + a2[12] + 8));

  return swift_release();
}

uint64_t sub_2356F5BB0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;

  v6 = sub_235705BF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[11];
  v8 = *(_QWORD *)(a2 + v7);
  if (v8 != 1)
    v8 = swift_retain();
  *(_QWORD *)(a1 + v7) = v8;
  v9 = a3[12];
  v10 = a1 + v9;
  v11 = (uint64_t *)(a2 + v9);
  v12 = *v11;
  v13 = *((_BYTE *)v11 + 8);
  j__swift_retain(*v11, v13);
  *(_QWORD *)v10 = v12;
  *(_BYTE *)(v10 + 8) = v13;
  v14 = a3[13];
  v15 = (_QWORD *)(a1 + v14);
  v16 = a2 + v14;
  v17 = *(void **)v16;
  v18 = *(_QWORD *)(v16 + 8);
  *v15 = *(_QWORD *)v16;
  v15[1] = v18;
  v19 = v17;
  swift_retain();
  return a1;
}

uint64_t sub_2356F5C70(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v6 = sub_235705BF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[11];
  v8 = (uint64_t *)(a1 + v7);
  v9 = *(_QWORD *)(a2 + v7);
  if (*(_QWORD *)(a1 + v7) == 1)
  {
    if (v9 != 1)
    {
      *v8 = v9;
      swift_retain();
      goto LABEL_9;
    }
    v10 = 1;
  }
  else
  {
    if (v9 != 1)
    {
      *v8 = v9;
      swift_retain();
      swift_release();
      goto LABEL_9;
    }
    sub_2356F5D9C(a1 + v7);
    v10 = *(_QWORD *)(a2 + v7);
  }
  *v8 = v10;
LABEL_9:
  v11 = a3[12];
  v12 = (uint64_t *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v14 = *v13;
  v15 = *((_BYTE *)v13 + 8);
  j__swift_retain(*v13, v15);
  v16 = *v12;
  v17 = *((unsigned __int8 *)v12 + 8);
  *v12 = v14;
  *((_BYTE *)v12 + 8) = v15;
  j__swift_release(v16, v17);
  v18 = a3[13];
  v19 = a1 + v18;
  v20 = a2 + v18;
  v21 = *(void **)(a2 + v18);
  v22 = *(void **)v19;
  *(_QWORD *)v19 = v21;
  v23 = v21;

  *(_QWORD *)(v19 + 8) = *(_QWORD *)(v20 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_2356F5D9C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDEB8C0] - 8) + 8))();
  return a1;
}

uint64_t sub_2356F5DD0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_235705BF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_BYTE *)(v8 + 8) = *(_BYTE *)(v9 + 8);
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  return a1;
}

uint64_t sub_2356F5E58(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;

  v6 = sub_235705BF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[11];
  v8 = (_QWORD *)(a1 + v7);
  v9 = *(_QWORD *)(a2 + v7);
  if (*(_QWORD *)(a1 + v7) != 1)
  {
    if (v9 != 1)
    {
      *v8 = v9;
      swift_release();
      goto LABEL_6;
    }
    sub_2356F5D9C(a1 + v7);
    v9 = *(_QWORD *)(a2 + v7);
  }
  *v8 = v9;
LABEL_6:
  v10 = a3[12];
  v11 = (uint64_t *)(a1 + v10);
  v12 = (uint64_t *)(a2 + v10);
  v13 = *v12;
  LOBYTE(v12) = *((_BYTE *)v12 + 8);
  v14 = *v11;
  v15 = *((unsigned __int8 *)v11 + 8);
  *v11 = v13;
  *((_BYTE *)v11 + 8) = (_BYTE)v12;
  j__swift_release(v14, v15);
  v16 = a3[13];
  v17 = a1 + v16;
  v18 = (_QWORD *)(a2 + v16);
  v19 = *(void **)(a1 + v16);
  *(_QWORD *)(a1 + v16) = *v18;

  *(_QWORD *)(v17 + 8) = v18[1];
  swift_release();
  return a1;
}

uint64_t sub_2356F5F50()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2356F5F5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_235705BF0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 52));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_2356F5FE0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2356F5FEC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_235705BF0();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 52)) = (a2 - 1);
  return result;
}

uint64_t sub_2356F606C()
{
  return swift_deallocObject();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B7D4184](a1, v6, a5);
}

void sub_2356F60A8(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_release();
}

uint64_t sub_2356F60B8()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_235705BF0();
  if (v1 <= 0x3F)
  {
    result = sub_23570586C();
    if (v2 <= 0x3F)
    {
      result = swift_initClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

id sub_2356F6174()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void *sub_2356F6194()
{
  void *v0;
  id v1;

  v0 = (void *)sub_2356F8058();
  v1 = v0;
  return v0;
}

uint64_t sub_2356F61BC()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t *, _QWORD);
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t result;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[3];
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31[4];

  v1 = v0;
  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v3 = *MEMORY[0x24BEE4EA0] & *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256262AF0);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v30 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(v3 + 80);
  v6 = *(_QWORD *)(v3 + 88);
  v7 = sub_235705BF0();
  v8 = *(_QWORD *)(v7 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)v27 - v9;
  sub_235705764();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  if ((sub_2356F6C68() & 1) == 0)
    return swift_bridgeObjectRetain();
  if (*(_QWORD *)((char *)v1 + *(_QWORD *)((*v2 & *v1) + 0x70)))
  {
    v29 = swift_retain();
    sub_235705B48();
    sub_235705BB4();
    swift_release();
    v11 = sub_235705CB0();
    swift_release();
    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      v12 = sub_235705EC0();
      swift_bridgeObjectRelease();
    }
    else
    {
      v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v12)
    {
      v13 = (char *)v1 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x78);
      swift_beginAccess();
      v28 = v13;
      v14 = sub_235705BD8();
      v15 = swift_endAccess();
      v27[2] = v27;
      v31[0] = v14;
      MEMORY[0x24BDAC7A8](v15);
      v27[-2] = v5;
      v27[-1] = v6;
      v16 = sub_235705D94();
      MEMORY[0x23B7D41F0](MEMORY[0x24BEE12C8], v16);
      v27[1] = v16;
      LOBYTE(v14) = sub_235705D64();
      v17 = swift_bridgeObjectRelease();
      if ((v14 & 1) == 0)
      {
        MEMORY[0x24BDAC7A8](v17);
        v27[-2] = v5;
        v27[-1] = v6;
        swift_getKeyPath();
        sub_235705C74();
        sub_2356F81D8(&qword_256262B00, (uint64_t (*)(uint64_t))MEMORY[0x24BDEAAB0], MEMORY[0x24BDEAAD0]);
        sub_2356F4D84();
        swift_beginAccess();
        v18 = (void (*)(uint64_t *, _QWORD))sub_235705BCC();
        sub_235705D88();
        v18(v31, 0);
        swift_endAccess();
      }
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v28, v7);
      v23 = sub_235705B30();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      swift_release();
      v24 = (_QWORD *)MEMORY[0x24BEE4EA0];
      *(_QWORD *)((char *)v1 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x68)) = v23;
      swift_bridgeObjectRelease();
      v25 = *(_QWORD *)((*v24 & *v1) + 0x88);
      v26 = *(void **)((char *)v1 + v25);
      *(_QWORD *)((char *)v1 + v25) = 0;

      *((_BYTE *)v1 + *(_QWORD *)((*v24 & *v1) + 0x60)) = 0;
    }
    else
    {
      swift_release();
      *((_BYTE *)v1 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x60)) = 0;
    }
    return swift_bridgeObjectRetain();
  }
  sub_235705DF4();
  if (qword_2562628F0 != -1)
    swift_once();
  sub_2357058A8();
  sub_235705B00();
  sub_2356F81D8(&qword_256262AF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEA7C0], MEMORY[0x24BDEA7D0]);
  v19 = swift_allocError();
  sub_235705AF4();
  v20 = *(_QWORD *)((*v2 & *v1) + 0x88);
  v21 = *(void **)((char *)v1 + v20);
  *(_QWORD *)((char *)v1 + v20) = v19;

  result = sub_235705D7C();
  *((_BYTE *)v1 + *(_QWORD *)((*v2 & *v1) + 0x60)) = 0;
  return result;
}

uint64_t sub_2356F6950(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char v17;
  void (*v18)(char *, uint64_t, uint64_t);
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v4 = v3;
  v29 = a3;
  v33 = *MEMORY[0x24BDAC8D0];
  v7 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v8 = *MEMORY[0x24BEE4EA0] & *v3;
  v9 = sub_235705BF0();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v29 - v14;
  v16 = *(_QWORD *)((char *)v4 + *(_QWORD *)(v8 + 112));
  v30 = a2;
  if (v16)
  {
    v32 = v16;
    if (a1)
    {
      v31 = a1;
      sub_235705B54();
      sub_2356F81D8((unint64_t *)&qword_256262AE8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEA868], MEMORY[0x24BDEA878]);
      swift_retain_n();
      v17 = sub_235705CF8();
      swift_release();
      swift_release();
      v18 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
      v18(v15, v30, v9);
      if ((v17 & 1) == 0)
        goto LABEL_9;
LABEL_6:
      v19 = (char *)v4 + *(_QWORD *)((*v7 & *v4) + 0x78);
      swift_beginAccess();
      v20 = ((uint64_t (*)(char *, char *, uint64_t))v18)(v13, v19, v9);
      MEMORY[0x24BDAC7A8](v20);
      *(&v29 - 4) = v9;
      *(&v29 - 3) = (uint64_t)v15;
      *((_DWORD *)&v29 - 4) = 3;
      sub_2356F7FCC((uint64_t)v13, (uint64_t)sub_2356F80E0, (uint64_t)(&v29 - 6), v9, MEMORY[0x24BEE4078], MEMORY[0x24BEE1328], MEMORY[0x24BEE40A8], v21);
      LOBYTE(v19) = v32;
      v22 = *(void (**)(char *, uint64_t))(v10 + 8);
      v22(v13, v9);
      v22(v15, v9);
      if ((v19 & 1) != 0)
        goto LABEL_11;
      goto LABEL_10;
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v29 - v14, v30, v9);
  }
  else
  {
    v18 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    v18((char *)&v29 - v14, a2, v9);
    if (!a1)
      goto LABEL_6;
  }
LABEL_9:
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
LABEL_10:
  *((_BYTE *)v4 + *(_QWORD *)((*v7 & *v4) + 0x60)) = 1;
LABEL_11:
  v23 = swift_retain();
  sub_2356F7218(v23);
  v24 = (char *)v4 + *(_QWORD *)((*v7 & *v4) + 0x78);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 24))(v24, v30, v9);
  swift_endAccess();
  v25 = *(_QWORD *)((*v7 & *v4) + 0x80);
  v26 = *(_QWORD *)((char *)v4 + v25);
  v27 = v29;
  *(_QWORD *)((char *)v4 + v25) = v29;
  sub_2356F80D0(v27);
  return sub_2356F599C(v26);
}

uint64_t sub_2356F6C68()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  swift_getKeyPath();
  sub_2356F6D6C();
  swift_release();
  return *((unsigned __int8 *)v0 + *(_QWORD *)((*v1 & *v0) + 0x60));
}

uint64_t sub_2356F6CE0()
{
  swift_getKeyPath();
  sub_2356F6DE4();
  return swift_release();
}

uint64_t sub_2356F6D6C()
{
  uint64_t ObjectType;

  ObjectType = swift_getObjectType();
  MEMORY[0x23B7D41F0](&unk_235706998, ObjectType);
  return sub_235705854();
}

uint64_t sub_2356F6DE4()
{
  uint64_t ObjectType;

  ObjectType = swift_getObjectType();
  MEMORY[0x23B7D41F0](&unk_235706998, ObjectType);
  return sub_235705848();
}

uint64_t sub_2356F6E94(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262AB8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x70);
  v9 = *(_QWORD *)((char *)v2 + v8);
  if (!a1)
  {
    if (!v9)
      return result;
LABEL_7:
    v12 = (void *)objc_opt_self();
    swift_retain();
    v13 = objc_msgSend(v12, sel_defaultCenter);
    v14 = (void *)sub_235705D04();
    objc_msgSend(v13, sel_addObserver_selector_name_object_, v2, sel_didChange_, v14, v9);

    v15 = objc_msgSend(v12, sel_defaultCenter);
    sub_235705B54();
    v16 = (void *)sub_235705B3C();
    objc_msgSend(v15, sel_addObserver_selector_name_object_, v2, sel_didChange_, v16, 0);

    v17 = objc_msgSend(v12, sel_defaultCenter);
    sub_235705BC0();
    v18 = (void *)sub_235705B84();
    objc_msgSend(v17, sel_addObserver_selector_name_object_, v2, sel_didChange_, v18, sub_235705B48());
    swift_release();

    swift_release();
LABEL_8:
    v19 = sub_23570574C();
    v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v7, 1, 1, v19);
    sub_2356F7160(v20);
    return sub_2356F8218((uint64_t)v7, &qword_256262AB8);
  }
  v21[1] = a1;
  if (!v9
    || (v21[0] = v9,
        sub_235705B54(),
        sub_2356F81D8((unint64_t *)&qword_256262AE8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEA868], MEMORY[0x24BDEA878]), swift_retain(), v10 = sub_235705CF8(), result = swift_release(), (v10 & 1) == 0))
  {
    v11 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    objc_msgSend(v11, sel_removeObserver_, v2);

    v9 = *(_QWORD *)((char *)v2 + v8);
    if (!v9)
      goto LABEL_8;
    goto LABEL_7;
  }
  return result;
}

uint64_t sub_2356F7160(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = *(_QWORD *)((char *)v1 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x80));
  if (v2 == 1)
    return sub_2356F73E0();
  MEMORY[0x24BDAC7A8](a1);
  swift_retain();
  sub_2357059EC();
  return sub_2356F599C(v2);
}

uint64_t sub_2356F7218(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x70);
  v3 = *(_QWORD *)((char *)v1 + v2);
  *(_QWORD *)((char *)v1 + v2) = a1;
  swift_retain();
  sub_2356F6E94(v3);
  swift_release();
  return swift_release();
}

uint64_t sub_2356F7274(void *a1)
{
  swift_getKeyPath();
  sub_2356F6DE4();

  return swift_release();
}

uint64_t sub_2356F7304()
{
  uint64_t v0;
  char v1;

  sub_235705764();
  v0 = sub_235705758();
  swift_getKeyPath();
  if (v0)
  {
    sub_235705E9C();
    swift_retain();
    v1 = sub_235705CF8();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    v1 = 0;
  }
  return v1 & 1;
}

uint64_t sub_2356F73E0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262AC0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v0;
  v5 = (void *)objc_opt_self();
  v6 = v0;
  if (objc_msgSend(v5, sel_isMainThread))
  {
    sub_2356F7608();
  }
  else
  {
    v8 = sub_235705DD0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v3, 1, 1, v8);
    sub_235705DB8();
    swift_retain();
    v9 = sub_235705DAC();
    v10 = (_QWORD *)swift_allocObject();
    v11 = MEMORY[0x24BEE6930];
    v10[2] = v9;
    v10[3] = v11;
    v10[4] = sub_2356F7BD0;
    v10[5] = v4;
    sub_2356F7734((uint64_t)v3, (uint64_t)&unk_256262AD0, (uint64_t)v10);
    swift_release();
  }
  return swift_release();
}

uint64_t sub_2356F7530(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262AB8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_235705740();
    v8 = sub_23570574C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_23570574C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = a1;
  sub_2356F7160((uint64_t)v10);

  return sub_2356F8218((uint64_t)v7, &qword_256262AB8);
}

uint64_t sub_2356F7608()
{
  swift_getKeyPath();
  sub_2356F6DE4();
  return swift_release();
}

uint64_t sub_2356F7690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[2] = a4;
  v5[3] = a5;
  sub_235705DB8();
  v5[4] = sub_235705DAC();
  sub_235705DA0();
  return swift_task_switch();
}

uint64_t sub_2356F76FC()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(v0 + 16);
  v2 = swift_release();
  v1(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2356F7734(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_235705DD0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_235705DC4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2356F8218(a1, &qword_256262AC0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_235705DA0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_2356F7880()
{
  _QWORD *v0;
  objc_class *ObjectType;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  objc_super v12;
  uint64_t v13;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v3 = *MEMORY[0x24BEE4EA0] & *v0;
  v13 = *(_QWORD *)(v3 + 0x50);
  v4 = sub_23570583C();
  v5 = sub_235705E18();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - v6;
  *((_BYTE *)v0 + *(_QWORD *)(v3 + 96)) = 1;
  v8 = *(_QWORD *)((*v2 & *v0) + 0x68);
  v9 = v0;
  *(_QWORD *)((char *)v0 + v8) = sub_235705D7C();
  *(_QWORD *)((char *)v9 + *(_QWORD *)((*v2 & *v9) + 0x70)) = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v7, 1, 1, v4);
  sub_235705764();
  sub_235705D7C();
  sub_235705BE4();
  *(_QWORD *)((char *)v9 + *(_QWORD *)((*v2 & *v9) + 0x80)) = 1;
  *(_QWORD *)((char *)v9 + *(_QWORD *)((*v2 & *v9) + 0x88)) = 0;
  sub_235705860();

  v12.receiver = v9;
  v12.super_class = ObjectType;
  return objc_msgSendSuper2(&v12, sel_init);
}

id sub_2356F7A38()
{
  return sub_2356F7880();
}

id sub_2356F7A58()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2356F7A8C(_QWORD *a1)
{
  _QWORD *v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  swift_bridgeObjectRelease();
  swift_release();
  v3 = (char *)a1 + *(_QWORD *)((*v2 & *a1) + 0x78);
  v4 = sub_235705BF0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_2356F599C(*(_QWORD *)((char *)a1 + *(_QWORD *)((*v2 & *a1) + 0x80)));

  v5 = (char *)a1 + *(_QWORD *)((*v2 & *a1) + 0x90);
  v6 = sub_23570586C();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t type metadata accessor for QueryController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for QueryController);
}

uint64_t sub_2356F7B84()
{
  return sub_2356F73E0();
}

uint64_t sub_2356F7BAC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2356F7BD0()
{
  return sub_2356F7608();
}

uint64_t sub_2356F7BD8()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2356F7C04(uint64_t a1)
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
  v8[1] = sub_2356F7C7C;
  return sub_2356F7690(a1, v4, v5, v7, v6);
}

uint64_t sub_2356F7C7C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2356F7CC4(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2356F7D28;
  return v6(a1);
}

uint64_t sub_2356F7D28()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2356F7D74()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2356F7D98(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2356F7E08;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256262AD8 + dword_256262AD8))(a1, v4);
}

uint64_t sub_2356F7E08()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

id sub_2356F7E50@<X0>(_QWORD *a1@<X8>)
{
  void *v2;

  v2 = (void *)sub_2356F8058();
  *a1 = v2;
  return v2;
}

uint64_t sub_2356F7E78(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  return sub_2356F7274(v1);
}

uint64_t sub_2356F7EA8()
{
  return 16;
}

__n128 sub_2356F7EB4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_2356F7EC0()
{
  return sub_2356F6CE0();
}

uint64_t sub_2356F7EEC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2356F6C68();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2356F7F18()
{
  return sub_2356F6CE0();
}

uint64_t sub_2356F7F3C()
{
  return 16;
}

__n128 sub_2356F7F48(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

void sub_2356F7F54()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & **(_QWORD **)(v0 + 16)) + 0x60)) = *(_BYTE *)(v0 + 24);
}

void sub_2356F7F7C()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(_QWORD **)(v0 + 16);
  v1 = *(void **)(v0 + 24);
  v3 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x88);
  v4 = *(void **)((char *)v2 + v3);
  *(_QWORD *)((char *)v2 + v3) = v1;
  v5 = v1;

}

uint64_t sub_2356F7FCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t (*v15)(uint64_t, char *);
  uint64_t result;
  uint64_t v17;

  v11 = *(_QWORD *)(a5 - 8);
  v12 = MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = v15(v12, v14);
  if (v8)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v14, a5);
  return result;
}

uint64_t sub_2356F8058()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  swift_getKeyPath();
  sub_2356F6D6C();
  swift_release();
  return *(_QWORD *)((char *)v0 + *(_QWORD *)((*v1 & *v0) + 0x88));
}

uint64_t sub_2356F80D0(uint64_t result)
{
  if (result != 1)
    return swift_retain();
  return result;
}

uint64_t sub_2356F80E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;

  v9 = *(_QWORD *)(v8 + 24);
  v10 = *(_DWORD *)(v8 + 32);
  v13 = *(_QWORD *)(v8 + 16);
  v14 = a1;
  v15 = v10;
  return sub_2356F7FCC(v9, (uint64_t)sub_2356F8134, (uint64_t)&v12, v13, MEMORY[0x24BEE4078], MEMORY[0x24BEE1328], MEMORY[0x24BEE40A8], a8);
}

uint64_t sub_2356F8134@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = AGCompareValues();
  *a1 = result;
  return result;
}

uint64_t sub_2356F8170()
{
  return sub_2356F7304() & 1;
}

uint64_t sub_2356F818C(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t sub_2356F8194()
{
  return sub_235705BFC();
}

uint64_t sub_2356F81C0()
{
  return 16;
}

__n128 sub_2356F81CC(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_2356F81D8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B7D41F0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2356F8218(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t View.modelContainer(for:inMemory:isAutosaveEnabled:isUndoEnabled:onSetup:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_2356F83C8(a1, a2, a3, a4, a5, a6, a7, a8, a9, (void (*)(void))View.modelContainer(for:inMemory:isAutosaveEnabled:isUndoEnabled:onSetup:));
}

uint64_t View.modelContainer(for:inMemory:isAutosaveEnabled:isUndoEnabled:onSetup:)(uint64_t a1, char a2, char a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t KeyPath;
  uint64_t v16;
  _BYTE v19[8];
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)();
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;

  KeyPath = swift_getKeyPath();
  v16 = swift_allocObject();
  *(_BYTE *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a1;
  v19[0] = a3;
  v19[1] = a4;
  v20 = a5;
  v21 = a6;
  v22 = sub_2356F97B8;
  v23 = v16;
  v24 = 0;
  v25 = KeyPath;
  v26 = 0;
  swift_bridgeObjectRetain();
  MEMORY[0x23B7D3998](v19, a7, &type metadata for CustomModelContainerViewModifier, a8);
  swift_release();
  return swift_release();
}

uint64_t View.modelContainer(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = a1;
  return MEMORY[0x23B7D3998](&v4, a2, &type metadata for PassthroughModelContainerViewModifier, a3);
}

uint64_t Scene.modelContainer(for:inMemory:isAutosaveEnabled:isUndoEnabled:onSetup:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_2356F83C8(a1, a2, a3, a4, a5, a6, a7, a8, a9, (void (*)(void))Scene.modelContainer(for:inMemory:isAutosaveEnabled:isUndoEnabled:onSetup:));
}

uint64_t sub_2356F83C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void (*a10)(void))
{
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256262B10);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_2357067D0;
  *(_QWORD *)(v12 + 32) = a1;
  *(_QWORD *)(v12 + 40) = a2;
  a10();
  return swift_bridgeObjectRelease();
}

uint64_t Scene.modelContainer(for:inMemory:isAutosaveEnabled:isUndoEnabled:onSetup:)(uint64_t a1, char a2, char a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t KeyPath;
  uint64_t v16;
  _BYTE v19[8];
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)();
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;

  KeyPath = swift_getKeyPath();
  v16 = swift_allocObject();
  *(_BYTE *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a1;
  v19[0] = a3;
  v19[1] = a4;
  v20 = a5;
  v21 = a6;
  v22 = sub_2356FA8F0;
  v23 = v16;
  v24 = 0;
  v25 = KeyPath;
  v26 = 0;
  swift_bridgeObjectRetain();
  MEMORY[0x23B7D39B0](v19, a7, &type metadata for CustomModelContainerSceneModifier, a8);
  swift_release();
  return swift_release();
}

uint64_t Scene.modelContainer(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = a1;
  return MEMORY[0x23B7D39B0](&v4, a2, &type metadata for PassthroughModelContainerSceneModifier, a3);
}

uint64_t sub_2356F85A0()
{
  uint64_t v0;

  sub_2356F9AC8(*(id *)(v0 + 16), *(_BYTE *)(v0 + 24));
  return swift_deallocClassInstance();
}

uint64_t sub_2356F85C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for CustomModelContainerState.ResolvedModelContainer();
  result = sub_2357058D8();
  *a1 = result;
  return result;
}

uint64_t sub_2356F8604()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v0 = sub_235705C98();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_235705C44();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CustomModelContainerState.ResolvedModelContainer();
  v5 = swift_allocObject();
  sub_235705C38();
  swift_bridgeObjectRetain();
  sub_235705CA4();
  sub_235705CC8();
  swift_allocObject();
  sub_235705CD4();
  sub_235705BC0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256262958);
  v6 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2357067D0;
  (*(void (**)(unint64_t, char *, uint64_t))(v2 + 16))(v7 + v6, v4, v1);
  v8 = sub_235705B90();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  *(_QWORD *)(v5 + 16) = v8;
  *(_BYTE *)(v5 + 24) = 0;
  return v5;
}

void sub_2356F87B8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char v3;
  void *v4;
  char v5;
  uint64_t v6;

  type metadata accessor for CustomModelContainerState.ResolvedModelContainer();
  sub_2356F9CF4(&qword_256262C10, (uint64_t (*)(uint64_t))type metadata accessor for CustomModelContainerState.ResolvedModelContainer, (uint64_t)&unk_235706CCC);
  v1 = sub_235705938();
  v2 = *(void **)(v1 + 16);
  v3 = *(_BYTE *)(v1 + 24);
  sub_2356F9ABC(v2, v3);
  swift_release();
  if ((v3 & 1) != 0)
  {
    sub_2356F9AC8(v2, 1);
  }
  else
  {
    sub_235705B78();
    sub_2356F9AC8(v2, 0);
    sub_235705B24();
    if ((*(_BYTE *)(v0 + 1) & 1) != 0)
    {
      v4 = *(void **)(v0 + 48);
      v5 = *(_BYTE *)(v0 + 56);
      sub_2356F99D8(v4, v5);
      v6 = sub_2356F5798(v4, v5);
      sub_2356F60A8(v4, v5);
      if (!v6)
        objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1898]), sel_init);
    }
    sub_235705B18();
    swift_release();
  }
}

uint64_t sub_2356F88FC()
{
  return sub_2357059C8();
}

void sub_2356F8910()
{
  sub_2356F87B8();
}

uint64_t sub_2356F8950@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  _OWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t KeyPath;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void *v24;
  int v25;
  _OWORD *v26;
  __int128 v27;
  char *v28;
  _QWORD v30[2];
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  uint64_t v40;
  char v41;

  v3 = (_OWORD *)v2;
  v32 = a1;
  v37 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262BF0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262BF8);
  MEMORY[0x24BDAC7A8](v34);
  v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262C00);
  v35 = *(_QWORD *)(v9 - 8);
  v36 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v33 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v10) = *(_BYTE *)(v2 + 1);
  v11 = *(_QWORD *)(v2 + 8);
  v12 = *(_QWORD *)(v2 + 24);
  v30[1] = *(_QWORD *)(v2 + 16);
  v31 = v11;
  v39 = *(_OWORD *)(v2 + 41);
  v13 = v10 & 1;
  KeyPath = swift_getKeyPath();
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262C08);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v6, v32, v15);
  v16 = &v6[*(int *)(v4 + 36)];
  *v16 = v13;
  *((_QWORD *)v16 + 1) = KeyPath;
  v16[16] = 0;
  v30[0] = swift_getKeyPath();
  type metadata accessor for CustomModelContainerState.ResolvedModelContainer();
  sub_2356F9CF4(&qword_256262C10, (uint64_t (*)(uint64_t))type metadata accessor for CustomModelContainerState.ResolvedModelContainer, (uint64_t)&unk_235706CCC);
  v32 = v12;
  v17 = sub_235705938();
  v18 = *(void **)(v17 + 16);
  v19 = *(_BYTE *)(v17 + 24);
  sub_2356F9ABC(v18, v19);
  swift_release();
  if ((v19 & 1) != 0)
  {
    sub_2356F9AC8(v18, 1);
    if (qword_2562628E0 != -1)
      swift_once();
    v20 = qword_256264658;
    swift_retain();
  }
  else
  {
    v20 = sub_235705B78();
    sub_2356F9AC8(v18, 0);
  }
  v21 = v34;
  sub_2356F9D34((uint64_t)v6, (uint64_t)v8, &qword_256262BF0);
  v22 = &v8[*(int *)(v21 + 36)];
  *(_QWORD *)v22 = v30[0];
  *((_QWORD *)v22 + 1) = v20;
  sub_2356F9FA8((uint64_t)v6, &qword_256262BF0);
  v23 = sub_235705938();
  v24 = *(void **)(v23 + 16);
  v25 = *(unsigned __int8 *)(v23 + 24);
  sub_2356F9ABC(v24, v25);
  swift_release();
  if (v25 == 1)
  {
    sub_2356F9AC8(v24, 1);
    v24 = 0;
  }
  v38 = v24;
  v40 = *(_QWORD *)((char *)&v39 + 7);
  v41 = HIBYTE(v39);
  v26 = (_OWORD *)swift_allocObject();
  v27 = v3[1];
  v26[1] = *v3;
  v26[2] = v27;
  v26[3] = v3[2];
  *(_OWORD *)((char *)v26 + 57) = *(_OWORD *)((char *)v3 + 41);
  sub_2356F9AF0(v31);
  sub_2356F99D0();
  sub_2356F9B00((uint64_t)&v40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256262C18);
  sub_2356F9B2C();
  sub_2356F9C78();
  v28 = v33;
  sub_235705A94();
  swift_release();
  swift_release();
  sub_2356F9FA8((uint64_t)v8, &qword_256262BF8);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v35 + 32))(v37, v28, v36);
}

uint64_t sub_2356F8D1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2356F8950(a1, a2);
}

uint64_t sub_2356F8D5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  _OWORD *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t KeyPath;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  int v27;
  _OWORD *v28;
  __int128 v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  __int128 v54;
  uint64_t v55;
  char v56;

  v2 = (_OWORD *)v1;
  v49 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262C60);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262C68);
  MEMORY[0x24BDAC7A8](v46);
  v42 = (uint64_t)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262C70);
  v47 = *(_QWORD *)(v7 - 8);
  v48 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v44 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v45 = (char *)&v38 - v10;
  v11 = *(_BYTE *)(v1 + 1);
  v12 = *(_QWORD *)(v1 + 8);
  v13 = *(_QWORD *)(v1 + 24);
  v40 = *(_QWORD *)(v1 + 16);
  v41 = v12;
  v54 = *(_OWORD *)(v1 + 41);
  v14 = v11 & 1;
  KeyPath = swift_getKeyPath();
  LOBYTE(v50) = v14;
  v51 = KeyPath;
  LOBYTE(v52) = 0;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262C78);
  v17 = sub_2356FA830(&qword_256262C80, &qword_256262C78, MEMORY[0x24BDF0010]);
  MEMORY[0x23B7D39B0](&v50, v16, &type metadata for SynchronizeSceneUndoManager, v17);
  swift_release();
  v39 = swift_getKeyPath();
  type metadata accessor for CustomModelContainerState.ResolvedModelContainer();
  sub_2356F9CF4(&qword_256262C10, (uint64_t (*)(uint64_t))type metadata accessor for CustomModelContainerState.ResolvedModelContainer, (uint64_t)&unk_235706CCC);
  v43 = v13;
  v18 = sub_235705938();
  v19 = *(void **)(v18 + 16);
  v20 = *(_BYTE *)(v18 + 24);
  sub_2356F9ABC(v19, v20);
  swift_release();
  if ((v20 & 1) != 0)
  {
    sub_2356F9AC8(v19, 1);
    if (qword_2562628E0 != -1)
      swift_once();
    v21 = qword_256264658;
    swift_retain();
  }
  else
  {
    v21 = sub_235705B78();
    sub_2356F9AC8(v19, 0);
  }
  v22 = v46;
  v23 = v42;
  sub_2356F9D34((uint64_t)v5, v42, &qword_256262C60);
  v24 = (uint64_t *)(v23 + *(int *)(v22 + 36));
  *v24 = v39;
  v24[1] = v21;
  sub_2356F9FA8((uint64_t)v5, &qword_256262C60);
  v25 = sub_235705938();
  v26 = *(void **)(v25 + 16);
  v27 = *(unsigned __int8 *)(v25 + 24);
  sub_2356F9ABC(v26, v27);
  swift_release();
  if (v27 == 1)
  {
    sub_2356F9AC8(v26, 1);
    v26 = 0;
  }
  v50 = (uint64_t)v26;
  v55 = *(_QWORD *)((char *)&v54 + 7);
  v56 = HIBYTE(v54);
  v28 = (_OWORD *)swift_allocObject();
  v29 = v2[1];
  v28[1] = *v2;
  v28[2] = v29;
  v28[3] = v2[2];
  *(_OWORD *)((char *)v28 + 57) = *(_OWORD *)((char *)v2 + 41);
  sub_2356F9AF0(v41);
  sub_2356F99D0();
  sub_2356F9B00((uint64_t)&v55);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262C18);
  v31 = sub_2356F9DC0();
  v32 = sub_2356F9C78();
  v33 = v44;
  sub_235705AB8();
  swift_release();
  swift_release();
  sub_2356F9FA8(v23, &qword_256262C68);
  v35 = v47;
  v34 = v48;
  v36 = v45;
  (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v45, v33, v48);
  v50 = v22;
  v51 = v30;
  v52 = v31;
  v53 = v32;
  swift_getOpaqueTypeConformance2();
  sub_235705950();
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v36, v34);
}

void sub_2356F91B4(uint64_t a1)
{
  void (*v1)(void *, uint64_t);
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v1 = *(void (**)(void *, uint64_t))(a1 + 8);
  if (v1)
  {
    type metadata accessor for CustomModelContainerState.ResolvedModelContainer();
    sub_2356F9CF4(&qword_256262C10, (uint64_t (*)(uint64_t))type metadata accessor for CustomModelContainerState.ResolvedModelContainer, (uint64_t)&unk_235706CCC);
    v2 = sub_235705938();
    v3 = *(void **)(v2 + 16);
    v4 = *(unsigned __int8 *)(v2 + 24);
    sub_2356F9ABC(v3, v4);
    swift_release();
    v1(v3, v4);
    sub_2356F9AC8(v3, v4);
  }
}

uint64_t sub_2356F927C@<X0>(uint64_t a1@<X8>)
{
  return sub_2356F8D5C(a1);
}

uint64_t sub_2356F92C0()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262CE0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  v6 = *((_QWORD *)v0 + 1);
  v7 = v0[16];
  swift_getKeyPath();
  v8 = swift_allocObject();
  *(_BYTE *)(v8 + 16) = v5;
  *(_QWORD *)(v8 + 24) = v6;
  *(_BYTE *)(v8 + 32) = v7;
  j__swift_retain(v6, v7);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262CE8);
  v10 = sub_2356FA830(&qword_256262CF0, &qword_256262CE8, MEMORY[0x24BDF0010]);
  sub_235705AAC();
  swift_release();
  swift_release();
  v11 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_256262A30);
  v13[1] = v9;
  v13[2] = v11;
  v13[3] = v10;
  swift_getOpaqueTypeConformance2();
  sub_235705950();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

void sub_2356F9444(id *a1, char a2, uint64_t a3, char a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((a2 & 1) != 0)
  {
    v6 = a4 & 1;
    j__swift_retain(a3, v6);
    v7 = sub_2356F55D8(a3, v6);
    j__swift_release(a3, v6);
    if (v7)
    {
      v8 = sub_235705B0C();
      swift_release();
      if (v8)
      {

        *a1 = (id)v8;
      }
    }
  }
}

uint64_t sub_2356F94CC()
{
  return sub_23570598C();
}

uint64_t sub_2356F94E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char *v2;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;

  v5 = *v2;
  v6 = *((_QWORD *)v2 + 1);
  v7 = v2[16];
  KeyPath = swift_getKeyPath();
  v9 = swift_allocObject();
  *(_BYTE *)(v9 + 16) = v5;
  *(_QWORD *)(v9 + 24) = v6;
  *(_BYTE *)(v9 + 32) = v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a2, a1, v10);
  v11 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256262CD8) + 36));
  *v11 = KeyPath;
  v11[1] = (uint64_t)sub_2356FA744;
  v11[2] = v9;
  return j__swift_retain(v6, v7);
}

uint64_t sub_2356F95B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t *v8;

  KeyPath = swift_getKeyPath();
  v5 = sub_235705B78();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262C50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, a1, v6);
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256262C58);
  v8 = (uint64_t *)(a2 + *(int *)(result + 36));
  *v8 = KeyPath;
  v8[1] = v5;
  return result;
}

uint64_t sub_2356F9634()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262CA0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath();
  v4 = sub_235705B78();
  v9[0] = KeyPath;
  v9[1] = v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262CA8);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262990);
  v7 = sub_2356FA830(&qword_256262CB0, &qword_256262CA8, MEMORY[0x24BDF0010]);
  MEMORY[0x23B7D39B0](v9, v5, v6, v7);
  swift_release();
  swift_release();
  sub_2356F9F0C();
  sub_235705950();
  return sub_2356F9FA8((uint64_t)v2, &qword_256262CA0);
}

uint64_t sub_2356F976C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = MEMORY[0x23B7D3920]();
  *a1 = result;
  return result;
}

uint64_t sub_2356F9794()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2356F97B8()
{
  return sub_2356F8604();
}

uint64_t type metadata accessor for CustomModelContainerState.ResolvedModelContainer()
{
  return objc_opt_self();
}

uint64_t sub_2356F97E4(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx01_a5Data_aB0020CustomModelContainerC8Modifier33_C0145BB3D356D4B01704777C3D5D3ACCLLVGAaBHPxAaBHD1__AhA0cJ0HPyHCHCTm(a1, (uint64_t)&type metadata for CustomModelContainerViewModifier, (uint64_t (*)(void))sub_2356F9800, MEMORY[0x24BDED308]);
}

unint64_t sub_2356F9800()
{
  unint64_t result;

  result = qword_256262BD0;
  if (!qword_256262BD0)
  {
    result = MEMORY[0x23B7D41F0](&unk_235706C7C, &type metadata for CustomModelContainerViewModifier);
    atomic_store(result, (unint64_t *)&qword_256262BD0);
  }
  return result;
}

uint64_t sub_2356F9844(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx01_a5Data_aB0020CustomModelContainerC8Modifier33_C0145BB3D356D4B01704777C3D5D3ACCLLVGAaBHPxAaBHD1__AhA0cJ0HPyHCHCTm(a1, (uint64_t)&type metadata for PassthroughModelContainerViewModifier, (uint64_t (*)(void))sub_2356F9860, MEMORY[0x24BDED308]);
}

unint64_t sub_2356F9860()
{
  unint64_t result;

  result = qword_256262BD8;
  if (!qword_256262BD8)
  {
    result = MEMORY[0x23B7D41F0](&unk_235706C2C, &type metadata for PassthroughModelContainerViewModifier);
    atomic_store(result, (unint64_t *)&qword_256262BD8);
  }
  return result;
}

uint64_t sub_2356F98A4(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx01_a5Data_aB0020CustomModelContainerC8Modifier33_C0145BB3D356D4B01704777C3D5D3ACCLLVGAaBHPxAaBHD1__AhA0cJ0HPyHCHCTm(a1, (uint64_t)&type metadata for CustomModelContainerSceneModifier, (uint64_t (*)(void))sub_2356F98C0, MEMORY[0x24BDED310]);
}

unint64_t sub_2356F98C0()
{
  unint64_t result;

  result = qword_256262BE0;
  if (!qword_256262BE0)
  {
    result = MEMORY[0x23B7D41F0](&unk_235706BEC, &type metadata for CustomModelContainerSceneModifier);
    atomic_store(result, (unint64_t *)&qword_256262BE0);
  }
  return result;
}

uint64_t sub_2356F9904(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx01_a5Data_aB0020CustomModelContainerC8Modifier33_C0145BB3D356D4B01704777C3D5D3ACCLLVGAaBHPxAaBHD1__AhA0cJ0HPyHCHCTm(a1, (uint64_t)&type metadata for PassthroughModelContainerSceneModifier, (uint64_t (*)(void))sub_2356F997C, MEMORY[0x24BDED310]);
}

uint64_t get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx01_a5Data_aB0020CustomModelContainerC8Modifier33_C0145BB3D356D4B01704777C3D5D3ACCLLVGAaBHPxAaBHD1__AhA0cJ0HPyHCHCTm(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];

  v6 = *(_QWORD *)(a1 + 8);
  v7 = sub_2357059E0();
  v9[0] = v6;
  v9[1] = a3();
  return MEMORY[0x23B7D41F0](a4, v7, v9);
}

unint64_t sub_2356F997C()
{
  unint64_t result;

  result = qword_256262BE8;
  if (!qword_256262BE8)
  {
    result = MEMORY[0x23B7D41F0](&unk_235706BAC, &type metadata for PassthroughModelContainerSceneModifier);
    atomic_store(result, (unint64_t *)&qword_256262BE8);
  }
  return result;
}

ValueMetadata *type metadata accessor for PassthroughModelContainerSceneModifier()
{
  return &type metadata for PassthroughModelContainerSceneModifier;
}

uint64_t sub_2356F99D0()
{
  return swift_retain();
}

id sub_2356F99D8(id a1, char a2)
{
  if ((a2 & 1) != 0)
    return a1;
  else
    return (id)swift_retain();
}

uint64_t sub_2356F99E8()
{
  return swift_release();
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for CustomModelContainerSceneModifier()
{
  return &type metadata for CustomModelContainerSceneModifier;
}

ValueMetadata *type metadata accessor for PassthroughModelContainerViewModifier()
{
  return &type metadata for PassthroughModelContainerViewModifier;
}

ValueMetadata *type metadata accessor for CustomModelContainerViewModifier()
{
  return &type metadata for CustomModelContainerViewModifier;
}

uint64_t sub_2356F9A68()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2356F9A78()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2356F9A88()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2356F9A98()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2356F9AA8()
{
  return MEMORY[0x24BDB9D70];
}

id sub_2356F9ABC(id a1, char a2)
{
  if ((a2 & 1) != 0)
    return a1;
  else
    return (id)swift_retain();
}

void sub_2356F9AC8(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_release();
}

void sub_2356F9AD8()
{
  uint64_t v0;

  sub_2356F91B4(v0 + 16);
}

uint64_t sub_2356F9AF0(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_2356F9B00(uint64_t a1)
{
  sub_2356F99D8(*(id *)a1, *(_BYTE *)(a1 + 8));
  return a1;
}

unint64_t sub_2356F9B2C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256262C20;
  if (!qword_256262C20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256262BF8);
    v2[0] = sub_2356F9BB0();
    v2[1] = sub_2356FA830(&qword_256262998, &qword_256262990, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7D41F0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256262C20);
  }
  return result;
}

unint64_t sub_2356F9BB0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256262C28;
  if (!qword_256262C28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256262BF0);
    v2[0] = sub_2356FA830(&qword_256262C30, &qword_256262C08, MEMORY[0x24BDEFB78]);
    v2[1] = sub_2356F9C34();
    result = MEMORY[0x23B7D41F0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256262C28);
  }
  return result;
}

unint64_t sub_2356F9C34()
{
  unint64_t result;

  result = qword_256262C38;
  if (!qword_256262C38)
  {
    result = MEMORY[0x23B7D41F0](&unk_235706DE4, &type metadata for SynchronizeUndoManager);
    atomic_store(result, (unint64_t *)&qword_256262C38);
  }
  return result;
}

unint64_t sub_2356F9C78()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256262C40;
  if (!qword_256262C40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256262C18);
    v2 = sub_2356F9CF4(&qword_256262C48, (uint64_t (*)(uint64_t))MEMORY[0x24BDEA8F0], MEMORY[0x24BDEA900]);
    result = MEMORY[0x23B7D41F0](MEMORY[0x24BEE4AB8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256262C40);
  }
  return result;
}

uint64_t sub_2356F9CF4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B7D41F0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2356F9D34(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t objectdestroy_13Tm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
    swift_release();
  sub_2356F99E8();
  sub_2356F60A8(*(id *)(v0 + 64), *(_BYTE *)(v0 + 72));
  return swift_deallocObject();
}

unint64_t sub_2356F9DC0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256262C88;
  if (!qword_256262C88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256262C68);
    v2[0] = sub_2356F9E44();
    v2[1] = sub_2356FA830(&qword_2562629A0, &qword_256262990, MEMORY[0x24BDF1030]);
    result = MEMORY[0x23B7D41F0](MEMORY[0x24BDED310], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256262C88);
  }
  return result;
}

unint64_t sub_2356F9E44()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256262C90;
  if (!qword_256262C90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256262C60);
    v2[0] = sub_2356FA830(&qword_256262C80, &qword_256262C78, MEMORY[0x24BDF0010]);
    v2[1] = sub_2356F9EC8();
    result = MEMORY[0x23B7D41F0](MEMORY[0x24BDED310], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256262C90);
  }
  return result;
}

unint64_t sub_2356F9EC8()
{
  unint64_t result;

  result = qword_256262C98;
  if (!qword_256262C98)
  {
    result = MEMORY[0x23B7D41F0](&unk_235706DA4, &type metadata for SynchronizeSceneUndoManager);
    atomic_store(result, (unint64_t *)&qword_256262C98);
  }
  return result;
}

unint64_t sub_2356F9F0C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256262CB8;
  if (!qword_256262CB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256262CA0);
    v2[0] = sub_2356FA830(&qword_256262CB0, &qword_256262CA8, MEMORY[0x24BDF0010]);
    v2[1] = sub_2356FA830(&qword_2562629A0, &qword_256262990, MEMORY[0x24BDF1030]);
    result = MEMORY[0x23B7D41F0](MEMORY[0x24BDED310], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256262CB8);
  }
  return result;
}

uint64_t sub_2356F9FA8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t destroy for SynchronizeUndoManager(uint64_t a1)
{
  return j__swift_release(*(_QWORD *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for SynchronizeUndoManager()
{
  return &type metadata for SynchronizeUndoManager;
}

uint64_t _s18_SwiftData_SwiftUI22SynchronizeUndoManagerVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned __int8 v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_BYTE *)(a2 + 16);
  j__swift_retain(v3, v4);
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4;
  return a1;
}

uint64_t _s18_SwiftData_SwiftUI22SynchronizeUndoManagerVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_BYTE *)(a2 + 16);
  j__swift_retain(v3, v4);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(unsigned __int8 *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4;
  j__swift_release(v5, v6);
  return a1;
}

uint64_t _s18_SwiftData_SwiftUI22SynchronizeUndoManagerVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(unsigned __int8 *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4;
  j__swift_release(v5, v6);
  return a1;
}

uint64_t _s18_SwiftData_SwiftUI22SynchronizeUndoManagerVwet_0(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[17])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s18_SwiftData_SwiftUI22SynchronizeUndoManagerVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for SynchronizeSceneUndoManager()
{
  return &type metadata for SynchronizeSceneUndoManager;
}

uint64_t initializeBufferWithCopyOfBuffer for CustomModelContainerState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void _s18_SwiftData_SwiftUI33CustomModelContainerSceneModifierVwxx_0(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 8))
    swift_release();
  sub_2356F99E8();
  sub_2356F60A8(*(id *)(a1 + 48), *(_BYTE *)(a1 + 56));
}

uint64_t _s18_SwiftData_SwiftUI33CustomModelContainerSceneModifierVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  char v10;

  *(_WORD *)a1 = *(_WORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    v5 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 8) = v4;
    *(_QWORD *)(a1 + 16) = v5;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  }
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_2356F99D0();
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  v9 = *(void **)(a2 + 48);
  v10 = *(_BYTE *)(a2 + 56);
  sub_2356F99D8(v9, v10);
  *(_QWORD *)(a1 + 48) = v9;
  *(_BYTE *)(a1 + 56) = v10;
  return a1;
}

uint64_t _s18_SwiftData_SwiftUI33CustomModelContainerSceneModifierVwca_0(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  v4 = (_OWORD *)(a1 + 8);
  v6 = (_OWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (!*(_QWORD *)(a1 + 8))
  {
    if (v5)
    {
      v8 = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v8;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *v4 = *v6;
    goto LABEL_8;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  v7 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v7;
  swift_retain();
  swift_release();
LABEL_8:
  v9 = *(_QWORD *)(a2 + 24);
  v10 = *(_QWORD *)(a2 + 32);
  v11 = *(_BYTE *)(a2 + 40);
  sub_2356F99D0();
  *(_QWORD *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 32) = v10;
  *(_BYTE *)(a1 + 40) = v11;
  sub_2356F99E8();
  v12 = *(void **)(a2 + 48);
  v13 = *(_BYTE *)(a2 + 56);
  sub_2356F99D8(v12, v13);
  v14 = *(void **)(a1 + 48);
  v15 = *(_BYTE *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = v12;
  *(_BYTE *)(a1 + 56) = v13;
  sub_2356F60A8(v14, v15);
  return a1;
}

uint64_t _s18_SwiftData_SwiftUI33CustomModelContainerSceneModifierVwta_0(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  void *v11;
  char v12;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  v4 = (_OWORD *)(a1 + 8);
  v6 = (_OWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (!*(_QWORD *)(a1 + 8))
  {
    if (v5)
    {
      v8 = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v8;
      goto LABEL_8;
    }
LABEL_7:
    *v4 = *v6;
    goto LABEL_8;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  v7 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v7;
  swift_release();
LABEL_8:
  v9 = *(_BYTE *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = v9;
  sub_2356F99E8();
  v10 = *(_BYTE *)(a2 + 56);
  v11 = *(void **)(a1 + 48);
  v12 = *(_BYTE *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = v10;
  sub_2356F60A8(v11, v12);
  return a1;
}

uint64_t _s18_SwiftData_SwiftUI33CustomModelContainerSceneModifierVwet_0(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 57))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t _s18_SwiftData_SwiftUI33CustomModelContainerSceneModifierVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 57) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 57) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for CustomModelContainerState()
{
  return &type metadata for CustomModelContainerState;
}

uint64_t sub_2356FA580(uint64_t a1)
{
  return get_witness_table_qd0__7SwiftUI4ViewHD3_AaBPAAE8onChange2of7initial_Qrqd___SbyyctSQRd__lFQOyAA15ModifiedContentVyAHyAA01_c9Modifier_I0Vy01_a5Data_aB0020CustomModelContainercJ033_C0145BB3D356D4B01704777C3D5D3ACCLLVGAK22SynchronizeUndoManagerAMLLVGAA022_EnvironmentKeyWritingJ0Vy0aK00M7ContextCSgGG_AU0mN0CSgQo_HOTm(a1, &qword_256262BF8, (void (*)(void))sub_2356F9B2C);
}

unint64_t sub_2356FA5A0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256262CC0;
  if (!qword_256262CC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256262C58);
    v2[0] = sub_2356FA830(&qword_256262CC8, &qword_256262C50, MEMORY[0x24BDEFB78]);
    v2[1] = sub_2356FA830(&qword_256262998, &qword_256262990, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7D41F0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256262CC0);
  }
  return result;
}

uint64_t sub_2356FA63C(uint64_t a1)
{
  return get_witness_table_qd0__7SwiftUI4ViewHD3_AaBPAAE8onChange2of7initial_Qrqd___SbyyctSQRd__lFQOyAA15ModifiedContentVyAHyAA01_c9Modifier_I0Vy01_a5Data_aB0020CustomModelContainercJ033_C0145BB3D356D4B01704777C3D5D3ACCLLVGAK22SynchronizeUndoManagerAMLLVGAA022_EnvironmentKeyWritingJ0Vy0aK00M7ContextCSgGG_AU0mN0CSgQo_HOTm(a1, &qword_256262C68, (void (*)(void))sub_2356F9DC0);
}

uint64_t get_witness_table_qd0__7SwiftUI4ViewHD3_AaBPAAE8onChange2of7initial_Qrqd___SbyyctSQRd__lFQOyAA15ModifiedContentVyAHyAA01_c9Modifier_I0Vy01_a5Data_aB0020CustomModelContainercJ033_C0145BB3D356D4B01704777C3D5D3ACCLLVGAK22SynchronizeUndoManagerAMLLVGAA022_EnvironmentKeyWritingJ0Vy0aK00M7ContextCSgGG_AU0mN0CSgQo_HOTm(uint64_t a1, uint64_t *a2, void (*a3)(void))
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256262C18);
  a3();
  sub_2356F9C78();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2356FA6CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2356FA6DC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2356FA6EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = MEMORY[0x23B7D392C]();
  *a1 = result;
  return result;
}

uint64_t sub_2356FA714(id *a1)
{
  id v1;

  v1 = *a1;
  return sub_235705A28();
}

void sub_2356FA744(id *a1)
{
  uint64_t v1;

  sub_2356F9444(a1, *(_BYTE *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_BYTE *)(v1 + 32));
}

uint64_t objectdestroy_27Tm()
{
  uint64_t v0;

  j__swift_release(*(_QWORD *)(v0 + 24), *(unsigned __int8 *)(v0 + 32));
  return swift_deallocObject();
}

unint64_t sub_2356FA794()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256262CF8;
  if (!qword_256262CF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256262CD8);
    v2[0] = sub_2356FA830(&qword_256262D00, &qword_256262CD0, MEMORY[0x24BDEFB78]);
    v2[1] = sub_2356FA830(&qword_256262D08, &qword_256262D10, MEMORY[0x24BDF1248]);
    result = MEMORY[0x23B7D41F0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256262CF8);
  }
  return result;
}

uint64_t sub_2356FA830(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B7D41F0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2356FA870()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256262CE8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_256262A30);
  sub_2356FA830(&qword_256262CF0, &qword_256262CE8, MEMORY[0x24BDF0010]);
  return swift_getOpaqueTypeConformance2();
}

uint64_t DocumentGroup<>.init(editing:migrationPlan:editor:prepareDocument:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t result;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  _QWORD *v47;
  unint64_t v48;
  ValueMetadata *v49;
  unint64_t v50;

  v39 = a6;
  v40 = a7;
  v41 = a4;
  v42 = a5;
  v46 = a3;
  v43 = a9;
  v13 = sub_23570589C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v37 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v37 - v20;
  sub_235705884();
  v22 = sub_235705890();
  v45 = *(void (**)(char *, uint64_t))(v14 + 8);
  v45(v21, v13);
  if ((v22 & 1) != 0)
  {
    v44 = a8;
    v23 = sub_235705C68();
    v24 = *(_QWORD *)(v23 + 16);
    if (v24)
    {
      v38 = a10;
      v37 = *(_OWORD *)(v23 + 16 * v24 + 16);
      swift_bridgeObjectRelease();
      v25 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
      v25(v21, a1, v13);
      v25(v19, a1, v13);
      v26 = (*(unsigned __int8 *)(v14 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
      v27 = (v15 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
      v28 = swift_allocObject();
      (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v28 + v26, v19, v13);
      *(_OWORD *)(v28 + v27) = v37;
      v29 = (_QWORD *)(v28 + ((v27 + 23) & 0xFFFFFFFFFFFFFFF8));
      v30 = v46;
      *v29 = a2;
      v29[1] = v30;
      v49 = &type metadata for ModelDocumentProvider;
      v50 = sub_2356FAED0();
      v31 = (_QWORD *)swift_allocObject();
      v47 = v31;
      v32 = v40;
      v31[2] = v39;
      v31[3] = v32;
      v31[4] = sub_2356FAEC4;
      v31[5] = v28;
      type metadata accessor for ModelDocumentBox(0);
      v33 = (_QWORD *)swift_allocObject();
      v34 = v38;
      v33[2] = v44;
      v33[3] = v34;
      v35 = v42;
      v33[4] = v41;
      v33[5] = v35;
      sub_2356FAF5C(&qword_256262D20, type metadata accessor for ModelDocumentBox, (uint64_t)&unk_23570711C);
      sub_2356FAF5C(&qword_256262D28, type metadata accessor for ModelDocumentBox, (uint64_t)&unk_235707074);
      sub_2356FAF9C();
      sub_235705998();
      return ((uint64_t (*)(uint64_t, uint64_t))v45)(a1, v13);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v13);
    v47 = 0;
    v48 = 0xE000000000000000;
    sub_235705E78();
    sub_235705D4C();
    sub_235705878();
    sub_235705D4C();
    swift_bridgeObjectRelease();
    sub_235705D4C();
    sub_235705884();
    sub_235705878();
    v45(v21, v13);
    sub_235705D4C();
    swift_bridgeObjectRelease();
    sub_235705D4C();
  }
  result = sub_235705EB4();
  __break(1u);
  return result;
}

uint64_t sub_2356FAD38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void (*v10)(char *, uint64_t, uint64_t);
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v18 = a2;
  v19 = a3;
  v6 = sub_23570589C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v10(v9, a1, v6);
  sub_235705CC8();
  v17 = sub_235705C80();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256263448);
  v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v12 = swift_allocObject();
  v16 = xmmword_2357067D0;
  *(_OWORD *)(v12 + 16) = xmmword_2357067D0;
  v10((char *)(v12 + v11), (uint64_t)v9, v6);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = v16;
  result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))(v13 + v11, v9, v6);
  *a4 = v12;
  a4[1] = v13;
  v15 = v18;
  a4[2] = v17;
  a4[3] = v15;
  a4[4] = v19;
  return result;
}

uint64_t sub_2356FAEC4()
{
  return sub_2356FB598((uint64_t (*)(unint64_t, _QWORD, _QWORD, _QWORD, _QWORD))sub_2356FAD38);
}

unint64_t sub_2356FAED0()
{
  unint64_t result;

  result = qword_256262D18;
  if (!qword_256262D18)
  {
    result = MEMORY[0x23B7D41F0](&unk_235707154, &type metadata for ModelDocumentProvider);
    atomic_store(result, (unint64_t *)&qword_256262D18);
  }
  return result;
}

uint64_t sub_2356FAF14()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t type metadata accessor for ModelDocumentBox(uint64_t a1)
{
  return sub_2357043B4(a1, (uint64_t *)&unk_256262DF0);
}

uint64_t sub_2356FAF5C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B7D41F0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2356FAF9C()
{
  unint64_t result;

  result = qword_256262D30;
  if (!qword_256262D30)
  {
    result = MEMORY[0x23B7D41F0](&unk_235707044, &type metadata for ContentModifier);
    atomic_store(result, (unint64_t *)&qword_256262D30);
  }
  return result;
}

uint64_t DocumentGroup<>.init(viewing:migrationPlan:viewer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t result;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  _QWORD *v42;
  unint64_t v43;
  ValueMetadata *v44;
  unint64_t v45;

  v36 = a5;
  v37 = a7;
  v38 = a8;
  v39 = a6;
  v35 = a4;
  v41 = a3;
  v10 = sub_23570589C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v34 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v34 - v17;
  sub_235705884();
  v19 = sub_235705890();
  v20 = *(void (**)(char *, uint64_t))(v11 + 8);
  v20(v18, v10);
  if ((v19 & 1) != 0)
  {
    v40 = v20;
    v21 = sub_235705C68();
    v22 = *(_QWORD *)(v21 + 16);
    if (v22)
    {
      v34 = *(_OWORD *)(v21 + 16 * v22 + 16);
      swift_bridgeObjectRelease();
      v23 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
      v23(v18, a1, v10);
      v23(v16, a1, v10);
      v24 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
      v25 = (v12 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
      v26 = swift_allocObject();
      (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v26 + v24, v16, v10);
      *(_OWORD *)(v26 + v25) = v34;
      v27 = (_QWORD *)(v26 + ((v25 + 23) & 0xFFFFFFFFFFFFFFF8));
      v28 = v41;
      *v27 = a2;
      v27[1] = v28;
      v44 = &type metadata for ModelDocumentProvider;
      v45 = sub_2356FAED0();
      v29 = (_QWORD *)swift_allocObject();
      v42 = v29;
      v29[2] = 0;
      v29[3] = 0;
      v29[4] = sub_2356FB58C;
      v29[5] = v26;
      type metadata accessor for ModelDocumentBox(0);
      v30 = (_QWORD *)swift_allocObject();
      v31 = v37;
      v30[2] = v39;
      v30[3] = v31;
      v32 = v36;
      v30[4] = v35;
      v30[5] = v32;
      sub_2356FAF5C(&qword_256262D20, type metadata accessor for ModelDocumentBox, (uint64_t)&unk_23570711C);
      sub_2356FAF5C(&qword_256262D28, type metadata accessor for ModelDocumentBox, (uint64_t)&unk_235707074);
      sub_2356FAF9C();
      sub_2357059A4();
      return ((uint64_t (*)(uint64_t, uint64_t))v40)(a1, v10);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
    v42 = 0;
    v43 = 0xE000000000000000;
    sub_235705E78();
    sub_235705D4C();
    sub_235705878();
    sub_235705D4C();
    swift_bridgeObjectRelease();
    sub_235705D4C();
    sub_235705884();
    sub_235705878();
    v20(v18, v10);
    sub_235705D4C();
    swift_bridgeObjectRelease();
    sub_235705D4C();
  }
  result = sub_235705EB4();
  __break(1u);
  return result;
}

uint64_t sub_2356FB3E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;

  v8 = sub_23570589C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v12(v11, a1, v8);
  sub_235705CC8();
  v13 = sub_235705C8C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256263448);
  v14 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_2357067D0;
  v12((char *)(v15 + v14), (uint64_t)v11, v8);
  result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v17 = MEMORY[0x24BEE4AF8];
  *a4 = v15;
  a4[1] = v17;
  a4[2] = v13;
  a4[3] = a2;
  a4[4] = a3;
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_23570589C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_2356FB58C()
{
  return sub_2356FB598((uint64_t (*)(unint64_t, _QWORD, _QWORD, _QWORD, _QWORD))sub_2356FB3E8);
}

uint64_t sub_2356FB598(uint64_t (*a1)(unint64_t, _QWORD, _QWORD, _QWORD, _QWORD))
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *(_QWORD *)(sub_23570589C() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  return a1(v1 + v3, *(_QWORD *)(v1 + v4), *(_QWORD *)(v1 + v4 + 8), *(_QWORD *)(v1 + ((v4 + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + ((v4 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_2356FB60C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t DocumentGroup<>.init(editing:contentType:editor:prepareDocument:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char v21;
  void (*v22)(char *, uint64_t, uint64_t);
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  _QWORD *v41;
  unint64_t v42;
  ValueMetadata *v43;
  unint64_t v44;

  v38 = a9;
  v39 = a8;
  v34 = a6;
  v35 = a7;
  v36 = a4;
  v37 = a5;
  v33 = a2;
  v12 = sub_23570589C();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v32 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v32 - v19;
  sub_235705884();
  v21 = sub_235705890();
  v40 = *(void (**)(char *, uint64_t))(v13 + 8);
  v40(v20, v12);
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  if ((v21 & 1) != 0)
  {
    v22(v20, a3, v12);
    v22(v18, a3, v12);
    v23 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    v24 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v24 + v23, v18, v12);
    v25 = (_QWORD *)(v24 + ((v14 + v23 + 7) & 0xFFFFFFFFFFFFFFF8));
    v26 = v33;
    *v25 = a1;
    v25[1] = v26;
    v43 = &type metadata for ModelDocumentProvider;
    v44 = sub_2356FAED0();
    v27 = (_QWORD *)swift_allocObject();
    v41 = v27;
    v28 = v35;
    v27[2] = v34;
    v27[3] = v28;
    v27[4] = sub_2356FBBA8;
    v27[5] = v24;
    type metadata accessor for ModelDocumentBox(0);
    v29 = (_QWORD *)swift_allocObject();
    v29[2] = v39;
    v29[3] = a10;
    v30 = v37;
    v29[4] = v36;
    v29[5] = v30;
    sub_2356FAF5C(&qword_256262D20, type metadata accessor for ModelDocumentBox, (uint64_t)&unk_23570711C);
    sub_2356FAF5C(&qword_256262D28, type metadata accessor for ModelDocumentBox, (uint64_t)&unk_235707074);
    sub_2356FAF9C();
    sub_235705998();
    return ((uint64_t (*)(uint64_t, uint64_t))v40)(a3, v12);
  }
  else
  {
    v22((char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v12);
    v41 = 0;
    v42 = 0xE000000000000000;
    sub_235705E78();
    sub_235705D4C();
    sub_235705878();
    sub_235705D4C();
    swift_bridgeObjectRelease();
    sub_235705D4C();
    sub_235705884();
    sub_235705878();
    v40(v20, v12);
    sub_235705D4C();
    swift_bridgeObjectRelease();
    sub_235705D4C();
    result = sub_235705EB4();
    __break(1u);
  }
  return result;
}

uint64_t sub_2356FB9D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  __int128 v21;

  v8 = sub_235705C98();
  MEMORY[0x24BDAC7A8](v8);
  v9 = sub_23570589C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v20(v12, a1, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256262B10);
  v13 = swift_allocObject();
  v21 = xmmword_2357067D0;
  *(_OWORD *)(v13 + 16) = xmmword_2357067D0;
  *(_QWORD *)(v13 + 32) = a2;
  *(_QWORD *)(v13 + 40) = a3;
  sub_235705CA4();
  sub_235705CC8();
  swift_allocObject();
  v14 = sub_235705CD4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256263448);
  v15 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = v21;
  v20((char *)(v16 + v15), (uint64_t)v12, v9);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = v21;
  result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v10 + 32))(v17 + v15, v12, v9);
  *a4 = v16;
  a4[1] = v17;
  a4[3] = 0;
  a4[4] = 0;
  a4[2] = v14;
  return result;
}

uint64_t sub_2356FBBA8()
{
  return sub_2356FC6E0((uint64_t (*)(unint64_t, _QWORD, _QWORD))sub_2356FB9D0);
}

uint64_t sub_2356FBBB4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t DocumentGroup<>.init(editing:contentType:editor:prepareDocument:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char v20;
  void (*v21)(char *, uint64_t, uint64_t);
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  _QWORD *v39;
  unint64_t v40;
  ValueMetadata *v41;
  unint64_t v42;

  v34 = a4;
  v35 = a8;
  v36 = a9;
  v37 = a7;
  v31 = a5;
  v32 = a6;
  v33 = a3;
  v11 = sub_23570589C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v30 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v30 - v18;
  sub_235705884();
  v20 = sub_235705890();
  v38 = *(void (**)(char *, uint64_t))(v12 + 8);
  v38(v19, v11);
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  if ((v20 & 1) != 0)
  {
    v21(v19, a2, v11);
    v21(v17, a2, v11);
    v22 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    v23 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v23 + v22, v17, v11);
    *(_QWORD *)(v23 + ((v13 + v22 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
    v41 = &type metadata for ModelDocumentProvider;
    v42 = sub_2356FAED0();
    v24 = (_QWORD *)swift_allocObject();
    v39 = v24;
    v25 = v32;
    v24[2] = v31;
    v24[3] = v25;
    v24[4] = sub_2356FC11C;
    v24[5] = v23;
    type metadata accessor for ModelDocumentBox(0);
    v26 = (_QWORD *)swift_allocObject();
    v27 = v35;
    v26[2] = v37;
    v26[3] = v27;
    v28 = v34;
    v26[4] = v33;
    v26[5] = v28;
    sub_2356FAF5C(&qword_256262D20, type metadata accessor for ModelDocumentBox, (uint64_t)&unk_23570711C);
    sub_2356FAF5C(&qword_256262D28, type metadata accessor for ModelDocumentBox, (uint64_t)&unk_235707074);
    sub_2356FAF9C();
    sub_235705998();
    return ((uint64_t (*)(uint64_t, uint64_t))v38)(a2, v11);
  }
  else
  {
    v21((char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v11);
    v39 = 0;
    v40 = 0xE000000000000000;
    sub_235705E78();
    sub_235705D4C();
    sub_235705878();
    sub_235705D4C();
    swift_bridgeObjectRelease();
    sub_235705D4C();
    sub_235705884();
    sub_235705878();
    v38(v19, v11);
    sub_235705D4C();
    swift_bridgeObjectRelease();
    sub_235705D4C();
    result = sub_235705EB4();
    __break(1u);
  }
  return result;
}

uint64_t sub_2356FBF6C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, uint64_t, uint64_t);
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  __int128 v14;
  uint64_t v15;

  v4 = sub_235705C98();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_23570589C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v9(v8, a1, v5);
  swift_bridgeObjectRetain();
  sub_235705CA4();
  sub_235705CC8();
  swift_allocObject();
  v15 = sub_235705CD4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256263448);
  v10 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v11 = swift_allocObject();
  v14 = xmmword_2357067D0;
  *(_OWORD *)(v11 + 16) = xmmword_2357067D0;
  v9((char *)(v11 + v10), (uint64_t)v8, v5);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = v14;
  result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(v12 + v10, v8, v5);
  *a2 = v11;
  a2[1] = v12;
  a2[3] = 0;
  a2[4] = 0;
  a2[2] = v15;
  return result;
}

uint64_t sub_2356FC11C()
{
  return sub_2356FCCC8((uint64_t (*)(unint64_t, _QWORD))sub_2356FBF6C);
}

uint64_t DocumentGroup<>.init(viewing:contentType:viewer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char v19;
  void (*v20)(char *, uint64_t, uint64_t);
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  _QWORD *v37;
  unint64_t v38;
  ValueMetadata *v39;
  unint64_t v40;

  v32 = a5;
  v33 = a7;
  v34 = a8;
  v35 = a6;
  v30 = a2;
  v31 = a4;
  v10 = sub_23570589C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v30 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v30 - v17;
  sub_235705884();
  v19 = sub_235705890();
  v36 = *(void (**)(char *, uint64_t))(v11 + 8);
  v36(v18, v10);
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  if ((v19 & 1) != 0)
  {
    v20(v18, a3, v10);
    v20(v16, a3, v10);
    v21 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    v22 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v22 + v21, v16, v10);
    v23 = (_QWORD *)(v22 + ((v12 + v21 + 7) & 0xFFFFFFFFFFFFFFF8));
    v24 = v30;
    *v23 = a1;
    v23[1] = v24;
    v39 = &type metadata for ModelDocumentProvider;
    v40 = sub_2356FAED0();
    v25 = (_QWORD *)swift_allocObject();
    v37 = v25;
    v25[2] = 0;
    v25[3] = 0;
    v25[4] = sub_2356FC6D4;
    v25[5] = v22;
    type metadata accessor for ModelDocumentBox(0);
    v26 = (_QWORD *)swift_allocObject();
    v27 = v33;
    v26[2] = v35;
    v26[3] = v27;
    v28 = v32;
    v26[4] = v31;
    v26[5] = v28;
    sub_2356FAF5C(&qword_256262D20, type metadata accessor for ModelDocumentBox, (uint64_t)&unk_23570711C);
    sub_2356FAF5C(&qword_256262D28, type metadata accessor for ModelDocumentBox, (uint64_t)&unk_235707074);
    sub_2356FAF9C();
    sub_2357059A4();
    return ((uint64_t (*)(uint64_t, uint64_t))v36)(a3, v10);
  }
  else
  {
    v20((char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v10);
    v37 = 0;
    v38 = 0xE000000000000000;
    sub_235705E78();
    sub_235705D4C();
    sub_235705878();
    sub_235705D4C();
    swift_bridgeObjectRelease();
    sub_235705D4C();
    sub_235705884();
    sub_235705878();
    v36(v18, v10);
    sub_235705D4C();
    swift_bridgeObjectRelease();
    sub_235705D4C();
    result = sub_235705EB4();
    __break(1u);
  }
  return result;
}

uint64_t sub_2356FC4BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  __int128 v20;

  v8 = sub_235705C98();
  MEMORY[0x24BDAC7A8](v8);
  v9 = sub_23570589C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v13(v12, a1, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256262B10);
  v14 = swift_allocObject();
  v20 = xmmword_2357067D0;
  *(_OWORD *)(v14 + 16) = xmmword_2357067D0;
  *(_QWORD *)(v14 + 32) = a2;
  *(_QWORD *)(v14 + 40) = a3;
  sub_235705CA4();
  sub_235705CC8();
  swift_allocObject();
  v15 = sub_235705CD4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256263448);
  v16 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = v20;
  v13((char *)(v17 + v16), (uint64_t)v12, v9);
  result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v19 = MEMORY[0x24BEE4AF8];
  *a4 = v17;
  a4[1] = v19;
  a4[3] = 0;
  a4[4] = 0;
  a4[2] = v15;
  return result;
}

uint64_t objectdestroy_15Tm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_23570589C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_2356FC6D4()
{
  return sub_2356FC6E0((uint64_t (*)(unint64_t, _QWORD, _QWORD))sub_2356FC4BC);
}

uint64_t sub_2356FC6E0(uint64_t (*a1)(unint64_t, _QWORD, _QWORD))
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(sub_23570589C() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (_QWORD *)(v1 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  return a1(v1 + v3, *v4, v4[1]);
}

uint64_t DocumentGroup<>.init(viewing:contentType:viewer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char v18;
  void (*v19)(char *, uint64_t, uint64_t);
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  _QWORD *v35;
  unint64_t v36;
  ValueMetadata *v37;
  unint64_t v38;

  v30 = a4;
  v31 = a6;
  v32 = a7;
  v33 = a5;
  v29 = a3;
  v9 = sub_23570589C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v28 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v28 - v16;
  sub_235705884();
  v18 = sub_235705890();
  v34 = *(void (**)(char *, uint64_t))(v10 + 8);
  v34(v17, v9);
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  if ((v18 & 1) != 0)
  {
    v19(v17, a2, v9);
    v19(v15, a2, v9);
    v20 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    v21 = (v11 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
    v22 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v22 + v20, v15, v9);
    *(_QWORD *)(v22 + v21) = a1;
    v37 = &type metadata for ModelDocumentProvider;
    v38 = sub_2356FAED0();
    v23 = (_QWORD *)swift_allocObject();
    v35 = v23;
    v23[2] = 0;
    v23[3] = 0;
    v23[4] = sub_2356FCCBC;
    v23[5] = v22;
    type metadata accessor for ModelDocumentBox(0);
    v24 = (_QWORD *)swift_allocObject();
    v25 = v31;
    v24[2] = v33;
    v24[3] = v25;
    v26 = v30;
    v24[4] = v29;
    v24[5] = v26;
    sub_2356FAF5C(&qword_256262D20, type metadata accessor for ModelDocumentBox, (uint64_t)&unk_23570711C);
    sub_2356FAF5C(&qword_256262D28, type metadata accessor for ModelDocumentBox, (uint64_t)&unk_235707074);
    sub_2356FAF9C();
    sub_2357059A4();
    return ((uint64_t (*)(uint64_t, uint64_t))v34)(a2, v9);
  }
  else
  {
    v19((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v9);
    v35 = 0;
    v36 = 0xE000000000000000;
    sub_235705E78();
    sub_235705D4C();
    sub_235705878();
    sub_235705D4C();
    swift_bridgeObjectRelease();
    sub_235705D4C();
    sub_235705884();
    sub_235705878();
    v34(v17, v9);
    sub_235705D4C();
    swift_bridgeObjectRelease();
    sub_235705D4C();
    result = sub_235705EB4();
    __break(1u);
  }
  return result;
}

uint64_t sub_2356FCAD0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  v4 = sub_235705C98();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_23570589C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v9(v8, a1, v5);
  swift_bridgeObjectRetain();
  sub_235705CA4();
  sub_235705CC8();
  swift_allocObject();
  v10 = sub_235705CD4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256263448);
  v11 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_2357067D0;
  v9((char *)(v12 + v11), (uint64_t)v8, v5);
  result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v14 = MEMORY[0x24BEE4AF8];
  *a2 = v12;
  a2[1] = v14;
  a2[3] = 0;
  a2[4] = 0;
  a2[2] = v10;
  return result;
}

uint64_t objectdestroy_22Tm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_23570589C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2356FCCBC()
{
  return sub_2356FCCC8((uint64_t (*)(unint64_t, _QWORD))sub_2356FCAD0);
}

uint64_t sub_2356FCCC8(uint64_t (*a1)(unint64_t, _QWORD))
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(sub_23570589C() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  return a1(v1 + v3, *(_QWORD *)(v1 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t NewDocumentAction.callAsFunction(contentType:prepareDocument:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a2;
  *(_QWORD *)(v5 + 24) = a3;
  swift_retain();
  sub_235705A64();
  return swift_release();
}

uint64_t sub_2356FCD98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[3];
  ValueMetadata *v12;
  unint64_t v13;

  sub_235704798(a1, (uint64_t)v11, &qword_256263438);
  if (!v12)
    return sub_2357047DC((uint64_t)v11, &qword_256263438);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256263440);
  result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    swift_retain();
    sub_235701B98(v8);
    v12 = &type metadata for ModelDocumentProvider;
    v13 = sub_2356FAED0();
    v7 = (_QWORD *)swift_allocObject();
    v11[0] = v7;
    v7[2] = a2;
    v7[3] = a3;
    v7[4] = v9;
    v7[5] = v10;
    swift_retain();
    sub_235704818((uint64_t)v11, a1, &qword_256263438);
    return swift_release();
  }
  return result;
}

uint64_t sub_2356FCEA4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2356FCEC8(uint64_t a1)
{
  uint64_t v1;

  return sub_2356FCD98(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t initializeBufferWithCopyOfBuffer for ModelDocument(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ModelDocument()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for ModelDocument(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ModelDocument(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
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

uint64_t assignWithTake for ModelDocument(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for ModelDocument(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ModelDocument(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ModelDocument()
{
  return &type metadata for ModelDocument;
}

uint64_t type metadata accessor for ModelPlatformDocument(uint64_t a1)
{
  return sub_2357043B4(a1, (uint64_t *)&unk_256262D40);
}

uint64_t sub_2356FD11C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2356FD168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(__int128 *__return_ptr, uint64_t))
{
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;

  type metadata accessor for ModelDocumentBox(0);
  v8 = (uint64_t *)(swift_dynamicCastClassUnconditional()
                 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_prepareDocument);
  v9 = *v8;
  *v8 = a3;
  v8[1] = a4;
  sub_235701B88(a3);
  swift_unknownObjectRetain();
  v10 = sub_235701B98(v9);
  a5(&v14, v10);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2357058FC();
  swift_release();
  swift_release();
  v11 = v13;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_235705908();
  sub_2356FE714((uint64_t)&v13);
  sub_235702DD0(v11);
  return swift_unknownObjectRelease();
}

uint64_t sub_2356FD300(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2356FD168(a1, a2, *(_QWORD *)v2, *(_QWORD *)(v2 + 8), *(void (**)(__int128 *__return_ptr, uint64_t))(v2 + 16));
}

uint64_t sub_2356FD30C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_235703AA8();
  result = swift_unknownObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2356FD350()
{
  return sub_23570598C();
}

uint64_t sub_2356FD368@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t KeyPath;
  uint64_t v7;
  uint64_t *v8;

  v5 = *v2;
  KeyPath = swift_getKeyPath();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562633C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a2, a1, v7);
  v8 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2562633D0) + 36));
  *v8 = KeyPath;
  v8[1] = v5;
  return swift_retain();
}

unint64_t sub_2356FD3E4(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562633E8);
  v2 = sub_235705ECC();
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
    sub_235704798(v6, (uint64_t)v15, &qword_2562633F0);
    result = sub_235703878((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_2357042C0(&v17, (_OWORD *)(v3[7] + 32 * result));
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

void sub_2356FD524(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
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
  char *v14;
  char *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint8_t *v24;
  _BYTE *v25;
  _QWORD v26[7];
  uint64_t v27;
  char *v28;

  v2 = v1;
  v4 = sub_235705830();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2357058CC();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v26 - v13;
  v15 = v28;
  v16 = sub_2356FD990(v2);
  if (!v15)
  {
    v27 = v9;
    v28 = v14;
    v26[4] = v7;
    v26[5] = v5;
    v26[6] = v12;
    if ((v16 & 1) != 0)
    {
      sub_2356FDDD8(a1);
    }
    else
    {
      if (qword_2562628E8 != -1)
        swift_once();
      v17 = v8;
      v18 = __swift_project_value_buffer(v8, (uint64_t)qword_256264660);
      v19 = v27;
      v20 = v28;
      (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v28, v18, v17);
      v21 = sub_2357058B4();
      v22 = sub_235705DF4();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_2356F2000, v21, v22, "Non-package URLs are not supported.", v23, 2u);
        v24 = v23;
        v19 = v27;
        MEMORY[0x23B7D4298](v24, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v17);
      sub_23570449C();
      swift_allocError();
      *v25 = 0;
      swift_willThrow();
    }
  }
}

uint64_t sub_2356FD990(uint64_t a1)
{
  os_log_t v1;
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
  char *v12;
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
  void (*v23)(char *, os_log_t, uint64_t);
  NSObject *v24;
  os_log_type_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  uint64_t v38;
  int v39;
  os_log_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v41 = a1;
  v2 = sub_235705830();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v38 - v7;
  v9 = sub_2357058CC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256263420);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_2357057AC() & 1) != 0)
  {
    v16 = sub_235705788();
    v17 = *(_QWORD *)(v16 - 8);
    v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
    MEMORY[0x24BDAC7A8](v18);
    *(&v38 - 2) = (uint64_t)v15;
    v19 = (uint64_t)v1;
    LOBYTE(v1) = v41;
    v20 = v42;
    sub_235702374(v19, 4, 0, (uint64_t)sub_235704554, (uint64_t)(&v38 - 4));
    if (!v20)
    {
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
        LOBYTE(v1) = 0;
      else
        LOBYTE(v1) = sub_23570577C() & 1;
    }
    sub_2357047DC((uint64_t)v15, &qword_256263420);
  }
  else
  {
    if (qword_2562628E8 != -1)
      swift_once();
    v21 = __swift_project_value_buffer(v9, (uint64_t)qword_256264660);
    v22 = v10;
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v21, v9);
    v23 = *(void (**)(char *, os_log_t, uint64_t))(v3 + 16);
    v23(v8, v1, v2);
    v23(v6, v1, v2);
    v24 = sub_2357058B4();
    v25 = sub_235705DF4();
    v26 = v25;
    if (os_log_type_enabled(v24, v25))
    {
      v27 = swift_slowAlloc();
      v40 = v24;
      v28 = v27;
      v42 = swift_slowAlloc();
      v44 = v42;
      *(_DWORD *)v28 = 136315394;
      v38 = v28 + 4;
      v39 = v26;
      v29 = sub_23570580C();
      v43 = sub_235703238(v29, v30, &v44);
      v41 = v22;
      sub_235705E24();
      swift_bridgeObjectRelease();
      v31 = *(void (**)(char *, uint64_t))(v3 + 8);
      v31(v8, v2);
      *(_WORD *)(v28 + 12) = 2080;
      v32 = sub_235705818();
      if (v33)
      {
        v34 = v33;
      }
      else
      {
        v32 = 0x6E776F6E6B6E75;
        v34 = 0xE700000000000000;
      }
      v43 = sub_235703238(v32, v34, &v44);
      sub_235705E24();
      swift_bridgeObjectRelease();
      v31(v6, v2);
      v1 = v40;
      _os_log_impl(&dword_2356F2000, v40, (os_log_type_t)v39, "Attempted opening %s with %s scheme.\nURLs with non-file scheme are not supported.", (uint8_t *)v28, 0x16u);
      v35 = v42;
      swift_arrayDestroy();
      MEMORY[0x23B7D4298](v35, -1, -1);
      MEMORY[0x23B7D4298](v28, -1, -1);

      (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v9);
    }
    else
    {
      v1 = *(os_log_t *)(v3 + 8);
      ((void (*)(char *, uint64_t))v1)(v8, v2);
      ((void (*)(char *, uint64_t))v1)(v6, v2);

      (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v9);
    }
    sub_23570449C();
    swift_allocError();
    *v36 = 0;
    swift_willThrow();
  }
  return v1 & 1;
}

void sub_2356FDDD8(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _BYTE *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;

  v3 = v1;
  v5 = sub_2357058CC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_235705830();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2356FD990((uint64_t)v3);
  if (!v2)
  {
    v23 = v12;
    v24 = a1;
    v25 = v10;
    if ((v13 & 1) != 0)
    {
      sub_2357059F8();
      type metadata accessor for ModelDocumentBox(0);
      v14 = *(_QWORD *)(swift_dynamicCastClassUnconditional()
                      + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_database);
      swift_retain();
      swift_unknownObjectRelease();
      if (v14)
      {
        v15 = (uint64_t)v23;
        (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v23, v24, v9);
        v16 = v3;
        swift_retain();
        sub_235705BA8();
        swift_release();
        swift_retain();
        sub_235705B6C();
        swift_release();
        sub_235701BA8((uint64_t)v16, v15);
        v17 = v25;

        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v9);
      }
      else
      {
        sub_235701BA8((uint64_t)v3, v24);
      }
    }
    else
    {
      if (qword_2562628E8 != -1)
        swift_once();
      v18 = __swift_project_value_buffer(v5, (uint64_t)qword_256264660);
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v18, v5);
      v19 = sub_2357058B4();
      v20 = sub_235705DF4();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_2356F2000, v19, v20, "Non-package URLs are not supported.", v21, 2u);
        MEMORY[0x23B7D4298](v21, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_23570449C();
      swift_allocError();
      *v22 = 0;
      swift_willThrow();
    }
  }
}

uint64_t sub_2356FE0C8(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v8;

  v2 = sub_235705830();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235705800();
  v6 = a1;
  sub_2356FD524((uint64_t)v5);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return 1;
}

uint64_t sub_2356FE1C0(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  _BYTE v18[32];

  v8 = sub_235705830();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_unknownObjectRetain();
  v12 = a5;
  v13 = a1;
  v14 = a4;
  sub_235705E3C();
  swift_unknownObjectRelease();
  if (v14)
  {
    v15 = sub_235705CEC();

  }
  else
  {
    v15 = 0;
  }
  sub_235705800();

  sub_235703BE8((uint64_t)v18, v15, (uint64_t)v11);
  swift_bridgeObjectRelease();
  (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
  return 1;
}

uint64_t sub_2356FE360(uint64_t a1)
{
  objc_class *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void *v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;

  v3 = sub_235705830();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)objc_allocWithZone(v1);
  v8 = qword_256262D38;
  v9 = (void *)objc_opt_self();
  v10 = v7;
  *(_QWORD *)&v7[v8] = objc_msgSend(v9, sel_defaultManager);

  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  v11 = sub_235705A04();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v11;
}

void sub_2356FE470()
{
  uint64_t v0;

}

id sub_2356FE480()
{
  void *v0;
  objc_super v2;

  sub_2356FE4C0(0);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ModelPlatformDocument(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_2356FE4C0(void (*a1)(uint64_t))
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  sub_2357059F8();
  type metadata accessor for ModelDocumentBox(0);
  v3 = *(_QWORD *)(swift_dynamicCastClassUnconditional()
                 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_database);
  swift_retain();
  swift_unknownObjectRelease();
  if (v3)
  {
    v8 = v1;
    sub_235701B88((uint64_t)a1);
    swift_retain();
    sub_235705BA8();
    swift_release();
    swift_retain();
    sub_235705B6C();
    swift_release();
    sub_2357059F8();
    v4 = *(_QWORD *)(swift_dynamicCastClassUnconditional()
                   + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_tempDocument);
    swift_retain();
    v5 = swift_unknownObjectRelease();
    if (v4)
    {
      sub_235700C40();
      v5 = swift_release();
    }
    if (a1)
    {
      a1(v5);

      sub_235701B98((uint64_t)a1);
      swift_release();
    }
    else
    {
      swift_release();

    }
  }
  else
  {
    sub_2357059F8();
    v6 = *(_QWORD *)(swift_dynamicCastClassUnconditional()
                   + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_tempDocument);
    swift_retain();
    v7 = swift_unknownObjectRelease();
    if (v6)
    {
      sub_235700C40();
      v7 = swift_release();
    }
    if (a1)
      a1(v7);
  }
}

id sub_2356FE6AC(void *a1)
{
  id v1;
  objc_super v3;

  v1 = a1;
  sub_2356FE4C0(0);
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for ModelPlatformDocument(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void sub_2356FE6FC(uint64_t a1)
{

}

uint64_t sub_2356FE70C()
{
  return type metadata accessor for ModelPlatformDocument(0);
}

uint64_t sub_2356FE714(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  void **v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8[5];
  uint64_t v9;

  sub_235702E08(a1, (uint64_t)v8);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2357058FC();
  swift_release();
  swift_release();
  v2 = v9;
  if (v9)
    sub_235702DD0(v9);
  *(_BYTE *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_hasLoadedDocument) = v2 != 0;
  sub_2356FF13C();
  result = sub_235702E08((uint64_t)v8, (uint64_t)&v9);
  if (v9)
  {
    v4 = (void **)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_undoManager);
    result = swift_beginAccess();
    v5 = *v4;
    if (*v4)
    {
      v6 = swift_allocObject();
      sub_235702E08((uint64_t)v8, v6 + 16);
      v7 = v5;
      sub_235702E90(v8);
      type metadata accessor for ModelDocumentBox(0);
      sub_235705DDC();

      return swift_release();
    }
  }
  return result;
}

uint64_t sub_2356FE868(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235702E90(a2);
  sub_2357058FC();
  swift_release();
  swift_release();
  v3 = v9;
  v4 = v10;
  v5 = v11;
  v6 = v12;
  v7 = v13;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235702E08((uint64_t)a2, (uint64_t)&v9);
  swift_retain();
  sub_235705908();
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v12 = v6;
  v13 = v7;
  sub_2356FE714(&v9);
  return sub_235702DD0(v3);
}

uint64_t sub_2356FE97C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2357058FC();
  swift_release();
  return swift_release();
}

uint64_t sub_2356FE9E0()
{
  uint64_t v0;
  __int128 v2;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2357058FC();
  swift_release();
  swift_release();
  v0 = v2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_235705908();
  sub_2356FE714((uint64_t)&v2);
  return sub_235702DD0(v0);
}

uint64_t sub_2356FEAFC()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2357058FC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2356FEB6C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2357058FC();
  swift_release();
  return swift_release();
}

uint64_t sub_2356FEBD0()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2357058FC();
  swift_release();
  swift_release();
  return v1;
}

void (*sub_2356FEC40(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_undoManager;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_2356FEC98;
}

void sub_2356FEC98(_QWORD **a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  id v5;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = v3[3];
    if (*(_QWORD *)(v4 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_database))
    {
      v5 = *(id *)(v4 + v3[4]);
      swift_retain();
      swift_retain();
      sub_235705B18();
      swift_release();
      swift_release();
    }
  }
  free(v3);
}

uint64_t sub_2356FED20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
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
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562633A8);
  v37 = *(_QWORD *)(v1 - 8);
  v38 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v36 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562633B0);
  v34 = *(_QWORD *)(v3 - 8);
  v35 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v33 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262E28);
  v5 = MEMORY[0x24BDAC7A8](v32);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v31 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562633B8);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562633C0);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox__base;
  v41 = 0;
  v39 = 0u;
  v40 = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256262E08);
  sub_2357058E4();
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v18, v17, v14);
  v19 = v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox__context;
  *(_QWORD *)&v39 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256262E18);
  sub_2357058E4();
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v19, v13, v10);
  v20 = (_QWORD *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_prepareDocument);
  *v20 = 0;
  v20[1] = 0;
  *(_BYTE *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_hasLoadedDocument) = 0;
  v21 = v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox__fileURL;
  v22 = sub_235705830();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v9, 1, 1, v22);
  sub_235704798((uint64_t)v9, (uint64_t)v7, &qword_256262E28);
  v23 = v33;
  sub_2357058E4();
  sub_2357047DC((uint64_t)v9, &qword_256262E28);
  (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v21, v23, v35);
  v24 = v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox__isEditable;
  LOBYTE(v39) = 0;
  v25 = v36;
  sub_2357058E4();
  (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(v24, v25, v38);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_undoManager) = 0;
  v26 = v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_storeName;
  strcpy((char *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_storeName), "StoreContent");
  *(_BYTE *)(v26 + 13) = 0;
  *(_WORD *)(v26 + 14) = -5120;
  *(_BYTE *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_wasOpened) = 1;
  *(_BYTE *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_hasPrepared) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_tempDocument) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_database) = 0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2357058FC();
  swift_release();
  swift_release();
  v27 = v39;
  v28 = v40;
  v29 = v41;
  swift_getKeyPath();
  swift_getKeyPath();
  v41 = 0;
  v39 = 0u;
  v40 = 0u;
  swift_retain();
  sub_235705908();
  v39 = v27;
  v40 = v28;
  v41 = v29;
  sub_2356FE714((uint64_t)&v39);
  sub_235702DD0(v27);
  return v0;
}

uint64_t sub_2356FF13C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
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
  char *v28;
  uint64_t v29;
  id v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  _QWORD *v41;
  os_log_t v42;
  uint64_t v43;
  uint64_t v44;
  os_log_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55[3];
  uint64_t v56;

  v2 = v1;
  v3 = v0;
  v4 = sub_2357058CC();
  v51 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v50 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_235705830();
  v56 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v49 = (uint64_t)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v44 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262E28);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_database))
  {
    v14 = *(_QWORD *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_tempDocument);
    swift_retain_n();
    swift_retain();
    swift_retain();
    sub_235705BA8();
    if (v1)
    {

      v2 = 0;
    }
    swift_release();
    swift_retain();
    sub_235705B6C();
    swift_release();
    if (v14)
    {
      sub_235700C40();
      swift_release();
      swift_release();
    }
    swift_release();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2357058FC();
  swift_release();
  swift_release();
  v15 = v55[0];
  result = sub_235702DD0(v55[0]);
  if (v15)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2357058FC();
    swift_release();
    swift_release();
    result = v55[0];
    if (v55[0])
    {
      v17 = *(_QWORD *)(v55[1] + 16);
      result = sub_235702DD0(v55[0]);
      if (!v17)
        return result;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v56 + 56))(v13, 1, 1, v6);
      v18 = *(_QWORD *)(v3 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_storeName);
      v19 = *(_QWORD *)(v3 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_storeName + 8);
      type metadata accessor for TemporaryDocument(0);
      swift_allocObject();
      swift_bridgeObjectRetain();
      result = sub_235700538((uint64_t)v13, v18, v19);
      if (!result)
        return result;
      v20 = result;
      v48 = v4;
      sub_235700AD0(0);
      *(_QWORD *)(v3 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_tempDocument) = v20;
      swift_retain();
      swift_release();
      sub_23570037C((uint64_t)v10);
      swift_getKeyPath();
      swift_getKeyPath();
      sub_2357058FC();
      swift_release();
      result = swift_release();
      v21 = v55[0];
      if (v55[0])
      {
        v22 = v55[2];
        swift_retain();
        sub_235702DD0(v21);
        swift_getKeyPath();
        swift_getKeyPath();
        sub_2357058FC();
        swift_release();
        swift_release();
        result = v52;
        if (v52)
        {
          v24 = v53;
          v23 = v54;
          sub_235702DD0(v52);
          type metadata accessor for Database(0);
          swift_allocObject();
          v25 = sub_235701020(v10, v22, v24, v23, 0);
          v26 = v48;
          if (v2)
          {
            if (qword_2562628E8 != -1)
              swift_once();
            v27 = __swift_project_value_buffer(v26, (uint64_t)qword_256264660);
            v28 = v50;
            v29 = v51;
            (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v50, v27, v26);
            swift_retain();
            v30 = v2;
            swift_retain();
            v31 = v2;
            v32 = sub_2357058B4();
            v33 = sub_235705DF4();
            if (os_log_type_enabled(v32, v33))
            {
              v34 = swift_slowAlloc();
              v46 = (_QWORD *)swift_slowAlloc();
              v47 = swift_slowAlloc();
              v55[0] = v47;
              *(_DWORD *)v34 = 136315394;
              v45 = v32;
              v35 = v49;
              sub_23570037C(v49);
              v36 = sub_23570580C();
              v38 = v37;
              (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v35, v6);
              v52 = sub_235703238(v36, v38, v55);
              sub_235705E24();
              swift_release_n();
              swift_bridgeObjectRelease();
              *(_WORD *)(v34 + 12) = 2112;
              v39 = v2;
              v40 = _swift_stdlib_bridgeErrorToNSError();
              v52 = v40;
              sub_235705E24();
              v41 = v46;
              *v46 = v40;

              v42 = v45;
              _os_log_impl(&dword_2356F2000, v45, v33, "Failed to create the database at %s: %@", (uint8_t *)v34, 0x16u);
              __swift_instantiateConcreteTypeFromMangledName(&qword_2562633F8);
              swift_arrayDestroy();
              MEMORY[0x23B7D4298](v41, -1, -1);
              v43 = v47;
              swift_arrayDestroy();
              MEMORY[0x23B7D4298](v43, -1, -1);
              MEMORY[0x23B7D4298](v34, -1, -1);

              (*(void (**)(char *, uint64_t))(v51 + 8))(v50, v48);
            }
            else
            {
              swift_release_n();

              (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v26);
            }
            swift_willThrow();
          }
          else
          {
            sub_23570396C(v25);
            swift_release();
          }
          return swift_release();
        }
LABEL_25:
        __break(1u);
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_25;
  }
  return result;
}

uint64_t sub_2356FF820()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t result;
  uint64_t v4;
  id *v5;
  id v6;
  void (*v7)(uint64_t);
  uint64_t v8;
  id v9;

  v1 = v0;
  v2 = (_BYTE *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_wasOpened);
  result = swift_beginAccess();
  if ((*v2 & 1) == 0)
  {
    v4 = OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_hasPrepared;
    if (*(_BYTE *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_hasPrepared) != 1)
    {
      if (*(_QWORD *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_database))
      {
        v5 = (id *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_undoManager);
        swift_beginAccess();
        v6 = *v5;
        swift_retain();
        objc_msgSend(v6, sel_disableUndoRegistration);
        v7 = *(void (**)(uint64_t))(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_prepareDocument);
        if (v7)
        {
          sub_235701B88(*(_QWORD *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_prepareDocument));
          v8 = swift_retain();
          v7(v8);
          sub_235701B98((uint64_t)v7);
          swift_release();
        }
        v9 = *v5;
        objc_msgSend(v9, sel_enableUndoRegistration);

        result = swift_release();
        *(_BYTE *)(v1 + v4) = 1;
      }
    }
  }
  return result;
}

uint64_t sub_2356FF958()
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

  v1 = v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox__base;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562633C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox__context;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562633B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_235701B98(*(_QWORD *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_prepareDocument));
  v5 = v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox__fileURL;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562633B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox__isEditable;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562633A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_2356FFA7C()
{
  sub_2356FF958();
  return swift_deallocClassInstance();
}

uint64_t sub_2356FFAA0()
{
  return type metadata accessor for ModelDocumentBox(0);
}

void sub_2356FFAA8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_2356FFBC4(319, &qword_256262E00, &qword_256262E08);
  if (v0 <= 0x3F)
  {
    sub_2356FFBC4(319, &qword_256262E10, &qword_256262E18);
    if (v1 <= 0x3F)
    {
      sub_2356FFBC4(319, &qword_256262E20, &qword_256262E28);
      if (v2 <= 0x3F)
      {
        sub_2356FFC10();
        if (v3 <= 0x3F)
          swift_updateClassMetadata2();
      }
    }
  }
}

void sub_2356FFBC4(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_235705914();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_2356FFC10()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256262E30)
  {
    v0 = sub_235705914();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256262E30);
  }
}

uint64_t sub_2356FFC64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for ModelDocumentBox(0);
  result = sub_2357058D8();
  *a1 = result;
  return result;
}

uint64_t sub_2356FFCA0()
{
  return type metadata accessor for ModelPlatformDocument(0);
}

uint64_t sub_2356FFCA8()
{
  uint64_t v0;

  type metadata accessor for ModelDocumentBox(0);
  v0 = swift_allocObject();
  sub_2356FED20();
  return v0;
}

uint64_t sub_2356FFCE0()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_hasLoadedDocument);
}

uint64_t sub_2356FFCF0()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_wasOpened);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2356FFD34(char a1)
{
  uint64_t v1;
  _BYTE *v3;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_wasOpened);
  swift_beginAccess();
  *v3 = a1;
  return sub_2356FF820();
}

uint64_t (*sub_2356FFD88(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_2356FFDD0;
}

uint64_t sub_2356FFDD0(uint64_t a1, char a2)
{
  uint64_t result;

  result = swift_endAccess();
  if ((a2 & 1) == 0)
    return sub_2356FF820();
  return result;
}

uint64_t sub_2356FFE00()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2357058FC();
  swift_release();
  return swift_release();
}

uint64_t sub_2356FFE64(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262E28);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235704798(a1, (uint64_t)v4, &qword_256262E28);
  swift_retain();
  sub_235705908();
  return sub_2357047DC(a1, &qword_256262E28);
}

uint64_t (*sub_2356FFF28(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2357058F0();
  return sub_2356FFFA0;
}

uint64_t sub_2356FFFA4()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2357058FC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_235700014()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_235705908();
}

uint64_t (*sub_235700080(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2357058F0();
  return sub_2357000F8;
}

void sub_2357000FC(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

void *sub_235700148()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_undoManager);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_235700194(void *a1)
{
  sub_235703F88(a1);

}

void (*sub_2357001B8(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_2356FEC40(v2);
  return sub_2357001FC;
}

void sub_2357001FC(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_235700228()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2357058FC();
  swift_release();
  result = swift_release();
  if (v2)
  {
    v1 = swift_bridgeObjectRetain();
    sub_235702DD0(v1);
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2357002D0()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2357058FC();
  swift_release();
  result = swift_release();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_235702DD0(v1);
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23570037C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[24];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262E28);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v13[-v7];
  v9 = v1
     + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument____lazy_storage___project;
  swift_beginAccess();
  sub_235704798(v9, (uint64_t)v8, &qword_256262E28);
  v10 = sub_235705830();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
    return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v11 + 32))(a1, v8, v10);
  sub_2357047DC((uint64_t)v8, &qword_256262E28);
  swift_bridgeObjectRetain();
  sub_2357057F4();
  swift_bridgeObjectRelease();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v11 + 16))(v6, a1, v10);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_235704818((uint64_t)v6, v9, &qword_256262E28);
  return swift_endAccess();
}

uint64_t sub_235700538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void (*v20)(void);
  uint64_t v21;
  void *v22;
  id v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(char *, uint64_t, uint64_t);
  int v28;
  char *v29;
  id v30;
  id v31;
  id v32;
  char *v33;
  id v34;
  int v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  char *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, char *, uint64_t);
  uint64_t v50;
  char *v51;
  void (*v52)(char *, uint64_t);
  uint64_t v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70[2];

  v4 = v3;
  v69 = a3;
  v66 = a2;
  v70[1] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = sub_23570589C();
  v63 = *(_QWORD *)(v6 - 8);
  v64 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v62 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262E28);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v59 - v12;
  v14 = sub_235705830();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v61 = (char *)&v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v59 - v18;
  v20 = *(void (**)(void))(v15 + 56);
  v59 = v4
      + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument____lazy_storage___project;
  v20();
  *(_BYTE *)(v4 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_removed) = 1;
  v21 = OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_fileManager;
  v22 = (void *)objc_opt_self();
  v23 = objc_msgSend(v22, sel_defaultManager);
  v60 = v21;
  *(_QWORD *)(v4 + v21) = v23;
  v24 = (_QWORD *)(v4
                 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_databaseName);
  v25 = v66;
  v66 = v4 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_databaseName;
  v26 = v69;
  *v24 = v25;
  v24[1] = v26;
  v68 = v4;
  v69 = a1;
  sub_235704798(a1, (uint64_t)v13, &qword_256262E28);
  v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  v28 = v27(v13, 1, v14);
  v67 = v15;
  if (v28 == 1)
  {
    v29 = v19;
    v30 = objc_msgSend(v22, sel_defaultManager);
    v70[0] = 0;
    v31 = objc_msgSend(v30, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 9, 1, 0, 0, v70);

    v32 = v70[0];
    if (!v31)
    {
      v56 = v70[0];
      v57 = (void *)sub_2357057A0();

      swift_willThrow();
      sub_2357047DC((uint64_t)v13, &qword_256262E28);
      sub_2357047DC(v69, &qword_256262E28);

      sub_2357047DC(v59, &qword_256262E28);
      swift_bridgeObjectRelease();

      goto LABEL_12;
    }
    v33 = v29;
    sub_235705800();
    v34 = v32;

    sub_2357047DC((uint64_t)v13, &qword_256262E28);
    v15 = v67;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v19, v13, v14);
    v33 = v19;
  }
  sub_235704798(v69, (uint64_t)v11, &qword_256262E28);
  v35 = v27(v11, 1, v14);
  v65 = v14;
  if (v35 == 1)
  {
    sub_2357047DC((uint64_t)v11, &qword_256262E28);
    v36 = 0xEB00000000746E65;
    v37 = 0x6D75636F4477654ELL;
  }
  else
  {
    v37 = sub_2357057D0();
    v36 = v38;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v14);
  }
  v39 = v68;
  v40 = (uint64_t *)(v68
                  + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_documentName);
  *v40 = v37;
  v40[1] = v36;
  v41 = objc_msgSend(v22, sel_defaultManager);
  v42 = (void *)sub_2357057DC();
  v70[0] = 0;
  v43 = objc_msgSend(v41, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 99, 1, v42, 1, v70);

  v44 = v70[0];
  if (!v43)
  {
    v54 = v70[0];
    v55 = (void *)sub_2357057A0();

    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v33, v65);
    sub_2357047DC(v69, &qword_256262E28);

    sub_2357047DC(v59, &qword_256262E28);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
LABEL_12:
    type metadata accessor for TemporaryDocument(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  v45 = v61;
  sub_235705800();
  v46 = v44;

  v47 = v39 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_tempDirectory;
  v48 = v67;
  v49 = *(void (**)(uint64_t, char *, uint64_t))(v67 + 32);
  v50 = v65;
  v49(v47, v45, v65);
  v51 = v62;
  sub_235705884();
  sub_2357057E8();
  sub_2357047DC(v69, &qword_256262E28);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v51, v64);
  v52 = *(void (**)(char *, uint64_t))(v48 + 8);
  v53 = v68;
  v52(v33, v50);
  v49(v53 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_document, v45, v50);
  return v53;
}

void sub_235700AD0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11[2];

  v2 = v1;
  v11[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = *(void **)(v1
                + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_fileManager);
  v5 = (void *)sub_2357057DC();
  if (a1)
  {
    type metadata accessor for FileAttributeKey(0);
    sub_2356FAF5C(&qword_256262948, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_235706780);
    a1 = (void *)sub_235705CE0();
  }
  v11[0] = 0;
  v6 = objc_msgSend(v4, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v5, 1, a1, v11);

  v7 = v11[0];
  if (v6)
  {
    *(_BYTE *)(v2 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_removed) = 0;
    v8 = v7;
  }
  else
  {
    v9 = v11[0];
    v10 = (void *)sub_2357057A0();

    swift_willThrow();
  }
}

void sub_235700C40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_removed;
  if ((*(_BYTE *)(v0
                 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_removed) & 1) == 0)
  {
    v2 = v0;
    v3 = *(void **)(v0
                  + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_fileManager);
    v4 = (void *)sub_2357057DC();
    v9[0] = 0;
    LODWORD(v3) = objc_msgSend(v3, sel_removeItemAtURL_error_, v4, v9);

    v5 = v9[0];
    if ((_DWORD)v3)
    {
      *(_BYTE *)(v2 + v1) = 1;
      v6 = v5;
    }
    else
    {
      v7 = v9[0];
      v8 = (void *)sub_2357057A0();

      swift_willThrow();
    }
  }
}

uint64_t sub_235700D54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  id v13[2];

  v1 = v0;
  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_removed;
  if ((*(_BYTE *)(v0
                 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_removed) & 1) == 0)
  {
    v3 = *(void **)(v0
                  + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_fileManager);
    v4 = (void *)sub_2357057DC();
    v13[0] = 0;
    LOBYTE(v3) = objc_msgSend(v3, sel_removeItemAtURL_error_, v4, v13);

    v5 = v13[0];
    if ((v3 & 1) != 0)
    {
      *(_BYTE *)(v1 + v2) = 1;
      v6 = v5;
    }
    else
    {
      v7 = v13[0];
      v8 = (void *)sub_2357057A0();

      swift_willThrow();
    }
  }
  v9 = v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_tempDirectory;
  v10 = sub_235705830();
  v11 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
  v11(v9, v10);
  v11(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_document, v10);
  sub_2357047DC(v1+ OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument____lazy_storage___project, &qword_256262E28);
  swift_bridgeObjectRelease();
  objc_release(*(id *)(v1
                     + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_fileManager));
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_235700ED4()
{
  sub_235700D54();
  return swift_deallocClassInstance();
}

uint64_t sub_235700EF4()
{
  return type metadata accessor for TemporaryDocument(0);
}

uint64_t type metadata accessor for TemporaryDocument(uint64_t a1)
{
  return sub_2357043B4(a1, (uint64_t *)&unk_256263118);
}

void sub_235700F10()
{
  unint64_t v0;
  unint64_t v1;

  sub_235705830();
  if (v0 <= 0x3F)
  {
    sub_235700FBC();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_235700FBC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256263128[0])
  {
    sub_235705830();
    v0 = sub_235705E18();
    if (!v1)
      atomic_store(v0, qword_256263128);
  }
}

uint64_t sub_235701020(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  unint64_t v30;
  void (*v31)(char *, uint64_t);
  char v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t, uint64_t);
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v55 = a4;
  v62 = a1;
  v57 = a5;
  v54 = a3;
  v61 = a2;
  v5 = sub_235705C2C();
  MEMORY[0x24BDAC7A8](v5);
  v53 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_235705C44();
  v59 = *(_QWORD *)(v7 - 8);
  v60 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_235705830();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v52 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v45 - v14;
  v16 = sub_2357058CC();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Database.Error(0);
  sub_2356FAF5C(&qword_256263408, type metadata accessor for Database.Error, (uint64_t)&unk_2357073B0);
  v20 = swift_allocError();
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)(v63 + 24) = v20;
  if (qword_2562628E8 != -1)
    swift_once();
  v58 = v9;
  v21 = __swift_project_value_buffer(v16, (uint64_t)qword_256264660);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v21, v16);
  v51 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v51(v15, (uint64_t)v62, v10);
  v22 = sub_2357058B4();
  v23 = sub_235705DE8();
  v24 = os_log_type_enabled(v22, v23);
  v49 = v11;
  if (v24)
  {
    v25 = swift_slowAlloc();
    v47 = v19;
    v48 = v16;
    v46 = v17;
    v26 = v25;
    v27 = swift_slowAlloc();
    v65 = v27;
    *(_DWORD *)v26 = 136315394;
    v28 = v22;
    v29 = sub_23570580C();
    v64 = sub_235703238(v29, v30, &v65);
    sub_235705E24();
    swift_bridgeObjectRelease();
    v31 = *(void (**)(char *, uint64_t))(v11 + 8);
    v31(v15, v10);
    *(_WORD *)(v26 + 12) = 1024;
    v32 = v57;
    LODWORD(v64) = v57 & 1;
    sub_235705E24();
    _os_log_impl(&dword_2356F2000, v28, v23, "Creating a document at %s, readOnly: %{BOOL}d", (uint8_t *)v26, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x23B7D4298](v27, -1, -1);
    MEMORY[0x23B7D4298](v26, -1, -1);

    (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v48);
  }
  else
  {
    v33 = *(void (**)(char *, uint64_t))(v11 + 8);
    v33(v15, v10);

    v34 = v16;
    v31 = v33;
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v34);
    v32 = v57;
  }
  v50 = v10;
  v51(v52, (uint64_t)v62, v10);
  swift_retain();
  sub_235705C20();
  v35 = v58;
  sub_235705C5C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256262958);
  v36 = v59;
  v37 = v32;
  v38 = (*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
  v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = xmmword_2357067D0;
  v40 = v60;
  (*(void (**)(unint64_t, char *, uint64_t))(v36 + 16))(v39 + v38, v35, v60);
  sub_235705BC0();
  swift_allocObject();
  swift_retain();
  v41 = v56;
  v42 = sub_235705B9C();
  if (v41)
  {
    swift_release();
    v31(v62, v50);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v35, v40);

    type metadata accessor for Database(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    v43 = v63;
    *(_QWORD *)(v63 + 32) = v42;
    *(_BYTE *)(v43 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D5658Database_readOnly) = v37 & 1;
    sub_235705B54();
    swift_allocObject();
    swift_retain();
    *(_QWORD *)(v43 + 16) = sub_235705B60();
    swift_retain();
    sub_235705B24();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v35, v40);
    (*(void (**)(uint64_t, char *, uint64_t))(v49 + 32))(v43 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D5658Database_url, v62, v50);
  }
  return v63;
}

uint64_t sub_235701590(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint8_t *v16;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = sub_235705830();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2357058CC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D5658Database_readOnly) == 1)
  {
    v19 = v4;
    v20 = v1;
    v21 = a1;
    if (qword_2562628E8 != -1)
      swift_once();
    v12 = __swift_project_value_buffer(v8, (uint64_t)qword_256264660);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
    v13 = sub_2357058B4();
    v14 = sub_235705DF4();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v18[1] = v2;
      v16 = v15;
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_2356F2000, v13, v14, "The application attempts to write to a read-only document: aborting.", v15, 2u);
      MEMORY[0x23B7D4298](v16, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v4 = v19;
    v1 = v20;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D5658Database_url, v4);
  sub_235704048();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_235701784()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();

  swift_release();
  v1 = v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D5658Database_url;
  v2 = sub_235705830();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_2357017EC()
{
  return type metadata accessor for Database(0);
}

uint64_t type metadata accessor for Database(uint64_t a1)
{
  return sub_2357043B4(a1, qword_256263268);
}

uint64_t sub_235701808()
{
  uint64_t result;
  unint64_t v1;

  result = sub_235705830();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

ValueMetadata *type metadata accessor for ContentModifier()
{
  return &type metadata for ContentModifier;
}

uint64_t destroy for ModelDocumentProvider(_QWORD *a1)
{
  if (*a1)
    swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for ModelDocumentProvider(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  if (*a2)
  {
    v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for ModelDocumentProvider(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a2;
  if (!*a1)
  {
    if (v4)
    {
      v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_retain();
  swift_release();
LABEL_8:
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for ModelDocumentProvider(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a2;
  if (!*(_QWORD *)a1)
  {
    if (v4)
    {
      v6 = a2[1];
      *(_QWORD *)a1 = v4;
      *(_QWORD *)(a1 + 8) = v6;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[1];
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  swift_release();
LABEL_8:
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ModelDocumentProvider(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ModelDocumentProvider(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ModelDocumentProvider()
{
  return &type metadata for ModelDocumentProvider;
}

uint64_t sub_235701AE8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235701AF8(uint64_t a1)
{
  uint64_t result;

  result = sub_2356FAF5C(&qword_256262D28, type metadata accessor for ModelDocumentBox, (uint64_t)&unk_235707074);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_235701B38()
{
  unint64_t result;

  result = qword_2562633A0;
  if (!qword_2562633A0)
  {
    result = MEMORY[0x23B7D41F0](&unk_235706FD8, &type metadata for ContentModifier);
    atomic_store(result, (unint64_t *)&qword_2562633A0);
  }
  return result;
}

uint64_t sub_235701B7C()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_235701B88(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_235701B98(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

void sub_235701BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  id v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  _BYTE *v24;
  id v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[3];
  id v35[2];
  uint64_t aBlock[2];
  uint64_t (*v37)(uint64_t);
  void *v38;
  uint64_t (*v39)();
  uint64_t v40;
  char *v41;

  v4 = sub_235705830();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v41 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262E28);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2357059F8();
  type metadata accessor for ModelDocumentBox(0);
  v10 = *(_QWORD *)(swift_dynamicCastClassUnconditional()
                  + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_tempDocument);
  swift_retain();
  swift_unknownObjectRelease();
  if (v10)
  {
    sub_235700C40();
    swift_release();
  }
  sub_2357059F8();
  *(_QWORD *)(swift_dynamicCastClassUnconditional() + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_tempDocument) = 0;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v9, a2, v4);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v9, 0, 1, v4);
  sub_2357059F8();
  v11 = swift_dynamicCastClassUnconditional();
  v12 = *(_QWORD *)(v11 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_storeName);
  v13 = *(_QWORD *)(v11 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_storeName + 8);
  swift_bridgeObjectRetain();
  swift_unknownObjectRelease();
  type metadata accessor for TemporaryDocument(0);
  swift_allocObject();
  v14 = sub_235700538((uint64_t)v9, v12, v13);
  sub_2357059F8();
  *(_QWORD *)(swift_dynamicCastClassUnconditional() + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_tempDocument) = v14;
  swift_unknownObjectRelease();
  swift_release();
  sub_2357059F8();
  v15 = *(_QWORD *)(swift_dynamicCastClassUnconditional()
                  + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_tempDocument);
  swift_retain();
  v16 = swift_unknownObjectRelease();
  if (!v15)
  {
    sub_23570449C();
    swift_allocError();
    *v24 = 2;
    swift_willThrow();
    return;
  }
  MEMORY[0x24BDAC7A8](v16);
  v34[-2] = a1;
  v34[-1] = v15;
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1570]), sel_initWithFilePresenter_, a1);
  v35[0] = 0;
  v18 = sub_2357057DC();
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = sub_2357044E0;
  v19[3] = &v34[-4];
  v19[4] = v35;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = sub_235704508;
  *(_QWORD *)(v20 + 24) = v19;
  v39 = sub_2357052AC;
  v40 = v20;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  v37 = sub_235702B7C;
  v38 = &block_descriptor_87;
  v21 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v17, sel_coordinateReadingItemAtURL_options_error_byAccessor_, v18, 0, 0, v21);

  _Block_release(v21);
  LOBYTE(v18) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v18 & 1) != 0)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v35[0])
  {
    v22 = v35[0];
    swift_willThrow();

    v23 = v35[0];
    swift_release();
    swift_release();

    return;
  }

  v25 = v35[0];
  swift_release();

  v34[1] = sub_2357059F8();
  v34[0] = swift_dynamicCastClassUnconditional();
  v26 = v41;
  sub_23570037C((uint64_t)v41);
  sub_2357059F8();
  swift_dynamicCastClassUnconditional();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2357058FC();
  swift_release();
  swift_release();
  v27 = aBlock[0];
  if (!aBlock[0])
    goto LABEL_16;
  v28 = (uint64_t)v37;
  swift_retain();
  sub_235702DD0(v27);
  swift_unknownObjectRelease();
  sub_2357059F8();
  swift_dynamicCastClassUnconditional();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2357058FC();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  if (!aBlock[0])
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v30 = (uint64_t)v38;
  v29 = (uint64_t)v39;
  sub_235702DD0(aBlock[0]);
  sub_2357059F8();
  swift_dynamicCastClassUnconditional();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2357058FC();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  if (!v35[0])
  {
LABEL_18:
    __break(1u);
    return;
  }
  v31 = *((_QWORD *)v35[1] + 2);
  sub_235702DD0((uint64_t)v35[0]);
  type metadata accessor for Database(0);
  swift_allocObject();
  v32 = v34[2];
  v33 = sub_235701020(v26, v28, v30, v29, v31 == 0);
  if (v32)
  {
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_23570396C(v33);
    swift_release();
    swift_unknownObjectRelease();
    swift_release();
  }
}

id sub_235702278(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  void *v4;
  unsigned int v5;
  id v7;
  id v8[2];

  v8[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a2 + qword_256262D38);
  v3 = (void *)sub_2357057DC();
  v4 = (void *)sub_2357057DC();
  v8[0] = 0;
  v5 = objc_msgSend(v2, sel_copyItemAtURL_toURL_error_, v3, v4, v8);

  if (v5)
    return v8[0];
  v7 = v8[0];
  sub_2357057A0();

  return (id)swift_willThrow();
}

void sub_235702374(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  char isEscapingClosureAtFileLocation;
  id v17;
  id v18;
  _QWORD aBlock[6];
  id v20;

  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1570]), sel_initWithFilePresenter_, v5);
  v20 = 0;
  v11 = (void *)sub_2357057DC();
  if ((a3 & 1) != 0)
    v12 = 0;
  else
    v12 = a2;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a4;
  v13[3] = a5;
  v13[4] = &v20;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = sub_235705280;
  *(_QWORD *)(v14 + 24) = v13;
  aBlock[4] = sub_2357052B0;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235702B7C;
  aBlock[3] = &block_descriptor_98;
  v15 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_coordinateReadingItemAtURL_options_error_byAccessor_, v11, v12, 0, v15);

  _Block_release(v15);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    if (v20)
    {
      v17 = v20;
      swift_willThrow();

    }
    v18 = v20;
    swift_release();

  }
}

uint64_t sub_235702534(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  unsigned int v13;
  id v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24[3];

  v24[2] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = sub_2357057B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235705830();
  v22 = *(_QWORD *)(v8 - 8);
  v23 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(id *)(a2 + qword_256262D38);
  v21 = a1;
  v12 = (void *)sub_2357057DC();
  v24[0] = 0;
  v13 = objc_msgSend(v11, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v12, 1, 0, v24);

  if (v13)
  {
    v14 = v24[0];
    sub_2357059F8();
    type metadata accessor for ModelDocumentBox(0);
    v15 = *(_QWORD *)(swift_dynamicCastClassUnconditional()
                    + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_database);
    swift_retain();
    result = swift_unknownObjectRelease();
    if (v15)
    {
      sub_2357059F8();
      v17 = swift_dynamicCastClassUnconditional();
      v19 = *(void **)(v17 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_storeName);
      v18 = *(void **)(v17 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_storeName + 8);
      swift_bridgeObjectRetain();
      swift_unknownObjectRelease();
      v24[0] = v19;
      v24[1] = v18;
      (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDCD798], v4);
      sub_235704458();
      sub_235705824();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      swift_bridgeObjectRelease();
      sub_235701590((uint64_t)v10);
      (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v23);
      return swift_release();
    }
  }
  else
  {
    v20 = v24[0];
    sub_2357057A0();

    return swift_willThrow();
  }
  return result;
}

void sub_2357027B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[6];
  id v16;

  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1570]), sel_initWithFilePresenter_, v4);
  v16 = 0;
  v9 = (void *)sub_2357057DC();
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = &v16;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_23570527C;
  *(_QWORD *)(v11 + 24) = v10;
  v15[4] = sub_235704420;
  v15[5] = v11;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 1107296256;
  v15[2] = sub_235702B7C;
  v15[3] = &block_descriptor;
  v12 = _Block_copy(v15);
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_coordinateWritingItemAtURL_options_error_byAccessor_, v9, a2, 0, v12);

  _Block_release(v12);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((a2 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    if (v16)
    {
      v13 = v16;
      swift_willThrow();

    }
    v14 = v16;
    swift_release();

  }
}

uint64_t sub_23570296C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t inited;
  void *v8;
  id v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256263420);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256263428);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2357067D0;
  v8 = (void *)*MEMORY[0x24BDBCC80];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDBCC80];
  v9 = v8;
  sub_23570456C(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_2357057C4();
  result = swift_bridgeObjectRelease();
  if (!v2)
  {
    v11 = sub_235705788();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v6, 0, 1, v11);
    return sub_235704818((uint64_t)v6, a2, &qword_256263420);
  }
  return result;
}

BOOL sub_235702AAC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_235702AC0()
{
  sub_235705F44();
  sub_235705F50();
  return sub_235705F5C();
}

uint64_t sub_235702B04()
{
  return sub_235705F50();
}

uint64_t sub_235702B2C()
{
  sub_235705F44();
  sub_235705F50();
  return sub_235705F5C();
}

uint64_t sub_235702B7C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = sub_235705830();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_235705800();
  v6(v5);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_235702C10(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_235702C7C()
{
  uint64_t v0;

  v0 = sub_2357058CC();
  __swift_allocate_value_buffer(v0, qword_256264660);
  __swift_project_value_buffer(v0, (uint64_t)qword_256264660);
  return sub_2357058C0();
}

double sub_235702CF4@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;
  uint64_t v5;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2357058FC();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_235702D7C(uint64_t *a1)
{
  sub_235702EC0(*a1);
  return sub_2356FE9E0();
}

uint64_t sub_235702DD0(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_235702E08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262E08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_235702E50()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_235702E88(uint64_t a1)
{
  uint64_t v1;

  return sub_2356FE868(a1, (uint64_t *)(v1 + 16));
}

uint64_t *sub_235702E90(uint64_t *a1)
{
  sub_235702EC0(*a1);
  return a1;
}

uint64_t sub_235702EC0(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_235702EF8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2357058FC();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_235702F74()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  swift_retain();
  return sub_235705908();
}

uint64_t sub_235702FEC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2357058FC();
  swift_release();
  return swift_release();
}

uint64_t sub_235703054(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262E28);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v9 - v6;
  sub_235704798(a1, (uint64_t)&v9 - v6, &qword_256262E28);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235704798((uint64_t)v7, (uint64_t)v5, &qword_256262E28);
  swift_retain();
  sub_235705908();
  return sub_2357047DC((uint64_t)v7, &qword_256262E28);
}

uint64_t sub_23570314C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2357058FC();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2357031C8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_235705908();
}

uint64_t sub_235703238(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_235703308(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_235704360((uint64_t)v12, *a3);
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
      sub_235704360((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_235703308(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_235705E30();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2357034C0(a5, a6);
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
  v8 = sub_235705E90();
  if (!v8)
  {
    sub_235705EA8();
    __break(1u);
LABEL_17:
    result = sub_235705ED8();
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

uint64_t sub_2357034C0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_235703554(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23570372C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23570372C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_235703554(uint64_t a1, unint64_t a2)
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
      v3 = sub_2357036C8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_235705E84();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_235705EA8();
      __break(1u);
LABEL_10:
      v2 = sub_235705D58();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_235705ED8();
    __break(1u);
LABEL_14:
    result = sub_235705EA8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2357036C8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256263400);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23570372C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256263400);
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
  result = sub_235705ED8();
  __break(1u);
  return result;
}

unint64_t sub_235703878(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_235705E48();
  return sub_2357038A8(a1, v2);
}

unint64_t sub_2357038A8(uint64_t a1, uint64_t a2)
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
      sub_2357042D0(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x23B7D3D64](v9, a1);
      sub_23570430C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_23570396C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  id *v5;
  id v6;

  v3 = OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_database;
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_database))
  {
    swift_retain();
    swift_retain();
    sub_235705B18();
    swift_release();
    swift_release();
  }
  *(_QWORD *)(v1 + v3) = a1;
  swift_retain();
  result = swift_release();
  if (*(_QWORD *)(v1 + v3))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_235705908();
    v5 = (id *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_undoManager);
    swift_beginAccess();
    v6 = *v5;
    swift_retain();
    sub_235705B18();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_235703AA8()
{
  uint64_t result;
  uint64_t v1;

  type metadata accessor for ModelDocumentBox(0);
  if (swift_dynamicCastClass())
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_unknownObjectRetain();
    sub_2357058FC();
    swift_release();
    swift_release();
    if (v1)
    {
      swift_unknownObjectRelease();
      return v1;
    }
    __break(1u);
  }
  sub_235705E78();
  swift_bridgeObjectRelease();
  swift_getObjectType();
  sub_235705F68();
  sub_235705D4C();
  swift_bridgeObjectRelease();
  result = sub_235705EB4();
  __break(1u);
  return result;
}

uint64_t sub_235703BE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  void *v4;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  os_log_t v31;
  uint64_t v32;
  os_log_t v34;
  int v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v38 = sub_235705830();
  v40 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2357058CC();
  v39 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
    v10 = sub_2356FD3E4(MEMORY[0x24BEE4AF8]);
  MEMORY[0x24BDAC7A8](v10);
  *(&v34 - 2) = v3;
  swift_bridgeObjectRetain();
  sub_2357027B8(a3, 0, (uint64_t)sub_2357043E8, (uint64_t)&(&v34)[-4]);
  if (!v4)
    return swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_2562628E8 != -1)
    swift_once();
  v13 = v9;
  v14 = __swift_project_value_buffer(v9, (uint64_t)qword_256264660);
  v15 = v39;
  v16 = v12;
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v12, v14, v13);
  v17 = v40;
  v18 = v38;
  (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v8, a3, v38);
  v19 = v4;
  v20 = v4;
  v21 = sub_2357058B4();
  v22 = sub_235705DF4();
  v23 = v22;
  if (os_log_type_enabled(v21, v22))
  {
    v24 = swift_slowAlloc();
    v37 = v16;
    v25 = v24;
    v36 = swift_slowAlloc();
    v42 = v36;
    *(_DWORD *)v25 = 136315394;
    v35 = v23;
    v26 = sub_23570580C();
    v41 = sub_235703238(v26, v27, &v42);
    v34 = v21;
    sub_235705E24();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v8, v18);
    *(_WORD *)(v25 + 12) = 2080;
    v28 = v15;
    swift_getErrorValue();
    v29 = sub_235705F08();
    v41 = sub_235703238(v29, v30, &v42);
    sub_235705E24();
    swift_bridgeObjectRelease();

    v31 = v34;
    _os_log_impl(&dword_2356F2000, v34, (os_log_type_t)v35, "Failed to write the document at %s: %s.", (uint8_t *)v25, 0x16u);
    v32 = v36;
    swift_arrayDestroy();
    MEMORY[0x23B7D4298](v32, -1, -1);
    MEMORY[0x23B7D4298](v25, -1, -1);

    (*(void (**)(char *, uint64_t))(v28 + 8))(v37, v13);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v8, v18);

    (*(void (**)(char *, uint64_t))(v15 + 8))(v16, v13);
  }
  return swift_willThrow();
}

void sub_235703F88(void *a1)
{
  uint64_t v1;
  id *v3;
  id v4;
  id v5;
  id v6;

  v3 = (id *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_undoManager);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_database))
  {
    v6 = *v3;
    swift_retain();
    swift_retain();
    sub_235705B18();
    swift_release();
    swift_release();
  }
}

id sub_235704048()
{
  id v0;
  id v1;
  void *v2;
  uint64_t inited;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  id v12;
  id v13[16];

  v13[15] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBB6B0]), sel_init);
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBB738]), sel_initWithManagedObjectModel_, v0);

  v2 = (void *)sub_2357057DC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562633D8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2357067D0;
  v13[0] = (id)sub_235705D28();
  v13[1] = v4;
  sub_235705E60();
  v5 = sub_235704284();
  v6 = sub_235705E00();
  *(_QWORD *)(inited + 96) = v5;
  *(_QWORD *)(inited + 72) = v6;
  sub_2356FD3E4(inited);
  v7 = (void *)sub_235705CE0();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_2357057DC();
  v9 = *MEMORY[0x24BDBB580];
  v13[0] = 0;
  v10 = objc_msgSend(v1, sel_replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_storeType_error_, v2, v7, v8, 0, v9, v13);

  if (v10)
    return v13[0];
  v12 = v13[0];
  sub_2357057A0();

  return (id)swift_willThrow();
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

unint64_t sub_235704284()
{
  unint64_t result;

  result = qword_2562633E0;
  if (!qword_2562633E0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2562633E0);
  }
  return result;
}

_OWORD *sub_2357042C0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2357042D0(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_23570430C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
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

uint64_t sub_235704360(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t type metadata accessor for Database.Error(uint64_t a1)
{
  return sub_2357043B4(a1, qword_2562634C8);
}

uint64_t sub_2357043B4(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2357043E8(uint64_t a1)
{
  uint64_t v1;

  return sub_235702534(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_235704400()
{
  return swift_deallocObject();
}

uint64_t sub_235704410()
{
  return swift_deallocObject();
}

uint64_t sub_235704420()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
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

unint64_t sub_235704458()
{
  unint64_t result;

  result = qword_256263410;
  if (!qword_256263410)
  {
    result = MEMORY[0x23B7D41F0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256263410);
  }
  return result;
}

unint64_t sub_23570449C()
{
  unint64_t result;

  result = qword_256263418;
  if (!qword_256263418)
  {
    result = MEMORY[0x23B7D41F0](&unk_235707370, &type metadata for ModelDocumentError);
    atomic_store(result, (unint64_t *)&qword_256263418);
  }
  return result;
}

id sub_2357044E0(uint64_t a1)
{
  uint64_t v1;

  return sub_235702278(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2357044F8()
{
  return swift_deallocObject();
}

uint64_t sub_235704508(uint64_t a1)
{
  uint64_t v1;

  return sub_235702C10(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_235704524()
{
  return swift_deallocObject();
}

uint64_t sub_235704534()
{
  return swift_deallocObject();
}

uint64_t sub_235704544()
{
  return swift_deallocObject();
}

uint64_t sub_235704554(uint64_t a1)
{
  uint64_t v1;

  return sub_23570296C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_23570456C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256263430);
    v3 = sub_235705E6C();
    v4 = 0;
    v5 = v3 + 56;
    v31 = v1;
    v32 = a1 + 32;
    while (1)
    {
      v6 = *(void **)(v32 + 8 * v4);
      sub_235705D28();
      sub_235705F44();
      v7 = v6;
      sub_235705D40();
      v8 = sub_235705F5C();
      result = swift_bridgeObjectRelease();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = v8 & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = sub_235705D28();
        v17 = v16;
        if (v15 == sub_235705D28() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        v20 = sub_235705EFC();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        if ((v20 & 1) != 0)
          goto LABEL_4;
        v21 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v21;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v22 = sub_235705D28();
          v24 = v23;
          if (v22 == sub_235705D28() && v24 == v25)
            goto LABEL_3;
          v27 = sub_235705EFC();
          swift_bridgeObjectRelease();
          result = swift_bridgeObjectRelease();
          if ((v27 & 1) != 0)
            goto LABEL_4;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v11) = v7;
      v28 = *(_QWORD *)(v3 + 16);
      v29 = __OFADD__(v28, 1);
      v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t sub_235704798(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2357047DC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_235704818(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ModelDocumentError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ModelDocumentError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_235704948 + 4 * byte_235706E85[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23570497C + 4 * byte_235706E80[v4]))();
}

uint64_t sub_23570497C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235704984(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23570498CLL);
  return result;
}

uint64_t sub_235704998(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2357049A0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2357049A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2357049AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2357049B8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2357049C4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ModelDocumentError()
{
  return &type metadata for ModelDocumentError;
}

uint64_t *sub_2357049DC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v12 = a2[1];
      *a1 = *a2;
      a1[1] = v12;
      swift_bridgeObjectRetain();
LABEL_11:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      v8 = sub_235705830();
      v9 = *(_QWORD *)(v8 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262E28);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 16))(a1, a2, v8);
        (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
      }
      v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256263450) + 48);
      v14 = *(void **)((char *)a2 + v13);
      v15 = v14;
      *(uint64_t *)((char *)a1 + v13) = (uint64_t)v14;
      goto LABEL_11;
    }
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  return a1;
}

void sub_235704B30(uint64_t a1)
{
  int EnumCaseMultiPayload;
  uint64_t v3;
  uint64_t v4;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    swift_bridgeObjectRelease();
  }
  else if (!EnumCaseMultiPayload)
  {
    v3 = sub_235705830();
    v4 = *(_QWORD *)(v3 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1, v3))
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);

  }
}

_QWORD *sub_235704BD4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    swift_bridgeObjectRetain();
LABEL_9:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (!EnumCaseMultiPayload)
  {
    v7 = sub_235705830();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262E28);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256263450) + 48);
    v12 = *(void **)((char *)a2 + v11);
    v13 = v12;
    *(_QWORD *)((char *)a1 + v11) = v12;
    goto LABEL_9;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

_QWORD *sub_235704D00(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  if (a1 != a2)
  {
    sub_235704E44((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
LABEL_10:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      v7 = sub_235705830();
      v8 = *(_QWORD *)(v7 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262E28);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v8 + 16))(a1, a2, v7);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256263450) + 48);
      v11 = *(void **)((char *)a2 + v10);
      v12 = v11;
      *(_QWORD *)((char *)a1 + v10) = v11;
      goto LABEL_10;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_235704E44(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Database.Error(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_235704E80(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = sub_235705830();
    v7 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262E28);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
    v9 = __swift_instantiateConcreteTypeFromMangledName(qword_256263450);
    *(_QWORD *)&a1[*(int *)(v9 + 48)] = *(_QWORD *)&a2[*(int *)(v9 + 48)];
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_235704F80(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 != a2)
  {
    sub_235704E44((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = sub_235705830();
      v7 = *(_QWORD *)(v6 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262E28);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
      v9 = __swift_instantiateConcreteTypeFromMangledName(qword_256263450);
      *(_QWORD *)&a1[*(int *)(v9 + 48)] = *(_QWORD *)&a2[*(int *)(v9 + 48)];
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_235705090(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_23570509C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_2357050B0()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_2357050C0()
{
  unint64_t v0;
  _QWORD v1[6];

  sub_235700FBC();
  if (v0 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v1[4] = v1;
    v1[5] = &unk_235706F50;
    swift_initEnumMetadataMultiPayload();
  }
}

unint64_t sub_235705144()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256263500;
  if (!qword_256263500)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2562633D0);
    v2[0] = sub_2357051E0(&qword_256263508, &qword_2562633C8, MEMORY[0x24BDEFB78]);
    v2[1] = sub_2357051E0(&qword_256262998, &qword_256262990, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7D41F0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256263500);
  }
  return result;
}

uint64_t sub_2357051E0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B7D41F0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_235705224()
{
  unint64_t result;

  result = qword_256263510;
  if (!qword_256263510)
  {
    result = MEMORY[0x23B7D41F0](&unk_235707348, &type metadata for ModelDocumentError);
    atomic_store(result, (unint64_t *)&qword_256263510);
  }
  return result;
}

uint64_t sub_2357052B4()
{
  uint64_t result;

  sub_235705310();
  result = sub_235705E0C();
  qword_2562646B0 = result;
  return result;
}

unint64_t sub_235705310()
{
  unint64_t result;

  result = qword_256263518;
  if (!qword_256263518)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256263518);
  }
  return result;
}

uint64_t sub_23570534C()
{
  uint64_t v1;

  sub_2356F48CC();
  sub_235705A4C();
  return v1;
}

uint64_t EnvironmentValues.modelContext.getter()
{
  uint64_t result;
  uint64_t v1;

  sub_2356F48CC();
  sub_235705A4C();
  result = v1;
  if (!v1)
  {
    if (qword_2562628E0 != -1)
      swift_once();
    return swift_retain();
  }
  return result;
}

uint64_t sub_2357053F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  sub_2356F48CC();
  sub_235705A4C();
  result = v3;
  if (!v3)
  {
    if (qword_2562628E0 != -1)
      swift_once();
    result = swift_retain();
  }
  *a1 = result;
  return result;
}

uint64_t sub_235705478()
{
  sub_2356F48CC();
  swift_retain();
  return sub_235705A58();
}

uint64_t EnvironmentValues.modelContext.setter()
{
  sub_2356F48CC();
  return sub_235705A58();
}

uint64_t (*EnvironmentValues.modelContext.modify(uint64_t *a1))(_QWORD *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;

  a1[2] = v1;
  a1[3] = sub_2356F48CC();
  sub_235705A4C();
  v3 = a1[1];
  if (!v3)
  {
    if (qword_2562628E0 != -1)
      swift_once();
    v3 = swift_retain();
  }
  *a1 = v3;
  return sub_2357055A4;
}

uint64_t sub_2357055A4(_QWORD *a1, char a2)
{
  a1[1] = *a1;
  if ((a2 & 1) == 0)
    return sub_235705A58();
  swift_retain();
  sub_235705A58();
  return swift_release();
}

ValueMetadata *type metadata accessor for ModelContextEnvironmentKey()
{
  return &type metadata for ModelContextEnvironmentKey;
}

void sub_23570563C(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_235705644()
{
  sub_235705694();
  return sub_2357059B0();
}

unint64_t sub_235705694()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_256263520;
  if (!qword_256263520)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256262E18);
    v2 = sub_2357056F8();
    result = MEMORY[0x23B7D41F0](MEMORY[0x24BEE4AB8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256263520);
  }
  return result;
}

unint64_t sub_2357056F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256262AE8;
  if (!qword_256262AE8)
  {
    v1 = sub_235705B54();
    result = MEMORY[0x23B7D41F0](MEMORY[0x24BDEA878], v1);
    atomic_store(result, (unint64_t *)&qword_256262AE8);
  }
  return result;
}

uint64_t sub_235705740()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_23570574C()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_235705758()
{
  return MEMORY[0x24BDCBEB8]();
}

uint64_t sub_235705764()
{
  return MEMORY[0x24BDCBEC0]();
}

uint64_t sub_235705770()
{
  return MEMORY[0x24BDCBF10]();
}

uint64_t sub_23570577C()
{
  return MEMORY[0x24BDCC7F8]();
}

uint64_t sub_235705788()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_235705794()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2357057A0()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2357057AC()
{
  return MEMORY[0x24BDCD748]();
}

uint64_t sub_2357057B8()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_2357057C4()
{
  return MEMORY[0x24BDCD848]();
}

uint64_t sub_2357057D0()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_2357057DC()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2357057E8()
{
  return MEMORY[0x24BEE6120]();
}

uint64_t sub_2357057F4()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_235705800()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_23570580C()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_235705818()
{
  return MEMORY[0x24BDCDA48]();
}

uint64_t sub_235705824()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_235705830()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23570583C()
{
  return MEMORY[0x24BDCF6D8]();
}

uint64_t sub_235705848()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_235705854()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_235705860()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_23570586C()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_235705878()
{
  return MEMORY[0x24BEE6190]();
}

uint64_t sub_235705884()
{
  return MEMORY[0x24BEE6360]();
}

uint64_t sub_235705890()
{
  return MEMORY[0x24BEE6368]();
}

uint64_t sub_23570589C()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_2357058A8()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_2357058B4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2357058C0()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2357058CC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2357058D8()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_2357058E4()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_2357058F0()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_2357058FC()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_235705908()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_235705914()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_235705920()
{
  return MEMORY[0x24BDEAF40]();
}

uint64_t sub_23570592C()
{
  return MEMORY[0x24BDEAF48]();
}

uint64_t sub_235705938()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_235705944()
{
  return MEMORY[0x24BDEB8B0]();
}

uint64_t sub_235705950()
{
  return MEMORY[0x24BDEBC60]();
}

uint64_t sub_23570595C()
{
  return MEMORY[0x24BDEBC78]();
}

uint64_t sub_235705968()
{
  return MEMORY[0x24BDEBC80]();
}

uint64_t sub_235705974()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_235705980()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_23570598C()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_235705998()
{
  return MEMORY[0x24BDEC058]();
}

uint64_t sub_2357059A4()
{
  return MEMORY[0x24BDEC060]();
}

uint64_t sub_2357059B0()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_2357059BC()
{
  return MEMORY[0x24BDECC88]();
}

uint64_t sub_2357059C8()
{
  return MEMORY[0x24BDECE58]();
}

uint64_t sub_2357059D4()
{
  return MEMORY[0x24BDECE68]();
}

uint64_t sub_2357059E0()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_2357059EC()
{
  return MEMORY[0x24BDED5F8]();
}

uint64_t sub_2357059F8()
{
  return MEMORY[0x24BDED878]();
}

uint64_t sub_235705A04()
{
  return MEMORY[0x24BDED880]();
}

uint64_t sub_235705A10()
{
  return MEMORY[0x24BDEDF40]();
}

uint64_t sub_235705A1C()
{
  return MEMORY[0x24BDEDF48]();
}

uint64_t sub_235705A28()
{
  return MEMORY[0x24BDEDF50]();
}

uint64_t sub_235705A34()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_235705A40()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_235705A4C()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_235705A58()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_235705A64()
{
  return MEMORY[0x24BDEE618]();
}

uint64_t sub_235705A70()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_235705A7C()
{
  return MEMORY[0x24BDF2370]();
}

uint64_t sub_235705A88()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_235705A94()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t sub_235705AA0()
{
  return MEMORY[0x24BDF41B0]();
}

uint64_t sub_235705AAC()
{
  return MEMORY[0x24BDF41B8]();
}

uint64_t sub_235705AB8()
{
  return MEMORY[0x24BDF41D8]();
}

uint64_t sub_235705AC4()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_235705AD0()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_235705ADC()
{
  return MEMORY[0x24BDF42C0]();
}

uint64_t sub_235705AE8()
{
  return MEMORY[0x24BDEA7B0]();
}

uint64_t sub_235705AF4()
{
  return MEMORY[0x24BDEA7B8]();
}

uint64_t sub_235705B00()
{
  return MEMORY[0x24BDEA7C0]();
}

uint64_t sub_235705B0C()
{
  return MEMORY[0x24BDEA7F0]();
}

uint64_t sub_235705B18()
{
  return MEMORY[0x24BDEA7F8]();
}

uint64_t sub_235705B24()
{
  return MEMORY[0x24BDEA810]();
}

uint64_t sub_235705B30()
{
  return MEMORY[0x24BDEA828]();
}

uint64_t sub_235705B3C()
{
  return MEMORY[0x24BDEA858]();
}

uint64_t sub_235705B48()
{
  return MEMORY[0x24BDEA860]();
}

uint64_t sub_235705B54()
{
  return MEMORY[0x24BDEA868]();
}

uint64_t sub_235705B60()
{
  return MEMORY[0x24BDEA888]();
}

uint64_t sub_235705B6C()
{
  return MEMORY[0x24BDEA8B8]();
}

uint64_t sub_235705B78()
{
  return MEMORY[0x24BDEA8C0]();
}

uint64_t sub_235705B84()
{
  return MEMORY[0x24BDEA8C8]();
}

uint64_t sub_235705B90()
{
  return MEMORY[0x24BDEA8D0]();
}

uint64_t sub_235705B9C()
{
  return MEMORY[0x24BDEA8D8]();
}

uint64_t sub_235705BA8()
{
  return MEMORY[0x24BDEA8E0]();
}

uint64_t sub_235705BB4()
{
  return MEMORY[0x24BDEA8E8]();
}

uint64_t sub_235705BC0()
{
  return MEMORY[0x24BDEA8F0]();
}

uint64_t sub_235705BCC()
{
  return MEMORY[0x24BDEA948]();
}

uint64_t sub_235705BD8()
{
  return MEMORY[0x24BDEA950]();
}

uint64_t sub_235705BE4()
{
  return MEMORY[0x24BDEA960]();
}

uint64_t sub_235705BF0()
{
  return MEMORY[0x24BDEA968]();
}

uint64_t sub_235705BFC()
{
  return MEMORY[0x24BDEA980]();
}

uint64_t sub_235705C08()
{
  return MEMORY[0x24BDEAA18]();
}

uint64_t sub_235705C14()
{
  return MEMORY[0x24BDEAA20]();
}

uint64_t sub_235705C20()
{
  return MEMORY[0x24BDEAA28]();
}

uint64_t sub_235705C2C()
{
  return MEMORY[0x24BDEAA38]();
}

uint64_t sub_235705C38()
{
  return MEMORY[0x24BDEAA40]();
}

uint64_t sub_235705C44()
{
  return MEMORY[0x24BDEAA50]();
}

uint64_t sub_235705C50()
{
  return MEMORY[0x24BDEAA60]();
}

uint64_t sub_235705C5C()
{
  return MEMORY[0x24BDEAA68]();
}

uint64_t sub_235705C68()
{
  return MEMORY[0x24BDEAA98]();
}

uint64_t sub_235705C74()
{
  return MEMORY[0x24BDEAAB0]();
}

uint64_t sub_235705C80()
{
  return MEMORY[0x24BDEAB40]();
}

uint64_t sub_235705C8C()
{
  return MEMORY[0x24BDEAB48]();
}

uint64_t sub_235705C98()
{
  return MEMORY[0x24BDEABC8]();
}

uint64_t sub_235705CA4()
{
  return MEMORY[0x24BDEABD8]();
}

uint64_t sub_235705CB0()
{
  return MEMORY[0x24BDEABE0]();
}

uint64_t sub_235705CBC()
{
  return MEMORY[0x24BDEAC18]();
}

uint64_t sub_235705CC8()
{
  return MEMORY[0x24BDEAC20]();
}

uint64_t sub_235705CD4()
{
  return MEMORY[0x24BDEAC30]();
}

uint64_t sub_235705CE0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_235705CEC()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_235705CF8()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_235705D04()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_235705D10()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_235705D1C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_235705D28()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_235705D34()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_235705D40()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_235705D4C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_235705D58()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_235705D64()
{
  return MEMORY[0x24BEE0EE8]();
}

uint64_t sub_235705D70()
{
  return MEMORY[0x24BEE1138]();
}

uint64_t sub_235705D7C()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_235705D88()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_235705D94()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_235705DA0()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_235705DAC()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_235705DB8()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_235705DC4()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_235705DD0()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_235705DDC()
{
  return MEMORY[0x24BDCFF58]();
}

uint64_t sub_235705DE8()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_235705DF4()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_235705E00()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_235705E0C()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_235705E18()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_235705E24()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_235705E30()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_235705E3C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_235705E48()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_235705E54()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_235705E60()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_235705E6C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_235705E78()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_235705E84()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_235705E90()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_235705E9C()
{
  return MEMORY[0x24BEE2868]();
}

uint64_t sub_235705EA8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_235705EB4()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_235705EC0()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_235705ECC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_235705ED8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_235705EE4()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_235705EF0()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_235705EFC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_235705F08()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_235705F14()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_235705F20()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_235705F2C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_235705F38()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_235705F44()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_235705F50()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_235705F5C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_235705F68()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AGCompareValues()
{
  return MEMORY[0x24BE096C8]();
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x24BEE4C48]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

uint64_t swift_task_getMainExecutor()
{
  return MEMORY[0x24BEE7240]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x24BEE7250]();
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

