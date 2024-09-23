@implementation NTKSubmitFaceSupportMessage

void __NTKSubmitFaceSupportMessage_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "ntkfs_analyticsEventName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();

}

uint64_t __NTKSubmitFaceSupportMessage_block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ntkfs_analyticsJSONRepresentation");
}

@end
