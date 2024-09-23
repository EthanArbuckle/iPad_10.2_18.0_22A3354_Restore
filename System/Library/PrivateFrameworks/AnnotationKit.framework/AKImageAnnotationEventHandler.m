@implementation AKImageAnnotationEventHandler

- (BOOL)lockAspectRatioByDefault
{
  return 1;
}

- (CGSize)naturalSizeForAnnotation
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[AKAnnotationEventHandler annotation](self, "annotation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKImageAnnotationEventHandler;
  -[AKRectangularAnnotationEventHandler updateModelWithCurrentPoint:options:](&v4, sel_updateModelWithCurrentPoint_options_, a4, a3.x, a3.y);
}

@end
