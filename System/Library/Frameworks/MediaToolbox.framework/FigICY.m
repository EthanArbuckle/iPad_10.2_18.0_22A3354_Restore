@implementation FigICY

uint64_t __FigICY_ResumeHTTP_block_invoke()
{
  uint64_t Owner;
  uint64_t DerivedStorage;
  OpaqueCMBlockBuffer *ValueAtIndex;
  OpaqueCMBlockBuffer *v3;
  size_t DataLength;
  __CFArray *v5;
  int v6;
  const void *v7;

  FigRetainProxyRetain();
  FigRetainProxyLockMutex();
  if (!FigRetainProxyIsInvalidated())
  {
    Owner = FigRetainProxyGetOwner();
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    while (CFArrayGetCount(*(CFArrayRef *)(DerivedStorage + 360)) >= 1)
    {
      ValueAtIndex = (OpaqueCMBlockBuffer *)CFArrayGetValueAtIndex(*(CFArrayRef *)(DerivedStorage + 360), 0);
      v3 = ValueAtIndex;
      if (ValueAtIndex)
        CFRetain(ValueAtIndex);
      DataLength = CMBlockBufferGetDataLength(v3);
      v5 = *(__CFArray **)(DerivedStorage + 360);
      *(_QWORD *)(DerivedStorage + 368) -= DataLength;
      CFArrayRemoveValueAtIndex(v5, 0);
      if (*(_BYTE *)(DerivedStorage + 377) && !CFArrayGetCount(*(CFArrayRef *)(DerivedStorage + 360)))
      {
        *(_BYTE *)(DerivedStorage + 377) = 0;
        v6 = 1;
      }
      else
      {
        v6 = 0;
      }
      CMBlockBufferGetDataLength(v3);
      FigICY_HTTPCommonCallback(Owner, v3, v6, 0);
      if (v3)
        CFRelease(v3);
      if (FigRetainProxyIsInvalidated() || !*(_BYTE *)(DerivedStorage + 19))
        goto LABEL_19;
    }
    if (!*(_QWORD *)(DerivedStorage + 320))
    {
      *(_BYTE *)(DerivedStorage + 376) = 0;
      v7 = *(const void **)(DerivedStorage + 96);
      if (*(_QWORD *)(DerivedStorage + 208))
      {
        FigICY_CreateHTTPRequest(Owner, v7, 1);
      }
      else
      {
        FigICY_CreateHTTPRequest(Owner, v7, 0);
        *(_BYTE *)(DerivedStorage + 21) = 1;
      }
    }
  }
LABEL_19:
  FigRetainProxyUnlockMutex();
  FigRetainProxyRelease();
  return FigRetainProxyRelease();
}

@end
