@implementation NSNumber(ZhuGe)

+ (id)integerFromCInt:()ZhuGe size:isSigned:needSwap:
{
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  unint64_t v25;
  unint64_t v26;
  void *v28;

  v9 = a3;
  v10 = 0;
  if (a3)
  {
    v11 = a3;
    do
    {
      ++v10;
      v12 = v11 >= 0x100;
      v11 >>= 8;
    }
    while (v12);
  }
  if (a4 > 8 || ((1 << a4) & 0x116) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(524800, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSNumber+ZhuGe.m", "+[NSNumber(ZhuGe) integerFromCInt:size:isSigned:needSwap:]", 31, CFSTR("Required size is %@, while usually it should be %@ or %@ or %@ or %@"), v14, v15, v16, (uint64_t)v13);

  }
  if (v10 > a4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(524800, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSNumber+ZhuGe.m", "+[NSNumber(ZhuGe) integerFromCInt:size:isSigned:needSwap:]", 36, CFSTR("Bits will be truncated since real size is %@, while required size is %@"), v18, v19, v20, (uint64_t)v17);

    v9 &= 0xFFFFFFFFFFFFFFFFLL >> (-8 * a4);
  }
  v21 = &unk_2507C86F8;
  switch(a4)
  {
    case 0uLL:
      return v21;
    case 1uLL:
      if ((a5 & 1) != 0)
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", (char)v9);
      else
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v9);
      goto LABEL_27;
    case 2uLL:
      v24 = bswap32(v9) >> 16;
      if (!a6)
        LOWORD(v24) = v9;
      if ((a5 & 1) != 0)
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", (__int16)v24);
      else
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", (unsigned __int16)v24);
      goto LABEL_27;
    case 3uLL:
    case 4uLL:
      v22 = bswap32(v9);
      if (a6)
        v23 = v22;
      else
        v23 = v9;
      if ((a5 & 1) != 0)
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v23);
      else
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v23);
      goto LABEL_27;
    default:
      v25 = bswap64(v9);
      if (a6)
        v26 = v25;
      else
        v26 = v9;
      if ((a5 & 1) != 0)
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v26);
      else
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v26);
LABEL_27:
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      return v21;
  }
}

+ (id)integerFromData:()ZhuGe size:truncate:isSigned:needSwap:
{
  id v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  _BOOL4 v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;

  v12 = a3;
  v13 = v12;
  v32 = 0;
  if (v12)
  {
    v14 = objc_msgSend(v12, "length");
    v15 = v14;
    v17 = v14 > 8 || v14 > a4;
    if (v17)
    {
      v18 = CFSTR("LSB");
      if (!a5)
        v18 = CFSTR("MSB");
      v30 = (uint64_t)v18;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v14);
      v31 = a7;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 8);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog(524800, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSNumber+ZhuGe.m", "+[NSNumber(ZhuGe) integerFromData:size:truncate:isSigned:needSwap:]", 122, CFSTR("Data %@ might be truncated(data size %@, required size %@, maximum supported size %@)"), v21, v22, v23, v30);

      a7 = v31;
    }
    v24 = 8;
    if (a4 < 8)
      v24 = a4;
    if (v17)
      v25 = v24;
    else
      v25 = v15;
    if (a5 == 1)
      v26 = v15 - v25;
    else
      v26 = 0;
    objc_msgSend(v13, "getBytes:range:", &v32, v26);
    objc_msgSend(a1, "integerFromCInt:size:isSigned:needSwap:", v32, a4, a6, a7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

+ (id)BOOLFromData:()ZhuGe needNegate:
{
  id v5;
  void *v6;
  id v7;
  _BYTE *v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = objc_retainAutorelease(v5);
    v8 = (_BYTE *)objc_msgSend(v7, "bytes");
    v9 = objc_msgSend(v7, "length");
    if (*v8)
      v10 = 1;
    else
      v10 = memcmp(v8, v8 + 1, v9 - 1) != 0;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10 ^ a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
