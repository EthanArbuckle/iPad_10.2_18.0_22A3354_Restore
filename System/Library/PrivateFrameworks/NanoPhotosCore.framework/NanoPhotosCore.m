id PHChange.npto_changeDetails<A>(for:)(uint64_t a1)
{
  void *v1;
  id result;

  result = objc_msgSend(v1, sel_changeDetailsForObject_, a1);
  if (result)
  {
    objc_opt_self();
    return (id)swift_dynamicCastObjCClassUnconditional();
  }
  return result;
}

id PHChange.npto_changeDetails<A>(for:)()
{
  void *v0;
  id result;

  objc_opt_self();
  result = objc_msgSend(v0, sel_changeDetailsForFetchResult_, swift_dynamicCastObjCClassUnconditional());
  if (result)
  {
    objc_opt_self();
    return (id)swift_dynamicCastObjCClassUnconditional();
  }
  return result;
}

uint64_t sub_21387EB08()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254D07370);
  swift_allocObject();
  result = sub_21388C634();
  static TaskTracing.$id = result;
  return result;
}

uint64_t *TaskTracing.$id.unsafeMutableAddressor()
{
  if (qword_254D076F0 != -1)
    swift_once();
  return &static TaskTracing.$id;
}

uint64_t static TaskTracing.$id.getter()
{
  if (qword_254D076F0 != -1)
    swift_once();
  return swift_retain();
}

uint64_t static TaskTracing.id.getter()
{
  uint64_t v1;

  if (qword_254D076F0 != -1)
    swift_once();
  sub_21388C640();
  return v1;
}

ValueMetadata *type metadata accessor for TaskTracing()
{
  return &type metadata for TaskTracing;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199B7C6C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21387EC88(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_21387EC94(*a1, *a2);
}

uint64_t sub_21387EC94(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x7475636578457369;
    else
      v3 = 0x6873696E69467369;
    if (v2 == 1)
      v4 = 0xEB00000000676E69;
    else
      v4 = 0xEA00000000006465;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x7475636578457369;
      else
        v6 = 0x6873696E69467369;
      if (v5 == 1)
        v7 = 0xEB00000000676E69;
      else
        v7 = 0xEA00000000006465;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE700000000000000;
    v3 = 0x79646165527369;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE700000000000000;
  if (v3 != 0x79646165527369)
  {
LABEL_21:
    v8 = sub_21388C5B0();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21387EDC4()
{
  sub_21388C604();
  sub_21388C340();
  swift_bridgeObjectRelease();
  return sub_21388C61C();
}

uint64_t sub_21387EE70()
{
  sub_21388C340();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21387EEF8()
{
  sub_21388C604();
  sub_21388C340();
  swift_bridgeObjectRelease();
  return sub_21388C61C();
}

uint64_t sub_21387EFA0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21387FE7C();
  *a1 = result;
  return result;
}

void sub_21387EFCC(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE700000000000000;
  v4 = 0xEB00000000676E69;
  v5 = 0x7475636578457369;
  if (v2 != 1)
  {
    v5 = 0x6873696E69467369;
    v4 = 0xEA00000000006465;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x79646165527369;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t variable initialization expression of AsyncOperation.stateQueue()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_21388C490();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21388C2EC();
  MEMORY[0x24BDAC7A8]();
  sub_21388C484();
  MEMORY[0x24BDAC7A8]();
  sub_21387F16C();
  sub_21388C478();
  sub_21388C2E0();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v0);
  return sub_21388C4C0();
}

unint64_t sub_21387F16C()
{
  unint64_t result;

  result = qword_254D073E0;
  if (!qword_254D073E0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254D073E0);
  }
  return result;
}

uint64_t variable initialization expression of AsyncOperation._state()
{
  return 0;
}

void AsyncOperation.state.setter(char a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v2 = v1;
  v4 = sub_21388C2D4();
  v13 = *(_QWORD *)(v4 - 8);
  v14 = v4;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = v1;
  sub_21388C4A8();
  v12[1] = 0;
  v7 = (void *)sub_21388C334();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_willChangeValueForKey_, v7);

  v8 = (void *)sub_21388C334();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_willChangeValueForKey_, v8);

  v9 = sub_21388C2C8();
  MEMORY[0x24BDAC7A8](v9);
  v12[-2] = v1;
  LOBYTE(v12[-1]) = a1;
  sub_21388C49C();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v6, v14);
  v10 = (void *)sub_21388C334();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_didChangeValueForKey_, v10);

  v11 = (void *)sub_21388C334();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_didChangeValueForKey_, v11);

}

uint64_t AsyncOperation.isAsynchronous.getter()
{
  return 1;
}

uint64_t AsyncOperation.isReady.getter()
{
  char v0;
  char v2;

  sub_21388C4A8();
  if (v2)
    v0 = sub_21388C5B0();
  else
    v0 = 1;
  swift_bridgeObjectRelease();
  return v0 & 1;
}

void sub_21387F610(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(*(_QWORD *)(v1 + 16) + OBJC_IVAR____TtC14NanoPhotosCore14AsyncOperation__state);
}

uint64_t AsyncOperation.isExecuting.getter()
{
  char v0;
  char v2;

  sub_21388C4A8();
  if (v2 && v2 == 1)
    v0 = 1;
  else
    v0 = sub_21388C5B0();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t AsyncOperation.isFinished.getter()
{
  char v0;
  char v2;

  sub_21388C4A8();
  if (v2 && v2 != 1)
    v0 = 1;
  else
    v0 = sub_21388C5B0();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

Swift::Void __swiftcall AsyncOperation.start()()
{
  void *v0;

  if (objc_msgSend(v0, sel_isCancelled))
  {
    AsyncOperation.state.setter(2);
  }
  else
  {
    AsyncOperation.state.setter(0);
    objc_msgSend(v0, sel_main);
  }
}

Swift::Void __swiftcall AsyncOperation.main()()
{
  sub_21388C574();
  __break(1u);
}

Swift::Void __swiftcall AsyncOperation.finish()()
{
  char v0;
  char v1;

  sub_21388C4A8();
  if (v1 && v1 != 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v0 = sub_21388C5B0();
    swift_bridgeObjectRelease();
    if ((v0 & 1) == 0)
      AsyncOperation.state.setter(2);
  }
}

id AsyncOperation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id AsyncOperation.init()()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  objc_class *v10;
  objc_super v12;

  v1 = v0;
  v2 = sub_21388C490();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21388C2EC();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_21388C484();
  MEMORY[0x24BDAC7A8](v7);
  v8 = OBJC_IVAR____TtC14NanoPhotosCore14AsyncOperation_stateQueue;
  sub_21387F16C();
  v9 = v1;
  sub_21388C478();
  sub_21388C2E0();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5750], v2);
  *(_QWORD *)&v1[v8] = sub_21388C4C0();
  v9[OBJC_IVAR____TtC14NanoPhotosCore14AsyncOperation__state] = 0;

  v10 = (objc_class *)type metadata accessor for AsyncOperation();
  v12.receiver = v9;
  v12.super_class = v10;
  return objc_msgSendSuper2(&v12, sel_init);
}

uint64_t type metadata accessor for AsyncOperation()
{
  return objc_opt_self();
}

id AsyncOperation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AsyncOperation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t variable initialization expression of AsyncFailableOperation.completionHandler()
{
  return 0;
}

id AsyncFailableOperation.__allocating_init(completionHandler:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;
  id v6;

  v5 = objc_allocWithZone(v2);
  v6 = sub_21387FEC4(a1, a2);
  sub_21387FF3C(a1);
  return v6;
}

id AsyncFailableOperation.init(completionHandler:)(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = sub_21387FEC4(a1, a2);
  sub_21387FF3C(a1);
  return v3;
}

void AsyncFailableOperation.finish(_:)(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t);

  v2 = *(void (**)(uint64_t))(v1 + qword_254D07388);
  if (v2)
  {
    sub_21387FF4C((uint64_t)v2);
    v2(a1);
    sub_21387FF3C((uint64_t)v2);
  }
  AsyncOperation.finish()();
}

void AsyncFailableOperation.init()()
{
  sub_21387FF5C();
}

void sub_21387FDE4()
{
  sub_21387FF5C();
}

uint64_t sub_21387FE04()
{
  uint64_t v0;

  return sub_21387FF3C(*(_QWORD *)(v0 + qword_254D07388));
}

id AsyncFailableOperation.__deallocating_deinit()
{
  _QWORD *v0;
  objc_class *v1;
  objc_super v3;

  v1 = (objc_class *)type metadata accessor for AsyncFailableOperation(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x90), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x98), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0));
  v3.receiver = v0;
  v3.super_class = v1;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_21387FE68(uint64_t a1)
{
  return sub_21387FF3C(*(_QWORD *)(a1 + qword_254D07388));
}

uint64_t sub_21387FE7C()
{
  unint64_t v0;

  v0 = sub_21388C598();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

id sub_21387FEC4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t *v3;
  uint64_t *v4;
  objc_class *v5;
  objc_super v7;

  v3 = (uint64_t *)(*MEMORY[0x24BEE4EA0] & *v2);
  v4 = (_QWORD *)((char *)v2 + qword_254D07388);
  *v4 = a1;
  v4[1] = a2;
  sub_21387FF4C(a1);
  sub_21387FF3C(0);
  v5 = (objc_class *)type metadata accessor for AsyncFailableOperation(0, v3[18], v3[19], v3[20]);
  v7.receiver = v2;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t sub_21387FF3C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_21387FF4C(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

void sub_21387FF5C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t type metadata accessor for AsyncFailableOperation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncFailableOperation);
}

uint64_t sub_21387FF98()
{
  return swift_initClassMetadata2();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AsyncOperation.OperationState(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AsyncOperation.OperationState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2138800C4 + 4 * byte_21388D0C5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2138800F8 + 4 * asc_21388D0C0[v4]))();
}

uint64_t sub_2138800F8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213880100(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213880108);
  return result;
}

uint64_t sub_213880114(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21388011CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_213880120(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213880128(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213880134(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_213880140(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AsyncOperation.OperationState()
{
  return &type metadata for AsyncOperation.OperationState;
}

unint64_t sub_21388015C()
{
  unint64_t result;

  result = qword_254D07800[0];
  if (!qword_254D07800[0])
  {
    result = MEMORY[0x2199B7C84](&unk_21388D1A8, &type metadata for AsyncOperation.OperationState);
    atomic_store(result, qword_254D07800);
  }
  return result;
}

void sub_2138801A0()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC14NanoPhotosCore14AsyncOperation__state) = *(_BYTE *)(v0 + 24);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2199B7C24](a1, v6, a5);
}

void AsyncFailableOperation.completionHandler.setter()
{
  swift_deletedMethodError();
  __break(1u);
}

void sub_2138801F8(_BYTE *a1@<X8>)
{
  sub_21387F610(a1);
}

const char *NanoPhotosCoreFeatures.domain.getter()
{
  return "NanoPhotosCore";
}

uint64_t NanoPhotosCoreFeatures.feature.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_21388024C + 4 * byte_21388D1E0[a1]))("LocalLibrary", 12);
}

