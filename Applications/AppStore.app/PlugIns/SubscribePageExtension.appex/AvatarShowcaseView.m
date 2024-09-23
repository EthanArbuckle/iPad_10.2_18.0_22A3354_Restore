@implementation AvatarShowcaseView

- (_TtC22SubscribePageExtension18AvatarShowcaseView)initWithCoder:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension18AvatarShowcaseView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension18AvatarShowcaseView_artworkLoader) = 0;
  v4 = a3;

  result = (_TtC22SubscribePageExtension18AvatarShowcaseView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/AvatarShowcaseView.swift", 47, 2, 38, 0);
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension18AvatarShowcaseView)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension18AvatarShowcaseView *result;

  result = (_TtC22SubscribePageExtension18AvatarShowcaseView *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.AvatarShowcaseView", 41, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension18AvatarShowcaseView_layoutConfiguration;
  v4 = type metadata accessor for AvatarShowcaseLayoutConfiguration(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension18AvatarShowcaseView_artworkLoader));
}

@end
