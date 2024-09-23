@implementation AKNoteAnnotationHelper

+ (id)newPopupAnnotationWithParent:(id)a3 onPageController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  char v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVisualStyle:", objc_opt_isKindOfClass() & 1);

  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "setVisualStyle:", 0);
    v12 = *MEMORY[0x24BDBF090];
    v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  else
  {
    objc_opt_self();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_isKindOfClass();

    if ((v17 & 1) != 0)
    {
      objc_msgSend(v8, "setVisualStyle:", 1);
      objc_msgSend(a1, "_boundsForClosedPopupAnnotation:havingParent:onPageController:", v8, v6, v7);
      v12 = v18;
      v13 = v19;
      v14 = v20;
      v15 = v21;
    }
    else
    {
      v12 = *MEMORY[0x24BDBF070];
      v13 = *(double *)(MEMORY[0x24BDBF070] + 8);
      v14 = *(double *)(MEMORY[0x24BDBF070] + 16);
      v15 = *(double *)(MEMORY[0x24BDBF070] + 24);
      NSLog(CFSTR("%s: parentAnnotation is of an unexpected class"), "+[AKNoteAnnotationHelper newPopupAnnotationWithParent:onPageController:]");
    }
  }
  objc_msgSend(v8, "setRectangle:", v12, v13, v14, v15);
  objc_msgSend(a1, "_boundsForOpenPopupAnnotation:withClosedBounds:havingParent:onPageController:", v8, v6, v7, v12, v13, v14, v15);
  objc_msgSend(v8, "setOpenRectangle:");

  return v8;
}

+ (CGRect)_boundsForClosedPopupAnnotation:(id)a3 havingParent:(id)a4 onPageController:(id)a5
{
  id v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  v6 = a5;
  objc_msgSend(a4, "drawingBounds");
  x = v23.origin.x;
  y = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;
  CGRectGetMaxX(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  CGRectGetMaxY(v24);
  objc_msgSend(v6, "maxPageRect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v25.origin.x = v12;
  v25.origin.y = v14;
  v25.size.width = v16;
  v25.size.height = v18;
  CGRectInset(v25, 6.0, 6.0);
  MEMORY[0x24BEDD108](AKGeometryHelper, sel_constrainRect_withinRect_);
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

+ (CGRect)_boundsForOpenPopupAnnotation:(id)a3 withClosedBounds:(CGRect)a4 havingParent:(id)a5 onPageController:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a6;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  CGRectGetMaxX(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  CGRectGetMinY(v24);
  objc_msgSend(v10, "maxPageRect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v25.origin.x = v12;
  v25.origin.y = v14;
  v25.size.width = v16;
  v25.size.height = v18;
  CGRectInset(v25, 6.0, 6.0);
  MEMORY[0x24BEDD108](AKGeometryHelper, sel_constrainRect_withinRect_);
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

@end
