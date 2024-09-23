id ExcResourceReportPaths()
{
  return +[DiagnosticReportCollectorBridge ExcResourceReportPaths](_TtC15CoreDiagnostics31DiagnosticReportCollectorBridge, "ExcResourceReportPaths");
}

BOOL WriteJetsamMemoryReport(uint64_t a1, uint64_t a2)
{
  return +[CompatibilityBridge WriteJetsamMemoryReportWithVisibilityEndowmentSet:audioAssertionSet:](_TtC15CoreDiagnostics19CompatibilityBridge, "WriteJetsamMemoryReportWithVisibilityEndowmentSet:audioAssertionSet:", a1, a2);
}

id DiagnosticPatternMatching.__allocating_init(type:)(int a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return DiagnosticPatternMatching.init(type:)(a1);
}

id DiagnosticPatternMatching.init(type:)(int a1)
{
  char *v1;
  uint64_t ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  objc_class *v20;
  objc_super v21;
  __int128 v22;
  __int128 v23;
  _UNKNOWN **v24;

  ObjectType = swift_getObjectType();
  v4 = sub_2390F9404();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2390F93F8();
  MEMORY[0x24BDAC7A8](v9, v10);
  v11 = sub_2390F926C();
  MEMORY[0x24BDAC7A8](v11, v12);
  *(_DWORD *)&v1[OBJC_IVAR____SwiftDiagnosticPatternMatching_type] = a1;
  v20 = (objc_class *)ObjectType;
  if (a1 == 2)
  {
    v13 = v1;
    if ((sub_2390ECFD4() & 1) != 0)
    {
      v24 = 0;
      v22 = 0u;
      v23 = 0u;
    }
    else
    {
      *((_QWORD *)&v23 + 1) = &type metadata for PanicMatcher;
      v24 = &off_250A6A998;
    }
    v16 = (uint64_t)&v13[OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher];
    sub_2390E9648((uint64_t)&v22, (uint64_t)&v13[OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher]);
    sub_2390E9690(v16, (uint64_t)&v22);
    v17 = *((_QWORD *)&v23 + 1);
    sub_2390E9450((uint64_t)&v22);
    if (v17)
    {
      sub_2390E96D8();
      sub_2390F9260();
      *(_QWORD *)&v22 = MEMORY[0x24BEE4AF8];
      sub_2390E9EB8(&qword_25691CEF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25691CEF8);
      sub_2390E9714();
      sub_2390F947C();
      (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v8, *MEMORY[0x24BEE5750], v4);
      *(_QWORD *)&v13[OBJC_IVAR____SwiftDiagnosticPatternMatching_asyncQueue] = sub_2390F9410();

      v21.receiver = v13;
      v21.super_class = v20;
      return objc_msgSendSuper2(&v21, sel_init);
    }
  }
  else
  {
    v14 = &v1[OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher];
    *(_OWORD *)v14 = 0u;
    *((_OWORD *)v14 + 1) = 0u;
    *((_QWORD *)v14 + 4) = 0;
    v15 = v1;
  }
  sub_2390E9450((uint64_t)&v1[OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher]);

  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t DiagnosticPatternMatching.getMatcherType()()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + OBJC_IVAR____SwiftDiagnosticPatternMatching_type);
}

Swift::Bool __swiftcall DiagnosticPatternMatching.isPatternPayloadAvailable()()
{
  uint64_t v0;
  BOOL v1;
  _BYTE v3[24];
  uint64_t v4;

  sub_2390E9690(v0 + OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher, (uint64_t)v3);
  if (v4)
    v1 = sub_2390ED388();
  else
    v1 = 0;
  sub_2390E9450((uint64_t)v3);
  return v1;
}

uint64_t DiagnosticPatternMatching.lookForPatternAsync(report:takeAction:callback:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2390E9CA0(a1, a3, a4);
}

uint64_t sub_2390E8F84(uint64_t a1, void *a2, uint64_t (*a3)(_QWORD))
{
  char v5;
  id v7[5];

  sub_2390E9690(a1 + OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher, (uint64_t)v7);
  if (v7[3])
    v5 = sub_2390ED4F4(a2);
  else
    v5 = 0;
  sub_2390E9450((uint64_t)v7);
  return a3(v5 & 1);
}

uint64_t sub_2390E9068(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

id DiagnosticPatternMatching.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void DiagnosticPatternMatching.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id DiagnosticPatternMatching.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL sub_2390E91EC(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2390E9200(uint64_t a1, uint64_t a2)
{
  return sub_2390E9348(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E8]);
}

uint64_t sub_2390E920C(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_2390F929C();
  *a2 = 0;
  return result;
}

uint64_t sub_2390E9280(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_2390F92A8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2390E92FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_2390F92B4();
  v2 = sub_2390F9290();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2390E933C(uint64_t a1, uint64_t a2)
{
  return sub_2390E9348(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_2390E9348(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_2390F92B4();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2390E9384()
{
  sub_2390F92B4();
  sub_2390F92FC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2390E93C4()
{
  uint64_t v0;

  sub_2390F92B4();
  sub_2390F962C();
  sub_2390F92FC();
  v0 = sub_2390F9644();
  swift_bridgeObjectRelease();
  return v0;
}

_DWORD *sub_2390E9434@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_2390E9444(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t sub_2390E9450(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691CEE0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B838200]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2390E94D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_2390F92B4();
  v2 = v1;
  if (v0 == sub_2390F92B4() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_2390F95CC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2390E9558@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2390F9290();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2390E959C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2390F92B4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2390E95C4()
{
  sub_2390E9EB8(&qword_25691CF60, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_2390F9E38);
  sub_2390E9EB8(&qword_25691CF68, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_2390F9DD8);
  return sub_2390F9548();
}

uint64_t sub_2390E9648(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691CEE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2390E9690(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691CEE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2390E96D8()
{
  unint64_t result;

  result = qword_25691CEE8;
  if (!qword_25691CEE8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25691CEE8);
  }
  return result;
}

unint64_t sub_2390E9714()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25691CF00;
  if (!qword_25691CF00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25691CEF8);
    result = MEMORY[0x23B838218](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_25691CF00);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B83820C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t _s15CoreDiagnostics25DiagnosticPatternMatchingC07lookForD06report10takeActionSbAA10CriterialsC_SbtF_0(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  char v10;
  uint64_t v12;
  uint64_t v13;

  v3 = (uint64_t)v1 + OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher;
  sub_2390E9690((uint64_t)v1 + OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher, (uint64_t)&v12);
  v4 = v13;
  sub_2390E9450((uint64_t)&v12);
  if (v4)
  {
    sub_2390E9690(v3, (uint64_t)&v12);
    if (v13)
      v10 = sub_2390ED4F4(a1);
    else
      v10 = 0;
    sub_2390E9450((uint64_t)&v12);
  }
  else
  {
    if (qword_25691CEC0 != -1)
      swift_once();
    v5 = sub_2390F9254();
    __swift_project_value_buffer(v5, (uint64_t)qword_25691E300);
    v6 = v1;
    v7 = sub_2390F9230();
    v8 = sub_2390F93EC();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v9 = 67109120;
      LODWORD(v12) = *(_DWORD *)&v6[OBJC_IVAR____SwiftDiagnosticPatternMatching_type];
      sub_2390F944C();

      _os_log_impl(&dword_2390E7000, v7, v8, "there is no available matcher with type %u", v9, 8u);
      MEMORY[0x23B8382A8](v9, -1, -1);

    }
    else
    {

    }
    v10 = 0;
  }
  return v10 & 1;
}

uint64_t sub_2390E9CA0(void *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  NSObject *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  id v12;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v15[6];

  v7 = *(NSObject **)&v3[OBJC_IVAR____SwiftDiagnosticPatternMatching_asyncQueue];
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v3;
  v8[3] = a1;
  v8[4] = a2;
  v8[5] = a3;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_2390E9FBC;
  *(_QWORD *)(v9 + 24) = v8;
  v15[4] = sub_2390E9FD8;
  v15[5] = v9;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 1107296256;
  v15[2] = sub_2390E9068;
  v15[3] = &block_descriptor;
  v10 = _Block_copy(v15);
  v11 = v3;
  v12 = a1;
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_async_and_wait(v7, v10);
  _Block_release(v10);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

uint64_t type metadata accessor for DiagnosticPatternMatching()
{
  return objc_opt_self();
}

uint64_t method lookup function for DiagnosticPatternMatching()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DiagnosticPatternMatching.__allocating_init(type:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

void type metadata accessor for pattern_matching_type(uint64_t a1)
{
  sub_2390E9E48(a1, &qword_25691CF38);
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
  sub_2390E9E48(a1, &qword_25691CF40);
}

void sub_2390E9E48(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2390E9E8C()
{
  return sub_2390E9EB8(&qword_25691CF48, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_2390F9D9C);
}

uint64_t sub_2390E9EB8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B838218](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2390E9EF8()
{
  return sub_2390E9EB8(&qword_25691CF50, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_2390F9D70);
}

uint64_t sub_2390E9F24()
{
  return sub_2390E9EB8(&qword_25691CF58, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_2390F9E0C);
}

uint64_t sub_2390E9F50()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_2390E9F74(char a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 16) + 16))(*(_QWORD *)(v1 + 16), a1 & 1);
}

uint64_t sub_2390E9F88()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2390E9FBC()
{
  uint64_t v0;

  return sub_2390E8F84(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(uint64_t (**)(_QWORD))(v0 + 32));
}

uint64_t sub_2390E9FC8()
{
  return swift_deallocObject();
}

uint64_t sub_2390E9FD8()
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

id Criterials.__allocating_init(id:type:path:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  objc_super v18;

  v13 = (char *)objc_allocWithZone(v6);
  v14 = &v13[OBJC_IVAR____SwiftCriterials_incidentID];
  *(_QWORD *)v14 = a1;
  *((_QWORD *)v14 + 1) = a2;
  v15 = &v13[OBJC_IVAR____SwiftCriterials_logType];
  *(_QWORD *)v15 = a3;
  *((_QWORD *)v15 + 1) = a4;
  v16 = &v13[OBJC_IVAR____SwiftCriterials_panicReportPath];
  *(_QWORD *)v16 = a5;
  *((_QWORD *)v16 + 1) = a6;
  v18.receiver = v13;
  v18.super_class = v6;
  return objc_msgSendSuper2(&v18, sel_init);
}

id Criterials.init(id:type:path:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  objc_super v11;

  v7 = &v6[OBJC_IVAR____SwiftCriterials_incidentID];
  *(_QWORD *)v7 = a1;
  *((_QWORD *)v7 + 1) = a2;
  v8 = &v6[OBJC_IVAR____SwiftCriterials_logType];
  *(_QWORD *)v8 = a3;
  *((_QWORD *)v8 + 1) = a4;
  v9 = &v6[OBJC_IVAR____SwiftCriterials_panicReportPath];
  *(_QWORD *)v9 = a5;
  *((_QWORD *)v9 + 1) = a6;
  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for Criterials();
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t type metadata accessor for Criterials()
{
  return objc_opt_self();
}

id Criterials.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void Criterials.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id Criterials.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Criterials();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for Criterials()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Criterials.__allocating_init(id:type:path:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_2390EA300()
{
  uint64_t v0;

  v0 = sub_2390F9254();
  __swift_allocate_value_buffer(v0, qword_25691E300);
  __swift_project_value_buffer(v0, (uint64_t)qword_25691E300);
  return sub_2390F923C();
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

id sub_2390EA3BC(uint64_t a1)
{
  id v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;

  if (MEMORY[0x24BEBA900])
  {
    v1 = objc_msgSend((id)objc_opt_self(), sel_clientWithIdentifier_, a1);
    if (qword_25691CEC0 != -1)
      swift_once();
    v2 = sub_2390F9254();
    __swift_project_value_buffer(v2, (uint64_t)qword_25691E300);
    v3 = sub_2390F9230();
    v4 = sub_2390F93EC();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2390E7000, v3, v4, "found trial clinet", v5, 2u);
      MEMORY[0x23B8382A8](v5, -1, -1);
    }

  }
  else
  {
    if (qword_25691CEC0 != -1)
      swift_once();
    v6 = sub_2390F9254();
    __swift_project_value_buffer(v6, (uint64_t)qword_25691E300);
    v7 = sub_2390F9230();
    v8 = sub_2390F93EC();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2390E7000, v7, v8, "Trial is not available on this OS", v9, 2u);
      MEMORY[0x23B8382A8](v9, -1, -1);
    }

    return 0;
  }
  return v1;
}

ValueMetadata *type metadata accessor for PanicMatcher()
{
  return &type metadata for PanicMatcher;
}

uint64_t sub_2390EA588(char a1)
{
  return *(_QWORD *)&aTelemetraction[8 * a1];
}

uint64_t sub_2390EA5A8(char *a1, char *a2)
{
  return sub_2390EA5B4(*a1, *a2);
}

uint64_t sub_2390EA5B4(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aTelemetraction[8 * a1] == *(_QWORD *)&aTelemetraction[8 * a2]
    && *(_QWORD *)&aYMode[8 * a1] == *(_QWORD *)&aYMode[8 * a2])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_2390F95CC();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_2390EA638()
{
  return sub_2390EA640();
}

uint64_t sub_2390EA640()
{
  sub_2390F962C();
  sub_2390F92FC();
  swift_bridgeObjectRelease();
  return sub_2390F9644();
}

uint64_t sub_2390EA6A8()
{
  return sub_2390EA6B0();
}

uint64_t sub_2390EA6B0()
{
  sub_2390F92FC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2390EA6F0()
{
  return sub_2390EA6F8();
}

uint64_t sub_2390EA6F8()
{
  sub_2390F962C();
  sub_2390F92FC();
  swift_bridgeObjectRelease();
  return sub_2390F9644();
}

uint64_t sub_2390EA75C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2390EE5B0();
  *a1 = result;
  return result;
}

uint64_t sub_2390EA788@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2390EA588(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2390EA7B0()
{
  char *v0;

  return sub_2390EA588(*v0);
}

uint64_t sub_2390EA7B8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2390EE5B0();
  *a1 = result;
  return result;
}

uint64_t sub_2390EA7DC()
{
  return 0;
}

void sub_2390EA7E8(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_2390EA7F4()
{
  sub_2390EE84C();
  return sub_2390F9680();
}

uint64_t sub_2390EA81C()
{
  sub_2390EE84C();
  return sub_2390F968C();
}

uint64_t sub_2390EA844(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  __int128 v11;
  _OWORD v13[3];
  uint64_t v14;
  char v15;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691D050);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2390EE84C();
  sub_2390F9668();
  LOBYTE(v13[0]) = 0;
  sub_2390F95A8();
  if (!v2)
  {
    v10 = *(_BYTE *)(v3 + 20);
    LOBYTE(v13[0]) = 1;
    v15 = v10;
    sub_2390F959C();
    v11 = *(_OWORD *)(v3 + 40);
    v13[0] = *(_OWORD *)(v3 + 24);
    v13[1] = v11;
    v13[2] = *(_OWORD *)(v3 + 56);
    v14 = *(_QWORD *)(v3 + 72);
    v15 = 2;
    sub_2390EE8D4();
    sub_2390F95B4();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

__n128 sub_2390EA9BC@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  _OWORD v6[5];

  sub_2390EE5F8(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v6[4];
    result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_2390EAA04(_QWORD *a1)
{
  return sub_2390EA844(a1);
}

uint64_t sub_2390EAA18(char a1)
{
  return *(_QWORD *)&aBugtype_0[8 * a1];
}

BOOL sub_2390EAA38(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2390EAA4C()
{
  sub_2390F962C();
  sub_2390F9638();
  return sub_2390F9644();
}

uint64_t sub_2390EAA90()
{
  return sub_2390F9638();
}

uint64_t sub_2390EAAB8()
{
  sub_2390F962C();
  sub_2390F9638();
  return sub_2390F9644();
}

uint64_t sub_2390EAAF8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE v11[16];
  __int128 v12;
  uint64_t v13;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691D090);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2390EF030();
  sub_2390F9668();
  LOBYTE(v12) = 0;
  sub_2390F95A8();
  if (!v2)
  {
    LOBYTE(v12) = 1;
    sub_2390F95A8();
    v12 = *(_OWORD *)(v3 + 32);
    v13 = *(_QWORD *)(v3 + 48);
    v11[15] = 2;
    sub_2390EF0B8();
    sub_2390F95B4();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t sub_2390EAC54()
{
  char *v0;

  return sub_2390EAA18(*v0);
}

uint64_t sub_2390EAC5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2390EEC90(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2390EAC80()
{
  sub_2390EF030();
  return sub_2390F9680();
}

uint64_t sub_2390EACA8()
{
  sub_2390EF030();
  return sub_2390F968C();
}

double sub_2390EACD0@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;
  uint64_t v8;

  sub_2390EEDCC(a1, (uint64_t *)v6);
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

uint64_t sub_2390EAD1C(_QWORD *a1)
{
  return sub_2390EAAF8(a1);
}

uint64_t sub_2390EAD30(char a1)
{
  if ((a1 & 1) != 0)
    return 0x61724663696E6170;
  else
    return 0xD000000000000011;
}

uint64_t sub_2390EAD74(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v12[2];
  char v13;
  char v14;

  v12[0] = a4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691D0D8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2390EF7C8();
  sub_2390F9668();
  v14 = 0;
  sub_2390F95A8();
  if (!v4)
  {
    v12[1] = v12[0];
    v13 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691D0C8);
    sub_2390EF80C(&qword_25691D0E0, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_2390F9590();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

BOOL sub_2390EAED8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2390EAEF0()
{
  char *v0;

  return sub_2390EAD30(*v0);
}

uint64_t sub_2390EAEF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2390EF4EC(a1, a2);
  *a3 = result;
  return result;
}

void sub_2390EAF1C(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2390EAF28()
{
  sub_2390EF7C8();
  return sub_2390F9680();
}

uint64_t sub_2390EAF50()
{
  sub_2390EF7C8();
  return sub_2390F968C();
}

uint64_t sub_2390EAF78@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_2390EF5E8(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_2390EAFA4(_QWORD *a1)
{
  uint64_t *v1;

  return sub_2390EAD74(a1, *v1, v1[1], v1[2]);
}

void sub_2390EAFC0()
{
  qword_25691E320 = MEMORY[0x24BEE4AF8];
}

uint64_t sub_2390EAFD4(uint64_t a1, unint64_t a2)
{
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
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
  char *v35;
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
  _BOOL4 v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  __int128 *v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  NSObject *v61;
  os_log_type_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  char *v74;
  char *v75;
  char *v76;
  char *v77;
  char *v78;
  char *v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  __int128 v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89[3];
  uint64_t v90;

  v83 = sub_2390F94E8();
  v84 = *(_QWORD *)(v83 - 8);
  v5 = MEMORY[0x24BDAC7A8](v83, v4);
  v7 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v5, v8);
  v79 = (char *)&v70 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9, v11);
  v81 = (char *)&v70 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12, v14);
  v17 = (char *)&v70 - v16;
  v19 = MEMORY[0x24BDAC7A8](v15, v18);
  *(_QWORD *)&v86 = (char *)&v70 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19, v21);
  v24 = (char *)&v70 - v23;
  v26 = MEMORY[0x24BDAC7A8](v22, v25);
  v28 = (char *)&v70 - v27;
  v30 = MEMORY[0x24BDAC7A8](v26, v29);
  v75 = (char *)&v70 - v31;
  v33 = MEMORY[0x24BDAC7A8](v30, v32);
  v35 = (char *)&v70 - v34;
  v37 = MEMORY[0x24BDAC7A8](v33, v36);
  v72 = (char *)&v70 - v38;
  MEMORY[0x24BDAC7A8](v37, v39);
  v73 = (char *)&v70 - v40;
  v85 = sub_2390F94F4();
  v82 = *(_QWORD *)(v85 - 8);
  MEMORY[0x24BDAC7A8](v85, v41);
  if (qword_25691CEC0 != -1)
    swift_once();
  v42 = sub_2390F9254();
  v43 = __swift_project_value_buffer(v42, (uint64_t)qword_25691E300);
  swift_bridgeObjectRetain_n();
  v87 = v43;
  v44 = sub_2390F9230();
  v45 = sub_2390F93EC();
  v46 = os_log_type_enabled(v44, v45);
  v76 = v35;
  v78 = v24;
  v80 = v7;
  v74 = v28;
  v77 = v17;
  if (v46)
  {
    v47 = (uint8_t *)swift_slowAlloc();
    v48 = swift_slowAlloc();
    v90 = v48;
    *(_DWORD *)v47 = 136315138;
    swift_bridgeObjectRetain();
    v89[0] = sub_2390F3738(a1, a2, &v90);
    sub_2390F944C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2390E7000, v44, v45, "read %s", v47, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B8382A8](v48, -1, -1);
    MEMORY[0x23B8382A8](v47, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v49 = sub_2390F91C4();
  v50 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49, v51);
  v53 = (char *)&v70 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2390F9194();
  v54 = sub_2390F91D0();
  v56 = v55;
  (*(void (**)(char *, uint64_t))(v50 + 8))(v53, v49);
  sub_2390EE0B4(v54, v56);
  if (qword_25691CEC8 != -1)
    swift_once();
  sub_2390F90C8();
  swift_allocObject();
  sub_2390F90BC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691D000);
  sub_2390EE0F8();
  sub_2390F90B0();
  sub_2390EE1A0(v54, v56);
  swift_release();
  v57 = sub_2390EC8B0(v90);
  swift_bridgeObjectRelease();
  qword_25691E320 = (uint64_t)v57;
  swift_bridgeObjectRelease();
  v58 = *(_QWORD *)(qword_25691E320 + 16);
  if (v58)
  {
    v71 = v54;
    v70 = v56;
    v59 = qword_25691E320 + 32;
    v85 = qword_25691E320;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v60 = 136315138;
    v86 = v60;
    do
    {
      sub_2390EE1E4(v59, (uint64_t)&v90);
      v61 = sub_2390F9230();
      v62 = sub_2390F93EC();
      if (os_log_type_enabled(v61, v62))
      {
        v63 = swift_slowAlloc();
        v64 = swift_slowAlloc();
        v88 = v64;
        *(_DWORD *)v63 = v86;
        sub_2390EE1E4((uint64_t)&v90, (uint64_t)v89);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25691D030);
        v65 = sub_2390F92C0();
        *(_QWORD *)(v63 + 4) = sub_2390F3738(v65, v66, &v88);
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v90);
        _os_log_impl(&dword_2390E7000, v61, v62, "%s", (uint8_t *)v63, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B8382A8](v64, -1, -1);
        MEMORY[0x23B8382A8](v63, -1, -1);

      }
      else
      {

        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v90);
      }
      v59 += 40;
      --v58;
    }
    while (v58);
    swift_bridgeObjectRelease();
    v67 = v71;
    v68 = v70;
  }
  else
  {
    v67 = v54;
    v68 = v56;
  }
  sub_2390EE1A0(v67, v68);
  return 1;
}

unint64_t sub_2390EC6F4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25691CFF8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2390F9F70;
  *(_QWORD *)(inited + 32) = 0x556E726574746170;
  *(_QWORD *)(inited + 40) = 0xEB00000000444955;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v5 = sub_2390F9290();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 48) = v5;
  *(_QWORD *)(inited + 56) = 0x6E6F69746361;
  *(_QWORD *)(inited + 64) = 0xE600000000000000;
  swift_beginAccess();
  *(_QWORD *)(inited + 72) = sub_2390F9650();
  *(_QWORD *)(inited + 80) = 0x657079745F677562;
  *(_QWORD *)(inited + 88) = 0xE800000000000000;
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  swift_bridgeObjectRetain();
  v6 = sub_2390F9290();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 96) = v6;
  return sub_2390F0BD8(inited);
}

id sub_2390EC83C(uint64_t a1)
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
    sub_2390EE078();
    v4 = (void *)sub_2390F9278();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

__int128 *sub_2390EC8B0(uint64_t a1)
{
  int64_t v1;
  __int128 *v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  __int128 *v16;
  unint64_t v17;
  unint64_t v18;
  ValueMetadata *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  __int128 *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  char v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  unint64_t v36;
  __int128 *v37;
  int64_t v38;
  __int128 v39;
  ValueMetadata *v40;
  _UNKNOWN **v41;
  _QWORD v42[3];
  ValueMetadata *v43;
  _UNKNOWN **v44;
  __int128 *v45;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = (__int128 *)MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v45 = (__int128 *)MEMORY[0x24BEE4AF8];
    sub_2390F81BC(0, v1, 0);
    v2 = v45;
    v4 = (_QWORD *)(a1 + 104);
    do
    {
      v37 = v2;
      v38 = v1;
      v5 = *(v4 - 9);
      v6 = *(v4 - 8);
      v7 = *((_DWORD *)v4 - 14);
      v8 = *((_BYTE *)v4 - 52);
      v9 = *(v4 - 6);
      v10 = *(v4 - 5);
      v11 = *(v4 - 3);
      v36 = *(v4 - 4);
      v12 = *(v4 - 1);
      *(_QWORD *)&v35 = *(v4 - 2);
      v13 = *v4;
      v43 = &type metadata for PanicPayload;
      v44 = &off_250A6AB30;
      v14 = swift_allocObject();
      v42[0] = v14;
      *(_QWORD *)(v14 + 16) = v5;
      *(_QWORD *)(v14 + 24) = v6;
      *(_DWORD *)(v14 + 32) = v7;
      *(_BYTE *)(v14 + 36) = v8;
      v15 = v36;
      v16 = v37;
      *(_QWORD *)(v14 + 40) = v9;
      *(_QWORD *)(v14 + 48) = v10;
      *(_QWORD *)(v14 + 56) = v15;
      *(_QWORD *)(v14 + 64) = v11;
      *(_QWORD *)(v14 + 72) = v35;
      *(_QWORD *)(v14 + 80) = v12;
      *(_QWORD *)(v14 + 88) = v13;
      v18 = *((_QWORD *)v16 + 2);
      v17 = *((_QWORD *)v16 + 3);
      v45 = v16;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v36 = v18;
      v19 = &type metadata for PanicPayload;
      if (v18 >= v17 >> 1)
      {
        sub_2390F81BC(v17 > 1, v18 + 1, 1);
        v19 = v43;
        v16 = v45;
      }
      v4 += 10;
      v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v42, (uint64_t)v19);
      v37 = &v33;
      MEMORY[0x24BDAC7A8](v20, v20);
      v22 = (char *)&v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v23 + 16))(v22);
      v24 = v16;
      v25 = *(_QWORD *)v22;
      v26 = *((_QWORD *)v22 + 1);
      v27 = *((_DWORD *)v22 + 4);
      v28 = v22[20];
      v29 = *(_OWORD *)(v22 + 24);
      v34 = *(_OWORD *)(v22 + 40);
      v35 = v29;
      v33 = *(_OWORD *)(v22 + 56);
      v30 = *((_QWORD *)v22 + 9);
      v40 = &type metadata for PanicPayload;
      v41 = &off_250A6AB30;
      v31 = swift_allocObject();
      *(_QWORD *)&v39 = v31;
      *(_QWORD *)(v31 + 16) = v25;
      *(_QWORD *)(v31 + 24) = v26;
      v2 = v24;
      *(_DWORD *)(v31 + 32) = v27;
      *(_BYTE *)(v31 + 36) = v28;
      *(_OWORD *)(v31 + 40) = v35;
      *(_OWORD *)(v31 + 56) = v34;
      *(_OWORD *)(v31 + 72) = v33;
      *(_QWORD *)(v31 + 88) = v30;
      *((_QWORD *)v24 + 2) = v18 + 1;
      sub_2390EDF6C(&v39, (uint64_t)v24 + 40 * v36 + 32);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
      v1 = v38 - 1;
    }
    while (v38 != 1);
  }
  return v2;
}

