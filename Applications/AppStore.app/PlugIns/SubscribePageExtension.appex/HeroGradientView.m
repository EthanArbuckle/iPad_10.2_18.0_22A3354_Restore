@implementation HeroGradientView

- (_TtC22SubscribePageExtension16HeroGradientView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension16HeroGradientView *)sub_1003918A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension16HeroGradientView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC22SubscribePageExtension16HeroGradientView *result;

  v5 = OBJC_IVAR____TtC22SubscribePageExtension16HeroGradientView_gradient;
  v6 = objc_allocWithZone((Class)CAGradientLayer);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension16HeroGradientView_wantsTopGradient) = 1;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension16HeroGradientView_wantsBottomGradient) = 1;

  result = (_TtC22SubscribePageExtension16HeroGradientView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/HeroGradientView.swift", 45, 2, 59, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HeroGradientView();
  v2 = (char *)v4.receiver;
  -[HeroGradientView layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension16HeroGradientView_gradient];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
  sub_100391BEC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16HeroGradientView_gradient));
}

@end
