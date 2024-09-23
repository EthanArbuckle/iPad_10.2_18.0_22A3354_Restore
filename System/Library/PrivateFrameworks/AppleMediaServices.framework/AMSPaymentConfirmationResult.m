@implementation AMSPaymentConfirmationResult

- (int64_t)paymentConfirmationChoice
{
  return PaymentConfirmationResult.paymentConfirmationChoice.getter();
}

- (id)initWitChoice:(int64_t)a3
{
  return PaymentConfirmationResult.init(_:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return static PaymentConfirmationResult.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static PaymentConfirmationResult.supportsSecureCoding.setter(a3);
}

- (AMSPaymentConfirmationResult)initWithCoder:(id)a3
{
  return (AMSPaymentConfirmationResult *)PaymentConfirmationResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  AMSPaymentConfirmationResult *v5;

  v4 = a3;
  v5 = self;
  sub_18C93578C(v4);

}

- (AMSPaymentConfirmationResult)init
{
  PaymentConfirmationResult.init()();
}

@end