id sub_2390ECB2C()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id result;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;

  if (qword_25691CEC0 != -1)
    swift_once();
  v0 = sub_2390F9254();
  __swift_project_value_buffer(v0, (uint64_t)qword_25691E300);
  v1 = sub_2390F9230();
  v2 = sub_2390F93EC();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2390E7000, v1, v2, "update panic payloads", v3, 2u);
    MEMORY[0x23B8382A8](v3, -1, -1);
  }

  v4 = (void *)qword_25691E318;
  if (!qword_25691E318)
  {
    v5 = sub_2390F9230();
    v6 = sub_2390F93EC();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2390E7000, v5, v6, "No payloadManager", v7, 2u);
      MEMORY[0x23B8382A8](v7, -1, -1);
    }

    v4 = (void *)qword_25691E318;
    if (!qword_25691E318)
      goto LABEL_10;
  }
  v8 = v4;
  objc_msgSend(v8, sel_refresh);
  v9 = (void *)sub_2390F9290();
  v10 = (void *)sub_2390F9290();
  v11 = objc_msgSend(v8, sel_levelForFactor_withNamespaceName_, v9, v10);

  objc_msgSend(v8, sel_dispose);
  if (!v11)
  {
LABEL_10:
    v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBA968]), sel_init);
    v13 = (void *)sub_2390F9290();
    objc_msgSend(v12, sel_setPath_, v13);

    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBA980]), sel_init);
  }
  result = objc_msgSend(v11, sel_fileValue);
  if (result)
  {
    v15 = result;
    v16 = objc_msgSend(result, sel_hasPath);

    if (!v16)
      goto LABEL_17;
    result = objc_msgSend(v11, sel_fileValue);
    if (result)
    {
      v17 = result;
      v18 = objc_msgSend(result, sel_path);

      if (v18)
      {
        v19 = sub_2390F92B4();
        v21 = v20;

        swift_bridgeObjectRetain_n();
        v22 = sub_2390F9230();
        v23 = sub_2390F93EC();
        if (os_log_type_enabled(v22, v23))
        {
          v24 = (uint8_t *)swift_slowAlloc();
          v25 = swift_slowAlloc();
          v29 = v25;
          *(_DWORD *)v24 = 136315138;
          swift_bridgeObjectRetain();
          sub_2390F3738(v19, v21, &v29);
          sub_2390F944C();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2390E7000, v22, v23, "found Trial payload at %s", v24, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23B8382A8](v25, -1, -1);
          MEMORY[0x23B8382A8](v24, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        return (id)v19;
      }
LABEL_17:
      v26 = sub_2390F9230();
      v27 = sub_2390F93EC();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_2390E7000, v26, v27, "No valid assets in trial level for factor panicPayloadV1", v28, 2u);
        MEMORY[0x23B8382A8](v28, -1, -1);
      }

      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2390ECFD4()
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  const char *v21;
  char v22;
  uint64_t v23;

  if (!MEMORY[0x24BEBA900])
  {
    if (qword_25691CEC0 != -1)
      swift_once();
    v1 = sub_2390F9254();
    __swift_project_value_buffer(v1, (uint64_t)qword_25691E300);
    v2 = sub_2390F9230();
    v3 = sub_2390F93EC();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2390E7000, v2, v3, "Trial is not available on this OS", v4, 2u);
      MEMORY[0x23B8382A8](v4, -1, -1);
    }

    v5 = (void *)qword_25691E318;
    qword_25691E318 = 0;

    return 1;
  }
  if (qword_25691E318)
    return 0;
  v6 = sub_2390EA3BC(332);
  v7 = (void *)qword_25691E318;
  qword_25691E318 = (uint64_t)v6;

  v8 = sub_2390ECB2C();
  if (v9)
  {
    v10 = (uint64_t)v8;
    v11 = v9;
    if (qword_25691CEC0 != -1)
      swift_once();
    v12 = sub_2390F9254();
    __swift_project_value_buffer(v12, (uint64_t)qword_25691E300);
    swift_bridgeObjectRetain_n();
    v13 = sub_2390F9230();
    v14 = sub_2390F93EC();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      v23 = v16;
      *(_DWORD *)v15 = 136315138;
      swift_bridgeObjectRetain();
      sub_2390F3738(v10, v11, &v23);
      sub_2390F944C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2390E7000, v13, v14, "panic payload %s updated", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B8382A8](v16, -1, -1);
      MEMORY[0x23B8382A8](v15, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v22 = sub_2390EAFD4(v10, v11);
    swift_bridgeObjectRelease();
    if ((v22 & 1) != 0)
      return 0;
    v18 = sub_2390F9230();
    v19 = sub_2390F93EC();
    if (!os_log_type_enabled(v18, v19))
      goto LABEL_23;
    v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v20 = 0;
    v21 = "Failed to parse payload";
  }
  else
  {
    if (qword_25691CEC0 != -1)
      swift_once();
    v17 = sub_2390F9254();
    __swift_project_value_buffer(v17, (uint64_t)qword_25691E300);
    v18 = sub_2390F9230();
    v19 = sub_2390F93EC();
    if (!os_log_type_enabled(v18, v19))
      goto LABEL_23;
    v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v20 = 0;
    v21 = "Failed to find panic payload from Trial";
  }
  _os_log_impl(&dword_2390E7000, v18, v19, v21, v20, 2u);
  MEMORY[0x23B8382A8](v20, -1, -1);
LABEL_23:

  return 1;
}

BOOL sub_2390ED388()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  if (qword_25691CEC0 != -1)
    swift_once();
  v0 = sub_2390F9254();
  __swift_project_value_buffer(v0, (uint64_t)qword_25691E300);
  v1 = sub_2390F9230();
  v2 = sub_2390F93EC();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v3 = 134217984;
    if (qword_25691CEC8 != -1)
      swift_once();
    sub_2390F944C();
    _os_log_impl(&dword_2390E7000, v1, v2, "payloads count %ld", v3, 0xCu);
    MEMORY[0x23B8382A8](v3, -1, -1);
  }

  if (qword_25691CEC8 != -1)
    swift_once();
  return *(_QWORD *)(qword_25691E320 + 16) != 0;
}

