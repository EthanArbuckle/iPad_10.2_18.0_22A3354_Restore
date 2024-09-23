@implementation HPSCaseEngravingView

+ (void)getEngravedCaseImage:(NSString *)a3 productID:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  NSString *v16;
  uint64_t v17;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA128);
  MEMORY[0x1E0C80A78]();
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a3;
  *(_DWORD *)(v12 + 24) = a4;
  *(_QWORD *)(v12 + 32) = v11;
  *(_QWORD *)(v12 + 40) = a1;
  v13 = sub_1DB3BC430();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1F02DA138;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1F02DA148;
  v15[5] = v14;
  v16 = a3;
  sub_1DB3809DC((uint64_t)v10, (uint64_t)&unk_1F02DA158, (uint64_t)v15);
  swift_release();
}

- (_TtC16HeadphoneConfigs20HPSCaseEngravingView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HPSCaseEngravingView();
  return -[HPSCaseEngravingView init](&v3, sel_init);
}

@end
