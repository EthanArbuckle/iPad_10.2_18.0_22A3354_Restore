@implementation AFHasPerfPowerEntitlement

void __AFHasPerfPowerEntitlement_block_invoke()
{
  id v0;

  AFProcessGetValueForEntitlement(CFSTR("com.apple.PerfPowerServices.data-donation"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    AFHasPerfPowerEntitlement_hasEntitlement = objc_msgSend(v0, "BOOLValue");

}

@end
