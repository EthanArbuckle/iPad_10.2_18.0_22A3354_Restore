@implementation CTRadioAccessTechnology

- (CTRadioAccessTechnology)init
{
  CTRadioAccessTechnology *v2;
  CTTelephonyNetworkInfo *v3;
  CTTelephonyNetworkInfo *networkInfo;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CTRadioAccessTechnology;
  v2 = -[CTRadioAccessTechnology init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CTTelephonyNetworkInfo);
    networkInfo = v2->_networkInfo;
    v2->_networkInfo = v3;

  }
  return v2;
}

- (CTRadioAccessTechnology)initWithCTTelephonyNetworkInfo:(id)a3
{
  id v5;
  CTRadioAccessTechnology *v6;
  CTRadioAccessTechnology *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTRadioAccessTechnology;
  v6 = -[CTRadioAccessTechnology init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_networkInfo, a3);

  return v7;
}

- (NSString)radioAccessTechnology
{
  return -[CTTelephonyNetworkInfo currentRadioAccessTechnology](self->_networkInfo, "currentRadioAccessTechnology");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkInfo, 0);
}

@end
