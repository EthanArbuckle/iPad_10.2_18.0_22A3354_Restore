@implementation AKTextBoxAnnotationEventHandler

- (BOOL)canLockAspectRatio
{
  return 0;
}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
  double y;
  double x;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;

  y = a3.y;
  x = a3.x;
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rectangle");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v21.receiver = self;
  v21.super_class = (Class)AKTextBoxAnnotationEventHandler;
  -[AKRectangularAnnotationEventHandler updateModelWithCurrentPoint:options:](&v21, sel_updateModelWithCurrentPoint_options_, a4, x, y);
  objc_msgSend(v8, "rectangle");
  v23.origin.x = v17;
  v23.origin.y = v18;
  v23.size.width = v19;
  v23.size.height = v20;
  v22.origin.x = v10;
  v22.origin.y = v12;
  v22.size.width = v14;
  v22.size.height = v16;
  if (!CGRectEqualToRect(v22, v23))
  {
    if ((objc_msgSend(v8, "textIsFixedWidth") & 1) == 0)
      objc_msgSend(v8, "setTextIsFixedWidth:", 1);
    if (objc_msgSend(v8, "textIsClipped"))
      objc_msgSend(v8, "setTextIsClipped:", 0);
  }

}

@end
