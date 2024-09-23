@implementation FigCPEExternalProtectionMonitorCopyProperty

CFTypeRef __FigCPEExternalProtectionMonitorCopyProperty_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 144) + 40);
  if (result)
    result = CFRetain(result);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

@end
