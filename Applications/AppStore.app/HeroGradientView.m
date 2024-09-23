@implementation HeroGradientView

- (_TtC8AppStore16HeroGradientView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore16HeroGradientView *)sub_10044B044(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore16HeroGradientView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8AppStore16HeroGradientView *result;

  v5 = OBJC_IVAR____TtC8AppStore16HeroGradientView_gradient;
  v6 = objc_allocWithZone((Class)CAGradientLayer);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore16HeroGradientView_wantsTopGradient) = 1;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore16HeroGradientView_wantsBottomGradient) = 1;

  result = (_TtC8AppStore16HeroGradientView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/HeroGradientView.swift", 31, 2, 59, 0);
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
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore16HeroGradientView_gradient];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
  sub_10044B390();

}

- (void).cxx_destruct
{

}

@end
