@implementation ExpressCheckoutManagePaymentParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC18AppleMediaServices34ExpressCheckoutManagePaymentParams *v5;

  v4 = a3;
  v5 = self;
  sub_18C95AD9C(v4);

}

- (_TtC18AppleMediaServices34ExpressCheckoutManagePaymentParams)initWithCoder:(id)a3
{
  return (_TtC18AppleMediaServices34ExpressCheckoutManagePaymentParams *)ExpressCheckoutManagePaymentParams.init(coder:)(a3);
}

- (_TtC18AppleMediaServices34ExpressCheckoutManagePaymentParams)init
{
  ExpressCheckoutManagePaymentParams.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
