@implementation OrderImportControllerProvider

+ (id)makeViewControllerWithBundleURL:(id)a3 competion:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v17;

  v6 = sub_2339D21A8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_2339D213C();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = sub_2339D21B4();
  v14 = v13;
  v15 = sub_2339CDDDC(v12, v13, (uint64_t)sub_2339CF8DC, v11);
  sub_23372CC20(v12, v14);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_release();
  return v15;
}

+ (id)makeViewControllerWithOrderData:(id)a3 competion:(id)a4 error:(id *)a5
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;

  v6 = _Block_copy(a4);
  v7 = a3;
  v8 = sub_2339D21E4();
  v10 = v9;

  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v6;
  v12 = sub_2339CDDDC(v8, v10, (uint64_t)sub_2339CEF30, v11);
  swift_release();
  sub_23372CC20(v8, v10);
  return v12;
}

- (_TtC12FinanceKitUI29OrderImportControllerProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[OrderImportControllerProvider init](&v3, sel_init);
}

@end
