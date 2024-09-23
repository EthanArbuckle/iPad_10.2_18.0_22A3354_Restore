@implementation AKArrowShapeAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKArrowShapeAnnotation;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF738);
  return v4;
}

+ (id)keyPathsForValuesAffectingDrawingBounds
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKArrowShapeAnnotation;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF750);
  return v4;
}

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("arrowHeadLength")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("arrowLineWidth")) & 1) == 0
    && !objc_msgSend(v4, "isEqualToString:", CFSTR("arrowHeadWidth"))
    || (+[AKController akBundle](AKController, "akBundle"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Arrow Shape"), &stru_24F1A83D0, CFSTR("AnnotationStrings")), v6 = (void *)objc_claimAutoreleasedReturnValue(), v5, !v6))
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___AKArrowShapeAnnotation;
    objc_msgSendSuper2(&v8, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (AKArrowShapeAnnotation)init
{
  AKArrowShapeAnnotation *v2;
  AKArrowShapeAnnotation *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKArrowShapeAnnotation;
  v2 = -[AKArrowAnnotation init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AKAnnotation setTextIsFixedWidth:](v2, "setTextIsFixedWidth:", 1);
    -[AKAnnotation setTextIsFixedHeight:](v3, "setTextIsFixedHeight:", 1);
  }
  return v3;
}

- (id)displayName
{
  void *v2;
  void *v3;

  +[AKController akBundle](AKController, "akBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Arrow"), &stru_24F1A83D0, CFSTR("AnnotationStrings"));
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
  v6.super_class = (Class)AKArrowShapeAnnotation;
  -[AKArrowAnnotation keysForValuesToObserveForUndo](&v6, sel_keysForValuesToObserveForUndo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF768);
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
  v6.super_class = (Class)AKArrowShapeAnnotation;
  -[AKArrowAnnotation keysForValuesToObserveForRedrawing](&v6, sel_keysForValuesToObserveForRedrawing);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF780);
  return v4;
}

- (id)keysForValuesToObserveForAdornments
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = self;
  v6.super_class = (Class)AKArrowShapeAnnotation;
  -[AKArrowAnnotation keysForValuesToObserveForAdornments](&v6, sel_keysForValuesToObserveForAdornments);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF798);
  return v4;
}

- (CGRect)hitTestBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGRect v13;
  CGRect v14;

  -[AKArrowAnnotation startPoint](self, "startPoint");
  v4 = v3;
  v6 = v5;
  -[AKArrowAnnotation endPoint](self, "endPoint");
  v8 = v7;
  v10 = v9;
  -[AKArrowShapeAnnotation arrowHeadWidth](self, "arrowHeadWidth");
  v12 = v11 * -0.5;
  v13.size.width = v8 - v4;
  v13.size.height = v10 - v6;
  v13.origin.x = v4;
  v13.origin.y = v6;
  v14 = CGRectStandardize(v13);
  return CGRectInset(v14, v12, v12);
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
  v5.super_class = (Class)AKArrowShapeAnnotation;
  v4 = a3;
  -[AKArrowAnnotation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  -[AKArrowShapeAnnotation arrowHeadLength](self, "arrowHeadLength", v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("arrowHeadLength"));
  -[AKArrowShapeAnnotation arrowHeadWidth](self, "arrowHeadWidth");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("arrowHeadWidth"));
  -[AKArrowShapeAnnotation arrowLineWidth](self, "arrowLineWidth");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("arrowLineWidth"));

}

- (AKArrowShapeAnnotation)initWithCoder:(id)a3
{
  id v4;
  AKArrowShapeAnnotation *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AKArrowShapeAnnotation;
  v5 = -[AKArrowAnnotation initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("arrowHeadLength"));
    -[AKArrowShapeAnnotation setArrowHeadLength:](v5, "setArrowHeadLength:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("arrowHeadWidth"));
    -[AKArrowShapeAnnotation setArrowHeadWidth:](v5, "setArrowHeadWidth:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("arrowLineWidth"));
    -[AKArrowShapeAnnotation setArrowLineWidth:](v5, "setArrowLineWidth:");
  }

  return v5;
}

- (double)arrowLineWidth
{
  return self->_arrowLineWidth;
}

- (void)setArrowLineWidth:(double)a3
{
  self->_arrowLineWidth = a3;
}

- (double)arrowHeadWidth
{
  return self->_arrowHeadWidth;
}

- (void)setArrowHeadWidth:(double)a3
{
  self->_arrowHeadWidth = a3;
}

- (double)arrowHeadLength
{
  return self->_arrowHeadLength;
}

- (void)setArrowHeadLength:(double)a3
{
  self->_arrowHeadLength = a3;
}

@end
