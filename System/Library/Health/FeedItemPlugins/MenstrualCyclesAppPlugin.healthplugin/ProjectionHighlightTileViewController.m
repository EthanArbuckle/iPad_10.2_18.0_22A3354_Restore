@implementation ProjectionHighlightTileViewController

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController *v2;

  v2 = self;
  sub_2319D15F8();

}

- (void)dealloc
{
  void *v3;
  _TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ProjectionHighlightTileViewController();
  -[ProjectionHighlightTileViewController dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_2319D62E4(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController_viewModel), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController_viewModel), *(void **)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController_footer));
  sub_231945C64((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController_context, (uint64_t)&qword_254195600, (uint64_t)&qword_2541955F8, MEMORY[0x24BE443C0], (uint64_t (*)(_QWORD))sub_2319604E8);
}

- (void)todayDidChange
{
  _TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController *v2;

  v2 = self;
  sub_2319D3608();

}

- (_TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController *)sub_2319D3C9C(v5, v7, a4);
}

- (_TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController)initWithCoder:(id)a3
{
  return (_TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController *)sub_2319D3E18(a3);
}

- (NSString)title
{
  char *v2;
  void *v3;
  void *v5;
  uint64_t v6;
  _TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController *v7;

  v2 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController_viewModel;
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController_viewModel);
  if (v3)
  {
    v6 = *((_QWORD *)v2 + 1);
    v5 = (void *)*((_QWORD *)v2 + 2);
    sub_2319D4E4C(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37ProjectionHighlightTileViewController_viewModel), v6, v5);
    sub_2319D4E4C(v3, v6, v5);
    v7 = self;

    sub_2319FEDBC(v3, v6 & 1);
    v3 = (void *)sub_231CA1BD8();
    swift_bridgeObjectRelease();
  }
  return (NSString *)v3;
}

@end
