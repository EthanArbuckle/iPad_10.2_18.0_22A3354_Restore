@implementation AKImageAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKImageAnnotation;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF390);
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
  v6.super_class = (Class)&OBJC_METACLASS___AKImageAnnotation;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF3A8);
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
    goto LABEL_6;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("hasShadow")))
  {
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Shadow");
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("horizontallyFlipped"))
    || objc_msgSend(v4, "isEqualToString:", CFSTR("verticallyFlipped")))
  {
LABEL_6:
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Bounds");
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("image")))
      goto LABEL_8;
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Image");
  }
LABEL_7:
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24F1A83D0, CFSTR("AnnotationStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_8:
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___AKImageAnnotation;
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
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("IMAGE_ANNOTATION_NAME"), CFSTR("Image"), CFSTR("AnnotationStrings"));
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
  v6.super_class = (Class)AKImageAnnotation;
  -[AKAnnotation keysForValuesToObserveForUndo](&v6, sel_keysForValuesToObserveForUndo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF3C0);
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
  v6.super_class = (Class)AKImageAnnotation;
  -[AKAnnotation keysForValuesToObserveForRedrawing](&v6, sel_keysForValuesToObserveForRedrawing);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF3D8);
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
  CGRect result;

  -[AKImageAnnotation rectangle](self, "rectangle");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[AKImageAnnotation rotationAngle](self, "rotationAngle");
  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", v4, v6, v8, v10, v11);
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
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
  v8.super_class = (Class)AKImageAnnotation;
  -[AKAnnotation adjustModelToCompensateForOriginalExif](&v8, sel_adjustModelToCompensateForOriginalExif);
  -[AKImageAnnotation rectangle](self, "rectangle");
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
  -[AKImageAnnotation setRectangle:](self, "setRectangle:");
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
  -[AKImageAnnotation rectangle](self, "rectangle");
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
  -[AKImageAnnotation setRectangle:](self, "setRectangle:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
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
    -[AKImageAnnotation rectangle](self, "rectangle");
    -[AKImageAnnotation setRectangle:](self, "setRectangle:", x + v8, y + v9);
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
  objc_super v7;
  CGRect v8;

  v7.receiver = self;
  v7.super_class = (Class)AKImageAnnotation;
  v4 = a3;
  -[AKAnnotation encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[AKImageAnnotation rectangle](self, "rectangle", v7.receiver, v7.super_class);
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v8);
  objc_msgSend(v4, "encodeObject:forKey:", DictionaryRepresentation, CFSTR("rectangle"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AKImageAnnotation hasShadow](self, "hasShadow"), CFSTR("hasShadow"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AKImageAnnotation verticallyFlipped](self, "verticallyFlipped"), CFSTR("verticallyFlipped"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AKImageAnnotation horizontallyFlipped](self, "horizontallyFlipped"), CFSTR("horizontallyFlipped"));
  -[AKImageAnnotation image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "akEncodeImage:forKey:", v6, CFSTR("imageAsData"));

}

- (AKImageAnnotation)initWithCoder:(id)a3
{
  id v4;
  AKImageAnnotation *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFDictionary *v10;
  NSObject *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AKImageAnnotation;
  v5 = -[AKAnnotation initWithCoder:](&v13, sel_initWithCoder_, v4);
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
    -[AKImageAnnotation setHasShadow:](v5, "setHasShadow:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasShadow")));
    -[AKImageAnnotation setVerticallyFlipped:](v5, "setVerticallyFlipped:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("verticallyFlipped")));
    -[AKImageAnnotation setHorizontallyFlipped:](v5, "setHorizontallyFlipped:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("horizontallyFlipped")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("imageAsData")))
    {
      objc_msgSend(v4, "akDecodeImageForKey:", CFSTR("imageAsData"));
      v11 = objc_claimAutoreleasedReturnValue();
      -[AKImageAnnotation setImage:](v5, "setImage:", v11);
    }
    else
    {
      if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("image")))
      {
LABEL_8:

        goto LABEL_9;
      }
      v11 = os_log_create("com.apple.annotationkit", "Serialization");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        sub_22907F970(v11);
    }

    goto LABEL_8;
  }
LABEL_9:

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

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (void)setHasShadow:(BOOL)a3
{
  self->_hasShadow = a3;
}

- (UIImage)image
{
  return (UIImage *)objc_getProperty(self, a2, 192, 1);
}

- (void)setImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
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

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
