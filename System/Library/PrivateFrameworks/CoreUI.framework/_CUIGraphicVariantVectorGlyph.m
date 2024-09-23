@implementation _CUIGraphicVariantVectorGlyph

- (id)_initWithBaseGlyph:(id)a3 options:(id)a4
{
  _CUIGraphicVariantVectorGlyph *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  v6 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](&v8, sel_initWithName_usingRenditionKey_fromTheme_, objc_msgSend(a3, "name"), objc_msgSend(a3, "renditionKey"), objc_msgSend(a3, "storageRef"));
  if (v6)
  {
    -[CUINamedVectorGlyph _setUltralightInterpolationSource:](v6, "_setUltralightInterpolationSource:", objc_msgSend(a3, "_ultralightInterpolationSource"));
    -[CUINamedVectorGlyph _setBlackInterpolationSource:](v6, "_setBlackInterpolationSource:", objc_msgSend(a3, "_blackInterpolationSource"));
    objc_msgSend(a3, "pointSize");
    -[CUINamedVectorGlyph _setPointSize:](v6, "_setPointSize:");
    objc_msgSend(a3, "scale");
    -[CUINamedVectorGlyph _setScale:](v6, "_setScale:");
    -[CUINamedVectorGlyph _setCatalog:](v6, "_setCatalog:", objc_msgSend(a3, "_catalog"));
    objc_msgSend(a3, "fontMatchingScaleFactor");
    -[CUINamedVectorGlyph setFontMatchingScaleFactor:](v6, "setFontMatchingScaleFactor:");
    objc_msgSend(a3, "glyphContinuousWeight");
    -[CUINamedVectorGlyph _setGlyphWeight:](v6, "_setGlyphWeight:");
    objc_msgSend(a3, "glyphContinuousSize");
    -[CUINamedVectorGlyph _setGlyphSize:](v6, "_setGlyphSize:");
    -[CUINamedVectorGlyph _setFlippable:](v6, "_setFlippable:", objc_msgSend(a3, "isFlippable"));
    -[CUINamedVectorGlyph _setLayoutDirection:](v6, "_setLayoutDirection:", objc_msgSend(a3, "layoutDirection"));
    -[CUINamedVectorGlyph _setCanUsePathConcatenation:](v6, "_setCanUsePathConcatenation:", objc_msgSend(a3, "_canUsePathConcatenation"));
    -[CUINamedVectorGlyph _setImage:](v6, "_setImage:", objc_msgSend(a3, "_cgImageRef"));
    objc_msgSend(a3, "variableMinValue");
    -[CUINamedVectorGlyph setVariableMinValue:](v6, "setVariableMinValue:");
    objc_msgSend(a3, "variableMaxValue");
    -[CUINamedVectorGlyph setVariableMaxValue:](v6, "setVariableMaxValue:");
    -[_CUIGraphicVariantVectorGlyph setOptions:](v6, "setOptions:", a4);
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;

  v5 = -[CUIVectorGlyphGraphicVariantOptions copy](-[_CUIGraphicVariantVectorGlyph options](self, "options"), "copy");
  v6 = -[_CUIGraphicVariantVectorGlyph _initWithBaseGlyph:options:](+[_CUIGraphicVariantVectorGlyph allocWithZone:](_CUIGraphicVariantVectorGlyph, "allocWithZone:", a3), "_initWithBaseGlyph:options:", self, v5);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  -[CUINamedVectorGlyph dealloc](&v3, sel_dealloc);
}

- (id)graphicVariantWithOptions:(id)a3
{
  objc_super v6;

  if (objc_msgSend(a3, "isEqual:", -[_CUIGraphicVariantVectorGlyph options](self, "options")))
    return self;
  v6.receiver = self;
  v6.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  return -[CUINamedVectorGlyph graphicVariantWithOptions:](&v6, sel_graphicVariantWithOptions_, a3);
}

- (double)baselineOffsetUnrounded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[_CUIGraphicVariantVectorGlyph _sizeOfBackgroundShape](self, "_sizeOfBackgroundShape");
  v4 = v3 * 0.295410156;
  -[CUINamedVectorGlyph glyphContinuousSize](self, "glyphContinuousSize");
  +[CUIVectorGlyphMutator transformForGlyphContinuousSize:](CUIVectorGlyphMutator, "transformForGlyphContinuousSize:");
  v6 = v5;
  -[CUINamedVectorGlyph referencePointSize](self, "referencePointSize");
  return v4 - v6 * v7;
}

- (double)baselineOffset
{
  double v3;
  double v4;
  double v5;

  -[_CUIGraphicVariantVectorGlyph baselineOffsetUnrounded](self, "baselineOffsetUnrounded");
  v4 = v3;
  -[CUINamedVectorGlyph scale](self, "scale");
  return round(v4 * v5) / v5;
}

- (CGRect)alignmentRect
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

  -[_CUIGraphicVariantVectorGlyph alignmentRectUnrounded](self, "alignmentRectUnrounded");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CUINamedVectorGlyph scale](self, "scale");
  v12 = round(v11 * v6) / v11;
  v13 = ceil(v11 * v8) / v11;
  v14 = ceil(v11 * v10) / v11;
  v15 = round(v11 * v4) / v11;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v15;
  return result;
}

- (CGRect)alignmentRectUnrounded
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_CUIGraphicVariantVectorGlyph _sizeOfBackgroundShape](self, "_sizeOfBackgroundShape");
  -[_CUIGraphicVariantVectorGlyph alignmentRectForTargetSize:scale:](self, "alignmentRectForTargetSize:scale:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)alignmentRectForTargetSize:(CGSize)a3 scale:(double)a4
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGAffineTransform v13;
  CGRect v14;

  -[_CUIGraphicVariantVectorGlyph _backgroundShapeBoundsForTargetSize:scale:](self, "_backgroundShapeBoundsForTargetSize:scale:", a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  CGAffineTransformMakeScale(&v13, a4, a4);
  v14.origin.x = v6;
  v14.origin.y = v8;
  v14.size.width = v10;
  v14.size.height = v12;
  return CGRectApplyAffineTransform(v14, &v13);
}

- (CGRect)contentBoundsUnrounded
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[_CUIGraphicVariantVectorGlyph _sizeOfBackgroundShape](self, "_sizeOfBackgroundShape");
  v3 = v2 + 0.13671875;
  v5 = v4 + 0.13671875;
  v6 = 0.0;
  v7 = 0.0;
  result.size.height = v5;
  result.size.width = v3;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)contentBounds
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

  -[_CUIGraphicVariantVectorGlyph contentBoundsUnrounded](self, "contentBoundsUnrounded");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CUINamedVectorGlyph scale](self, "scale");
  v12 = ceil(v11 * v8) / v11;
  v13 = ceil(v11 * v10) / v11;
  v14 = v4;
  v15 = v6;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)interiorAlignmentRect
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

  -[_CUIGraphicVariantVectorGlyph interiorAlignmentRectUnrounded](self, "interiorAlignmentRectUnrounded");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CUINamedVectorGlyph scale](self, "scale");
  v12 = round(v11 * v6) / v11;
  v13 = ceil(v11 * v8) / v11;
  v14 = ceil(v11 * v10) / v11;
  v15 = round(v11 * v4) / v11;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v15;
  return result;
}

- (CGRect)interiorAlignmentRectUnrounded
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_CUIGraphicVariantVectorGlyph _sizeOfBackgroundShape](self, "_sizeOfBackgroundShape");
  -[_CUIGraphicVariantVectorGlyph interiorAlignmentRectForTargetSize:scale:](self, "interiorAlignmentRectForTargetSize:scale:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_interiorAlignmentRectUnroundedForTargetSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[_CUIGraphicVariantVectorGlyph _safeContentAreaBoundsForBackgroundSize:](self, "_safeContentAreaBoundsForBackgroundSize:");
  -[_CUIGraphicVariantVectorGlyph _defaultScaledContentRectForBackgroundSize:safeContentArea:](self, "_defaultScaledContentRectForBackgroundSize:safeContentArea:", width, height, v6, v7, v8, v9);
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)interiorAlignmentRectForTargetSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  BOOL v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGAffineTransform v23;
  CGRect v24;

  height = a3.height;
  width = a3.width;
  -[_CUIGraphicVariantVectorGlyph _interiorAlignmentRectUnroundedForTargetSize:](self, "_interiorAlignmentRectUnroundedForTargetSize:");
  v12 = width * a4 < 56.0 || height * a4 < 56.0;
  if (v12 || (v11 * a4 >= 32.0 ? (v13 = v10 * a4 < 32.0) : (v13 = 1), v14 = a4, v13))
    v14 = 0.0;
  -[_CUIGraphicVariantVectorGlyph _scaledContentRectForBackgroundSize:baseContentRect:snappingScale:](self, "_scaledContentRectForBackgroundSize:baseContentRect:snappingScale:", width, height, v8, v9, v10, v11, v14);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  CGAffineTransformMakeScale(&v23, a4, a4);
  v24.origin.x = v16;
  v24.origin.y = v18;
  v24.size.width = v20;
  v24.size.height = v22;
  return CGRectApplyAffineTransform(v24, &v23);
}

