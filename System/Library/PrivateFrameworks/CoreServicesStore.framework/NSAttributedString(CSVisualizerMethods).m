@implementation NSAttributedString(CSVisualizerMethods)

- (uint64_t)cs_writeToFileHandle:()CSVisualizerMethods
{
  int v5;
  _BOOL8 v6;

  v5 = fileno(a3);
  if (v5 < 0 || !isatty(v5))
  {
    v6 = 0;
  }
  else
  {
    if (-[NSAttributedString(CSVisualizerMethods) cs_writeToFileHandle:]::once != -1)
      dispatch_once(&-[NSAttributedString(CSVisualizerMethods) cs_writeToFileHandle:]::once, &__block_literal_global_648);
    v6 = -[NSAttributedString(CSVisualizerMethods) cs_writeToFileHandle:]::TERM != 0;
  }
  return objc_msgSend(a1, "cs_writeToFileHandle:supportingANSIEscapeCodes:", a3, v6);
}

- (void)cs_writeToFileHandle:()CSVisualizerMethods supportingANSIEscapeCodes:
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[6];

  if (a4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __90__NSAttributedString_CSVisualizerMethods__cs_writeToFileHandle_supportingANSIEscapeCodes___block_invoke;
    v10[3] = &unk_1E4E22170;
    v10[4] = a1;
    v10[5] = a3;
    v6 = (void *)MEMORY[0x1A85AA61C](v10);
    v7 = (void *)MEMORY[0x1A85AA4B4]();
    objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, objc_msgSend(a1, "length"), 0, v6);
    objc_autoreleasePoolPop(v7);

  }
  else
  {
    v8 = (void *)MEMORY[0x1A85AA4B4]();
    objc_msgSend(a1, "string");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    fputs((const char *)objc_msgSend(v9, "UTF8String"), a3);

    objc_autoreleasePoolPop(v8);
  }
}

- (id)cs_rangesMatchingPredicate:()CSVisualizerMethods
{
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *__p;
  _QWORD *v13;
  uint64_t v14;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85AA4B4]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __p = 0;
  v13 = 0;
  v14 = 0;
  +[_CSVisualizerPredicate getRanges:matchingPredicate:inDescription:](_CSVisualizerPredicate, "getRanges:matchingPredicate:inDescription:", &__p, v4, a1);
  v7 = __p;
  v8 = v13;
  if (__p != v13)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", *v7, v7[1]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

      v7 += 2;
    }
    while (v7 != v8);
  }
  v10 = (void *)objc_msgSend(v6, "copy");
  if (__p)
  {
    v13 = __p;
    operator delete(__p);
  }

  objc_autoreleasePoolPop(v5);
  return v10;
}

@end