const char *sub_21388024C()
{
  return "MemoriesSync";
}

const char *sub_21388026C()
{
  return "GIFSupport";
}

BOOL static NanoPhotosCoreFeatures.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t NanoPhotosCoreFeatures.hash(into:)()
{
  return sub_21388C610();
}

uint64_t NanoPhotosCoreFeatures.hashValue.getter()
{
  sub_21388C604();
  sub_21388C610();
  return sub_21388C61C();
}

BOOL sub_2138802F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21388030C()
{
  sub_21388C604();
  sub_21388C610();
  return sub_21388C61C();
}

uint64_t sub_213880350()
{
  return sub_21388C610();
}

uint64_t sub_213880378()
{
  sub_21388C604();
  sub_21388C610();
  return sub_21388C61C();
}

unint64_t sub_2138803BC()
{
  unint64_t result;

  result = qword_254D073B8;
  if (!qword_254D073B8)
  {
    result = MEMORY[0x2199B7C84](&protocol conformance descriptor for NanoPhotosCoreFeatures, &type metadata for NanoPhotosCoreFeatures);
    atomic_store(result, (unint64_t *)&qword_254D073B8);
  }
  return result;
}

const char *sub_213880400()
{
  return "NanoPhotosCore";
}

uint64_t sub_213880414()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_21388043C + 4 * byte_21388D1E4[*v0]))("LocalLibrary", 12);
}

const char *sub_21388043C()
{
  return "MemoriesSync";
}

const char *sub_21388045C()
{
  return "GIFSupport";
}

uint64_t getEnumTagSinglePayload for NanoPhotosCoreFeatures(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for NanoPhotosCoreFeatures(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21388054C + 4 * byte_21388D1ED[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_213880580 + 4 * byte_21388D1E8[v4]))();
}

uint64_t sub_213880580(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213880588(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213880590);
  return result;
}

uint64_t sub_21388059C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2138805A4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2138805A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2138805B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NanoPhotosCoreFeatures()
{
  return &type metadata for NanoPhotosCoreFeatures;
}

uint64_t property wrapper backing initializer of FetchResultObserver.fetchResult(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D073C0);
  return sub_213880610((uint64_t)&v3, v1);
}

uint64_t sub_213880610(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  sub_21388C280();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
}

uint64_t sub_2138806A8@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x70))();
  *a2 = result;
  return result;
}

uint64_t sub_2138806E8(id *a1)
{
  id v1;

  v1 = *a1;
  return sub_2138807C4();
}

uint64_t FetchResultObserver.fetchResult.getter()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_21388C2A4();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2138807AC()
{
  return 8;
}

_QWORD *sub_2138807B8(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_2138807C4()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_21388C2B0();
}

uint64_t variable initialization expression of FetchResultObserver._fetchResult()
{
  return 0;
}

uint64_t sub_21388085C(_QWORD **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x88))();
}

uint64_t sub_213880894(uint64_t a1)
{
  return sub_213881178(a1);
}

uint64_t FetchResultObserver.$fetchResult.getter()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D073C8);
  sub_21388C28C();
  return swift_endAccess();
}

uint64_t sub_213880924(uint64_t a1)
{
  uint64_t v2;

  sub_213881178(a1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D073D0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t variable initialization expression of FetchResultObserver.updatePublisher()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D073D8);
  return sub_21388C274();
}

uint64_t FetchResultObserver.updatePublisher.getter()
{
  return swift_retain();
}

id FetchResultObserver.__allocating_init(_:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return FetchResultObserver.init(_:)(a1);
}

id FetchResultObserver.init(_:)(void *a1)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *ResultObserver;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v25;
  objc_super v26;
  uint64_t v27;

  v3 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v4 = *MEMORY[0x24BEE4EA0] & *v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D073C8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = v4 + 80;
  v9 = *(_QWORD *)(v4 + 80);
  v11 = (char *)v1 + *(_QWORD *)(v10 + 8);
  v12 = v1;
  v27 = 0;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D073C0);
  sub_213880610((uint64_t)&v27, v13);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v8, v5);
  v14 = *(_QWORD *)((*v3 & *v12) + 0x60);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D073D8);
  *(_QWORD *)((char *)v12 + v14) = sub_21388C274();
  *(_QWORD *)((char *)v12 + *(_QWORD *)((*v3 & *v12) + 0x68)) = a1;
  v15 = a1;

  ResultObserver = (objc_class *)type metadata accessor for FetchResultObserver(0, v9, v16, v17);
  v26.receiver = v12;
  v26.super_class = ResultObserver;
  v19 = objc_msgSendSuper2(&v26, sel_init);
  v20 = (void *)objc_opt_self();
  v21 = v19;
  v22 = objc_msgSend(v20, sel_sharedPhotoLibrary);
  v23 = v21;
  objc_msgSend(v22, sel_registerChangeObserver_, v23);

  return v23;
}

id FetchResultObserver.__deallocating_deinit()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  objc_class *ResultObserver;
  objc_super v7;

  v1 = *MEMORY[0x24BEE4EA0] & *v0;
  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedPhotoLibrary);
  objc_msgSend(v2, sel_unregisterChangeObserver_, v0);

  ResultObserver = (objc_class *)type metadata accessor for FetchResultObserver(0, *(_QWORD *)(v1 + 80), v3, v4);
  v7.receiver = v0;
  v7.super_class = ResultObserver;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

id sub_213880C18(void *a1)
{
  id v1;

  v1 = a1;
  return FetchResultObserver.__deallocating_deinit();
}

void sub_213880C3C(_QWORD *a1)
{
  _QWORD *v2;
  char *v3;
  uint64_t v4;

  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v3 = (char *)a1 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *a1) + 0x58);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D073C8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();

}

uint64_t FetchResultObserver.setObservedFetchResult(_:)(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[2];
  _QWORD aBlock[6];

  v3 = sub_21388C2D4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21388C2EC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v1;
  *(_QWORD *)(v11 + 24) = a1;
  aBlock[4] = sub_213881278;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_213880E94;
  aBlock[3] = &block_descriptor;
  v12 = _Block_copy(aBlock);
  v13 = a1;
  v14 = v1;
  sub_21388C2E0();
  v16[1] = MEMORY[0x24BEE4AF8];
  sub_2138813B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D073F0);
  sub_213881400();
  sub_21388C508();
  MEMORY[0x2199B760C](0, v10, v6, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

uint64_t sub_213880E94(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

Swift::Void __swiftcall FetchResultObserver.photoLibraryDidChange(_:)(PHChange a1)
{
  objc_class *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  PHChange *v11;
  void *v12;
  objc_class *v13;
  objc_class *v14;
  _QWORD v15[2];
  _QWORD aBlock[6];

  v3 = sub_21388C2D4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21388C2EC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (PHChange *)swift_allocObject();
  v11[2].super.isa = v1;
  v11[3].super.isa = a1.super.isa;
  aBlock[4] = sub_213881490;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_213880E94;
  aBlock[3] = &block_descriptor_7;
  v12 = _Block_copy(aBlock);
  v13 = v1;
  v14 = a1.super.isa;
  sub_21388C2E0();
  v15[1] = MEMORY[0x24BEE4AF8];
  sub_2138813B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D073F0);
  sub_213881400();
  sub_21388C508();
  MEMORY[0x2199B760C](0, v10, v6, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_release();
}

void sub_21388108C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  FetchResultObserver.photoLibraryDidChange(_:)((PHChange)v4);

}

id FetchResultObserver.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void FetchResultObserver.init()()
{
  sub_213881590();
}

void sub_21388111C()
{
  sub_213881590();
}

uint64_t sub_213881138@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t result;

  type metadata accessor for FetchResultObserver(0, *(_QWORD *)(a1 + 80), a2, a3);
  result = sub_21388C25C();
  *a4 = result;
  return result;
}

uint64_t sub_213881178(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D073D0);
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D073C8);
  sub_21388C298();
  return swift_endAccess();
}

uint64_t type metadata accessor for FetchResultObserver(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FetchResultObserver);
}

uint64_t sub_21388124C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_213881278()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  char v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v1 = *(void **)(v0 + 24);
  v2 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **(_QWORD **)(v0 + 16)) + 0x70))();
  if (!v2)
  {
    if (!v1)
      return;
    v4 = v1;
    goto LABEL_7;
  }
  v3 = v2;
  if (!v1)
  {

    sub_2138807C4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D07468);
    v7 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    v6 = 0;
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D07468);
  v4 = v1;
  v5 = sub_21388C4CC();

  if ((v5 & 1) == 0)
  {
LABEL_7:
    v6 = v4;
    sub_2138807C4();
    v7 = v6;
LABEL_9:
    v8 = v6;
    v9 = v7;
    sub_21388C268();

  }
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

unint64_t sub_2138813B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D073E8;
  if (!qword_254D073E8)
  {
    v1 = sub_21388C2D4();
    result = MEMORY[0x2199B7C84](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_254D073E8);
  }
  return result;
}

unint64_t sub_213881400()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D073F8;
  if (!qword_254D073F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D073F0);
    result = MEMORY[0x2199B7C84](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_254D073F8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199B7C78](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_213881490()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v1 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **(_QWORD **)(v0 + 16)) + 0x70))();
  if (v1)
  {
    v7 = (id)v1;
    v2 = PHChange.npto_changeDetails<A>(for:)();
    if (v2)
    {
      v3 = v2;
      v4 = objc_msgSend(v2, sel_fetchResultAfterChanges);
      sub_2138807C4();
      v5 = v4;
      v6 = v3;
      sub_21388C268();

    }
    else
    {

    }
  }
}

void sub_213881590()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_2138815BC()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_2138815C8()
{
  return 8;
}

uint64_t sub_2138815D4()
{
  return 8;
}

void sub_2138815E0()
{
  unint64_t v0;

  sub_213881668();
  if (v0 <= 0x3F)
    swift_initClassMetadata2();
}

void sub_213881668()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254D07460)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D073C0);
    v0 = sub_21388C2BC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254D07460);
  }
}

uint64_t static TemporaryResourceFileError.__derived_enum_equals(_:_:)()
{
  return 1;
}

uint64_t TemporaryResourceFileError.hash(into:)()
{
  return sub_21388C610();
}

