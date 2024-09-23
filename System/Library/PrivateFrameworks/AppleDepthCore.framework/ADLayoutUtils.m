@implementation ADLayoutUtils

+ (unint64_t)layoutForSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  uint64_t v5;
  float v6;
  unint64_t v7;
  int v8;
  double v9;
  double v10;
  int v12;
  CGFloat v13;
  __int16 v14;
  CGFloat v15;
  uint64_t v16;

  height = a3.height;
  width = a3.width;
  v5 = 0;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3.width / a3.height;
  while (1)
  {
    v7 = qword_2363E1500[v5];
    +[ADLayoutUtils aspectRatioForKnownLayout:](ADLayoutUtils, "aspectRatioForKnownLayout:", v7);
    LODWORD(v9) = v8;
    *(float *)&v10 = v6;
    if (+[ADLayoutUtils aspectRatio:matchesAspectRatio:](ADLayoutUtils, "aspectRatio:matchesAspectRatio:", v10, v9))
    {
      break;
    }
    if (++v5 == 4)
    {
      if (ADDebugUtilsADVerboseLogsEnabled)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v12 = 134218240;
          v13 = width;
          v14 = 2048;
          v15 = height;
          _os_log_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Size %2.2fx%2.2f does not match any known layout", (uint8_t *)&v12, 0x16u);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        v12 = 134218240;
        v13 = width;
        v14 = 2048;
        v15 = height;
        _os_log_debug_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Size %2.2fx%2.2f does not match any known layout", (uint8_t *)&v12, 0x16u);
      }
      return 254;
    }
  }
  return v7;
}

+ (float)aspectRatioForKnownLayout:(unint64_t)a3
{
  float result;

  result = 0.0;
  if (a3 <= 3)
    return flt_2363DF710[a3];
  return result;
}

+ (BOOL)aspectRatio:(float)a3 matchesAspectRatio:(float)a4
{
  return fabs((float)(a3 / a4) + -1.0) < 0.07;
}

+ (id)layoutAsString:(unint64_t)a3
{
  __CFString *v4;
  id result;
  uint8_t buf[4];
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("kADLayoutLandscape_4_3");
  switch(a3)
  {
    case 0uLL:
      goto LABEL_12;
    case 1uLL:
      result = CFSTR("kADLayoutPortrait_3_4");
      break;
    case 2uLL:
      result = CFSTR("kADLayoutLandscape_16_9");
      break;
    case 3uLL:
      result = CFSTR("kADLayoutPortrait_9_16");
      break;
    default:
      if (a3 == 254)
      {
        result = CFSTR("kADLayoutUnknown");
      }
      else if (a3 == 255)
      {
        result = CFSTR("kADLayoutDefault");
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v7 = a3;
          _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unknown layout numbered: %lu", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), a3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:
        result = v4;
      }
      break;
  }
  return result;
}

+ (unint64_t)transposeLayout:(unint64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a3 < 4)
    return qword_2363E1500[a3];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    +[ADLayoutUtils layoutAsString:](ADLayoutUtils, "layoutAsString:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Cannot get transpose layout for layout %@", (uint8_t *)&v6, 0xCu);

  }
  return 254;
}

+ (BOOL)isLandscape:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

+ (BOOL)isLandscapeSize:(CGSize)a3
{
  return a3.width > a3.height;
}

@end