- (BOOL)_containsWideGamutColor
{
  unsigned __int8 v3;
  BOOL v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  v3 = -[CUINamedVectorGlyph _containsWideGamutColor](&v11, sel__containsWideGamutColor);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __56___CUIGraphicVariantVectorGlyph__containsWideGamutColor__block_invoke;
  v6[3] = &unk_1E41AA880;
  v6[4] = &v7;
  -[NSArray enumerateObjectsUsingBlock:](-[CUIVectorGlyphGraphicVariantOptions fillColors](-[_CUIGraphicVariantVectorGlyph options](self, "options"), "fillColors"), "enumerateObjectsUsingBlock:", v6);
  v4 = (v3 & 1) != 0 || *((_BYTE *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (CGPath)CGPath
{
  CGPath *v3;
  const CGPath *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPath *v10;
  CGPath *Mutable;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  objc_super *v22;
  double v23;
  double v24;
  CGFloat v25;
  double x;
  double y;
  double width;
  double height;
  CGFloat v30;
  CGAffineTransform v32;
  CGAffineTransform v33;
  objc_super v34;
  objc_super v35;
  _CUIGraphicVariantVectorGlyph *v36;
  objc_super v37;
  objc_super v38;
  objc_super v39;
  objc_super v40;
  CGRect v41;
  CGRect v42;
  CGRect BoundingBox;
  CGRect v44;

  v40.receiver = self;
  v40.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  v3 = -[CUINamedVectorGlyph CGPath](&v40, sel_CGPath);
  if (!v3)
    return 0;
  v4 = v3;
  -[CUINamedVectorGlyph scale](self, "scale");
  v6 = v5;
  -[_CUIGraphicVariantVectorGlyph _sizeOfBackgroundShape](self, "_sizeOfBackgroundShape");
  v7 = 0.0;
  v10 = -[_CUIGraphicVariantVectorGlyph _createBackgroundShapeInRect:scale:](self, "_createBackgroundShapeInRect:scale:", 0.0, 0.0, v8, v9, v6);
  Mutable = CGPathCreateMutable();
  CGPathAddPath(Mutable, 0, v10);
  v39.receiver = self;
  v39.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  -[CUINamedVectorGlyph alignmentRectUnrounded](&v39, sel_alignmentRectUnrounded);
  v13 = v12;
  v15 = v14;
  v38.receiver = self;
  v38.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  -[CUINamedVectorGlyph contentBoundsUnrounded](&v38, sel_contentBoundsUnrounded);
  v17 = v16;
  v19 = v18;
  if ((id)-[_CUIGraphicVariantVectorGlyph _effectiveCenteringStyle](self, "_effectiveCenteringStyle") == (id)1)
  {
    v7 = v17 - v13;
    v37.receiver = self;
    v37.super_class = (Class)_CUIGraphicVariantVectorGlyph;
    -[CUINamedVectorGlyph baselineOffsetUnrounded](&v37, sel_baselineOffsetUnrounded);
    v21 = v20;
    v36 = self;
    v22 = (objc_super *)&v36;
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)_CUIGraphicVariantVectorGlyph;
    -[CUINamedVectorGlyph baselineOffsetUnrounded](&v35, sel_baselineOffsetUnrounded);
    v21 = v23;
    v34.receiver = self;
    v22 = &v34;
    v19 = v15;
  }
  v22->super_class = (Class)_CUIGraphicVariantVectorGlyph;
  -[objc_super capHeightUnrounded](v22, sel_capHeightUnrounded);
  v25 = v24;
  CGAffineTransformMakeScale(&v33, v6, v6);
  v41.origin.x = v7;
  v41.origin.y = v21;
  v41.size.width = v19;
  v41.size.height = v25;
  v42 = CGRectApplyAffineTransform(v41, &v33);
  x = v42.origin.x;
  y = v42.origin.y;
  width = v42.size.width;
  height = v42.size.height;
  BoundingBox = CGPathGetBoundingBox(v10);
  v30 = BoundingBox.size.width * 0.5 - (x + width * 0.5);
  v44 = CGPathGetBoundingBox(v10);
  memset(&v32, 0, sizeof(v32));
  CGAffineTransformMakeTranslation(&v32, v30, v44.size.height * 0.5 - (y + height * 0.5));
  CGPathAddPath(Mutable, &v32, v4);
  CGPathRelease(v10);
  CFAutorelease(Mutable);
  return Mutable;
}

- (CGImage)image
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[CUINamedVectorGlyph scale](self, "scale");
  v4 = v3;
  -[_CUIGraphicVariantVectorGlyph _sizeOfBackgroundShape](self, "_sizeOfBackgroundShape");
  return (CGImage *)CFAutorelease(-[_CUIGraphicVariantVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:](self, "rasterizeImageUsingScaleFactor:forTargetSize:", v4, v5, v6));
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4
{
  double height;
  double width;
  CGImage *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  BOOL v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGImage *v26;
  CGImage *v27;
  objc_super v29;

  height = a4.height;
  width = a4.width;
  v8 = -[_CUIGraphicVariantVectorGlyph _createBackgroundImageOfSize:scale:](self, "_createBackgroundImageOfSize:scale:", a4.width, a4.height, a3);
  -[_CUIGraphicVariantVectorGlyph _interiorAlignmentRectUnroundedForTargetSize:](self, "_interiorAlignmentRectUnroundedForTargetSize:", width, height);
  v13 = width * a3 < 56.0 || height * a3 < 56.0;
  if (v13 || (v12 * a3 >= 32.0 ? (v14 = v11 * a3 < 32.0) : (v14 = 1), v14))
  {
    v16 = 0.0;
    v15 = 1;
  }
  else
  {
    v15 = 0;
    v16 = a3;
  }
  -[_CUIGraphicVariantVectorGlyph _scaledContentRectForBackgroundSize:baseContentRect:snappingScale:](self, "_scaledContentRectForBackgroundSize:baseContentRect:snappingScale:", width, height, v9, v10, v11, v12, v16);
  v20 = v19;
  v22 = v21;
  v23 = v17;
  v24 = v18;
  if (v15)
    v25 = a3 + a3;
  else
    v25 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  v26 = -[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:](&v29, sel_rasterizeImageUsingScaleFactor_forTargetSize_, v25, v17, v18);
  v27 = -[_CUIGraphicVariantVectorGlyph _createGraphicVariantImageAtScale:backgroundImage:symbolImage:destinationRect:disableColorFill:outputScale:](self, "_createGraphicVariantImageAtScale:backgroundImage:symbolImage:destinationRect:disableColorFill:outputScale:", v8, v26, 0, v25, v20, v22, v23, v24, a3);
  CGImageRelease(v26);
  CGImageRelease(v8);
  return v27;
}

- (void)drawInContext:(CGContext *)a3
{
  CGImage *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGAffineTransform v15;
  CGRect v16;
  CGRect v17;

  v5 = -[_CUIGraphicVariantVectorGlyph image](self, "image");
  -[_CUIGraphicVariantVectorGlyph alignmentRect](self, "alignmentRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[CUINamedVectorGlyph scale](self, "scale");
  CGAffineTransformMakeScale(&v15, v14, v14);
  v16.origin.x = v7;
  v16.origin.y = v9;
  v16.size.width = v11;
  v16.size.height = v13;
  v17 = CGRectApplyAffineTransform(v16, &v15);
  CGContextDrawImage(a3, v17, v5);
}

- (CGImage)imageWithColorResolver:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;

  -[CUINamedVectorGlyph scale](self, "scale");
  v6 = v5;
  -[_CUIGraphicVariantVectorGlyph _sizeOfBackgroundShape](self, "_sizeOfBackgroundShape");
  return -[_CUIGraphicVariantVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withColorResolver:](self, "rasterizeImageUsingScaleFactor:forTargetSize:withColorResolver:", a3, v6, v7, v8);
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withColorResolver:(id)a5
{
  double height;
  double width;
  CGImage *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  BOOL v16;
  int v17;
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
  CGImage *v28;
  CGImage *v29;
  objc_super v31;

  height = a4.height;
  width = a4.width;
  v10 = -[_CUIGraphicVariantVectorGlyph _createBackgroundImageOfSize:scale:](self, "_createBackgroundImageOfSize:scale:", a4.width, a4.height, a3);
  -[_CUIGraphicVariantVectorGlyph _interiorAlignmentRectUnroundedForTargetSize:](self, "_interiorAlignmentRectUnroundedForTargetSize:", width, height);
  v15 = width * a3 < 56.0 || height * a3 < 56.0;
  if (v15 || (v14 * a3 >= 32.0 ? (v16 = v13 * a3 < 32.0) : (v16 = 1), v16))
  {
    v18 = 0.0;
    v17 = 1;
  }
  else
  {
    v17 = 0;
    v18 = a3;
  }
  -[_CUIGraphicVariantVectorGlyph _scaledContentRectForBackgroundSize:baseContentRect:snappingScale:](self, "_scaledContentRectForBackgroundSize:baseContentRect:snappingScale:", width, height, v11, v12, v13, v14, v18);
  v22 = v21;
  v24 = v23;
  v25 = v19;
  v26 = v20;
  if (v17)
    v27 = a3 + a3;
  else
    v27 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  v28 = -[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withColorResolver:](&v31, sel_rasterizeImageUsingScaleFactor_forTargetSize_withColorResolver_, a5, v27, v19, v20);
  v29 = -[_CUIGraphicVariantVectorGlyph _createGraphicVariantImageAtScale:backgroundImage:symbolImage:destinationRect:disableColorFill:outputScale:](self, "_createGraphicVariantImageAtScale:backgroundImage:symbolImage:destinationRect:disableColorFill:outputScale:", v10, v28, 1, v27, v22, v24, v25, v26, a3);
  CGImageRelease(v28);
  CGImageRelease(v10);
  return v29;
}

- (unint64_t)numberOfMulticolorLayers
{
  return 1;
}

- (void)drawMulticolorLayerAtIndex:(unint64_t)a3 inContext:(CGContext *)a4 withColorResolver:(id)a5
{
  CGImage *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;

  v7 = -[_CUIGraphicVariantVectorGlyph imageWithColorResolver:](self, "imageWithColorResolver:", a5);
  -[_CUIGraphicVariantVectorGlyph alignmentRect](self, "alignmentRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[CUINamedVectorGlyph scale](self, "scale");
  CGAffineTransformMakeScale(&v17, v16, v16);
  v18.origin.x = v9;
  v18.origin.y = v11;
  v18.size.width = v13;
  v18.size.height = v15;
  v19 = CGRectApplyAffineTransform(v18, &v17);
  CGContextDrawImage(a4, v19, v7);
  CGImageRelease(v7);
}

- (CGImage)imageWithHierarchyColorResolver:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;

  -[CUINamedVectorGlyph scale](self, "scale");
  v6 = v5;
  -[_CUIGraphicVariantVectorGlyph _sizeOfBackgroundShape](self, "_sizeOfBackgroundShape");
  return -[_CUIGraphicVariantVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withHierarchyColorResolver:](self, "rasterizeImageUsingScaleFactor:forTargetSize:withHierarchyColorResolver:", a3, v6, v7, v8);
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withHierarchyColorResolver:(id)a5
{
  double height;
  double width;
  CGImage *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  BOOL v16;
  int v17;
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
  CGImage *v28;
  CGImage *v29;
  objc_super v31;

  height = a4.height;
  width = a4.width;
  v10 = -[_CUIGraphicVariantVectorGlyph _createBackgroundImageOfSize:scale:](self, "_createBackgroundImageOfSize:scale:", a4.width, a4.height, a3);
  -[_CUIGraphicVariantVectorGlyph _interiorAlignmentRectUnroundedForTargetSize:](self, "_interiorAlignmentRectUnroundedForTargetSize:", width, height);
  v15 = width * a3 < 56.0 || height * a3 < 56.0;
  if (v15 || (v14 * a3 >= 32.0 ? (v16 = v13 * a3 < 32.0) : (v16 = 1), v16))
  {
    v18 = 0.0;
    v17 = 1;
  }
  else
  {
    v17 = 0;
    v18 = a3;
  }
  -[_CUIGraphicVariantVectorGlyph _scaledContentRectForBackgroundSize:baseContentRect:snappingScale:](self, "_scaledContentRectForBackgroundSize:baseContentRect:snappingScale:", width, height, v11, v12, v13, v14, v18);
  v22 = v21;
  v24 = v23;
  v25 = v19;
  v26 = v20;
  if (v17)
    v27 = a3 + a3;
  else
    v27 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  v28 = -[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withHierarchyColorResolver:](&v31, sel_rasterizeImageUsingScaleFactor_forTargetSize_withHierarchyColorResolver_, a5, v27, v19, v20);
  v29 = -[_CUIGraphicVariantVectorGlyph _createGraphicVariantImageAtScale:backgroundImage:symbolImage:destinationRect:disableColorFill:outputScale:](self, "_createGraphicVariantImageAtScale:backgroundImage:symbolImage:destinationRect:disableColorFill:outputScale:", v10, v28, 1, v27, v22, v24, v25, v26, a3);
  CGImageRelease(v28);
  CGImageRelease(v10);
  return v29;
}

- (unint64_t)numberOfHierarchyLayers
{
  return 1;
}

- (void)drawHierarchyLayerAtIndex:(unint64_t)a3 inContext:(CGContext *)a4 withColorResolver:(id)a5
{
  CGImage *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;

  v7 = -[_CUIGraphicVariantVectorGlyph imageWithHierarchyColorResolver:](self, "imageWithHierarchyColorResolver:", a5);
  -[_CUIGraphicVariantVectorGlyph alignmentRect](self, "alignmentRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[CUINamedVectorGlyph scale](self, "scale");
  CGAffineTransformMakeScale(&v17, v16, v16);
  v18.origin.x = v9;
  v18.origin.y = v11;
  v18.size.width = v13;
  v18.size.height = v15;
  v19 = CGRectApplyAffineTransform(v18, &v17);
  CGContextDrawImage(a4, v19, v7);
  CGImageRelease(v7);
}

- (CGImage)imageWithPaletteColorResolver:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;

  -[CUINamedVectorGlyph scale](self, "scale");
  v6 = v5;
  -[_CUIGraphicVariantVectorGlyph _sizeOfBackgroundShape](self, "_sizeOfBackgroundShape");
  return -[_CUIGraphicVariantVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColorResolver:](self, "rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColorResolver:", a3, v6, v7, v8);
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withPaletteColorResolver:(id)a5
{
  double height;
  double width;
  CGImage *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  BOOL v16;
  int v17;
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
  CGImage *v28;
  CGImage *v29;
  objc_super v31;

  height = a4.height;
  width = a4.width;
  v10 = -[_CUIGraphicVariantVectorGlyph _createBackgroundImageOfSize:scale:](self, "_createBackgroundImageOfSize:scale:", a4.width, a4.height, a3);
  -[_CUIGraphicVariantVectorGlyph _interiorAlignmentRectUnroundedForTargetSize:](self, "_interiorAlignmentRectUnroundedForTargetSize:", width, height);
  v15 = width * a3 < 56.0 || height * a3 < 56.0;
  if (v15 || (v14 * a3 >= 32.0 ? (v16 = v13 * a3 < 32.0) : (v16 = 1), v16))
  {
    v18 = 0.0;
    v17 = 1;
  }
  else
  {
    v17 = 0;
    v18 = a3;
  }
  -[_CUIGraphicVariantVectorGlyph _scaledContentRectForBackgroundSize:baseContentRect:snappingScale:](self, "_scaledContentRectForBackgroundSize:baseContentRect:snappingScale:", width, height, v11, v12, v13, v14, v18);
  v22 = v21;
  v24 = v23;
  v25 = v19;
  v26 = v20;
  if (v17)
    v27 = a3 + a3;
  else
    v27 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  v28 = -[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColorResolver:](&v31, sel_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColorResolver_, a5, v27, v19, v20);
  v29 = -[_CUIGraphicVariantVectorGlyph _createGraphicVariantImageAtScale:backgroundImage:symbolImage:destinationRect:disableColorFill:outputScale:](self, "_createGraphicVariantImageAtScale:backgroundImage:symbolImage:destinationRect:disableColorFill:outputScale:", v10, v28, 1, v27, v22, v24, v25, v26, a3);
  CGImageRelease(v28);
  CGImageRelease(v10);
  return v29;
}

- (void)drawPaletteLayerAtIndex:(unint64_t)a3 inContext:(CGContext *)a4 withColorResolver:(id)a5
{
  CGImage *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;

  v7 = -[_CUIGraphicVariantVectorGlyph imageWithPaletteColorResolver:](self, "imageWithPaletteColorResolver:", a5);
  -[_CUIGraphicVariantVectorGlyph alignmentRect](self, "alignmentRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[CUINamedVectorGlyph scale](self, "scale");
  CGAffineTransformMakeScale(&v17, v16, v16);
  v18.origin.x = v9;
  v18.origin.y = v11;
  v18.size.width = v13;
  v18.size.height = v15;
  v19 = CGRectApplyAffineTransform(v18, &v17);
  CGContextDrawImage(a4, v19, v7);
  CGImageRelease(v7);
}

- (CGImage)imageWithPaletteColors:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;

  -[CUINamedVectorGlyph scale](self, "scale");
  v6 = v5;
  -[_CUIGraphicVariantVectorGlyph _sizeOfBackgroundShape](self, "_sizeOfBackgroundShape");
  return -[_CUIGraphicVariantVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColors:](self, "rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColors:", a3, v6, v7, v8);
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withPaletteColors:(id)a5
{
  double height;
  double width;
  id v10;
  id v11;
  CGImage *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  BOOL v18;
  int v19;
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
  CGImage *v30;
  CGImage *v31;
  objc_super v33;
  _QWORD v34[7];

  height = a4.height;
  width = a4.width;
  v10 = objc_msgSend(a5, "count");
  v11 = objc_msgSend(-[CUINamedVectorGlyph hierarchyLayers](self, "hierarchyLayers"), "lastIndex");
  v12 = -[_CUIGraphicVariantVectorGlyph _createBackgroundImageOfSize:scale:](self, "_createBackgroundImageOfSize:scale:", width, height, a3);
  -[_CUIGraphicVariantVectorGlyph _interiorAlignmentRectUnroundedForTargetSize:](self, "_interiorAlignmentRectUnroundedForTargetSize:", width, height);
  v17 = width * a3 < 56.0 || height * a3 < 56.0;
  if (v17 || (v16 * a3 >= 32.0 ? (v18 = v15 * a3 < 32.0) : (v18 = 1), v18))
  {
    v20 = 0.0;
    v19 = 1;
  }
  else
  {
    v19 = 0;
    v20 = a3;
  }
  -[_CUIGraphicVariantVectorGlyph _scaledContentRectForBackgroundSize:baseContentRect:snappingScale:](self, "_scaledContentRectForBackgroundSize:baseContentRect:snappingScale:", width, height, v13, v14, v15, v16, v20);
  v24 = v23;
  v26 = v25;
  v27 = v21;
  v28 = v22;
  if (v19)
    v29 = a3 + a3;
  else
    v29 = a3;
  v34[1] = 3221225472;
  v34[2] = __96___CUIGraphicVariantVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColors___block_invoke;
  v34[3] = &unk_1E41AB408;
  v34[5] = v10;
  v34[6] = v11;
  v34[4] = a5;
  v33.receiver = self;
  v33.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  v34[0] = _NSConcreteStackBlock;
  v30 = -[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColorResolver:](&v33, sel_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColorResolver_, v34, v29, v21, v22);
  v31 = -[_CUIGraphicVariantVectorGlyph _createGraphicVariantImageAtScale:backgroundImage:symbolImage:destinationRect:disableColorFill:outputScale:](self, "_createGraphicVariantImageAtScale:backgroundImage:symbolImage:destinationRect:disableColorFill:outputScale:", v12, v30, 1, v29, v24, v26, v27, v28, a3);
  CGImageRelease(v30);
  CGImageRelease(v12);
  return v31;
}

- (void)drawInContext:(CGContext *)a3 withPaletteColors:(id)a4
{
  CGImage *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGAffineTransform v16;
  CGRect v17;
  CGRect v18;

  v6 = -[_CUIGraphicVariantVectorGlyph imageWithPaletteColors:](self, "imageWithPaletteColors:", a4);
  -[_CUIGraphicVariantVectorGlyph alignmentRect](self, "alignmentRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CUINamedVectorGlyph scale](self, "scale");
  CGAffineTransformMakeScale(&v16, v15, v15);
  v17.origin.x = v8;
  v17.origin.y = v10;
  v17.size.width = v12;
  v17.size.height = v14;
  v18 = CGRectApplyAffineTransform(v17, &v16);
  CGContextDrawImage(a3, v18, v6);
  CGImageRelease(v6);
}

- (CGSize)_sizeOfBackgroundShape
{
  CUIVectorGlyphGraphicVariantOptions *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v3 = -[_CUIGraphicVariantVectorGlyph options](self, "options");
  -[CUINamedVectorGlyph pointSize](self, "pointSize");
  v5 = v4 + v4 * 0.1 * 2.0;
  -[CUINamedVectorGlyph glyphContinuousSize](self, "glyphContinuousSize");
  +[CUIVectorGlyphMutator transformForGlyphContinuousSize:](CUIVectorGlyphMutator, "transformForGlyphContinuousSize:");
  v7 = v5 * v6;
  v8 = -[CUIVectorGlyphGraphicVariantOptions shape](v3, "shape");
  if (v8 == (id)2)
  {
    v10 = v7 + v7 * 0.1725 * 2.0;
  }
  else
  {
    if (v8)
      v9 = 0.0;
    else
      v9 = v7;
    if (v8 == (id)1)
      v10 = v7;
    else
      v10 = v9;
    if (v8 != (id)1)
      v7 = v9;
  }
  v11 = v7;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGRect)_safeContentAreaBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_CUIGraphicVariantVectorGlyph _sizeOfBackgroundShape](self, "_sizeOfBackgroundShape");
  -[_CUIGraphicVariantVectorGlyph _safeContentAreaBoundsForBackgroundSize:](self, "_safeContentAreaBoundsForBackgroundSize:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (int64_t)_effectiveCenteringStyle
{
  CUIVectorGlyphGraphicVariantOptions *v2;
  int64_t result;

  v2 = -[_CUIGraphicVariantVectorGlyph options](self, "options");
  result = -[CUIVectorGlyphGraphicVariantOptions imageCentering](v2, "imageCentering");
  if (!result)
    return (unint64_t)-[CUIVectorGlyphGraphicVariantOptions shape](v2, "shape") < 3;
  return result;
}

- (CGRect)_safeContentAreaBoundsForBackgroundSize:(CGSize)a3
{
  double height;
  double width;
  int64_t v5;
  double x;
  double y;
  double v8;
  double v9;
  CGRect result;

  height = a3.height;
  width = a3.width;
  v5 = -[CUIVectorGlyphGraphicVariantOptions shape](-[_CUIGraphicVariantVectorGlyph options](self, "options"), "shape");
  if (v5 == 2)
  {
    y = height * 0.1;
    x = height * 0.1725;
  }
  else
  {
    if (v5 == 1)
    {
      v9 = width * 0.5 * 1.41421356;
      y = (width - v9) * 0.5;
      v8 = v9;
      x = y;
      goto LABEL_9;
    }
    if (v5)
    {
      x = CGRectZero.origin.x;
      y = CGRectZero.origin.y;
      v8 = CGRectZero.size.width;
      v9 = CGRectZero.size.height;
      goto LABEL_9;
    }
    x = width * 0.1;
    y = height * 0.1;
  }
  v8 = width + x * -2.0;
  v9 = height + y * -2.0;
LABEL_9:
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_defaultScaledContentRectForBackgroundSize:(CGSize)a3 safeContentArea:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  CUIVectorGlyphGraphicVariantOptions *v11;
  char *v12;
  int64_t v13;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  BOOL v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  objc_super *v46;
  double v47;
  CGFloat v48;
  double v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGAffineTransform v62;
  objc_super v63;
  objc_super v64;
  _CUIGraphicVariantVectorGlyph *v65;
  objc_super v66;
  objc_super v67;
  objc_super v68;
  CGRect v69;
  CGRect v70;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.height;
  v9 = a3.width;
  v11 = -[_CUIGraphicVariantVectorGlyph options](self, "options");
  v12 = -[CUIVectorGlyphGraphicVariantOptions imageScaling](v11, "imageScaling");
  v13 = -[CUIVectorGlyphGraphicVariantOptions imageAlignment](v11, "imageAlignment");
  v68.receiver = self;
  v68.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  -[CUINamedVectorGlyph alignmentRectUnrounded](&v68, sel_alignmentRectUnrounded);
  v15 = v14;
  v60 = v16;
  v18 = v17;
  v67.receiver = self;
  v67.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  -[CUINamedVectorGlyph contentBoundsUnrounded](&v67, sel_contentBoundsUnrounded);
  v56 = v19;
  v57 = v20;
  if ((unint64_t)v12 < 2)
  {
    v29 = v8;
    v21 = floor(width * 0.5);
    v22 = floor(height * 0.5);
  }
  else
  {
    v21 = floor(v9 * 0.5);
    v22 = floor(v8 * 0.5);
    v23 = floor(width * 0.5);
    v24 = floor(height * 0.5);
    if (v12 == (char *)3)
      v25 = height;
    else
      v25 = 0.0;
    if (v12 == (char *)3)
      v26 = width;
    else
      v26 = 0.0;
    if (v12 == (char *)3)
      v27 = y;
    else
      v27 = 0.0;
    if (v12 == (char *)3)
      v28 = x;
    else
      v28 = 0.0;
    if (v12 != (char *)3)
    {
      v24 = 0.0;
      v23 = 0.0;
    }
    v29 = v8;
    if (v12 == (char *)2)
      height = v8;
    else
      height = v25;
    if (v12 == (char *)2)
      width = v9;
    else
      width = v26;
    if (v12 == (char *)2)
      y = 0.0;
    else
      y = v27;
    if (v12 == (char *)2)
      x = 0.0;
    else
      x = v28;
    if (v12 != (char *)2)
    {
      v22 = v24;
      v21 = v23;
    }
  }
  v30 = v29;
  switch(v13)
  {
    case 1:
      x = x + v21 * 0.5;
      goto LABEL_35;
    case 2:
      goto LABEL_35;
    case 3:
      x = width + x - v21;
LABEL_35:
      y = height + y - v22;
      goto LABEL_40;
    case 4:
      goto LABEL_39;
    case 5:
      x = x + v21 * 0.5;
      goto LABEL_40;
    case 6:
      goto LABEL_40;
    case 7:
      x = width + x - v21;
      goto LABEL_40;
    case 8:
      x = width + x - v21;
LABEL_39:
      y = y + v22 * 0.5;
LABEL_40:
      v31 = v60;
      break;
    default:
      v22 = height;
      v21 = width;
      v31 = v60;
      v30 = v29;
      break;
  }
  if ((unint64_t)(v12 - 1) >= 2)
  {
    v32 = 1.0;
    if (v12 == (char *)3 && (v31 > v21 || v18 > v22))
    {
      v34 = fmin(v21 / v31, v22 / v18);
      v35 = fmin(v34, 0.5);
      if (v13)
        v32 = v35;
      else
        v32 = v34;
    }
  }
  else
  {
    v32 = fmin(v21 / v31, v22 / v18);
  }
  v58 = v21;
  v59 = v22;
  v61 = v18;
  v36 = x;
  if ((id)-[CUIVectorGlyphGraphicVariantOptions shapeEffect](v11, "shapeEffect") == (id)1)
  {
    -[CUINamedVectorGlyph scale](self, "scale");
    v38 = v30 * v37;
    v39 = 0.8046875;
    if (v38 < 256.0)
      v39 = 0.8125;
    v40 = v38 < 64.0;
    v41 = 0.833;
    if (!v40)
      v41 = v39;
    v32 = v32 * v41;
  }
  v42 = y;
  if ((id)-[_CUIGraphicVariantVectorGlyph _effectiveCenteringStyle](self, "_effectiveCenteringStyle") == (id)1)
  {
    v43 = v56 - v15;
    v66.receiver = self;
    v66.super_class = (Class)_CUIGraphicVariantVectorGlyph;
    -[CUINamedVectorGlyph baselineOffsetUnrounded](&v66, sel_baselineOffsetUnrounded);
    v45 = v44;
    v65 = self;
    v46 = (objc_super *)&v65;
    v47 = v31;
    v48 = v57;
  }
  else
  {
    v64.receiver = self;
    v64.super_class = (Class)_CUIGraphicVariantVectorGlyph;
    -[CUINamedVectorGlyph baselineOffsetUnrounded](&v64, sel_baselineOffsetUnrounded);
    v45 = v49;
    v63.receiver = self;
    v43 = 0.0;
    v46 = &v63;
    v48 = v31;
    v47 = v31;
  }
  v46->super_class = (Class)_CUIGraphicVariantVectorGlyph;
  -[objc_super capHeightUnrounded](v46, sel_capHeightUnrounded);
  v51 = v50;
  CGAffineTransformMakeScale(&v62, v32, v32);
  v69.origin.x = v43;
  v69.origin.y = v45;
  v69.size.width = v48;
  v69.size.height = v51;
  v70 = CGRectApplyAffineTransform(v69, &v62);
  v52 = v36 + v58 * 0.5 - (v70.origin.x + v70.size.width * 0.5);
  v53 = v42 + v59 * 0.5 - (v70.origin.y + v70.size.height * 0.5);
  v54 = v47 * v32;
  v55 = v61 * v32;
  result.size.height = v55;
  result.size.width = v54;
  result.origin.y = v53;
  result.origin.x = v52;
  return result;
}

- (CGRect)_scaledContentRectForBackgroundSize:(CGSize)a3 baseContentRect:(CGRect)a4 snappingScale:(double)a5
{
  float64x2_t v5;
  float64_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  double v11;
  float64x2_t v12;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v22;
  double v23;
  double v24;
  CGFloat y;
  CGFloat height;
  CGFloat v28;
  CGFloat v29;
  CGFloat x;
  CGFloat width;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  v29 = a3.height;
  x = a4.origin.x;
  v28 = a3.width;
  -[CUIVectorGlyphGraphicVariantOptions imageOffset](-[_CUIGraphicVariantVectorGlyph options](self, "options"), "imageOffset");
  v10.f64[0] = height;
  v5.f64[0] = y;
  v7.f64[1] = v6;
  v8.f64[0] = v29;
  v8.f64[1] = v28;
  v5.f64[1] = x;
  v9 = vmlaq_f64(v5, v8, v7);
  v10.f64[1] = width;
  if (a5 >= 0.999999881)
  {
    v12 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a5, 0);
    __asm { FMOV            V16.2D, #0.5 }
    v18 = vaddq_f64(vmulq_f64(v10, _Q16), v9);
    v19 = vdivq_f64(vrndaq_f64(vmulq_n_f64(v9, a5)), v12);
    v20 = vrndmq_f64(vmulq_n_f64(vaddq_f64(v10, v9), a5));
    v9 = vdivq_f64(v20, v12);
    __asm { FMOV            V7.2D, #1.0 }
    v22 = vdivq_f64(vaddq_f64(v20, _Q7), v12);
    v10 = vsubq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(vsubq_f64(vmulq_f64(vaddq_f64(v19, v22), _Q16), v18), vsubq_f64(v18, vmulq_f64(vaddq_f64(v19, v9), _Q16))), (int8x16_t)v9, (int8x16_t)v22), v19);
    v11 = v19.f64[1];
    v9.f64[0] = v19.f64[0];
  }
  else
  {
    v11 = v9.f64[1];
  }
  v23 = v10.f64[1];
  v24 = v9.f64[0];
  result.size.height = v10.f64[0];
  result.size.width = v23;
  result.origin.y = v24;
  result.origin.x = v11;
  return result;
}

- (CGImage)_createGraphicVariantImageAtScale:(double)a3 backgroundImage:(CGImage *)a4 symbolImage:(CGImage *)a5 destinationRect:(CGRect)a6 disableColorFill:(BOOL)a7 outputScale:(double)a8
{
  _BOOL4 v9;
  double y;
  double x;
  double v15;
  CIImage *v16;
  CIImage *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  CIImage *v27;
  CIFilter *v28;
  NSString *v29;
  id v30;
  CIFilter *v31;
  CIImage *v32;
  id v33;
  double v35;
  double v36;

  v9 = a7;
  y = a6.origin.y;
  x = a6.origin.x;
  v15 = vabdd_f64(a3, a8);
  v16 = +[CIImage imageWithCGImage:](CIImage, "imageWithCGImage:", a4);
  v17 = +[CIImage imageWithCGImage:](CIImage, "imageWithCGImage:", a5);
  -[CIImage extent](v16, "extent");
  v20 = v18;
  v21 = v19;
  v22 = 1.0;
  if (v15 > 0.00000011920929)
    v22 = a3;
  v36 = 1.0;
  v23 = -[_CUIGraphicVariantVectorGlyph _createContentEffectsForTargetSize:scale:](self, "_createContentEffectsForTargetSize:scale:", &v36, v18 * v22, v19 * v22);
  if (v23)
  {
    v24 = v23;
    if (v9)
      objc_msgSend(v23, "setBypassColorFills:", 1);
    v17 = (CIImage *)objc_msgSend(v24, "processedImageFromImage:withScale:", v17, v36);

  }
  v35 = 1.0;
  v25 = -[_CUIGraphicVariantVectorGlyph _createShapeEffectsForTargetSize:scale:](self, "_createShapeEffectsForTargetSize:scale:", &v35, v20, v21);
  if (v25)
  {
    v26 = v25;
    v16 = (CIImage *)objc_msgSend(v25, "processedImageFromImage:withScale:", v16, v35);

  }
  v27 = +[CUIShapeEffectStack offset:by:](CUIShapeEffectStack, "offset:by:", v17, x * a3, y * a3);
  if (v15 <= 0.00000011920929)
  {
    v29 = kCIInputImageKey;
  }
  else
  {
    v28 = +[CIFilter filterWithString:](CIFilter, "filterWithString:", CFSTR("CIAppleSmithGossettScale"));
    v29 = kCIInputImageKey;
    -[CIFilter setValue:forKey:](v28, "setValue:forKey:", v27, kCIInputImageKey);
    -[CIFilter setValue:forKey:](v28, "setValue:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a8 / a3), kCIInputScaleKey);
    v27 = -[CIFilter outputImage](v28, "outputImage");
  }
  v30 = +[CUIShapeEffectStack composite:over:](CUIShapeEffectStack, "composite:over:", v27, v16);
  v31 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CICrop"));
  -[CIFilter setValue:forKey:](v31, "setValue:forKey:", v30, v29);
  -[CIFilter setValue:forKey:](v31, "setValue:forKey:", +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", 0.0, 0.0, v20, v21), CFSTR("inputRectangle"));
  v32 = -[CIFilter outputImage](v31, "outputImage");
  v33 = +[CUIShapeEffectStack sharedCIContext](CUIShapeEffectStack, "sharedCIContext");
  -[CIImage extent](v32, "extent");
  return (CGImage *)objc_msgSend(v33, "createCGImage:fromRect:", v32);
}

- (CGImage)_createBackgroundImageOfSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  uint64_t v8;
  size_t v9;
  CGColorSpace *DisplayP3;
  uint64_t v11;
  uint64_t v12;
  CGImage *result;
  CGContext *v14;
  CGImage *Image;

  height = a3.height;
  width = a3.width;
  if (-[_CUIGraphicVariantVectorGlyph _containsWideGamutColor](self, "_containsWideGamutColor"))
  {
    v8 = 4097;
    v9 = 16;
    DisplayP3 = (CGColorSpace *)_CUIColorSpaceGetDisplayP3();
  }
  else
  {
    v8 = 8193;
    v9 = 8;
    DisplayP3 = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  }
  result = CUICGBitmapContextCreate(vcvtpd_u64_f64(width * a4), vcvtpd_u64_f64(height * a4), v9, 0, DisplayP3, v8, v11, v12);
  if (result)
  {
    v14 = result;
    -[_CUIGraphicVariantVectorGlyph _drawBackgroundShapeInContext:targetSize:scale:](self, "_drawBackgroundShapeInContext:targetSize:scale:", result, width, height, a4);
    Image = CGBitmapContextCreateImage(v14);
    CFRelease(v14);
    return Image;
  }
  return result;
}

- (CGPath)_createBackgroundShapeInRect:(CGRect)a3 scale:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CUIVectorGlyphGraphicVariantOptions *v9;
  id v10;
  __n128 v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = -[_CUIGraphicVariantVectorGlyph options](self, "options");
  v10 = -[CUIVectorGlyphGraphicVariantOptions shape](v9, "shape");
  CGAffineTransformMakeScale(&v17, a4, a4);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v19 = CGRectApplyAffineTransform(v18, &v17);
  v20 = CGRectIntegral(v19);
  v12 = v20.origin.x;
  v13 = v20.origin.y;
  v14 = v20.size.width;
  v15 = v20.size.height;
  if (v10 == (id)2 || v10 == (id)1)
  {
    v20.origin.x = v20.size.height * 0.5;
    goto LABEL_6;
  }
  if (!v10)
  {
    -[CUIVectorGlyphGraphicVariantOptions roundedRectCornerRadius](v9, "roundedRectCornerRadius");
    v20.origin.x = v14 * v20.origin.x;
LABEL_6:
    v11.n128_f64[0] = fmax(v20.origin.x, 0.0);
    v20.origin.x = v12;
    v20.origin.y = v13;
    v20.size.width = v14;
    v20.size.height = v15;
    return (CGPath *)_CUICreateNewContinuousRoundedRect((__n128)v20.origin, *(__n128 *)&v20.origin.y, (__n128)v20.size, *(__n128 *)&v20.size.height, v11);
  }
  return 0;
}

- (CGGradient)_createBackgroundGradientWithColors:(id)a3
{
  id v4;
  uint64_t SRGB;
  CGColorSpace *v6;
  CGColor *v7;
  CGColorSpace *v8;
  CGColor *v9;
  double v10;
  double v11;
  _BOOL4 v12;
  CGColor *v13;
  CGColor *v14;
  CGColorSpace *GrayGamma2_2;
  CGColor *CopyByMatchingToColorSpace;
  double v17;
  CGColorSpace *v18;
  CGColor *v19;
  double v20;
  CGColor *v21;
  CGColor *v22;
  CGGradient *v23;
  CGColorSpaceRef ColorSpace;
  const CGFloat *Components;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGColorRef v33;
  CGColor *v34;
  CGColor *v35;
  _QWORD v36[2];
  _QWORD v37[3];
  CGFloat locations[2];
  uint64_t v39;

  v4 = objc_msgSend(a3, "count");
  SRGB = _CUIColorSpaceGetSRGB();
  if (v4 == (id)2)
  {
    v13 = (CGColor *)objc_msgSend(a3, "firstObject");
    v14 = (CGColor *)objc_msgSend(a3, "lastObject");
    GrayGamma2_2 = (CGColorSpace *)_CUIColorSpaceGetGrayGamma2_2();
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(GrayGamma2_2, kCGRenderingIntentRelativeColorimetric, v13, 0);
    v17 = *CGColorGetComponents(CopyByMatchingToColorSpace);
    CGColorRelease(CopyByMatchingToColorSpace);
    v18 = (CGColorSpace *)_CUIColorSpaceGetGrayGamma2_2();
    v19 = CGColorCreateCopyByMatchingToColorSpace(v18, kCGRenderingIntentRelativeColorimetric, v14, 0);
    v20 = *CGColorGetComponents(v19);
    CGColorRelease(v19);
    if (v17 <= v20)
      v21 = v13;
    else
      v21 = v14;
    if (v17 <= v20)
      v22 = v14;
    else
      v22 = v13;
    *(_OWORD *)locations = xmmword_19EC72128;
    v39 = 0;
    v36[0] = v21;
    v36[1] = v22;
    return CGGradientCreateWithColors(0, (CFArrayRef)+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2), locations);
  }
  else
  {
    if (v4 != (id)1)
      return CGGradientCreateWithColors(0, (CFArrayRef)a3, 0);
    v6 = (CGColorSpace *)SRGB;
    v7 = (CGColor *)objc_msgSend(a3, "firstObject");
    v8 = (CGColorSpace *)_CUIColorSpaceGetGrayGamma2_2();
    v9 = CGColorCreateCopyByMatchingToColorSpace(v8, kCGRenderingIntentRelativeColorimetric, v7, 0);
    v10 = *CGColorGetComponents(v9);
    v11 = 0.25;
    if (v10 <= 0.25)
    {
      v12 = 0;
      v11 = 0.2;
    }
    else if (v10 <= 0.5)
    {
      v12 = 0;
    }
    else
    {
      v12 = v10 > 0.75;
      v11 = dbl_19EC72140[v10 > 0.75];
    }
    ColorSpace = CGColorGetColorSpace(v7);
    if ((CGColorSpaceEqualToColorSpace(v6, ColorSpace) & 1) != 0)
      CGColorRetain(v7);
    else
      v7 = CGColorCreateCopyByMatchingToColorSpace(v6, kCGRenderingIntentRelativeColorimetric, v7, 0);
    Components = CGColorGetComponents(v7);
    v27 = Components[1];
    v28 = Components[2];
    v29 = fmin(*Components, fmin(v27, v28));
    v30 = fmax(*Components, fmax(v27, v28));
    v31 = (v29 + v30) * 0.5;
    if (v31 <= 0.0)
      v31 = 1.0;
    v32 = v11 * v31;
    v33 = CGColorCreateSRGB(*Components + v32 - (*Components + v32 - (v29 + v32 + v30 + v32) * 0.5) * 0.2, v27 + v32 - (v27 + v32 - (v29 + v32 + v30 + v32) * 0.5) * 0.2, v28 + v32 - (v28 + v32 - (v29 + v32 + v30 + v32) * 0.5) * 0.2, Components[3]);
    if (v12)
      v34 = v7;
    else
      v34 = v33;
    if (v12)
      v35 = v33;
    else
      v35 = v7;
    *(_OWORD *)locations = xmmword_19EC72110;
    v39 = 0x3FF0000000000000;
    v37[0] = v35;
    v37[1] = v35;
    v37[2] = v34;
    v23 = CGGradientCreateWithColors(0, (CFArrayRef)+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 3), locations);
    CGColorRelease(v9);
    CGColorRelease(v35);
    CGColorRelease(v34);
  }
  return v23;
}

- (CGRect)_backgroundShapeBoundsForTargetSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  int64_t v7;
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
  CGRect result;

  height = a3.height;
  width = a3.width;
  v7 = -[CUIVectorGlyphGraphicVariantOptions shapeEffect](-[_CUIGraphicVariantVectorGlyph options](self, "options"), "shapeEffect");
  v8 = 0.0;
  if (v7 == 1)
  {
    v9 = 0.8046875;
    if (height * a4 < 256.0)
      v9 = 0.8125;
    v10 = 0.833;
    if (height * a4 >= 64.0)
      v10 = v9;
    v11 = CUIEdgeInsetsMake((height - height * v10) * 0.5, (height - height * v10) * 0.5, (height - height * v10) * 0.5, (height - height * v10) * 0.5);
    v15 = CUIEdgeInsetsInsetRect(0.0, 0.0, width, height, v11, v12, v13, v14);
    width = v16;
    height = v17;
  }
  else
  {
    v15 = 0.0;
  }
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v8;
  result.origin.x = v15;
  return result;
}

- (void)_drawBackgroundShapeInContext:(CGContext *)a3 targetSize:(CGSize)a4 scale:(double)a5
{
  double height;
  double width;
  CUIVectorGlyphGraphicVariantOptions *v10;
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
  CGPath *v21;
  id v22;
  NSArray *v23;
  CGGradient *v24;
  CGPath *v25;
  CGPath *v26;
  CGPath *Mutable;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  CGFloat v54;
  CGColor *SRGB;
  CGColor *v56;
  _BOOL4 v57;
  double v58;
  double v59;
  CGFloat v60;
  CGFloat v61;
  CGColor *v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  double v67;
  double v68;
  CGFloat v69;
  CGFloat v70;
  CGAffineTransform v71;
  CGPoint v72;
  CGPoint v73;
  CGPoint v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect ClipBoundingBox;

  height = a4.height;
  width = a4.width;
  v10 = -[_CUIGraphicVariantVectorGlyph options](self, "options");
  -[CUIVectorGlyphGraphicVariantOptions borderWidth](v10, "borderWidth");
  v12 = v11 / a5;
  -[_CUIGraphicVariantVectorGlyph _backgroundShapeBoundsForTargetSize:scale:](self, "_backgroundShapeBoundsForTargetSize:scale:", width, height, a5);
  v17 = v13;
  v18 = v14;
  v19 = v15;
  v20 = v16;
  if (v12 > 0.0)
    *(CGRect *)&v13 = CGRectInset(*(CGRect *)&v13, v12, v12);
  v21 = -[_CUIGraphicVariantVectorGlyph _createBackgroundShapeInRect:scale:](self, "_createBackgroundShapeInRect:scale:", v13, v14, v15, v16, a5);
  v22 = -[CUIVectorGlyphGraphicVariantOptions fill](v10, "fill");
  v23 = -[CUIVectorGlyphGraphicVariantOptions fillColors](v10, "fillColors");
  CGContextSaveGState(a3);
  if (v22 == (id)2)
  {
    v24 = -[_CUIGraphicVariantVectorGlyph _createBackgroundGradientWithColors:](self, "_createBackgroundGradientWithColors:", v23);
    CGContextAddPath(a3, v21);
    CGContextClip(a3);
    v72.x = width * a5 * 0.5;
    v72.y = height * a5 * 0.5;
    CGContextDrawRadialGradient(a3, v24, v72, v72.y, v72, 0.0, 3u);
LABEL_9:
    CGGradientRelease(v24);
    goto LABEL_10;
  }
  if (v22 == (id)1)
  {
    v24 = -[_CUIGraphicVariantVectorGlyph _createBackgroundGradientWithColors:](self, "_createBackgroundGradientWithColors:", v23);
    CGContextAddPath(a3, v21);
    CGContextClip(a3);
    v73.x = width * a5 * 0.5;
    v74.y = height * a5;
    v73.y = 0.0;
    v74.x = v73.x;
    CGContextDrawLinearGradient(a3, v24, v73, v74, 3u);
    goto LABEL_9;
  }
  if (!v22)
  {
    CGContextSetFillColorWithColor(a3, (CGColorRef)-[NSArray objectAtIndex:](v23, "objectAtIndex:", 0));
    CGContextAddPath(a3, v21);
    CGContextFillPath(a3);
  }
LABEL_10:
  if (v12 > 0.0)
  {
    CGContextSaveGState(a3);
    CGContextResetClip(a3);
    v75.origin.x = v17;
    v75.origin.y = v18;
    v75.size.width = v19;
    v75.size.height = v20;
    v76 = CGRectInset(v75, v12 + 0.5, v12 + 0.5);
    v25 = -[_CUIGraphicVariantVectorGlyph _createBackgroundShapeInRect:scale:](self, "_createBackgroundShapeInRect:scale:", v76.origin.x, v76.origin.y, v76.size.width, v76.size.height, a5);
    v26 = -[_CUIGraphicVariantVectorGlyph _createBackgroundShapeInRect:scale:](self, "_createBackgroundShapeInRect:scale:", v17, v18, v19, v20, a5);
    Mutable = CGPathCreateMutable();
    CGPathAddPath(Mutable, 0, v25);
    CGPathAddPath(Mutable, 0, v26);
    CGContextAddPath(a3, Mutable);
    CGContextSetFillColorWithColor(a3, (CGColorRef)-[CUIVectorGlyphGraphicVariantOptions borderColor](v10, "borderColor"));
    CGContextEOFillPath(a3);
    CGPathRelease(Mutable);
    CGPathRelease(v25);
    CGPathRelease(v26);
    CGContextRestoreGState(a3);
  }
  CGContextRestoreGState(a3);
  if (_CUIDebugShowGraphicVariantMetrics())
  {
    -[_CUIGraphicVariantVectorGlyph _safeContentAreaBoundsForBackgroundSize:](self, "_safeContentAreaBoundsForBackgroundSize:", width, height);
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    -[_CUIGraphicVariantVectorGlyph interiorAlignmentRectForTargetSize:scale:](self, "interiorAlignmentRectForTargetSize:scale:", width, height, a5);
    v65 = v37;
    v66 = v36;
    v63 = v39;
    v64 = v38;
    -[_CUIGraphicVariantVectorGlyph alignmentRectForTargetSize:scale:](self, "alignmentRectForTargetSize:scale:", width, height, a5);
    v69 = v41;
    v70 = v40;
    v67 = v43;
    v68 = v42;
    v44 = height * a5;
    if ((id)-[CUIVectorGlyphGraphicVariantOptions shapeEffect](v10, "shapeEffect") == (id)1)
    {
      v45 = 0.8046875;
      if (v44 < 256.0)
        v45 = 0.8125;
      if (v44 < 64.0)
        v45 = 0.833;
      v46 = CUIEdgeInsetsMake((v35 - v35 * (v45 * a5)) * 0.5, (v35 - v35 * (v45 * a5)) * 0.5, (v35 - v35 * (v45 * a5)) * 0.5, (v35 - v35 * (v45 * a5)) * 0.5);
      v29 = CUIEdgeInsetsInsetRect(v29, v31, v33, v35, v46, v47, v48, v49);
      v31 = v50;
      v33 = v51;
      v35 = v52;
    }
    CGContextSaveGState(a3);
    CGContextSetBlendMode(a3, kCGBlendModeCopy);
    CGContextSetLineWidth(a3, 1.0);
    CGContextSetShouldAntialias(a3, 0);
    CGAffineTransformMakeScale(&v71, a5, a5);
    v77.origin.x = v29;
    v77.origin.y = v31;
    v77.size.width = v33;
    v77.size.height = v35;
    v78 = CGRectApplyAffineTransform(v77, &v71);
    CGContextAddRect(a3, v78);
    v53 = height * 0.5 * a5;
    CGContextMoveToPoint(a3, 0.0, v53);
    CGContextAddLineToPoint(a3, width * a5, v53);
    v54 = width * 0.5 * a5;
    CGContextMoveToPoint(a3, v54, 0.0);
    CGContextAddLineToPoint(a3, v54, v44);
    SRGB = CGColorCreateSRGB(1.0, 0.0, 1.0, 1.0);
    CGContextSetStrokeColorWithColor(a3, SRGB);
    CGContextStrokePath(a3);
    CGColorRelease(SRGB);
    v79.origin.y = v65;
    v79.origin.x = v66;
    v79.size.height = v63;
    v79.size.width = v64;
    CGContextAddRect(a3, v79);
    v56 = CGColorCreateSRGB(1.0, 1.0, 0.0, 1.0);
    CGContextSetStrokeColorWithColor(a3, v56);
    CGContextStrokePath(a3);
    CGColorRelease(v56);
    ClipBoundingBox = CGContextGetClipBoundingBox(a3);
    v80.origin.x = v70;
    v80.origin.y = v69;
    v80.size.width = v68;
    v80.size.height = v67;
    v57 = CGRectEqualToRect(v80, ClipBoundingBox);
    if (v57)
      v58 = v68 + -1.0;
    else
      v58 = v68;
    if (v57)
      v59 = v67 + -1.0;
    else
      v59 = v67;
    v60 = v70;
    v61 = v69;
    CGContextAddRect(a3, *(CGRect *)(&v58 - 2));
    v62 = CGColorCreateSRGB(1.0, 0.0, 0.0, 1.0);
    CGContextSetStrokeColorWithColor(a3, v62);
    CGContextStrokePath(a3);
    CGColorRelease(v62);
    CGContextRestoreGState(a3);
  }
  CGPathRelease(v21);
}

- (id)_createContentEffectsForTargetSize:(CGSize)a3 scale:(double *)a4
{
  double height;
  CUIVectorGlyphGraphicVariantOptions *v6;
  unint64_t v7;
  const __CFString *v8;
  id v9;
  CUIShapeEffectStack *v10;
  double v11;
  double v12;

  height = a3.height;
  v6 = -[_CUIGraphicVariantVectorGlyph options](self, "options", a3.width);
  v7 = -[CUIVectorGlyphGraphicVariantOptions contentEffect](v6, "contentEffect");
  if (height >= 0.0)
  {
    if (v7 > 2)
      v8 = 0;
    else
      v8 = off_1E41AB428[v7];
  }
  else
  {
    v8 = CFSTR("CUIVectorGlyphGraphicVariantContentEffectNone");
  }
  v9 = +[CUIDesignLibraryCompositeCatalog compositeCatalogForDesignSystem:colorScheme:contrast:styling:error:](CUIDesignLibraryCompositeCatalog, "compositeCatalogForDesignSystem:colorScheme:contrast:styling:error:", 0, 0, 0, 0, 0);
  if (!v9)
    return 0;
  v10 = (CUIShapeEffectStack *)objc_msgSend(v9, "shapeEffectPresetWithName:error:", v8, 0);
  if (v10)
  {
    v10 = -[CUIShapeEffectStack initWithEffectPreset:]([CUIShapeEffectStack alloc], "initWithEffectPreset:", v10);
    if (-[CUIVectorGlyphGraphicVariantOptions monochromeForegroundColor](v6, "monochromeForegroundColor"))
      -[CUIShapeEffectStack applyCustomForegroundColor:tintEffectColors:](v10, "applyCustomForegroundColor:tintEffectColors:", -[CUIVectorGlyphGraphicVariantOptions monochromeForegroundColor](v6, "monochromeForegroundColor"), 1);
    if (v10)
    {
      v11 = height * *a4;
      v12 = 1.0;
      if (v11 > 32.0)
        v12 = v11 / 992.0 * 10.0;
      -[CUIShapeEffectStack scaleEffectParametersBy:](v10, "scaleEffectParametersBy:", v12);
      *a4 = v12;
    }
  }
  return v10;
}

- (id)_createShapeEffectsForTargetSize:(CGSize)a3 scale:(double *)a4
{
  double height;
  id v6;
  CUIShapeEffectStack *v7;
  CUIShapeEffectStack *v8;
  double v9;
  double v10;

  height = a3.height;
  if ((id)-[CUIVectorGlyphGraphicVariantOptions shapeEffect](-[_CUIGraphicVariantVectorGlyph options](self, "options", a3.width), "shapeEffect") != (id)1)return 0;
  v6 = +[CUIDesignLibraryCompositeCatalog compositeCatalogForDesignSystem:colorScheme:contrast:styling:error:](CUIDesignLibraryCompositeCatalog, "compositeCatalogForDesignSystem:colorScheme:contrast:styling:error:", 0, 0, 0, 0, 0);
  if (!v6)
    return 0;
  v7 = (CUIShapeEffectStack *)objc_msgSend(v6, "shapeEffectPresetWithName:error:", CFSTR("CUIVectorGlyphGraphicVariantShapeEffectDropShadow"), 0);
  if (v7)
  {
    v8 = -[CUIShapeEffectStack initWithEffectPreset:]([CUIShapeEffectStack alloc], "initWithEffectPreset:", v7);
    v7 = v8;
    if (v8)
    {
      v9 = height * *a4;
      v10 = 1.0;
      if (v9 > 32.0)
        v10 = v9 / 992.0 * 10.0;
      -[CUIShapeEffectStack scaleEffectParametersBy:](v8, "scaleEffectParametersBy:", v10);
      *a4 = v10;
    }
  }
  return v7;
}

- (CUIVectorGlyphGraphicVariantOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

@end
