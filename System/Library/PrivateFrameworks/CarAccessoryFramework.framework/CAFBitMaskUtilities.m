@implementation CAFBitMaskUtilities

+ (BOOL)bitmask:(unint64_t)a3 hasOption:(unint64_t)a4
{
  return (a4 & a3) != 0;
}

+ (unint64_t)bitmask:(unint64_t)a3 setOption:(unint64_t)a4 on:(BOOL)a5
{
  if (a5)
    return a4 | a3;
  else
    return a3 & ~a4;
}

+ (id)description:(unint64_t)a3
{
  return +[CAFBitMaskUtilities description:optionCount:](CAFBitMaskUtilities, "description:optionCount:", a3, 64);
}

+ (id)description:(unint64_t)a3 optionCount:(unsigned __int8)a4
{
  void *v6;
  unint64_t v7;

  v6 = (void *)objc_opt_new();
  v7 = 1;
  do
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("%d"), (v7 & a3) != 0);
    v7 *= 2;
  }
  while (v7 <= 1 << (a4 - 1));
  return v6;
}

+ (int64_t)compareBitmask1:(unint64_t)a3 bitmask2:(unint64_t)a4 optionsSort:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  int64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = a5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v14 = objc_msgSend(a1, "bitmask:hasOption:", a3, objc_msgSend(v13, "unsignedLongLongValue", (_QWORD)v17));
        if (v14 != objc_msgSend(a1, "bitmask:hasOption:", a4, objc_msgSend(v13, "unsignedLongLongValue")))
        {
          if (v14)
            v15 = -1;
          else
            v15 = 1;
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_13:

  return v15;
}

@end
