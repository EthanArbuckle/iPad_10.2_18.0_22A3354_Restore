@implementation CPBuilder

- (void)cluster:(id)a3 andPutTextLinesInto:(id)a4
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CPTextLine *v13;

  v6 = objc_msgSend(a4, "page");
  v7 = objc_msgSend(a3, "count");
  v8 = objc_msgSend(a4, "textLinesInZone");
  if (v7 >= 1)
  {
    v9 = (void *)v8;
    v10 = 0;
    v11 = v7;
    do
    {
      v12 = (void *)objc_msgSend(a3, "objectAtIndex:", v10);
      if (objc_msgSend(v12, "length"))
      {
        v13 = objc_alloc_init(CPTextLine);
        -[CPObject setPage:](v13, "setPage:", v6);
        -[CPTextLine setCharSequence:](v13, "setCharSequence:", v12);
        if (objc_msgSend(v12, "wasMerged"))
          -[CPTextLine setBaselineToNull](v13, "setBaselineToNull");
        else
          -[CPTextLine setBaseline:](v13, "setBaseline:", *(double *)(objc_msgSend(v12, "charAtIndex:", 0) + 104));
        objc_msgSend(v9, "addObject:", v13);
        +[CPCluster clusterTextLine:](CPCluster, "clusterTextLine:", v13);

      }
      ++v10;
    }
    while (v11 != v10);
  }
}

- (void)prepareZone:(id)a3
{
  unsigned int v5;
  CPTextLineMaker *v6;
  CPTextLineMaker *v7;

  objc_msgSend(a3, "mapSafely:target:childrenOfClass:", sel_prepareZone_, self, objc_opt_class());
  v7 = objc_alloc_init(CPTextLineMaker);
  v5 = -[CPTextLineMaker makeTextLines:](v7, "makeTextLines:", a3);
  v6 = v7;
  if (v5)
  {
    -[CPBuilder cluster:andPutTextLinesInto:](self, "cluster:andPutTextLinesInto:", -[CPTextLineMaker textLines](v7, "textLines"), a3);
    if (v5 == 1
      && +[CPHighlighter reconstructHighlightFor:](CPHighlighter, "reconstructHighlightFor:", a3))
    {

      return;
    }
    objc_msgSend(a3, "sortUsingSelector:", sel_compareYDescending_);
    v6 = v7;
  }

  +[CPGraphicMaker makeCombinedShapesIn:](CPGraphicMaker, "makeCombinedShapesIn:", a3);
}

@end
