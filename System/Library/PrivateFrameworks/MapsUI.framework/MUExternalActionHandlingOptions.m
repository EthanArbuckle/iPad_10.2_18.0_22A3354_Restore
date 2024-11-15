@implementation MUExternalActionHandlingOptions

- (int)analyticsTarget
{
  return self->_analyticsTarget;
}

- (void)setAnalyticsTarget:(int)a3
{
  self->_analyticsTarget = a3;
}

- (NSString)analyticsEventValue
{
  return self->_analyticsEventValue;
}

- (void)setAnalyticsEventValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)analyticsModuleType
{
  return self->_analyticsModuleType;
}

- (void)setAnalyticsModuleType:(int64_t)a3
{
  self->_analyticsModuleType = a3;
}

- (BOOL)forcePunchout
{
  return self->_forcePunchout;
}

- (void)setForcePunchout:(BOOL)a3
{
  self->_forcePunchout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEventValue, 0);
}

@end