uint64_t sub_2390ED4F4(void *a1)
{
  void *v1;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _DWORD *v18;
  uint64_t v19;
  char v20;
  __int128 v21;
  void *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  uint64_t v44;
  char *v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  char v60;
  char *v61;
  char v62;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  unint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  _DWORD *v81;
  char *v82;
  uint64_t aBlock;
  uint64_t v84;
  id (*v85)(uint64_t);
  void *v86;
  unint64_t (*v87)();
  uint64_t v88;
  __int128 v89;
  BOOL v90;
  uint64_t v91;
  uint64_t v92;

  v3 = sub_2390F9254();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691CFC0);
  MEMORY[0x24BDAC7A8](v8, v9);
  v71 = (char *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691CFC8);
  v70 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v12);
  v82 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!qword_25691E318)
    goto LABEL_33;
  if (qword_25691CEC8 != -1)
    swift_once();
  v66 = qword_25691E320;
  v14 = *(_QWORD *)(qword_25691E320 + 16);
  if (!v14)
  {
LABEL_33:
    if (qword_25691CEC0 != -1)
      swift_once();
    __swift_project_value_buffer(v3, (uint64_t)qword_25691E300);
    v57 = sub_2390F9230();
    v58 = sub_2390F93EC();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v59 = 0;
      _os_log_impl(&dword_2390E7000, v57, v58, "There is no panic payload available", v59, 2u);
      MEMORY[0x23B8382A8](v59, -1, -1);
    }

    v60 = 0;
    goto LABEL_38;
  }
  type metadata accessor for PanicCriterials();
  v15 = swift_dynamicCastClass();
  if (!v15)
  {
    v60 = 1;
LABEL_38:
    sub_2390EDE7C();
    swift_allocError();
    *v61 = v60;
    swift_willThrow();
    return v62 & 1;
  }
  v16 = v15;
  v79 = v11;
  v68 = v7;
  v69 = v4;
  v17 = swift_allocObject();
  v75 = swift_allocObject();
  v18 = (_DWORD *)(v75 + 16);
  v67 = (uint64_t *)(v16 + OBJC_IVAR____SwiftPanicCriterials_panicReasonString);
  v19 = v66 + 32;
  v65 = a1;
  swift_bridgeObjectRetain();
  v81 = v18;
  swift_beginAccess();
  v20 = 0;
  v74 = 0;
  *(_QWORD *)&v21 = 136315138;
  v76 = v21;
  v73 = MEMORY[0x24BEE4AD8] + 8;
  v72 = 0x80000002390FA920;
  v77 = v3;
  v22 = v1;
  v80 = v17;
  do
  {
    sub_2390EE1E4(v19, (uint64_t)&v91);
    v23 = __swift_project_boxed_opaque_existential_1(&v91, v92);
    v25 = v23[5];
    v24 = v23[6];
    swift_bridgeObjectRetain();
    if ((v20 & 1) != 0)
      swift_bridgeObjectRelease();
    *(_QWORD *)(v17 + 16) = v25;
    *(_QWORD *)(v17 + 24) = v24;
    v26 = __swift_project_boxed_opaque_existential_1(&v91, v92);
    v27 = *((_DWORD *)v26 + 4);
    if (*((_BYTE *)v26 + 20))
      v27 = 0;
    *v81 = v27;
    v90 = 0;
    if (qword_25691CEC0 != -1)
      swift_once();
    v28 = __swift_project_value_buffer(v3, (uint64_t)qword_25691E300);
    sub_2390EE1E4((uint64_t)&v91, (uint64_t)&aBlock);
    v29 = sub_2390F9230();
    v30 = sub_2390F93EC();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = swift_slowAlloc();
      v32 = swift_slowAlloc();
      *(_QWORD *)&v89 = v32;
      *(_DWORD *)v31 = v76;
      v33 = __swift_project_boxed_opaque_existential_1(&aBlock, (uint64_t)v86);
      v34 = v33[7];
      v35 = v33[8];
      swift_bridgeObjectRetain();
      *(_QWORD *)(v31 + 4) = sub_2390F3738(v34, v35, (uint64_t *)&v89);
      v3 = v77;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
      _os_log_impl(&dword_2390E7000, v29, v30, "create a regex %s", (uint8_t *)v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B8382A8](v32, -1, -1);
      MEMORY[0x23B8382A8](v31, -1, -1);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
    }

    __swift_project_boxed_opaque_existential_1(&v91, v92);
    swift_bridgeObjectRetain();
    v36 = v82;
    sub_2390F9224();
    if (v22)
    {
      v37 = sub_2390F9230();
      v38 = sub_2390F93EC();
      if (os_log_type_enabled(v37, v38))
      {
        v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v39 = 0;
        _os_log_impl(&dword_2390E7000, v37, v38, "Failed to create regex", v39, 2u);
        MEMORY[0x23B8382A8](v39, -1, -1);
      }

      v22 = 0;
    }
    else
    {
      v78 = 0;
      v40 = v67[1];
      aBlock = *v67;
      v84 = v40;
      sub_2390F9218();
      sub_2390EDFA8();
      sub_2390EDFEC();
      v41 = (uint64_t)v71;
      sub_2390F9284();
      v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691CFE8);
      v43 = (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 48))(v41, 1, v42) != 1;
      sub_2390EE038(v41);
      swift_beginAccess();
      v90 = v43;
      v44 = v69;
      v45 = v68;
      (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v68, v28, v3);
      v46 = sub_2390F9230();
      v47 = sub_2390F93EC();
      if (os_log_type_enabled(v46, v47))
      {
        v48 = v44;
        v49 = swift_slowAlloc();
        v50 = swift_slowAlloc();
        aBlock = v50;
        *(_DWORD *)v49 = v76;
        if (v90)
          v51 = 7562585;
        else
          v51 = 28494;
        if (v90)
          v52 = 0xE300000000000000;
        else
          v52 = 0xE200000000000000;
        *(_QWORD *)(v49 + 4) = sub_2390F3738(v51, v52, &aBlock);
        v3 = v77;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2390E7000, v46, v47, "panic string matched: %s", (uint8_t *)v49, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B8382A8](v50, -1, -1);
        MEMORY[0x23B8382A8](v49, -1, -1);

        (*(void (**)(char *, uint64_t))(v48 + 8))(v45, v3);
        (*(void (**)(char *, uint64_t))(v70 + 8))(v82, v79);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v3);
        (*(void (**)(char *, uint64_t))(v70 + 8))(v36, v79);
      }
      v22 = v78;
    }
    v17 = v80;
    swift_beginAccess();
    if (v90)
    {
      v53 = (void *)sub_2390F9290();
      sub_2390EE1E4((uint64_t)&v91, (uint64_t)&v89);
      v54 = swift_allocObject();
      v55 = v75;
      *(_QWORD *)(v54 + 16) = v17;
      *(_QWORD *)(v54 + 24) = v55;
      sub_2390EDF6C(&v89, v54 + 32);
      v87 = sub_2390EDF84;
      v88 = v54;
      aBlock = MEMORY[0x24BDAC760];
      v84 = 1107296256;
      v85 = sub_2390EC83C;
      v86 = &block_descriptor_0;
      v56 = _Block_copy(&aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      AnalyticsSendEventLazy();
      _Block_release(v56);

      v74 = 1;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v91);
    v19 += 40;
    v20 = 1;
    --v14;
  }
  while (v14);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_deallocUninitializedObject();
  v62 = v74;
  return v62 & 1;
}

unint64_t sub_2390EDE7C()
{
  unint64_t result;

  result = qword_25691CFD0;
  if (!qword_25691CFD0)
  {
    result = MEMORY[0x23B838218](&unk_2390FA590, &type metadata for DiagnosticPatternMatchingError);
    atomic_store(result, (unint64_t *)&qword_25691CFD0);
  }
  return result;
}

uint64_t sub_2390EDEC0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2390EDEE4()
{
  return swift_deallocObject();
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

uint64_t sub_2390EDF38()
{
  uint64_t v0;

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return swift_deallocObject();
}

uint64_t sub_2390EDF6C(__int128 *a1, uint64_t a2)
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

unint64_t sub_2390EDF84()
{
  uint64_t *v0;

  return sub_2390EC6F4(v0[2], v0[3], v0 + 4);
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

unint64_t sub_2390EDFA8()
{
  unint64_t result;

  result = qword_25691CFD8;
  if (!qword_25691CFD8)
  {
    result = MEMORY[0x23B838218](MEMORY[0x24BEE0D18], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25691CFD8);
  }
  return result;
}

unint64_t sub_2390EDFEC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25691CFE0;
  if (!qword_25691CFE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25691CFC8);
    result = MEMORY[0x23B838218](MEMORY[0x24BEE7460], v1);
    atomic_store(result, (unint64_t *)&qword_25691CFE0);
  }
  return result;
}

uint64_t sub_2390EE038(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691CFC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2390EE078()
{
  unint64_t result;

  result = qword_25691CFF0;
  if (!qword_25691CFF0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25691CFF0);
  }
  return result;
}

uint64_t sub_2390EE0B4(uint64_t a1, unint64_t a2)
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

unint64_t sub_2390EE0F8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_25691D008;
  if (!qword_25691D008)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25691D000);
    v2 = sub_2390EE15C();
    result = MEMORY[0x23B838218](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25691D008);
  }
  return result;
}

unint64_t sub_2390EE15C()
{
  unint64_t result;

  result = qword_25691D010;
  if (!qword_25691D010)
  {
    result = MEMORY[0x23B838218](&unk_2390F9FFC, &type metadata for PanicPayload);
    atomic_store(result, (unint64_t *)&qword_25691D010);
  }
  return result;
}

uint64_t sub_2390EE1A0(uint64_t a1, unint64_t a2)
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

uint64_t sub_2390EE1E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2390EE228()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
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

