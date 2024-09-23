@implementation CondensedAppEventContentView

- (_TtC20ProductPageExtension28CondensedAppEventContentView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension28CondensedAppEventContentView *)sub_1003C58B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension28CondensedAppEventContentView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC20ProductPageExtension28CondensedAppEventContentView *result;

  v5 = OBJC_IVAR____TtC20ProductPageExtension28CondensedAppEventContentView_lockupView;
  v6 = objc_allocWithZone((Class)type metadata accessor for SmallSearchLockupView(0));
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC20ProductPageExtension28CondensedAppEventContentView_eventCardView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CondensedAppEventCardView()), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension28CondensedAppEventContentView_interRowSpacing) = 0;

  result = (_TtC20ProductPageExtension28CondensedAppEventContentView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/CondensedAppEventContentView.swift", 55, 2, 40, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension28CondensedAppEventContentView *v2;

  v2 = self;
  sub_1003C5B24();

}

- (_TtC20ProductPageExtension21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension21SmallSearchLockupView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension28CondensedAppEventContentView_lockupView);
}

- (_TtC20ProductPageExtension25CondensedAppEventCardView)accessibilityAppEventView
{
  return (_TtC20ProductPageExtension25CondensedAppEventCardView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension28CondensedAppEventContentView_eventCardView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28CondensedAppEventContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28CondensedAppEventContentView_eventCardView));
}

@end
