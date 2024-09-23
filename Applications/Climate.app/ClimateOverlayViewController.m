@implementation ClimateOverlayViewController

- (_TtC7Climate28ClimateOverlayViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100018C0C();
}

- (void)viewDidLoad
{
  _TtC7Climate28ClimateOverlayViewController *v2;

  v2 = self;
  sub_100013FEC();

}

- (_TtC7Climate28ClimateOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7Climate28ClimateOverlayViewController *result;

  v4 = a4;
  result = (_TtC7Climate28ClimateOverlayViewController *)_swift_stdlib_reportUnimplementedInitializer("Climate.ClimateOverlayViewController", 36, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7Climate28ClimateOverlayViewController_scene);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate28ClimateOverlayViewController_leftView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate28ClimateOverlayViewController_rightView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC7Climate28ClimateOverlayViewController_popoverManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate28ClimateOverlayViewController_leftPopover));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate28ClimateOverlayViewController_rightPopover));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Climate28ClimateOverlayViewController_cancellables));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Climate28ClimateOverlayViewController_activeConstraints));
}

- (void)didTapClimateStatusBarButton:(id)a3
{
  _TtC7Climate28ClimateOverlayViewController *v5;
  _QWORD v6[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v6);
  swift_unknownObjectRelease(a3);
  sub_100016F38((uint64_t)v6);

  sub_100018B40(v6);
}

- (void)handleTapOutsidePopoverFrames
{
  _TtC7Climate28ClimateOverlayViewController *v2;

  v2 = self;
  sub_1000156A4();

}

@end
