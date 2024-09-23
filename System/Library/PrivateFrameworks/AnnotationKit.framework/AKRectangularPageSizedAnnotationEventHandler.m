@implementation AKRectangularPageSizedAnnotationEventHandler

- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7
{
  id v12;
  id v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat MidX;
  CGFloat MidY;
  objc_super v29;
  CGRect v30;
  CGRect v31;

  v12 = a6;
  v13 = a7;
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 20)
  {
    objc_msgSend(v14, "rectangle");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[AKAnnotationEventHandler windowPointFromEvent:orRecognizer:](self, "windowPointFromEvent:orRecognizer:", v12, v13);
    -[AKAnnotationEventHandler modelPointFromPointInWindow:](self, "modelPointFromPointInWindow:");
    v24 = v23;
    v26 = v25;
    v30.origin.x = v16;
    v30.origin.y = v18;
    v30.size.width = v20;
    v30.size.height = v22;
    MidX = CGRectGetMidX(v30);
    v31.origin.x = v16;
    v31.origin.y = v18;
    v31.size.width = v20;
    v31.size.height = v22;
    MidY = CGRectGetMidY(v31);
    a3->x = v24;
    a3->y = v26;
    a4->x = MidX;
    a4->y = MidY;
    a5->x = MidX;
    a5->y = MidY;
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)AKRectangularPageSizedAnnotationEventHandler;
    -[AKRectangularAnnotationEventHandler getInitialDraggedPoint:otherPoint:center:forEvent:orRecognizer:](&v29, sel_getInitialDraggedPoint_otherPoint_center_forEvent_orRecognizer_, a3, a4, a5, v12, v13);
  }

}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double width;
  double height;
  double MidX;
  double MidY;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  objc_super v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  y = a3.y;
  x = a3.x;
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 20)
  {
    -[AKAnnotationEventHandler pageController](self, "pageController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAnnotationEventHandler initialDraggedPoint](self, "initialDraggedPoint");
    v11 = x - v10;
    v13 = y - v12;
    objc_msgSend(v8, "rectangle");
    v14 = v50.origin.x;
    v15 = v50.origin.y;
    width = v50.size.width;
    height = v50.size.height;
    MidX = CGRectGetMidX(v50);
    v51.origin.x = v14;
    v51.origin.y = v15;
    v51.size.width = width;
    v51.size.height = height;
    MidY = CGRectGetMidY(v51);
    -[AKAnnotationEventHandler initialCenter](self, "initialCenter");
    v22 = v14 + v11 - (MidX - v20);
    v23 = v15 + v13 - (MidY - v21);
    objc_msgSend(v9, "geometryHelper");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "contentAlignedPointForPoint:", v22, v23);
    v26 = v25;
    v28 = v27;

    -[AKRectangularPageSizedAnnotationEventHandler _validateAnnotationRectForDrag:](self, "_validateAnnotationRectForDrag:", v26, v28, width, height);
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    objc_msgSend(v8, "rectangle");
    v54.origin.x = v30;
    v54.origin.y = v32;
    v54.size.width = v34;
    v54.size.height = v36;
    if (!CGRectEqualToRect(v52, v54))
      objc_msgSend(v8, "setRectangle:", v30, v32, v34, v36);

  }
  else
  {
    v49.receiver = self;
    v49.super_class = (Class)AKRectangularPageSizedAnnotationEventHandler;
    -[AKRectangularAnnotationEventHandler updateModelWithCurrentPoint:options:](&v49, sel_updateModelWithCurrentPoint_options_, a4, x, y);
    objc_msgSend(v8, "rectangle");
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;
    -[AKRectangularPageSizedAnnotationEventHandler _validateAnnotationRectForResize:](self, "_validateAnnotationRectForResize:");
    v45 = v53.origin.x;
    v46 = v53.origin.y;
    v47 = v53.size.width;
    v48 = v53.size.height;
    v55.origin.x = v38;
    v55.origin.y = v40;
    v55.size.width = v42;
    v55.size.height = v44;
    if (!CGRectEqualToRect(v53, v55))
      objc_msgSend(v8, "setRectangle:", v45, v46, v47, v48);
  }

}

