@implementation NSData(ZhuGe)

+ (id)dataFromHexString:()ZhuGe
{
  id v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  BOOL v14;
  BOOL v15;
  char v16;
  char v18;
  char __str[3];

  v3 = a3;
  __str[2] = 0;
  v18 = 0;
  if (objc_msgSend(v3, "length")
    && (v4 = objc_msgSend(v3, "length"), v4 == (objc_msgSend(v3, "length") & 0xFFFFFFFFFFFFFFFELL)))
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    v6 = objc_msgSend(v3, "length");
    if (v6 >= 2)
    {
      v7 = 0;
      v8 = v6 >> 1;
      while (2)
      {
        __str[0] = objc_msgSend(v3, "characterAtIndex:", 2 * v7);
        v9 = 1;
        v10 = objc_msgSend(v3, "characterAtIndex:", (2 * v7) | 1);
        v11 = 0;
        __str[1] = v10;
        do
        {
          v12 = __str[v11];
          v13 = __str[v11];
          v14 = v12 >= 48 && v13 - 58 >= 7;
          if (!v14 || (v13 <= 0x66 ? (v15 = v13 - 71 > 0x19) : (v15 = 0), !v15))
          {

            goto LABEL_20;
          }
          v16 = v9;
          v9 = 0;
          v11 = 1;
        }
        while ((v16 & 1) != 0);
        v18 = strtol(__str, 0, 16);
        objc_msgSend(v5, "appendBytes:length:", &v18, 1);
        if (++v7 != v8)
          continue;
        break;
      }
    }
  }
  else
  {
LABEL_20:
    v5 = 0;
  }

  return v5;
}

@end
