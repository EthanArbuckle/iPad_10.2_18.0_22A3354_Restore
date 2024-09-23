@implementation SuggestionsOrderBanner

- (id)init:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v4 = a3;
  v5 = sub_2339D21E4();
  v7 = v6;

  return SuggestionsOrderBanner.init(_:)(v5, v7);
}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC12FinanceKitUI22SuggestionsOrderBanner *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  swift_retain();
  sub_2339CFCB8();
  swift_release();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[SuggestionsOrderBanner dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC12FinanceKitUI22SuggestionsOrderBanner_order;
  v4 = sub_2339D0FE4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC12FinanceKitUI22SuggestionsOrderBanner_configuration;
  v6 = sub_2339D0C54();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (NSString)merchantName
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC12FinanceKitUI22SuggestionsOrderBanner *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v3 = sub_2339CFD54();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_2339D0FC0();
  sub_2339CFD0C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v8 = (void *)sub_2339CFCA0();
  swift_bridgeObjectRelease();
  sub_2339D021C();

  v9 = (void *)sub_2339D42C0();
  swift_bridgeObjectRelease();
  return (NSString *)v9;
}

- (UIImage)merchantLogo
{
  _TtC12FinanceKitUI22SuggestionsOrderBanner *v2;
  id v3;

  v2 = self;
  v3 = SuggestionsOrderBanner.merchantLogo.getter();

  return (UIImage *)v3;
}

- (NSURL)orderDeepLink
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _TtC12FinanceKitUI22SuggestionsOrderBanner *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;

  v3 = sub_2339D15D8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2339CFBA4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560D3180);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = self;
  sub_2339CFB50();
  LOBYTE(self) = sub_2339CFB98();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if ((self & 1) != 0)
  {
    sub_2339D0F0C();
    sub_2339CFA00();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v15 = sub_2339D21A8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v13, 0, 1, v15);
  }
  else
  {
    v15 = sub_2339D21A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v13, 1, 1, v15);
  }

  sub_2339D21A8();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v13, 1, v15) != 1)
  {
    v17 = (void *)sub_2339D2100();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
  }
  return (NSURL *)v17;
}

- (NSAttributedString)bannerAttributedSubtitle
{
  _TtC12FinanceKitUI22SuggestionsOrderBanner *v2;
  id v3;

  v2 = self;
  v3 = SuggestionsOrderBanner.bannerAttributedSubtitle.getter();

  return (NSAttributedString *)v3;
}

+ (id)walletLogo
{
  if (qword_2560CFF90 != -1)
    swift_once();
  return (id)qword_2560D2B58;
}

- (_TtC12FinanceKitUI22SuggestionsOrderBanner)init
{
  _TtC12FinanceKitUI22SuggestionsOrderBanner *result;

  result = (_TtC12FinanceKitUI22SuggestionsOrderBanner *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
