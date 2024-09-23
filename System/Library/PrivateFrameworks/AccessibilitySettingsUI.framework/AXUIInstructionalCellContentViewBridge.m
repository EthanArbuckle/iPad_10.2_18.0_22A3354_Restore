@implementation AXUIInstructionalCellContentViewBridge

- (id)makeContentViewControllerWithTitle:(id)a3 image:(id)a4 imageIgnoresInvertColors:(BOOL)a5 description:(id)a6 linkTitle:(id)a7 tipType:(int64_t)a8 linkCallback:(id)a9 closeCallback:(id)a10
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  AXUIInstructionalCellContentViewBridge *v27;
  id v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  id v33;
  AXUIInstructionalCellContentViewBridge *v34;
  uint64_t v35;
  _BOOL4 v36;

  v34 = self;
  v35 = a8;
  v36 = a5;
  v33 = a4;
  v11 = sub_235DA8A70();
  MEMORY[0x24BDAC7A8](v11);
  v12 = type metadata accessor for AXTipCellContentView(0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (uint64_t *)((char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = _Block_copy(a9);
  v16 = _Block_copy(a10);
  v32 = sub_235DA928C();
  v18 = v17;
  v31 = sub_235DA928C();
  v20 = v19;
  if (a7)
  {
    v21 = sub_235DA928C();
    v23 = v22;
  }
  else
  {
    v21 = 0;
    v23 = 0;
  }
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = v15;
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = v16;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v26 = v33;
  v27 = v34;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_235D7BC9C(v32, v18, v31, v20, v26, v36, v21, v23, v14, v35, (uint64_t)sub_235D802D4, v24, (uint64_t)sub_235D80924, v25);
  v28 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_25637CB40));
  v29 = (void *)sub_235DA8944();
  sub_235DA8A64();
  sub_235DA8938();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v29;
}

- (AXUIInstructionalCellContentViewBridge)init
{
  uint64_t *v3;
  objc_super v5;

  v3 = (uint64_t *)((char *)self + OBJC_IVAR___AXUIInstructionalCellContentViewBridge__colorScheme);
  *v3 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25637A070);
  swift_storeEnumTagMultiPayload();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AXUIInstructionalCellContentViewBridge(0);
  return -[AXUIInstructionalCellContentViewBridge init](&v5, sel_init);
}

- (void).cxx_destruct
{
  sub_235D1E880((uint64_t)self + OBJC_IVAR___AXUIInstructionalCellContentViewBridge__colorScheme, &qword_25637A0B8);
}

@end
