@implementation ExpressCheckoutCard

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC18AppleMediaServices19ExpressCheckoutCard *v5;

  v4 = a3;
  v5 = self;
  sub_18C95994C(v4);

}

- (_TtC18AppleMediaServices19ExpressCheckoutCard)initWithCoder:(id)a3
{
  return (_TtC18AppleMediaServices19ExpressCheckoutCard *)ExpressCheckoutCard.init(coder:)(a3);
}

- (_TtC18AppleMediaServices19ExpressCheckoutCard)init
{
  ExpressCheckoutCard.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_2();
  swift_bridgeObjectRelease();
}

@end
