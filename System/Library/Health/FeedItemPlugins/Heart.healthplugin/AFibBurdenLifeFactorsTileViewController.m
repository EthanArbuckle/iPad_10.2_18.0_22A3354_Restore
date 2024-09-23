@implementation AFibBurdenLifeFactorsTileViewController

- (_TtC5Heart39AFibBurdenLifeFactorsTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_2314146BC();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC5Heart39AFibBurdenLifeFactorsTileViewController *)sub_2313EE638(v5, v7, a4);
}

- (_TtC5Heart39AFibBurdenLifeFactorsTileViewController)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR____TtC5Heart39AFibBurdenLifeFactorsTileViewController_context;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart39AFibBurdenLifeFactorsTileViewController_cacheObject) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart39AFibBurdenLifeFactorsTileViewController_tileView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AFibBurdenLifeFactorsTileViewController();
  return -[AFibBurdenLifeFactorsTileViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void)loadView
{
  _TtC5Heart39AFibBurdenLifeFactorsTileViewController *v2;

  v2 = self;
  sub_2313EE7B4();

}

- (void).cxx_destruct
{
  sub_2312CEBD4((uint64_t)self + OBJC_IVAR____TtC5Heart39AFibBurdenLifeFactorsTileViewController_context, (uint64_t (*)(_QWORD))sub_2313EF504);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart39AFibBurdenLifeFactorsTileViewController_tileView));
}

- (NSString)title
{
  uint64_t v2;
  _TtC5Heart39AFibBurdenLifeFactorsTileViewController *v3;
  void *v4;

  v2 = qword_255ECAAD8;
  v3 = self;
  if (v2 != -1)
    swift_once();
  sub_231411374();

  v4 = (void *)sub_23141468C();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

@end
