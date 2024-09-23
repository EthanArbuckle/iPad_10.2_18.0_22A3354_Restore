@implementation NSAttributedString

void __90__NSAttributedString_CSVisualizerMethods__cs_writeToFileHandle_supportingANSIEscapeCodes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  int v9;
  CSStore2 *v10;
  NSNumber *v11;
  CSStore2 *v12;
  int v13;
  CSStore2 *v14;
  NSNumber *v15;
  CSStore2 *v16;
  int v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  id v24;

  v24 = a2;
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("_CSVOutputType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "isEqual:", &unk_1E4E255B0))
  {
    fputs("\x1B[1m", *(FILE **)(a1 + 40));
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("_CSVFGColor"));
  v10 = (CSStore2 *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  if (v10)
  {
    v13 = CSStore2::ansiColorCodeFromNSNumber(v10, v11);
    fprintf(*(FILE **)(a1 + 40), "\x1B[38;5;%um", v13);
    v9 = 1;
  }

  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("_CSVBGColor"));
  v14 = (CSStore2 *)objc_claimAutoreleasedReturnValue();
  v16 = v14;
  if (v14)
  {
    v17 = CSStore2::ansiColorCodeFromNSNumber(v14, v15);
    fprintf(*(FILE **)(a1 + 40), "\x1B[48;5;%um", v17);
    v9 = 1;
  }

  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("_CSVLink"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && !+[_CSVisualizer getUnit:inTable:fromURL:](_CSVisualizer, "getUnit:inTable:fromURL:", 0, 0, v18))
    {
      fputs("\x1B[4;38;5;27m", *(FILE **)(a1 + 40));
      v9 = 1;
    }
  }

  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("_CSVFWeight"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (_NSIsNSNumber())
    {
      objc_msgSend(v19, "doubleValue");
      if (v20 > 0.0)
      {
        fputs("\x1B[1m", *(FILE **)(a1 + 40));
        v9 = 1;
      }
    }
  }

  v21 = (void *)MEMORY[0x1A85AA4B4]();
  objc_msgSend(*(id *)(a1 + 32), "string");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "substringWithRange:", a3, a4);
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  fputs((const char *)objc_msgSend(v23, "UTF8String"), *(FILE **)(a1 + 40));

  objc_autoreleasePoolPop(v21);
  if (v9)
    fputs("\x1B[0m", *(FILE **)(a1 + 40));

}

char *__64__NSAttributedString_CSVisualizerMethods__cs_writeToFileHandle___block_invoke()
{
  char *result;

  result = getenv("TERM");
  -[NSAttributedString(CSVisualizerMethods) cs_writeToFileHandle:]::TERM = result != 0;
  return result;
}

@end
