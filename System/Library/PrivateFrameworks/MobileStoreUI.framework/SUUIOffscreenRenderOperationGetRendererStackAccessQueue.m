@implementation SUUIOffscreenRenderOperationGetRendererStackAccessQueue

void ___SUUIOffscreenRenderOperationGetRendererStackAccessQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIOffscreenRenderOperation.RendererStackAccessQueue", MEMORY[0x24BDAC9C0]);
  v1 = (void *)_SUUIOffscreenRenderOperationGetRendererStackAccessQueue_sRendererStacAccessQueue;
  _SUUIOffscreenRenderOperationGetRendererStackAccessQueue_sRendererStacAccessQueue = (uint64_t)v0;

}

@end
