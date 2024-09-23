@implementation AKRectangularShapeAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKRectangularShapeAnnotation;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF228);
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
  v6.super_class = (Class)&OBJC_METACLASS___AKRectangularShapeAnnotation;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF240);
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
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("annotationText")) & 1) == 0
      && !objc_msgSend(v4, "isEqualToString:", CFSTR("typingAttributes")))
    {
      goto LABEL_7;
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
LABEL_7:
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___AKRectangularShapeAnnotation;
    objc_msgSendSuper2(&v10, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (AKRectangularShapeAnnotation)init
{
  AKRectangularShapeAnnotation *v2;
  AKRectangularShapeAnnotation *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKRectangularShapeAnnotation;
  v2 = -[AKAnnotation init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AKAnnotation setTextIsFixedWidth:](v2, "setTextIsFixedWidth:", 1);
    -[AKAnnotation setTextIsFixedHeight:](v3, "setTextIsFixedHeight:", 1);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKRectangularShapeAnnotation setTypingAttributes:](v3, "setTypingAttributes:", v4);

  }
  return v3;
}

- (id)displayName
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKRectangularShapeAnnotation;
  -[AKShapeAnnotation displayName](&v3, sel_displayName);
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
  v6.super_class = (Class)AKRectangularShapeAnnotation;
  -[AKShapeAnnotation keysForValuesToObserveForUndo](&v6, sel_keysForValuesToObserveForUndo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF258);
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
  v6.super_class = (Class)AKRectangularShapeAnnotation;
  -[AKShapeAnnotation keysForValuesToObserveForRedrawing](&v6, sel_keysForValuesToObserveForRedrawing);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF270);
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
  v6.super_class = (Class)AKRectangularShapeAnnotation;
  -[AKAnnotation keysForValuesToObserveForAdornments](&v6, sel_keysForValuesToObserveForAdornments);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF288);
  return v4;
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
  v8.super_class = (Class)AKRectangularShapeAnnotation;
  -[AKAnnotation adjustModelToCompensateForOriginalExif](&v8, sel_adjustModelToCompensateForOriginalExif);
  -[AKRectangularShapeAnnotation rectangle](self, "rectangle");
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
  -[AKRectangularShapeAnnotation setRectangle:](self, "setRectangle:");
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
  -[AKRectangularShapeAnnotation rectangle](self, "rectangle");
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
  -[AKRectangularShapeAnnotation setRectangle:](self, "setRectangle:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
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
    -[AKRectangularShapeAnnotation rectangle](self, "rectangle");
    -[AKRectangularShapeAnnotation setRectangle:](self, "setRectangle:", x + v8, y + v9);
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
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)AKRectangularShapeAnnotation;
  v4 = a3;
  -[AKShapeAnnotation encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[AKRectangularShapeAnnotation rectangle](self, "rectangle", v6.receiver, v6.super_class);
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v7);
  objc_msgSend(v4, "encodeObject:forKey:", DictionaryRepresentation, CFSTR("rectangle"));
  +[AKSecureSerializationHelper encodeTextPropertiesOfAnnotation:withCoder:](AKSecureSerializationHelper, "encodeTextPropertiesOfAnnotation:withCoder:", self, v4);

}

- (AKRectangularShapeAnnotation)initWithCoder:(id)a3
{
  id v4;
  AKRectangularShapeAnnotation *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFDictionary *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AKRectangularShapeAnnotation;
  v5 = -[AKShapeAnnotation initWithCoder:](&v12, sel_initWithCoder_, v4);
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
    +[AKSecureSerializationHelper decodeTextPropertiesOfAnnotation:withSecureCoder:](AKSecureSerializationHelper, "decodeTextPropertiesOfAnnotation:withSecureCoder:", v5, v4);

  }
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

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
}

- (unint64_t)maximumNumberOfCharacters
{
  return self->_maximumNumberOfCharacters;
}

- (void)setMaximumNumberOfCharacters:(unint64_t)a3
{
  self->_maximumNumberOfCharacters = a3;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_typingAttributes, 0);
  objc_storeStrong((id *)&self->_annotationText, 0);
}

@end
