@implementation RadioRootViewController

- (_TtC5Media23RadioRootViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000640D8();
}

- (void)viewDidLoad
{
  _TtC5Media23RadioRootViewController *v2;

  v2 = self;
  sub_100060F48();

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RadioRootViewController();
  v2 = v3.receiver;
  -[RadioRootViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  sub_100061DFC();

}

- (void)invalidate
{
  _TtC5Media23RadioRootViewController *v2;

  v2 = self;
  sub_100061844();

}

- (void)doneEditingFavoritesWithSender:(id)a3
{
  id v4;
  _TtC5Media23RadioRootViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000641BC();

}

- (void)segmentedControlChangedWithSender:(id)a3
{
  id v4;
  _TtC5Media23RadioRootViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100063428(v4);

}

- (void)showSettings
{
  _TtC5Media23RadioRootViewController *v2;

  v2 = self;
  sub_1000635AC();

}

- (void)showSoundSettings
{
  uint64_t Strong;
  _TtC5Media23RadioRootViewController *v4;
  id v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Media23RadioRootViewController_carManager);
  if (Strong)
  {
    v5 = (id)Strong;
    v4 = self;
    sub_10000B658(0);

  }
}

- (void)nowPlayingTapped
{
  uint64_t Strong;
  _TtC5Media23RadioRootViewController *v4;
  id v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Media23RadioRootViewController_carManager);
  if (Strong)
  {
    v5 = (id)Strong;
    v4 = self;
    sub_10000B4B0();

  }
}

- (void)showSourcePickerWithSender:(id)a3
{
  id v4;
  _TtC5Media23RadioRootViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100063768((uint64_t)v4);

}

- (void)showOptionsPickerWithSender:(id)a3
{
  id v4;
  _TtC5Media23RadioRootViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000638FC((uint64_t)v4);

}

- (void)dismissSettingsModal
{
  _TtC5Media23RadioRootViewController *v2;

  v2 = self;
  sub_100063DA8();

}

- (_TtC5Media23RadioRootViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5
{
  _TtC5Media23RadioRootViewController *result;

  result = (_TtC5Media23RadioRootViewController *)_swift_stdlib_reportUnimplementedInitializer("Media.RadioRootViewController", 29, "init(transitionStyle:navigationOrientation:options:)", 52, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Media23RadioRootViewController_carManager);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media23RadioRootViewController_sourcePickerButton));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Media23RadioRootViewController_pages));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Media23RadioRootViewController_subscribers));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media23RadioRootViewController_segmentedControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media23RadioRootViewController_optionsPicker));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media23RadioRootViewController_sourcePicker));
}

@end