uint64_t TemporaryResourceFileError.hashValue.getter()
{
  sub_21388C604();
  sub_21388C610();
  return sub_21388C61C();
}

uint64_t sub_213881740()
{
  return 1;
}

uint64_t sub_213881748()
{
  sub_21388C604();
  sub_21388C610();
  return sub_21388C61C();
}

uint64_t sub_213881788()
{
  return sub_21388C610();
}

uint64_t sub_2138817AC()
{
  sub_21388C604();
  sub_21388C610();
  return sub_21388C61C();
}

uint64_t TemporaryResourceFile.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC14NanoPhotosCore21TemporaryResourceFile_url;
  v4 = sub_21388C208();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t TemporaryResourceFile.metadata.getter()
{
  return swift_bridgeObjectRetain();
}

char *TemporaryResourceFile.__allocating_init(idsResourceURL:metadata:)(char *a1, uint64_t a2)
{
  uint64_t v3;
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  char *v41;
  void *v42;
  char *v43;
  id v44;
  char *v45;
  void *v46;
  void *v47;
  id v48;
  void (*v49)(char *, char *, uint64_t);
  char *v50;
  id v51;
  char v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  id v70[5];
  __int128 v71;
  __int128 v72;
  uint64_t v73;

  v66 = a2;
  v73 = *MEMORY[0x24BDAC8D0];
  v3 = sub_21388C22C();
  v60 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v59 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21388C208();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v57 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v63 = (char *)&v57 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v57 - v15;
  sub_21388C1B4();
  v17 = sub_21388C34C();
  swift_bridgeObjectRelease();
  v64 = v6;
  v57 = v16;
  v61 = v3;
  v62 = v12;
  v58 = a1;
  if (!v17)
  {
    v18 = (char *)v5;
    v68 = 29805;
    v69 = 0xE200000000000000;
    sub_21388C52C();
    v19 = v66;
    if (*(_QWORD *)(v66 + 16) && (v20 = sub_213882E1C((uint64_t)v70), (v21 & 1) != 0))
    {
      sub_213882F10(*(_QWORD *)(v19 + 56) + 32 * v20, (uint64_t)&v71);
    }
    else
    {
      v71 = 0u;
      v72 = 0u;
    }
    sub_213882E58((uint64_t)v70);
    if (*((_QWORD *)&v72 + 1))
    {
      if ((swift_dynamicCast() & 1) != 0 && v68 == 1)
      {
        v68 = 29549;
        v69 = 0xE200000000000000;
        sub_21388C52C();
        v22 = v66;
        if (*(_QWORD *)(v66 + 16))
        {
          v23 = sub_213882E1C((uint64_t)v70);
          if ((v24 & 1) != 0)
          {
            sub_213882F10(*(_QWORD *)(v22 + 56) + 32 * v23, (uint64_t)&v71);
          }
          else
          {
            v71 = 0u;
            v72 = 0u;
          }
        }
        else
        {
          v71 = 0u;
          v72 = 0u;
        }
        sub_213882E58((uint64_t)v70);
        if (*((_QWORD *)&v72 + 1))
        {
          if ((swift_dynamicCast() & 1) != 0 && (v68 & 8) != 0)
          {
            v26 = v9;
            v32 = v5;
            v65 = 7367790;
            goto LABEL_22;
          }
        }
        else
        {
          sub_213882E8C((uint64_t)&v71);
        }
        v68 = 7632997;
        v69 = 0xE300000000000000;
        sub_21388C52C();
        v54 = v66;
        if (*(_QWORD *)(v66 + 16) && (v55 = sub_213882E1C((uint64_t)v70), (v56 & 1) != 0))
        {
          sub_213882F10(*(_QWORD *)(v54 + 56) + 32 * v55, (uint64_t)&v71);
        }
        else
        {
          v71 = 0u;
          v72 = 0u;
        }
        sub_213882E58((uint64_t)v70);
        if (*((_QWORD *)&v72 + 1))
        {
          if ((swift_dynamicCast() & 1) != 0)
          {
            v26 = v9;
            v32 = v5;
            v65 = v68;
            goto LABEL_22;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          sub_213882E8C((uint64_t)&v71);
        }
        sub_213882ECC();
        swift_allocError();
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(a1, v5);
        return v18;
      }
    }
    else
    {
      sub_213882E8C((uint64_t)&v71);
    }
  }
  sub_21388C1CC();
  v25 = sub_21388C1B4();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v16, v5);
  if (sub_21388C34C() < 1)
  {
    v26 = v9;
LABEL_20:
    v32 = v5;
    goto LABEL_21;
  }
  v65 = v25;
  v26 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D074D0);
  v27 = v67;
  sub_21388C1F0();
  v67 = v27;
  if (!v70[0])
    goto LABEL_20;
  v28 = sub_21388C328();
  if (!v29)
    goto LABEL_20;
  v30 = v29;
  if (v28 == sub_21388C1B4() && v30 == v31)
  {
    v32 = v5;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_21:
    swift_bridgeObjectRelease();
    v65 = sub_21388C1B4();
    goto LABEL_22;
  }
  v32 = v5;
  v53 = sub_21388C5B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v53 & 1) != 0)
    goto LABEL_21;
LABEL_22:
  v33 = (void *)objc_opt_self();
  v34 = objc_msgSend(v33, sel_defaultManager);
  v35 = objc_msgSend(v34, sel_temporaryDirectory);

  v36 = v26;
  sub_21388C1FC();

  v70[0] = (id)0x676E696D6F636E69;
  v70[1] = (id)0xE90000000000002DLL;
  v37 = v59;
  sub_21388C220();
  sub_21388C214();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v37, v61);
  sub_21388C358();
  swift_bridgeObjectRelease();
  v38 = v62;
  sub_21388C1D8();
  swift_bridgeObjectRelease();
  v39 = v64;
  v40 = *(void (**)(char *, uint64_t))(v64 + 8);
  v40(v36, v32);
  v41 = v63;
  sub_21388C1E4();
  swift_bridgeObjectRelease();
  v40(v38, v32);
  v42 = v33;
  v43 = v41;
  v44 = objc_msgSend(v42, sel_defaultManager);
  v45 = v58;
  v46 = (void *)sub_21388C1C0();
  v47 = (void *)sub_21388C1C0();
  v70[0] = 0;
  LOBYTE(v36) = objc_msgSend(v44, sel_copyItemAtURL_toURL_error_, v46, v47, v70);

  v18 = (char *)v70[0];
  if ((v36 & 1) != 0)
  {
    v48 = v70[0];
    v40(v45, v32);
    v49 = *(void (**)(char *, char *, uint64_t))(v39 + 32);
    v50 = v57;
    v49(v57, v43, v32);
    type metadata accessor for TemporaryResourceFile();
    v18 = (char *)swift_allocObject();
    v49(&v18[OBJC_IVAR____TtC14NanoPhotosCore21TemporaryResourceFile_url], v50, v32);
    *(_QWORD *)&v18[OBJC_IVAR____TtC14NanoPhotosCore21TemporaryResourceFile_metadata] = v66;
  }
  else
  {
    v51 = v70[0];
    swift_bridgeObjectRelease();
    sub_21388C1A8();

    swift_willThrow();
    v40(v45, v32);
    v40(v43, v32);
  }
  return v18;
}

uint64_t sub_213881FB8@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

char *TemporaryResourceFile.__allocating_init(localResourceURL:metadata:)(char *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  void (*v17)(char *, uint64_t);
  char *v18;
  void (*v19)(char *, uint64_t);
  id v20;
  void *v21;
  void *v22;
  char *v23;
  id v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  id v27;
  uint64_t v28;
  uint64_t v30;
  id v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  id v35[2];

  v34 = a2;
  v32 = a1;
  v35[1] = *(id *)MEMORY[0x24BDAC8D0];
  v33 = sub_21388C22C();
  v2 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21388C208();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v30 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v30 - v13;
  v31 = (id)objc_opt_self();
  v15 = objc_msgSend(v31, sel_defaultManager);
  v16 = objc_msgSend(v15, sel_temporaryDirectory);

  sub_21388C1FC();
  sub_21388C220();
  sub_21388C214();
  v17 = *(void (**)(char *, uint64_t))(v2 + 8);
  v18 = v32;
  v17(v4, v33);
  sub_21388C1D8();
  swift_bridgeObjectRelease();
  v30 = v6;
  v19 = *(void (**)(char *, uint64_t))(v6 + 8);
  v19(v9, v5);
  sub_21388C1B4();
  sub_21388C1E4();
  swift_bridgeObjectRelease();
  v33 = v5;
  v19(v12, v5);
  v20 = objc_msgSend(v31, sel_defaultManager);
  v21 = (void *)sub_21388C1C0();
  v22 = (void *)sub_21388C1C0();
  v35[0] = 0;
  LOBYTE(v16) = objc_msgSend(v20, sel_copyItemAtURL_toURL_error_, v21, v22, v35);

  v23 = (char *)v35[0];
  if ((v16 & 1) != 0)
  {
    v24 = v35[0];
    v25 = v33;
    v19(v18, v33);
    v26 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
    v26(v12, v14, v25);
    type metadata accessor for TemporaryResourceFile();
    v23 = (char *)swift_allocObject();
    v26(&v23[OBJC_IVAR____TtC14NanoPhotosCore21TemporaryResourceFile_url], v12, v25);
    *(_QWORD *)&v23[OBJC_IVAR____TtC14NanoPhotosCore21TemporaryResourceFile_metadata] = v34;
  }
  else
  {
    v27 = v35[0];
    swift_bridgeObjectRelease();
    sub_21388C1A8();

    swift_willThrow();
    v28 = v33;
    v19(v18, v33);
    v19(v14, v28);
  }
  return v23;
}

