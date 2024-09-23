@implementation CPLineBreaker

- (void)breakLinesInParagraph:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;

  objc_msgSend(a3, "bounds");
  v5 = v4;
  v7 = v6;
  v8 = objc_msgSend(a3, "count");
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = v5 + v7;
    do
    {
      v13 = v10;
      v10 = (void *)objc_msgSend(a3, "childAtIndex:", v11);
      if ((_DWORD)v11)
      {
        v14 = (void *)objc_msgSend(v13, "charSequence");
        if (v14)
        {
          v15 = v14;
          v16 = objc_msgSend(v14, "length");
          if (v16)
          {
            v17 = objc_msgSend(v15, "charAtIndex:", (v16 - 1));
            v18 = *(void **)(*(_QWORD *)(v17 + 160) + 64);
            if (v18)
            {
              objc_msgSend(v18, "spaceWidth");
              v20 = v19 * *(double *)(*(_QWORD *)(v17 + 160) + 72);
            }
            else
            {
              v20 = 0.0;
            }
            v21 = objc_msgSend(v10, "firstWord");
            if (v21)
            {
              v22 = v21;
              objc_msgSend(v13, "bounds");
              if (*(double *)(v22 + 32) + v20 + v23 + v24 <= v12)
                objc_msgSend(v13, "setLineBreakAfter:", 1);
            }
          }
        }
      }
      v11 = (v11 + 1);
    }
    while (v9 != (_DWORD)v11);
  }
}

- (void)breakLinesIn:(id)a3
{
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CPLineBreaker breakLinesInParagraph:](self, "breakLinesInParagraph:", a3);
  }
  else
  {
    v5 = objc_msgSend(a3, "count");
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      do
      {
        v8 = objc_msgSend(a3, "childAtIndex:", v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[CPLineBreaker breakLinesIn:](self, "breakLinesIn:", v8);
        v7 = (v7 + 1);
      }
      while (v6 != (_DWORD)v7);
    }
  }
}

+ (void)breakLinesInPage:(id)a3
{
  CPLineBreaker *v4;

  v4 = objc_alloc_init(CPLineBreaker);
  -[CPLineBreaker breakLinesIn:](v4, "breakLinesIn:", a3);

}

@end
