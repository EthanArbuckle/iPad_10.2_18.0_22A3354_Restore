@implementation AKRedactionRectAnnotation

- (AKRedactionRectAnnotation)init
{
  AKRedactionRectAnnotation *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKRedactionRectAnnotation;
  v2 = -[AKRectangularShapeAnnotation init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKShapeAnnotation setFillColor:](v2, "setFillColor:", v3);

    -[AKRedactionRectAnnotation setIsOpaque:](v2, "setIsOpaque:", 1);
  }
  return v2;
}

- (id)displayName
{
  void *v2;
  void *v3;

  +[AKController akBundle](AKController, "akBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Redaction"), &stru_24F1A83D0, CFSTR("AnnotationStrings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldBurnIn
{
  return 1;
}

- (id)keysForValuesToObserveForRedrawing
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = self;
  v6.super_class = (Class)AKRedactionRectAnnotation;
  -[AKRectangularShapeAnnotation keysForValuesToObserveForRedrawing](&v6, sel_keysForValuesToObserveForRedrawing);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF7E0);
  return v4;
}

- (CGRect)hitTestBounds
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double x;
  double y;
  double width;
  double height;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  -[AKRectangularShapeAnnotation rectangle](self, "rectangle");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:](AKAnnotationRenderer, "draggingBoundsInsetsForAnnotation:", self);
  v12 = v11;
  v14 = v13;
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  v25 = CGRectInset(v24, v12, v14);
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  -[AKRectangularShapeAnnotation rotationAngle](self, "rotationAngle");
  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", x, y, width, height, v19);
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKRedactionRectAnnotation;
  v4 = a3;
  -[AKRectangularShapeAnnotation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[AKRedactionRectAnnotation isOpaque](self, "isOpaque", v5.receiver, v5.super_class), CFSTR("isOpaque"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AKRedactionRectAnnotation isOpaque](self, "isOpaque"), CFSTR("isHighlighted"));

}

- (AKRedactionRectAnnotation)initWithCoder:(id)a3
{
  id v4;
  AKRedactionRectAnnotation *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AKRedactionRectAnnotation;
  v5 = -[AKRectangularShapeAnnotation initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    -[AKRedactionRectAnnotation setIsOpaque:](v5, "setIsOpaque:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isOpaque")));
    -[AKRedactionRectAnnotation setIsOpaque:](v5, "setIsOpaque:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isHighlighted")));
  }

  return v5;
}

- (BOOL)isOpaque
{
  return self->_isOpaque;
}

- (void)setIsOpaque:(BOOL)a3
{
  self->_isOpaque = a3;
}

- (BOOL)isHighlighted
{
  return self->_isHighlighted;
}

- (void)setIsHighlighted:(BOOL)a3
{
  self->_isHighlighted = a3;
}

@end
