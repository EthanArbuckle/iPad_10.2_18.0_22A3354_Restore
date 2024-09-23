@implementation PDFAnnotationPKDrawing

- (PDFAnnotationPKDrawing)initWithPKDrawing:(id)a3 bounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  PDFAnnotationPKDrawing *v11;
  PDFAnnotationPKDrawing *v12;
  AKInkAnnotation *v13;
  AKInkAnnotation *akInkAnnotation;
  PDFBorder *v15;
  void *v16;
  objc_super v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PDFAnnotationPKDrawing;
  v11 = -[PDFAnnotation initWithBounds:forType:withProperties:](&v18, sel_initWithBounds_forType_withProperties_, CFSTR("/Square"), 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_drawing, a3);
    v13 = (AKInkAnnotation *)objc_alloc_init((Class)AKInkAnnotationClass());
    akInkAnnotation = v12->_akInkAnnotation;
    v12->_akInkAnnotation = v13;

    -[AKInkAnnotation setRectangle:](v12->_akInkAnnotation, "setRectangle:", x, y, width, height);
    -[AKInkAnnotation setDrawing:](v12->_akInkAnnotation, "setDrawing:", v12->_drawing);
    -[PDFAnnotation setBounds:](v12, "setBounds:", x, y, width, height);
    v15 = objc_alloc_init(PDFBorder);
    -[PDFBorder setLineWidth:](v15, "setLineWidth:", 0.0);
    -[PDFAnnotation setValue:forAnnotationKey:](v12, "setValue:forAnnotationKey:", v15, CFSTR("/Border"));
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFAnnotation setValue:forAnnotationKey:](v12, "setValue:forAnnotationKey:", v16, CFSTR("/C"));
    -[PDFAnnotation setValue:forAnnotationKey:](v12, "setValue:forAnnotationKey:", v16, CFSTR("/IC"));
    -[PDFAnnotation setReadOnlyAnnotation:](v12, "setReadOnlyAnnotation:", 1);
    -[PDFAnnotation setLocked:](v12, "setLocked:", 1);
    -[PDFAnnotation setContentsLocked:](v12, "setContentsLocked:", 1);

  }
  return v12;
}

- (void)setDrawing:(id)a3
{
  PKDrawing **p_drawing;
  id v6;

  p_drawing = &self->_drawing;
  objc_storeStrong((id *)&self->_drawing, a3);
  v6 = a3;
  -[AKInkAnnotation setDrawing:](self->_akInkAnnotation, "setDrawing:", *p_drawing);

}

- (PDFAnnotationPKDrawing)initWithCGPDFAnnotation:(CGPDFAnnotation *)a3 forPage:(id)a4
{
  PDFAnnotationPKDrawing *v5;
  void *v6;
  AKInkAnnotation *akInkAnnotation;
  id v8;
  uint64_t v9;
  PKDrawing *drawing;
  PDFAnnotationPKDrawing *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PDFAnnotationPKDrawing;
  v5 = -[PDFAnnotation initWithCGPDFAnnotation:forPage:](&v13, sel_initWithCGPDFAnnotation_forPage_, a3, a4);
  if (v5)
  {
    +[PDFAKAnnotationSerializationHelper akAnnotationFromCGPDFAnnotation:andDictionary:](PDFAKAnnotationSerializationHelper, "akAnnotationFromCGPDFAnnotation:andDictionary:", a3, CGPDFAnnotationGetCGPDFDictionary());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AKInkAnnotationClass();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v11 = 0;
      goto LABEL_6;
    }
    akInkAnnotation = v5->_akInkAnnotation;
    v5->_akInkAnnotation = (AKInkAnnotation *)v6;
    v8 = v6;

    -[AKInkAnnotation drawing](v5->_akInkAnnotation, "drawing");
    v9 = objc_claimAutoreleasedReturnValue();
    drawing = v5->_drawing;
    v5->_drawing = (PKDrawing *)v9;

  }
  v11 = v5;
LABEL_6:

  return v11;
}

- (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4
{
  +[PDFAnnotationDrawing drawWithBox:inContext:withAKAnnotation:forAnnotation:](PDFAnnotationDrawing, "drawWithBox:inContext:withAKAnnotation:forAnnotation:", a3, a4, self->_akInkAnnotation, self);
}

- (__CFDictionary)dictionaryRef
{
  __CFDictionary *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PDFAnnotationPKDrawing;
  v3 = -[PDFAnnotation dictionaryRef](&v5, sel_dictionaryRef);
  if (v3)
    +[PDFAKAnnotationSerializationHelper addAKAnnotation:toAnnotationDictionary:](PDFAKAnnotationSerializationHelper, "addAKAnnotation:toAnnotationDictionary:", self->_akInkAnnotation, v3);
  return v3;
}

- (PKDrawing)drawing
{
  return self->_drawing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_akInkAnnotation, 0);
}

@end
