@implementation MFMainCardViewController

- (_TtC16MagnifierSupport24MFMainCardViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_227572980();
}

- (void)loadView
{
  _TtC16MagnifierSupport24MFMainCardViewController *v2;

  v2 = self;
  sub_2275701A0();

}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MFMainCardViewController();
  v2 = v3.receiver;
  -[MFMainCardViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_2275704D4();
  sub_227570CE8();
  sub_22757155C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MagnifierSupport24MFMainCardViewController *v4;

  v4 = self;
  sub_227570334(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MFMainCardViewController();
  v4 = v5.receiver;
  -[MFMainCardViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_22754424C();

}

- (_TtC16MagnifierSupport24MFMainCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MagnifierSupport24MFMainCardViewController *result;

  v4 = a4;
  result = (_TtC16MagnifierSupport24MFMainCardViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController____lazy_storage___regularWidthConstraint));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_containedCard));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_cardContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_cardController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController____lazy_storage___informationLabel));
  sub_2273D3754(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController____lazy_storage___landscapeInformationLabel));
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_topBoundaryConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_leadingBoundaryConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_trailingBoundaryConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_bottomBoundaryConstraint));
  swift_release();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC16MagnifierSupport24MFMainCardViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_227571CD4(a4, width, height);
  swift_unknownObjectRelease();

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  _TtC16MagnifierSupport24MFMainCardViewController *v7;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_227572094(v6, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MFMainCardViewController();
  v2 = v3.receiver;
  -[MFMainCardViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  sub_227571814();
  sub_2275722B8();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
