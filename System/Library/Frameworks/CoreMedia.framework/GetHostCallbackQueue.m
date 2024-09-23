@implementation GetHostCallbackQueue

dispatch_queue_t __GetHostCallbackQueue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("FigHALAudioHostCallbackQueue", 0);
  GetHostCallbackQueue_sCallbackQueue = (uint64_t)result;
  return result;
}

@end
