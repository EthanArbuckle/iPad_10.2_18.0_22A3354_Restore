@implementation NSString(MSVLyricsTTMLParser)

- (double)msvl_timeValue
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR(":"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  if ((unint64_t)objc_msgSend(v2, "count") >= 2)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", objc_msgSend(v2, "count") - 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v5 + (double)objc_msgSend(v6, "integerValue") * 60.0;

    if ((unint64_t)objc_msgSend(v2, "count") >= 3)
    {
      v7 = os_log_create("com.apple.amp.MediaServices", "LyricsTTMLParser");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138412290;
        v10 = a1;
        _os_log_impl(&dword_1A077D000, v7, OS_LOG_TYPE_DEFAULT, "Warning: time format should specify [minutes:]seconds only; other components are ignored: %@",
          (uint8_t *)&v9,
          0xCu);
      }

    }
  }

  return v5;
}

- (BOOL)msvl_isElementType:()MSVLyricsTTMLParser
{
  return objc_msgSend(a1, "caseInsensitiveCompare:") == 0;
}

@end
