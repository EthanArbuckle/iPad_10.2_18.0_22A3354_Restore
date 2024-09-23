@implementation HKFixedCurrentCountryCodeProvider

- (HKFixedCurrentCountryCodeProvider)initWithCountryCode:(id)a3
{
  id v4;
  HKFixedCurrentCountryCodeProvider *v5;
  uint64_t v6;
  NSString *countryCode;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFixedCurrentCountryCodeProvider;
  v5 = -[HKFixedCurrentCountryCodeProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v6;

  }
  return v5;
}

- (id)currentCountryCode
{
  return self->_countryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end
