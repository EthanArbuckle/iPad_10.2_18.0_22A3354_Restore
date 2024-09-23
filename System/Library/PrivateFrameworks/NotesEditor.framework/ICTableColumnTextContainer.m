@implementation ICTableColumnTextContainer

- (CGRect)lineFragmentRectForProposedRect:(CGRect)a3 atIndex:(unint64_t)a4 writingDirection:(int64_t)a5 remainingRect:(CGRect *)a6
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _QWORD v30[2];
  objc_super v31;
  CGRect result;

  v31.receiver = self;
  v31.super_class = (Class)ICTableColumnTextContainer;
  -[ICTextContainer lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:](&v31, sel_lineFragmentRectForProposedRect_atIndex_writingDirection_remainingRect_, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_opt_class();
  -[ICTableColumnTextContainer layoutManager](self, "layoutManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "columnTextStorage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "tableLayoutManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = 0;
  v30[1] = 0;
  objc_msgSend(v18, "rowAtIndex:rowRange:", a4, v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30[0] == a4)
  {
    objc_msgSend(v19, "rowPositions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v19, "rowPositions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "doubleValue");
      v11 = v25;

    }
  }

  v26 = v9;
  v27 = v11;
  v28 = v13;
  v29 = v15;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)setSize:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  objc_super v8;

  width = a3.width;
  -[ICTableColumnTextContainer size](self, "size", a3.width, a3.height);
  if (width != v6 || v5 != 1.79769313e308)
  {
    v8.receiver = self;
    v8.super_class = (Class)ICTableColumnTextContainer;
    -[ICTableColumnTextContainer setSize:](&v8, sel_setSize_, width, 1.79769313e308);
  }
}

@end