uint64_t initializeBufferWithCopyOfBuffer for PanicPayload(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PanicPayload()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PanicPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PanicPayload(uint64_t a1, uint64_t a2)
{
  int v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_DWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for PanicPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PanicPayload(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PanicPayload(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
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
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PanicPayload()
{
  return &type metadata for PanicPayload;
}

uint64_t sub_2390EE5B0()
{
  unint64_t v0;

  v0 = sub_2390F9554();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_2390EE5F8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t result;
  char v18;
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
  char v31;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691D038);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2390EE84C();
  sub_2390F965C();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v24) = 0;
  v10 = sub_2390F9578();
  v12 = v11;
  LOBYTE(v24) = 1;
  swift_bridgeObjectRetain();
  v23 = sub_2390F956C();
  v31 = 2;
  sub_2390EE890();
  sub_2390F9584();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  v13 = v25;
  v14 = v27;
  v22 = v26;
  v15 = v29;
  v20 = v24;
  v21 = v28;
  v16 = v30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v10;
  *(_QWORD *)(a2 + 8) = v12;
  v18 = BYTE4(v23);
  *(_DWORD *)(a2 + 16) = v23;
  *(_BYTE *)(a2 + 20) = v18 & 1;
  *(_QWORD *)(a2 + 24) = v20;
  *(_QWORD *)(a2 + 32) = v13;
  *(_QWORD *)(a2 + 40) = v22;
  *(_QWORD *)(a2 + 48) = v14;
  *(_QWORD *)(a2 + 56) = v21;
  *(_QWORD *)(a2 + 64) = v15;
  *(_QWORD *)(a2 + 72) = v16;
  return result;
}

unint64_t sub_2390EE84C()
{
  unint64_t result;

  result = qword_25691D040;
  if (!qword_25691D040)
  {
    result = MEMORY[0x23B838218](&unk_2390FA178, &type metadata for PanicPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25691D040);
  }
  return result;
}

unint64_t sub_2390EE890()
{
  unint64_t result;

  result = qword_25691D048;
  if (!qword_25691D048)
  {
    result = MEMORY[0x23B838218](&unk_2390FA150, &type metadata for Pattern);
    atomic_store(result, (unint64_t *)&qword_25691D048);
  }
  return result;
}

unint64_t sub_2390EE8D4()
{
  unint64_t result;

  result = qword_25691D058;
  if (!qword_25691D058)
  {
    result = MEMORY[0x23B838218](&unk_2390FA128, &type metadata for Pattern);
    atomic_store(result, (unint64_t *)&qword_25691D058);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_2390EE930(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2390EE93C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PanicPayload.CodingKeys()
{
  return &type metadata for PanicPayload.CodingKeys;
}

uint64_t destroy for Pattern()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for Pattern(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for Pattern(_QWORD *a1, _QWORD *a2)
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

uint64_t assignWithTake for Pattern(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for Pattern(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Pattern(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Pattern()
{
  return &type metadata for Pattern;
}

unint64_t sub_2390EEBBC()
{
  unint64_t result;

  result = qword_25691D060;
  if (!qword_25691D060)
  {
    result = MEMORY[0x23B838218](&unk_2390FA100, &type metadata for PanicPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25691D060);
  }
  return result;
}

unint64_t sub_2390EEC04()
{
  unint64_t result;

  result = qword_25691D068;
  if (!qword_25691D068)
  {
    result = MEMORY[0x23B838218](&unk_2390FA038, &type metadata for PanicPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25691D068);
  }
  return result;
}

unint64_t sub_2390EEC4C()
{
  unint64_t result;

  result = qword_25691D070;
  if (!qword_25691D070)
  {
    result = MEMORY[0x23B838218](&unk_2390FA060, &type metadata for PanicPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25691D070);
  }
  return result;
}

uint64_t sub_2390EEC90(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x65707954677562 && a2 == 0xE700000000000000;
  if (v3 || (sub_2390F95CC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1684632949 && a2 == 0xE400000000000000 || (sub_2390F95CC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6974696E69666564 && a2 == 0xEA00000000006E6FLL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_2390F95CC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_2390EEDCC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691D078);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2390EF030();
  sub_2390F965C();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v24) = 0;
  v10 = sub_2390F9578();
  v12 = v11;
  v23 = v10;
  LOBYTE(v24) = 1;
  swift_bridgeObjectRetain();
  v13 = sub_2390F9578();
  v15 = v14;
  v21 = v13;
  v27 = 2;
  sub_2390EF074();
  swift_bridgeObjectRetain();
  v22 = v15;
  sub_2390F9584();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  v17 = v24;
  v16 = v25;
  v18 = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v19 = v22;
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a2 = v23;
  a2[1] = v12;
  a2[2] = v21;
  a2[3] = v19;
  a2[4] = v17;
  a2[5] = v16;
  a2[6] = v18;
  return result;
}

unint64_t sub_2390EF030()
{
  unint64_t result;

  result = qword_25691D080;
  if (!qword_25691D080)
  {
    result = MEMORY[0x23B838218](&unk_2390FA2DC, &type metadata for Pattern.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25691D080);
  }
  return result;
}

unint64_t sub_2390EF074()
{
  unint64_t result;

  result = qword_25691D088;
  if (!qword_25691D088)
  {
    result = MEMORY[0x23B838218](&unk_2390FA2B4, &type metadata for Definition);
    atomic_store(result, (unint64_t *)&qword_25691D088);
  }
  return result;
}

unint64_t sub_2390EF0B8()
{
  unint64_t result;

  result = qword_25691D098;
  if (!qword_25691D098)
  {
    result = MEMORY[0x23B838218](&unk_2390FA28C, &type metadata for Definition);
    atomic_store(result, (unint64_t *)&qword_25691D098);
  }
  return result;
}

uint64_t _s15CoreDiagnostics12PanicPayloadV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s15CoreDiagnostics12PanicPayloadV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2390EF1D8 + 4 * byte_2390F9F85[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2390EF20C + 4 * byte_2390F9F80[v4]))();
}

uint64_t sub_2390EF20C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2390EF214(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2390EF21CLL);
  return result;
}

uint64_t sub_2390EF228(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2390EF230);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2390EF234(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2390EF23C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Pattern.CodingKeys()
{
  return &type metadata for Pattern.CodingKeys;
}

uint64_t destroy for Definition()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s15CoreDiagnostics10DefinitionVwCP_0(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for Definition(_QWORD *a1, _QWORD *a2)
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

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Definition(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Definition(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Definition(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Definition()
{
  return &type metadata for Definition;
}

unint64_t sub_2390EF418()
{
  unint64_t result;

  result = qword_25691D0A0;
  if (!qword_25691D0A0)
  {
    result = MEMORY[0x23B838218](&unk_2390FA264, &type metadata for Pattern.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25691D0A0);
  }
  return result;
}

unint64_t sub_2390EF460()
{
  unint64_t result;

  result = qword_25691D0A8;
  if (!qword_25691D0A8)
  {
    result = MEMORY[0x23B838218](&unk_2390FA1D4, &type metadata for Pattern.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25691D0A8);
  }
  return result;
}

unint64_t sub_2390EF4A8()
{
  unint64_t result;

  result = qword_25691D0B0;
  if (!qword_25691D0B0)
  {
    result = MEMORY[0x23B838218](&unk_2390FA1FC, &type metadata for Pattern.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25691D0B0);
  }
  return result;
}

uint64_t sub_2390EF4EC(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000011 && a2 == 0x80000002390FA9A0 || (sub_2390F95CC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x61724663696E6170 && a2 == 0xEB0000000073656DLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_2390F95CC();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2390EF5E8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE v10[32];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691D0B8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2390EF7C8();
  sub_2390F965C();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v10[31] = 0;
    v8 = sub_2390F9578();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691D0C8);
    v10[15] = 1;
    sub_2390EF80C(&qword_25691D0D0, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    swift_bridgeObjectRetain();
    sub_2390F9560();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v7, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v8;
}

unint64_t sub_2390EF7C8()
{
  unint64_t result;

  result = qword_25691D0C0;
  if (!qword_25691D0C0)
  {
    result = MEMORY[0x23B838218](&unk_2390FA3E4, &type metadata for Definition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25691D0C0);
  }
  return result;
}

uint64_t sub_2390EF80C(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25691D0C8);
    v8 = a2;
    result = MEMORY[0x23B838218](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Definition.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Definition.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2390EF948 + 4 * byte_2390F9F8F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2390EF97C + 4 * byte_2390F9F8A[v4]))();
}

uint64_t sub_2390EF97C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2390EF984(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2390EF98CLL);
  return result;
}

uint64_t sub_2390EF998(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2390EF9A0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2390EF9A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2390EF9AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2390EF9B8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Definition.CodingKeys()
{
  return &type metadata for Definition.CodingKeys;
}

unint64_t sub_2390EF9D8()
{
  unint64_t result;

  result = qword_25691D0E8;
  if (!qword_25691D0E8)
  {
    result = MEMORY[0x23B838218](&unk_2390FA3BC, &type metadata for Definition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25691D0E8);
  }
  return result;
}

unint64_t sub_2390EFA20()
{
  unint64_t result;

  result = qword_25691D0F0;
  if (!qword_25691D0F0)
  {
    result = MEMORY[0x23B838218](&unk_2390FA32C, &type metadata for Definition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25691D0F0);
  }
  return result;
}

unint64_t sub_2390EFA68()
{
  unint64_t result;

  result = qword_25691D0F8;
  if (!qword_25691D0F8)
  {
    result = MEMORY[0x23B838218](&unk_2390FA354, &type metadata for Definition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25691D0F8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DiagnosticPatternMatchingError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2390EFB04 + 4 * byte_2390FA4B5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2390EFB38 + 4 * asc_2390FA4B0[v4]))();
}

uint64_t sub_2390EFB38(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2390EFB40(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2390EFB48);
  return result;
}

uint64_t sub_2390EFB54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2390EFB5CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2390EFB60(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2390EFB68(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DiagnosticPatternMatchingError()
{
  return &type metadata for DiagnosticPatternMatchingError;
}

unint64_t sub_2390EFB88()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000025;
  else
    return 0xD00000000000001ALL;
}

uint64_t sub_2390EFBC8()
{
  return sub_2390F9140();
}

uint64_t sub_2390EFBDC()
{
  return sub_2390F914C();
}

uint64_t sub_2390EFBF0()
{
  return sub_2390F9134();
}

unint64_t sub_2390EFC08()
{
  unint64_t result;

  result = qword_25691D100;
  if (!qword_25691D100)
  {
    result = MEMORY[0x23B838218](&unk_2390FA568, &type metadata for DiagnosticPatternMatchingError);
    atomic_store(result, (unint64_t *)&qword_25691D100);
  }
  return result;
}

uint64_t WriteJetsamMemoryReport(visibilityEndowmentSet:audioAssertionSet:)(void *a1, void *a2)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v15;
  uint64_t aBlock;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v4 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v5 = (void *)sub_2390F9290();
  v6 = objc_msgSend(v4, sel_initWithMachServiceName_options_, v5, 4096);

  v7 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_25691FA10);
  objc_msgSend(v6, sel_setRemoteObjectInterface_, v7);

  objc_msgSend(v6, sel_resume);
  v8 = swift_allocObject();
  *(_BYTE *)(v8 + 16) = 0;
  v20 = sub_2390EFF24;
  v21 = 0;
  v9 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v17 = 1107296256;
  v18 = sub_2390F00E4;
  v19 = &block_descriptor_1;
  v10 = _Block_copy(&aBlock);
  v11 = objc_msgSend(v6, sel_synchronousRemoteObjectProxyWithErrorHandler_, v10);
  _Block_release(v10);
  sub_2390F9470();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CEF98);
  if ((swift_dynamicCast() & 1) != 0)
  {
    if (a1)
      a1 = (void *)sub_2390F93A4();
    if (a2)
      a2 = (void *)sub_2390F93A4();
    v20 = sub_2390F014C;
    v21 = v8;
    aBlock = v9;
    v17 = 1107296256;
    v18 = sub_2390F0188;
    v19 = &block_descriptor_3;
    v12 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v15, sel_writeJetsamMemoryReportWithVisibilityEndowmentSet_audioAssertionSet_with_, a1, a2, v12);
    _Block_release(v12);
    swift_unknownObjectRelease();

  }
  objc_msgSend(v6, sel_invalidate);

  swift_beginAccess();
  v13 = *(unsigned __int8 *)(v8 + 16);
  swift_release();
  return v13;
}

uint64_t sub_2390EFF14()
{
  return swift_deallocObject();
}

uint64_t sub_2390EFF24(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint8_t *v10;
  _QWORD *v11;
  uint64_t v12;
  uint8_t *v13;
  _QWORD v15[2];

  v2 = sub_2390F9254();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2390F9248();
  MEMORY[0x23B8381D0](a1);
  MEMORY[0x23B8381D0](a1);
  v7 = sub_2390F9230();
  v8 = sub_2390F93E0();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v15[0] = v2;
    v10 = (uint8_t *)v9;
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412290;
    MEMORY[0x23B8381D0](a1);
    v12 = _swift_stdlib_bridgeErrorToNSError();
    v15[1] = v12;
    sub_2390F944C();
    *v11 = v12;

    _os_log_impl(&dword_2390E7000, v7, v8, "Error connecting to remote object: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542CEFB0);
    swift_arrayDestroy();
    MEMORY[0x23B8382A8](v11, -1, -1);
    v13 = v10;
    v2 = v15[0];
    MEMORY[0x23B8382A8](v13, -1, -1);
  }
  else
  {

  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

void sub_2390F00E4(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

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

uint64_t sub_2390F014C(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 16) = a1;
  return result;
}

uint64_t sub_2390F0188(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_2390F01C8(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  int64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;

  v1 = a1;
  v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (sub_2390F9494())
      goto LABEL_3;
LABEL_6:
    v3 = MEMORY[0x24BEE4B08];
    if (v2)
      goto LABEL_4;
    goto LABEL_7;
  }
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_6;
LABEL_3:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CEFB8);
  v3 = sub_2390F94B8();
  if (v2)
  {
LABEL_4:
    swift_bridgeObjectRetain();
    swift_retain();
    sub_2390F9488();
    sub_2390F0B44();
    sub_2390F0B80();
    result = sub_2390F93C8();
    v1 = v22;
    v20 = v23;
    v5 = v24;
    v6 = v25;
    v7 = v26;
    goto LABEL_11;
  }
LABEL_7:
  v8 = -1 << *(_BYTE *)(v1 + 32);
  v20 = v1 + 56;
  v5 = ~v8;
  v9 = -v8;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v7 = v10 & *(_QWORD *)(v1 + 56);
  swift_bridgeObjectRetain();
  result = swift_retain();
  v6 = 0;
LABEL_11:
  v19 = (unint64_t)(v5 + 64) >> 6;
  if (v1 < 0)
  {
    if (sub_2390F94A0())
    {
      sub_2390F0B44();
      swift_dynamicCast();
      v12 = v21;
LABEL_33:
      v18 = v12;
      sub_2390F9614();

      swift_release_n();
      sub_2390F0BC8();
      return 0;
    }
    goto LABEL_34;
  }
  if (v7)
  {
    v11 = __clz(__rbit64(v7)) | (v6 << 6);
LABEL_32:
    v12 = *(void **)(*(_QWORD *)(v1 + 48) + 8 * v11);
    v17 = v12;
    goto LABEL_33;
  }
  v13 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v13 < v19)
    {
      v14 = *(_QWORD *)(v20 + 8 * v13);
      v15 = v6 + 1;
      if (v14)
        goto LABEL_31;
      v15 = v6 + 2;
      if (v6 + 2 < v19)
      {
        v14 = *(_QWORD *)(v20 + 8 * v15);
        if (v14)
          goto LABEL_31;
        v15 = v6 + 3;
        if (v6 + 3 < v19)
        {
          v14 = *(_QWORD *)(v20 + 8 * v15);
          if (v14)
            goto LABEL_31;
          v15 = v6 + 4;
          if (v6 + 4 < v19)
          {
            v14 = *(_QWORD *)(v20 + 8 * v15);
            if (v14)
              goto LABEL_31;
            v15 = v6 + 5;
            if (v6 + 5 < v19)
            {
              v14 = *(_QWORD *)(v20 + 8 * v15);
              if (!v14)
              {
                v16 = v6 + 6;
                while (v19 != v16)
                {
                  v14 = *(_QWORD *)(v20 + 8 * v16++);
                  if (v14)
                  {
                    v15 = v16 - 1;
                    goto LABEL_31;
                  }
                }
                goto LABEL_34;
              }
LABEL_31:
              v11 = __clz(__rbit64(v14)) + (v15 << 6);
              goto LABEL_32;
            }
          }
        }
      }
    }
LABEL_34:
    swift_release();
    sub_2390F0BC8();
    return v3;
  }
  __break(1u);
  return result;
}

id CompatibilityBridge.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id CompatibilityBridge.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CompatibilityBridge();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CompatibilityBridge.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CompatibilityBridge();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s15CoreDiagnostics19CompatibilityBridgeC23WriteJetsamMemoryReport22visibilityEndowmentSet014audioAssertionK0SbShySo8NSNumberCGSg_AJtFZ_0(uint64_t a1, uint64_t a2)
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
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v4 = sub_2390F9254();
  v5 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4, v6);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7, v10);
  v12 = (char *)&v31 - v11;
  if (!a1 || (v13 = (void *)sub_2390F01C8(a1)) == 0)
  {
    sub_2390F9248();
    swift_bridgeObjectRetain_n();
    v14 = sub_2390F9230();
    v15 = sub_2390F93E0();
    if (os_log_type_enabled(v14, v15))
    {
      v31 = v4;
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v34 = v17;
      *(_DWORD *)v16 = 136315138;
      v32 = v5;
      if (a1)
      {
        sub_2390F0B44();
        sub_2390F0B80();
        v18 = sub_2390F93BC();
        v20 = v19;
      }
      else
      {
        v18 = 0x7263736564206F4ELL;
        v20 = 0xEE006E6F69747069;
      }
      v33 = sub_2390F3738(v18, v20, &v34);
      sub_2390F944C();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2390E7000, v14, v15, "Unable to represent visibility endowments as a set as PIDs: %s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B8382A8](v17, -1, -1);
      MEMORY[0x23B8382A8](v16, -1, -1);

      v4 = v31;
      v5 = v32;
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
    v13 = 0;
    if (!a2)
      goto LABEL_13;
LABEL_12:
    v21 = (void *)sub_2390F01C8(a2);
    if (v21)
      goto LABEL_20;
    goto LABEL_13;
  }
  if (a2)
    goto LABEL_12;
LABEL_13:
  sub_2390F9248();
  swift_bridgeObjectRetain_n();
  v22 = sub_2390F9230();
  v23 = sub_2390F93E0();
  if (os_log_type_enabled(v22, v23))
  {
    v32 = v5;
    v24 = (uint8_t *)swift_slowAlloc();
    v25 = swift_slowAlloc();
    v34 = v25;
    *(_DWORD *)v24 = 136315138;
    if (a2)
    {
      sub_2390F0B44();
      sub_2390F0B80();
      v26 = sub_2390F93BC();
      v28 = v27;
    }
    else
    {
      v26 = 0x7263736564206F4ELL;
      v28 = 0xEE006E6F69747069;
    }
    v33 = sub_2390F3738(v26, v28, &v34);
    sub_2390F944C();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2390E7000, v22, v23, "Unable to represent audio assertions as a set as PIDs: %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B8382A8](v25, -1, -1);
    MEMORY[0x23B8382A8](v24, -1, -1);

    (*(void (**)(char *, uint64_t))(v32 + 8))(v9, v4);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
  }
  v21 = 0;
LABEL_20:
  v29 = WriteJetsamMemoryReport(visibilityEndowmentSet:audioAssertionSet:)(v13, v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v29 & 1;
}

uint64_t type metadata accessor for CompatibilityBridge()
{
  return objc_opt_self();
}

unint64_t sub_2390F0B44()
{
  unint64_t result;

  result = qword_2542CEFA0;
  if (!qword_2542CEFA0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542CEFA0);
  }
  return result;
}

unint64_t sub_2390F0B80()
{
  unint64_t result;
  unint64_t v1;

  result = qword_2542CEFA8;
  if (!qword_2542CEFA8)
  {
    v1 = sub_2390F0B44();
    result = MEMORY[0x23B838218](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_2542CEFA8);
  }
  return result;
}

uint64_t sub_2390F0BC8()
{
  return swift_release();
}

unint64_t sub_2390F0BD8(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691D198);
  v2 = (_QWORD *)sub_2390F9530();
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
    result = sub_2390F86DC(v5, v6);
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

unint64_t sub_2390F0CF0(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691D190);
  v2 = (_QWORD *)sub_2390F9530();
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
    result = sub_2390F86DC(v5, v6);
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

uint64_t sub_2390F0E10(uint64_t result, uint64_t a2)
{
  if (result)
  {
    MEMORY[0x24BDAC7A8](result, a2);
    return sub_2390F91A0();
  }
  return result;
}

uint64_t sub_2390F0E7C(const char *a1, uint64_t a2, uint64_t a3, void *a4, size_t a5, _QWORD *a6)
{
  uint64_t v10;
  ssize_t v11;
  uint64_t result;
  uint64_t v13;

  v10 = sub_2390F92CC();
  v11 = getxattr(a1, (const char *)(v10 + 32), a4, a5, 0, 0);
  result = swift_release();
  if (v11 >= 1)
  {
    *a6 = MEMORY[0x23B837B34](a4);
    a6[1] = v13;
    return swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *sub_2390F0F14()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  _QWORD *v7;
  _QWORD aBlock[6];

  v0 = swift_allocObject();
  v1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4AF8];
  v2 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v3 = sub_2390F0CF0(v1);
  swift_bridgeObjectRelease();
  sub_2390F115C(v3);
  swift_bridgeObjectRelease();
  v4 = (void *)sub_2390F9278();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_2390F64A8;
  aBlock[5] = v0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2390F1D24;
  aBlock[3] = &block_descriptor_2;
  v5 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v2, sel_iterateLogsWithOptions_usingBlock_, v4, v5);
  _Block_release(v5);

  swift_arrayDestroy();
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v0 + 16) + 16))
  {
    v7 = *(_QWORD **)(v0 + 16);
    swift_bridgeObjectRetain_n();
    sub_2390F3E98(&v7);
    swift_release();
    swift_bridgeObjectRelease();
    return v7;
  }
  else
  {
    swift_release();
    return 0;
  }
}

uint64_t sub_2390F115C(uint64_t a1)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691D188);
    v2 = sub_2390F9530();
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
    sub_2390F65B8(&v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_2390F65B8(v35, v36);
    sub_2390F65B8(v36, &v32);
    result = sub_2390F94AC();
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
    result = (uint64_t)sub_2390F65B8(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_2390F0BC8();
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

uint64_t sub_2390F1518(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  char v20;
  BOOL v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t inited;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  unint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  unint64_t v54;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v56;
  unint64_t v57;
  _QWORD v58[3];
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  char *v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  v4 = sub_2390F9254();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2390F9128();
  swift_allocObject();
  v9 = sub_2390F911C();
  v69 = 0;
  v70 = 0;
  v64 = a1;
  v65 = 0x657079745F677562;
  v66 = 0xE800000000000000;
  v67 = 128;
  v68 = &v69;
  v71 = 0;
  v72 = v9;
  sub_2390F3DF0(sub_2390F6508);
  result = swift_release();
  v11 = v70;
  if (!v70)
    return result;
  v58[0] = a2;
  v60 = v8;
  v58[1] = v5;
  v58[2] = v4;
  v12 = v69;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691D178);
  v14 = *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64);
  MEMORY[0x24BDAC7A8](v13, v15);
  v16 = (char *)v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_2390F920C();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 56);
  v59 = v17;
  v19(v16, 1, 1);
  v61 = a1;
  v63 = v58;
  v62 = v16;
  if (v12 == 3487795 && v11 == 0xE300000000000000
    || ((v20 = sub_2390F95CC(), v12 == 3617331) ? (v21 = v11 == 0xE300000000000000) : (v21 = 0),
        !v21 ? (v22 = 0) : (v22 = 1),
        (v20 & 1) != 0 || (v22 & 1) != 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  v23 = sub_2390F95CC();
  v24 = swift_bridgeObjectRelease();
  if ((v23 & 1) != 0)
  {
LABEL_15:
    v26 = sub_2390F9170();
    v27 = *(_QWORD *)(v26 - 8);
    MEMORY[0x24BDAC7A8](v26, v28);
    v30 = (char *)v58 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691D110);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2390FA610;
    v32 = (void *)*MEMORY[0x24BDBCBF0];
    *(_QWORD *)(inited + 32) = *MEMORY[0x24BDBCBF0];
    v33 = v32;
    sub_2390F5DC0(inited);
    swift_setDeallocating();
    type metadata accessor for URLResourceKey(0);
    swift_arrayDestroy();
    sub_2390F9188();
    v34 = swift_bridgeObjectRelease();
    MEMORY[0x24BDAC7A8](v34, v35);
    sub_2390F9158();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v30, v26);
    v16 = v62;
    sub_2390F64C8((uint64_t)v62);
    v24 = sub_2390F6570((uint64_t)v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v16);
  }
  v36 = *(_QWORD *)(v18 + 64);
  v37 = MEMORY[0x24BDAC7A8](v24, v25);
  v38 = (v36 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v37, v39);
  v40 = (char *)v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2390F6528((uint64_t)v16, (uint64_t)v40);
  v41 = v59;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v40, 1, v59) == 1)
  {
    sub_2390F64C8((uint64_t)v16);
    return sub_2390F64C8((uint64_t)v40);
  }
  else
  {
    v42 = (*(uint64_t (**)(char *, char *, uint64_t))(v18 + 32))((char *)v58 - v38, v40, v41);
    MEMORY[0x24BDAC7A8](v42, v43);
    sub_2390F9200();
    sub_2390F91E8();
    v45 = v44;
    v46 = v41;
    v47 = *(void (**)(char *, uint64_t))(v18 + 8);
    v47((char *)v58 - v38, v46);
    if (v45 <= 86400.0)
    {
      v48 = (unint64_t *)(v58[0] + 16);
      v49 = sub_2390F91C4();
      v50 = *(_QWORD *)(v49 - 8);
      MEMORY[0x24BDAC7A8](v49, v51);
      v53 = (char *)v58 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v53, v61, v49);
      swift_beginAccess();
      v54 = *v48;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v48 = v54;
      v60 = v58;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v54 = sub_2390F31F4(0, *(_QWORD *)(v54 + 16) + 1, 1, v54);
        *v48 = v54;
      }
      v57 = *(_QWORD *)(v54 + 16);
      v56 = *(_QWORD *)(v54 + 24);
      if (v57 >= v56 >> 1)
      {
        v54 = sub_2390F31F4(v56 > 1, v57 + 1, 1, v54);
        *v48 = v54;
      }
      *(_QWORD *)(v54 + 16) = v57 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v50 + 32))(v54+ ((*(unsigned __int8 *)(v50 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80))+ *(_QWORD *)(v50 + 72) * v57, v53, v49);
      swift_endAccess();
      v47((char *)v58 - v38, v59);
      return sub_2390F64C8((uint64_t)v62);
    }
    else
    {
      v47((char *)v58 - v38, v46);
      return sub_2390F64C8((uint64_t)v16);
    }
  }
}

