@implementation CFRunLoopAddSource

unint64_t __CFRunLoopAddSource_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 vars0;

  return CFLog(3, (uint64_t)CFSTR("Attempting to add source to main runloop, but the main thread has exited. This message will only log once. Break on _CFRunLoopError_MainThreadHasExited to debug."), a3, a4, a5, a6, a7, a8, vars0);
}

unint64_t __CFRunLoopAddSource_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return CFLog(3, (uint64_t)CFSTR("Attempting to add a runloop source %p to runloop %p in mode '%@', but the port associated with this source does not have a receive right. This means your source will never be signalled and is likely an error. Break on __CFRunLoopError_AddingSourceLackingReceiveRight to debug. This message will only appear once per execution."), a3, a4, a5, a6, a7, a8, *(_OWORD *)(a1 + 32));
}

@end
