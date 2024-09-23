@implementation MXSessionCopyProperties

CFTypeRef __MXSessionCopyProperties_block_invoke(uint64_t a1)
{
  CFTypeRef result;
  CFTypeRef *v3;

  result = (CFTypeRef)objc_msgSend(*(id *)(a1 + 40), "copyProperties:outPropertyErrors:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
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
