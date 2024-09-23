@implementation AKTextBoxAnnotation

+ (BOOL)deleteAfterEditingIfEmpty
{
  return 0;
}

- (AKTextBoxAnnotation)init
{
  AKTextBoxAnnotation *v2;
  AKTextBoxAnnotation *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKTextBoxAnnotation;
  v2 = -[AKRectangularShapeAnnotation init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AKAnnotation setTextIsFixedWidth:](v2, "setTextIsFixedWidth:", 0);
    -[AKAnnotation setTextIsFixedHeight:](v3, "setTextIsFixedHeight:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKTextBoxAnnotation setHighlightColor:](v3, "setHighlightColor:", v5);

  }
  return v3;
}

- (id)highlightColor
{
  UIColor *highlightColor;

  if (-[AKAnnotation isFormField](self, "isFormField")
    && -[AKRectangularShapeAnnotation isHighlighted](self, "isHighlighted")
    && !-[AKAnnotation isEditingText](self, "isEditingText"))
  {
    highlightColor = self->_highlightColor;
  }
  else
  {
    highlightColor = 0;
  }
  return highlightColor;
}

+ (id)defaultPlaceholderText
{
  void *v2;
  void *v3;

  +[AKController akBundle](AKController, "akBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DEFAULT_TEXT_CONTENTS"), CFSTR("Text"), CFSTR("AnnotationStrings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)displayName
{
  void *v2;
  void *v3;

  +[AKController akBundle](AKController, "akBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Text Box"), &stru_24F1A83D0, CFSTR("AnnotationStrings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)keysForValuesToObserveForRedrawing
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = self;
  v6.super_class = (Class)AKTextBoxAnnotation;
  -[AKRectangularShapeAnnotation keysForValuesToObserveForRedrawing](&v6, sel_keysForValuesToObserveForRedrawing);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF6D8);
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
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect result;

  -[AKRectangularShapeAnnotation rectangle](self, "rectangle");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:](AKAnnotationRenderer, "draggingBoundsInsetsForAnnotation:", self);
  v12 = v11;
  v14 = v13;
  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  v31 = CGRectInset(v30, v12, v14);
  x = v31.origin.x;
  y = v31.origin.y;
  width = v31.size.width;
  height = v31.size.height;
  -[AKStrokedAnnotation strokeWidth](self, "strokeWidth");
  v20 = v19 * -0.5;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v33 = CGRectInset(v32, v20, 0.0);
  v21 = v33.origin.x;
  v22 = v33.origin.y;
  v23 = v33.size.width;
  v24 = v33.size.height;
  -[AKRectangularShapeAnnotation rotationAngle](self, "rotationAngle");
  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", v21, v22, v23, v24, v25);
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightColor, 0);
}

@end
