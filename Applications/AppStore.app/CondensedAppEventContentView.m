@implementation CondensedAppEventContentView

- (_TtC8AppStore28CondensedAppEventContentView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore28CondensedAppEventContentView *)sub_1001E5608(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore28CondensedAppEventContentView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC8AppStore28CondensedAppEventContentView *result;

  v5 = OBJC_IVAR____TtC8AppStore28CondensedAppEventContentView_lockupView;
  v6 = objc_allocWithZone((Class)type metadata accessor for SmallSearchLockupView(0));
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC8AppStore28CondensedAppEventContentView_eventCardView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CondensedAppEventCardView()), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore28CondensedAppEventContentView_interRowSpacing) = 0;

  result = (_TtC8AppStore28CondensedAppEventContentView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/CondensedAppEventContentView.swift", 43, 2, 40, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore28CondensedAppEventContentView *v2;

  v2 = self;
  sub_1001E5874();

}

- (_TtC8AppStore21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC8AppStore21SmallSearchLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                         + OBJC_IVAR____TtC8AppStore28CondensedAppEventContentView_lockupView));
}

- (_TtC8AppStore25CondensedAppEventCardView)accessibilityAppEventView
{
  return (_TtC8AppStore25CondensedAppEventCardView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                             + OBJC_IVAR____TtC8AppStore28CondensedAppEventContentView_eventCardView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28CondensedAppEventContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28CondensedAppEventContentView_eventCardView));
}

@end
