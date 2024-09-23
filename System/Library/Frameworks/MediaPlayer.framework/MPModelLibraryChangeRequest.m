@implementation MPModelLibraryChangeRequest

+ (NSOperationQueue)sharedOperationQueue
{
  if (sharedOperationQueue_onceToken != -1)
    dispatch_once(&sharedOperationQueue_onceToken, &__block_literal_global_9352);
  return (NSOperationQueue *)(id)sharedOperationQueue___sharedQueue;
}

uint64_t __51__MPModelLibraryChangeRequest_sharedOperationQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)sharedOperationQueue___sharedQueue;
  sharedOperationQueue___sharedQueue = (uint64_t)v0;

  objc_msgSend((id)sharedOperationQueue___sharedQueue, "setMaxConcurrentOperationCount:", 10);
  objc_msgSend((id)sharedOperationQueue___sharedQueue, "setName:", CFSTR("com.apple.MediaPlayer.MPModelLibraryChangeRequest.sharedOperationQueue"));
  return objc_msgSend((id)sharedOperationQueue___sharedQueue, "setQualityOfService:", 25);
}

@end
