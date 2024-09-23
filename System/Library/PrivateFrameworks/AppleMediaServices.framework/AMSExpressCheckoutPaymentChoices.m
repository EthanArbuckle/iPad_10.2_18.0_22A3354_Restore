@implementation AMSExpressCheckoutPaymentChoices

- (NSDictionary)metrics
{
  uint64_t v2;
  void *v3;

  sub_18C95C284();
  if (v2)
  {
    v3 = (void *)sub_18CEC175C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSDictionary *)v3;
}

- (void)setMetrics:(id)a3
{
  uint64_t v4;
  AMSExpressCheckoutPaymentChoices *v5;

  if (a3)
    v4 = sub_18CEC1774();
  else
    v4 = 0;
  v5 = self;
  sub_18C95C334(v4);

}

- (BOOL)isEmpty
{
  AMSExpressCheckoutPaymentChoices *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_18C95C414();

  return v3;
}

- (int64_t)cardsCount
{
  AMSExpressCheckoutPaymentChoices *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_18C95C4BC();
  v4 = v3;

  return v4;
}

- (AMSExpressCheckoutPaymentChoices)init
{
  return (AMSExpressCheckoutPaymentChoices *)ExpressCheckoutPaymentChoices.init()();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  AMSExpressCheckoutPaymentChoices *v5;

  v4 = a3;
  v5 = self;
  sub_18C95C8BC(v4);

}

- (AMSExpressCheckoutPaymentChoices)initWithCoder:(id)a3
{
  return (AMSExpressCheckoutPaymentChoices *)ExpressCheckoutPaymentChoices.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_2();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
