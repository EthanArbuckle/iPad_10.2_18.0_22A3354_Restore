@implementation MySportsViewController

- (_TtC7NewsUI222MySportsViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC7NewsUI222MySportsViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7NewsUI222MySportsViewController_promiseViewController) = 0;
  v5 = OBJC_IVAR____TtC7NewsUI222MySportsViewController_coverViewManager;
  sub_1D6E1D678();
  swift_allocObject();
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1D6E1D66C();

  result = (_TtC7NewsUI222MySportsViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[MySportsViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_1D6E1D660();
  sub_1D63B65F8();

}

- (void)viewDidLayoutSubviews
{
  _TtC7NewsUI222MySportsViewController *v2;

  v2 = self;
  sub_1D63B6A0C();

}

- (_TtC7NewsUI222MySportsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI222MySportsViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI222MySportsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI222MySportsViewController_offlineManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI222MySportsViewController_feedViewContext));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI222MySportsViewController_promiseViewController));
  swift_release();
  sub_1D617FDBC(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI222MySportsViewController_referralContext), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC7NewsUI222MySportsViewController_referralContext), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC7NewsUI222MySportsViewController_referralContext), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC7NewsUI222MySportsViewController_referralContext), *((_BYTE *)&self->super._view + OBJC_IVAR____TtC7NewsUI222MySportsViewController_referralContext));
}

@end
