@implementation CUMainQueue

dispatch_queue_t __CUMainQueue_block_invoke()
{
  dispatch_queue_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  result = dispatch_queue_create_with_target_V2("CUMainQueue", 0, MEMORY[0x1E0C80D38]);
  CUMainQueue_sQueue = (uint64_t)result;
  if (!result)
    FatalErrorF((uint64_t)"Create wrapper main queue failed", v1, v2, v3, v4, v5, v6, v7, vars0);
  return result;
}

@end
