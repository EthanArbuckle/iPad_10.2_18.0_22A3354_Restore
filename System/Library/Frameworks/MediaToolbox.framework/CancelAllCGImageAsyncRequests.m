@implementation CancelAllCGImageAsyncRequests

CFTypeRef __surrogateAIG_CancelAllCGImageAsyncRequests_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 24);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
