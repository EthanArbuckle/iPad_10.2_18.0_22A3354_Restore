@implementation CMIOExtensionPropertyForPropertyAddressInDictionary

uint64_t __CMIOExtensionPropertyForPropertyAddressInDictionary_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  void *v8;
  void *v9;
  void *v10;

  result = objc_msgSend(a2, "hasPrefix:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    v8 = (void *)objc_msgSend(a2, "substringWithRange:", 9, 5);
    if (*(_DWORD *)(a1 + 68) == 707406378
      || (v9 = v8, (objc_msgSend(v8, "hasPrefix:", CFSTR("****_")) & 1) != 0)
      || (result = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 40)), (_DWORD)result))
    {
      result = objc_msgSend(a2, "substringWithRange:", 14, 4);
      if (*(_DWORD *)(a1 + 72) == -1
        || (v10 = (void *)result, result = objc_msgSend((id)result, "hasPrefix:", CFSTR("****")), (result & 1) != 0)
        || (result = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 48)), (_DWORD)result))
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = a2;
        *a4 = 1;
      }
    }
  }
  return result;
}

@end
