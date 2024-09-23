@implementation BankConnectImageProvider

- (_TtC12FinanceKitUI24BankConnectImageProvider)init
{
  objc_class *ObjectType;
  _TtC12FinanceKitUI24BankConnectImageProvider *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_2339D060C();
  v4 = self;
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC12FinanceKitUI24BankConnectImageProvider_bankConnectService) = (Class)sub_2339D0600();

  v6.receiver = v4;
  v6.super_class = ObjectType;
  return -[BankConnectImageProvider init](&v6, sel_init);
}

- (void)logoFor:(NSString *)a3 size:(CGSize)a4 scale:(double)a5 completionHandler:(id)a6
{
  CGFloat height;
  CGFloat width;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  NSString *v20;
  _TtC12FinanceKitUI24BankConnectImageProvider *v21;
  uint64_t v22;

  height = a4.height;
  width = a4.width;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560D4880);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a6);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a3;
  *(CGFloat *)(v16 + 24) = width;
  *(CGFloat *)(v16 + 32) = height;
  *(double *)(v16 + 40) = a5;
  *(_QWORD *)(v16 + 48) = v15;
  *(_QWORD *)(v16 + 56) = self;
  v17 = sub_2339D44D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_2560E48B8;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_2560E1CF0;
  v19[5] = v18;
  v20 = a3;
  v21 = self;
  sub_23399737C((uint64_t)v14, (uint64_t)&unk_2560DAAC0, (uint64_t)v19);
  swift_release();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
