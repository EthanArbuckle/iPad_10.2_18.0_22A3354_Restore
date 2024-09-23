@implementation FigHapticQueueCreate

void __FigHapticQueueCreate_block_invoke()
{
  uint64_t v0;
  const void *v1;

  v0 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v0)
  {
    v1 = (const void *)v0;
    fhq_scheduleWaitingHapticPlayers(v0);
    CFRelease(v1);
  }
}

void __FigHapticQueueCreate_block_invoke_2(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
