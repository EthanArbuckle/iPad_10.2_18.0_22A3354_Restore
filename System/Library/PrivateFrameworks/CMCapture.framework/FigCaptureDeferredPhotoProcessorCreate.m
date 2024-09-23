@implementation FigCaptureDeferredPhotoProcessorCreate

void __FigCaptureDeferredPhotoProcessorCreate_block_invoke(uint64_t a1)
{
  const void *v1;

  v1 = (const void *)objc_msgSend(*(id *)(a1 + 32), "retainReferencedObject");
  captureDeferredPhotoProcessor_terminateImmediatelyDueToError((uint64_t)v1, 4294950475);
  if (v1)
    CFRelease(v1);
}

@end
