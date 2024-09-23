@implementation KmlCancelMessage

- (id)initWithCCCErrorCode:(id)result
{
  uint64_t v3;
  int v4;
  objc_super v5;

  if (result)
  {
    v5.receiver = result;
    v5.super_class = (Class)KmlCancelMessage;
    result = objc_msgSendSuper2(&v5, sel_init);
    if (result)
    {
      v3 = 0;
      *((_BYTE *)result + 8) = a2;
      while (LOBYTE(KmlCCCErrorConversionMap[v3 + 1]) != a2)
      {
        v3 += 2;
        if (v3 == 8)
        {
          v4 = 105;
          goto LABEL_8;
        }
      }
      v4 = KmlCCCErrorConversionMap[v3];
LABEL_8:
      *((_DWORD *)result + 3) = v4;
    }
  }
  return result;
}

- (id)asData
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    +[KmlTlv TLVWithTag:unsignedChar:]((uint64_t)KmlTlv, 109, *(_BYTE *)(a1 + 8));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    -[KmlTlv asData]((uint64_t)v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[KmlTlv TLVWithTag:value:]((uint64_t)KmlTlv, 32620, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[KmlTlv asData]((uint64_t)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
