@implementation BSRunLoopPerformRelativeToCACommit

void __BSRunLoopPerformRelativeToCACommit_block_invoke(uint64_t a1, __CFRunLoopObserver *a2)
{
  uint64_t v4;
  __CFRunLoop *Current;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  Current = CFRunLoopGetCurrent();
  CFRunLoopRemoveObserver(Current, a2, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

@end
