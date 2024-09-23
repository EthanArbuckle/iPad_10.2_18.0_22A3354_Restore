@implementation NTKPhotosLoadQueue

void ___NTKPhotosLoadQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.NanoTimeKit.NTKPhotosFaceView.photoLoadQ", v2);
  v1 = (void *)_NTKPhotosLoadQueue___photoLoadQueue;
  _NTKPhotosLoadQueue___photoLoadQueue = (uint64_t)v0;

}

@end
