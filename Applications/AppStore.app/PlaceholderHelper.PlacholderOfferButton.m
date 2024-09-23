@implementation PlaceholderHelper.PlacholderOfferButton

- (_TtCV8AppStore17PlaceholderHelperP33_607C52F02DF538DBADD6410BF6CDB63521PlacholderOfferButton)initWithFrame:(CGRect)a3
{
  return (_TtCV8AppStore17PlaceholderHelperP33_607C52F02DF538DBADD6410BF6CDB63521PlacholderOfferButton *)sub_1002319F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCV8AppStore17PlaceholderHelperP33_607C52F02DF538DBADD6410BF6CDB63521PlacholderOfferButton)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _TtCV8AppStore17PlaceholderHelperP33_607C52F02DF538DBADD6410BF6CDB63521PlacholderOfferButton *result;

  v5 = OBJC_IVAR____TtCV8AppStore17PlaceholderHelperP33_607C52F02DF538DBADD6410BF6CDB63521PlacholderOfferButton_button;
  v6 = objc_allocWithZone((Class)UIView);
  v7 = a3;
  v8 = objc_msgSend(v6, "init");
  v9 = objc_msgSend((id)objc_opt_self(UIColor), "secondarySystemBackgroundColor");
  objc_msgSend(v8, "setBackgroundColor:", v9);

  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v8;
  result = (_TtCV8AppStore17PlaceholderHelperP33_607C52F02DF538DBADD6410BF6CDB63521PlacholderOfferButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/PlaceholderHelper.swift", 32, 2, 75, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtCV8AppStore17PlaceholderHelperP33_607C52F02DF538DBADD6410BF6CDB63521PlacholderOfferButton *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_10023235C();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _TtCV8AppStore17PlaceholderHelperP33_607C52F02DF538DBADD6410BF6CDB63521PlacholderOfferButton *v2;

  v2 = self;
  sub_100231C3C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV8AppStore17PlaceholderHelperP33_607C52F02DF538DBADD6410BF6CDB63521PlacholderOfferButton_button));
}

@end
