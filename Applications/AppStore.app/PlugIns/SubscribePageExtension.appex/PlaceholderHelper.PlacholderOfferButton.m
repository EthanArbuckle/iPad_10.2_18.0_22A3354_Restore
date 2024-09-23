@implementation PlaceholderHelper.PlacholderOfferButton

- (_TtCV22SubscribePageExtension17PlaceholderHelperP33_4A9A4D8787D6A1CEAEBA94C8789E237C21PlacholderOfferButton)initWithFrame:(CGRect)a3
{
  return (_TtCV22SubscribePageExtension17PlaceholderHelperP33_4A9A4D8787D6A1CEAEBA94C8789E237C21PlacholderOfferButton *)sub_1005F15D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCV22SubscribePageExtension17PlaceholderHelperP33_4A9A4D8787D6A1CEAEBA94C8789E237C21PlacholderOfferButton)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _TtCV22SubscribePageExtension17PlaceholderHelperP33_4A9A4D8787D6A1CEAEBA94C8789E237C21PlacholderOfferButton *result;

  v5 = OBJC_IVAR____TtCV22SubscribePageExtension17PlaceholderHelperP33_4A9A4D8787D6A1CEAEBA94C8789E237C21PlacholderOfferButton_button;
  v6 = objc_allocWithZone((Class)UIView);
  v7 = a3;
  v8 = objc_msgSend(v6, "init");
  v9 = objc_msgSend((id)objc_opt_self(UIColor), "secondarySystemBackgroundColor");
  objc_msgSend(v8, "setBackgroundColor:", v9);

  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v8;
  result = (_TtCV22SubscribePageExtension17PlaceholderHelperP33_4A9A4D8787D6A1CEAEBA94C8789E237C21PlacholderOfferButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/PlaceholderHelper.swift", 46, 2, 75, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtCV22SubscribePageExtension17PlaceholderHelperP33_4A9A4D8787D6A1CEAEBA94C8789E237C21PlacholderOfferButton *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_10057031C();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _TtCV22SubscribePageExtension17PlaceholderHelperP33_4A9A4D8787D6A1CEAEBA94C8789E237C21PlacholderOfferButton *v2;

  v2 = self;
  sub_1005F181C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV22SubscribePageExtension17PlaceholderHelperP33_4A9A4D8787D6A1CEAEBA94C8789E237C21PlacholderOfferButton_button));
}

@end
