@implementation TMSetSourceAvailable

uint64_t __TMSetSourceAvailable_block_invoke(uint64_t result)
{
  if (_lastMessages)
    return objc_msgSend((id)_lastMessages, "removeObjectForKey:", *(_QWORD *)(result + 32));
  return result;
}

@end
