@implementation BackgroundConfigurationController

- (_TtC11EmojiPoster33BackgroundConfigurationController)init
{
  return (_TtC11EmojiPoster33BackgroundConfigurationController *)BackgroundConfigurationController.init()();
}

- (_TtC11EmojiPoster33BackgroundConfigurationController)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster33BackgroundConfigurationController *)sub_1DD2E6B00(a3);
}

- (void)viewDidLoad
{
  _TtC11EmojiPoster33BackgroundConfigurationController *v2;

  v2 = self;
  sub_1DD2E6D9C();

}

- (_TtC11EmojiPoster33BackgroundConfigurationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11EmojiPoster33BackgroundConfigurationController *result;

  v4 = a4;
  result = (_TtC11EmojiPoster33BackgroundConfigurationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DD2CFD1C((uint64_t)self + OBJC_IVAR____TtC11EmojiPoster33BackgroundConfigurationController_delegate);
  sub_1DD2BF928(*(uint64_t *)((char *)&self->super._tabBarItem+ OBJC_IVAR____TtC11EmojiPoster33BackgroundConfigurationController_backgroundConfiguration), *(uint64_t *)((char *)&self->super._tab+ OBJC_IVAR____TtC11EmojiPoster33BackgroundConfigurationController_backgroundConfiguration), *(uint64_t *)((char *)&self->super._tabElement+ OBJC_IVAR____TtC11EmojiPoster33BackgroundConfigurationController_backgroundConfiguration), *(uint64_t *)((char *)&self->super._navigationItem+ OBJC_IVAR____TtC11EmojiPoster33BackgroundConfigurationController_backgroundConfiguration), *(uint64_t *)((char *)&self->super._toolbarItems+ OBJC_IVAR____TtC11EmojiPoster33BackgroundConfigurationController_backgroundConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster33BackgroundConfigurationController_effectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster33BackgroundConfigurationController_verticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster33BackgroundConfigurationController_styleSegmentedControl));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster33BackgroundConfigurationController_gradientController));
}

@end
