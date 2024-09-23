@implementation CCUIControlIntentStore

- (void)storeIntent:(id)a3 bundleIdentifier:(id)a4 dataSourceIdentifier:(id)a5
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  CCUIControlIntentStore *v14;

  v7 = sub_1CFBFA894();
  v9 = v8;
  v10 = sub_1CFBFA894();
  v12 = v11;
  v13 = a3;
  v14 = self;
  sub_1CFBC6958(v13, v7, v9, v10, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)deleteIntentWithBundleIdentifier:(id)a3 dataSourceIdentifier:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  CCUIControlIntentStore *v11;

  v6 = sub_1CFBFA894();
  v8 = v7;
  if (a4)
  {
    v9 = sub_1CFBFA894();
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = self;
  sub_1CFBC6C10(v6, v8, v9, (unint64_t)a4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)intentWithBundleIdentifier:(id)a3 dataSourceIdentifier:(id)a4 defaultIntentProvider:(id)a5
{
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  CCUIControlIntentStore *v13;
  void *v14;

  v6 = (uint64_t (*)(uint64_t))_Block_copy(a5);
  v7 = sub_1CFBFA894();
  v9 = v8;
  v10 = sub_1CFBFA894();
  v12 = v11;
  if (v6)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v6;
    v6 = (uint64_t (*)(uint64_t))sub_1CFBCCD94;
  }
  v13 = self;
  v14 = sub_1CFBC7320(v7, v9, v10, v12, v6);
  sub_1CFBB8538((uint64_t)v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

- (CCUIControlIntentStore)init
{
  uint64_t v3;
  CCUIControlIntentStore *v4;
  objc_super v6;

  v3 = OBJC_IVAR___CCUIControlIntentStore_localIntentsCache;
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_1CFBBB224(MEMORY[0x1E0DEE9D8]);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ControlIntentStore();
  return -[CCUIControlIntentStore init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
