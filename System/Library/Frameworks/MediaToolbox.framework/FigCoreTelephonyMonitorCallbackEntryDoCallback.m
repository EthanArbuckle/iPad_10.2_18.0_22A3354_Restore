@implementation FigCoreTelephonyMonitorCallbackEntryDoCallback

void __FigCoreTelephonyMonitorCallbackEntryDoCallback_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;

  v2 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v2)
  {
    v3 = (const void *)v2;
    (*(void (**)(uint64_t, _QWORD))(a1 + 40))(v2, *(unsigned __int8 *)(a1 + 48));
    CFRelease(v3);
  }
  v4 = *(const void **)(a1 + 32);
  if (v4)
    CFRelease(v4);
}

@end
