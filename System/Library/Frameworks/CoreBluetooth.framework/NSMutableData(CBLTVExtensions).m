@implementation NSMutableData(CBLTVExtensions)

- (BOOL)appendCBLTVType:()CBLTVExtensions bytes:length:error:
{
  _BYTE v13[2];

  if (a5 >= 0xFF)
  {
    if (a6)
    {
      CBErrorF(-6743, (uint64_t)"LTV length too big: %zu > 0xFE", a3, a4, a5, (uint64_t)a6, a7, a8, a5);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v13[0] = a5 + 1;
    v13[1] = a3;
    objc_msgSend(a1, "appendBytes:length:", v13, 2);
    if (a5)
      objc_msgSend(a1, "appendBytes:length:", a4, a5);
  }
  return a5 < 0xFF;
}

- (uint64_t)appendCBLTVType:()CBLTVExtensions sint64:
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v12 = 0;
  if (a4 == (char)a4)
  {
    LOBYTE(v12) = 2;
    BYTE1(v12) = a3;
    BYTE2(v12) = a4;
    v4 = 3;
  }
  else if ((a4 + 0x800000) >> 23 > 2)
  {
    if (a4 == (int)a4)
    {
      LOBYTE(v12) = 5;
      BYTE1(v12) = a3;
      WORD1(v12) = a4;
      BYTE4(v12) = BYTE2(a4);
      v6 = a4 >> 24;
      v4 = 6;
      BYTE5(v12) = v6;
    }
    else if ((a4 + 0x8000000000) >> 39 > 2)
    {
      if ((a4 + 0x800000000000) >> 47 > 2)
      {
        if ((a4 + 0x80000000000000) >> 55 > 2)
        {
          LOBYTE(v12) = 9;
          BYTE1(v12) = a3;
          WORD1(v12) = a4;
          BYTE4(v12) = BYTE2(a4);
          BYTE5(v12) = BYTE3(a4);
          BYTE6(v12) = BYTE4(a4);
          HIBYTE(v12) = BYTE5(a4);
          LOBYTE(v13) = BYTE6(a4);
          v10 = HIBYTE(a4);
          v4 = 10;
          HIBYTE(v13) = v10;
        }
        else
        {
          LOBYTE(v12) = 8;
          v9 = HIWORD(a4);
          BYTE1(v12) = a3;
          WORD1(v12) = a4;
          BYTE4(v12) = BYTE2(a4);
          BYTE5(v12) = BYTE3(a4);
          BYTE6(v12) = BYTE4(a4);
          HIBYTE(v12) = BYTE5(a4);
          v4 = 9;
          LOBYTE(v13) = v9;
        }
      }
      else
      {
        LOBYTE(v12) = 7;
        BYTE1(v12) = a3;
        WORD1(v12) = a4;
        BYTE4(v12) = BYTE2(a4);
        BYTE5(v12) = BYTE3(a4);
        BYTE6(v12) = BYTE4(a4);
        v8 = a4 >> 40;
        v4 = 8;
        HIBYTE(v12) = v8;
      }
    }
    else
    {
      LOBYTE(v12) = 6;
      BYTE1(v12) = a3;
      WORD1(v12) = a4;
      BYTE4(v12) = BYTE2(a4);
      BYTE5(v12) = BYTE3(a4);
      v7 = HIDWORD(a4);
      v4 = 7;
      BYTE6(v12) = v7;
    }
  }
  else
  {
    LOBYTE(v12) = 4;
    BYTE1(v12) = a3;
    WORD1(v12) = a4;
    v5 = a4 >> 16;
    v4 = 5;
    BYTE4(v12) = v5;
  }
  return objc_msgSend(a1, "appendBytes:length:", &v12, v4);
}

- (uint64_t)appendCBLTVType:()CBLTVExtensions uint64:
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v12 = 0;
  if (a4 > 0xFF)
  {
    v5 = a4 >> 16;
    if (a4 >> 16)
    {
      v6 = a4 >> 24;
      if (a4 >> 24)
      {
        v7 = HIDWORD(a4);
        if (HIDWORD(a4))
        {
          v8 = a4 >> 40;
          if (a4 >> 40)
          {
            v9 = HIWORD(a4);
            if (HIWORD(a4))
            {
              v10 = HIBYTE(a4);
              if (HIBYTE(a4))
              {
                LOBYTE(v12) = 9;
                BYTE1(v12) = a3;
                WORD1(v12) = a4;
                BYTE4(v12) = BYTE2(a4);
                BYTE5(v12) = BYTE3(a4);
                BYTE6(v12) = BYTE4(a4);
                HIBYTE(v12) = BYTE5(a4);
                LOBYTE(v13) = BYTE6(a4);
                v4 = 10;
                HIBYTE(v13) = v10;
              }
              else
              {
                LOBYTE(v12) = 8;
                BYTE1(v12) = a3;
                WORD1(v12) = a4;
                BYTE4(v12) = BYTE2(a4);
                BYTE5(v12) = BYTE3(a4);
                BYTE6(v12) = BYTE4(a4);
                HIBYTE(v12) = BYTE5(a4);
                v4 = 9;
                LOBYTE(v13) = v9;
              }
            }
            else
            {
              LOBYTE(v12) = 7;
              BYTE1(v12) = a3;
              WORD1(v12) = a4;
              BYTE4(v12) = BYTE2(a4);
              BYTE5(v12) = BYTE3(a4);
              BYTE6(v12) = BYTE4(a4);
              v4 = 8;
              HIBYTE(v12) = v8;
            }
          }
          else
          {
            LOBYTE(v12) = 6;
            BYTE1(v12) = a3;
            WORD1(v12) = a4;
            BYTE4(v12) = BYTE2(a4);
            BYTE5(v12) = BYTE3(a4);
            v4 = 7;
            BYTE6(v12) = v7;
          }
        }
        else
        {
          LOBYTE(v12) = 5;
          BYTE1(v12) = a3;
          WORD1(v12) = a4;
          BYTE4(v12) = BYTE2(a4);
          v4 = 6;
          BYTE5(v12) = v6;
        }
      }
      else
      {
        LOBYTE(v12) = 4;
        BYTE1(v12) = a3;
        WORD1(v12) = a4;
        v4 = 5;
        BYTE4(v12) = v5;
      }
    }
    else
    {
      LOBYTE(v12) = 3;
      BYTE1(v12) = a3;
      WORD1(v12) = a4;
      v4 = 4;
    }
  }
  else
  {
    LOBYTE(v12) = 2;
    BYTE1(v12) = a3;
    BYTE2(v12) = a4;
    v4 = 3;
  }
  return objc_msgSend(a1, "appendBytes:length:", &v12, v4);
}

@end
