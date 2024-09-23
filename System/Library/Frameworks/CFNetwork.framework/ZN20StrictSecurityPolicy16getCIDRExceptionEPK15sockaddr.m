@implementation ZN20StrictSecurityPolicy16getCIDRExceptionEPK15sockaddr

const UInt8 *___ZN20StrictSecurityPolicy16getCIDRExceptionEPK15sockaddr_in_4_6h_block_invoke(uint64_t a1, uint64_t a2, CFDictionaryRef theDict)
{
  const __CFData *Value;
  const UInt8 *result;
  const UInt8 *v8;
  const __CFData *v9;
  const UInt8 *BytePtr;
  uint64_t v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  int v19;
  int v20;
  unint64_t v21;
  const __CFNumber *v22;
  unsigned __int8 v23;
  unsigned __int8 valuePtr;

  Value = (const __CFData *)CFDictionaryGetValue(theDict, CFSTR("NSParsedCIDRAddressKey"));
  result = CFDataGetBytePtr(Value);
  if (result)
  {
    v8 = result;
    if (result[1] == *(unsigned __int8 *)(a1 + 56))
    {
      v9 = (const __CFData *)CFDictionaryGetValue(theDict, CFSTR("NSParsedCIDRMaskKey"));
      BytePtr = CFDataGetBytePtr(v9);
      v11 = *(_QWORD *)(a1 + 48);
      v12 = (unsigned __int8 *)(v11 + 8);
      v13 = (unsigned __int8 *)(v8 + 8);
      v14 = (unsigned __int8 *)(BytePtr + 8);
      v15 = (unsigned __int8 *)(v11 + 4);
      if (*(_BYTE *)(a1 + 56) == 2)
        v13 = (unsigned __int8 *)(v8 + 4);
      else
        v15 = v12;
      if (*(_BYTE *)(a1 + 56) == 2)
      {
        v14 = (unsigned __int8 *)(BytePtr + 4);
        v16 = 4;
      }
      else
      {
        v16 = 16;
      }
      if (((*v13 ^ *v15) & *v14) != 0)
      {
        v17 = 1;
      }
      else
      {
        v18 = 1;
        while (v16 != v18)
        {
          v19 = v14[v18];
          v20 = v13[v18] ^ v15[v18];
          ++v18;
          if ((v20 & v19) != 0)
          {
            v21 = v18 - 1;
            goto LABEL_16;
          }
        }
        v21 = v16;
LABEL_16:
        v17 = v21 < v16;
      }
      valuePtr = 0;
      v22 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("NSParsedCIDRPrefixKey"));
      result = (const UInt8 *)CFNumberGetValue(v22, kCFNumberSInt8Type, &valuePtr);
      if (!v17 && (_DWORD)result)
      {
        v23 = valuePtr;
        if (valuePtr >= *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v23;
        }
      }
    }
  }
  return result;
}

@end
