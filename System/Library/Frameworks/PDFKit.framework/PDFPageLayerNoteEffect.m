@implementation PDFPageLayerNoteEffect

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
  objc_msgSend(WeakRetained, "noteBounds");
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

- (id)annotation
{
  return objc_loadWeakRetained((id *)&self->super._private->annotation);
}

- (void)update
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  CGColor *v8;
  void *v9;
  id v10;
  CGColor *v11;
  BOOL v12;
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._private->annotation);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v13 = WeakRetained;
    v5 = objc_msgSend(WeakRetained, "markupStyle");
    +[PDFAnnotation PDFTextColors](PDFAnnotation, "PDFTextColors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", v5);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (CGColor *)objc_msgSend(v7, "CGColor");

    +[PDFAnnotation PDFTextBorderColors](PDFAnnotation, "PDFTextBorderColors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", v5);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (CGColor *)objc_msgSend(v10, "CGColor");

    if (!CGColorEqualToColor((CGColorRef)-[PDFPageLayerNoteEffect backgroundColor](self, "backgroundColor"), v8))
      -[PDFPageLayerNoteEffect setBackgroundColor:](self, "setBackgroundColor:", v8);
    v12 = CGColorEqualToColor((CGColorRef)-[PDFPageLayerNoteEffect borderColor](self, "borderColor"), v11);
    v4 = v13;
    if (!v12)
    {
      -[PDFPageLayerNoteEffect setBorderColor:](self, "setBorderColor:", v11);
      v4 = v13;
    }
  }

}

@end
