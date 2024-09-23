@implementation AKRectAnnotation

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("cornerRadius"))
    || (+[AKController akBundle](AKController, "akBundle"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Corner Radius"), &stru_24F1A83D0, CFSTR("AnnotationStrings")), v6 = (void *)objc_claimAutoreleasedReturnValue(), v5, !v6))
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___AKRectAnnotation;
    objc_msgSendSuper2(&v8, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)displayName
{
  void *v2;
  void *v3;

  +[AKController akBundle](AKController, "akBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Rectangle"), &stru_24F1A83D0, CFSTR("AnnotationStrings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)keysForValuesToObserveForUndo
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = self;
  v6.super_class = (Class)AKRectAnnotation;
  -[AKRectangularShapeAnnotation keysForValuesToObserveForUndo](&v6, sel_keysForValuesToObserveForUndo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF2A0);
  return v4;
}

- (id)keysForValuesToObserveForRedrawing
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = self;
  v6.super_class = (Class)AKRectAnnotation;
  -[AKRectangularShapeAnnotation keysForValuesToObserveForRedrawing](&v6, sel_keysForValuesToObserveForRedrawing);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF2B8);
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
  v33 = CGRectInset(v32, v20, v20);
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKRectAnnotation;
  v4 = a3;
  -[AKRectangularShapeAnnotation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  -[AKRectAnnotation cornerRadius](self, "cornerRadius", v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("cornerRadius"));

}

- (AKRectAnnotation)initWithCoder:(id)a3
{
  id v4;
  AKRectAnnotation *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AKRectAnnotation;
  v5 = -[AKRectangularShapeAnnotation initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("cornerRadius"));
    -[AKRectAnnotation setCornerRadius:](v5, "setCornerRadius:");
  }

  return v5;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

@end
