@implementation BYCellularNetworkInformation

- (int64_t)homeMCC
{
  return self->_homeMCC;
}

- (void)setHomeMCC:(int64_t)a3
{
  self->_homeMCC = a3;
}

- (int64_t)homeMNC
{
  return self->_homeMNC;
}

- (void)setHomeMNC:(int64_t)a3
{
  self->_homeMNC = a3;
}

- (int64_t)networkMCC
{
  return self->_networkMCC;
}

- (void)setNetworkMCC:(int64_t)a3
{
  self->_networkMCC = a3;
}

- (int64_t)networkMNC
{
  return self->_networkMNC;
}

- (void)setNetworkMNC:(int64_t)a3
{
  self->_networkMNC = a3;
}

- (NSString)homeCountryISOCode
{
  return self->_homeCountryISOCode;
}

- (void)setHomeCountryISOCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)homeSubregionISOCodes
{
  return self->_homeSubregionISOCodes;
}

- (void)setHomeSubregionISOCodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)networkCountryISOCode
{
  return self->_networkCountryISOCode;
}

- (void)setNetworkCountryISOCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)networkSubregionISOCodes
{
  return self->_networkSubregionISOCodes;
}

- (void)setNetworkSubregionISOCodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkSubregionISOCodes, 0);
  objc_storeStrong((id *)&self->_networkCountryISOCode, 0);
  objc_storeStrong((id *)&self->_homeSubregionISOCodes, 0);
  objc_storeStrong((id *)&self->_homeCountryISOCode, 0);
}

@end
