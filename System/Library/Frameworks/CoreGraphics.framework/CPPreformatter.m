@implementation CPPreformatter

- (void)preformatInParagraph:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[3];
  uint64_t v11;

  v11 = 0;
  if (objc_msgSend(a3, "isPreformattedWithUnitWidth:", &v11))
  {
    objc_msgSend((id)objc_msgSend(a3, "parent"), "bounds");
    v5 = v4;
    v6 = objc_msgSend(a3, "count");
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      do
      {
        v9 = (void *)objc_msgSend(a3, "childAtIndex:", v8);
        v10[0] = v9;
        v10[1] = v11;
        v10[2] = v5;
        objc_msgSend(v9, "mapToWordsWithIndex:passing:", insertSpacesBefore, v10);
        v8 = (v8 + 1);
        if (v8 < v7)
          objc_msgSend(v9, "setLineBreakAfter:", 1);
      }
      while (v7 != (_DWORD)v8);
    }
  }
}

- (void)preformatIn:(id)a3
{
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CPPreformatter preformatInParagraph:](self, "preformatInParagraph:", a3);
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
          -[CPPreformatter preformatIn:](self, "preformatIn:", v8);
        v7 = (v7 + 1);
      }
      while (v6 != (_DWORD)v7);
    }
  }
}

+ (void)preformatInPage:(id)a3
{
  CPPreformatter *v4;

  v4 = objc_alloc_init(CPPreformatter);
  -[CPPreformatter preformatIn:](v4, "preformatIn:", a3);

}

@end