uint64_t TemporaryResourceFile.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint8_t *, uint64_t);
  NSObject *v11;
  os_log_type_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint8_t *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint8_t *v21;
  void (*v22)(char *, uint64_t);
  id v23;
  uint64_t v24;
  void *v25;
  unsigned int v26;
  id v27;
  id v28;
  void (*v29)(char *, uint8_t *, uint64_t);
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint8_t *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v42[2];
  uint8_t *v43;
  void (*v44)(char *, uint8_t *, uint64_t);
  char *v45;
  uint64_t v46;
  uint64_t v47;
  id v48[2];

  v1 = v0;
  v48[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = sub_21388C250();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v42 - v7;
  v9 = sub_213883458();
  v10 = *(void (**)(char *, uint8_t *, uint64_t))(v3 + 16);
  v43 = (uint8_t *)v9;
  v44 = v10;
  ((void (*)(char *))v10)(v8);
  swift_retain_n();
  v11 = sub_21388C238();
  v12 = sub_21388C46C();
  v13 = &unk_254D08000;
  if (os_log_type_enabled(v11, v12))
  {
    v14 = swift_slowAlloc();
    v46 = v2;
    v15 = (uint8_t *)v14;
    v16 = (void *)swift_slowAlloc();
    v45 = v6;
    v17 = v16;
    v48[0] = v16;
    *(_DWORD *)v15 = 136315138;
    v42[1] = v15 + 4;
    sub_21388C208();
    sub_213882F4C();
    v13 = (_QWORD *)&unk_254D08000;
    v18 = sub_21388C5A4();
    v47 = sub_2138827DC(v18, v19, (uint64_t *)v48);
    sub_21388C4E4();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21387D000, v11, v12, "Removing %s", v15, 0xCu);
    swift_arrayDestroy();
    v20 = v17;
    v6 = v45;
    MEMORY[0x2199B7CF0](v20, -1, -1);
    v21 = v15;
    v1 = v0;
    v2 = v46;
    MEMORY[0x2199B7CF0](v21, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v22 = *(void (**)(char *, uint64_t))(v3 + 8);
  v22(v8, v2);
  v23 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v24 = v1 + v13[66];
  v25 = (void *)sub_21388C1C0();
  v48[0] = 0;
  v26 = objc_msgSend(v23, sel_removeItemAtURL_error_, v25, v48);

  if (v26)
  {
    v27 = v48[0];
  }
  else
  {
    v28 = v48[0];
    v29 = (void (*)(char *, uint8_t *, uint64_t))sub_21388C1A8();

    swift_willThrow();
    v44(v6, v43, v2);
    swift_retain_n();
    v30 = sub_21388C238();
    v31 = sub_21388C460();
    if (os_log_type_enabled(v30, v31))
    {
      v44 = v29;
      v32 = swift_slowAlloc();
      v46 = v2;
      v33 = (uint8_t *)v32;
      v34 = (void *)swift_slowAlloc();
      v45 = v6;
      v35 = v34;
      v48[0] = v34;
      *(_DWORD *)v33 = 136315138;
      v43 = v33 + 4;
      sub_21388C208();
      sub_213882F4C();
      v36 = sub_21388C5A4();
      v47 = sub_2138827DC(v36, v37, (uint64_t *)v48);
      sub_21388C4E4();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21387D000, v30, v31, "Failed to remove %s", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199B7CF0](v35, -1, -1);
      MEMORY[0x2199B7CF0](v33, -1, -1);

      v38 = v45;
      v39 = v46;
    }
    else
    {

      swift_release_n();
      v38 = v6;
      v39 = v2;
    }
    v22(v38, v39);
  }
  v40 = sub_21388C208();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 8))(v24, v40);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t TemporaryResourceFile.__deallocating_deinit()
{
  TemporaryResourceFile.deinit();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TemporaryResourceFile()
{
  uint64_t result;

  result = qword_254D07D10;
  if (!qword_254D07D10)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2138827DC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2138828AC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_213882F10((uint64_t)v12, *a3);
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
      sub_213882F10((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2138828AC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21388C4F0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_213882A64(a5, a6);
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
  v8 = sub_21388C55C();
  if (!v8)
  {
    sub_21388C568();
    __break(1u);
LABEL_17:
    result = sub_21388C58C();
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

uint64_t sub_213882A64(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_213882AF8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_213882CD0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_213882CD0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_213882AF8(uint64_t a1, unint64_t a2)
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
      v3 = sub_213882C6C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_21388C538();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_21388C568();
      __break(1u);
LABEL_10:
      v2 = sub_21388C364();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_21388C58C();
    __break(1u);
LABEL_14:
    result = sub_21388C568();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_213882C6C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D075A0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_213882CD0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D075A0);
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
  result = sub_21388C58C();
  __break(1u);
  return result;
}

unint64_t sub_213882E1C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21388C514();
  return sub_213883178(a1, v2);
}

uint64_t sub_213882E58(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_213882E8C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D074D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_213882ECC()
{
  unint64_t result;

  result = qword_254D074E0;
  if (!qword_254D074E0)
  {
    result = MEMORY[0x2199B7C84](&protocol conformance descriptor for TemporaryResourceFileError, &type metadata for TemporaryResourceFileError);
    atomic_store(result, (unint64_t *)&qword_254D074E0);
  }
  return result;
}

uint64_t sub_213882F10(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_213882F4C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D074E8;
  if (!qword_254D074E8)
  {
    v1 = sub_21388C208();
    result = MEMORY[0x2199B7C84](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_254D074E8);
  }
  return result;
}

unint64_t sub_213882F98()
{
  unint64_t result;

  result = qword_254D074F0;
  if (!qword_254D074F0)
  {
    result = MEMORY[0x2199B7C84](&protocol conformance descriptor for TemporaryResourceFileError, &type metadata for TemporaryResourceFileError);
    atomic_store(result, (unint64_t *)&qword_254D074F0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TemporaryResourceFileError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TemporaryResourceFileError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_213883070 + 4 * byte_21388D380[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_213883090 + 4 * byte_21388D385[v4]))();
}

_BYTE *sub_213883070(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_213883090(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_213883098(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2138830A0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2138830A8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2138830B0(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2138830BC()
{
  return 0;
}

ValueMetadata *type metadata accessor for TemporaryResourceFileError()
{
  return &type metadata for TemporaryResourceFileError;
}

uint64_t sub_2138830D4()
{
  return type metadata accessor for TemporaryResourceFile();
}

uint64_t sub_2138830DC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21388C208();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
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

unint64_t sub_213883178(uint64_t a1, uint64_t a2)
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
      sub_21388323C(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x2199B7678](v9, a1);
      sub_213882E58((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_21388323C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

ValueMetadata *type metadata accessor for TimeoutError()
{
  return &type metadata for TimeoutError;
}

unint64_t NPTOCollectionTarget.description.getter(uint64_t a1)
{
  uint64_t v1;
  unint64_t result;

  v1 = a1 - 1;
  result = 0x6C416465636E7953;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
    case 2:
      result = 0xD000000000000012;
      break;
    case 3:
      result = 0xD000000000000010;
      break;
    case 4:
      result = 0x654D6465636E7953;
      break;
    case 5:
      result = 0xD000000000000014;
      break;
    default:
      result = 0x6E776F6E6B6E55;
      break;
  }
  return result;
}

unint64_t sub_213883364()
{
  uint64_t *v0;

  return NPTOCollectionTarget.description.getter(*v0);
}

void type metadata accessor for NPTOCollectionTarget()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_254D075A8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_254D075A8);
  }
}

uint64_t sub_2138833C0()
{
  uint64_t v0;

  v0 = sub_21388C250();
  __swift_allocate_value_buffer(v0, qword_254D08220);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D08220);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  return sub_21388C244();
}

uint64_t sub_213883458()
{
  uint64_t v0;

  if (qword_254D07E20 != -1)
    swift_once();
  v0 = sub_21388C250();
  return __swift_project_value_buffer(v0, (uint64_t)qword_254D08220);
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

uint64_t sub_2138834F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;

  v7[4] = a6;
  v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  v7[6] = *(_QWORD *)(a7 - 8);
  v7[7] = swift_task_alloc();
  sub_21388C4D8();
  v7[8] = swift_task_alloc();
  v8 = sub_21388C430();
  v7[9] = v8;
  v7[10] = *(_QWORD *)(v8 - 8);
  v7[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2138835A4()
{
  uint64_t v0;
  _QWORD *v1;

  sub_21388C43C();
  sub_21388C418();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v1;
  *v1 = v0;
  v1[1] = sub_21388361C;
  return sub_21388C424();
}

uint64_t sub_21388361C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_213883670()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v5;
  _QWORD *v6;
  uint64_t (*v7)(_QWORD);

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v5 = *(int **)(v0 + 24);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(*(_QWORD *)(v0 + 56), v1, v2);
    v7 = (uint64_t (*)(_QWORD))((char *)v5 + *v5);
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v6;
    *v6 = v0;
    v6[1] = sub_213883760;
    return v7(*(_QWORD *)(v0 + 56));
  }
}

uint64_t sub_213883760()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2138837B4()
{
  _QWORD *v0;
  _QWORD *v1;

  (*(void (**)(_QWORD, _QWORD))(v0[6] + 8))(v0[7], v0[5]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[12] = v1;
  *v1 = v0;
  v1[1] = sub_21388361C;
  return sub_21388C424();
}

uint64_t sub_213883820(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_21388C40C();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_21388C400();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_213883E60(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21388C3C4();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t AsyncStream.Subscription.deinit()
{
  uint64_t v0;

  sub_21388C448();
  swift_release();
  return v0;
}

uint64_t AsyncStream.Subscription.__deallocating_deinit()
{
  sub_21388C448();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t AsyncStream.subscription(handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7 = type metadata accessor for AsyncStream.Subscription(0, *(_QWORD *)(a3 + 16), a3, a4);
  type metadata accessor for AsyncStream.Subscription(0, *(_QWORD *)(v7 + 80), v8, v9);
  v10 = swift_allocObject();
  swift_retain();
  sub_213883B30(v4, a1, a2);
  return v10;
}

uint64_t type metadata accessor for AsyncStream.Subscription(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncStream.Subscription);
}

uint64_t sub_213883A80(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_213883AE4;
  return v6(a1);
}

uint64_t sub_213883AE4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

_QWORD *sub_213883B30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v22 = a3;
  v6 = *(_QWORD *)(*v3 + 80);
  v7 = sub_21388C43C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v21 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D075C0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_21388C40C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  v16 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v17 = (char *)swift_allocObject();
  *((_QWORD *)v17 + 2) = 0;
  *((_QWORD *)v17 + 3) = 0;
  *((_QWORD *)v17 + 4) = v6;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v17[v16], v11, v7);
  v18 = &v17[(v9 + v16 + 7) & 0xFFFFFFFFFFFFFFF8];
  v19 = v22;
  *(_QWORD *)v18 = a2;
  *((_QWORD *)v18 + 1) = v19;
  v3[2] = sub_213883820((uint64_t)v14, (uint64_t)&unk_254D075D0, (uint64_t)v17);
  return v3;
}

uint64_t sub_213883CA4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_213883CE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_21388C43C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_213883D80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(sub_21388C43C() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = v0 + v4;
  v6 = (uint64_t *)(v0 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  v7 = *v6;
  v8 = v6[1];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v9;
  *v9 = v1;
  v9[1] = sub_213883E18;
  return sub_2138834F8((uint64_t)v9, v10, v11, v5, v7, v8, v2);
}

uint64_t sub_213883E18()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_213883E60(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D075C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_213883EA0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_213883EC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_213883E18;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_254D075D8 + dword_254D075D8))(a1, v4);
}

void static PairedDeviceRegistry.isCurrentDeviceTinkerPaired()()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t (*v3)();
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  unint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t (*v15)();
  uint64_t v16;
  id v17[2];
  __int128 v18;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_sharedInstance);
  if (!v1)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    return;
  }
  v2 = v1;
  v3 = (uint64_t (*)())objc_msgSend(v0, sel_activePairedDeviceSelectorBlock);
  if (v3)
  {
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v3;
    v5 = swift_allocObject();
    v3 = sub_2138842C4;
    *(_QWORD *)(v5 + 16) = sub_2138842C4;
    *(_QWORD *)(v5 + 24) = v4;
    v15 = sub_2138842F4;
    v16 = v5;
    *(_QWORD *)&v13 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v13 + 1) = 1107296256;
    *(_QWORD *)&v14 = sub_213884318;
    *((_QWORD *)&v14 + 1) = &block_descriptor_0;
    v6 = _Block_copy(&v13);
    swift_release();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v2, sel_getAllDevicesWithArchivedAltAccountDevicesMatching_, v6);
  sub_21387FF3C((uint64_t)v3);
  _Block_release(v6);

  if (!v7)
    goto LABEL_27;
  sub_213884268(0, &qword_254D075E8);
  v8 = sub_21388C370();

  if (!(v8 >> 62))
  {
    if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_8;
LABEL_21:
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  v12 = sub_21388C580();
  swift_bridgeObjectRelease();
  if (!v12)
    goto LABEL_21;
LABEL_8:
  if ((v8 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v9 = *(id *)(v8 + 32);
      goto LABEL_11;
    }
    __break(1u);
    goto LABEL_26;
  }
  v9 = (id)MEMORY[0x2199B76A8](0, v8);
LABEL_11:
  v10 = v9;
  swift_bridgeObjectRelease();
  if (!v10)
  {
LABEL_22:
    v13 = 0u;
    v14 = 0u;
    goto LABEL_23;
  }
  if (objc_msgSend(v10, sel_valueForProperty_, *MEMORY[0x24BE6B340]))
  {
    sub_21388C4FC();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)v17 = 0u;
    v18 = 0u;
  }
  sub_213884220((uint64_t)v17, (uint64_t)&v13);
  if (!*((_QWORD *)&v14 + 1))
  {

LABEL_23:
    sub_213882E8C((uint64_t)&v13);
    return;
  }
  sub_213884268(0, &qword_254D075F0);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v11 = v17[0];
    objc_msgSend(v17[0], sel_BOOLValue);

  }
  else
  {

  }
}

uint64_t sub_213884220(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D074D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_213884268(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2138842A0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_2138842C4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_2138842E4()
{
  return swift_deallocObject();
}

uint64_t sub_2138842F4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_213884318(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t (*v3)(void *);
  id v4;

  v2 = a2;
  v3 = *(uint64_t (**)(void *))(a1 + 32);
  v4 = a2;
  LOBYTE(v2) = v3(v2);

  return v2 & 1;
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

ValueMetadata *type metadata accessor for PairedDeviceRegistry()
{
  return &type metadata for PairedDeviceRegistry;
}

uint64_t static Task<>.sleep(seconds:)(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 16) = a1;
  return swift_task_switch();
}

void sub_21388439C()
{
  uint64_t v0;
  double v1;
  _QWORD *v2;

  v1 = *(double *)(v0 + 16) * 1000000000.0;
  if ((~*(_QWORD *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v1 <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v1 < 1.84467441e19)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 24) = v2;
    *v2 = v0;
    v2[1] = sub_213884438;
    sub_21388C454();
    return;
  }
LABEL_7:
  __break(1u);
}

uint64_t sub_213884438()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t variable initialization expression of CancellationHandlingContinuation.resumptionHandlers()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D07600);
  sub_21388C628();
  swift_getFunctionTypeMetadata1();
  return sub_21388C2F8();
}

uint64_t variable initialization expression of CancellationHandlingContinuation.result@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D07600);
  v2 = sub_21388C628();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

