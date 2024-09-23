@implementation ReactionEffectViewController

- (void)loadView
{
  void *v2;
  _TtC22_GroupActivities_UIKit28ReactionEffectViewController *v3;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22_GroupActivities_UIKit28ReactionEffectViewController_effectView);
  v3 = self;
  objc_msgSend(v2, sel_setUserInteractionEnabled_, 0);
  -[ReactionEffectViewController setView:](v3, sel_setView_, v2);

}

- (_TtC22_GroupActivities_UIKit28ReactionEffectViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC22_GroupActivities_UIKit28ReactionEffectViewController *)ReactionEffectViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC22_GroupActivities_UIKit28ReactionEffectViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC22_GroupActivities_UIKit28ReactionEffectViewController *v8;
  _TtC22_GroupActivities_UIKit28ReactionEffectViewController *v9;
  objc_super v11;

  v5 = OBJC_IVAR____TtC22_GroupActivities_UIKit28ReactionEffectViewController_effectView;
  type metadata accessor for ReactionEffectView();
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for ReactionEffectViewController();
  v9 = -[ReactionEffectViewController initWithCoder:](&v11, sel_initWithCoder_, v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22_GroupActivities_UIKit28ReactionEffectViewController_effectView));
}

@end
