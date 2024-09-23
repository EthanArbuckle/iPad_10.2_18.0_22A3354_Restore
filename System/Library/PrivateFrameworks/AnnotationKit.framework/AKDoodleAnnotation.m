@implementation AKDoodleAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKDoodleAnnotation;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF498);
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
  v6.super_class = (Class)&OBJC_METACLASS___AKDoodleAnnotation;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF4B0);
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
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("rectangle")))
  {
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Bounds");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("path")))
  {
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Doodle Shape");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("strokeWidth")))
  {
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Line Width");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("strokeColor")))
  {
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Color");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("dashed")))
  {
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Dashed");
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
LABEL_16:
      v10.receiver = a1;
      v10.super_class = (Class)&OBJC_METACLASS___AKDoodleAnnotation;
      objc_msgSendSuper2(&v10, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Brush Style");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24F1A83D0, CFSTR("AnnotationStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_16;
LABEL_17:

  return v8;
}

- (id)displayName
{
  void *v2;
  void *v3;

  +[AKController akBundle](AKController, "akBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Doodle"), &stru_24F1A83D0, CFSTR("AnnotationStrings"));
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
  v6.super_class = (Class)AKDoodleAnnotation;
  -[AKAnnotation keysForValuesToObserveForUndo](&v6, sel_keysForValuesToObserveForUndo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF4C8);
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
  v6.super_class = (Class)AKDoodleAnnotation;
  -[AKAnnotation keysForValuesToObserveForRedrawing](&v6, sel_keysForValuesToObserveForRedrawing);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF4E0);
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
  v6.super_class = (Class)AKDoodleAnnotation;
  -[AKAnnotation keysForValuesToObserveForAdornments](&v6, sel_keysForValuesToObserveForAdornments);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF4F8);
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

  -[AKDoodleAnnotation rectangle](self, "rectangle");
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
  -[AKDoodleAnnotation strokeWidth](self, "strokeWidth");
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
  -[AKDoodleAnnotation rotationAngle](self, "rotationAngle");
  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", v21, v22, v23, v24, v25);
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)adjustModelToCompensateForOriginalExif
{
  double x;
  double y;
  double width;
  double height;
  double MidX;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  v8.receiver = self;
  v8.super_class = (Class)AKDoodleAnnotation;
  -[AKAnnotation adjustModelToCompensateForOriginalExif](&v8, sel_adjustModelToCompensateForOriginalExif);
  -[AKDoodleAnnotation rectangle](self, "rectangle");
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  MidX = CGRectGetMidX(v9);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", -[AKAnnotation originalExifOrientation](self, "originalExifOrientation")), x, y, width, height, MidX, CGRectGetMidY(v10));
  -[AKDoodleAnnotation setRectangle:](self, "setRectangle:");
}

- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4
{
  double height;
  double width;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGAffineTransform v16[2];
  CGRect v17;
  CGRect v18;

  height = a4.height;
  width = a4.width;
  +[AKGeometryHelper adjustOriginalExifOrientationOnAnnotation:flatteningOriginalModelExif:](AKGeometryHelper, "adjustOriginalExifOrientationOnAnnotation:flatteningOriginalModelExif:", self, a3);
  -[AKDoodleAnnotation rectangle](self, "rectangle");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  memset(&v16[1], 0, sizeof(CGAffineTransform));
  +[AKGeometryHelper affineTransformFlatteningOriginalModelExif:withOriginalModelSize:](AKGeometryHelper, "affineTransformFlatteningOriginalModelExif:withOriginalModelSize:", a3, width, height);
  v16[0] = v16[1];
  v17.origin.x = v9;
  v17.origin.y = v11;
  v17.size.width = v13;
  v17.size.height = v15;
  v18 = CGRectApplyAffineTransform(v17, v16);
  -[AKDoodleAnnotation setRectangle:](self, "setRectangle:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
}

- (void)translateBy:(CGPoint)a3
{
  double y;
  double x;
  _BOOL8 v7;
  double v8;
  double v9;

  y = a3.y;
  x = a3.x;
  if (a3.x != *MEMORY[0x24BDBEFB0] || a3.y != *(double *)(MEMORY[0x24BDBEFB0] + 8))
  {
    v7 = -[AKAnnotation isTranslating](self, "isTranslating");
    -[AKAnnotation setIsTranslating:](self, "setIsTranslating:", 1);
    -[AKDoodleAnnotation rectangle](self, "rectangle");
    -[AKDoodleAnnotation setRectangle:](self, "setRectangle:", x + v8, y + v9);
    -[AKAnnotation setIsTranslating:](self, "setIsTranslating:", v7);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CFDictionaryRef DictionaryRepresentation;
  void *v6;
  const CGPath *v7;
  void *v8;
  void *v9;
  objc_super v10;
  CGRect v11;

  v10.receiver = self;
  v10.super_class = (Class)AKDoodleAnnotation;
  v4 = a3;
  -[AKAnnotation encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[AKDoodleAnnotation rectangle](self, "rectangle", v10.receiver, v10.super_class);
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v11);
  objc_msgSend(v4, "encodeObject:forKey:", DictionaryRepresentation, CFSTR("rectangle"));
  -[AKDoodleAnnotation path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (const CGPath *)objc_msgSend(v6, "newCGPathForPlatformBezierPath");

  objc_msgSend(MEMORY[0x24BDBCE50], "encodeCGPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("path"));
  CGPathRelease(v7);
  -[AKDoodleAnnotation strokeColor](self, "strokeColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "akEncodeColor:forKey:", v9, CFSTR("strokeColorString"));

  -[AKDoodleAnnotation strokeWidth](self, "strokeWidth");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("strokeWidth"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AKDoodleAnnotation isDashed](self, "isDashed"), CFSTR("dashed"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AKDoodleAnnotation hasShadow](self, "hasShadow"), CFSTR("hasShadow"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AKDoodleAnnotation brushStyle](self, "brushStyle"), CFSTR("brushStyle"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AKDoodleAnnotation pathIsPrestroked](self, "pathIsPrestroked"), CFSTR("pathIsPrestroked"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AKDoodleAnnotation pathIsDot](self, "pathIsDot"), CFSTR("pathIsDot"));

}

- (AKDoodleAnnotation)initWithCoder:(id)a3
{
  id v4;
  AKDoodleAnnotation *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFDictionary *v10;
  void *v11;
  uint64_t v12;
  const CGPath *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AKDoodleAnnotation;
  v5 = -[AKAnnotation initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("rectangle"));
    v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    CGRectMakeWithDictionaryRepresentation(v10, &v5->_rectangle);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(MEMORY[0x24BDBCE50], "newCGPathDecodedFromData:", v11);
    if (v12)
    {
      v13 = (const CGPath *)v12;
      objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithCGPath:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKDoodleAnnotation setPath:](v5, "setPath:", v14);

      CGPathRelease(v13);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("pathIsPrestroked")))
      v15 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pathIsPrestroked"));
    else
      v15 = 0;
    -[AKDoodleAnnotation setPathIsPrestroked:](v5, "setPathIsPrestroked:", v15);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("pathIsDot")))
      v16 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pathIsDot"));
    else
      v16 = 0;
    -[AKDoodleAnnotation setPathIsDot:](v5, "setPathIsDot:", v16);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("strokeColorString")))
    {
      objc_msgSend(v4, "akDecodeColorForKey:", CFSTR("strokeColorString"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKDoodleAnnotation setStrokeColor:](v5, "setStrokeColor:", v17);
    }
    else
    {
      if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("strokeColor")))
      {
LABEL_16:
        objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("strokeWidth"));
        -[AKDoodleAnnotation setStrokeWidth:](v5, "setStrokeWidth:");
        -[AKDoodleAnnotation setDashed:](v5, "setDashed:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dashed")));
        -[AKDoodleAnnotation setHasShadow:](v5, "setHasShadow:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasShadow")));
        -[AKDoodleAnnotation setBrushStyle:](v5, "setBrushStyle:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("brushStyle")));

        goto LABEL_17;
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("strokeColor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(MEMORY[0x24BDF6950], "akColorWithCIColor:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKDoodleAnnotation setStrokeColor:](v5, "setStrokeColor:", v18);

      }
    }

    goto LABEL_16;
  }
LABEL_17:

  return v5;
}

- (CGRect)rectangle
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_rectangle, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setRectangle:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_rectangle, &v3, 32, 1, 0);
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
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
  return (UIColor *)objc_getProperty(self, a2, 208, 1);
}

- (void)setStrokeColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
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

- (UIBezierPath)path
{
  return (UIBezierPath *)objc_getProperty(self, a2, 224, 1);
}

- (void)setPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (BOOL)pathIsPrestroked
{
  return self->_pathIsPrestroked;
}

- (void)setPathIsPrestroked:(BOOL)a3
{
  self->_pathIsPrestroked = a3;
}

- (BOOL)pathIsDot
{
  return self->_pathIsDot;
}

- (void)setPathIsDot:(BOOL)a3
{
  self->_pathIsDot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
}

@end