BOOL CancellationHandlingContinuation.isResumed.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  _BOOL8 v8;
  uint64_t v10;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D07600);
  v2 = sub_21388C628();
  v3 = sub_21388C4D8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - v5;
  v7 = (char *)v0 + *(_QWORD *)(v1 + 104);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(v6, 1, v2) != 1;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

uint64_t CancellationHandlingContinuation.addResumptionHandler(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[11] = a2;
  v3[12] = v2;
  v3[10] = a1;
  v3[13] = *(_QWORD *)(*(_QWORD *)v2 + 80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D07600);
  v4 = sub_21388C628();
  v3[14] = v4;
  v5 = sub_21388C4D8();
  v3[15] = v5;
  v3[16] = *(_QWORD *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = *(_QWORD *)(v4 - 8);
  v3[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2138846F0()
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
  _QWORD *v10;
  int *v12;
  _QWORD *v13;
  uint64_t (*v14)(_QWORD);

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 128);
  v5 = *(_QWORD *)(v0 + 112);
  v6 = *(_QWORD *)(v0 + 96) + *(_QWORD *)(**(_QWORD **)(v0 + 96) + 104);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v6, v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v5) == 1)
  {
    v7 = *(_QWORD *)(v0 + 104);
    v9 = *(_QWORD *)(v0 + 80);
    v8 = *(_QWORD *)(v0 + 88);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 128) + 8))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 120));
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = v7;
    v10[3] = v9;
    v10[4] = v8;
    *(_QWORD *)(v0 + 64) = &unk_254D07618;
    *(_QWORD *)(v0 + 72) = v10;
    swift_beginAccess();
    swift_getFunctionTypeMetadata1();
    sub_21388C3B8();
    swift_retain();
    sub_21388C394();
    swift_endAccess();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v12 = *(int **)(v0 + 80);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 144) + 32))(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 112));
    v14 = (uint64_t (*)(_QWORD))((char *)v12 + *v12);
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v13;
    *v13 = v0;
    v13[1] = sub_2138848BC;
    return v14(*(_QWORD *)(v0 + 152));
  }
}

uint64_t sub_2138848BC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_213884914()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 144) + 8))(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 112));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213884960(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v5;
  *v5 = v3;
  v5[1] = sub_213886FEC;
  return v7(a2);
}

uint64_t sub_2138849C0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2138849E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 + 24);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_213886FEC;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_254D07610 + dword_254D07610))(a1, a2, v6);
}

uint64_t CancellationHandlingContinuation.resume(returning:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *(_QWORD *)(*(_QWORD *)v1 + 80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D07600);
  v3 = sub_21388C628();
  v2[5] = v3;
  v2[6] = *(_QWORD *)(v3 - 8);
  v2[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213884AF4()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(_QWORD);

  v1 = v0[3];
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0[4] - 8) + 16))(v0[7], v0[2]);
  swift_storeEnumTagMultiPayload();
  v4 = (uint64_t (*)(_QWORD))(**(int **)(*(_QWORD *)v1 + 192) + *(_QWORD *)(*(_QWORD *)v1 + 192));
  v2 = (_QWORD *)swift_task_alloc();
  v0[8] = v2;
  *v2 = v0;
  v2[1] = sub_213884B8C;
  return v4(v0[7]);
}

uint64_t sub_213884B8C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v1 = *(_QWORD *)(*v0 + 56);
  v2 = *(_QWORD *)(*v0 + 40);
  v3 = *(_QWORD *)(*v0 + 48);
  v5 = *v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t CancellationHandlingContinuation.resume(throwing:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D07600);
  v3 = sub_21388C628();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213884C7C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  int *v3;
  id v4;
  _QWORD *v5;
  uint64_t (*v7)(_QWORD);

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(void **)(v0 + 16);
  **(_QWORD **)(v0 + 48) = v2;
  swift_storeEnumTagMultiPayload();
  v3 = *(int **)(*(_QWORD *)v1 + 192);
  v4 = v2;
  v7 = (uint64_t (*)(_QWORD))((char *)v3 + *v3);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v5;
  *v5 = v0;
  v5[1] = sub_213884D04;
  return v7(*(_QWORD *)(v0 + 48));
}

uint64_t sub_213884D04()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v1 = *(_QWORD *)(*v0 + 48);
  v2 = *(_QWORD *)(*v0 + 32);
  v3 = *(_QWORD *)(*v0 + 40);
  v5 = *v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t CancellationHandlingContinuation.resume(with:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[14] = a1;
  v2[15] = v1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D07600);
  v2[16] = sub_21388C628();
  v3 = sub_21388C4D8();
  v2[17] = v3;
  v2[18] = *(_QWORD *)(v3 - 8);
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213884E20()
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
  uint64_t FunctionTypeMetadata1;
  uint64_t v14;
  char v15;
  uint64_t v16;
  int *v17;
  _QWORD *v18;
  uint64_t result;
  uint64_t (*v20)(void);

  v1 = *(_QWORD *)(v0 + 168);
  v2 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 144);
  v4 = *(_QWORD *)(v0 + 128);
  v5 = *(_QWORD *)(v0 + 120) + *(_QWORD *)(**(_QWORD **)(v0 + 120) + 104);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  v6 = *(_QWORD *)(v4 - 8);
  LODWORD(v4) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v1, 1, v4);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  if ((_DWORD)v4 != 1)
    goto LABEL_6;
  v8 = *(_QWORD *)(v0 + 152);
  v7 = *(_QWORD *)(v0 + 160);
  v9 = *(_QWORD *)(v0 + 136);
  v10 = *(_QWORD *)(v0 + 144);
  v12 = *(_QWORD *)(v0 + 120);
  v11 = *(_QWORD *)(v0 + 128);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 16))(v7, *(_QWORD *)(v0 + 112), v11);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v6 + 56))(v7, 0, 1, v11);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v8, v7, v9);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 40))(v5, v8, v9);
  swift_endAccess();
  swift_beginAccess();
  *(_QWORD *)(v0 + 176) = *(_QWORD *)(v12 + 112);
  FunctionTypeMetadata1 = swift_getFunctionTypeMetadata1();
  *(_QWORD *)(v0 + 184) = FunctionTypeMetadata1;
  v14 = swift_bridgeObjectRetain();
  if (!MEMORY[0x2199B74F8](v14, FunctionTypeMetadata1))
  {
    swift_bridgeObjectRelease();
    swift_beginAccess();
    sub_21388C3B8();
    sub_21388C3AC();
    swift_endAccess();
LABEL_6:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v15 = sub_21388C388();
  sub_21388C37C();
  if ((v15 & 1) != 0)
  {
    v16 = *(_QWORD *)(v0 + 176);
    v17 = *(int **)(v16 + 32);
    *(_QWORD *)(v0 + 192) = *(_QWORD *)(v16 + 40);
    *(_QWORD *)(v0 + 200) = 1;
    v20 = (uint64_t (*)(void))((char *)v17 + *v17);
    swift_retain();
    v18 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 208) = v18;
    *v18 = v0;
    v18[1] = sub_2138850CC;
    return v20();
  }
  else
  {
    result = sub_21388C544();
    __break(1u);
  }
  return result;
}