uint64_t sub_2390F1D24(uint64_t a1)
{
  void (*v1)(char *);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v1 = *(void (**)(char *))(a1 + 32);
  v2 = sub_2390F91C4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2390F91AC();
  swift_retain();
  v1(v6);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_2390F1DC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t inited;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD *v23;
  uint64_t v24;
  char v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  uint64_t (*v38)(char *, uint64_t, uint64_t);
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  int v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t);
  char *v50;
  void (*v51)(char *, uint64_t);
  void (*v52)(char *, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  __int128 v57;
  char *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t *v61;
  char *v62;
  char *v63;
  uint64_t v64;

  v59 = a2;
  v2 = sub_2390F9254();
  v60 = *(uint64_t **)(v2 - 8);
  v61 = (uint64_t *)v2;
  MEMORY[0x24BDAC7A8](v2, v3);
  v63 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2390F9170();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5, v8);
  v58 = (char *)((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (char *)((char *)&v53 - v58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691D110);
  inited = swift_initStackObject();
  v57 = xmmword_2390FA610;
  *(_OWORD *)(inited + 16) = xmmword_2390FA610;
  v11 = (void *)*MEMORY[0x24BDBCBF0];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDBCBF0];
  v56 = v11;
  sub_2390F5DC0(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  v12 = v62;
  sub_2390F9188();
  if (v12)
  {
    swift_bridgeObjectRelease();
    v19 = v63;
    sub_2390F9248();
    MEMORY[0x23B8381D0](v12);
    MEMORY[0x23B8381D0](v12);
    v20 = sub_2390F9230();
    v21 = sub_2390F93E0();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v22 = 138412290;
      MEMORY[0x23B8381D0](v12);
      v24 = _swift_stdlib_bridgeErrorToNSError();
      v64 = v24;
      sub_2390F944C();
      *v23 = v24;
      v19 = v63;

      _os_log_impl(&dword_2390E7000, v20, v21, "Error retrieving file CreationDate: %@", v22, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2542CEFB0);
      swift_arrayDestroy();
      MEMORY[0x23B8382A8](v23, -1, -1);
      MEMORY[0x23B8382A8](v22, -1, -1);

    }
    else
    {

    }
    ((void (*)(char *, uint64_t *))v60[1])(v19, v61);
  }
  else
  {
    v55 = v6;
    v62 = v9;
    v54 = v5;
    v13 = swift_bridgeObjectRelease();
    MEMORY[0x24BDAC7A8](v13, v14);
    v15 = (char *)((char *)&v53 - v58);
    v16 = swift_initStackObject();
    *(_OWORD *)(v16 + 16) = v57;
    v17 = v56;
    *(_QWORD *)(v16 + 32) = v56;
    v18 = v17;
    sub_2390F5DC0(v16);
    swift_setDeallocating();
    swift_arrayDestroy();
    sub_2390F9188();
    v61 = &v53;
    *(_QWORD *)&v57 = 0;
    swift_bridgeObjectRelease();
    v27 = sub_2390F920C();
    v60 = &v53;
    v28 = *(_QWORD *)(v27 - 8);
    v29 = *(_QWORD *)(v28 + 64);
    MEMORY[0x24BDAC7A8](v27, v30);
    v31 = (v29 + 15) & 0xFFFFFFFFFFFFFFF0;
    v58 = (char *)&v53 - v31;
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691D178);
    v63 = (char *)&v53;
    v33 = *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64);
    MEMORY[0x24BDAC7A8](v32, v34);
    v35 = (v33 + 15) & 0xFFFFFFFFFFFFFFF0;
    v36 = (char *)&v53 - v35;
    v37 = v62;
    sub_2390F9158();
    v59 = v28;
    v38 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
    if (v38((char *)&v53 - v35, 1, v27) == 1)
    {
      v39 = *(void (**)(char *, uint64_t))(v55 + 8);
      v40 = v54;
      v39(v15, v54);
      v39(v37, v40);
      sub_2390F64C8((uint64_t)v36);
    }
    else
    {
      v56 = *(id *)(v59 + 32);
      v41 = ((uint64_t (*)(char *, char *, uint64_t))v56)(v58, (char *)&v53 - v35, v27);
      v63 = (char *)&v53;
      v43 = MEMORY[0x24BDAC7A8](v41, v42);
      v44 = (char *)&v53 - v31;
      MEMORY[0x24BDAC7A8](v43, v45);
      v46 = (char *)&v53 - v35;
      sub_2390F9158();
      v47 = v38((char *)&v53 - v35, 1, v27);
      v48 = v54;
      if (v47 != 1)
      {
        ((void (*)(char *, char *, uint64_t))v56)(v44, (char *)&v53 - v35, v27);
        v50 = v58;
        v25 = sub_2390F91F4();
        v51 = *(void (**)(char *, uint64_t))(v59 + 8);
        v51(v44, v27);
        v51(v50, v27);
        v52 = *(void (**)(char *, uint64_t))(v55 + 8);
        v52(v15, v48);
        v52(v62, v48);
        return v25 & 1;
      }
      (*(void (**)(char *, uint64_t))(v59 + 8))(v58, v27);
      v49 = *(void (**)(char *, uint64_t))(v55 + 8);
      v49(v15, v48);
      v49(v62, v48);
      sub_2390F64C8((uint64_t)v46);
    }
  }
  v25 = 0;
  return v25 & 1;
}

Swift::OpaquePointer_optional __swiftcall ExcResourceReportPaths()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _QWORD *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t inited;
  void *v30;
  id v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  NSObject *v38;
  char *v39;
  os_log_type_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char v51;
  char v52;
  char *v53;
  Swift::Bool v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  int64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  unint64_t v70;
  unint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  _QWORD *v78;
  NSObject *v79;
  os_log_type_t v80;
  uint8_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  _QWORD *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  _QWORD v92[4];
  _QWORD *v93;
  uint64_t v94;
  __int128 v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  __int128 v103;
  void *v104;
  void (*v105)(char *, char *, uint64_t);
  _QWORD *v106;
  char *v107;
  uint64_t v108;
  _QWORD *v109;
  char *v110;
  _QWORD *v111;
  uint64_t v112;
  unint64_t v113;
  Swift::OpaquePointer_optional result;

  v98 = sub_2390F9254();
  v97 = *(_QWORD *)(v98 - 8);
  v1 = MEMORY[0x24BDAC7A8](v98, v0);
  v3 = (char *)v92 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1, v4);
  v6 = (char *)v92 - v5;
  v7 = sub_2390F0F14();
  if (!v7)
  {
    sub_2390F9248();
    v79 = sub_2390F9230();
    v80 = sub_2390F93D4();
    if (os_log_type_enabled(v79, v80))
    {
      v81 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v81 = 0;
      _os_log_impl(&dword_2390E7000, v79, v80, "No ExcResource reports found", v81, 2u);
      MEMORY[0x23B8382A8](v81, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v97 + 8))(v6, v98);
    goto LABEL_57;
  }
  v8 = v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691D108);
  v92[2] = v92;
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)v92 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = v8[2];
  v92[3] = v8;
  if (v13)
  {
    v14 = sub_2390F91C4();
    v96 = 0;
    v15 = *(_QWORD *)(v14 - 8);
    v16 = (char *)v8 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
    v100 = *(_QWORD *)(v15 + 72);
    v105 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
    v104 = (void *)*MEMORY[0x24BDBCC48];
    v17 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v92[1] = *MEMORY[0x24BE6E020];
    *((_QWORD *)&v18 + 1) = 2;
    v103 = xmmword_2390FA610;
    v92[0] = MEMORY[0x24BEE4AE0] + 8;
    *(_QWORD *)&v18 = 136446466;
    v95 = v18;
    v94 = MEMORY[0x24BEE4AD8] + 8;
    v93 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v99 = v3;
    v101 = v15;
    v102 = v12;
    while (1)
    {
      v105(v12, v16, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14);
      if ((_DWORD)v19 == 1)
        goto LABEL_44;
      v107 = v16;
      v108 = v13;
      v109 = v17;
      v106 = v92;
      v21 = *(_QWORD *)(v15 + 64);
      MEMORY[0x24BDAC7A8](v19, v20);
      v22 = (v21 + 15) & 0xFFFFFFFFFFFFFFF0;
      v110 = 0;
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))((char *)v92 - v22, v12, v14);
      v23 = sub_2390F9170();
      v111 = v92;
      v24 = v14;
      v25 = *(_QWORD *)(v23 - 8);
      MEMORY[0x24BDAC7A8](v23, v26);
      v28 = (char *)v92 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25691D110);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v103;
      v30 = v104;
      *(_QWORD *)(inited + 32) = v104;
      v31 = v30;
      sub_2390F5DC0(inited);
      swift_setDeallocating();
      type metadata accessor for URLResourceKey(0);
      v32 = (char *)v92 - v22;
      swift_arrayDestroy();
      v33 = v110;
      sub_2390F9188();
      if (v33)
        break;
      swift_bridgeObjectRelease();
      v50 = sub_2390F9164();
      v52 = v51;
      v53 = (char *)(*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v28, v23);
      if ((v52 & 1) != 0)
      {
        v14 = v24;
        v15 = v101;
        (*(void (**)(char *, uint64_t))(v101 + 8))(v32, v14);
LABEL_14:
        v17 = v109;
        goto LABEL_15;
      }
      v110 = (char *)v92 - v22;
      v55 = v96 + v50;
      v17 = v109;
      if (__OFADD__(v96, v50))
        goto LABEL_60;
      if (v55 > 10485760)
      {
        v14 = v24;
        v15 = v101;
        (*(void (**)(char *, uint64_t))(v101 + 8))(v110, v14);
LABEL_15:
        v12 = v102;
        v57 = v108;
        goto LABEL_16;
      }
      v111 = (_QWORD *)sub_2390F92B4();
      v59 = v58;
      sub_2390F9128();
      swift_allocObject();
      sub_2390F911C();
      v112 = 0;
      v113 = 0;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        if (sub_2390F90F8())
        {
          v53 = (char *)sub_2390F9110();
          if (__OFSUB__(0, v53))
            goto LABEL_62;
        }
        swift_allocObject();
        sub_2390F90EC();
        swift_release();
      }
      v53 = (char *)sub_2390F90F8();
      if (!v53)
        goto LABEL_63;
      v60 = v53;
      v53 = (char *)sub_2390F9110();
      if (__OFSUB__(0, v53))
        goto LABEL_61;
      v61 = v60 - v53;
      v62 = sub_2390F9104();
      MEMORY[0x24BDAC7A8](v62, v63);
      v92[-6] = v111;
      v92[-5] = v59;
      v92[-4] = v61;
      v92[-3] = 128;
      v92[-2] = &v112;
      sub_2390F91A0();
      swift_bridgeObjectRelease();
      swift_release();
      if (!v113 || (v64 = sub_2390F2EA0(v112, v113), (v65 & 1) != 0) || v64)
      {
        v73 = sub_2390F91B8();
        v75 = v74;
        v14 = v24;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v17 = sub_2390F33FC(0, v17[2] + 1, 1, v17);
        v15 = v101;
        v77 = v17[2];
        v76 = v17[3];
        if (v77 >= v76 >> 1)
          v17 = sub_2390F33FC((_QWORD *)(v76 > 1), v77 + 1, 1, v17);
        v17[2] = v77 + 1;
        v78 = &v17[2 * v77];
        v78[4] = v73;
        v78[5] = v75;
        v96 = v55;
        v12 = v102;
        v57 = v108;
      }
      else
      {
        v66 = sub_2390F91B8();
        v68 = v67;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
          v69 = v93;
        else
          v69 = sub_2390F3508(0, v93[2] + 1, 1, v93);
        v12 = v102;
        v57 = v108;
        v71 = v69[2];
        v70 = v69[3];
        if (v71 >= v70 >> 1)
          v69 = sub_2390F3508((_QWORD *)(v70 > 1), v71 + 1, 1, v69);
        v69[2] = v71 + 1;
        v93 = v69;
        v72 = &v69[3 * v71];
        v72[4] = v66;
        v72[5] = v68;
        v72[6] = v50;
        v14 = v24;
        v15 = v101;
      }
      (*(void (**)(char *, uint64_t))(v15 + 8))(v110, v14);
LABEL_16:
      v16 = &v107[v100];
      v13 = v57 - 1;
      if (!v13)
        goto LABEL_43;
    }
    swift_bridgeObjectRelease();
    v34 = v99;
    v35 = sub_2390F9248();
    v111 = v92;
    MEMORY[0x24BDAC7A8](v35, v36);
    v37 = (char *)v92 - v22;
    v105((char *)v92 - v22, v32, v24);
    MEMORY[0x23B8381D0](v33);
    MEMORY[0x23B8381D0](v33);
    v38 = sub_2390F9230();
    v39 = (char *)v92 - v22;
    v40 = sub_2390F93E0();
    v14 = v24;
    if (os_log_type_enabled(v38, v40))
    {
      v41 = swift_slowAlloc();
      v42 = (_QWORD *)swift_slowAlloc();
      v43 = swift_slowAlloc();
      v112 = v43;
      *(_DWORD *)v41 = v95;
      v110 = v39;
      v44 = sub_2390F91B8();
      *(_QWORD *)(v41 + 4) = sub_2390F3738(v44, v45, &v112);
      swift_bridgeObjectRelease();
      v15 = v101;
      v46 = *(void (**)(char *, uint64_t))(v101 + 8);
      v46(v37, v14);
      *(_WORD *)(v41 + 12) = 2112;
      MEMORY[0x23B8381D0](v33);
      v47 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v41 + 14) = v47;
      *v42 = v47;

      _os_log_impl(&dword_2390E7000, v38, v40, "Cannot retrieve file size for %{public}s: %@", (uint8_t *)v41, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2542CEFB0);
      swift_arrayDestroy();
      MEMORY[0x23B8382A8](v42, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x23B8382A8](v43, -1, -1);
      v48 = v41;
      v49 = v99;
      MEMORY[0x23B8382A8](v48, -1, -1);

      (*(void (**)(char *, uint64_t))(v97 + 8))(v49, v98);
      v46(v110, v14);
    }
    else
    {

      v15 = v101;
      v56 = *(void (**)(char *, uint64_t))(v101 + 8);
      v56((char *)v92 - v22, v14);

      (*(void (**)(char *, uint64_t))(v97 + 8))(v34, v98);
      v56(v39, v14);
    }
    goto LABEL_14;
  }
  v96 = 0;
  v17 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v93 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_43:
  v82 = sub_2390F91C4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v82 - 8) + 56))(v12, 1, 1, v82);
LABEL_44:
  swift_bridgeObjectRelease();
  v83 = v96;
  if (v96 >= 10485760 || (v53 = (char *)v93, (v84 = v93[2]) == 0))
  {
LABEL_55:
    swift_bridgeObjectRelease();
    if (v17[2])
    {
LABEL_58:
      v53 = (char *)v17;
      goto LABEL_64;
    }
    swift_bridgeObjectRelease();
LABEL_57:
    v17 = 0;
    goto LABEL_58;
  }
  v85 = v93 + 6;
  while (1)
  {
    v87 = v83 + *v85;
    if (__OFADD__(v83, *v85))
      break;
    if (v87 <= 10485760)
    {
      v89 = *(v85 - 2);
      v88 = *(v85 - 1);
      swift_bridgeObjectRetain_n();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v17 = sub_2390F33FC(0, v17[2] + 1, 1, v17);
      v91 = v17[2];
      v90 = v17[3];
      if (v91 >= v90 >> 1)
        v17 = sub_2390F33FC((_QWORD *)(v90 > 1), v91 + 1, 1, v17);
      v17[2] = v91 + 1;
      v86 = &v17[2 * v91];
      v86[4] = v89;
      v86[5] = v88;
      v53 = (char *)swift_bridgeObjectRelease();
      v83 = v87;
    }
    v85 += 3;
    if (!--v84)
      goto LABEL_55;
  }
  __break(1u);
LABEL_60:
  __break(1u);
LABEL_61:
  __break(1u);
LABEL_62:
  __break(1u);
LABEL_63:
  __break(1u);
LABEL_64:
  result.value._rawValue = v53;
  result.is_nil = v54;
  return result;
}

uint64_t sub_2390F2EA0(uint64_t result, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];

  v3 = HIBYTE(a2) & 0xF;
  v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v5 = v3;
  else
    v5 = result & 0xFFFFFFFFFFFFLL;
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0)
        v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v6 = (unsigned __int8 *)sub_2390F9500();
      v7 = (uint64_t)sub_2390F5674(v6, v4, 10);
      v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3)
        goto LABEL_50;
      if (v3 == 1 || (BYTE1(result) - 48) > 9u)
        goto LABEL_34;
      v7 = (BYTE1(result) - 48);
      v14 = v3 - 2;
      if (v14)
      {
        v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          v16 = *v15 - 48;
          if (v16 > 9)
            goto LABEL_34;
          v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v17 + v16;
          if (__OFADD__(v17, v16))
            goto LABEL_34;
          v9 = 0;
          ++v15;
          if (!--v14)
            goto LABEL_37;
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            v7 = -(uint64_t)(BYTE1(result) - 48);
            v10 = v3 - 2;
            if (v10)
            {
              v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                v12 = *v11 - 48;
                if (v12 > 9)
                  goto LABEL_34;
                v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
                  goto LABEL_34;
                v7 = v13 - v12;
                if (__OFSUB__(v13, v12))
                  goto LABEL_34;
                v9 = 0;
                ++v11;
                if (!--v10)
                  goto LABEL_37;
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          v7 = 0;
          v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u)
        goto LABEL_34;
      v7 = (result - 48);
      v18 = v3 - 1;
      if (v18)
      {
        v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          v20 = *v19 - 48;
          if (v20 > 9)
            goto LABEL_34;
          v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v21 + v20;
          if (__OFADD__(v21, v20))
            goto LABEL_34;
          v9 = 0;
          ++v19;
          if (!--v18)
            goto LABEL_37;
        }
      }
    }
LABEL_36:
    v9 = 0;
    goto LABEL_37;
  }
  v7 = (uint64_t)sub_2390F5590(result, a2, 10);
  v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
    return 0;
  else
    return v7;
}

id DiagnosticReportCollectorBridge.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id DiagnosticReportCollectorBridge.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiagnosticReportCollectorBridge();
  return objc_msgSendSuper2(&v2, sel_init);
}

