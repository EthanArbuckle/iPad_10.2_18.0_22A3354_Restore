@implementation AKShapeAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKShapeAnnotation;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

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
  v6.super_class = (Class)&OBJC_METACLASS___AKShapeAnnotation;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("fillColor"))
    || (+[AKController akBundle](AKController, "akBundle"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Fill Color"), &stru_24F1A83D0, CFSTR("AnnotationStrings")), v6 = (void *)objc_claimAutoreleasedReturnValue(), v5, !v6))
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___AKShapeAnnotation;
    objc_msgSendSuper2(&v8, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)displayName
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKShapeAnnotation;
  -[AKStrokedAnnotation displayName](&v3, sel_displayName);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)keysForValuesToObserveForUndo
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = self;
  v6.super_class = (Class)AKShapeAnnotation;
  -[AKStrokedAnnotation keysForValuesToObserveForUndo](&v6, sel_keysForValuesToObserveForUndo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF648);
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
  v6.super_class = (Class)AKShapeAnnotation;
  -[AKStrokedAnnotation keysForValuesToObserveForRedrawing](&v6, sel_keysForValuesToObserveForRedrawing);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF660);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKShapeAnnotation;
  v4 = a3;
  -[AKStrokedAnnotation encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[AKShapeAnnotation fillColor](self, "fillColor", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "akEncodeColor:forKey:", v5, CFSTR("fillColorString"));

}

- (AKShapeAnnotation)initWithCoder:(id)a3
{
  id v4;
  AKShapeAnnotation *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKShapeAnnotation;
  v5 = -[AKStrokedAnnotation initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("fillColorString")))
    {
      objc_msgSend(v4, "akDecodeColorForKey:", CFSTR("fillColorString"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKShapeAnnotation setFillColor:](v5, "setFillColor:", v6);
LABEL_7:

      goto LABEL_8;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("fillColor")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fillColor"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(MEMORY[0x24BDF6950], "akColorWithCIColor:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKShapeAnnotation setFillColor:](v5, "setFillColor:", v7);

      }
      goto LABEL_7;
    }
  }
LABEL_8:

  return v5;
}

- (UIColor)fillColor
{
  return (UIColor *)objc_getProperty(self, a2, 216, 1);
}

- (void)setFillColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end
