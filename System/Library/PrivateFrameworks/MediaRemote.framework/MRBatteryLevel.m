@implementation MRBatteryLevel

- (NSNumber)leftPercentage
{
  return self->_leftPercentage;
}

- (NSNumber)rightPercentage
{
  return self->_rightPercentage;
}

- (NSNumber)singlePercentage
{
  return self->_singlePercentage;
}

- (NSNumber)casePercentage
{
  return self->_casePercentage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_casePercentage, 0);
  objc_storeStrong((id *)&self->_singlePercentage, 0);
  objc_storeStrong((id *)&self->_rightPercentage, 0);
  objc_storeStrong((id *)&self->_leftPercentage, 0);
}

@end
