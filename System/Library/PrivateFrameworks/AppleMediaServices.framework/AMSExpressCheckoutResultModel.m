@implementation AMSExpressCheckoutResultModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  AMSExpressCheckoutResultModel *v5;

  v4 = a3;
  v5 = self;
  sub_18C95E73C(v4);

}

- (AMSExpressCheckoutResultModel)initWithCoder:(id)a3
{
  return (AMSExpressCheckoutResultModel *)AMSEngagementResult.ResultModel.init(coder:)((uint64_t)a3);
}

- (AMSExpressCheckoutResultModel)init
{
  AMSEngagementResult.ResultModel.init()();
}

- (void).cxx_destruct
{

}

@end