uint64_t sub_2138850CC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_213885124()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char v6;
  uint64_t v7;
  int *v8;
  BOOL v9;
  uint64_t v10;
  char v11;
  _QWORD *v12;
  uint64_t (*v13)(void);

  v1 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 184);
  swift_release();
  if (v1 == MEMORY[0x2199B74F8](v2, v3))
  {
    swift_bridgeObjectRelease();
    swift_beginAccess();
    sub_21388C3B8();
    sub_21388C3AC();
    swift_endAccess();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v5 = *(_QWORD *)(v0 + 200);
  v6 = sub_21388C388();
  sub_21388C37C();
  if ((v6 & 1) != 0)
  {
    v7 = *(_QWORD *)(v0 + 176) + 16 * v5;
    v8 = *(int **)(v7 + 32);
    *(_QWORD *)(v0 + 192) = *(_QWORD *)(v7 + 40);
    v9 = __OFADD__(v5, 1);
    v10 = v5 + 1;
    v11 = v9;
    result = swift_retain();
    if ((v11 & 1) == 0)
    {
      *(_QWORD *)(v0 + 200) = v10;
      v13 = (uint64_t (*)(void))((char *)v8 + *v8);
      v12 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 208) = v12;
      *v12 = v0;
      v12[1] = sub_2138850CC;
      return v13();
    }
  }
  else
  {
    result = sub_21388C544();
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t CancellationHandlingContinuation.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 104);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D07600);
  sub_21388C628();
  v2 = sub_21388C4D8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t CancellationHandlingContinuation.__deallocating_deinit()
{
  CancellationHandlingContinuation.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t sub_21388533C()
{
  uint64_t v0;

  v0 = swift_allocObject();
  sub_213885370();
  return v0;
}

_QWORD *sub_213885370()
{
  _QWORD *v0;
  char *v1;
  uint64_t v2;

  swift_defaultActor_initialize();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D07600);
  sub_21388C628();
  swift_getFunctionTypeMetadata1();
  v0[14] = sub_21388C2F8();
  v1 = (char *)v0 + *(_QWORD *)(*v0 + 104);
  v2 = swift_checkMetadataState();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  return v0;
}

uint64_t CancellationHandlingContinuation.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_213885430()
{
  return CancellationHandlingContinuation.unownedExecutor.getter();
}

uint64_t CancellationHandlingContinuation<>.resume()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(uint64_t);

  *(_QWORD *)(v1 + 16) = 0;
  *(_BYTE *)(v1 + 24) = 0;
  v4 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v0 + 192) + *(_QWORD *)(*(_QWORD *)v0 + 192));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 32) = v2;
  *v2 = v1;
  v2[1] = sub_2138854B4;
  return v4(v1 + 16);
}

uint64_t sub_2138854B4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t withCancellationHandlingContinuation<A>(timeout:_:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  *(_QWORD *)(v6 + 40) = a5;
  *(_QWORD *)(v6 + 48) = a6;
  *(_QWORD *)(v6 + 24) = a2;
  *(_QWORD *)(v6 + 32) = a4;
  *(_BYTE *)(v6 + 120) = a3;
  *(_QWORD *)(v6 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D075C0);
  *(_QWORD *)(v6 + 56) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213885564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t (*v19)(void *, uint64_t);
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v5 = *(_BYTE *)(v4 + 120);
  type metadata accessor for CancellationHandlingContinuation(0, *(_QWORD *)(v4 + 48), a3, a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v4 + 64) = v6;
  sub_213885370();
  if ((v5 & 1) != 0)
  {
    v16 = *(_QWORD *)(v4 + 64);
    v17 = swift_task_alloc();
    *(_QWORD *)(v4 + 96) = v17;
    *(_OWORD *)(v17 + 16) = *(_OWORD *)(v4 + 32);
    *(_QWORD *)(v17 + 32) = v16;
    v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_254D07658
                                                                                       + dword_254D07658);
    v18 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v4 + 104) = v18;
    *v18 = v4;
    v18[1] = sub_213885838;
    return v20(*(_QWORD *)(v4 + 16), (uint64_t)sub_2138869B8, *(_QWORD *)(v4 + 64), (uint64_t)&unk_254D07650, v17, *(_QWORD *)(v4 + 48));
  }
  else
  {
    v8 = *(_QWORD *)(v4 + 48);
    v7 = *(_QWORD *)(v4 + 56);
    v9 = *(_QWORD *)(v4 + 24);
    v10 = sub_21388C40C();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
    v11 = (_QWORD *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v9;
    v11[5] = v6;
    swift_retain();
    v12 = sub_213885ACC(v7, (uint64_t)&unk_254D07668, (uint64_t)v11);
    *(_QWORD *)(v4 + 72) = v12;
    v13 = swift_allocObject();
    *(_QWORD *)(v4 + 80) = v13;
    *(_QWORD *)(v13 + 16) = v8;
    *(_QWORD *)(v13 + 24) = v12;
    v19 = (uint64_t (*)(void *, uint64_t))(**(int **)(*(_QWORD *)v6 + 168)
                                                  + *(_QWORD *)(*(_QWORD *)v6 + 168));
    swift_retain();
    v14 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v4 + 88) = v14;
    *v14 = v4;
    v14[1] = sub_213885734;
    return v19(&unk_254D07678, v13);
  }
}

uint64_t sub_213885734()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_213885790()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  char *v5;

  swift_release();
  v1 = *(_QWORD *)(v0 + 64);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v2;
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v2 + 32) = v1;
  v5 = (char *)&dword_254D07658 + dword_254D07658;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v3;
  *v3 = v0;
  v3[1] = sub_213885838;
  return ((uint64_t (*)(_QWORD, uint64_t (*)(), _QWORD, void *, uint64_t, _QWORD))v5)(*(_QWORD *)(v0 + 16), sub_2138869B8, *(_QWORD *)(v0 + 64), &unk_254D07650, v2, *(_QWORD *)(v0 + 48));
}

uint64_t sub_213885838()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2138858A4()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2138858E0()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213885928(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v7;

  *(_QWORD *)(v5 + 16) = a5;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 24) = v7;
  *v7 = v5;
  v7[1] = sub_21388597C;
  return static Task<>.sleep(seconds:)(a1);
}

uint64_t sub_21388597C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_2138859E8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v1 = v0[2];
  nullsub_1();
  sub_213886C20();
  v2 = swift_allocError();
  v0[4] = v2;
  v5 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 184) + *(_QWORD *)(*(_QWORD *)v1 + 184));
  v3 = (_QWORD *)swift_task_alloc();
  v0[5] = v3;
  *v3 = v0;
  v3[1] = sub_213885A78;
  return v5(v2);
}

uint64_t sub_213885A78()
{
  uint64_t *v0;
  void *v1;
  uint64_t v3;

  v1 = *(void **)(*v0 + 32);
  v3 = *v0;
  swift_task_dealloc();

  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_213885ACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_21388C40C();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_21388C400();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_213883E60(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21388C3C4();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_213885BF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a2;
  return swift_task_switch();
}

uint64_t sub_213885C10()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254D07600);
  sub_21388C448();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213885C68(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D075C0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21388C40C();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_213883E60((uint64_t)v4);
    v9 = 0;
    v10 = 0;
  }
  else
  {
    sub_21388C400();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v9 = sub_21388C3C4();
      v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
  }
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = &unk_254D076C0;
  *(_QWORD *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_213885E34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a4;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D07600);
  v5 = sub_21388C628();
  v4[3] = v5;
  v4[4] = *(_QWORD *)(v5 - 8);
  v4[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213885EB8()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD);

  v1 = (uint64_t *)v0[5];
  v2 = v0[2];
  sub_21388C3F4();
  sub_213886FA4();
  v3 = swift_allocError();
  sub_21388C304();
  *v1 = v3;
  swift_storeEnumTagMultiPayload();
  v6 = (uint64_t (*)(_QWORD))(**(int **)(*(_QWORD *)v2 + 192) + *(_QWORD *)(*(_QWORD *)v2 + 192));
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_213885F74;
  return v6(v0[5]);
}

uint64_t sub_213885F74()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v1 = *(_QWORD *)(*v0 + 40);
  v2 = *(_QWORD *)(*v0 + 24);
  v3 = *(_QWORD *)(*v0 + 32);
  v5 = *v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_213885FE0(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = *a4;
  return swift_task_switch();
}

uint64_t sub_213886004()
{
  uint64_t v0;
  _QWORD *v1;

  (*(void (**)(_QWORD))(v0 + 24))(*(_QWORD *)(v0 + 40));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  *v1 = v0;
  v1[1] = sub_213886090;
  return sub_21388C5C8();
}

uint64_t sub_213886090()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2138860FC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213886108(uint64_t a1, uint64_t a2)
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
  unint64_t v13;
  char *v14;
  uint64_t v16;

  v4 = *(_QWORD *)(*(_QWORD *)a2 + 80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D07600);
  v5 = sub_21388C3E8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D075C0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21388C40C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  v13 = (*(unsigned __int8 *)(v6 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v14 = (char *)swift_allocObject();
  *((_QWORD *)v14 + 2) = 0;
  *((_QWORD *)v14 + 3) = 0;
  *((_QWORD *)v14 + 4) = v4;
  *((_QWORD *)v14 + 5) = a2;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v14[v13], v8, v5);
  swift_retain();
  sub_213883820((uint64_t)v11, (uint64_t)&unk_254D076A0, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_213886278(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[2] = a4;
  v5[3] = a5;
  v5[4] = *(_QWORD *)(*(_QWORD *)a4 + 80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D07600);
  v6 = sub_21388C3E8();
  v5[5] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[6] = v7;
  v5[7] = *(_QWORD *)(v7 + 64);
  v5[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213886304()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(void *, uint64_t);

  v1 = v0[8];
  v2 = v0[5];
  v3 = v0[6];
  v4 = v0[4];
  v5 = v0[2];
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v1, v0[3], v2);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  v0[9] = v7;
  *(_QWORD *)(v7 + 16) = v4;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  v10 = (uint64_t (*)(void *, uint64_t))(**(int **)(*(_QWORD *)v5 + 168) + *(_QWORD *)(*(_QWORD *)v5 + 168));
  v8 = (_QWORD *)swift_task_alloc();
  v0[10] = v8;
  *v8 = v0;
  v8[1] = sub_2138863E8;
  return v10(&unk_254D076B0, v7);
}

uint64_t sub_2138863E8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_213886444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_213886460()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D07600);
  v2 = sub_21388C3E8();
  sub_2138864C8(v1, v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2138864C8(uint64_t a1, uint64_t a2)
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
  v13 = sub_21388C628();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v18 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)&v18 - v14, a1, v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
    return sub_21388C3D0();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v15, v3);
    return sub_21388C3DC();
  }
}

