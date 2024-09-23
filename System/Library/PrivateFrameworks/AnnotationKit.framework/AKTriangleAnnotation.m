@implementation AKTriangleAnnotation

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("path")))
  {
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Triangle Shape");
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("horizontallyFlipped"))
      && !objc_msgSend(v4, "isEqualToString:", CFSTR("verticallyFlipped")))
    {
      goto LABEL_7;
    }
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Bounds");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24F1A83D0, CFSTR("AnnotationStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_7:
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___AKTriangleAnnotation;
    objc_msgSendSuper2(&v10, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)displayName
{
  void *v2;
  void *v3;

  +[AKController akBundle](AKController, "akBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Triangle"), &stru_24F1A83D0, CFSTR("AnnotationStrings"));
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
  v6.super_class = (Class)AKTriangleAnnotation;
  -[AKRectangularShapeAnnotation keysForValuesToObserveForUndo](&v6, sel_keysForValuesToObserveForUndo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF570);
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
  v6.super_class = (Class)AKTriangleAnnotation;
  -[AKRectangularShapeAnnotation keysForValuesToObserveForRedrawing](&v6, sel_keysForValuesToObserveForRedrawing);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF588);
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
  void *v5;
  const CGPath *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKTriangleAnnotation;
  v4 = a3;
  -[AKRectangularShapeAnnotation encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[AKTriangleAnnotation path](self, "path", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const CGPath *)objc_msgSend(v5, "newCGPathForPlatformBezierPath");

  objc_msgSend(MEMORY[0x24BDBCE50], "encodeCGPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("path"));
  CGPathRelease(v6);
  objc_msgSend(v4, "encodeBool:forKey:", -[AKTriangleAnnotation verticallyFlipped](self, "verticallyFlipped"), CFSTR("verticallyFlipped"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AKTriangleAnnotation horizontallyFlipped](self, "horizontallyFlipped"), CFSTR("horizontallyFlipped"));

}

- (AKTriangleAnnotation)initWithCoder:(id)a3
{
  id v4;
  AKTriangleAnnotation *v5;
  void *v6;
  uint64_t v7;
  const CGPath *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKTriangleAnnotation;
  v5 = -[AKRectangularShapeAnnotation initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(MEMORY[0x24BDBCE50], "newCGPathDecodedFromData:", v6);
    if (v7)
    {
      v8 = (const CGPath *)v7;
      objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithCGPath:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKTriangleAnnotation setPath:](v5, "setPath:", v9);

      CGPathRelease(v8);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("verticallyFlipped")))
      -[AKTriangleAnnotation setVerticallyFlipped:](v5, "setVerticallyFlipped:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("verticallyFlipped")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("horizontallyFlipped")))
      -[AKTriangleAnnotation setHorizontallyFlipped:](v5, "setHorizontallyFlipped:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("horizontallyFlipped")));

  }
  return v5;
}

- (UIBezierPath)path
{
  return (UIBezierPath *)objc_getProperty(self, a2, 312, 1);
}

- (void)setPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (BOOL)verticallyFlipped
{
  return self->_verticallyFlipped;
}

- (void)setVerticallyFlipped:(BOOL)a3
{
  self->_verticallyFlipped = a3;
}

- (BOOL)horizontallyFlipped
{
  return self->_horizontallyFlipped;
}

- (void)setHorizontallyFlipped:(BOOL)a3
{
  self->_horizontallyFlipped = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
