@implementation AAPaymentUIRequest

- (id)urlString
{
  void *v2;
  void *v3;

  +[AAURLConfiguration urlConfiguration](AAURLConfiguration, "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentInfoUIURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
