@implementation AKThoughtBubbleAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKThoughtBubbleAnnotation;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CEE80);
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
  v6.super_class = (Class)&OBJC_METACLASS___AKThoughtBubbleAnnotation;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CEE98);
  return v4;
}

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("pointyBitPoint"))
    || (+[AKController akBundle](AKController, "akBundle"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Thought Bubble Tail"), &stru_24F1A83D0, CFSTR("AnnotationStrings")), v6 = (void *)objc_claimAutoreleasedReturnValue(), v5, !v6))
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___AKThoughtBubbleAnnotation;
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
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Thought Bubble"), &stru_24F1A83D0, CFSTR("AnnotationStrings"));
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
  v6.super_class = (Class)AKThoughtBubbleAnnotation;
  -[AKRectangularShapeAnnotation keysForValuesToObserveForUndo](&v6, sel_keysForValuesToObserveForUndo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CEEB0);
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
  v6.super_class = (Class)AKThoughtBubbleAnnotation;
  -[AKRectangularShapeAnnotation keysForValuesToObserveForRedrawing](&v6, sel_keysForValuesToObserveForRedrawing);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CEEC8);
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
  v6.super_class = (Class)AKThoughtBubbleAnnotation;
  -[AKRectangularShapeAnnotation keysForValuesToObserveForAdornments](&v6, sel_keysForValuesToObserveForAdornments);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CEEE0);
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
  double x;
  double y;
  double width;
  double height;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect result;

  -[AKRectangularShapeAnnotation rectangle](self, "rectangle");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:](AKAnnotationRenderer, "draggingBoundsInsetsForAnnotation:", self);
  v12 = v11;
  v14 = v13;
  v40.origin.x = v4;
  v40.origin.y = v6;
  v40.size.width = v8;
  v40.size.height = v10;
  v41 = CGRectInset(v40, v12, v14);
  x = v41.origin.x;
  y = v41.origin.y;
  width = v41.size.width;
  height = v41.size.height;
  -[AKThoughtBubbleAnnotation pointyBitPoint](self, "pointyBitPoint");
  +[AKGeometryHelper expandCGRect:toContainPoint:](AKGeometryHelper, "expandCGRect:toContainPoint:", x, y, width, height, v19, v20);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[AKStrokedAnnotation strokeWidth](self, "strokeWidth");
  v30 = v29 * -0.5;
  v42.origin.x = v22;
  v42.origin.y = v24;
  v42.size.width = v26;
  v42.size.height = v28;
  v43 = CGRectInset(v42, v30, v30);
  v31 = v43.origin.x;
  v32 = v43.origin.y;
  v33 = v43.size.width;
  v34 = v43.size.height;
  -[AKRectangularShapeAnnotation rotationAngle](self, "rotationAngle");
  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", v31, v32, v33, v34, v35);
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v37;
  result.origin.x = v36;
  return result;
}

- (void)adjustModelToCompensateForOriginalExif
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  v12.receiver = self;
  v12.super_class = (Class)AKThoughtBubbleAnnotation;
  -[AKRectangularShapeAnnotation adjustModelToCompensateForOriginalExif](&v12, sel_adjustModelToCompensateForOriginalExif);
  -[AKThoughtBubbleAnnotation pointyBitPoint](self, "pointyBitPoint");
  v4 = v3;
  v6 = v5;
  -[AKRectangularShapeAnnotation rectangle](self, "rectangle");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  MidX = CGRectGetMidX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", -[AKAnnotation originalExifOrientation](self, "originalExifOrientation")), v4, v6, MidX, CGRectGetMidY(v14));
  -[AKThoughtBubbleAnnotation setPointyBitPoint:](self, "setPointyBitPoint:");
}

- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  height = a4.height;
  width = a4.width;
  v12.receiver = self;
  v12.super_class = (Class)AKThoughtBubbleAnnotation;
  -[AKRectangularShapeAnnotation flattenModelExifOrientation:withModelSize:](&v12, sel_flattenModelExifOrientation_withModelSize_);
  -[AKThoughtBubbleAnnotation pointyBitPoint](self, "pointyBitPoint");
  v10 = v9;
  v11 = v8;
  +[AKGeometryHelper affineTransformFlatteningOriginalModelExif:withOriginalModelSize:](AKGeometryHelper, "affineTransformFlatteningOriginalModelExif:withOriginalModelSize:", a3, width, height);
  -[AKThoughtBubbleAnnotation setPointyBitPoint:](self, "setPointyBitPoint:", vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v10), (float64x2_t)0, v11)));
}

- (void)translateBy:(CGPoint)a3
{
  double y;
  double x;
  _BOOL8 v7;
  double v8;
  double v9;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  if (a3.x != *MEMORY[0x24BDBEFB0] || a3.y != *(double *)(MEMORY[0x24BDBEFB0] + 8))
  {
    v7 = -[AKAnnotation isTranslating](self, "isTranslating");
    -[AKAnnotation setIsTranslating:](self, "setIsTranslating:", 1);
    v10.receiver = self;
    v10.super_class = (Class)AKThoughtBubbleAnnotation;
    -[AKRectangularShapeAnnotation translateBy:](&v10, sel_translateBy_, x, y);
    -[AKThoughtBubbleAnnotation pointyBitPoint](self, "pointyBitPoint");
    -[AKThoughtBubbleAnnotation setPointyBitPoint:](self, "setPointyBitPoint:", x + v8, y + v9);
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
  CGPoint v7;

  v6.receiver = self;
  v6.super_class = (Class)AKThoughtBubbleAnnotation;
  v4 = a3;
  -[AKRectangularShapeAnnotation encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[AKThoughtBubbleAnnotation pointyBitPoint](self, "pointyBitPoint", v6.receiver, v6.super_class);
  DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v7);
  objc_msgSend(v4, "encodeObject:forKey:", DictionaryRepresentation, CFSTR("pointyBitPoint"));

}

- (AKThoughtBubbleAnnotation)initWithCoder:(id)a3
{
  id v4;
  AKThoughtBubbleAnnotation *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFDictionary *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AKThoughtBubbleAnnotation;
  v5 = -[AKRectangularShapeAnnotation initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("pointyBitPoint"));
    v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    CGPointMakeWithDictionaryRepresentation(v10, &v5->_pointyBitPoint);
  }

  return v5;
}

- (CGPoint)pointyBitPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_pointyBitPoint, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPointyBitPoint:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_pointyBitPoint, &v3, 16, 1, 0);
}

@end
