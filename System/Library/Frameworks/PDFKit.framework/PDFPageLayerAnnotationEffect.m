@implementation PDFPageLayerAnnotationEffect

- (CGRect)pageFrame
{
  id WeakRetained;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._private->annotation);
  objc_msgSend(WeakRetained, "extendedBoundsForAction:", 0);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)update
{
  id WeakRetained;
  void *v4;
  __n128 v5;
  __n128 v6;
  double v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._private->pageLayer);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "geometryInterface");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5.n128_u64[0] = 0;
    v6.n128_u64[0] = 0;
    objc_msgSend(v4, "convertRectToRootView:fromPageLayer:", v8, PDFRectMake(v5, v6, 1.0, 1.0));
    -[PDFPageLayerAnnotationEffect setContentsScale:](self, "setContentsScale:", v7);
    -[PDFPageLayerAnnotationEffect setNeedsDisplay](self, "setNeedsDisplay");

    WeakRetained = v8;
  }

}

- (id)annotation
{
  return objc_loadWeakRetained((id *)&self->super._private->annotation);
}

- (id)UUID
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._private->annotation);
  objc_msgSend(WeakRetained, "pdfAnnotationUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)drawInContext:(CGContext *)a3
{
  id v5;
  BOOL v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL8 v20;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._private->annotation);
  v5 = objc_loadWeakRetained((id *)&self->super._private->pageLayer);
  if (WeakRetained)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    CGContextSaveGState(a3);
    objc_msgSend(WeakRetained, "bounds");
    v8 = v7;
    v10 = v9;
    objc_msgSend(WeakRetained, "extendedBoundsForAction:", 0);
    v12 = v11;
    v14 = v13;
    objc_msgSend(v5, "page");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "boundsForBox:", objc_msgSend(v5, "displayBox"));
    v17 = v16;
    v19 = v18;

    CGContextTranslateCTM(a3, v8 - v12 + v17 - v8, v10 - v14 + v19 - v10);
    v20 = +[PDFPage isNativeRotationDrawingEnabledForThisThread](PDFPage, "isNativeRotationDrawingEnabledForThisThread");
    +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", 1);
    CGContextSetProperty();
    objc_msgSend(WeakRetained, "drawWithBox:inContext:", objc_msgSend(v5, "displayBox"), a3);
    +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", v20);
    +[PDFAnnotation setAnnotationPageLayerEffectIsFlipped:](PDFAnnotation, "setAnnotationPageLayerEffectIsFlipped:", 0);
    CGContextRestoreGState(a3);
  }

}

@end
