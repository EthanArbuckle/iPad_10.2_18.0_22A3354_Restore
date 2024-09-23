@implementation VTTileCompressionSessionCopyProperty

CFTypeRef __VTTileCompressionSessionCopyProperty_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 88);
  if (result)
    result = CFRetain(result);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

CFTypeRef __VTTileCompressionSessionCopyProperty_block_invoke_2(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 104);
  if (result)
    result = CFRetain(result);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

CFTypeRef __VTTileCompressionSessionCopyProperty_block_invoke_3(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 112);
  if (result)
    result = CFRetain(result);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

@end
