@implementation SIResumeIndex

uint64_t __SIResumeIndex_block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 672))
    *(_BYTE *)(v1 + 672) = 0;
  return result;
}

dispatch_queue_t __SIResumeIndex_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("index flush suspend queue", 0);
  gFlushSuspendQueue = (uint64_t)result;
  return result;
}

@end
