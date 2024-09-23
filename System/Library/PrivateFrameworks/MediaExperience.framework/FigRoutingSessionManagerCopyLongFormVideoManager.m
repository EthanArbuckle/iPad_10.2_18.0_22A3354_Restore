@implementation FigRoutingSessionManagerCopyLongFormVideoManager

CFTypeRef __FigRoutingSessionManagerCopyLongFormVideoManager_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = (CFTypeRef)sLongFormVideoManager;
  if (sLongFormVideoManager)
    result = CFRetain((CFTypeRef)sLongFormVideoManager);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
