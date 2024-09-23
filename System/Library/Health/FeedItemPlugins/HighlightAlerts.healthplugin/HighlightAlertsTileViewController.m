@implementation HighlightAlertsTileViewController

- (void)viewDidLoad
{
  _TtC15HighlightAlerts33HighlightAlertsTileViewController *v2;

  v2 = self;
  sub_2314C101C();

}

- (void)dealloc
{
  objc_class *v3;
  _TtC15HighlightAlerts33HighlightAlertsTileViewController *v4;
  objc_super v5;

  v3 = (objc_class *)type metadata accessor for HighlightAlertsTileViewController();
  v4 = self;
  sub_2314CA5B0();
  v5.receiver = v4;
  v5.super_class = v3;
  -[HighlightAlertsTileViewController dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_2314C7194((uint64_t)self + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController_context, (uint64_t)&unk_254164190, (uint64_t)&unk_254164188, MEMORY[0x24BE443C0], (uint64_t (*)(_QWORD))sub_2314C7140);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController____lazy_storage___typeImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController____lazy_storage___bodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController____lazy_storage___descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController____lazy_storage___diagramImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController_moreDetailsFont));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController_descriptionBottomSpacingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController_descriptionToDiagramSpacingConstraint));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController_bodyLabelToDiagramSpacingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController_bodyLabelToBottomSpacingConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)updateViewConstraints
{
  _TtC15HighlightAlerts33HighlightAlertsTileViewController *v2;
  objc_super v3;

  v2 = self;
  sub_2314C2D7C(0);
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for HighlightAlertsTileViewController();
  -[HighlightAlertsTileViewController updateViewConstraints](&v3, sel_updateViewConstraints);

}

- (void)significantTimeChangeDidOccur
{
  _TtC15HighlightAlerts33HighlightAlertsTileViewController *v2;

  v2 = self;
  sub_2314C48C4(0);

}

- (void)handleTap
{
  _TtC15HighlightAlerts33HighlightAlertsTileViewController *v2;

  v2 = self;
  sub_2314C5240();

}

- (_TtC15HighlightAlerts33HighlightAlertsTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_2314CA808();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC15HighlightAlerts33HighlightAlertsTileViewController *)sub_2314C648C(v5, v7, a4);
}

- (_TtC15HighlightAlerts33HighlightAlertsTileViewController)initWithCoder:(id)a3
{
  return (_TtC15HighlightAlerts33HighlightAlertsTileViewController *)sub_2314C6640(a3);
}

- (NSString)title
{
  _TtC15HighlightAlerts33HighlightAlertsTileViewController *v2;
  void *v3;

  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15HighlightAlerts33HighlightAlertsTileViewController_viewModel))
  {
    v2 = self;
    swift_retain();
    sub_2314BC8B4();

    swift_release();
    v3 = (void *)sub_2314CA7E4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

@end
