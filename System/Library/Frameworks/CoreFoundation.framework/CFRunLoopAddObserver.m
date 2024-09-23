@implementation CFRunLoopAddObserver

unint64_t __CFRunLoopAddObserver_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 vars0;

  return CFLog(3, (uint64_t)CFSTR("Attempting to add observer to main runloop, but the main thread has exited. This message will only log once. Break on _CFRunLoopError_MainThreadHasExited to debug."), a3, a4, a5, a6, a7, a8, vars0);
}

@end
