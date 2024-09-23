@implementation CMIOExtensionPropertyForPropertyAddressInSet

uint64_t __CMIOExtensionPropertyForPropertyAddressInSet_block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;
  void *v7;
  void *v8;
  void *v9;

  result = objc_msgSend(a2, "hasPrefix:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    v7 = (void *)objc_msgSend(a2, "substringWithRange:", 9, 5);
    if (*(_DWORD *)(a1 + 68) == 707406378
      || (v8 = v7, (objc_msgSend(v7, "hasPrefix:", CFSTR("****_")) & 1) != 0)
      || (result = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 40)), (_DWORD)result))
    {
      result = objc_msgSend(a2, "substringWithRange:", 14, 4);
      if (*(_DWORD *)(a1 + 72) == -1
        || (v9 = (void *)result, result = objc_msgSend((id)result, "hasPrefix:", CFSTR("****")), (result & 1) != 0)
        || (result = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 48)), (_DWORD)result))
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = a2;
        *a3 = 1;
      }
    }
  }
  return result;
}

@end
