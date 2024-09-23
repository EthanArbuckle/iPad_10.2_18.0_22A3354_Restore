@implementation BERenderingProcess

+ (void)renderingProcessWithInterruptionHandler:(id)a3 completion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254241720);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v9;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v10;
  v13 = sub_233073A24();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v8, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = sub_23306DE48;
  v14[5] = v11;
  v14[6] = sub_23306DDD0;
  v14[7] = v12;
  swift_retain();
  swift_retain();
  sub_233067C24((uint64_t)v8, (uint64_t)&unk_2560328E8, (uint64_t)v14);
  swift_release();
  swift_release();
  swift_release();
}

- (void)invalidate
{
  BERenderingProcess *v2;

  v2 = self;
  sub_23306ACF4();

}

- (id)makeLibXPCConnectionError:(id *)a3
{
  return sub_23306B7D4(self);
}

- (id)createVisibilityPropagationInteraction
{
  return sub_23306AE04(self);
}

- (BERenderingProcess)init
{
  BERenderingProcess *result;

  result = (BERenderingProcess *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23306DAA8((uint64_t)self + OBJC_IVAR___BERenderingProcess_inner, type metadata accessor for RenderingProcess);
}

+ (void)renderingProcessWithBundleID:(id)a3 interruptionHandler:(id)a4 completion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254241720);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = _Block_copy(a5);
  if (a3)
  {
    v13 = sub_23307397C();
    a3 = v14;
  }
  else
  {
    v13 = 0;
  }
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v11;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v12;
  v17 = sub_233073A24();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v10, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v13;
  v18[5] = a3;
  v18[6] = sub_23306DE48;
  v18[7] = v15;
  v18[8] = sub_23306D9EC;
  v18[9] = v16;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_233067C24((uint64_t)v10, (uint64_t)&unk_2560328E0, (uint64_t)v18);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

- (id)grantCapability:(id)a3 error:(id *)a4
{
  return sub_2330702AC(self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR___BERenderingProcess_inner, _s15_ProcessAdaptorVMa_4, (uint64_t)&off_250449088, type metadata accessor for RenderingProcess);
}

- (id)grantCapability:(id)a3 error:(id *)a4 invalidationHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  BERenderingProcess *v10;
  void *v11;

  v7 = _Block_copy(a5);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  v9 = a3;
  v10 = self;
  v11 = (void *)sub_233070604((uint64_t)v9, (uint64_t)sub_2330672D4, v8, &OBJC_IVAR___BERenderingProcess_inner, _s15_ProcessAdaptorVMa_4, (uint64_t)&off_250449088, type metadata accessor for RenderingProcess);
  swift_release();

  return v11;
}

@end
