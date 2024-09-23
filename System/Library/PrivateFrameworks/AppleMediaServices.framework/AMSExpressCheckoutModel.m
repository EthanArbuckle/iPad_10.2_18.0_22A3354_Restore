@implementation AMSExpressCheckoutModel

- (AMSExpressCheckoutModel)initWithMode:(int64_t)a3 paymentChoices:(id)a4
{
  return (AMSExpressCheckoutModel *)ExpressCheckoutModel.init(mode:paymentChoices:)(a3, (uint64_t)a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  AMSExpressCheckoutModel *v5;

  v4 = a3;
  v5 = self;
  sub_18C95BA60(v4);

}

- (AMSExpressCheckoutModel)initWithCoder:(id)a3
{
  return (AMSExpressCheckoutModel *)ExpressCheckoutModel.init(coder:)(a3);
}

- (AMSExpressCheckoutModel)init
{
  ExpressCheckoutModel.init()();
}

- (void).cxx_destruct
{

}

@end
