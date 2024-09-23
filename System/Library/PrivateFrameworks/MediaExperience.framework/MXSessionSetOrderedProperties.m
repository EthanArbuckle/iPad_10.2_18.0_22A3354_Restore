@implementation MXSessionSetOrderedProperties

CFTypeRef __MXSessionSetOrderedProperties_block_invoke(uint64_t a1)
{
  CFTypeRef result;
  CFTypeRef *v3;

  result = (CFTypeRef)objc_msgSend(*(id *)(a1 + 40), "setOrderedProperties:usingErrorHandlingStrategy:outPropertiesErrors:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (_DWORD)result;
  v3 = *(CFTypeRef **)(a1 + 56);
  if (v3)
  {
    result = *v3;
    if (*v3)
      return CFRetain(result);
  }
  return result;
}

@end
