@implementation NSObserver

CFMutableSetRef __35____NSObserver_observerWithCenter___block_invoke()
{
  CFMutableSetRef result;
  CFSetCallBacks v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  memset(&v1, 0, sizeof(v1));
  *(_OWORD *)&v1.retain = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 8);
  result = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, &v1);
  qword_1ECD098E8 = (uint64_t)result;
  return result;
}

@end