id DiagnosticReportCollectorBridge.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiagnosticReportCollectorBridge();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2390F31F4(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691D180);
  v10 = *(_QWORD *)(sub_2390F91C4() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_2390F950C();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_2390F91C4() - 8);
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
    sub_2390F6020(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

_QWORD *sub_2390F33FC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25691D168);
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
    sub_2390F6244(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2390F3508(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25691D148);
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
    sub_2390F6138(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2390F362C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25691D140);
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
    sub_2390F6334(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2390F3738(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2390F3808(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2390F6448((uint64_t)v12, *a3);
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
      sub_2390F6448((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2390F3808(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2390F9458();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2390F39C0(a5, a6);
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
  v8 = sub_2390F9500();
  if (!v8)
  {
    sub_2390F950C();
    __break(1u);
LABEL_17:
    result = sub_2390F953C();
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

uint64_t sub_2390F39C0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2390F3A54(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2390F3CA4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2390F3CA4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2390F3A54(uint64_t a1, unint64_t a2)
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
      v3 = sub_2390F3BC8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2390F94C4();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2390F950C();
      __break(1u);
LABEL_10:
      v2 = sub_2390F9314();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2390F953C();
    __break(1u);
LABEL_14:
    result = sub_2390F950C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2390F3BC8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691D158);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2390F3C2C(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_2390F9350();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x23B837B7C](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_2390F3CA4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691D158);
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
  result = sub_2390F953C();
  __break(1u);
  return result;
}

uint64_t sub_2390F3DF0(uint64_t (*a1)(uint64_t, uint64_t))
{
  int *v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  result = sub_2390F91DC();
  v4 = *v1;
  v5 = v1[1];
  if ((int)v5 < (int)v4)
  {
    __break(1u);
    goto LABEL_9;
  }
  result = sub_2390F90F8();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v6 = result;
  result = sub_2390F9110();
  v7 = v4 - result;
  if (__OFSUB__(v4, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v8 = v5 - v4;
  v9 = sub_2390F9104();
  if (v9 >= v8)
    v10 = v8;
  else
    v10 = v9;
  return a1(v6 + v7, v6 + v7 + v10);
}

uint64_t sub_2390F3E98(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (_QWORD *)sub_2390F5DAC(v2);
  v3 = v2[2];
  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_2390F91C4() - 8) + 80);
  v6[0] = (uint64_t)v2 + ((v4 + 32) & ~v4);
  v6[1] = v3;
  result = sub_2390F3F18(v6);
  *a1 = v2;
  return result;
}

uint64_t sub_2390F3F18(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t (*v18)(char *);
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t *v33;
  int v34;
  int v35;
  uint64_t (*v36)(char *, uint64_t);
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  BOOL v66;
  unint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  BOOL v76;
  uint64_t v77;
  char v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  BOOL v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  char *v95;
  char *v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t (*v102)(_QWORD);
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t *v107;
  unint64_t v108;
  char *v109;
  void (*v110)(char *);
  uint64_t v111;
  char *v112;
  uint64_t *v113;
  char v114;
  char v115;
  void (*v116)(char *, uint64_t);
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  void (*v123)(char *, uint64_t, uint64_t);
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  unint64_t v129;
  uint64_t v130;
  void (*v131)(char *, uint64_t);
  void (*v132)(char *, uint64_t);
  void (*v133)(char *, uint64_t);
  uint64_t v134;
  uint64_t v135;
  char *v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t *v141;
  uint64_t (*v142)(char *, uint64_t);
  uint64_t *v143;
  uint64_t *v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  unint64_t v148;
  uint64_t v149;
  uint64_t *v150;
  uint64_t *v151;
  uint64_t v152;

  v2 = v1;
  v151 = a1;
  v3 = a1[1];
  result = sub_2390F95C0();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_152;
    if (v3)
      return sub_2390F4AF0(0, v3, 1, v151);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_161;
  v6 = result;
  v7 = (char *)MEMORY[0x24BEE4AF8];
  v8 = MEMORY[0x24BEE4AF8];
  if (v3 > 1)
  {
    v9 = v5 >> 1;
    sub_2390F91C4();
    v8 = sub_2390F9398();
    *(_QWORD *)(v8 + 16) = v9;
  }
  isUniquelyReferenced_nonNull_native = sub_2390F91C4();
  v152 = *(_QWORD *)(isUniquelyReferenced_nonNull_native - 8);
  v11 = *(unsigned __int8 *)(v152 + 80);
  v138 = v8;
  v148 = v8 + ((v11 + 32) & ~v11);
  v149 = isUniquelyReferenced_nonNull_native;
  if (v3 < 1)
  {
    v51 = *((_QWORD *)v7 + 2);
    goto LABEL_110;
  }
  v135 = v6;
  v12 = 0;
  do
  {
    v137 = v7;
    if (v12 + 1 >= v3)
    {
      v24 = v12 + 1;
      v37 = (_QWORD *)v152;
    }
    else
    {
      v144 = (uint64_t *)v3;
      v150 = &v134;
      v13 = *v151;
      v15 = *(_QWORD *)(v152 + 64);
      v14 = *(_QWORD *)(v152 + 72);
      v140 = v12 + 1;
      MEMORY[0x24BDAC7A8](isUniquelyReferenced_nonNull_native, v13 + v14 * (v12 + 1));
      v16 = (char *)&v134 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      v18 = *(uint64_t (**)(char *))(v17 + 16);
      v19 = v149;
      v20 = v18(v16);
      v141 = &v134;
      v139 = v13;
      v145 = v15;
      v146 = v14;
      v136 = (char *)v12;
      MEMORY[0x24BDAC7A8](v20, v13 + v14 * v12);
      v147 = (char *)v18;
      v18(v16);
      LODWORD(v143) = sub_2390F1DC4((uint64_t)v16, (uint64_t)v16);
      if (v2)
      {
        v133 = *(void (**)(char *, uint64_t))(v152 + 8);
        v133(v16, v19);
        v133(v16, v19);
        swift_bridgeObjectRelease();
        goto LABEL_128;
      }
      v21 = (_QWORD *)v152;
      v22 = *(void (**)(char *, uint64_t))(v152 + 8);
      v22(v16, v19);
      v142 = (uint64_t (*)(char *, uint64_t))v22;
      isUniquelyReferenced_nonNull_native = ((uint64_t (*)(char *, uint64_t))v22)(v16, v19);
      v12 = (uint64_t)v136;
      v24 = (uint64_t)(v136 + 2);
      if ((uint64_t)(v136 + 2) < (uint64_t)v144)
      {
        v150 = 0;
        v25 = v139;
        v26 = v146 * v140;
        v140 = v146 * v24;
        v141 = (uint64_t *)v26;
        while (1)
        {
          v27 = v24;
          v28 = v145;
          MEMORY[0x24BDAC7A8](isUniquelyReferenced_nonNull_native, v25 + v140);
          v29 = (char *)&v134 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
          v30 = v149;
          v31 = v147;
          v32 = ((uint64_t (*)(char *))v147)(v29);
          MEMORY[0x24BDAC7A8](v32, (char *)v141 + v25);
          ((void (*)(char *))v31)(v29);
          v33 = v150;
          v34 = sub_2390F1DC4((uint64_t)v29, (uint64_t)v29);
          v150 = v33;
          if (v33)
            break;
          v35 = v34;
          v36 = v142;
          v142(v29, v30);
          isUniquelyReferenced_nonNull_native = v36(v29, v30);
          if (((v143 ^ v35) & 1) != 0)
          {
            v2 = v150;
            v37 = (_QWORD *)v152;
            v24 = v27;
            v12 = (uint64_t)v136;
            goto LABEL_21;
          }
          v24 = v27 + 1;
          v25 += v146;
          if (v144 == (uint64_t *)(v27 + 1))
          {
            v3 = (uint64_t)v144;
            v24 = (uint64_t)v144;
            v2 = v150;
            v37 = (_QWORD *)v152;
            v12 = (uint64_t)v136;
            goto LABEL_22;
          }
        }
        v132 = (void (*)(char *, uint64_t))v142;
        v142((char *)&v134 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0), v30);
        v132(v29, v30);
        swift_bridgeObjectRelease();
LABEL_128:
        *(_QWORD *)(v138 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
      v37 = v21;
LABEL_21:
      v3 = (uint64_t)v144;
LABEL_22:
      v7 = v137;
      if ((v143 & 1) != 0)
      {
        if (v24 < v12)
          goto LABEL_156;
        if (v12 < v24)
        {
          v150 = v2;
          v38 = 0;
          v39 = v146 * (v24 - 1);
          v40 = v24 * v146;
          v41 = v12 * v146;
          v147 = (char *)v24;
          do
          {
            if (v12 != v24 + v38 - 1)
            {
              v43 = v139;
              if (!v139)
                goto LABEL_160;
              v143 = &v134;
              v44 = v139 + v41;
              v45 = v139 + v39;
              MEMORY[0x24BDAC7A8](isUniquelyReferenced_nonNull_native, v23);
              v47 = (char *)&v134 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
              v142 = *(uint64_t (**)(char *, uint64_t))(v152 + 32);
              ((void (*)(char *, uint64_t, uint64_t))v142)(v47, v43 + v41, v149);
              if (v41 < v39 || v44 >= v43 + v40)
              {
                v42 = v149;
                swift_arrayInitWithTakeFrontToBack();
              }
              else
              {
                v42 = v149;
                if (v41 != v39)
                  swift_arrayInitWithTakeBackToFront();
              }
              isUniquelyReferenced_nonNull_native = ((uint64_t (*)(uint64_t, char *, uint64_t))v142)(v45, v47, v42);
              v7 = v137;
              v24 = (uint64_t)v147;
            }
            ++v12;
            --v38;
            v39 -= v146;
            v40 -= v146;
            v41 += v146;
          }
          while (v12 < v24 + v38);
          v2 = v150;
          v37 = (_QWORD *)v152;
          v12 = (uint64_t)v136;
          v3 = (uint64_t)v144;
        }
      }
    }
    if (v24 >= v3)
      goto LABEL_45;
    if (__OFSUB__(v24, v12))
      goto LABEL_153;
    if (v24 - v12 >= v135)
    {
LABEL_45:
      if (v24 < v12)
        goto LABEL_151;
      goto LABEL_46;
    }
    if (__OFADD__(v12, v135))
      goto LABEL_154;
    if (v12 + v135 >= v3)
      v48 = v3;
    else
      v48 = v12 + v135;
    if (v48 < v12)
    {
LABEL_155:
      __break(1u);
LABEL_156:
      __break(1u);
LABEL_157:
      __break(1u);
LABEL_158:
      __break(1u);
LABEL_159:
      __break(1u);
LABEL_160:
      __break(1u);
LABEL_161:
      result = sub_2390F950C();
      __break(1u);
      return result;
    }
    if (v24 == v48)
      goto LABEL_45;
    v150 = v2;
    v101 = v37[9];
    v143 = (uint64_t *)v37[8];
    v102 = (uint64_t (*)(_QWORD))v37[2];
    v139 = v101;
    v140 = (uint64_t)v102;
    v145 = v24 * v101;
    v146 = v101 * (v24 - 1);
    v136 = (char *)v12;
    v134 = v48;
    do
    {
      v103 = 0;
      v104 = v149;
      v147 = (char *)v24;
      while (1)
      {
        v144 = &v134;
        v106 = *v151;
        v141 = (uint64_t *)(v145 + v103);
        v142 = (uint64_t (*)(char *, uint64_t))v12;
        v107 = v143;
        MEMORY[0x24BDAC7A8](isUniquelyReferenced_nonNull_native, v145 + v103 + v106);
        v108 = ((unint64_t)v107 + 15) & 0xFFFFFFFFFFFFFFF0;
        v109 = (char *)&v134 - v108;
        v110 = (void (*)(char *))v140;
        v111 = ((uint64_t (*)(char *))v140)((char *)&v134 - v108);
        MEMORY[0x24BDAC7A8](v111, v146 + v103 + v106);
        v112 = (char *)&v134 - v108;
        v110((char *)&v134 - v108);
        v113 = v150;
        v114 = sub_2390F1DC4((uint64_t)&v134 - v108, (uint64_t)&v134 - v108);
        v150 = v113;
        if (v113)
        {
          v131 = *(void (**)(char *, uint64_t))(v152 + 8);
          v131((char *)&v134 - v108, v104);
          v131((char *)&v134 - v108, v104);
          swift_bridgeObjectRelease();
          goto LABEL_128;
        }
        v115 = v114;
        v116 = *(void (**)(char *, uint64_t))(v152 + 8);
        v116(v112, v104);
        isUniquelyReferenced_nonNull_native = ((uint64_t (*)(char *, uint64_t))v116)(v109, v104);
        if ((v115 & 1) == 0)
          break;
        v118 = *v151;
        if (!*v151)
          goto LABEL_158;
        v119 = v118 + v145 + v103;
        v120 = v118 + v146 + v103;
        MEMORY[0x24BDAC7A8](isUniquelyReferenced_nonNull_native, v117);
        v122 = (char *)&v134 - ((v121 + 15) & 0xFFFFFFFFFFFFFFF0);
        v123 = *(void (**)(char *, uint64_t, uint64_t))(v152 + 32);
        v104 = v149;
        v123(v122, v119, v149);
        swift_arrayInitWithTakeFrontToBack();
        isUniquelyReferenced_nonNull_native = ((uint64_t (*)(uint64_t, char *, uint64_t))v123)(v120, v122, v104);
        v103 -= v139;
        v12 = (uint64_t)v142 + 1;
        v105 = v147;
        if (v147 == (char *)v142 + 1)
          goto LABEL_103;
      }
      v105 = v147;
LABEL_103:
      v24 = (uint64_t)(v105 + 1);
      v146 += v139;
      v145 += v139;
      v12 = (uint64_t)v136;
    }
    while (v24 != v134);
    v24 = v134;
    v2 = v150;
    v7 = v137;
    if (v134 < (uint64_t)v136)
      goto LABEL_151;
LABEL_46:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      isUniquelyReferenced_nonNull_native = (uint64_t)sub_2390F5378(0, *((_QWORD *)v7 + 2) + 1, 1, v7);
      v7 = (char *)isUniquelyReferenced_nonNull_native;
    }
    v50 = *((_QWORD *)v7 + 2);
    v49 = *((_QWORD *)v7 + 3);
    v51 = v50 + 1;
    v147 = (char *)v24;
    if (v50 >= v49 >> 1)
    {
      isUniquelyReferenced_nonNull_native = (uint64_t)sub_2390F5378((char *)(v49 > 1), v50 + 1, 1, v7);
      v7 = (char *)isUniquelyReferenced_nonNull_native;
    }
    *((_QWORD *)v7 + 2) = v51;
    v52 = v7 + 32;
    v53 = &v7[16 * v50 + 32];
    v54 = v147;
    *(_QWORD *)v53 = v12;
    *((_QWORD *)v53 + 1) = v54;
    if (v50)
    {
      while (2)
      {
        v55 = v51 - 1;
        if (v51 >= 4)
        {
          v60 = &v52[16 * v51];
          v61 = *((_QWORD *)v60 - 8);
          v62 = *((_QWORD *)v60 - 7);
          v66 = __OFSUB__(v62, v61);
          v63 = v62 - v61;
          if (v66)
            goto LABEL_136;
          v65 = *((_QWORD *)v60 - 6);
          v64 = *((_QWORD *)v60 - 5);
          v66 = __OFSUB__(v64, v65);
          v58 = v64 - v65;
          v59 = v66;
          if (v66)
            goto LABEL_137;
          v67 = v51 - 2;
          v68 = &v52[16 * v51 - 32];
          v70 = *(_QWORD *)v68;
          v69 = *((_QWORD *)v68 + 1);
          v66 = __OFSUB__(v69, v70);
          v71 = v69 - v70;
          if (v66)
            goto LABEL_139;
          v66 = __OFADD__(v58, v71);
          v72 = v58 + v71;
          if (v66)
            goto LABEL_142;
          if (v72 >= v63)
          {
            v90 = &v52[16 * v55];
            v92 = *(_QWORD *)v90;
            v91 = *((_QWORD *)v90 + 1);
            v66 = __OFSUB__(v91, v92);
            v93 = v91 - v92;
            if (v66)
              goto LABEL_150;
            v83 = v58 < v93;
          }
          else
          {
LABEL_64:
            if ((v59 & 1) != 0)
              goto LABEL_138;
            v67 = v51 - 2;
            v73 = &v52[16 * v51 - 32];
            v75 = *(_QWORD *)v73;
            v74 = *((_QWORD *)v73 + 1);
            v76 = __OFSUB__(v74, v75);
            v77 = v74 - v75;
            v78 = v76;
            if (v76)
              goto LABEL_141;
            v79 = &v52[16 * v55];
            v81 = *(_QWORD *)v79;
            v80 = *((_QWORD *)v79 + 1);
            v66 = __OFSUB__(v80, v81);
            v82 = v80 - v81;
            if (v66)
              goto LABEL_144;
            if (__OFADD__(v77, v82))
              goto LABEL_145;
            if (v77 + v82 < v58)
              goto LABEL_76;
            v83 = v58 < v82;
          }
          if (v83)
            v55 = v67;
        }
        else
        {
          if (v51 == 3)
          {
            v57 = *((_QWORD *)v7 + 4);
            v56 = *((_QWORD *)v7 + 5);
            v66 = __OFSUB__(v56, v57);
            v58 = v56 - v57;
            v59 = v66;
            goto LABEL_64;
          }
          v84 = *((_QWORD *)v7 + 4);
          v85 = *((_QWORD *)v7 + 5);
          v66 = __OFSUB__(v85, v84);
          v77 = v85 - v84;
          v78 = v66;
LABEL_76:
          if ((v78 & 1) != 0)
            goto LABEL_140;
          v86 = &v52[16 * v55];
          v88 = *(_QWORD *)v86;
          v87 = *((_QWORD *)v86 + 1);
          v66 = __OFSUB__(v87, v88);
          v89 = v87 - v88;
          if (v66)
            goto LABEL_143;
          if (v89 < v77)
            goto LABEL_93;
        }
        v94 = v55 - 1;
        if (v55 - 1 >= v51)
        {
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
          goto LABEL_155;
        }
        if (!*v151)
          goto LABEL_157;
        v95 = v7;
        v96 = &v52[16 * v94];
        v97 = *(_QWORD *)v96;
        v98 = &v52[16 * v55];
        v99 = *((_QWORD *)v98 + 1);
        sub_2390F4DAC(*v151 + *(_QWORD *)(v152 + 72) * *(_QWORD *)v96, *v151 + *(_QWORD *)(v152 + 72) * *(_QWORD *)v98, *v151 + *(_QWORD *)(v152 + 72) * v99, v148);
        if (v2)
        {
LABEL_127:
          swift_bridgeObjectRelease();
          goto LABEL_128;
        }
        if (v99 < v97)
          goto LABEL_133;
        if (v55 > *((_QWORD *)v95 + 2))
          goto LABEL_134;
        *(_QWORD *)v96 = v97;
        *(_QWORD *)&v52[16 * v94 + 8] = v99;
        v100 = *((_QWORD *)v95 + 2);
        if (v55 >= v100)
          goto LABEL_135;
        v7 = v95;
        v51 = v100 - 1;
        isUniquelyReferenced_nonNull_native = (uint64_t)memmove(&v52[16 * v55], v98 + 16, 16 * (v100 - 1 - v55));
        *((_QWORD *)v7 + 2) = v100 - 1;
        if (v100 <= 2)
          goto LABEL_93;
        continue;
      }
    }
    v51 = 1;
LABEL_93:
    v3 = v151[1];
    v12 = (uint64_t)v147;
  }
  while ((uint64_t)v147 < v3);
LABEL_110:
  if (v51 >= 2)
  {
    v124 = *v151;
    while (1)
    {
      v125 = v51 - 2;
      if (v51 < 2)
        goto LABEL_146;
      if (!v124)
        goto LABEL_159;
      v126 = *(_QWORD *)&v7[16 * v125 + 32];
      v127 = *(_QWORD *)&v7[16 * v51 + 24];
      sub_2390F4DAC(v124 + *(_QWORD *)(v152 + 72) * v126, v124 + *(_QWORD *)(v152 + 72) * *(_QWORD *)&v7[16 * v51 + 16], v124 + *(_QWORD *)(v152 + 72) * v127, v148);
      if (v2)
        goto LABEL_127;
      if (v127 < v126)
        goto LABEL_147;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v7 = sub_2390F557C((uint64_t)v7);
      if (v125 >= *((_QWORD *)v7 + 2))
        goto LABEL_148;
      v128 = &v7[16 * v125 + 32];
      *(_QWORD *)v128 = v126;
      *((_QWORD *)v128 + 1) = v127;
      v129 = *((_QWORD *)v7 + 2);
      if (v51 > v129)
        goto LABEL_149;
      memmove(&v7[16 * v51 + 16], &v7[16 * v51 + 32], 16 * (v129 - v51));
      *((_QWORD *)v7 + 2) = v129 - 1;
      v51 = v129 - 1;
      v130 = v138;
      if (v129 <= 2)
        goto LABEL_124;
    }
  }
  v130 = v138;
LABEL_124:
  swift_bridgeObjectRelease();
  *(_QWORD *)(v130 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2390F4AF0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  void (*v20)(char *);
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char v24;
  char v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  void (*v33)(char *, uint64_t, uint64_t);
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;

  v5 = v4;
  v47 = a4;
  v37 = a2;
  if (a3 != a2)
  {
    v6 = a3;
    v7 = result;
    result = sub_2390F91C4();
    v8 = result;
    v9 = *(_QWORD **)(result - 8);
    v11 = v9[8];
    v10 = v9[9];
    v44 = v9;
    v45 = v11;
    v12 = (void (*)(char *))v9[2];
    v38 = v10;
    v39 = v12;
    v48 = v10 * (v6 - 1);
    v13 = v10 * v6;
    v36 = v7;
    while (2)
    {
      v14 = 0;
      v40 = v6;
      v41 = v13;
      while (1)
      {
        v49 = v5;
        v46 = &v35;
        v16 = *v47;
        v42 = v13 + v14;
        v43 = v7;
        v17 = v45;
        MEMORY[0x24BDAC7A8](result, v13 + v14 + v16);
        v18 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0;
        v19 = (char *)&v35 - v18;
        v20 = v39;
        v21 = ((uint64_t (*)(char *))v39)((char *)&v35 - v18);
        MEMORY[0x24BDAC7A8](v21, v48 + v14 + v16);
        v22 = (char *)&v35 - v18;
        v20((char *)&v35 - v18);
        v23 = v49;
        v24 = sub_2390F1DC4((uint64_t)&v35 - v18, (uint64_t)&v35 - v18);
        v49 = v23;
        if (v23)
        {
          v34 = (void (*)(char *, uint64_t))v44[1];
          v34((char *)&v35 - v18, v8);
          return ((uint64_t (*)(char *, uint64_t))v34)((char *)&v35 - v18, v8);
        }
        v25 = v24;
        v26 = (void (*)(char *, uint64_t))v44[1];
        v26(v22, v8);
        result = ((uint64_t (*)(char *, uint64_t))v26)(v19, v8);
        if ((v25 & 1) == 0)
          break;
        v28 = *v47;
        v13 = v41;
        if (!*v47)
        {
          __break(1u);
          return result;
        }
        v46 = &v35;
        v29 = v28 + v41 + v14;
        v30 = v28 + v48 + v14;
        MEMORY[0x24BDAC7A8](result, v27);
        v32 = (char *)&v35 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
        v33 = (void (*)(char *, uint64_t, uint64_t))v44[4];
        v33(v32, v29, v8);
        swift_arrayInitWithTakeFrontToBack();
        result = ((uint64_t (*)(uint64_t, char *, uint64_t))v33)(v30, v32, v8);
        v14 -= v38;
        v7 = v43 + 1;
        v15 = v40;
        v5 = v49;
        if (v40 == v43 + 1)
          goto LABEL_10;
      }
      v5 = v49;
      v15 = v40;
      v13 = v41;
LABEL_10:
      v6 = v15 + 1;
      v48 += v38;
      v13 += v38;
      v7 = v36;
      if (v6 != v37)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_2390F4DAC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  unint64_t v22;
  unint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  void (*v30)(char *, uint64_t);
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v37;
  uint64_t (*v38)(_QWORD);
  unint64_t v39;
  uint64_t (*v40)(_QWORD);
  unint64_t v41;
  char *v42;
  unint64_t v43;
  void (*v44)(char *, unint64_t, uint64_t);
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char v51;
  char v52;
  void (*v53)(char *, uint64_t);
  unint64_t v54;
  unint64_t v55;
  void (*v56)(char *, uint64_t);
  void (*v57)(char *, uint64_t);
  uint64_t result;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t (*v63)(_QWORD);
  unint64_t v64;
  unint64_t v65;
  _QWORD *v66;
  unint64_t *v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;

  v8 = sub_2390F91C4();
  v66 = *(_QWORD **)(v8 - 8);
  v10 = v66[9];
  if (!v10)
  {
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  v11 = v8;
  if (a2 - a1 == 0x8000000000000000 && v10 == -1)
    goto LABEL_66;
  v12 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v10 == -1)
    goto LABEL_67;
  v13 = (uint64_t)(a2 - a1) / v10;
  v71 = a1;
  v70 = a4;
  v14 = v12 / v10;
  if (v13 >= v12 / v10)
  {
    if ((v14 & 0x8000000000000000) == 0)
    {
      v16 = v14 * v10;
      if (a4 < a2 || a2 + v16 <= a4)
      {
        v8 = swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        v8 = swift_arrayInitWithTakeBackToFront();
      }
      v35 = a4 + v16;
      v69 = a4 + v16;
      v71 = a2;
      if (v16 >= 1 && a1 < a2)
      {
        v37 = -v10;
        v38 = (uint64_t (*)(_QWORD))v66[8];
        v62 = v66[2];
        v63 = v38;
        v61 = a4;
        v59 = a1;
        while (1)
        {
          v39 = a3;
          v67 = &v59;
          v40 = v63;
          MEMORY[0x24BDAC7A8](v8, v35 + v37);
          v41 = ((unint64_t)v40 + 15) & 0xFFFFFFFFFFFFFFF0;
          v42 = (char *)&v59 - v41;
          v43 = a2;
          v44 = (void (*)(char *, unint64_t, uint64_t))v62;
          v45 = ((uint64_t (*)(char *))v62)((char *)&v59 - v41);
          v65 = v43;
          v46 = v43 + v37;
          MEMORY[0x24BDAC7A8](v45, v47);
          v48 = v11;
          v49 = (char *)&v59 - v41;
          v44((char *)&v59 - v41, v46, v48);
          v50 = v68;
          v51 = sub_2390F1DC4((uint64_t)&v59 - v41, (uint64_t)&v59 - v41);
          v68 = v50;
          if (v50)
            break;
          v52 = v51;
          v64 = v39 + v37;
          v53 = (void (*)(char *, uint64_t))v66[1];
          v53(v49, v48);
          v8 = ((uint64_t (*)(char *, uint64_t))v53)(v42, v48);
          v11 = v48;
          if ((v52 & 1) != 0)
          {
            a3 = v64;
            if (v39 < v65 || v64 >= v65)
            {
              v8 = swift_arrayInitWithTakeFrontToBack();
              v54 = v61;
            }
            else
            {
              v54 = v61;
              if (v39 != v65)
                v8 = swift_arrayInitWithTakeBackToFront();
            }
            v71 += v37;
          }
          else
          {
            v55 = v69;
            v69 += v37;
            a3 = v64;
            v46 = v65;
            if (v39 < v55 || v64 >= v55)
            {
              v8 = swift_arrayInitWithTakeFrontToBack();
              v54 = v61;
            }
            else
            {
              v54 = v61;
              if (v39 != v55)
                v8 = swift_arrayInitWithTakeBackToFront();
            }
          }
          v35 = v69;
          if (v69 > v54)
          {
            a2 = v46;
            if (v46 > v59)
              continue;
          }
          goto LABEL_64;
        }
        v57 = (void (*)(char *, uint64_t))v66[1];
        v57((char *)&v59 - v41, v48);
        v57((char *)&v59 - v41, v48);
      }
LABEL_64:
      sub_2390F5470(&v71, &v70, (uint64_t *)&v69);
      return 1;
    }
  }
  else if ((v13 & 0x8000000000000000) == 0)
  {
    v15 = v13 * v10;
    if (a4 < a1 || a1 + v15 <= a4)
    {
      v8 = swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      v8 = swift_arrayInitWithTakeBackToFront();
    }
    v65 = a4 + v15;
    v69 = a4 + v15;
    if (v15 >= 1 && a2 < a3)
    {
      v18 = v66[8];
      v63 = (uint64_t (*)(_QWORD))v66[2];
      v64 = v18;
      v60 = a3;
      v62 = v10;
      while (1)
      {
        v67 = &v59;
        v19 = v64;
        MEMORY[0x24BDAC7A8](v8, v9);
        v20 = a2;
        v21 = (char *)&v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
        v22 = v20;
        v23 = a4;
        v24 = (void (*)(char *, unint64_t, uint64_t))v63;
        v25 = v63(v21);
        MEMORY[0x24BDAC7A8](v25, v26);
        v24(v21, v23, v11);
        v27 = v68;
        v28 = sub_2390F1DC4((uint64_t)v21, (uint64_t)v21);
        v68 = v27;
        if (v27)
        {
          v56 = (void (*)(char *, uint64_t))v66[1];
          v56(v21, v11);
          v56(v21, v11);
          goto LABEL_64;
        }
        v29 = v28;
        v30 = (void (*)(char *, uint64_t))v66[1];
        v30(v21, v11);
        v8 = ((uint64_t (*)(char *, uint64_t))v30)(v21, v11);
        v31 = v71;
        if ((v29 & 1) != 0)
        {
          v9 = v22;
          v32 = v62;
          v22 += v62;
          if (v71 < v9 || v71 >= v22)
          {
            v8 = swift_arrayInitWithTakeFrontToBack();
            v33 = v60;
          }
          else
          {
            v33 = v60;
            if (v71 == v9)
              v31 = v9;
            else
              v8 = swift_arrayInitWithTakeBackToFront();
          }
          goto LABEL_37;
        }
        v9 = v70;
        v32 = v62;
        v34 = v70 + v62;
        if (v71 < v70 || v71 >= v34)
        {
          v8 = swift_arrayInitWithTakeFrontToBack();
          v33 = v60;
        }
        else
        {
          v33 = v60;
          if (v71 != v70)
          {
            v8 = swift_arrayInitWithTakeBackToFront();
            v70 = v34;
            goto LABEL_37;
          }
        }
        v70 = v34;
LABEL_37:
        v71 = v31 + v32;
        a4 = v70;
        if (v70 < v65)
        {
          a2 = v22;
          if (v22 < v33)
            continue;
        }
        goto LABEL_64;
      }
    }
    goto LABEL_64;
  }
LABEL_68:
  result = sub_2390F953C();
  __break(1u);
  return result;
}

char *sub_2390F5378(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691D170);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2390F5470(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = sub_2390F91C4();
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_14;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = sub_2390F953C();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack();
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

char *sub_2390F557C(uint64_t a1)
{
  return sub_2390F5378(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

unsigned __int8 *sub_2390F5590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_2390F9368();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_2390F58F0();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_2390F9500();
  }
LABEL_7:
  v11 = sub_2390F5674(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_2390F5674(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_2390F58F0()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_2390F9374();
  v4 = sub_2390F596C(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_2390F596C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_2390F5AB0(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_2390F3BC8(v9, 0);
      v12 = sub_2390F5B9C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x23B837B40](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x23B837B40);
LABEL_9:
      sub_2390F9500();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x23B837B40]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_2390F5AB0(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_2390F3C2C(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_2390F3C2C(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_2390F9338();
  }
  __break(1u);
  return result;
}

unint64_t sub_2390F5B9C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_2390F3C2C(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_2390F9344();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_2390F9500();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_2390F3C2C(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_2390F9320();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_2390F5DAC(_QWORD *a1)
{
  return sub_2390F8394(0, a1[2], 0, a1);
}

uint64_t sub_2390F5DC0(uint64_t a1)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691D160);
    v3 = sub_2390F94B8();
    v4 = 0;
    v5 = v3 + 56;
    v31 = v1;
    v32 = a1 + 32;
    while (1)
    {
      v6 = *(void **)(v32 + 8 * v4);
      sub_2390F92B4();
      sub_2390F962C();
      v7 = v6;
      sub_2390F92FC();
      v8 = sub_2390F9644();
      result = swift_bridgeObjectRelease();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = v8 & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = sub_2390F92B4();
        v17 = v16;
        if (v15 == sub_2390F92B4() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        v20 = sub_2390F95CC();
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
          v22 = sub_2390F92B4();
          v24 = v23;
          if (v22 == sub_2390F92B4() && v24 == v25)
            goto LABEL_3;
          v27 = sub_2390F95CC();
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

uint64_t sub_2390F5FEC(const char *a1)
{
  return sub_2390F6428(a1);
}

uint64_t type metadata accessor for DiagnosticReportCollectorBridge()
{
  return objc_opt_self();
}

uint64_t sub_2390F6020(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(sub_2390F91C4() - 8);
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
  result = sub_2390F953C();
  __break(1u);
  return result;
}

uint64_t sub_2390F6138(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25691D150);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2390F953C();
  __break(1u);
  return result;
}

uint64_t sub_2390F6244(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_2390F953C();
  __break(1u);
  return result;
}

uint64_t sub_2390F6334(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_2390F953C();
  __break(1u);
  return result;
}

uint64_t sub_2390F6428(const char *a1)
{
  uint64_t v1;

  return sub_2390F0E7C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD **)(v1 + 48));
}

uint64_t sub_2390F6448(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2390F6484()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2390F64A8(uint64_t a1)
{
  uint64_t v1;

  return sub_2390F1518(a1, v1);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_2390F64C8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691D178);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2390F6508(uint64_t a1, uint64_t a2)
{
  return sub_2390F0E10(a1, a2);
}

uint64_t sub_2390F6528(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691D178);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2390F6570(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691D178);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_2390F65B8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void PanicCriterials.__allocating_init(id:type:path:panicString:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  objc_class *v8;
  id v17;

  v17 = objc_allocWithZone(v8);
  PanicCriterials.init(id:type:path:panicString:)(a1, a2, a3, a4, a5, a6, a7, a8);
}

void PanicCriterials.init(id:type:path:panicString:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  void *v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  __int128 v24;
  _QWORD v25[8];
  __int128 v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  char v31[16];
  _QWORD *v32;
  _QWORD v33[3];

  v25[5] = a5;
  v25[6] = a6;
  v25[3] = a3;
  v25[4] = a4;
  v25[2] = a2;
  v25[1] = a1;
  v11 = sub_2390F9254();
  v28 = *(_QWORD *)(v11 - 8);
  v29 = v11;
  MEMORY[0x24BDAC7A8](v11, v12);
  v27 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33[0] = 10;
  v33[1] = 0xE100000000000000;
  v32 = v33;
  v14 = v8;
  swift_bridgeObjectRetain();
  v15 = sub_2390F75CC(1, 1, sub_2390F8E70, (uint64_t)v31, a7, a8);
  swift_bridgeObjectRelease();
  v16 = (_QWORD *)sub_2390F6CE8(v15);
  swift_bridgeObjectRelease();
  v17 = v16[2];
  v25[0] = v14;
  if (v17)
  {
    v18 = v16[5];
    v19 = &v14[OBJC_IVAR____SwiftPanicCriterials_panicReasonString];
    *(_QWORD *)v19 = v16[4];
    *((_QWORD *)v19 + 1) = v18;
    if (v17 > v16[2])
    {
      __break(1u);
      JUMPOUT(0x2390F6CC8);
    }
    v20 = (uint64_t)&v16[2 * v17 + 4];
    v21 = *(_QWORD *)(v20 - 16);
    v22 = *(_QWORD *)(v20 - 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v21 = 0;
    v23 = &v14[OBJC_IVAR____SwiftPanicCriterials_panicReasonString];
    v22 = 0xE000000000000000;
    *(_QWORD *)v23 = 0;
    *((_QWORD *)v23 + 1) = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  sub_2390F8E88(v21, v22);
  swift_bridgeObjectRelease();
  v30 = "Swift/Range.swift";
  *(_QWORD *)&v24 = 136315394;
  v26 = v24;
  v25[7] = MEMORY[0x24BEE4AD8] + 8;
  JUMPOUT(0x2390F6864);
}

uint64_t sub_2390F6CE8(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v16 = MEMORY[0x24BEE4AF8];
    sub_2390F81D8(0, v1, 0);
    v2 = v16;
    v4 = (uint64_t *)(a1 + 56);
    do
    {
      v5 = *(v4 - 3);
      v6 = *(v4 - 2);
      v7 = *(v4 - 1);
      v8 = *v4;
      swift_bridgeObjectRetain();
      v9 = MEMORY[0x23B837B28](v5, v6, v7, v8);
      v11 = v10;
      swift_bridgeObjectRelease();
      v13 = *(_QWORD *)(v16 + 16);
      v12 = *(_QWORD *)(v16 + 24);
      if (v13 >= v12 >> 1)
        sub_2390F81D8(v12 > 1, v13 + 1, 1);
      *(_QWORD *)(v16 + 16) = v13 + 1;
      v14 = v16 + 16 * v13;
      *(_QWORD *)(v14 + 32) = v9;
      *(_QWORD *)(v14 + 40) = v11;
      v4 += 4;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void sub_2390F6E84(uint64_t a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[16];
  _QWORD *v13;
  _QWORD v14[2];

  v2 = *a2;
  v3 = a2[1];
  v14[0] = 58;
  v14[1] = 0xE100000000000000;
  v13 = v14;
  swift_bridgeObjectRetain();
  v4 = (_QWORD *)sub_2390F7A68(0x7FFFFFFFFFFFFFFFLL, 1, sub_2390F8E70, (uint64_t)v12, v2, v3);
  if (v4[2])
  {
    v5 = v4[4];
    v6 = v4[5];
    v7 = v4[6];
    v8 = v4[7];
    swift_bridgeObjectRetain();
  }
  else
  {
    v5 = MEMORY[0x23B837C84](0, 0xE000000000000000);
    v6 = v9;
    v7 = v10;
    v8 = v11;
  }
  MEMORY[0x23B837B28](v5, v6, v7, v8);
  swift_bridgeObjectRelease();
  JUMPOUT(0x2390F6F98);
}

uint64_t sub_2390F6F98()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t *v9;
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
  uint64_t v26;
  uint64_t v27;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v30;

  if (v4 == 0x73206C656E72654BLL && v3 == 0xEC0000006564696CLL)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = sub_2390F95CC();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
      JUMPOUT(0x2390F709CLL);
  }
  *(_QWORD *)(v6 - 72) = v2;
  *(_QWORD *)(v6 - 136) = v4;
  if (v5)
  {
    if (v5 > *(_QWORD *)(v1 + 16))
    {
      __break(1u);
      JUMPOUT(0x2390F7414);
    }
    v9 = (uint64_t *)(v1 + 32 * v5);
    v10 = *v9;
    v11 = v9[1];
    v13 = v9[2];
    v12 = v9[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v10 = MEMORY[0x23B837C84](0, 0xE000000000000000);
    v11 = v14;
    v13 = v15;
    v12 = v16;
  }
  v17 = MEMORY[0x23B837B28](v10, v11, v13, v12);
  v19 = v18;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v6 - 96) = v17;
  *(_QWORD *)(v6 - 88) = v19;
  v20 = sub_2390F90E0();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20, v22);
  v24 = (char *)&v30 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2390F90D4();
  sub_2390F9034();
  v25 = sub_2390F9464();
  v27 = v26;
  (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v20);
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v6 - 96) = *v0;
  *v0 = 0x8000000000000000;
  sub_2390F8B44(v25, v27, *(_QWORD *)(v6 - 136), v3, isUniquelyReferenced_nonNull_native);
  *v0 = *(_QWORD *)(v6 - 96);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void PanicCriterials.__allocating_init(id:type:path:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void PanicCriterials.init(id:type:path:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_2390F74D8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id PanicCriterials.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PanicCriterials();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2390F75CC(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  unint64_t v48;
  _QWORD v50[4];

  v50[3] = a4;
  if (a1 < 0)
    goto LABEL_42;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4AF8];
  v47 = swift_allocObject();
  *(_QWORD *)(v47 + 16) = 15;
  v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v12 = HIBYTE(a6) & 0xF) : (v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v11 = a5 & 0xFFFFFFFFFFFFLL;
    v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
      v30 = 11;
    sub_2390F7F04(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    v13 = *(_QWORD **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  v42 = a1;
  v43 = v10;
  v48 = 4 * v12;
  v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v14 = 15;
  v15 = 15;
  v16 = 15;
  while (1)
  {
    v50[0] = sub_2390F935C();
    v50[1] = v17;
    v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) != 0)
      break;
    v14 = sub_2390F9308();
LABEL_9:
    if (v48 == v14 >> 14)
      goto LABEL_29;
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    v14 = sub_2390F9308();
    *(_QWORD *)(v47 + 16) = v14;
    v15 = v14;
    v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14)
    goto LABEL_41;
  v20 = sub_2390F9374();
  v44 = v21;
  v45 = v20;
  v23 = v22;
  v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v13 = sub_2390F362C(0, v13[2] + 1, 1, v13);
  v27 = v13[2];
  v26 = v13[3];
  if (v27 >= v26 >> 1)
    v13 = sub_2390F362C((_QWORD *)(v26 > 1), v27 + 1, 1, v13);
  v13[2] = v27 + 1;
  v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(_QWORD *)(v43 + 16) = v13;
  v29 = sub_2390F9308();
  v14 = v29;
  *(_QWORD *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    v15 = v29;
    v16 = v29;
    goto LABEL_9;
  }
  v16 = v29;
  v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    v31 = sub_2390F9374();
    v33 = v32;
    v35 = v34;
    v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v13 = sub_2390F362C(0, v13[2] + 1, 1, v13);
    v39 = v13[2];
    v38 = v13[3];
    if (v39 >= v38 >> 1)
      v13 = sub_2390F362C((_QWORD *)(v38 > 1), v39 + 1, 1, v13);
    v13[2] = v39 + 1;
    v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(_QWORD *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_2390F950C();
  __break(1u);
LABEL_42:
  result = sub_2390F950C();
  __break(1u);
  return result;
}

uint64_t sub_2390F7A68(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, unint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t result;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  _QWORD *v43;
  uint64_t v44;
  unint64_t v45;
  _QWORD v47[4];

  v47[3] = a4;
  if (a1 < 0)
    goto LABEL_35;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4AF8];
  v44 = swift_allocObject();
  *(_QWORD *)(v44 + 16) = a5;
  if (!a1 || (v45 = a6 >> 14, a6 >> 14 == a5 >> 14))
  {
    sub_2390F805C(a6, v44, a2 & 1, v10);
    swift_bridgeObjectRelease();
    a6 = *(_QWORD *)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_5:
    swift_release();
    return a6;
  }
  v35 = a1;
  v36 = v10;
  v43 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v12 = a5;
  v13 = a5;
  v40 = a5;
  while (1)
  {
    v47[0] = sub_2390F9428();
    v47[1] = v14;
    v15 = a3(v47);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return a6;
    }
    v16 = v15;
    swift_bridgeObjectRelease();
    if ((v16 & 1) != 0)
      break;
    v12 = sub_2390F941C();
LABEL_9:
    if (v45 == v12 >> 14)
      goto LABEL_24;
  }
  if (v13 >> 14 == v12 >> 14 && (a2 & 1) != 0)
  {
    v12 = sub_2390F941C();
    *(_QWORD *)(v44 + 16) = v12;
    v13 = v12;
    v40 = v12;
    goto LABEL_9;
  }
  if (v12 >> 14 < v13 >> 14)
    goto LABEL_34;
  v17 = sub_2390F9440();
  v39 = v18;
  v41 = v17;
  v37 = v20;
  v38 = v19;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v43 = sub_2390F362C(0, v43[2] + 1, 1, v43);
  v22 = v43[2];
  v21 = v43[3];
  if (v22 >= v21 >> 1)
    v43 = sub_2390F362C((_QWORD *)(v21 > 1), v22 + 1, 1, v43);
  v43[2] = v22 + 1;
  v23 = &v43[4 * v22];
  v23[4] = v41;
  v23[5] = v39;
  v23[6] = v38;
  v23[7] = v37;
  *(_QWORD *)(v36 + 16) = v43;
  v24 = sub_2390F941C();
  v12 = v24;
  *(_QWORD *)(v44 + 16) = v24;
  if (v43[2] != v35)
  {
    v13 = v24;
    v40 = v24;
    goto LABEL_9;
  }
  v40 = v24;
  v13 = v24;
LABEL_24:
  if (v45 == v13 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    a6 = (unint64_t)v43;
LABEL_33:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_5;
  }
  if (v45 >= v40 >> 14)
  {
    v25 = sub_2390F9440();
    v27 = v26;
    v29 = v28;
    v31 = v30;
    swift_bridgeObjectRelease();
    a6 = (unint64_t)v43;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      a6 = (unint64_t)sub_2390F362C(0, v43[2] + 1, 1, v43);
    v33 = *(_QWORD *)(a6 + 16);
    v32 = *(_QWORD *)(a6 + 24);
    if (v33 >= v32 >> 1)
      a6 = (unint64_t)sub_2390F362C((_QWORD *)(v32 > 1), v33 + 1, 1, (_QWORD *)a6);
    *(_QWORD *)(a6 + 16) = v33 + 1;
    v34 = (_QWORD *)(a6 + 32 * v33);
    v34[4] = v25;
    v34[5] = v27;
    v34[6] = v29;
    v34[7] = v31;
    *(_QWORD *)(v36 + 16) = a6;
    goto LABEL_33;
  }
LABEL_34:
  sub_2390F950C();
  __break(1u);
LABEL_35:
  result = sub_2390F950C();
  __break(1u);
  return result;
}

uint64_t sub_2390F7F04(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
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
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = sub_2390F9374();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(_QWORD **)(a4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_2390F362C(0, v14[2] + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      v14 = sub_2390F362C((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  result = sub_2390F950C();
  __break(1u);
  return result;
}

uint64_t sub_2390F805C(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
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
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = sub_2390F9440();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(_QWORD **)(a4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_2390F362C(0, v14[2] + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      v14 = sub_2390F362C((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  result = sub_2390F950C();
  __break(1u);
  return result;
}

uint64_t sub_2390F81BC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2390F81F4(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_2390F81D8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2390F8574(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2390F81F4(char a1, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25691D1F0);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8)
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691D030);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2390F953C();
  __break(1u);
  return result;
}

uint64_t sub_2390F8394(char a1, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691D180);
  v10 = *(_QWORD *)(sub_2390F91C4() - 8);
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
  v16 = *(_QWORD *)(sub_2390F91C4() - 8);
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
  result = sub_2390F953C();
  __break(1u);
  return result;
}

uint64_t sub_2390F8574(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691D168);
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
  result = sub_2390F953C();
  __break(1u);
  return result;
}

unint64_t sub_2390F86DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2390F962C();
  sub_2390F92FC();
  v4 = sub_2390F9644();
  return sub_2390F8740(a1, a2, v4);
}

unint64_t sub_2390F8740(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2390F95CC() & 1) == 0)
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
      while (!v14 && (sub_2390F95CC() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2390F8820(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691D190);
  v42 = a2;
  v6 = sub_2390F9524();
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
    sub_2390F962C();
    sub_2390F92FC();
    result = sub_2390F9644();
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

uint64_t sub_2390F8B44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
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
  v14 = sub_2390F86DC(a3, a4);
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
    sub_2390F8CB8();
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
  sub_2390F8820(v17, a5 & 1);
  v23 = sub_2390F86DC(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_2390F95D8();
  __break(1u);
  return result;
}

void *sub_2390F8CB8()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691D190);
  v2 = *v0;
  v3 = sub_2390F9518();
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

uint64_t sub_2390F8E70(_QWORD *a1)
{
  return sub_2390F8FE0(a1) & 1;
}

uint64_t sub_2390F8E88(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[4];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)&v9 = 10;
  *((_QWORD *)&v9 + 1) = 0xE100000000000000;
  v8[2] = &v9;
  swift_bridgeObjectRetain();
  v4 = sub_2390F75CC(0x7FFFFFFFFFFFFFFFLL, 1, sub_2390F8E70, (uint64_t)v8, a1, a2);
  v12 = MEMORY[0x24BEE4B00];
  if (*(_QWORD *)(v4 + 16))
  {
    swift_bridgeObjectRetain();
    v5 = *(_QWORD *)(v4 + 48);
    v6 = *(_QWORD *)(v4 + 56);
    v9 = *(_OWORD *)(v4 + 32);
    v10 = v5;
    v11 = v6;
    swift_bridgeObjectRetain();
    sub_2390F6E84((uint64_t)&v12, (unint64_t *)&v9);
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4B00];
}

uint64_t type metadata accessor for PanicCriterials()
{
  return objc_opt_self();
}

uint64_t method lookup function for PanicCriterials()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PanicCriterials.__allocating_init(id:type:path:panicString:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t sub_2390F8FE0(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1])
    return 1;
  else
    return sub_2390F95CC() & 1;
}

unint64_t sub_2390F9034()
{
  unint64_t result;

  result = qword_25691D1E8;
  if (!qword_25691D1E8)
  {
    result = MEMORY[0x23B838218](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25691D1E8);
  }
  return result;
}

uint64_t sub_2390F9078()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2390F909C()
{
  return swift_deallocObject();
}

uint64_t sub_2390F90B0()
{
  return MEMORY[0x24BDCB228]();
}

uint64_t sub_2390F90BC()
{
  return MEMORY[0x24BDCB258]();
}

uint64_t sub_2390F90C8()
{
  return MEMORY[0x24BDCB270]();
}

uint64_t sub_2390F90D4()
{
  return MEMORY[0x24BDCB6B8]();
}

uint64_t sub_2390F90E0()
{
  return MEMORY[0x24BDCB748]();
}

uint64_t sub_2390F90EC()
{
  return MEMORY[0x24BDCBBA8]();
}

uint64_t sub_2390F90F8()
{
  return MEMORY[0x24BDCBBC0]();
}

uint64_t sub_2390F9104()
{
  return MEMORY[0x24BDCBBE0]();
}

uint64_t sub_2390F9110()
{
  return MEMORY[0x24BDCBBE8]();
}

uint64_t sub_2390F911C()
{
  return MEMORY[0x24BDCBC00]();
}

uint64_t sub_2390F9128()
{
  return MEMORY[0x24BDCBC08]();
}

uint64_t sub_2390F9134()
{
  return MEMORY[0x24BDCBE58]();
}

uint64_t sub_2390F9140()
{
  return MEMORY[0x24BDCBE70]();
}

uint64_t sub_2390F914C()
{
  return MEMORY[0x24BDCBE88]();
}

uint64_t sub_2390F9158()
{
  return MEMORY[0x24BDCC718]();
}

uint64_t sub_2390F9164()
{
  return MEMORY[0x24BDCC7F0]();
}

uint64_t sub_2390F9170()
{
  return MEMORY[0x24BDCC810]();
}

uint64_t sub_2390F917C()
{
  return MEMORY[0x24BDCD818]();
}

uint64_t sub_2390F9188()
{
  return MEMORY[0x24BDCD840]();
}

uint64_t sub_2390F9194()
{
  return MEMORY[0x24BDCD868]();
}

uint64_t sub_2390F91A0()
{
  return MEMORY[0x24BDCD998]();
}

uint64_t sub_2390F91AC()
{
  return MEMORY[0x24BDCD9B8]();
}

uint64_t sub_2390F91B8()
{
  return MEMORY[0x24BDCDA00]();
}

uint64_t sub_2390F91C4()
{
  return MEMORY[0x24BDCDAB8]();
}

uint64_t sub_2390F91D0()
{
  return MEMORY[0x24BDCDB70]();
}

uint64_t sub_2390F91DC()
{
  return MEMORY[0x24BDCDBC0]();
}

uint64_t sub_2390F91E8()
{
  return MEMORY[0x24BDCE338]();
}

uint64_t sub_2390F91F4()
{
  return MEMORY[0x24BDCE5E0]();
}

uint64_t sub_2390F9200()
{
  return MEMORY[0x24BDCE8F0]();
}

uint64_t sub_2390F920C()
{
  return MEMORY[0x24BDCE908]();
}

uint64_t sub_2390F9218()
{
  return MEMORY[0x24BEE7370]();
}

uint64_t sub_2390F9224()
{
  return MEMORY[0x24BEE7448]();
}

uint64_t sub_2390F9230()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2390F923C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2390F9248()
{
  return MEMORY[0x24BEE78C8]();
}

uint64_t sub_2390F9254()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2390F9260()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2390F926C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2390F9278()
{
  return MEMORY[0x24BDCF800]();
}

uint64_t sub_2390F9284()
{
  return MEMORY[0x24BEE75B8]();
}

uint64_t sub_2390F9290()
{
  return MEMORY[0x24BDCF9E8]();
}

uint64_t sub_2390F929C()
{
  return MEMORY[0x24BDCFA00]();
}

uint64_t sub_2390F92A8()
{
  return MEMORY[0x24BDCFA10]();
}

uint64_t sub_2390F92B4()
{
  return MEMORY[0x24BDCFA20]();
}

uint64_t sub_2390F92C0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2390F92CC()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_2390F92D8()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_2390F92E4()
{
  return MEMORY[0x24BEE0A60]();
}

uint64_t sub_2390F92F0()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_2390F92FC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2390F9308()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_2390F9314()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2390F9320()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_2390F932C()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_2390F9338()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_2390F9344()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_2390F9350()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_2390F935C()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_2390F9368()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_2390F9374()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2390F9380()
{
  return MEMORY[0x24BDCFBA0]();
}

uint64_t sub_2390F938C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2390F9398()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2390F93A4()
{
  return MEMORY[0x24BDCFCB8]();
}

uint64_t sub_2390F93B0()
{
  return MEMORY[0x24BDCFCE0]();
}

uint64_t sub_2390F93BC()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_2390F93C8()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_2390F93D4()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2390F93E0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2390F93EC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2390F93F8()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_2390F9404()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2390F9410()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2390F941C()
{
  return MEMORY[0x24BEE1DA8]();
}

uint64_t sub_2390F9428()
{
  return MEMORY[0x24BEE1E50]();
}

uint64_t sub_2390F9434()
{
  return MEMORY[0x24BEE1E58]();
}

uint64_t sub_2390F9440()
{
  return MEMORY[0x24BEE1E60]();
}

uint64_t sub_2390F944C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2390F9458()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2390F9464()
{
  return MEMORY[0x24BDD0540]();
}

uint64_t sub_2390F9470()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2390F947C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2390F9488()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_2390F9494()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_2390F94A0()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_2390F94AC()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2390F94B8()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2390F94C4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2390F94D0()
{
  return MEMORY[0x24BEE26F0]();
}

uint64_t sub_2390F94DC()
{
  return MEMORY[0x24BEE26F8]();
}

uint64_t sub_2390F94E8()
{
  return MEMORY[0x24BEE2700]();
}

uint64_t sub_2390F94F4()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_2390F9500()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2390F950C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2390F9518()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2390F9524()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2390F9530()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2390F953C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2390F9548()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2390F9554()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2390F9560()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_2390F956C()
{
  return MEMORY[0x24BEE3340]();
}

uint64_t sub_2390F9578()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2390F9584()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2390F9590()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_2390F959C()
{
  return MEMORY[0x24BEE3488]();
}

uint64_t sub_2390F95A8()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2390F95B4()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2390F95C0()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2390F95CC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2390F95D8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2390F95E4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2390F95F0()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2390F95FC()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2390F9608()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2390F9614()
{
  return MEMORY[0x24BDD0748]();
}

uint64_t sub_2390F9620()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_2390F962C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2390F9638()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2390F9644()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2390F9650()
{
  return MEMORY[0x24BDD07D8]();
}

uint64_t sub_2390F965C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2390F9668()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2390F9674()
{
  return MEMORY[0x24BEE49E8]();
}

uint64_t sub_2390F9680()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2390F968C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_2390F9698()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
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

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE798](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x24BEE4C20]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

