@implementation INSExtensionServiceTraceCompletionHandlerWithCode

uint64_t __INSExtensionServiceTraceCompletionHandlerWithCode_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return kdebug_trace();
}

@end
