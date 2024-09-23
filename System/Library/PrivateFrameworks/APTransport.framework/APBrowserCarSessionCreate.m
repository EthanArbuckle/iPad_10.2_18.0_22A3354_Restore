@implementation APBrowserCarSessionCreate

NSObject *__APBrowserCarSessionCreate_block_invoke(uint64_t a1)
{
  NSObject *result;

  carSessionBrowser_dispatchEvent(*(const void **)(a1 + 32), 8, 0);
  result = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
  if (result)
    return dispatch_semaphore_signal(result);
  return result;
}

@end