- (CGRect)_validateAnnotationRectForResize:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect result;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AKAnnotationEventHandler pageController](self, "pageController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "maxPageRect");
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v17 = CGRectIntersection(v16, v19);
  v8 = v17.origin.x;
  v9 = v17.origin.y;
  v10 = v17.size.width;
  v11 = v17.size.height;
  if (CGRectIsNull(v17))
  {
    v9 = y;
    v8 = x;
  }

  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)_validateAnnotationRectForDrag:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double MinX;
  double v15;
  double v16;
  double MaxX;
  double MaxY;
  double v19;
  double v20;
  double MinY;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat rect;
  double v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect result;
  CGRect v48;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AKAnnotationEventHandler pageController](self, "pageController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "maxPageRect");
  v8 = v30.origin.x;
  v9 = v30.origin.y;
  v10 = v30.size.width;
  v11 = v30.size.height;
  v29 = *MEMORY[0x24BDBEFB0];
  v27 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  if (CGRectContainsRect(v30, v48))
  {
    v12 = height;
    v13 = v27;
    goto LABEL_14;
  }
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  rect = height;
  MinX = CGRectGetMinX(v31);
  v32.origin.x = v8;
  v32.origin.y = v9;
  v32.size.width = v10;
  v32.size.height = v11;
  if (MinX < CGRectGetMinX(v32))
  {
    v33.origin.x = v8;
    v33.origin.y = v9;
    v33.size.width = v10;
    v33.size.height = v11;
    v15 = CGRectGetMinX(v33);
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = rect;
    v16 = CGRectGetMinX(v34);
LABEL_7:
    v29 = v15 - v16;
    goto LABEL_8;
  }
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = rect;
  MaxX = CGRectGetMaxX(v35);
  v36.origin.x = v8;
  v36.origin.y = v9;
  v36.size.width = v10;
  v36.size.height = v11;
  if (MaxX > CGRectGetMaxX(v36))
  {
    v37.origin.x = v8;
    v37.origin.y = v9;
    v37.size.width = v10;
    v37.size.height = v11;
    v15 = CGRectGetMaxX(v37);
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = rect;
    v16 = CGRectGetMaxX(v38);
    goto LABEL_7;
  }
LABEL_8:
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = rect;
  MaxY = CGRectGetMaxY(v39);
  v40.origin.x = v8;
  v40.origin.y = v9;
  v40.size.width = v10;
  v40.size.height = v11;
  if (MaxY <= CGRectGetMaxY(v40))
  {
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = rect;
    MinY = CGRectGetMinY(v43);
    v44.origin.x = v8;
    v44.origin.y = v9;
    v44.size.width = v10;
    v44.size.height = v11;
    if (MinY >= CGRectGetMinY(v44))
    {
      v13 = v27;
      v12 = rect;
      goto LABEL_14;
    }
    v45.origin.x = v8;
    v45.origin.y = v9;
    v45.size.width = v10;
    v45.size.height = v11;
    v19 = CGRectGetMinY(v45);
    v46.origin.x = x;
    v46.origin.y = y;
    v46.size.width = width;
    v12 = rect;
    v46.size.height = rect;
    v20 = CGRectGetMinY(v46);
  }
  else
  {
    v41.origin.x = v8;
    v41.origin.y = v9;
    v41.size.width = v10;
    v41.size.height = v11;
    v19 = CGRectGetMaxY(v41);
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v12 = rect;
    v42.size.height = rect;
    v20 = CGRectGetMaxY(v42);
  }
  v13 = v19 - v20;
LABEL_14:
  v22 = y + v13;

  v23 = x + v29;
  v24 = v22;
  v25 = width;
  v26 = v12;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

@end
