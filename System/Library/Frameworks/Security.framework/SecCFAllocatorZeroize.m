@implementation SecCFAllocatorZeroize

CFAllocatorRef __SecCFAllocatorZeroize_block_invoke()
{
  CFAllocatorRef result;
  CFAllocatorContext context;

  CFAllocatorGetContext((CFAllocatorRef)*MEMORY[0x1E0C9AE18], (CFAllocatorContext *)&sDefaultCtx);
  context.version = 0;
  *(_OWORD *)&context.info = unk_1ECD35A30;
  context.release = (CFAllocatorReleaseCallBack)qword_1ECD35A40;
  context.copyDescription = (CFAllocatorCopyDescriptionCallBack)SecCFAllocatorCopyDescription;
  *(_OWORD *)&context.allocate = *(_OWORD *)&algn_1ECD35A48[8];
  context.deallocate = (CFAllocatorDeallocateCallBack)SecCFAllocatorDeallocate;
  context.preferredSize = (CFAllocatorPreferredSizeCallBack)qword_1ECD35A68;
  result = CFAllocatorCreate(0, &context);
  SecCFAllocatorZeroize_sAllocator = (uint64_t)result;
  return result;
}

@end
