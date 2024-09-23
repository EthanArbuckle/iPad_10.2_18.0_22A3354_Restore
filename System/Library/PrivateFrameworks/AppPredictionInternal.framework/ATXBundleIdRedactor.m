@implementation ATXBundleIdRedactor

- (void)redactWithBundleIds:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  NSArray *v16;
  ATXBundleIdRedactor *v17;
  uint64_t v18;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED84F090);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  v13 = sub_1C9E45DE4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EF9326C0;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EF9326C8;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_1C9DF9768((uint64_t)v10, (uint64_t)&unk_1EF9326D0, (uint64_t)v15);
  swift_release();
}

- (ATXBundleIdRedactor)init
{
  objc_class *ObjectType;
  uint64_t v4;
  ATXBundleIdRedactor *v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR___ATXBundleIdRedactor_summarizationPipelineClient;
  sub_1C9E45BBC();
  swift_allocObject();
  v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_1C9E45BB0();

  v7.receiver = v5;
  v7.super_class = ObjectType;
  return -[ATXBundleIdRedactor init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
