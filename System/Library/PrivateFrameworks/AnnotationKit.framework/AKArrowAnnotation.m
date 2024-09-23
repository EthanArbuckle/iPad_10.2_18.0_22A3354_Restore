@implementation AKArrowAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKArrowAnnotation;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF048);
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
  v6.super_class = (Class)&OBJC_METACLASS___AKArrowAnnotation;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF060);
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
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("startPoint")))
  {
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Start Point");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("endPoint")))
  {
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("End Point");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("midPoint")))
  {
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Mid Point");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("arrowHeadStyle")))
  {
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Line Style");
  }
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("annotationText")) & 1) == 0
      && !objc_msgSend(v4, "isEqualToString:", CFSTR("typingAttributes")))
    {
      goto LABEL_13;
    }
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Text");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24F1A83D0, CFSTR("AnnotationStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_13:
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___AKArrowAnnotation;
    objc_msgSendSuper2(&v10, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (AKArrowAnnotation)init
{
  AKArrowAnnotation *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKArrowAnnotation;
  v2 = -[AKAnnotation init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKArrowAnnotation setTypingAttributes:](v2, "setTypingAttributes:", v3);

  }
  return v2;
}

- (id)displayName
{
  unint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[AKArrowAnnotation arrowHeadStyle](self, "arrowHeadStyle");
  +[AKController akBundle](AKController, "akBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("Arrow Line");
  else
    v5 = CFSTR("Line");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24F1A83D0, CFSTR("AnnotationStrings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)keysForValuesToObserveForUndo
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = self;
  v6.super_class = (Class)AKArrowAnnotation;
  -[AKShapeAnnotation keysForValuesToObserveForUndo](&v6, sel_keysForValuesToObserveForUndo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF078);
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
  v6.super_class = (Class)AKArrowAnnotation;
  -[AKShapeAnnotation keysForValuesToObserveForRedrawing](&v6, sel_keysForValuesToObserveForRedrawing);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF090);
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
  v6.super_class = (Class)AKArrowAnnotation;
  -[AKAnnotation keysForValuesToObserveForAdornments](&v6, sel_keysForValuesToObserveForAdornments);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF0A8);
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect result;
  CGRect v42;

  -[AKArrowAnnotation startPoint](self, "startPoint");
  v4 = v3;
  v35 = v3;
  v6 = v5;
  -[AKArrowAnnotation endPoint](self, "endPoint");
  v8 = v7;
  v10 = v9;
  -[AKArrowAnnotation midPoint](self, "midPoint");
  v12 = v11;
  v14 = v13;
  v15 = v8 - v4;
  v16 = hypot(v8 - v4, v10 - v6);
  v17 = hypot(v8 - v12, v10 - v14);
  if (v16 >= v17)
    v17 = v16;
  v18 = -v17;
  +[AKGeometryHelper expandCGRect:toContainPoint:](AKGeometryHelper, "expandCGRect:toContainPoint:", v35, v6, v15, v10 - v6, v12, v14);
  v37 = CGRectStandardize(v36);
  v38 = CGRectInset(v37, v18, v18);
  x = v38.origin.x;
  y = v38.origin.y;
  width = v38.size.width;
  height = v38.size.height;
  -[AKArrowAnnotation annotationText](self, "annotationText");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[AKArrowAnnotation annotationText](self, "annotationText");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "length");

    if (v26)
    {
      +[AKAnnotationRenderer textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:](AKAnnotationRenderer, "textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:", self, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      v42.origin.x = v27;
      v42.origin.y = v28;
      v42.size.width = v29;
      v42.size.height = v30;
      v39.origin.x = x;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = height;
      v40 = CGRectUnion(v39, v42);
      x = v40.origin.x;
      y = v40.origin.y;
      width = v40.size.width;
      height = v40.size.height;
    }
  }
  v31 = x;
  v32 = y;
  v33 = width;
  v34 = height;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)adjustModelToCompensateForOriginalExif
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)AKArrowAnnotation;
  -[AKAnnotation adjustModelToCompensateForOriginalExif](&v30, sel_adjustModelToCompensateForOriginalExif);
  -[AKArrowAnnotation startPoint](self, "startPoint");
  v4 = v3;
  v6 = v5;
  -[AKArrowAnnotation endPoint](self, "endPoint");
  v8 = v7;
  v10 = v9;
  -[AKArrowAnnotation midPoint](self, "midPoint");
  v12 = v11;
  v14 = v13;
  v15 = v4 + (v8 - v4) * 0.5;
  v16 = v6 + (v10 - v6) * 0.5;
  v17 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", -[AKAnnotation originalExifOrientation](self, "originalExifOrientation"));
  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v17, v4, v6, v15, v16);
  v19 = v18;
  v21 = v20;
  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v17, v8, v10, v15, v16);
  v23 = v22;
  v25 = v24;
  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v17, v12, v14, v15, v16);
  v27 = v26;
  v29 = v28;
  -[AKArrowAnnotation setStartPoint:](self, "setStartPoint:", v19, v21);
  -[AKArrowAnnotation setEndPoint:](self, "setEndPoint:", v23, v25);
  -[AKArrowAnnotation setMidPoint:](self, "setMidPoint:", v27, v29);
}

- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  height = a4.height;
  width = a4.width;
  +[AKGeometryHelper adjustOriginalExifOrientationOnAnnotation:flatteningOriginalModelExif:](AKGeometryHelper, "adjustOriginalExifOrientationOnAnnotation:flatteningOriginalModelExif:", self, a3);
  +[AKGeometryHelper affineTransformFlatteningOriginalModelExif:withOriginalModelSize:](AKGeometryHelper, "affineTransformFlatteningOriginalModelExif:withOriginalModelSize:", a3, width, height);
  -[AKArrowAnnotation startPoint](self, "startPoint");
  v9 = v8;
  v11 = v10;
  -[AKArrowAnnotation endPoint](self, "endPoint");
  v13 = v12;
  v15 = v14;
  -[AKArrowAnnotation midPoint](self, "midPoint");
  v16 = v11 * 0.0 + 0.0 * v9 + 0.0;
  v17 = v15 * 0.0 + 0.0 * v13 + 0.0;
  v20 = v18 * 0.0 + 0.0 * v19 + 0.0;
  -[AKArrowAnnotation setStartPoint:](self, "setStartPoint:", v16, v16);
  -[AKArrowAnnotation setEndPoint:](self, "setEndPoint:", v17, v17);
  -[AKArrowAnnotation setMidPoint:](self, "setMidPoint:", v20, v20);
}

- (void)translateBy:(CGPoint)a3
{
  double y;
  double x;
  _BOOL8 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  y = a3.y;
  x = a3.x;
  if (a3.x != *MEMORY[0x24BDBEFB0] || a3.y != *(double *)(MEMORY[0x24BDBEFB0] + 8))
  {
    v7 = -[AKAnnotation isTranslating](self, "isTranslating");
    -[AKAnnotation setIsTranslating:](self, "setIsTranslating:", 1);
    -[AKArrowAnnotation startPoint](self, "startPoint");
    v9 = v8;
    v11 = v10;
    -[AKArrowAnnotation endPoint](self, "endPoint");
    v13 = v12;
    v15 = v14;
    -[AKArrowAnnotation midPoint](self, "midPoint");
    v16 = x + v9;
    v17 = y + v11;
    v18 = x + v13;
    v19 = y + v15;
    v21 = x + v20;
    v23 = y + v22;
    -[AKArrowAnnotation setStartPoint:](self, "setStartPoint:", v16, v17);
    -[AKArrowAnnotation setEndPoint:](self, "setEndPoint:", v18, v19);
    -[AKArrowAnnotation setMidPoint:](self, "setMidPoint:", v21, v23);
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
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  objc_super v8;
  CGPoint v9;
  CGPoint v10;
  CGPoint v11;

  v8.receiver = self;
  v8.super_class = (Class)AKArrowAnnotation;
  v4 = a3;
  -[AKShapeAnnotation encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[AKArrowAnnotation startPoint](self, "startPoint", v8.receiver, v8.super_class);
  DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v9);
  objc_msgSend(v4, "encodeObject:forKey:", DictionaryRepresentation, CFSTR("startPoint"));
  -[AKArrowAnnotation endPoint](self, "endPoint");
  v6 = CGPointCreateDictionaryRepresentation(v10);

  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("endPoint"));
  -[AKArrowAnnotation midPoint](self, "midPoint");
  v7 = CGPointCreateDictionaryRepresentation(v11);

  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("midPoint"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AKArrowAnnotation arrowHeadStyle](self, "arrowHeadStyle"), CFSTR("arrowHeadStyle"));
  +[AKSecureSerializationHelper encodeTextPropertiesOfAnnotation:withCoder:](AKSecureSerializationHelper, "encodeTextPropertiesOfAnnotation:withCoder:", self, v4);

}

- (AKArrowAnnotation)initWithCoder:(id)a3
{
  id v4;
  AKArrowAnnotation *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFDictionary *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFDictionary *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const __CFDictionary *v20;
  CGPoint *p_midPoint;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)AKArrowAnnotation;
  v5 = -[AKShapeAnnotation initWithCoder:](&v28, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("startPoint"));
    v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    CGPointMakeWithDictionaryRepresentation(v10, &v5->_startPoint);
    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("endPoint"));
    v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    CGPointMakeWithDictionaryRepresentation(v15, &v5->_endPoint);
    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("midPoint"));
    v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    p_midPoint = &v5->_midPoint;
    if (v20)
    {
      CGPointMakeWithDictionaryRepresentation(v20, p_midPoint);
    }
    else
    {
      __asm { FMOV            V1.2D, #0.5 }
      *(float64x2_t *)p_midPoint = vmulq_f64(vaddq_f64((float64x2_t)v5->_startPoint, (float64x2_t)v5->_endPoint), _Q1);
    }
    -[AKArrowAnnotation setArrowHeadStyle:](v5, "setArrowHeadStyle:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("arrowHeadStyle")));
    +[AKSecureSerializationHelper decodeTextPropertiesOfAnnotation:withSecureCoder:](AKSecureSerializationHelper, "decodeTextPropertiesOfAnnotation:withSecureCoder:", v5, v4);

  }
  return v5;
}

- (CGPoint)startPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_startPoint, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setStartPoint:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_startPoint, &v3, 16, 1, 0);
}

- (CGPoint)endPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_endPoint, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setEndPoint:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_endPoint, &v3, 16, 1, 0);
}

- (CGPoint)midPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_midPoint, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setMidPoint:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_midPoint, &v3, 16, 1, 0);
}

- (unint64_t)arrowHeadStyle
{
  return self->_arrowHeadStyle;
}

- (void)setArrowHeadStyle:(unint64_t)a3
{
  self->_arrowHeadStyle = a3;
}

- (NSTextStorage)annotationText
{
  return (NSTextStorage *)objc_getProperty(self, a2, 232, 1);
}

- (void)setAnnotationText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSDictionary)typingAttributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 240, 1);
}

- (void)setTypingAttributes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typingAttributes, 0);
  objc_storeStrong((id *)&self->_annotationText, 0);
}

@end
