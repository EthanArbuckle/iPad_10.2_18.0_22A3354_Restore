@implementation CPTextLineMaker

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPTextLineMaker;
  -[CPTextLineMaker dealloc](&v3, sel_dealloc);
}

- (id)textLines
{
  return self->textLines;
}

- (void)splitByGraphic:(id)a3 with:(CPPDFContext *)a4
{
  objc_msgSend(a3, "removeSubsequences:whereTrue:passing:", self->textLines, graphicBetween, a4);
}

- (void)zOrderSplitLines:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;

  v5 = -[NSMutableArray count](self->textLines, "count");
  if (v5)
  {
    v6 = 0;
    do
    {
      v7 = (void *)-[NSMutableArray objectAtIndex:](self->textLines, "objectAtIndex:", v6);
      v10 = 0xFFFFFFFFLL;
      objc_msgSend(v7, "map:passing:", MinMax, &v10);
      v9 = v10;
      v8 = HIDWORD(v10);
      if (objc_msgSend(v7, "length") != v8 - v9 + 1)
        -[CPTextLineMaker splitByGraphic:with:](self, "splitByGraphic:with:", v7, objc_msgSend(a3, "PDFContext"));
      ++v6;
    }
    while (v5 != v6);
  }
}

- (unsigned)makeTextLines:(id)a3
{
  void *v5;
  unsigned int result;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CPTextLineMerge *v26;
  int v27;
  uint64_t v28;

  v5 = (void *)objc_msgSend(a3, "charactersInZone");
  result = objc_msgSend(v5, "length");
  if (result)
  {
    v7 = result;
    self->textLines = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(a3, "hasRotatedCharacters"))
      objc_msgSend(v5, "sortByAnchorYDecreasingXIncreasingApprox");
    else
      objc_msgSend(v5, "sortByAnchorYDecreasingXIncreasing");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
    objc_msgSend(v5, "splitToSubsequences:whereTrue:passing:", v8, compareBaseline, 0);
    v9 = objc_msgSend(v8, "count");
    if (!v9)
      __assert_rtn("-[CPTextLineMaker makeTextLines:]", "CPTextLineMaker.m", 213, "count>0");
    v10 = (void *)objc_msgSend(v8, "objectAtIndex:", 0);
    -[NSMutableArray addObject:](self->textLines, "addObject:", v10);
    if (v9 != 1)
    {
      v11 = v9;
      for (i = 1; i != v11; ++i)
      {
        v13 = (void *)objc_msgSend(v8, "objectAtIndex:", i);
        v14 = 0.0;
        v15 = 0.0;
        if (objc_msgSend(v10, "length"))
        {
          v16 = objc_msgSend(v10, "charAtIndex:", 0);
          if (v16)
            v15 = *(double *)(v16 + 104);
        }
        if (objc_msgSend(v13, "length"))
        {
          v17 = objc_msgSend(v13, "charAtIndex:", 0);
          if (v17)
            v14 = *(double *)(v17 + 104);
        }
        v18 = 0.0;
        v19 = 0.0;
        if (objc_msgSend(v10, "length"))
        {
          v20 = objc_msgSend(v10, "charAtIndex:", 0);
          if (v20)
            v19 = *(double *)(v20 + 168);
        }
        if (objc_msgSend(v13, "length"))
        {
          v21 = objc_msgSend(v13, "charAtIndex:", 0);
          if (v21)
            v18 = *(double *)(v21 + 168);
        }
        v22 = vabdd_f64(v15, v14);
        v23 = vabdd_f64(v19, v18);
        v24 = vabdd_f64(v19 + -360.0, v18);
        if (v23 >= v24)
          v23 = v24;
        v25 = vabdd_f64(v19, v18 + -360.0);
        if (v23 >= v25)
          v23 = v25;
        if (v22 >= 1.2 || v23 >= 0.5)
        {
          -[NSMutableArray addObject:](self->textLines, "addObject:", v13, v23);
          v10 = v13;
        }
        else
        {
          objc_msgSend(v10, "mergeByAnchorXIncreasingYDecreasing:", v13);
        }
      }
    }

    v26 = objc_alloc_init(CPTextLineMerge);
    -[CPTextLineMerge mergeLinesIn:](v26, "mergeLinesIn:", self->textLines);

    v27 = -[NSMutableArray count](self->textLines, "count");
    v28 = (v27 - 1);
    if (v27 - 1 >= 0)
    {
      do
      {
        if (!objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->textLines, "objectAtIndex:", v28), "length"))-[NSMutableArray removeObjectAtIndex:](self->textLines, "removeObjectAtIndex:", v28);
      }
      while (v28-- > 0);
    }
    -[CPTextLineMaker zOrderSplitLines:](self, "zOrderSplitLines:", objc_msgSend(a3, "page"));
    return -[NSMutableArray count](self->textLines, "count");
  }
  return result;
}

@end
