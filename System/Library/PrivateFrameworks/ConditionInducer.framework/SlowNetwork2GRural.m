@implementation SlowNetwork2GRural

+ (id)description
{
  return +[SlowNetworkCondition descriptionWithProfileParamsForProfile:](SlowNetworkCondition, "descriptionWithProfileParamsForProfile:", CFSTR("2G-Rural"));
}

+ (id)profileFriendlyName
{
  return CFSTR("2G Network - poor");
}

- (SlowNetwork2GRural)init
{
  SlowNetwork2GRural *v2;
  void *v3;
  id v4;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v6.receiver = self;
  v6.super_class = (Class)SlowNetwork2GRural;
  v2 = -[SlowNetworkCondition initWithProfile:](&v6, sel_initWithProfile_, CFSTR("2G-Rural"));
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v3 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v8 = v3;
    v4 = v3;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%@ Init passed", buf, 0xCu);

  }
  return v2;
}

@end
