@implementation SecKeyDecrypt

const __CFData *__SecKeyDecrypt_block_invoke(uint64_t a1, const __CFData *a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  __CFData *DecryptedDataWithParameters;
  const __CFData *v8;
  const UInt8 *BytePtr;
  const UInt8 *v10;
  CFIndex Length;
  unsigned __int8 *v12;

  DecryptedDataWithParameters = SecKeyCreateDecryptedDataWithParameters(*(_QWORD *)(a1 + 32), *(const void **)(a1 + 40), a2, 0, a5);
  v8 = DecryptedDataWithParameters;
  if (DecryptedDataWithParameters)
  {
    if (*(__CFString **)(a1 + 40) == CFSTR("algid:encrypt:RSA:raw"))
    {
      BytePtr = CFDataGetBytePtr(DecryptedDataWithParameters);
      if (!*BytePtr)
      {
        v10 = BytePtr;
        Length = CFDataGetLength(v8);
        a4[1] = Length;
        if (!*v10)
        {
          v12 = (unsigned __int8 *)(v10 + 1);
          do
          {
            if (Length-- < 1)
              break;
            ++*a4;
            a4[1] = Length;
          }
          while (!*v12++);
        }
      }
    }
  }
  return v8;
}

@end
