@implementation NSData

+ (id)bcs_dataWithHexString:(uint64_t)a1
{
  id v2;
  _BYTE *v3;
  unint64_t v4;
  _BYTE *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  char *v10;
  char __str[2];
  char v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_opt_self();
  if ((objc_msgSend(v2, "length") & 1) != 0)
  {
    ABSLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "+[NSData(BCSHexString) bcs_dataWithHexString:]";
      v15 = 2112;
      v16 = v2;
      _os_log_impl(&dword_20ACAD000, v7, OS_LOG_TYPE_DEFAULT, "%s - Hex strings should have an even number of digits (%@)", buf, 0x16u);
    }

LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v12 = 0;
  v3 = malloc_type_malloc((unint64_t)objc_msgSend(v2, "length") >> 1, 0xF2716DC8uLL);
  if (objc_msgSend(v2, "length"))
  {
    v4 = 0;
    v5 = v3;
    while (1)
    {
      __str[0] = objc_msgSend(v2, "characterAtIndex:", v4);
      __str[1] = objc_msgSend(v2, "characterAtIndex:", v4 + 1);
      v10 = 0;
      *v5 = strtol(__str, &v10, 16);
      if (v10 != &v12)
        break;
      ++v5;
      v4 += 2;
      if (v4 >= objc_msgSend(v2, "length"))
        goto LABEL_6;
    }
    free(v3);
    ABSLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "+[NSData(BCSHexString) bcs_dataWithHexString:]";
      v15 = 2112;
      v16 = v2;
      v17 = 2048;
      v18 = v4;
      _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s - String should be all hex digits: %@ (bad digit around %ld)", buf, 0x20u);
    }

    goto LABEL_13;
  }
LABEL_6:
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v3, (unint64_t)objc_msgSend(v2, "length") >> 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v6;
}

@end
