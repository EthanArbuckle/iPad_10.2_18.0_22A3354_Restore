@implementation CondensedAppEventContentView

- (_TtC22SubscribePageExtension28CondensedAppEventContentView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension28CondensedAppEventContentView *)sub_1003ACD08(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension28CondensedAppEventContentView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC22SubscribePageExtension28CondensedAppEventContentView *result;

  v5 = OBJC_IVAR____TtC22SubscribePageExtension28CondensedAppEventContentView_lockupView;
  v6 = objc_allocWithZone((Class)type metadata accessor for SmallSearchLockupView(0));
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC22SubscribePageExtension28CondensedAppEventContentView_eventCardView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CondensedAppEventCardView()), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension28CondensedAppEventContentView_interRowSpacing) = 0;

  result = (_TtC22SubscribePageExtension28CondensedAppEventContentView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/CondensedAppEventContentView.swift", 57, 2, 40, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension28CondensedAppEventContentView *v2;

  v2 = self;
  sub_1003ACF74();

}

- (_TtC22SubscribePageExtension21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension21SmallSearchLockupView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension28CondensedAppEventContentView_lockupView);
}

- (_TtC22SubscribePageExtension25CondensedAppEventCardView)accessibilityAppEventView
{
  return (_TtC22SubscribePageExtension25CondensedAppEventCardView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension28CondensedAppEventContentView_eventCardView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28CondensedAppEventContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28CondensedAppEventContentView_eventCardView));
}

@end
