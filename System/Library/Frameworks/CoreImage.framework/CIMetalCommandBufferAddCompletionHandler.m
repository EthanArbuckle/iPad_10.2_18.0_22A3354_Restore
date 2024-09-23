@implementation CIMetalCommandBufferAddCompletionHandler

uint64_t __CIMetalCommandBufferAddCompletionHandler_block_invoke(uint64_t a1, void *a2)
{
  CIAbortIfICSAndUnsuccessfulCommandBufferExecution(a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
