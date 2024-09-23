@implementation HandleEndpointCopyActiveEndpointMessage

CFTypeRef __HandleEndpointCopyActiveEndpointMessage_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = (CFTypeRef)gActiveEndpoint;
  if (gActiveEndpoint)
    result = CFRetain((CFTypeRef)gActiveEndpoint);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
