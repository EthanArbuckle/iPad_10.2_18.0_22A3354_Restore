@implementation ArcadeHeaderButtonContainer

- (_TtC22SubscribePageExtension27ArcadeHeaderButtonContainer)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC22SubscribePageExtension27ArcadeHeaderButtonContainer *result;

  v5 = OBJC_IVAR____TtC22SubscribePageExtension27ArcadeHeaderButtonContainer_stackView;
  v6 = objc_allocWithZone((Class)type metadata accessor for StackView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtC22SubscribePageExtension27ArcadeHeaderButtonContainer *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/ArcadeHeaderButtonContainer.swift", 56, 2, 49, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v4.receiver;
  -[ArcadeHeaderButtonContainer layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension27ArcadeHeaderButtonContainer_stackView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension27ArcadeHeaderButtonContainer_stackView), "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC22SubscribePageExtension27ArcadeHeaderButtonContainer)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension27ArcadeHeaderButtonContainer *result;

  result = (_TtC22SubscribePageExtension27ArcadeHeaderButtonContainer *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.ArcadeHeaderButtonContainer", 50, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension27ArcadeHeaderButtonContainer_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension27ArcadeHeaderButtonContainer_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension27ArcadeHeaderButtonContainer_seeAllGamesButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension27ArcadeHeaderButtonContainer_accountButton));
}

@end
