@implementation SOSViewsGetV0SubviewSet

CFMutableSetRef __SOSViewsGetV0SubviewSet_block_invoke(uint64_t a1)
{
  CFMutableSetRef result;

  result = SOSViewCopyViewSet(4u);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

@end
