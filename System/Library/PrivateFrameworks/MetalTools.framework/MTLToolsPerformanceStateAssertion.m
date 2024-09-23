@implementation MTLToolsPerformanceStateAssertion

- (int64_t)requestedPerformanceState
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "requestedPerformanceState");
}

- (BOOL)wasPerformanceStateAssertionMaintained
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "wasPerformanceStateAssertionMaintained");
}

@end
