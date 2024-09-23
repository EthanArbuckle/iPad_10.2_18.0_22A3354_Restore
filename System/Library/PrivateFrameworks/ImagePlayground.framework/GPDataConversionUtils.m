@implementation GPDataConversionUtils

+ (id)convertFloat16ToFloat32:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  id v6;
  __int16 *v7;
  id v8;
  _DWORD *v9;
  uint64_t v10;
  __int16 v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 4 * (v4 >> 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v3);
  v7 = (__int16 *)objc_msgSend(v6, "bytes");
  v8 = objc_retainAutorelease(v5);
  v9 = (_DWORD *)objc_msgSend(v8, "mutableBytes");
  if (v4 >= 2)
  {
    if (v4 >> 1 <= 1)
      v10 = 1;
    else
      v10 = v4 >> 1;
    do
    {
      v11 = *v7++;
      _H0 = v11;
      __asm { FCVT            S0, H0 }
      *v9++ = _S0;
      --v10;
    }
    while (v10);
  }

  return v8;
}

@end