uint64_t sub_213886628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;
  char *v15;

  v15 = (char *)&dword_254D07688 + dword_254D07688;
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_213883E18;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))v15)(a1, a4, a5, a2, a3, 0, 0, a6);
}

uint64_t sub_2138866D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v17;
  _QWORD *v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  if (__isPlatformVersionAtLeast(2, 18, 0, 0))
  {
    v17 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v8 + 24) = v17;
    *v17 = v8;
    v17[1] = sub_213884438;
    return sub_21388C5BC();
  }
  else
  {
    v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_254D07690 + dword_254D07690);
    v19 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v8 + 16) = v19;
    *v19 = v8;
    v19[1] = sub_213883E18;
    return v20(a1, a2, a3, a4, a5, a6, a7, a8);
  }
}

uint64_t sub_213886808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6[5] = a4;
  v6[6] = a5;
  v6[3] = a2;
  v6[4] = a3;
  v6[2] = a1;
  if (a6)
  {
    swift_getObjectType();
    v7 = sub_21388C3C4();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v6[7] = v7;
  v6[8] = v9;
  return swift_task_switch();
}

uint64_t sub_213886878()
{
  _QWORD *v0;
  int *v1;
  _QWORD *v2;
  uint64_t (*v4)(_QWORD);

  v1 = (int *)v0[3];
  v0[9] = swift_task_addCancellationHandler();
  v4 = (uint64_t (*)(_QWORD))((char *)v1 + *v1);
  v2 = (_QWORD *)swift_task_alloc();
  v0[10] = v2;
  *v2 = v0;
  v2[1] = sub_2138868E4;
  return v4(v0[2]);
}

uint64_t sub_2138868E4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_213886944()
{
  uint64_t v0;

  swift_task_removeCancellationHandler();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213886978()
{
  uint64_t v0;

  swift_task_removeCancellationHandler();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for CancellationHandlingContinuation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CancellationHandlingContinuation);
}

uint64_t sub_2138869B8()
{
  uint64_t v0;

  return sub_213885C68(v0);
}

uint64_t sub_2138869C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  __int128 v6;

  v4 = *(_QWORD **)(v1 + 32);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = sub_213883E18;
  *(_QWORD *)(v5 + 40) = v4;
  *(_OWORD *)(v5 + 24) = v6;
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 48) = *v4;
  return swift_task_switch();
}

uint64_t sub_213886A40()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_213886A6C()
{
  uint64_t v0;
  uint64_t v1;
  double v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = *(double *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_213886FEC;
  v4[2] = v3;
  v5 = (_QWORD *)swift_task_alloc();
  v4[3] = v5;
  *v5 = v4;
  v5[1] = sub_21388597C;
  return static Task<>.sleep(seconds:)(v2);
}

uint64_t sub_213886AEC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_213886B10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 24);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_213886FEC;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_213886B70()
{
  uint64_t result;
  unint64_t v1;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D07600);
  sub_21388C628();
  result = sub_21388C4D8();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

unint64_t sub_213886C20()
{
  unint64_t result;

  result = qword_254D07680;
  if (!qword_254D07680)
  {
    result = MEMORY[0x2199B7C84](&protocol conformance descriptor for TimeoutError, &type metadata for TimeoutError);
    atomic_store(result, (unint64_t *)&qword_254D07680);
  }
  return result;
}

uint64_t sub_213886C64(uint64_t a1)
{
  uint64_t v1;

  return sub_213886108(a1, v1);
}

uint64_t sub_213886C6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D07600);
  v1 = sub_21388C3E8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_213886D08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D07600);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(sub_21388C3E8() - 8) + 80);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = v0 + ((v2 + 48) & ~v2);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_213883E18;
  return sub_213886278((uint64_t)v5, v6, v7, v3, v4);
}

uint64_t sub_213886D94()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D07600);
  v1 = sub_21388C3E8();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_213886E14(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = *(_QWORD *)(v1 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D07600);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(sub_21388C3E8() - 8) + 80);
  v6 = v1 + ((v5 + 24) & ~v5);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_213886FEC;
  v7[3] = v6;
  v7[4] = v4;
  v7[2] = a1;
  return swift_task_switch();
}

uint64_t sub_213886EBC()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_213886EE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_213886FEC;
  return sub_213885E34((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_213886F34(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_213886FEC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_254D075D8 + dword_254D075D8))(a1, v4);
}

unint64_t sub_213886FA4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D076D0;
  if (!qword_254D076D0)
  {
    v1 = sub_21388C3F4();
    result = MEMORY[0x2199B7C84](MEMORY[0x24BEE6848], v1);
    atomic_store(result, (unint64_t *)&qword_254D076D0);
  }
  return result;
}

id variable initialization expression of Cache.cache()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D076D8);
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

uint64_t type metadata accessor for Cache.WrappedKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Cache.WrappedKey);
}

uint64_t type metadata accessor for Cache.WrappedValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Cache.WrappedValue);
}

char *Cache.__allocating_init(capacity:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return Cache.init(capacity:)(a1);
}

char *Cache.init(capacity:)(uint64_t a1)
{
  char *v1;
  objc_class *ObjectType;
  uint64_t v4;
  objc_class *ObjCClassFromMetadata;
  char *v6;
  char *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = qword_254D076E0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D076D8);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  v6 = v1;
  *(_QWORD *)&v1[v4] = objc_msgSend(objc_allocWithZone(ObjCClassFromMetadata), sel_init);

  v9.receiver = v6;
  v9.super_class = ObjectType;
  v7 = (char *)objc_msgSendSuper2(&v9, sel_init);
  objc_msgSend(*(id *)&v7[qword_254D076E0], sel_setCountLimit_, a1);
  return v7;
}

uint64_t Cache.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  void *v5;
  uint64_t v6;
  id v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(void **)((char *)v2 + qword_254D076E0);
  v6 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x58);
  type metadata accessor for Cache.WrappedKey(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x50), v6, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x60));
  v7 = sub_2138879DC(a1);
  v8 = (char *)objc_msgSend(v5, sel_objectForKey_, v7);

  v9 = *(_QWORD *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 16))(a2, &v8[*(_QWORD *)(*(_QWORD *)v8 + 104)], v6);
    swift_release();
    v10 = 0;
  }
  else
  {
    v10 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a2, v10, 1, v6);
}

uint64_t Cache.subscript.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
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
  uint64_t v15;
  char *v16;
  void (*v17)(char *, uint64_t, uint64_t);
  void (*v18)(char *, uint64_t);
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;

  v31 = a2;
  v4 = (_QWORD *)(*MEMORY[0x24BEE4EA0] & *v2);
  v5 = v4[11];
  v6 = sub_21388C4D8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v29 - v9;
  v11 = *(_QWORD *)(v5 - 8);
  v12 = MEMORY[0x24BDAC7A8](v8);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v29 - v15;
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v32 = a1;
  v17(v10, a1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, v5) == 1)
  {
    v18 = *(void (**)(char *, uint64_t))(v7 + 8);
    v18(v10, v6);
    v19 = *(void **)((char *)v2 + qword_254D076E0);
    v20 = v4[10];
    type metadata accessor for Cache.WrappedKey(0, v20, v5, v4[12]);
    v21 = v31;
    v22 = sub_2138879DC(v31);
    objc_msgSend(v19, sel_removeObjectForKey_, v22);

    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v21, v20);
    return ((uint64_t (*)(uint64_t, uint64_t))v18)(v32, v6);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v10, v5);
    v30 = *(id *)((char *)v2 + qword_254D076E0);
    v24 = v4[10];
    v25 = v4[12];
    type metadata accessor for Cache.WrappedValue(0, v24, v5, v25);
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v5);
    v26 = swift_allocObject();
    (*(void (**)(uint64_t, char *))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v26 + 88) - 8) + 32))(v26 + *(_QWORD *)(*(_QWORD *)v26 + 104), v14);
    type metadata accessor for Cache.WrappedKey(0, v24, v5, v25);
    v27 = v31;
    v28 = sub_2138879DC(v31);
    objc_msgSend(v30, sel_setObject_forKey_, v26, v28);
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(v27, v24);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v32, v6);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, v5);
  }
}

uint64_t sub_2138874A8(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 88) - 8) + 32))(v2 + *(_QWORD *)(*(_QWORD *)v2 + 104), a1);
  return v2;
}

void (*Cache.subscript.modify(_QWORD *a1, uint64_t a2))(uint64_t a1, char a2)
{
  _QWORD *v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;

  v5 = malloc(0x48uLL);
  *a1 = v5;
  *v5 = v2;
  v6 = *MEMORY[0x24BEE4EA0] & *v2;
  v7 = sub_21388C4D8();
  v5[1] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v5[2] = v8;
  v9 = *(_QWORD *)(v8 + 64);
  v5[3] = malloc(v9);
  v10 = malloc(v9);
  v5[4] = v10;
  v11 = *(_QWORD *)(v6 + 80);
  v5[5] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v5[6] = v12;
  v13 = *(_QWORD *)(v12 + 64);
  v5[7] = malloc(v13);
  v5[8] = malloc(v13);
  (*(void (**)(void))(v12 + 16))();
  Cache.subscript.getter(a2, (uint64_t)v10);
  return sub_2138875E8;
}

void sub_2138875E8(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD **)a1;
  v3 = *(void **)(*(_QWORD *)a1 + 56);
  v4 = *(void **)(*(_QWORD *)a1 + 64);
  if ((a2 & 1) != 0)
  {
    v5 = v2[5];
    v6 = v2[6];
    v8 = (void *)v2[3];
    v7 = (void *)v2[4];
    v9 = v2[1];
    v10 = v2[2];
    (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v8, v7, v9);
    (*(void (**)(void *, void *, uint64_t))(v6 + 32))(v3, v4, v5);
    Cache.subscript.setter((uint64_t)v8, (uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
  }
  else
  {
    v8 = (void *)v2[3];
    v7 = (void *)v2[4];
    Cache.subscript.setter((uint64_t)v7, (uint64_t)v4);
  }
  free(v4);
  free(v3);
  free(v7);
  free(v8);
  free(v2);
}

id Cache.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void Cache.init()()
{
  sub_213887A60();
}

void sub_2138876FC()
{
  sub_213887A60();
}

void sub_213887720(uint64_t a1)
{

}

uint64_t sub_213887730@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  swift_getObjectType();
  result = sub_21388C25C();
  *a1 = result;
  return result;
}

