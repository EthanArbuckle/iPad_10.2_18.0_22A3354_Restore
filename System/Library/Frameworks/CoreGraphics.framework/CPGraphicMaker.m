@implementation CPGraphicMaker

+ (void)combineShapesIn:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v10;
  int v11;
  int v12;
  int v13;
  char v14;
  double v15;
  double v16;
  double v17;

  objc_msgSend(a3, "sortUsingSelector:", sel_compareInsertionOrder_);
  if ((unint64_t)objc_msgSend(a3, "count") >= 2)
  {
    v4 = 2;
    while (1)
    {
      v5 = (void *)objc_msgSend(a3, "objectAtIndex:", v4 - 2);
      v6 = (void *)objc_msgSend(a3, "objectAtIndex:", v4 - 1);
      v7 = objc_msgSend(v5, "insertionOrder");
      v8 = objc_msgSend(v6, "insertionOrder");
      if (v8 == v7 || v7 + 1 == v8)
      {
        if (objc_msgSend(v6, "hasFill"))
          v10 = objc_msgSend(v6, "hasStroke");
        else
          v10 = 0;
        v11 = objc_msgSend(v5, "hasFill");
        v12 = objc_msgSend(v5, "hasStroke");
        v13 = objc_msgSend(v6, "hasFill");
        v14 = objc_msgSend(v6, "hasStroke");
        if (v11 && (v14 & 1) != 0)
        {
          if ((v10 & 1) == 0)
            goto LABEL_16;
          v10 = 1;
        }
        else if (((v13 & v12 ^ 1 | v10) & 1) == 0)
        {
LABEL_16:
          objc_msgSend(v6, "left");
          v16 = v15;
          objc_msgSend(v5, "left");
          if (v16 == v17 && objc_msgSend(v6, "canCombineWith:", v5))
          {
            objc_msgSend(v5, "addShape:", v6);
            objc_msgSend(a3, "removeObjectAtIndex:", v4 - 1);
          }
        }
      }
      else
      {
        v10 = 0;
      }
      if (objc_msgSend(a3, "count") > v4)
      {
        ++v4;
        if (!v10)
          continue;
      }
      return;
    }
  }
}

+ (void)makeCombinedShapesIn:(id)a3
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a3, "childrenOfClass:into:", objc_opt_class(), v4);
  +[CPGraphicMaker combineShapesIn:](CPGraphicMaker, "combineShapesIn:", v4);

}

@end
