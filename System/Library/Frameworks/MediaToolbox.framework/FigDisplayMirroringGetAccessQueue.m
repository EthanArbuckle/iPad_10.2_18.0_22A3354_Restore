@implementation FigDisplayMirroringGetAccessQueue

dispatch_queue_t __FigDisplayMirroringGetAccessQueue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.coremedia.displaymirroringobserver", 0);
  FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringAccessQueue = (uint64_t)result;
  return result;
}

@end