uint64_t sub_21388776C(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  v2 = sub_21388779C();

  return v2;
}

uint64_t sub_21388779C()
{
  return sub_21388C310();
}

uint64_t sub_2138877D8(uint64_t a1)
{
  char v2;
  void *v4;
  _BYTE v5[24];
  uint64_t v6;

  swift_getObjectType();
  sub_213887BE8(a1, (uint64_t)v5);
  if (!v6)
  {
    sub_213882E8C((uint64_t)v5);
    goto LABEL_5;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    v2 = 0;
    return v2 & 1;
  }
  v2 = sub_21388C31C();

  return v2 & 1;
}

uint64_t sub_2138878BC(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  id v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = a1;
    swift_unknownObjectRetain();
    sub_21388C4FC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = a1;
  }
  v6 = sub_2138877D8((uint64_t)v8);

  sub_213882E8C((uint64_t)v8);
  return v6 & 1;
}

void sub_213887930()
{
  sub_213887BBC();
}

id _s14NanoPhotosCore5CacheCfD_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_213887974(char *a1)
{
  return (*(uint64_t (**)(char *))(*(_QWORD *)(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x68)]);
}

uint64_t sub_2138879A0()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 88) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 104));
  return swift_deallocClassInstance();
}

id sub_2138879DC(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  objc_class *ObjectType;
  objc_super v6;

  v3 = (char *)objc_allocWithZone(v1);
  ObjectType = (objc_class *)swift_getObjectType();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v3) + 0x50)
                                                      - 8)
                                          + 16))(&v3[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v3) + 0x68)], a1);
  v6.receiver = v3;
  v6.super_class = ObjectType;
  return objc_msgSendSuper2(&v6, sel_init);
}

void sub_213887A60()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_213887A8C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Cache(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Cache);
}

uint64_t sub_213887ADC()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_213887B4C()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_213887BBC()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_213887BE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D074D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  BOOL v8;

  if (qword_254D081C8 == -1)
  {
    if (qword_254D081D0)
      return _availability_version_check();
  }
  else
  {
    dispatch_once_f(&qword_254D081C8, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_254D081D0)
      return _availability_version_check();
  }
  if (qword_254D081C0 == -1)
  {
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_254D081C0, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  if (v8)
    return 0;
  if (dword_254D081B4 > a3)
    return 1;
  return dword_254D081B4 >= a3 && dword_254D081B8 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t (*v1)(void);
  BOOL v2;
  unsigned __int8 *v4;
  uint64_t (*v5)(_QWORD);
  unint64_t v6;
  uint64_t (*v7)(_QWORD, uint64_t, _QWORD, _QWORD);
  uint64_t (*v8)(_QWORD, const char *, uint64_t, unsigned __int8 *);
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t (*v10)(uint64_t);
  uint64_t (*v11)(void);
  FILE *v12;
  FILE *v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  FILE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  FILE *v27;
  unsigned int (*v28)(uint64_t, char *, uint64_t, uint64_t);
  char v29[32];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v1 = (uint64_t (*)(void))qword_254D081D0;
  if (qword_254D081D0)
    v2 = (_DWORD)result == 0;
  else
    v2 = 0;
  if (!v2)
  {
    if (MEMORY[0x24BDAC970])
    {
      qword_254D081D0 = (uint64_t)MEMORY[0x24BDAC970];
      v1 = MEMORY[0x24BDAC970];
    }
    if (!v1 || (_DWORD)result != 0)
    {
      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        v4 = *(unsigned __int8 **)result;
        result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          v5 = (uint64_t (*)(_QWORD))result;
          v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            v7 = (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))result;
            result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              v8 = (uint64_t (*)(_QWORD, const char *, uint64_t, unsigned __int8 *))result;
              result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  v10 = (uint64_t (*)(uint64_t))result;
                  result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    v11 = (uint64_t (*)(void))result;
                    result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        v12 = (FILE *)result;
                        result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          v13 = (FILE *)result;
                          v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          v14 = MEMORY[0x2199B7870](v13);
                          if (v14 < 0)
                          {
                            v16 = 0;
                          }
                          else
                          {
                            v15 = v14;
                            rewind(v13);
                            v16 = malloc(v15);
                            if (v16)
                            {
                              v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                v17 = v5(0);
                                if (v17)
                                {
                                  v18 = v17;
                                  v19 = v13;
                                  if (v6)
                                    v20 = ((uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))v6)(0, v17, 0, 0, 0);
                                  else
                                    v20 = v7(0, v17, 0, 0);
                                  v21 = v20;
                                  if (v20)
                                  {
                                    v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      v23 = v22;
                                      v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984))
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_254D081B4, &dword_254D081B8);
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  v19 = v13;
                                }
                                v16 = v26;
                              }
                              else
                              {
                                v16 = v26;
                                v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_21388A6E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21388A7EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21388A8F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21388BC28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id nanophotos_log_NanoPhotosCore()
{
  if (nanophotos_log_NanoPhotosCore_onceToken != -1)
    dispatch_once(&nanophotos_log_NanoPhotosCore_onceToken, &__block_literal_global);
  return (id)nanophotos_log_NanoPhotosCore_log;
}

id nanophotos_log_NanoPhotosUI()
{
  if (qword_254D081E0 != -1)
    dispatch_once(&qword_254D081E0, &__block_literal_global_3);
  return (id)_MergedGlobals_0;
}

id nanophotos_log_sync()
{
  if (nanophotos_log_sync_onceToken != -1)
    dispatch_once(&nanophotos_log_sync_onceToken, &__block_literal_global_5);
  return (id)nanophotos_log_sync_log;
}

void __nanophotos_log_sync_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.NanoPhotos", "sync");
  v1 = (void *)nanophotos_log_sync_log;
  nanophotos_log_sync_log = (uint64_t)v0;

}

id nanophotos_log_sync_oversize()
{
  if (nanophotos_log_sync_oversize_onceToken != -1)
    dispatch_once(&nanophotos_log_sync_oversize_onceToken, &__block_literal_global_7);
  return (id)nanophotos_log_sync_oversize_log;
}

void __nanophotos_log_sync_oversize_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.NanoPhotos", "sync_oversize");
  v1 = (void *)nanophotos_log_sync_oversize_log;
  nanophotos_log_sync_oversize_log = (uint64_t)v0;

}

id nanophotos_log_bridge()
{
  if (qword_254D081F0 != -1)
    dispatch_once(&qword_254D081F0, &__block_literal_global_9);
  return (id)qword_254D081E8;
}

void __nanophotos_log_bridge_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.NanoPhotos", "bridge");
  v1 = (void *)qword_254D081E8;
  qword_254D081E8 = (uint64_t)v0;

}

id nanophotos_log_Settings()
{
  if (qword_254D08200 != -1)
    dispatch_once(&qword_254D08200, &__block_literal_global_11);
  return (id)qword_254D081F8;
}

uint64_t sub_21388C1A8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21388C1B4()
{
  return MEMORY[0x24BDCD810]();
}

uint64_t sub_21388C1C0()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_21388C1CC()
{
  return MEMORY[0x24BDCD908]();
}

uint64_t sub_21388C1D8()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_21388C1E4()
{
  return MEMORY[0x24BDCD938]();
}

uint64_t sub_21388C1F0()
{
  return MEMORY[0x24BDCD9A0]();
}

uint64_t sub_21388C1FC()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_21388C208()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_21388C214()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_21388C220()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_21388C22C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_21388C238()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21388C244()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21388C250()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21388C25C()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_21388C268()
{
  return MEMORY[0x24BDB9C78]();
}

uint64_t sub_21388C274()
{
  return MEMORY[0x24BDB9C88]();
}

uint64_t sub_21388C280()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_21388C28C()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_21388C298()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_21388C2A4()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_21388C2B0()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_21388C2BC()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_21388C2C8()
{
  return MEMORY[0x24BEE5450]();
}

uint64_t sub_21388C2D4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21388C2E0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21388C2EC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21388C2F8()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_21388C304()
{
  return MEMORY[0x24BEE67F8]();
}

uint64_t sub_21388C310()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_21388C31C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21388C328()
{
  return MEMORY[0x24BDCF880]();
}

uint64_t sub_21388C334()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21388C340()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21388C34C()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_21388C358()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21388C364()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21388C370()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21388C37C()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_21388C388()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_21388C394()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_21388C3A0()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_21388C3AC()
{
  return MEMORY[0x24BEE1240]();
}

uint64_t sub_21388C3B8()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_21388C3C4()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21388C3D0()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_21388C3DC()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_21388C3E8()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_21388C3F4()
{
  return MEMORY[0x24BEE6838]();
}

uint64_t sub_21388C400()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21388C40C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21388C418()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_21388C424()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_21388C430()
{
  return MEMORY[0x24BEE6A78]();
}

uint64_t sub_21388C43C()
{
  return MEMORY[0x24BEE6A98]();
}

uint64_t sub_21388C448()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_21388C454()
{
  return MEMORY[0x24BEE6B28]();
}

uint64_t sub_21388C460()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21388C46C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21388C478()
{
  return MEMORY[0x24BEE5678]();
}

uint64_t sub_21388C484()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_21388C490()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_21388C49C()
{
  return MEMORY[0x24BEE5778]();
}

uint64_t sub_21388C4A8()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_21388C4B4()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21388C4C0()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_21388C4CC()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_21388C4D8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21388C4E4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21388C4F0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21388C4FC()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21388C508()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21388C514()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_21388C520()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_21388C52C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_21388C538()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21388C544()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_21388C550()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21388C55C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21388C568()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21388C574()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_21388C580()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21388C58C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21388C598()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21388C5A4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21388C5B0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21388C5BC()
{
  return MEMORY[0x24BEE7098]();
}

uint64_t sub_21388C5C8()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_21388C5D4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21388C5E0()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21388C5EC()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21388C5F8()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21388C604()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21388C610()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21388C61C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_21388C628()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_21388C634()
{
  return MEMORY[0x24BEE7160]();
}

uint64_t sub_21388C640()
{
  return MEMORY[0x24BEE7168]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _availability_version_check()
{
  return MEMORY[0x24BDAC970]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void rewind(FILE *a1)
{
  MEMORY[0x24BDAFB98](a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
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

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x24BEE4D60]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_task_addCancellationHandler()
{
  return MEMORY[0x24BEE7220]();
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

uint64_t swift_task_removeCancellationHandler()
{
  return MEMORY[0x24BEE7268]();
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

