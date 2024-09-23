@implementation AMSFraudReportCallURL

uint64_t __AMSFraudReportCallURL_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "dataTaskPromiseWithRequest:", a2);
}

@end
