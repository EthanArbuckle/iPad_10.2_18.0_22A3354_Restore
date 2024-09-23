@implementation LastMenstrualPeriodTileViewController

- (_TtC24MenstrualCyclesAppPlugin37LastMenstrualPeriodTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  char *v6;
  id v7;
  void *v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin37LastMenstrualPeriodTileViewController *v11;
  objc_super v13;

  if (a3)
  {
    _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
    v6 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37LastMenstrualPeriodTileViewController_context;
    *(_OWORD *)v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    *((_QWORD *)v6 + 4) = 0;
    v7 = a4;
    v8 = (void *)sub_231CA1BD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37LastMenstrualPeriodTileViewController_context;
    *(_OWORD *)v9 = 0u;
    *((_OWORD *)v9 + 1) = 0u;
    *((_QWORD *)v9 + 4) = 0;
    v10 = a4;
    v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for LastMenstrualPeriodTileViewController();
  v11 = -[LastMenstrualPeriodViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, v8, a4);

  return v11;
}

- (_TtC24MenstrualCyclesAppPlugin37LastMenstrualPeriodTileViewController)initWithCoder:(id)a3
{
  char *v5;
  objc_class *MenstrualPeriodTileViewController;
  objc_super v8;

  v5 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37LastMenstrualPeriodTileViewController_context;
  MenstrualPeriodTileViewController = (objc_class *)type metadata accessor for LastMenstrualPeriodTileViewController();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = MenstrualPeriodTileViewController;
  return -[LastMenstrualPeriodViewController initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_2319604AC((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37LastMenstrualPeriodTileViewController_context, (unint64_t *)&qword_254195600, &qword_2541955F8);
}

- (NSString)title
{
  void *v2;

  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController_viewModel))
  {
    sub_231AFA198();
    v2 = (void *)sub_231CA1BD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

@end
