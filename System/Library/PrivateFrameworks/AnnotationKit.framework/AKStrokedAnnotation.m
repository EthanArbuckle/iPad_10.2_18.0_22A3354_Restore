@implementation AKStrokedAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKStrokedAnnotation;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF1C8);
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
  v6.super_class = (Class)&OBJC_METACLASS___AKStrokedAnnotation;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF1E0);
  return v4;
}

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("strokeWidth")))
  {
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Border Line Width");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("strokeColor")))
  {
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Border Color");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("dashed")))
  {
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Border Dashed");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("hasShadow")))
  {
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Shadow");
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("brushStyle")))
    {
LABEL_12:
      v10.receiver = a1;
      v10.super_class = (Class)&OBJC_METACLASS___AKStrokedAnnotation;
      objc_msgSendSuper2(&v10, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Brush Style");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24F1A83D0, CFSTR("AnnotationStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_12;
LABEL_13:

  return v8;
}

- (id)displayName
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKStrokedAnnotation;
  -[AKAnnotation displayName](&v3, sel_displayName);
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
  v6.super_class = (Class)AKStrokedAnnotation;
  -[AKAnnotation keysForValuesToObserveForUndo](&v6, sel_keysForValuesToObserveForUndo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF1F8);
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
  v6.super_class = (Class)AKStrokedAnnotation;
  -[AKAnnotation keysForValuesToObserveForRedrawing](&v6, sel_keysForValuesToObserveForRedrawing);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF210);
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
  v6.super_class = (Class)AKStrokedAnnotation;
  v4 = a3;
  -[AKAnnotation encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[AKStrokedAnnotation strokeColor](self, "strokeColor", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "akEncodeColor:forKey:", v5, CFSTR("strokeColorString"));

  -[AKStrokedAnnotation strokeWidth](self, "strokeWidth");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("strokeWidth"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AKStrokedAnnotation isDashed](self, "isDashed"), CFSTR("dashed"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AKStrokedAnnotation hasShadow](self, "hasShadow"), CFSTR("hasShadow"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AKStrokedAnnotation brushStyle](self, "brushStyle"), CFSTR("brushStyle"));

}

- (AKStrokedAnnotation)initWithCoder:(id)a3
{
  id v4;
  AKStrokedAnnotation *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKStrokedAnnotation;
  v5 = -[AKAnnotation initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("strokeColorString")))
    {
      objc_msgSend(v4, "akDecodeColorForKey:", CFSTR("strokeColorString"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKStrokedAnnotation setStrokeColor:](v5, "setStrokeColor:", v6);
    }
    else
    {
      if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("strokeColor")))
      {
LABEL_8:
        objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("strokeWidth"));
        -[AKStrokedAnnotation setStrokeWidth:](v5, "setStrokeWidth:");
        -[AKStrokedAnnotation setDashed:](v5, "setDashed:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dashed")));
        -[AKStrokedAnnotation setHasShadow:](v5, "setHasShadow:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasShadow")));
        -[AKStrokedAnnotation setBrushStyle:](v5, "setBrushStyle:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("brushStyle")));
        goto LABEL_9;
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("strokeColor"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(MEMORY[0x24BDF6950], "akColorWithCIColor:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKStrokedAnnotation setStrokeColor:](v5, "setStrokeColor:", v7);

      }
    }

    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (UIColor)strokeColor
{
  return (UIColor *)objc_getProperty(self, a2, 200, 1);
}

- (void)setStrokeColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (BOOL)isDashed
{
  return self->_dashed;
}

- (void)setDashed:(BOOL)a3
{
  self->_dashed = a3;
}

- (int64_t)brushStyle
{
  return self->_brushStyle;
}

- (void)setBrushStyle:(int64_t)a3
{
  self->_brushStyle = a3;
}

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (void)setHasShadow:(BOOL)a3
{
  self->_hasShadow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);
}

@end
