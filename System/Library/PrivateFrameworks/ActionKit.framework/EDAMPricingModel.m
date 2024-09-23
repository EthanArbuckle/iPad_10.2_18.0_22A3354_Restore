@implementation EDAMPricingModel

+ (id)structName
{
  return CFSTR("PricingModel");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_646;
  if (!structFields_structFields_646)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 2, 1, CFSTR("gnomeActive"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 2, 1, CFSTR("gnomeWarmingPeriod"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 10, 1, CFSTR("pricingModelStart"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)structFields_structFields_646;
    structFields_structFields_646 = v6;

    v2 = (void *)structFields_structFields_646;
  }
  return v2;
}

- (NSNumber)gnomeActive
{
  return self->_gnomeActive;
}

- (void)setGnomeActive:(id)a3
{
  objc_storeStrong((id *)&self->_gnomeActive, a3);
}

- (NSNumber)gnomeWarmingPeriod
{
  return self->_gnomeWarmingPeriod;
}

- (void)setGnomeWarmingPeriod:(id)a3
{
  objc_storeStrong((id *)&self->_gnomeWarmingPeriod, a3);
}

- (NSNumber)pricingModelStart
{
  return self->_pricingModelStart;
}

- (void)setPricingModelStart:(id)a3
{
  objc_storeStrong((id *)&self->_pricingModelStart, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pricingModelStart, 0);
  objc_storeStrong((id *)&self->_gnomeWarmingPeriod, 0);
  objc_storeStrong((id *)&self->_gnomeActive, 0);
}

@end
