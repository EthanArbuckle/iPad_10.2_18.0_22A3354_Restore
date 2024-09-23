@implementation PDFAnnotationPointerTrackingView

- (PDFAnnotationPointerTrackingView)initWithFrame:(CGRect)a3 annotation:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  PDFAnnotationPointerTrackingView *v11;
  PDFAnnotationPointerTrackingView *v12;
  void *v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PDFAnnotationPointerTrackingView;
  v11 = -[PDFAnnotationPointerTrackingView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_annotation, a4);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C78]), "initWithDelegate:", v12);
    -[PDFAnnotationPointerTrackingView addInteraction:](v12, "addInteraction:", v13);

  }
  return v12;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PDFAnnotationPointerTrackingView annotation](self, "annotation", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTextWidget");

  if (v6)
  {
    -[PDFAnnotationPointerTrackingView annotation](self, "annotation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v8, "pointSize");
    else
      objc_msgSend(MEMORY[0x24BDF6A70], "smallSystemFontSize");
    objc_msgSend(MEMORY[0x24BDF6C90], "beamWithPreferredLength:axis:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6C98], "styleWithShape:constrainedAxes:", v10, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6C98], "systemPointerStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v5;

  -[PDFAnnotationPointerTrackingView annotation](self, "annotation", a3, a4, a5);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPointerIsOverAnnotation:", 1);

}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v5;

  -[PDFAnnotationPointerTrackingView annotation](self, "annotation", a3, a4, a5);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPointerIsOverAnnotation:", 0);

}

- (PDFAnnotation)annotation
{
  return self->_annotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotation, 0);
}

@end
