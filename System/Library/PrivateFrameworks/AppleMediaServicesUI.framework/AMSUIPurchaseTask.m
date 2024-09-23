@implementation AMSUIPurchaseTask

- (Class)paymentSheetTaskClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)isPaymentSheetEnablementAvailable
{
  return _os_feature_enabled_impl();
}

@end
