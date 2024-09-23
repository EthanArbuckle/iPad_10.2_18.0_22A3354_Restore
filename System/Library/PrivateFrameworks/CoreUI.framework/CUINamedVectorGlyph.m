@implementation CUINamedVectorGlyph

- (unint64_t)hash
{
  unint64_t result;
  double variableMinValue;
  double variableMaxValue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUINamedVectorGlyph;
  result = (self->_layoutDirection << (self->_layoutDirection & 7))
         + 83
         * (((unint64_t)(self->_glyphWeight * 1000.0) << ((unint64_t)(self->_glyphWeight * 1000.0) & 7))
          + 83
          * (((unint64_t)(self->_glyphSize * 1000.0) << ((unint64_t)(self->_glyphSize * 1000.0) & 7))
           + 83
           * (((unint64_t)(self->_lookedupScaleFactor * 1000.0) << ((unint64_t)(self->_lookedupScaleFactor
                                                                                            * 1000.0) & 7))
            + 83
            * (((unint64_t)(self->_pointSize * 1000.0) << ((unint64_t)(self->_pointSize * 1000.0) & 7))
             + 83 * -[CUINamedLookup hash](&v6, sel_hash)))));
  variableMinValue = self->_variableMinValue;
  if (variableMinValue != INFINITY)
    result = ((unint64_t)(variableMinValue * 1000.0) << ((unint64_t)(variableMinValue * 1000.0) & 7))
           + 83 * result;
  variableMaxValue = self->_variableMaxValue;
  if (variableMaxValue != INFINITY)
    return ((unint64_t)(variableMaxValue * 1000.0) << ((unint64_t)(variableMaxValue * 1000.0) & 7))
         + 83 * result;
  return result;
}

- (CGImage)imageWithColorResolver:(id)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __46__CUINamedVectorGlyph_imageWithColorResolver___block_invoke;
  v4[3] = &unk_1E41AA960;
  v4[4] = a3;
  return (CGImage *)-[CUINamedVectorGlyph _imageForRenderingMode:withColorResolver:]((id *)&self->super.super.isa, 2, (uint64_t)v4);
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withColorResolver:(id)a5
{
  CGImage *v5;
  _QWORD v7[8];
  CGSize v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __86__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withColorResolver___block_invoke;
  v7[3] = &unk_1E41AA988;
  v7[5] = a5;
  v7[6] = &v9;
  *(double *)&v7[7] = a3;
  v8 = a4;
  v7[4] = self;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v7);
  v5 = (CGImage *)v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (CGImage)imageWithHierarchyColorResolver:(id)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __55__CUINamedVectorGlyph_imageWithHierarchyColorResolver___block_invoke;
  v4[3] = &unk_1E41AA960;
  v4[4] = a3;
  return (CGImage *)-[CUINamedVectorGlyph _imageForRenderingMode:withColorResolver:]((id *)&self->super.super.isa, 3, (uint64_t)v4);
}

- (CGRect)alignmentRectUnrounded
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[6];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  CGRect result;

  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x4010000000;
  v14 = &unk_19EC9DD21;
  v15 = 0u;
  v16 = 0u;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __45__CUINamedVectorGlyph_alignmentRectUnrounded__block_invoke;
  v10[3] = &unk_1E41AA7B8;
  v10[4] = self;
  v10[5] = &v11;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v10);
  v2 = v12[4];
  v3 = v12[5];
  v4 = v12[6];
  v5 = v12[7];
  _Block_object_dispose(&v11, 8);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  v9 = v5;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4
{
  CGImage *v4;
  _QWORD v6[7];
  CGSize v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __68__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize___block_invoke;
  v6[3] = &unk_1E41AA8E8;
  v6[4] = self;
  v6[5] = &v8;
  *(double *)&v6[6] = a3;
  v7 = a4;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v6);
  v4 = (CGImage *)v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (CGImage)image
{
  CGImage *cgImageRef;
  CGImage *v4;

  cgImageRef = self->_cgImageRef;
  if (cgImageRef && self->_variableMinValue == INFINITY && self->_variableMaxValue == INFINITY)
    goto LABEL_11;
  v4 = (CGImage *)-[CUINamedVectorGlyph _imageForRenderingMode:withColorResolver:]((id *)&self->super.super.isa, 1, (uint64_t)&__block_literal_global_0);
  cgImageRef = v4;
  if (self->_variableMinValue == INFINITY && self->_variableMaxValue == INFINITY)
  {
    self->_cgImageRef = v4;
    if (!v4)
      return cgImageRef;
  }
  else
  {
    CFAutorelease(v4);
    if (!cgImageRef)
      return cgImageRef;
  }
  if (cgImageRef == self->_cgImageRef)
  {
    cgImageRef = self->_cgImageRef;
LABEL_11:
    CGImageRetain(cgImageRef);
    CFAutorelease(cgImageRef);
  }
  return cgImageRef;
}

- (uint64_t)_imageForRenderingMode:(uint64_t)a3 withColorResolver:
{
  uint64_t v3;
  _QWORD v5[7];
  int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  if (!a1)
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __64__CUINamedVectorGlyph__imageForRenderingMode_withColorResolver___block_invoke;
  v5[3] = &unk_1E41AAB60;
  v6 = a2;
  v5[4] = a1;
  v5[5] = a3;
  v5[6] = &v7;
  -[CUINamedVectorGlyph _performWithLockedRenditions:](a1, (uint64_t)v5);
  v3 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (CGRect)contentBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[6];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  CGRect result;

  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x4010000000;
  v14 = &unk_19EC9DD21;
  v15 = 0u;
  v16 = 0u;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __36__CUINamedVectorGlyph_contentBounds__block_invoke;
  v10[3] = &unk_1E41AA7B8;
  v10[4] = self;
  v10[5] = &v11;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v10);
  v2 = v12[4];
  v3 = v12[5];
  v4 = v12[6];
  v5 = v12[7];
  _Block_object_dispose(&v11, 8);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  v9 = v5;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)alignmentRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[6];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  CGRect result;

  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x4010000000;
  v14 = &unk_19EC9DD21;
  v15 = 0u;
  v16 = 0u;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __36__CUINamedVectorGlyph_alignmentRect__block_invoke;
  v10[3] = &unk_1E41AA7B8;
  v10[4] = self;
  v10[5] = &v11;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v10);
  v2 = v12[4];
  v3 = v12[5];
  v4 = v12[6];
  v5 = v12[7];
  _Block_object_dispose(&v11, 8);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  v9 = v5;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (double)capHeight
{
  double v3;
  double v4;
  double v5;

  -[CUINamedVectorGlyph capHeightUnrounded](self, "capHeightUnrounded");
  v4 = v3;
  -[CUINamedVectorGlyph scale](self, "scale");
  return round(v4 * v5) / v5;
}

- (double)_interpolatedCapHeightWithWeight:(double)a3 glyphSize:(double)a4 fromUltralight:(double)a5 regular:(double)a6 black:(double)a7
{
  double v10;
  double v11;

  +[CUIVectorGlyphMutator scalarsForGlyphContinuousWeight:glyphContinuousSize:](CUIVectorGlyphMutator, "scalarsForGlyphContinuousWeight:glyphContinuousSize:", a3, a4);
  return a6 + (a5 - a6) * v10 + (a7 - a6) * v11;
}

- (id)debugDescription
{
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  uint64_t lookedupScaleFactor;
  double pointSize;
  uint64_t v13;
  NSString *v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  CGRect v20;

  switch(-[CUINamedVectorGlyph glyphWeight](self, "glyphWeight"))
  {
    case 0:
      -[CUINamedVectorGlyph glyphContinuousWeight](self, "glyphContinuousWeight");
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), v3);
      break;
    case 1:
      v4 = CFSTR("Ultralight");
      break;
    case 2:
      v4 = CFSTR("Thin");
      break;
    case 3:
      v4 = CFSTR("Light");
      break;
    case 4:
      v4 = CFSTR("Regular");
      break;
    case 5:
      v4 = CFSTR("Medium");
      break;
    case 6:
      v4 = CFSTR("Semibold");
      break;
    case 7:
      v4 = CFSTR("Bold");
      break;
    case 8:
      v4 = CFSTR("Heavy");
      break;
    case 9:
      v4 = CFSTR("Black");
      break;
    default:
      v4 = 0;
      break;
  }
  switch(-[CUINamedVectorGlyph glyphSize](self, "glyphSize"))
  {
    case 0:
      -[CUINamedVectorGlyph glyphContinuousSize](self, "glyphContinuousSize");
      v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), v5);
      break;
    case 1:
      v6 = CFSTR("Small");
      break;
    case 2:
      v6 = CFSTR("Medium");
      break;
    case 3:
      v6 = CFSTR("Large");
      break;
    default:
      v6 = 0;
      break;
  }
  -[CUINamedVectorGlyph alignmentRect](self, "alignmentRect");
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v20);
  v9 = objc_opt_class(self, v8);
  v10 = -[CUINamedLookup name](self, "name");
  lookedupScaleFactor = (int)self->_lookedupScaleFactor;
  pointSize = self->_pointSize;
  -[CUINamedVectorGlyph baselineOffset](self, "baselineOffset");
  v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> '%@' @%dx, %.0f-points, %@ weight, %@ size, baseline offset = %.2f, alignment rect = %@"), v9, self, v10, lookedupScaleFactor, *(_QWORD *)&pointSize, v4, v6, v13, DictionaryRepresentation);
  -[CUINamedVectorGlyph variableMinValue](self, "variableMinValue");
  if (v15 != INFINITY)
  {
    -[CUINamedVectorGlyph variableMinValue](self, "variableMinValue");
    v14 = -[NSString stringByAppendingFormat:](v14, "stringByAppendingFormat:", CFSTR(", variable min = %f"), v16);
  }
  -[CUINamedVectorGlyph variableMaxValue](self, "variableMaxValue");
  if (v17 != INFINITY)
  {
    -[CUINamedVectorGlyph variableMaxValue](self, "variableMaxValue");
    v14 = -[NSString stringByAppendingFormat:](v14, "stringByAppendingFormat:", CFSTR(", variable max = %f"), v18);
  }
  if (DictionaryRepresentation)
    CFRelease(DictionaryRepresentation);
  return v14;
}

- (double)baselineOffset
{
  double v3;
  double v4;
  double v5;

  -[CUINamedVectorGlyph baselineOffsetUnrounded](self, "baselineOffsetUnrounded");
  v4 = v3;
  -[CUINamedVectorGlyph scale](self, "scale");
  return round(v4 * v5) / v5;
}

- (double)_interpolatedBaselineOffsetWithWeight:(double)a3 glyphSize:(double)a4 fromUltralight:(double)a5 regular:(double)a6 black:(double)a7
{
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  +[CUIVectorGlyphMutator scalarsForGlyphContinuousWeight:glyphContinuousSize:](CUIVectorGlyphMutator, "scalarsForGlyphContinuousWeight:glyphContinuousSize:", a3);
  v13 = v12;
  v15 = v14;
  +[CUIVectorGlyphMutator transformForGlyphContinuousSize:](CUIVectorGlyphMutator, "transformForGlyphContinuousSize:", a4);
  v17 = v16;
  v19 = v18;
  -[CUINamedVectorGlyph referencePointSize](self, "referencePointSize");
  return (a6 + (a5 - a6) * v13 + (a7 - a6) * v15) * v17 - v19 * v20;
}

- (int64_t)preferredRenderingMode
{
  int64_t result;

  result = (int64_t)objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "vectorGlyphRenderingMode");
  if ((unint64_t)result <= 1)
    return 1;
  return result;
}

float64x2_t __36__CUINamedVectorGlyph_alignmentRect__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  double v8;
  double v9;
  void *v10;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  float64x2_t v38;
  float64x2_t v39;
  CGFloat v40;
  CGFloat v41;
  float64x2_t v42;
  float64x2_t result;
  float64_t v44;
  double v45;
  double v46;
  float64x2_t v47;
  float64_t v48;
  uint64_t v49;
  double v50;
  double v51;
  float64_t v52;
  float64x2_t v53;
  CGAffineTransform v54;

  objc_msgSend(*(id *)(a1 + 32), "referenceCanvasSize");
  v48 = v9;
  v50 = v8;
  if (a3 && a4)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v10, "glyphContinuousWeight");
    v51 = v11;
    objc_msgSend(*(id *)(a1 + 32), "glyphContinuousSize");
    v45 = v12;
    objc_msgSend(a3, "vectorGlyphAlignmentRectInsets");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(a2, "vectorGlyphAlignmentRectInsets");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    objc_msgSend(a4, "vectorGlyphAlignmentRectInsets");
    objc_msgSend(v10, "_interpolatedAlignmentRectInsetsWithWeight:glyphSize:fromUltralight:regular:black:", v51, v45, v14, v16, v18, v20, v22, v24, v26, v28, v29, v30, v31, v32);
  }
  else
  {
    objc_msgSend(a2, "vectorGlyphAlignmentRectInsets");
  }
  v52 = v33;
  v44 = v34;
  objc_msgSend(*(id *)(a1 + 32), "_requestedPointSizeRatio");
  v46 = v35;
  objc_msgSend(*(id *)(a1 + 32), "scale");
  v37 = v36;
  v39.f64[0] = v50;
  v38.f64[0] = v52;
  v38.f64[1] = v44;
  v39.f64[1] = v48;
  v40 = v46;
  if (v46 > 0.0)
  {
    v53 = vmulq_n_f64(v38, v46);
    memset(&v54, 0, sizeof(v54));
    v41 = v46;
    v47 = v39;
    v49 = v37;
    CGAffineTransformMakeScale(&v54, v41, v40);
    v37 = v49;
    v38 = v53;
    v39 = vmlaq_n_f64(vmulq_laneq_f64(*(float64x2_t *)&v54.c, v47, 1), *(float64x2_t *)&v54.a, v50);
  }
  v42 = (float64x2_t)vdupq_lane_s64(v37, 0);
  *(float64x2_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = vdivq_f64(vrndaq_f64(vmulq_n_f64(v38, *(double *)&v37)), v42);
  result = vdivq_f64(vrndpq_f64(vmulq_n_f64(v39, *(double *)&v37)), v42);
  *(float64x2_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) = result;
  return result;
}

- (double)scale
{
  return self->_lookedupScaleFactor;
}

- (double)_requestedPointSizeRatio
{
  double v3;
  double v4;
  double v5;
  BOOL v6;
  double v7;
  double v8;
  double v9;

  -[CUINamedVectorGlyph pointSize](self, "pointSize");
  v4 = v3;
  -[CUINamedVectorGlyph referencePointSize](self, "referencePointSize");
  v6 = v5 < 1.0 || v4 < 1.0;
  v7 = v4 / v5;
  if (v6)
    v8 = 1.0;
  else
    v8 = v7;
  -[CUINamedVectorGlyph fontMatchingScaleFactor](self, "fontMatchingScaleFactor");
  return v9 * v8;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (double)referencePointSize
{
  double result;

  objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "vectorGlyphReferencePointSize");
  return result;
}

- (double)fontMatchingScaleFactor
{
  return self->_fontMatchingScaleFactor;
}

- (CGSize)referenceCanvasSize
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
  double v18;
  CGSize result;

  if (self->_ultralightInterpolationSource && self->_blackInterpolationSource)
  {
    -[CUINamedVectorGlyph glyphContinuousWeight](self, "glyphContinuousWeight");
    v4 = v3;
    -[CUINamedVectorGlyph glyphContinuousSize](self, "glyphContinuousSize");
    v6 = v5;
    objc_msgSend(-[CUINamedVectorGlyph _ultralightRendition](self, "_ultralightRendition"), "canvasSize");
    v8 = v7;
    v10 = v9;
    objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "canvasSize");
    v12 = v11;
    v14 = v13;
    objc_msgSend(-[CUINamedVectorGlyph _blackRendition](self, "_blackRendition"), "canvasSize");
    -[CUINamedVectorGlyph _interpolatedCanvasSizeWithWeight:glyphSize:fromUltralight:regular:black:](self, "_interpolatedCanvasSizeWithWeight:glyphSize:fromUltralight:regular:black:", v4, v6, v8, v10, v12, v14, v15, v16);
  }
  else
  {
    objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "canvasSize");
  }
  result.height = v18;
  result.width = v17;
  return result;
}

- (int64_t)glyphWeight
{
  uint64_t v2;

  v2 = 0;
  while (*(double *)&kCoreThemeContinuousGlyphWeights[v2] != self->_glyphWeight)
  {
    if (++v2 == 9)
      return 0;
  }
  return kCoreThemeDiscreteGlyphWeights[v2];
}

- (int64_t)glyphSize
{
  uint64_t v2;

  v2 = 0;
  while (*(double *)&kCoreThemeContinuousGlyphSizes[v2] != self->_glyphSize)
  {
    if (++v2 == 3)
      return 0;
  }
  return kCoreThemeDiscreteGlyphSizes[v2];
}

- (id)_performWithLockedRenditions:(id *)result
{
  id *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  if (result)
  {
    v3 = result;
    objc_msgSend(result, "lock");
    v4 = objc_msgSend(v3, "_rendition");
    v10 = v4;
    objc_msgSend(v4, "lock");
    v5 = v4;
    v6 = objc_msgSend(v3[16], "_rendition");
    v11 = v6;
    objc_msgSend(v6, "lock");
    v7 = v6;
    v8 = objc_msgSend(v3[17], "_rendition");
    v12 = v8;
    objc_msgSend(v8, "lock");
    v9 = v8;
    v3[26] = &v10;
    (*(void (**)(uint64_t, id, id, id))(a2 + 16))(a2, v4, v6, v8);
    v3[26] = 0;
    objc_msgSend(v10, "unlock");

    objc_msgSend(v11, "unlock");
    objc_msgSend(v12, "unlock");

    return (id *)objc_msgSend(v3, "unlock");
  }
  return result;
}

- (id)_assumeConcatenatedPathForLayerNamed:(void *)a3 inRendition:
{
  id result;
  uint64_t RootNode;
  uint64_t ChildAtIndex;
  uint64_t ChildCount;
  id v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  id v14;
  __int128 v15[3];

  result = 0;
  if (a1 && a3)
  {
    RootNode = CGSVGDocumentGetRootNode(objc_msgSend(a3, "svgDocument"));
    ChildAtIndex = CGSVGNodeGetChildAtIndex(RootNode, 0);
    ChildCount = CGSVGNodeGetChildCount();
    v9 = +[NSMutableArray array](NSMutableArray, "array");
    if (ChildCount)
    {
      for (i = 0; i != ChildCount; ++i)
      {
        v11 = (void *)CGSVGNodeGetChildAtIndex(ChildAtIndex, i);
        if (CGSVGNodeGetType(v11) == 2 && CGSVGNodeFindAttribute(v11, 4))
        {
          v12 = (void *)CGSVGAttributeCopyString();
          if (objc_msgSend(objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(" ")), "containsObject:", a2))
          {
            v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
            v15[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
            v15[1] = v13;
            v15[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
            v14 = CUICreatePathFromSVGNode(v11, v15);
            objc_msgSend(v9, "addObject:", v14);

          }
        }
      }
    }
    return +[CUIVectorGlyphPath createConcatenatingPaths:](CUIVectorGlyphPath, "createConcatenatingPaths:", v9);
  }
  return result;
}

float64x2_t __36__CUINamedVectorGlyph_contentBounds__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  double v8;
  double v9;
  void *v10;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  CGFloat v45;
  CGFloat v46;
  float64x2_t v47;
  float64x2_t result;
  float64_t v49;
  float64_t v50;
  double v51;
  float64x2_t v52;
  float64_t v53;
  uint64_t v54;
  double v55;
  double v56;
  float64_t v57;
  float64x2_t v58;
  double v59;
  float64_t v60;
  float64x2_t v61;
  CGAffineTransform v62;

  objc_msgSend(*(id *)(a1 + 32), "referenceCanvasSize");
  v53 = v9;
  v55 = v8;
  if (a3 && a4)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v10, "glyphContinuousWeight");
    v59 = v11;
    objc_msgSend(*(id *)(a1 + 32), "glyphContinuousSize");
    v56 = v12;
    objc_msgSend(a3, "vectorGlyphAlignmentRectInsets");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(a2, "vectorGlyphAlignmentRectInsets");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    objc_msgSend(a4, "vectorGlyphAlignmentRectInsets");
    objc_msgSend(v10, "_interpolatedAlignmentRectInsetsWithWeight:glyphSize:fromUltralight:regular:black:", v59, v56, v14, v16, v18, v20, v22, v24, v26, v28, v29, v30, v31, v32);
  }
  else
  {
    objc_msgSend(a2, "vectorGlyphAlignmentRectInsets");
  }
  v49 = v35;
  v50 = v33;
  v57 = v36;
  v60 = v34;
  objc_msgSend(*(id *)(a1 + 32), "_requestedPointSizeRatio");
  v51 = v37;
  objc_msgSend(*(id *)(a1 + 32), "scale");
  v39 = v38;
  v41.f64[0] = v55;
  v40.f64[0] = v57;
  v40.f64[1] = v49;
  v41.f64[1] = v53;
  v42.f64[0] = v60;
  v42.f64[1] = v50;
  v43 = v42;
  v44 = v40;
  if (v51 > 0.0)
  {
    v58 = vmulq_n_f64(v40, v51);
    v61 = vmulq_n_f64(v43, v51);
    memset(&v62, 0, sizeof(v62));
    v45 = v51;
    v46 = v51;
    v52 = v41;
    v54 = v39;
    CGAffineTransformMakeScale(&v62, v45, v46);
    v39 = v54;
    v44 = v58;
    v43 = v61;
    v41 = vmlaq_n_f64(vmulq_laneq_f64(*(float64x2_t *)&v62.c, v52, 1), *(float64x2_t *)&v62.a, v55);
  }
  v47 = (float64x2_t)vdupq_lane_s64(v39, 0);
  *(CGPoint *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = CGPointZero;
  result = vaddq_f64(vdivq_f64(vrndaq_f64(vmulq_n_f64(v44, *(double *)&v39)), v47), vaddq_f64(vdivq_f64(vrndpq_f64(vmulq_n_f64(v41, *(double *)&v39)), v47), vdivq_f64(vrndaq_f64(vmulq_n_f64(v43, *(double *)&v39)), v47)));
  *(float64x2_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) = result;
  return result;
}

- (double)_interpolatedAlignmentRectInsetsWithWeight:(double)a3 glyphSize:(double)a4 fromUltralight:(double)a5 regular:(double)a6 black:(double)a7
{
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  +[CUIVectorGlyphMutator scalarsForGlyphContinuousWeight:glyphContinuousSize:](CUIVectorGlyphMutator, "scalarsForGlyphContinuousWeight:glyphContinuousSize:", a1, a2);
  v18 = v17;
  v20 = v19;
  +[CUIVectorGlyphMutator transformForGlyphContinuousSize:](CUIVectorGlyphMutator, "transformForGlyphContinuousSize:", a2);
  return (a9 + (a3 - a9) * v18 + (a13 - a9) * v20) * v21;
}

- (CGSize)_interpolatedCanvasSizeWithWeight:(double)a3 glyphSize:(double)a4 fromUltralight:(CGSize)a5 regular:(CGSize)a6 black:(CGSize)a7
{
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double height;
  CGSize result;

  height = a7.height;
  width = a7.width;
  v8 = a6.height;
  v9 = a6.width;
  v10 = a5.height;
  v11 = a5.width;
  +[CUIVectorGlyphMutator scalarsForGlyphContinuousWeight:glyphContinuousSize:](CUIVectorGlyphMutator, "scalarsForGlyphContinuousWeight:glyphContinuousSize:", a3);
  v14 = v13;
  v16 = v15;
  +[CUIVectorGlyphMutator transformForGlyphContinuousSize:](CUIVectorGlyphMutator, "transformForGlyphContinuousSize:", a4);
  v18 = (v8 + (v10 - v8) * v14 + (height - v8) * v16) * v17;
  v19 = (v9 + (v11 - v9) * v14 + (width - v9) * v16) * v17;
  result.height = v18;
  result.width = v19;
  return result;
}

CGImageRef __68__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize___block_invoke(uint64_t a1)
{
  CGImageRef result;

  result = -[CUINamedVectorGlyph _rasterizeImageUsingScaleFactor:forTargetSize:renderingMode:colorResolver:](*(_QWORD **)(a1 + 32), 1, (uint64_t)&__block_literal_global_52, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

CGAffineTransform *__45__CUINamedVectorGlyph_alignmentRectUnrounded__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  double v8;
  double v9;
  void *v10;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGAffineTransform *result;
  double v38;
  float64x2_t v39;
  uint64_t v40;
  double v41;
  double v42;
  float64_t v43;
  float64x2_t v44;
  double v45;
  CGAffineTransform v46;

  objc_msgSend(*(id *)(a1 + 32), "referenceCanvasSize");
  v43 = v9;
  v45 = v8;
  if (a3 && a4)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v10, "glyphContinuousWeight");
    v42 = v11;
    objc_msgSend(*(id *)(a1 + 32), "glyphContinuousSize");
    v41 = v12;
    objc_msgSend(a3, "vectorGlyphAlignmentRectInsets");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(a2, "vectorGlyphAlignmentRectInsets");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    objc_msgSend(a4, "vectorGlyphAlignmentRectInsets");
    objc_msgSend(v10, "_interpolatedAlignmentRectInsetsWithWeight:glyphSize:fromUltralight:regular:black:", v42, v41, v14, v16, v18, v20, v22, v24, v26, v28, v29, v30, v31, v32);
  }
  else
  {
    objc_msgSend(a2, "vectorGlyphAlignmentRectInsets");
  }
  v35 = v33;
  v36 = v34;
  result = (CGAffineTransform *)objc_msgSend(*(id *)(a1 + 32), "_requestedPointSizeRatio");
  v39.f64[0] = v45;
  v39.f64[1] = v43;
  if (v38 > 0.0)
  {
    v35 = v35 * v38;
    v36 = v36 * v38;
    memset(&v46, 0, sizeof(v46));
    v44 = v39;
    result = CGAffineTransformMakeScale(&v46, v38, v38);
    v39 = vmlaq_n_f64(vmulq_laneq_f64(*(float64x2_t *)&v46.c, v44, 1), *(float64x2_t *)&v46.a, v45);
  }
  v40 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(double *)(v40 + 32) = v35;
  *(double *)(v40 + 40) = v36;
  *(float64x2_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) = v39;
  return result;
}

id __46__CUINamedVectorGlyph_numberOfHierarchyLayers__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;
  id result;

  v3 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v3 + 104) & 4) != 0)
    v4 = objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup]((_QWORD *)v3), "sublayers");
  else
    v4 = objc_msgSend((id)v3, "_layerNamesForRenderingMode:inRendition:", 3, a2);
  result = objc_msgSend(v4, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

CGImageRef __93__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColorResolver___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  CGImageRef result;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __93__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColorResolver___block_invoke_2;
  v4[3] = &unk_1E41AA960;
  v2 = *(_QWORD **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  result = -[CUINamedVectorGlyph _rasterizeImageUsingScaleFactor:forTargetSize:renderingMode:colorResolver:](v2, 4, (uint64_t)v4, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

CGImageRef __86__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withColorResolver___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  CGImageRef result;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __86__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withColorResolver___block_invoke_2;
  v4[3] = &unk_1E41AA960;
  v2 = *(_QWORD **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  result = -[CUINamedVectorGlyph _rasterizeImageUsingScaleFactor:forTargetSize:renderingMode:colorResolver:](v2, 2, (uint64_t)v4, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_drawHierarchicalLayersInContext:(CGContext *)a3 scaleFactor:(double)a4 targetSize:(CGSize)a5 colorResolver:(id)a6
{
  double height;
  double width;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  uint64_t v18;
  BOOL v19;
  void *i;
  void *v21;
  double v22;
  char v23;
  uint64_t v24;
  _BOOL4 v25;
  _BOOL4 v26;
  double v27;
  double v28;
  double v29;
  id v30;
  uint64_t SRGBBlack;
  uint64_t v32;
  uint64_t v33;
  id obj;
  _QWORD v36[7];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  height = a5.height;
  width = a5.width;
  if (objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup](self), "sublayers"), "count"))
  {
    -[CUINamedVectorGlyph variableMinValue](self, "variableMinValue");
    v13 = v12;
    -[CUINamedVectorGlyph variableMaxValue](self, "variableMaxValue");
    v15 = v14;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup](self), "sublayers");
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v38;
      v19 = v15 == INFINITY && v13 == INFINITY;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v21, "valueThreshold");
          v23 = v22 == INFINITY || v19;
          if ((v23 & 1) != 0)
          {
            v24 = -1;
          }
          else
          {
            v25 = v13 == INFINITY;
            if (v22 >= v13)
              v25 = 1;
            v26 = v22 <= v15;
            if (v22 <= 0.0)
              v26 = v22 < v15;
            if (v15 == INFINITY)
              v26 = 1;
            v24 = v25 & v26;
          }
          -[CUINamedVectorGlyph variableMinValue](self, "variableMinValue");
          v28 = v27;
          -[CUINamedVectorGlyph variableMaxValue](self, "variableMaxValue");
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472;
          v36[2] = __93__CUINamedVectorGlyph__drawHierarchicalLayersInContext_scaleFactor_targetSize_colorResolver___block_invoke;
          v36[3] = &unk_1E41AABB0;
          v36[5] = a6;
          v36[6] = v24;
          v36[4] = v21;
          objc_msgSend(v21, "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:hierarchicalColorResolver:", a3, v36, a4, width, height, v28, v29);
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v17);
    }
  }
  else
  {
    v30 = objc_msgSend((id)objc_opt_class(self, v11), "_layerHierarchyStyleNames");
    SRGBBlack = _CUIColorGetSRGBBlack();
    v32 = (*((uint64_t (**)(id, id, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD))a6 + 2))(a6, objc_msgSend(v30, "firstObject"), SRGBBlack, 0, 0, -1, 0);
    v33 = (*((uint64_t (**)(id, id, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD))a6 + 2))(a6, objc_msgSend(v30, "objectAtIndex:", 2), SRGBBlack, 0, 2, -1, 0);
    -[CUINamedVectorGlyph _drawInContext:scaleFactor:targetSize:primaryColor:tertiaryColor:](self, (uint64_t)a3, v32, v33, a4, width, height);
  }
}

- (void)_drawMulticolorLayersInContext:(CGContext *)a3 scaleFactor:(double)a4 targetSize:(CGSize)a5 colorResolver:(id)a6
{
  double height;
  double width;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  uint64_t v18;
  BOOL v19;
  void *i;
  void *v21;
  double v22;
  char v23;
  uint64_t v24;
  _BOOL4 v25;
  _BOOL4 v26;
  double v27;
  double v28;
  double v29;
  uint64_t SRGBBlack;
  id obj;
  _QWORD v32[7];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  height = a5.height;
  width = a5.width;
  if (objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph multicolorLayerGroup](self), "sublayers"), "count"))
  {
    -[CUINamedVectorGlyph variableMinValue](self, "variableMinValue");
    v13 = v12;
    -[CUINamedVectorGlyph variableMaxValue](self, "variableMaxValue");
    v15 = v14;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = objc_msgSend(-[CUINamedVectorGlyph multicolorLayerGroup](self), "sublayers");
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v34;
      v19 = v15 == INFINITY && v13 == INFINITY;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v21, "valueThreshold");
          v23 = v22 == INFINITY || v19;
          if ((v23 & 1) != 0)
          {
            v24 = -1;
          }
          else
          {
            v25 = v13 == INFINITY;
            if (v22 >= v13)
              v25 = 1;
            v26 = v22 <= v15;
            if (v22 <= 0.0)
              v26 = v22 < v15;
            if (v15 == INFINITY)
              v26 = 1;
            v24 = v25 & v26;
          }
          -[CUINamedVectorGlyph variableMinValue](self, "variableMinValue");
          v28 = v27;
          -[CUINamedVectorGlyph variableMaxValue](self, "variableMaxValue");
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = __91__CUINamedVectorGlyph__drawMulticolorLayersInContext_scaleFactor_targetSize_colorResolver___block_invoke;
          v32[3] = &unk_1E41AAB88;
          v32[5] = a6;
          v32[6] = v24;
          v32[4] = v21;
          objc_msgSend(v21, "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:colorResolver:", a3, v32, a4, width, height, v28, v29);
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v17);
    }
  }
  else
  {
    SRGBBlack = _CUIColorGetSRGBBlack();
    -[CUINamedVectorGlyph _drawInContext:scaleFactor:targetSize:primaryColor:tertiaryColor:](self, (uint64_t)a3, SRGBBlack, 0, a4, width, height);
  }
}

uint64_t __91__CUINamedVectorGlyph__drawMulticolorLayersInContext_scaleFactor_targetSize_colorResolver___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a2, a3, 0, 0, a1[6], a1[4]);
}

uint64_t __86__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withColorResolver___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_drawPaletteLayersInContext:(CGContext *)a3 scaleFactor:(double)a4 targetSize:(CGSize)a5 colorResolver:(id)a6
{
  double height;
  double width;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  uint64_t v18;
  BOOL v19;
  void *i;
  void *v21;
  double v22;
  char v23;
  uint64_t v24;
  _BOOL4 v25;
  _BOOL4 v26;
  double v27;
  double v28;
  double v29;
  id v30;
  uint64_t SRGBBlack;
  uint64_t v32;
  uint64_t v33;
  id obj;
  _QWORD v36[7];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  height = a5.height;
  width = a5.width;
  if (objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup](self), "sublayers"), "count"))
  {
    -[CUINamedVectorGlyph variableMinValue](self, "variableMinValue");
    v13 = v12;
    -[CUINamedVectorGlyph variableMaxValue](self, "variableMaxValue");
    v15 = v14;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup](self), "sublayers");
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v38;
      v19 = v15 == INFINITY && v13 == INFINITY;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v21, "valueThreshold");
          v23 = v22 == INFINITY || v19;
          if ((v23 & 1) != 0)
          {
            v24 = -1;
          }
          else
          {
            v25 = v13 == INFINITY;
            if (v22 >= v13)
              v25 = 1;
            v26 = v22 <= v15;
            if (v22 <= 0.0)
              v26 = v22 < v15;
            if (v15 == INFINITY)
              v26 = 1;
            v24 = v25 & v26;
          }
          -[CUINamedVectorGlyph variableMinValue](self, "variableMinValue");
          v28 = v27;
          -[CUINamedVectorGlyph variableMaxValue](self, "variableMaxValue");
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472;
          v36[2] = __88__CUINamedVectorGlyph__drawPaletteLayersInContext_scaleFactor_targetSize_colorResolver___block_invoke;
          v36[3] = &unk_1E41AABB0;
          v36[5] = a6;
          v36[6] = v24;
          v36[4] = v21;
          objc_msgSend(v21, "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:paletteColorResolver:", a3, v36, a4, width, height, v28, v29);
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v17);
    }
  }
  else
  {
    v30 = objc_msgSend((id)objc_opt_class(self, v11), "_layerHierarchyStyleNames");
    SRGBBlack = _CUIColorGetSRGBBlack();
    v32 = (*((uint64_t (**)(id, id, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD))a6 + 2))(a6, objc_msgSend(v30, "firstObject"), SRGBBlack, 0, 0, -1, 0);
    v33 = (*((uint64_t (**)(id, id, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD))a6 + 2))(a6, objc_msgSend(v30, "objectAtIndex:", 2), SRGBBlack, 0, 2, -1, 0);
    -[CUINamedVectorGlyph _drawInContext:scaleFactor:targetSize:primaryColor:tertiaryColor:](self, (uint64_t)a3, v32, v33, a4, width, height);
  }
}

- (id)hierarchicalLayers
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __41__CUINamedVectorGlyph_hierarchicalLayers__block_invoke;
  v4[3] = &unk_1E41AA830;
  v4[4] = self;
  v4[5] = &v5;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v4);
  v2 = (void *)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __88__CUINamedVectorGlyph__drawPaletteLayersInContext_scaleFactor_targetSize_colorResolver___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t SRGBBlack;

  v6 = a1[5];
  SRGBBlack = _CUIColorGetSRGBBlack();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, 0, SRGBBlack, a2, a3, a1[6], a1[4]);
}

uint64_t __93__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColorResolver___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __86__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColors___block_invoke_3(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v3;
  uint64_t v4;

  v4 = a1 + 32;
  v3 = *(void **)(a1 + 32);
  if (*(_QWORD *)(v4 + 8) <= a3)
    return objc_msgSend(v3, "lastObject");
  else
    return objc_msgSend(v3, "objectAtIndex:");
}

- (unint64_t)numberOfHierarchyLayers
{
  float v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[CUINamedVectorGlyph templateVersion](self, "templateVersion");
  if (v3 >= 3.0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __46__CUINamedVectorGlyph_numberOfHierarchyLayers__block_invoke;
    v6[3] = &unk_1E41AA7B8;
    v6[4] = self;
    v6[5] = &v7;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v6);
    v4 = v8[3];
  }
  else
  {
    v4 = 1;
    v8[3] = 1;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (_QWORD)hierarchicalLayerGroup
{
  _QWORD *v1;
  id v2;
  float v3;
  float v4;
  uint64_t RootNode;
  uint64_t ChildWithStringIdentifier;
  uint64_t v7;
  id v8;

  if (result)
  {
    v1 = result;
    result = (_QWORD *)result[20];
    if (!result)
    {
      v2 = objc_msgSend(objc_msgSend(v1, "_regularRendition"), "svgDocument");
      objc_msgSend(v1, "templateVersion");
      v4 = v3;
      RootNode = CGSVGDocumentGetRootNode(v2);
      if (v4 >= 5.0
        && (ChildWithStringIdentifier = CGSVGNodeFindChildWithStringIdentifier(RootNode, CFSTR("LayerTree"))) != 0)
      {
        v7 = ChildWithStringIdentifier;
        v8 = objc_msgSend(v1, "_createShapeGroupSubpaths");
        v1[20] = +[CUIVectorGlyphLayer createLayerGroupWithLayerTree:modePrefix:shapes:delegate:](CUIVectorGlyphHierarchicalLayer, "createLayerGroupWithLayerTree:modePrefix:shapes:delegate:", v7, objc_msgSend(v1, "_stylePrefixForRenderingMode:", 3), v8, v1);

        return (_QWORD *)v1[20];
      }
      else
      {
        result = +[CUIVectorGlyphLayer createLayerGroupWithLayerNames:delegate:](CUIVectorGlyphHierarchicalLayer, "createLayerGroupWithLayerNames:delegate:", objc_msgSend(v1, "_layerNamesForRenderingMode:inRendition:", 3, objc_msgSend(v1, "_regularRendition")), v1);
        v1[20] = result;
      }
    }
  }
  return result;
}

- (BOOL)containsNamedColorStyle:(id)a3
{
  float v5;
  char v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[CUINamedVectorGlyph templateVersion](self, "templateVersion");
  if (v5 >= 2.1 && -[CUINamedVectorGlyph containsNamedColorStyles](self, "containsNamedColorStyles"))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __47__CUINamedVectorGlyph_containsNamedColorStyle___block_invoke;
    v8[3] = &unk_1E41AAA00;
    v8[4] = self;
    v8[5] = a3;
    v8[6] = &v9;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v8);
  }
  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (BOOL)containsNamedColorStyles
{
  id v3;
  float v4;
  unsigned int v5;
  _QWORD v7[5];

  if (self->_containsNamedColorStyles < 0)
  {
    v3 = -[CUINamedVectorGlyph _regularRendition](self, "_regularRendition");
    objc_msgSend(v3, "vectorGlyphTemplateVersion");
    if (v4 >= 2.1)
    {
      v5 = objc_msgSend(v3, "containsMulticolorLayers");
      self->_containsNamedColorStyles = v5;
      if ((v5 & 0x80000000) != 0)
      {
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 3221225472;
        v7[2] = __47__CUINamedVectorGlyph_containsNamedColorStyles__block_invoke;
        v7[3] = &unk_1E41AA9D8;
        v7[4] = self;
        -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v7);
      }
    }
    else
    {
      self->_containsNamedColorStyles = 0;
    }

  }
  return self->_containsNamedColorStyles == 1;
}

- (_QWORD)monochromeLayerGroup
{
  _QWORD *v1;
  id v2;
  float v3;
  float v4;
  uint64_t RootNode;
  uint64_t ChildWithStringIdentifier;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  double v12;
  id v13;
  id v14;

  if (result)
  {
    v1 = result;
    if (!result[18])
    {
      v2 = objc_msgSend(objc_msgSend(result, "_regularRendition"), "svgDocument");
      objc_msgSend(v1, "templateVersion");
      v4 = v3;
      RootNode = CGSVGDocumentGetRootNode(v2);
      if (v4 >= 5.0
        && (ChildWithStringIdentifier = CGSVGNodeFindChildWithStringIdentifier(RootNode, CFSTR("LayerTree"))) != 0)
      {
        v7 = ChildWithStringIdentifier;
        v8 = objc_msgSend(v1, "_createShapeGroupSubpaths");
        v1[18] = +[CUIVectorGlyphLayer createLayerGroupWithLayerTree:modePrefix:shapes:delegate:](CUIVectorGlyphLayer, "createLayerGroupWithLayerTree:modePrefix:shapes:delegate:", v7, objc_msgSend(v1, "_stylePrefixForRenderingMode:", 1), v8, v1);

      }
      else
      {
        v9 = objc_msgSend(v1, "monochromeLayerNamesInRendition:", objc_msgSend(v1, "_regularRendition"));
        if (v4 >= 4.0 && (v10 = v9, objc_msgSend(v9, "count")))
        {
          v1[18] = +[CUIVectorGlyphLayer createLayerGroupWithLayerNames:delegate:](CUIVectorGlyphLayer, "createLayerGroupWithLayerNames:delegate:", v10, v1);
        }
        else
        {
          v11 = objc_msgSend(v1, "pathForLayerNamed:", 0);
          objc_msgSend(v1, "strokeWidthForLayerNamed:", 0);
          v13 = -[CUIVectorGlyphLayer _initWithName:index:shape:strokeWidth:attributes:style:delegate:]([CUIVectorGlyphLayer alloc], "_initWithName:index:shape:strokeWidth:attributes:style:delegate:", CFSTR("monochrome-0"), 0, v11, 0, 0, v1, v12);
          v14 = v13;
          v1[18] = -[CUIVectorGlyphLayer _initWithName:index:sublayers:attributes:style:delegate:]([CUIVectorGlyphLayer alloc], "_initWithName:index:sublayers:attributes:style:delegate:", CFSTR("root"), 0, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1), 0, 0, v1);

        }
      }
    }
    return (_QWORD *)v1[18];
  }
  return result;
}

- (id)_layerNamesForRenderingMode:(int)a3 inRendition:(id)a4
{
  uint64_t v5;
  id v7;
  float v8;
  BOOL v9;
  uint64_t RootNode;
  id v11;
  _QWORD v13[6];
  _QWORD v14[6];
  BOOL v15;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init((Class)NSMutableOrderedSet);
  -[CUINamedVectorGlyph templateVersion](self, "templateVersion");
  v9 = v8 >= 5.0;
  RootNode = CGSVGDocumentGetRootNode(objc_msgSend(a4, "svgDocument"));
  v11 = -[CUINamedVectorGlyph _stylePrefixForRenderingMode:](self, "_stylePrefixForRenderingMode:", v5);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __63__CUINamedVectorGlyph__layerNamesForRenderingMode_inRendition___block_invoke;
  v14[3] = &unk_1E41AACC8;
  v15 = v9;
  v14[4] = v11;
  v14[5] = v7;
  CGSVGNodeEnumerate(RootNode, v14);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __63__CUINamedVectorGlyph__layerNamesForRenderingMode_inRendition___block_invoke_2;
  v13[3] = &unk_1E41AACF0;
  v13[4] = v11;
  v13[5] = objc_msgSend(v7, "count");
  objc_msgSend(v7, "sortUsingComparator:", v13);
  return v7;
}

- (float)templateVersion
{
  float result;

  objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "vectorGlyphTemplateVersion");
  return result;
}

- (id)_stylePrefixForRenderingMode:(int)a3
{
  if ((a3 - 1) > 3)
    return &stru_1E41B97C0;
  else
    return off_1E41AAD10[a3 - 1];
}

- (id)monochromeLayerNamesInRendition:(id)a3
{
  return -[CUINamedVectorGlyph _layerNamesForRenderingMode:inRendition:](self, "_layerNamesForRenderingMode:inRendition:", 1, a3);
}

uint64_t __93__CUINamedVectorGlyph__drawHierarchicalLayersInContext_scaleFactor_targetSize_colorResolver___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t SRGBBlack;

  v6 = a1[5];
  SRGBBlack = _CUIColorGetSRGBBlack();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, 0, SRGBBlack, a2, a3, a1[6], a1[4]);
}

uint64_t __53__CUINamedVectorGlyph_imageWithPaletteColorResolver___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __46__CUINamedVectorGlyph_imageWithPaletteColors___block_invoke_3(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v3;
  uint64_t v4;

  v4 = a1 + 32;
  v3 = *(void **)(a1 + 32);
  if (*(_QWORD *)(v4 + 8) <= a3)
    return objc_msgSend(v3, "lastObject");
  else
    return objc_msgSend(v3, "objectAtIndex:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  CUINamedVectorGlyph *v5;
  CGImage *cgImageRef;

  v5 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](+[CUINamedVectorGlyph allocWithZone:](CUINamedVectorGlyph, "allocWithZone:"), "initWithName:usingRenditionKey:fromTheme:", -[CUINamedLookup name](self, "name"), -[CUINamedLookup renditionKey](self, "renditionKey"), -[CUINamedLookup storageRef](self, "storageRef"));
  if (v5)
  {
    if (self->_ultralightInterpolationSource)
      v5->_ultralightInterpolationSource = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](+[CUINamedLookup allocWithZone:](CUINamedLookup, "allocWithZone:", a3), "initWithName:usingRenditionKey:fromTheme:", -[CUINamedLookup name](self->_ultralightInterpolationSource, "name"), -[CUINamedLookup renditionKey](self->_ultralightInterpolationSource, "renditionKey"), -[CUINamedLookup storageRef](self->_ultralightInterpolationSource, "storageRef"));
    if (self->_blackInterpolationSource)
      v5->_blackInterpolationSource = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](+[CUINamedLookup allocWithZone:](CUINamedLookup, "allocWithZone:", a3), "initWithName:usingRenditionKey:fromTheme:", -[CUINamedLookup name](self->_blackInterpolationSource, "name"), -[CUINamedLookup renditionKey](self->_blackInterpolationSource, "renditionKey"), -[CUINamedLookup storageRef](self->_blackInterpolationSource, "storageRef"));
    -[CUINamedVectorGlyph pointSize](self, "pointSize");
    -[CUINamedVectorGlyph _setPointSize:](v5, "_setPointSize:");
    -[CUINamedVectorGlyph scale](self, "scale");
    -[CUINamedVectorGlyph _setScale:](v5, "_setScale:");
    -[CUINamedVectorGlyph _setCatalog:](v5, "_setCatalog:", -[CUINamedVectorGlyph _catalog](self, "_catalog"));
    -[CUINamedVectorGlyph fontMatchingScaleFactor](self, "fontMatchingScaleFactor");
    -[CUINamedVectorGlyph setFontMatchingScaleFactor:](v5, "setFontMatchingScaleFactor:");
    -[CUINamedVectorGlyph glyphContinuousWeight](self, "glyphContinuousWeight");
    -[CUINamedVectorGlyph _setGlyphWeight:](v5, "_setGlyphWeight:");
    -[CUINamedVectorGlyph glyphContinuousSize](self, "glyphContinuousSize");
    -[CUINamedVectorGlyph _setGlyphSize:](v5, "_setGlyphSize:");
    -[CUINamedVectorGlyph _setFlippable:](v5, "_setFlippable:", -[CUINamedVectorGlyph isFlippable](self, "isFlippable"));
    -[CUINamedVectorGlyph _setLayoutDirection:](v5, "_setLayoutDirection:", -[CUINamedVectorGlyph layoutDirection](self, "layoutDirection"));
    -[CUINamedVectorGlyph _setCanUsePathConcatenation:](v5, "_setCanUsePathConcatenation:", -[CUINamedVectorGlyph _canUsePathConcatenation](self, "_canUsePathConcatenation"));
    -[CUINamedVectorGlyph _setContainsNamedColorStyles:](v5, "_setContainsNamedColorStyles:", self->_containsNamedColorStyles);
    cgImageRef = self->_cgImageRef;
    if (cgImageRef)
    {
      v5->_cgImageRef = CGImageRetain(cgImageRef);
      v5->_lookedupScaleFactor = self->_lookedupScaleFactor;
    }
    -[CUINamedVectorGlyph variableMinValue](self, "variableMinValue");
    -[CUINamedVectorGlyph setVariableMinValue:](v5, "setVariableMinValue:");
    -[CUINamedVectorGlyph variableMaxValue](self, "variableMaxValue");
    -[CUINamedVectorGlyph setVariableMaxValue:](v5, "setVariableMaxValue:");
  }
  return v5;
}

- (BOOL)isFlippable
{
  return (*((unsigned __int8 *)self + 104) >> 1) & 1;
}

- (void)setVariableMinValue:(double)a3
{
  self->_variableMinValue = a3;
}

- (void)setVariableMaxValue:(double)a3
{
  self->_variableMaxValue = a3;
}

- (void)setFontMatchingScaleFactor:(double)a3
{
  if (self->_fontMatchingScaleFactor != a3)
  {
    self->_fontMatchingScaleFactor = a3;
    CGImageRelease(self->_cgImageRef);
    self->_cgImageRef = 0;
  }
}

- (void)_setScale:(double)a3
{
  self->_lookedupScaleFactor = a3;
}

- (void)_setPointSize:(double)a3
{
  self->_pointSize = a3;
}

- (void)_setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (void)_setGlyphWeight:(double)a3
{
  self->_glyphWeight = a3;
}

- (void)_setGlyphSize:(double)a3
{
  self->_glyphSize = a3;
}

- (void)_setFlippable:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 104) = *((_BYTE *)self + 104) & 0xFD | v3;
}

- (void)_setContainsNamedColorStyles:(signed __int16)a3
{
  self->_containsNamedColorStyles = a3;
}

- (void)_setCatalog:(id)a3
{
  objc_storeWeak((id *)&self->_catalog, a3);
}

- (void)_setCanUsePathConcatenation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 104) = *((_BYTE *)self + 104) & 0xFB | v3;
}

- (id)_catalog
{
  return objc_loadWeak((id *)&self->_catalog);
}

- (BOOL)_canUsePathConcatenation
{
  return (*((unsigned __int8 *)self + 104) >> 2) & 1;
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CUINamedVectorGlyph;
  v5 = -[CUINamedLookup isEqual:](&v7, sel_isEqual_);
  if (v5)
    LOBYTE(v5) = vabdd_f64(self->_pointSize, *((double *)a3 + 7)) < 2.22044605e-16
              && vabdd_f64(self->_lookedupScaleFactor, *((double *)a3 + 8)) < 2.22044605e-16
              && self->_glyphSize == *((double *)a3 + 14)
              && self->_glyphWeight == *((double *)a3 + 15)
              && self->_layoutDirection == *((_QWORD *)a3 + 12)
              && self->_variableMinValue == *((double *)a3 + 24)
              && self->_variableMaxValue == *((double *)a3 + 25);
  return v5;
}

- (void)setRepresentsOnDemandContent:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CUINamedVectorGlyph;
  -[CUINamedLookup setRepresentsOnDemandContent:](&v5, sel_setRepresentsOnDemandContent_);
  -[CUINamedLookup setRepresentsOnDemandContent:](self->_ultralightInterpolationSource, "setRepresentsOnDemandContent:", v3);
  -[CUINamedLookup setRepresentsOnDemandContent:](self->_blackInterpolationSource, "setRepresentsOnDemandContent:", v3);
}

- (id)intWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 pointSize:(double)a6 weight:(int64_t)a7 glyphSize:(int64_t)a8 interpolatedFromRegular:(id)a9 ultralight:(id)a10 black:(id)a11 fromCatalog:(id)a12 themeRef:(unint64_t)a13
{
  double v13;
  double v14;

  if ((unint64_t)a7 > 9)
    v13 = -0.8;
  else
    v13 = dbl_19EC71AB0[a7];
  v14 = 1.0;
  if ((unint64_t)a8 <= 3)
    v14 = dbl_19EC71B00[a8];
  return -[CUINamedVectorGlyph initWithName:scaleFactor:deviceIdiom:pointSize:continuousWeight:continuousSize:interpolatedFromRegular:ultralight:black:fromCatalog:themeRef:](self, "initWithName:scaleFactor:deviceIdiom:pointSize:continuousWeight:continuousSize:interpolatedFromRegular:ultralight:black:fromCatalog:themeRef:", a3, a5, a9, a10, a11, a12, a4, a6, v13, v14);
}

- (CUINamedVectorGlyph)initWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 pointSize:(double)a6 fromCatalog:(id)a7 usingRenditionKey:(id)a8 fromTheme:(unint64_t)a9
{
  return -[CUINamedVectorGlyph initWithName:scaleFactor:deviceIdiom:pointSize:fromCatalog:usingRenditionKey:themeRef:locale:](self, "initWithName:scaleFactor:deviceIdiom:pointSize:fromCatalog:usingRenditionKey:themeRef:locale:", a3, a5, a7, a8, a9, -[CUINamedVectorGlyph _partialLocale](self, "_partialLocale"), a4, a6);
}

CGImageRef __64__CUINamedVectorGlyph__imageForRenderingMode_withColorResolver___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  NSString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *v22;
  int v23;
  void *v24;
  id v25;
  char *v26;
  uint64_t v27;
  id v28;
  char *j;
  const __CFString *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  CGColor *v34;
  __CFString *v35;
  void *v36;
  id v37;
  char *v38;
  char *v39;
  char *i;
  const __CFString *v41;
  uint64_t v42;
  uint64_t SRGBBlack;
  CGColor *v44;
  __CFString *v45;
  uint64_t v46;
  CGColor *v47;
  __CFString *v48;
  const void *v49;
  CFTypeID v50;
  CGImageRef result;
  unsigned __int16 *v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  double v56;
  unint64_t v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD v81[4];
  __int128 v82;
  int v83;

  v4 = *(_QWORD **)(a1 + 32);
  if (v4[16] && v4[17])
  {
    v5 = objc_msgSend(v4, "name");
    v6 = objc_msgSend(*(id *)(a1 + 32), "keySignature");
    objc_msgSend(*(id *)(a1 + 32), "glyphContinuousWeight");
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 32), "glyphContinuousSize");
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("interpolatedsymbol-%@-%@-%f-%f"), v5, v6, v8, v9);
  }
  else
  {
    v10 = (NSString *)objc_msgSend(v4, "keySignature");
  }
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "scale");
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "pointSize");
  v15 = v14;
  objc_msgSend(*(id *)(a1 + 32), "fontMatchingScaleFactor");
  v17 = v16;
  v18 = *(unsigned int *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "variableMinValue");
  v20 = v19;
  objc_msgSend(*(id *)(a1 + 32), "variableMaxValue");
  v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%.0f-%.1f-%.1f-%d-%f-%f"), v11, v13, v15, v17, v18, v20, v21);
  v23 = *(_DWORD *)(a1 + 56);
  if ((v23 - 3) >= 2)
  {
    if (v23 == 2)
    {
      v36 = *(void **)(a1 + 32);
      v37 = v36 ? objc_msgSend(v36, "_layerNamesForRenderingMode:inRendition:", 2, a2) : 0;
      v38 = (char *)objc_msgSend(v37, "count");
      if (v38)
      {
        v39 = v38;
        for (i = 0; i != v39; ++i)
        {
          v41 = -[CUINamedVectorGlyph colorNameForRenderingStyle:](*(const __CFString **)(a1 + 32), objc_msgSend(v37, "objectAtIndex:", i));
          v42 = *(_QWORD *)(a1 + 40);
          SRGBBlack = _CUIColorGetSRGBBlack();
          v44 = (CGColor *)(*(uint64_t (**)(uint64_t, const __CFString *, uint64_t, char *, char *, uint64_t, _QWORD))(v42 + 16))(v42, v41, SRGBBlack, i, i, -1, 0);
          v45 = _CUICreateStringWithColor(v44);
          v22 = -[NSString stringByAppendingFormat:](v22, "stringByAppendingFormat:", CFSTR("-%@"), v45);
          CFRelease(v45);
        }
      }
    }
  }
  else
  {
    v24 = *(void **)(a1 + 32);
    if (v24)
      v25 = objc_msgSend(v24, "_layerNamesForRenderingMode:inRendition:", 3, a2);
    else
      v25 = 0;
    v26 = (char *)objc_msgSend(v25, "count");
    v28 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32), v27), "_layerHierarchyStyleNames");
    if (v26)
    {
      for (j = 0; j != v26; ++j)
      {
        v30 = -[CUINamedVectorGlyph colorNameForRenderingStyle:](*(const __CFString **)(a1 + 32), objc_msgSend(v25, "objectAtIndex:", j));
        v31 = objc_msgSend(v28, "indexOfObject:", v30);
        v32 = *(_QWORD *)(a1 + 40);
        v33 = _CUIColorGetSRGBBlack();
        v34 = (CGColor *)(*(uint64_t (**)(uint64_t, const __CFString *, uint64_t, char *, id, uint64_t, _QWORD))(v32 + 16))(v32, v30, v33, j, v31, -1, 0);
        v35 = _CUICreateStringWithColor(v34);
        v22 = -[NSString stringByAppendingFormat:](v22, "stringByAppendingFormat:", CFSTR("-%@"), v35);
        CFRelease(v35);
      }
    }
    else
    {
      v46 = _CUIColorGetSRGBBlack();
      v47 = (CGColor *)(*(uint64_t (**)(_QWORD, id, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v28, "firstObject"), v46, 0, 0, -1, 0);
      v48 = _CUICreateStringWithColor(v47);
      v22 = -[NSString stringByAppendingFormat:](v22, "stringByAppendingFormat:", CFSTR("-%@"), v48);
      CFRelease(v48);
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 88)), "localObjectCache"), "objectForKey:", v22);
  v49 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v49 && (v50 = CFGetTypeID(v49), v50 == CGImageGetTypeID()))
  {
    result = CGImageRetain(*(CGImageRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  }
  else
  {
    v52 = (unsigned __int16 *)objc_msgSend(objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 88)), "_themeStore"), "renditionKeyForName:", objc_msgSend(*(id *)(a1 + 32), "name"));
    v53 = CUIRenditionKeyValueForAttribute(v52, 17);
    objc_msgSend(*(id *)(a1 + 32), "pointSize");
    v55 = (int)v54;
    objc_msgSend(*(id *)(a1 + 32), "glyphContinuousSize");
    v57 = (unint64_t)v56;
    objc_msgSend(*(id *)(a1 + 32), "glyphContinuousWeight");
    kdebug_trace(726663185, v53, v55, v57, (unint64_t)v58);
    objc_msgSend(*(id *)(a1 + 32), "referenceCanvasSize");
    v60 = v59;
    v62 = v61;
    objc_msgSend(*(id *)(a1 + 32), "scale");
    v64 = v63;
    objc_msgSend(*(id *)(a1 + 32), "_requestedPointSizeRatio");
    v66 = *(_DWORD *)(a1 + 56);
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = __64__CUINamedVectorGlyph__imageForRenderingMode_withColorResolver___block_invoke_2;
    v81[3] = &unk_1E41AAB38;
    v82 = *(_OWORD *)(a1 + 32);
    v83 = v66;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -[CUINamedVectorGlyph _rasterizeImageUsingScaleFactor:forTargetSize:renderingMode:colorResolver:]((_QWORD *)v82, v66, (uint64_t)v81, v64 * v65, v60, v62);
    v67 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v74 = objc_msgSend(*(id *)(a1 + 32), "name");
    if (v67)
    {
      objc_msgSend(*(id *)(a1 + 32), "pointSize");
      _CUILog(3, (uint64_t)"-[CUINamedVectorGlyph (%@) _imageForRenderingMode:withColorResolver:] pointsize:%f", v75, v76, v77, v78, v79, v80, (uint64_t)v74);
      objc_msgSend(objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 88)), "localObjectCache"), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v22);
    }
    else
    {
      _CUILog(4, (uint64_t)"CoreUI: %s counldn't create vector glyph image with name %@", v68, v69, v70, v71, v72, v73, (uint64_t)"-[CUINamedVectorGlyph _imageForRenderingMode:withColorResolver:]_block_invoke");
    }
    return (CGImageRef)kdebug_trace(726663186, 0, 0, 0, 0);
  }
  return result;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (id)knownAvailableVectorSizes
{
  return objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "vectorGlyphAvailableSizes");
}

- (CGImageRef)_rasterizeImageUsingScaleFactor:(uint64_t)a3 forTargetSize:(double)a4 renderingMode:(double)a5 colorResolver:(double)a6
{
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  double v20;
  double v21;
  uint64_t v22;
  size_t v23;
  CGColorSpace *DisplayP3;
  uint64_t v25;
  uint64_t v26;
  CGContextRef v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CGContext *v34;
  uint64_t SRGBBlack;
  uint64_t v36;
  CGImageRef Image;

  if (!a1)
    return 0;
  if (a4 == 0.0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__rasterizeImageUsingScaleFactor_forTargetSize_renderingMode_colorResolver_, a1, CFSTR("CUINamedVectorGlyph.m"), 2228, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scale"));
  if (a5 <= 0.0 || a6 <= 0.0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__rasterizeImageUsingScaleFactor_forTargetSize_renderingMode_colorResolver_, a1, CFSTR("CUINamedVectorGlyph.m"), 2229, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetSizeInPoints.width>0 && targetSizeInPoints.height>0"));
  v12 = objc_msgSend(a1, "name");
  _CUILog(3, (uint64_t)"-[CUINamedVectorGlyph (%@) rasterizeImageUsingScaleFactor:%f forTargetSize:%fx%f]", v13, v14, v15, v16, v17, v18, (uint64_t)v12);
  objc_msgSend(a1, "referenceCanvasSize");
  v19 = objc_msgSend(objc_msgSend(a1, "_regularRendition"), "svgDocument");
  if (objc_msgSend(objc_msgSend(a1, "renditionKey"), "themeDisplayGamut"))
  {
    v20 = ceil(a5 * a4);
    v21 = ceil(a6 * a4);
    if (CGSVGDocumentContainsWideGamutContent(v19))
    {
      v22 = 4097;
      v23 = 16;
      DisplayP3 = (CGColorSpace *)_CUIColorSpaceGetDisplayP3();
      goto LABEL_11;
    }
  }
  else
  {
    v20 = ceil(a5 * a4);
    v21 = ceil(a6 * a4);
  }
  v22 = 8193;
  v23 = 8;
  DisplayP3 = (CGColorSpace *)_CUIColorSpaceGetSRGB();
LABEL_11:
  v27 = CUICGBitmapContextCreate((unint64_t)v20, (unint64_t)v21, v23, 0, DisplayP3, v22, v25, v26);
  if (!v27)
  {
    _CUILog(4, (uint64_t)"CoreUI: %s couldn't create bitmapContext for (%fx%f) colorSpace:'%@' [svgsize:%fx%f scale:%f bpc:%zd bpp:%zd bitmapInfo:%d]", v28, v29, v30, v31, v32, v33, (uint64_t)"-[CUINamedVectorGlyph _rasterizeImageUsingScaleFactor:forTargetSize:renderingMode:colorResolver:]");
    return 0;
  }
  v34 = v27;
  switch(a2)
  {
    case 1:
      SRGBBlack = _CUIColorGetSRGBBlack();
      v36 = (*(uint64_t (**)(uint64_t, const __CFString *, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD))(a3 + 16))(a3, CFSTR("primary"), SRGBBlack, 0, 0, -1, 0);
      -[CUINamedVectorGlyph _drawInContext:scaleFactor:targetSize:primaryColor:tertiaryColor:](a1, (uint64_t)v34, v36, 0, a4, a5, a6);
      break;
    case 2:
      objc_msgSend(a1, "_drawMulticolorLayersInContext:scaleFactor:targetSize:colorResolver:", v27, a3, a4, a5, a6);
      break;
    case 3:
      objc_msgSend(a1, "_drawHierarchicalLayersInContext:scaleFactor:targetSize:colorResolver:", v27, a3, a4, a5, a6);
      break;
    case 4:
      objc_msgSend(a1, "_drawPaletteLayersInContext:scaleFactor:targetSize:colorResolver:", v27, a3, a4, a5, a6);
      break;
    default:
      break;
  }
  Image = CGBitmapContextCreateImage(v34);
  CFRelease(v34);
  return Image;
}

- (_QWORD)_drawInContext:(uint64_t)a3 scaleFactor:(uint64_t)a4 targetSize:(double)a5 primaryColor:(double)a6 tertiaryColor:(double)a7
{
  void *v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  if (result)
  {
    v13 = result;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = objc_msgSend(-[CUINamedVectorGlyph monochromeLayerGroup](result), "sublayers", 0);
    result = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (result)
    {
      v15 = result;
      v16 = *(_QWORD *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v17);
          objc_msgSend(v13, "variableMinValue");
          v20 = v19;
          objc_msgSend(v13, "variableMaxValue");
          objc_msgSend(v18, "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:onFillColor:offFillColor:", a2, a3, a4, a5, a6, a7, v20, v21);
          v17 = (_QWORD *)((char *)v17 + 1);
        }
        while (v15 != v17);
        result = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        v15 = result;
      }
      while (result);
    }
  }
  return result;
}

- (double)variableMaxValue
{
  return self->_variableMaxValue;
}

- (double)variableMinValue
{
  return self->_variableMinValue;
}

- (id)monochromeLayers
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __39__CUINamedVectorGlyph_monochromeLayers__block_invoke;
  v4[3] = &unk_1E41AA830;
  v4[4] = self;
  v4[5] = &v5;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v4);
  v2 = (void *)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __63__CUINamedVectorGlyph__layerNamesForRenderingMode_inRendition___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  int Type;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (!a3)
  {
    Type = CGSVGNodeGetType(a2);
    if (Type == 2 || Type == 1 && *(_BYTE *)(a1 + 48))
    {
      if (CGSVGNodeFindAttribute(a2, 4))
      {
        v6 = (void *)CGSVGAttributeCopyString();
        v7 = objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(" "));
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v14;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(_QWORD *)v14 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v12, "hasPrefix:", *(_QWORD *)(a1 + 32)))
                objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          }
          while (v9);
        }

      }
    }
  }
}

- (id)pathForLayerNamed:(id)a3
{
  uint64_t RootNode;
  void *v6;
  unsigned __int16 *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  unint64_t v12;
  double v13;
  id v14;
  id v15;
  int v17;
  CGSVGNode *v18;
  __int128 v19;
  id v20;
  id v21;
  id v22;
  CGSVGNode *v23;
  CGSVGNode *v24;
  id v25;
  id v26;
  double v27;
  double v28;
  double v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  double v37;
  double v38;
  double v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;

  if ((*((_BYTE *)self + 104) & 4) != 0)
  {
    if (self->_ultralightInterpolationSource && self->_blackInterpolationSource)
    {
      v7 = (unsigned __int16 *)objc_msgSend(objc_msgSend(objc_loadWeak((id *)&self->_catalog), "_themeStore"), "renditionKeyForName:", -[CUINamedLookup name](self, "name"));
      v8 = CUIRenditionKeyValueForAttribute(v7, 17);
      -[CUINamedVectorGlyph pointSize](self, "pointSize");
      v10 = (int)v9;
      -[CUINamedVectorGlyph glyphContinuousSize](self, "glyphContinuousSize");
      v12 = (unint64_t)v11;
      -[CUINamedVectorGlyph glyphContinuousWeight](self, "glyphContinuousWeight");
      kdebug_trace(726663193, v8, v10, v12, (unint64_t)v13);
      if (objc_msgSend(a3, "length"))
      {
        v14 = -[CUINamedVectorGlyph _ultralightRendition](self, "_ultralightRendition");
        if ((*((_BYTE *)self + 104) & 4) != 0)
          v15 = -[CUINamedVectorGlyph _assumeConcatenatedPathForLayerNamed:inRendition:]((uint64_t)self, (uint64_t)a3, v14);
        else
          v15 = 0;
        v33 = -[CUINamedVectorGlyph _regularRendition](self, "_regularRendition");
        if ((*((_BYTE *)self + 104) & 4) != 0)
          v34 = -[CUINamedVectorGlyph _assumeConcatenatedPathForLayerNamed:inRendition:]((uint64_t)self, (uint64_t)a3, v33);
        else
          v34 = 0;
        v35 = -[CUINamedVectorGlyph _blackRendition](self, "_blackRendition");
        if ((*((_BYTE *)self + 104) & 4) != 0)
          v36 = -[CUINamedVectorGlyph _assumeConcatenatedPathForLayerNamed:inRendition:]((uint64_t)self, (uint64_t)a3, v35);
        else
          v36 = 0;
        -[CUINamedVectorGlyph glyphContinuousWeight](self, "glyphContinuousWeight");
        v38 = v37;
        -[CUINamedVectorGlyph glyphContinuousSize](self, "glyphContinuousSize");
        v30 = -[CUINamedVectorGlyph _interpolatedPathWithWeight:glyphSize:fromUltralightSmall:regularSmall:blackSmall:](self, "_interpolatedPathWithWeight:glyphSize:fromUltralightSmall:regularSmall:blackSmall:", v15, v34, v36, v38, v39);
LABEL_26:
        kdebug_trace(726663194, 1, 0, 0, 0);
        return v30;
      }
      v17 = 1;
LABEL_13:
      v18 = -[CUINamedVectorGlyph _getOutlineNodeForDocument:](self, "_getOutlineNodeForDocument:", objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "svgDocument"));
      v19 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v42 = *(_OWORD *)&CGAffineTransformIdentity.a;
      v43 = *(_OWORD *)&CGAffineTransformIdentity.a;
      v40 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      v41 = v19;
      v44 = v19;
      v45 = v40;
      v20 = CUICreatePathFromSVGNode(v18, &v43);
      v6 = v20;
      if (!v17)
      {
        if (v20)
          v32 = v20;
        return v6;
      }
      v21 = objc_msgSend(-[CUINamedVectorGlyph _ultralightRendition](self, "_ultralightRendition"), "svgDocument");
      v22 = objc_msgSend(-[CUINamedVectorGlyph _blackRendition](self, "_blackRendition"), "svgDocument");
      v23 = -[CUINamedVectorGlyph _getOutlineNodeForDocument:](self, "_getOutlineNodeForDocument:", v21);
      v24 = -[CUINamedVectorGlyph _getOutlineNodeForDocument:](self, "_getOutlineNodeForDocument:", v22);
      v43 = v42;
      v44 = v41;
      v45 = v40;
      v25 = CUICreatePathFromSVGNode(v23, &v43);
      v43 = v42;
      v44 = v41;
      v45 = v40;
      v26 = CUICreatePathFromSVGNode(v24, &v43);
      -[CUINamedVectorGlyph glyphContinuousWeight](self, "glyphContinuousWeight");
      v28 = v27;
      -[CUINamedVectorGlyph glyphContinuousSize](self, "glyphContinuousSize");
      v30 = -[CUINamedVectorGlyph _interpolatedPathWithWeight:glyphSize:fromUltralightSmall:regularSmall:blackSmall:](self, "_interpolatedPathWithWeight:glyphSize:fromUltralightSmall:regularSmall:blackSmall:", v25, v6, v26, v28, v29);

      if (v6)
        v31 = v6;
      goto LABEL_26;
    }
LABEL_9:
    if (objc_msgSend(a3, "length"))
      return -[CUINamedVectorGlyph _assumeConcatenatedPathForLayerNamed:inRendition:]((uint64_t)self, (uint64_t)a3, -[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"));
    v17 = 0;
    goto LABEL_13;
  }
  RootNode = CGSVGDocumentGetRootNode(objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "svgDocument"));
  if ((CUISVGNodeCanBeRepresentedAsPath(RootNode) & 1) != 0)
    goto LABEL_9;
  return 0;
}

- (CGSVGAttributeMap)styleForLayerName:(id)a3
{
  if (a3)
    return (CGSVGAttributeMap *)CGSVGDocumentGetNamedStyle(objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "svgDocument"), objc_msgSend(CFSTR("."), "stringByAppendingString:", a3));
  else
    return 0;
}

- (id)_interpolatedPathWithWeight:(double)a3 glyphSize:(double)a4 fromUltralightSmall:(id)a5 regularSmall:(id)a6 blackSmall:(id)a7
{
  CUIVectorGlyphMutator *v13;
  CUIVectorGlyphMutator *v14;
  id v15;

  if (!a5 || !a6 || !a7)
    return 0;
  v13 = [CUIVectorGlyphMutator alloc];
  -[CUINamedVectorGlyph referencePointSize](self, "referencePointSize");
  v14 = -[CUIVectorGlyphMutator initWithPointSize:regular:ultralight:black:](v13, "initWithPointSize:regular:ultralight:black:", a6, a5, a7);
  +[CUIVectorGlyphMutator transformForGlyphContinuousSize:](CUIVectorGlyphMutator, "transformForGlyphContinuousSize:", a4);
  +[CUIVectorGlyphMutator scalarsForGlyphContinuousWeight:glyphContinuousSize:](CUIVectorGlyphMutator, "scalarsForGlyphContinuousWeight:glyphContinuousSize:", a3, a4);
  v15 = -[CUIVectorGlyphMutator pathForScalars:andTransform:](v14, "pathForScalars:andTransform:");

  return v15;
}

uint64_t __64__CUINamedVectorGlyph__imageForRenderingMode_withColorResolver___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float v5;

  if (*(_QWORD *)(a1 + 40)
    && (objc_msgSend(*(id *)(a1 + 32), "templateVersion"), v5 >= 2.1)
    && *(_DWORD *)(a1 + 48) != 1)
  {
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    return a3;
  }
}

id __47__CUINamedVectorGlyph_containsNamedColorStyle___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSOrderedSet *v4;
  NSOrderedSet *v5;
  id result;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v3 + 104) & 4) != 0)
    v4 = +[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", objc_msgSend(objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph multicolorLayerGroup]((_QWORD *)v3), "sublayers"), "valueForKeyPath:", CFSTR("name")), "sortedArrayUsingSelector:", sel_compare_));
  else
    v4 = (NSOrderedSet *)objc_msgSend((id)v3, "_layerNamesForRenderingMode:inRendition:", 2, a2);
  v5 = v4;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  result = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v11;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        result = -[__CFString isEqualToString:]((id)-[CUINamedVectorGlyph colorNameForRenderingStyle:](*(const __CFString **)(a1 + 32), *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9)), "isEqualToString:", *(_QWORD *)(a1 + 40));
        if ((_DWORD)result)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
          return result;
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      result = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v7 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (const)colorNameForRenderingStyle:(const __CFString *)result
{
  char *v3;
  uint64_t v4;
  char *v5;

  if (result)
  {
    v3 = (char *)objc_msgSend(a2, "rangeOfString:", CFSTR(":"));
    if (v4 == 1 && (v5 = v3 + 1, v3 + 1 < (char *)objc_msgSend(a2, "length") - 1))
      return (const __CFString *)objc_msgSend(a2, "substringFromIndex:", v5);
    else
      return &stru_1E41B97C0;
  }
  return result;
}

- (id)multicolorLayers
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __39__CUINamedVectorGlyph_multicolorLayers__block_invoke;
  v4[3] = &unk_1E41AA830;
  v4[4] = self;
  v4[5] = &v5;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v4);
  v2 = (void *)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (_QWORD)multicolorLayerGroup
{
  _QWORD *v1;
  id v2;
  float v3;
  float v4;
  uint64_t RootNode;
  uint64_t ChildWithStringIdentifier;
  uint64_t v7;
  id v8;

  if (result)
  {
    v1 = result;
    result = (_QWORD *)result[19];
    if (!result)
    {
      v2 = objc_msgSend(objc_msgSend(v1, "_regularRendition"), "svgDocument");
      objc_msgSend(v1, "templateVersion");
      v4 = v3;
      RootNode = CGSVGDocumentGetRootNode(v2);
      if (v4 >= 5.0
        && (ChildWithStringIdentifier = CGSVGNodeFindChildWithStringIdentifier(RootNode, CFSTR("LayerTree"))) != 0)
      {
        v7 = ChildWithStringIdentifier;
        v8 = objc_msgSend(v1, "_createShapeGroupSubpaths");
        v1[19] = +[CUIVectorGlyphLayer createLayerGroupWithLayerTree:modePrefix:shapes:delegate:](CUIVectorGlyphMulticolorLayer, "createLayerGroupWithLayerTree:modePrefix:shapes:delegate:", v7, objc_msgSend(v1, "_stylePrefixForRenderingMode:", 2), v8, v1);

        return (_QWORD *)v1[19];
      }
      else
      {
        result = +[CUIVectorGlyphLayer createLayerGroupWithLayerNames:delegate:](CUIVectorGlyphMulticolorLayer, "createLayerGroupWithLayerNames:delegate:", objc_msgSend(v1, "_layerNamesForRenderingMode:inRendition:", 2, objc_msgSend(v1, "_regularRendition")), v1);
        v1[19] = result;
      }
    }
  }
  return result;
}

uint64_t __55__CUINamedVectorGlyph_imageWithHierarchyColorResolver___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __46__CUINamedVectorGlyph_imageWithColorResolver___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)_layerHierarchyStyleNames
{
  if (_layerHierarchyStyleNames_onceToken != -1)
    dispatch_once(&_layerHierarchyStyleNames_onceToken, &__block_literal_global_155);
  return (id)_layerHierarchyStyleNames_layerHierarchyStyleNames;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_cgImageRef);
  objc_storeWeak((id *)&self->_catalog, 0);
  v3.receiver = self;
  v3.super_class = (Class)CUINamedVectorGlyph;
  -[CUINamedLookup dealloc](&v3, sel_dealloc);
}

uint64_t __63__CUINamedVectorGlyph__layerNamesForRenderingMode_inRendition___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;

  if (*(_QWORD *)(a1 + 40) <= 9uLL)
    return (uint64_t)objc_msgSend(a2, "compare:", a3);
  v6 = objc_msgSend(a2, "rangeOfString:", *(_QWORD *)(a1 + 32));
  v8 = v7;
  v9 = objc_msgSend(a3, "rangeOfString:", *(_QWORD *)(a1 + 32));
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL || v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    return (uint64_t)objc_msgSend(a2, "compare:", a3);
  v13 = v9;
  v14 = v10;
  v15 = objc_msgSend(a2, "stringByReplacingCharactersInRange:withString:", v6, v8, &stru_1E41B97C0);
  v16 = objc_msgSend(a3, "stringByReplacingCharactersInRange:withString:", v13, v14, &stru_1E41B97C0);
  v17 = objc_msgSend(v15, "integerValue");
  v18 = objc_msgSend(v16, "integerValue");
  if (v17 < v18)
    return -1;
  else
    return v17 > v18;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_catalog);
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withPaletteColors:(id)a5
{
  double height;
  double width;
  id v10;
  CGImage *v11;
  CGImage *v12;
  _QWORD v14[6];
  _QWORD v15[10];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (a5)
  {
    height = a4.height;
    width = a4.width;
    v10 = objc_msgSend(a5, "count");
    if (v10 == (id)1)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = __86__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColors___block_invoke;
      v15[3] = &unk_1E41AAAC0;
      v15[5] = a5;
      v15[6] = &v16;
      *(double *)&v15[7] = a3;
      *(double *)&v15[8] = width;
      *(double *)&v15[9] = height;
      v15[4] = self;
      -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v15);
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __86__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColors___block_invoke_3;
      v14[3] = &unk_1E41AAAE8;
      v14[4] = a5;
      v14[5] = v10;
      v11 = -[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColorResolver:](self, "rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColorResolver:", v14, a3, width, height);
      v17[3] = (uint64_t)v11;
    }
  }
  else
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUINamedVectorGlyph.m"), 2061, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("colors"));
  }
  v12 = (CGImage *)v17[3];
  _Block_object_dispose(&v16, 8);
  return v12;
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withPaletteColorResolver:(id)a5
{
  CGImage *v5;
  _QWORD v7[8];
  CGSize v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __93__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColorResolver___block_invoke;
  v7[3] = &unk_1E41AA988;
  v7[5] = a5;
  v7[6] = &v9;
  *(double *)&v7[7] = a3;
  v8 = a4;
  v7[4] = self;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v7);
  v5 = (CGImage *)v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

void *__48__CUINamedVectorGlyph__layerHierarchyStyleNames__block_invoke()
{
  void *result;

  result = &unk_1E41DDCB0;
  _layerHierarchyStyleNames_layerHierarchyStyleNames = (uint64_t)result;
  return result;
}

- (CGImage)imageWithPaletteColors:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  CGImage *v13;
  CGImage *v14;
  _QWORD v16[6];
  _QWORD v17[10];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  if (a3)
  {
    v5 = objc_msgSend(a3, "count");
    if (v5 == (id)1)
    {
      -[CUINamedVectorGlyph referenceCanvasSize](self, "referenceCanvasSize");
      v7 = v6;
      v9 = v8;
      -[CUINamedVectorGlyph scale](self, "scale");
      v11 = v10;
      -[CUINamedVectorGlyph _requestedPointSizeRatio](self, "_requestedPointSizeRatio");
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = __46__CUINamedVectorGlyph_imageWithPaletteColors___block_invoke;
      v17[3] = &unk_1E41AAAC0;
      v17[5] = a3;
      v17[6] = &v18;
      *(double *)&v17[7] = v11 * v12;
      v17[8] = v7;
      v17[9] = v9;
      v17[4] = self;
      -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v17);
    }
    else
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = __46__CUINamedVectorGlyph_imageWithPaletteColors___block_invoke_3;
      v16[3] = &unk_1E41AAAE8;
      v16[4] = a3;
      v16[5] = v5;
      v13 = -[CUINamedVectorGlyph imageWithPaletteColorResolver:](self, "imageWithPaletteColorResolver:", v16);
      v19[3] = (uint64_t)v13;
    }
  }
  else
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUINamedVectorGlyph.m"), 2032, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("colors"));
  }
  v14 = (CGImage *)v19[3];
  _Block_object_dispose(&v18, 8);
  return v14;
}

- (CGImage)imageWithPaletteColorResolver:(id)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __53__CUINamedVectorGlyph_imageWithPaletteColorResolver___block_invoke;
  v4[3] = &unk_1E41AA960;
  v4[4] = a3;
  return (CGImage *)-[CUINamedVectorGlyph _imageForRenderingMode:withColorResolver:]((id *)&self->super.super.isa, 4, (uint64_t)v4);
}

- (id)_partialLocale
{
  id result;

  result = -[CUINamedLookup localization](self, "localization");
  if (result)
    return +[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", objc_msgSend(objc_loadWeak((id *)&self->_catalog), "_nameForLocalizationIdentifier:", result));
  return result;
}

- (CUINamedVectorGlyph)initWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 pointSize:(double)a6 continuousWeight:(double)a7 continuousSize:(double)a8 interpolatedFromRegular:(id)a9 ultralight:(id)a10 black:(id)a11 fromCatalog:(id)a12 themeRef:(unint64_t)a13
{
  return -[CUINamedVectorGlyph initWithName:scaleFactor:deviceIdiom:pointSize:continuousWeight:continuousSize:interpolatedFromRegular:ultralight:black:fromCatalog:themeRef:locale:](self, "initWithName:scaleFactor:deviceIdiom:pointSize:continuousWeight:continuousSize:interpolatedFromRegular:ultralight:black:fromCatalog:themeRef:locale:", a3, a5, a9, a10, a11, a12, a4, a6, a7, a8, a13, -[CUINamedVectorGlyph _partialLocale](self, "_partialLocale"));
}

- (CUINamedVectorGlyph)initWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 pointSize:(double)a6 continuousWeight:(double)a7 continuousSize:(double)a8 interpolatedFromRegular:(id)a9 ultralight:(id)a10 black:(id)a11 fromCatalog:(id)a12 themeRef:(unint64_t)a13 locale:(id)a14
{
  CUINamedVectorGlyph *v23;
  char v24;
  uint64_t v25;
  objc_super v27;

  if (!a9 || !a10 || !a11)
  {

    return 0;
  }
  v27.receiver = self;
  v27.super_class = (Class)CUINamedVectorGlyph;
  v23 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](&v27, sel_initWithName_usingRenditionKey_fromTheme_, a3, a9, a13);
  if (!v23)
    return v23;
  v23->_ultralightInterpolationSource = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:]([CUINamedLookup alloc], "initWithName:usingRenditionKey:fromTheme:", a3, a10, a13);
  v23->_blackInterpolationSource = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:]([CUINamedLookup alloc], "initWithName:usingRenditionKey:fromTheme:", a3, a11, a13);
  if (!-[CUIThemeRendition isInterpolatable](-[CUINamedLookup _rendition](v23, "_rendition"), "isInterpolatable")
    || !-[CUIThemeRendition isInterpolatable](-[CUINamedLookup _rendition](v23->_ultralightInterpolationSource, "_rendition"), "isInterpolatable")|| !-[CUIThemeRendition isInterpolatable](-[CUINamedLookup _rendition](v23->_blackInterpolationSource, "_rendition"), "isInterpolatable"))
  {

    return 0;
  }
  *((_BYTE *)v23 + 104) |= 4u;
  v23->_pointSize = a6;
  v23->_lookedupScaleFactor = a4;
  objc_storeWeak((id *)&v23->_catalog, a12);
  v23->_fontMatchingScaleFactor = 1.0;
  v23->_containsNamedColorStyles = -1;
  v23->_glyphWeight = a7;
  v23->_glyphSize = a8;
  v23->_variableMinValue = INFINITY;
  v23->_variableMaxValue = INFINITY;
  -[CUINamedVectorGlyph _lookupCatalogImageForIdiom:locale:](v23, "_lookupCatalogImageForIdiom:locale:", a5, a14);
  if (-[CUIThemeRendition isFlippable](-[CUINamedLookup _rendition](v23, "_rendition"), "isFlippable"))
    v24 = 2;
  else
    v24 = 0;
  *((_BYTE *)v23 + 104) = *((_BYTE *)v23 + 104) & 0xFD | v24;
  v23->_layoutDirection = -[CUIRenditionKey themeDirection](-[CUINamedLookup renditionKey](v23, "renditionKey"), "themeDirection");
  if ((*((_BYTE *)v23 + 104) & 2) == 0
    && objc_msgSend((id)_LookupStructuredThemeProvider(a13, v25), "imageNamedShouldFlip:", a3))
  {
    *((_BYTE *)v23 + 104) |= 2u;
    v23->_layoutDirection = 5;
  }
  return v23;
}

- (CUINamedVectorGlyph)initWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 pointSize:(double)a6 fromCatalog:(id)a7 usingRenditionKey:(id)a8 themeRef:(unint64_t)a9 locale:(id)a10
{
  CUINamedVectorGlyph *v18;
  CUINamedVectorGlyph *v19;
  unint64_t v20;
  double v21;
  unint64_t v22;
  double v23;
  CUIThemeRendition *v24;
  char v25;
  char v26;
  uint64_t v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CUINamedVectorGlyph;
  v18 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](&v29, sel_initWithName_usingRenditionKey_fromTheme_, a3, a8, a9);
  v19 = v18;
  if (v18)
  {
    v18->_pointSize = a6;
    v18->_lookedupScaleFactor = a4;
    objc_storeWeak((id *)&v18->_catalog, a7);
    v19->_fontMatchingScaleFactor = 1.0;
    v19->_containsNamedColorStyles = -1;
    v20 = (unint64_t)objc_msgSend(a8, "themeGlyphWeight");
    if (v20 > 9)
      v21 = -0.8;
    else
      v21 = dbl_19EC71AB0[v20];
    v19->_glyphWeight = v21;
    v22 = (unint64_t)objc_msgSend(a8, "themeGlyphSize");
    v23 = 1.0;
    if (v22 <= 3)
      v23 = dbl_19EC71B00[v22];
    v19->_glyphSize = v23;
    v19->_variableMinValue = INFINITY;
    v19->_variableMaxValue = INFINITY;
    v24 = -[CUINamedLookup _rendition](v19, "_rendition");
    if (-[CUIThemeRendition isInterpolatable](v24, "isInterpolatable"))
      v25 = 4;
    else
      v25 = 0;
    *((_BYTE *)v19 + 104) = *((_BYTE *)v19 + 104) & 0xFB | v25;
    -[CUINamedVectorGlyph _lookupCatalogImageForIdiom:locale:](v19, "_lookupCatalogImageForIdiom:locale:", a5, a10);
    if (-[CUIThemeRendition isFlippable](v24, "isFlippable"))
      v26 = 2;
    else
      v26 = 0;
    *((_BYTE *)v19 + 104) = *((_BYTE *)v19 + 104) & 0xFD | v26;
    v19->_layoutDirection = -[CUIRenditionKey themeDirection](-[CUINamedLookup renditionKey](v19, "renditionKey"), "themeDirection");
    if ((*((_BYTE *)v19 + 104) & 2) == 0
      && objc_msgSend((id)_LookupStructuredThemeProvider(a9, v27), "imageNamedShouldFlip:", a3))
    {
      *((_BYTE *)v19 + 104) |= 2u;
      v19->_layoutDirection = 5;
    }
  }
  return v19;
}

- (void)_lookupCatalogImageForIdiom:(int64_t)a3 locale:(id)a4
{
  CUICatalog **p_catalog;
  NSString *v8;
  int64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  id Weak;
  double lookedupScaleFactor;
  id v20;
  CGImage *v21;
  double v22;
  uint64_t v23;
  NSString *v24;
  _QWORD v25[8];

  if (!self->_cgImageRef)
  {
    p_catalog = &self->_catalog;
    if (objc_loadWeak((id *)&self->_catalog))
    {
      v8 = -[CUINamedLookup name](self, "name");
      v9 = -[CUINamedVectorGlyph layoutDirection](self, "layoutDirection");
      v10 = -[CUINamedVectorGlyph knownAvailableVectorSizes](self, "knownAvailableVectorSizes");
      v11 = (uint64_t)objc_msgSend(v10, "count");
      v12 = v11;
      v13 = 0;
      v24 = v8;
      while (kCoreThemeContinuousGlyphWeights[v13] != self->_glyphWeight)
      {
        if (++v13 == 9)
        {
          v14 = 0;
          goto LABEL_9;
        }
      }
      v14 = kCoreThemeDiscreteGlyphWeights[v13];
LABEL_9:
      v15 = 0;
      while (*(double *)&kCoreThemeContinuousGlyphSizes[v15] != self->_glyphSize)
      {
        if (++v15 == 3)
          return;
      }
      if (v14 && v11 >= 1)
      {
        v16 = 0;
        v23 = kCoreThemeDiscreteGlyphSizes[v15];
        while (1)
        {
          objc_msgSend(objc_msgSend(v10, "objectAtIndex:", v16), "floatValue");
          if (self->_pointSize == v17)
            break;
          if (v12 == ++v16)
            return;
        }
        Weak = objc_loadWeak((id *)p_catalog);
        lookedupScaleFactor = self->_lookedupScaleFactor;
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = __58__CUINamedVectorGlyph__lookupCatalogImageForIdiom_locale___block_invoke;
        v25[3] = &unk_1E41AA790;
        v25[4] = self;
        v25[5] = v16;
        v25[6] = v23;
        v25[7] = v14;
        v20 = objc_msgSend(Weak, "imageWithName:scaleFactor:deviceIdiom:layoutDirection:locale:adjustRenditionKeyWithBlock:", v24, a3, v9, a4, v25, lookedupScaleFactor);
        v21 = CGImageRetain((CGImageRef)objc_msgSend(v20, "image"));
        self->_cgImageRef = v21;
        if (v21)
        {
          objc_msgSend(v20, "scale");
          self->_lookedupScaleFactor = v22;
        }
      }
    }
  }
}

id __58__CUINamedVectorGlyph__lookupCatalogImageForIdiom_locale___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setThemeDimension2:", *(_QWORD *)(a1 + 40));
  objc_msgSend(a2, "setThemeAppearance:", objc_msgSend(*(id *)(a1 + 32), "appearanceIdentifier"));
  objc_msgSend(a2, "setThemeGlyphSize:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(a2, "setThemeGlyphWeight:", *(_QWORD *)(a1 + 56));
}

- (id)_ultralightInterpolationSource
{
  return self->_ultralightInterpolationSource;
}

- (void)_setUltralightInterpolationSource:(id)a3
{
  id v5;

  if (self->_ultralightInterpolationSource != a3)
  {
    v5 = a3;

    self->_ultralightInterpolationSource = (CUINamedLookup *)a3;
  }
}

- (id)_blackInterpolationSource
{
  return self->_blackInterpolationSource;
}

- (void)_setBlackInterpolationSource:(id)a3
{
  id v5;

  if (self->_blackInterpolationSource != a3)
  {
    v5 = a3;

    self->_blackInterpolationSource = (CUINamedLookup *)a3;
  }
}

- (CGImage)_cgImageRef
{
  return self->_cgImageRef;
}

- (void)_setImage:(CGImage *)a3
{
  if (self->_cgImageRef != a3)
  {
    CGImageRetain(a3);
    CGImageRelease(self->_cgImageRef);
    self->_cgImageRef = a3;
  }
}

- (CGSVGDocument)referenceGlyph
{
  return (CGSVGDocument *)objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "svgDocument");
}

- (BOOL)isInterpolatable
{
  return objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "isInterpolatable");
}

- (BOOL)canBeInterpolatedWith:(id)a3
{
  uint64_t v5;
  id Weak;
  unsigned int v7;

  if (self == a3)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v5 = objc_opt_self(CUINamedVectorGlyph, a2);
    if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0
      && (Weak = objc_loadWeak((id *)&self->_catalog), Weak == objc_msgSend(a3, "_catalog")))
    {
      v7 = -[NSString isEqual:](-[CUINamedLookup name](self, "name"), "isEqual:", objc_msgSend(a3, "name"));
      if (v7)
      {
        v7 = -[CUINamedVectorGlyph isInterpolatable](self, "isInterpolatable");
        if (v7)
          LOBYTE(v7) = objc_msgSend(a3, "isInterpolatable");
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (id)_regularRendition
{
  $F9A9368E79288004F17FB0B3B15D3305 *lockedRenditions;

  lockedRenditions = self->_lockedRenditions;
  if (lockedRenditions)
    return lockedRenditions->var0;
  else
    return -[CUINamedLookup _rendition](self, "_rendition");
}

- (id)_ultralightRendition
{
  $F9A9368E79288004F17FB0B3B15D3305 *lockedRenditions;

  lockedRenditions = self->_lockedRenditions;
  if (lockedRenditions)
    return lockedRenditions->var1;
  else
    return -[CUINamedLookup _rendition](self->_ultralightInterpolationSource, "_rendition");
}

- (id)_blackRendition
{
  $F9A9368E79288004F17FB0B3B15D3305 *lockedRenditions;

  lockedRenditions = self->_lockedRenditions;
  if (lockedRenditions)
    return lockedRenditions->var2;
  else
    return -[CUINamedLookup _rendition](self->_blackInterpolationSource, "_rendition");
}

- (double)glyphContinuousSize
{
  return self->_glyphSize;
}

- (double)glyphContinuousWeight
{
  return self->_glyphWeight;
}

- (double)baselineOffsetUnrounded
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

  if (self->_ultralightInterpolationSource && self->_blackInterpolationSource)
  {
    -[CUINamedVectorGlyph glyphContinuousWeight](self, "glyphContinuousWeight");
    v4 = v3;
    -[CUINamedVectorGlyph glyphContinuousSize](self, "glyphContinuousSize");
    v6 = v5;
    objc_msgSend(-[CUINamedVectorGlyph _ultralightRendition](self, "_ultralightRendition"), "vectorGlyphBaseline");
    v8 = v7;
    objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "vectorGlyphBaseline");
    v10 = v9;
    objc_msgSend(-[CUINamedVectorGlyph _blackRendition](self, "_blackRendition"), "vectorGlyphBaseline");
    -[CUINamedVectorGlyph _interpolatedBaselineOffsetWithWeight:glyphSize:fromUltralight:regular:black:](self, "_interpolatedBaselineOffsetWithWeight:glyphSize:fromUltralight:regular:black:", v4, v6, v8, v10, v11);
  }
  else
  {
    objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "vectorGlyphBaseline");
  }
  v13 = v12;
  -[CUINamedVectorGlyph _requestedPointSizeRatio](self, "_requestedPointSizeRatio");
  return v13 * v14;
}

- (double)capHeightUnrounded
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

  if (self->_ultralightInterpolationSource && self->_blackInterpolationSource)
  {
    -[CUINamedVectorGlyph glyphContinuousWeight](self, "glyphContinuousWeight");
    v4 = v3;
    -[CUINamedVectorGlyph glyphContinuousSize](self, "glyphContinuousSize");
    v6 = v5;
    objc_msgSend(-[CUINamedVectorGlyph _ultralightRendition](self, "_ultralightRendition"), "vectorGlyphCapLine");
    v8 = v7;
    objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "vectorGlyphCapLine");
    v10 = v9;
    objc_msgSend(-[CUINamedVectorGlyph _blackRendition](self, "_blackRendition"), "vectorGlyphCapLine");
    -[CUINamedVectorGlyph _interpolatedCapHeightWithWeight:glyphSize:fromUltralight:regular:black:](self, "_interpolatedCapHeightWithWeight:glyphSize:fromUltralight:regular:black:", v4, v6, v8, v10, v11);
  }
  else
  {
    objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "vectorGlyphCapLine");
  }
  v13 = v12;
  -[CUINamedVectorGlyph _requestedPointSizeRatio](self, "_requestedPointSizeRatio");
  return v13 * v14;
}

- (CGRect)contentBoundsUnrounded
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[6];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  CGRect result;

  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x4010000000;
  v14 = &unk_19EC9DD21;
  v15 = 0u;
  v16 = 0u;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __45__CUINamedVectorGlyph_contentBoundsUnrounded__block_invoke;
  v10[3] = &unk_1E41AA7B8;
  v10[4] = self;
  v10[5] = &v11;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v10);
  v2 = v12[4];
  v3 = v12[5];
  v4 = v12[6];
  v5 = v12[7];
  _Block_object_dispose(&v11, 8);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  v9 = v5;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

double __45__CUINamedVectorGlyph_contentBoundsUnrounded__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
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
  double result;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGAffineTransform v49;

  objc_msgSend(*(id *)(a1 + 32), "referenceCanvasSize");
  v9 = v8;
  v11 = v10;
  if (a3 && a4)
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "glyphContinuousWeight");
    v48 = v13;
    objc_msgSend(*(id *)(a1 + 32), "glyphContinuousSize");
    v47 = v14;
    objc_msgSend(a3, "vectorGlyphAlignmentRectInsets");
    v45 = v16;
    v46 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(a2, "vectorGlyphAlignmentRectInsets");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    objc_msgSend(a4, "vectorGlyphAlignmentRectInsets");
    objc_msgSend(v12, "_interpolatedAlignmentRectInsetsWithWeight:glyphSize:fromUltralight:regular:black:", v48, v47, v46, v45, v18, v20, v22, v24, v26, v28, v29, v30, v31, v32);
  }
  else
  {
    objc_msgSend(a2, "vectorGlyphAlignmentRectInsets");
  }
  v37 = v33;
  v38 = v34;
  v39 = v35;
  v40 = v36;
  objc_msgSend(*(id *)(a1 + 32), "_requestedPointSizeRatio");
  if (v41 > 0.0)
  {
    v37 = v37 * v41;
    v38 = v38 * v41;
    v39 = v39 * v41;
    v40 = v40 * v41;
    memset(&v49, 0, sizeof(v49));
    CGAffineTransformMakeScale(&v49, v41, v41);
    v42 = v11 * v49.c;
    v11 = v11 * v49.d + v49.b * v9;
    v9 = v42 + v49.a * v9;
  }
  *(CGPoint *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = CGPointZero;
  result = v40 + v9 + v38;
  v44 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(double *)(v44 + 48) = result;
  *(double *)(v44 + 56) = v39 + v11 + v37;
  return result;
}

- (BOOL)generatedImage
{
  return *((_BYTE *)self + 104) & 1;
}

- (BOOL)_containsWideGamutColor
{
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  if (-[CUIRenditionKey themeDisplayGamut](-[CUINamedLookup renditionKey](self, "renditionKey"), "themeDisplayGamut"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __46__CUINamedVectorGlyph__containsWideGamutColor__block_invoke;
    v5[3] = &unk_1E41AA7E0;
    v5[4] = &v6;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v5);
  }
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__CUINamedVectorGlyph__containsWideGamutColor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = CGSVGDocumentContainsWideGamutContent(objc_msgSend(a2, "svgDocument"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)_getAnchor:(id)a3 inRendition:(id)a4
{
  uint64_t RootNode;
  id result;
  CGPoint v8;
  double v9;
  uint64_t v10;
  CGPoint v11;

  RootNode = CGSVGDocumentGetRootNode(objc_msgSend(a4, "svgDocument"));
  result = (id)CGSVGNodeFindChildWithStringIdentifier(RootNode, a3);
  if (result)
  {
    v11 = CGPointZero;
    v10 = 0;
    CGSVGShapeNodeGetCircleGeometry(result, &v11, &v11.y, &v10);
    objc_msgSend(a4, "canvasSize");
    v8 = v11;
    v11.y = v9 - v11.y;
    return +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", v8.x);
  }
  return result;
}

- (CGPoint)_getMetricCenterInRendition:(id)a3
{
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
  CGPoint result;

  objc_msgSend(a3, "vectorGlyphAlignmentRectInsets");
  v5 = v4;
  v7 = v6;
  objc_msgSend(a3, "canvasSize");
  v9 = v8;
  objc_msgSend(a3, "vectorGlyphCapLine");
  v10 = (v7 + v5 + v9) * 0.5 - v5;
  v12 = v11 * 0.5;
  objc_msgSend(a3, "vectorGlyphBaseline");
  v14 = v12 + v13;
  v15 = v10;
  result.y = v14;
  result.x = v15;
  return result;
}

- (CGPoint)metricCenter
{
  double v3;
  double v4;
  NSValue *metricCenter;
  double v6;
  double v7;
  double v8;
  double v9;
  double *v10;
  double v11;
  double v12;
  _QWORD v13[6];
  uint64_t v14;
  double *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  CGPoint result;

  -[CUINamedVectorGlyph _requestedPointSizeRatio](self, "_requestedPointSizeRatio");
  v4 = v3;
  metricCenter = self->_metricCenter;
  if (metricCenter)
  {
    -[NSValue pointValue](metricCenter, "pointValue");
    v7 = v4 * v6;
    v9 = v4 * v8;
  }
  else
  {
    v14 = 0;
    v15 = (double *)&v14;
    v16 = 0x3010000000;
    v18 = 0;
    v19 = 0;
    v17 = &unk_19EC9DD21;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __35__CUINamedVectorGlyph_metricCenter__block_invoke;
    v13[3] = &unk_1E41AA7B8;
    v13[4] = self;
    v13[5] = &v14;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v13);
    self->_metricCenter = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", v15[4], v15[5]);
    v10 = v15;
    v7 = v4 * v15[4];
    v9 = v4 * v15[5];
    v15[4] = v7;
    v10[5] = v9;
    _Block_object_dispose(&v14, 8);
  }
  v11 = v7;
  v12 = v9;
  result.y = v12;
  result.x = v11;
  return result;
}

id __35__CUINamedVectorGlyph_metricCenter__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id result;
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
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;

  result = objc_msgSend(*(id *)(a1 + 32), "_getMetricCenterInRendition:", a2);
  v9 = v8;
  v11 = v10;
  if (a3 && a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_getMetricCenterInRendition:", a3);
    v13 = v12;
    v15 = v14;
    objc_msgSend(*(id *)(a1 + 32), "_getMetricCenterInRendition:", a4);
    v17 = v16;
    v19 = v18;
    v20 = *(void **)(a1 + 32);
    objc_msgSend(v20, "glyphContinuousWeight");
    v22 = v21;
    objc_msgSend(*(id *)(a1 + 32), "glyphContinuousSize");
    result = objc_msgSend(v20, "_interpolatedAnchorWithWeight:glyphSize:fromUltralight:regular:black:", v22, v23, v13, v15, v9, v11, v17, v19);
    v9 = v24;
    v11 = v25;
  }
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(double *)(v26 + 32) = v9;
  *(double *)(v26 + 40) = v11;
  return result;
}

- (CGPoint)rotationAnchor
{
  double v3;
  double v4;
  NSValue *rotationAnchor;
  double v6;
  double v7;
  double v8;
  double v9;
  double *v10;
  double v11;
  double v12;
  _QWORD v13[6];
  uint64_t v14;
  double *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  CGPoint result;

  -[CUINamedVectorGlyph _requestedPointSizeRatio](self, "_requestedPointSizeRatio");
  v4 = v3;
  rotationAnchor = self->_rotationAnchor;
  if (rotationAnchor)
  {
    -[NSValue pointValue](rotationAnchor, "pointValue");
    v7 = v4 * v6;
    v9 = v4 * v8;
  }
  else
  {
    v14 = 0;
    v15 = (double *)&v14;
    v16 = 0x3010000000;
    v18 = 0;
    v19 = 0;
    v17 = &unk_19EC9DD21;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __37__CUINamedVectorGlyph_rotationAnchor__block_invoke;
    v13[3] = &unk_1E41AA7B8;
    v13[4] = self;
    v13[5] = &v14;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v13);
    self->_rotationAnchor = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", v15[4], v15[5]);
    v10 = v15;
    v7 = v4 * v15[4];
    v9 = v4 * v15[5];
    v15[4] = v7;
    v10[5] = v9;
    _Block_object_dispose(&v14, 8);
  }
  v11 = v7;
  v12 = v9;
  result.y = v12;
  result.x = v11;
  return result;
}

id __37__CUINamedVectorGlyph_rotationAnchor__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8;
  id result;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;

  v8 = objc_msgSend(*(id *)(a1 + 32), "_getAnchor:inRendition:", CFSTR("ra"), a2);
  if (v8)
    result = objc_msgSend(v8, "pointValue");
  else
    result = objc_msgSend(*(id *)(a1 + 32), "_getMetricCenterInRendition:", a2);
  v12 = v10;
  v13 = v11;
  if (a3 && a4)
  {
    v14 = objc_msgSend(*(id *)(a1 + 32), "_getAnchor:inRendition:", CFSTR("ra"), a3);
    v15 = objc_msgSend(*(id *)(a1 + 32), "_getAnchor:inRendition:", CFSTR("ra"), a4);
    if (v14)
      objc_msgSend(v14, "pointValue");
    else
      objc_msgSend(*(id *)(a1 + 32), "_getMetricCenterInRendition:", a3);
    v18 = v16;
    v19 = v17;
    if (v15)
      objc_msgSend(v15, "pointValue");
    else
      objc_msgSend(*(id *)(a1 + 32), "_getMetricCenterInRendition:", a4);
    v22 = v20;
    v23 = v21;
    v24 = *(void **)(a1 + 32);
    objc_msgSend(v24, "glyphContinuousWeight");
    v26 = v25;
    objc_msgSend(*(id *)(a1 + 32), "glyphContinuousSize");
    result = objc_msgSend(v24, "_interpolatedAnchorWithWeight:glyphSize:fromUltralight:regular:black:", v26, v27, v18, v19, v12, v13, v22, v23);
    v12 = v28;
    v13 = v29;
  }
  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(double *)(v30 + 32) = v12;
  *(double *)(v30 + 40) = v13;
  return result;
}

- (id)fillImageNames
{
  NSSet *v3;
  id v4;

  v3 = +[NSSet set](NSSet, "set");
  if (!-[CUINamedVectorGlyph hasImageFills](self, "hasImageFills"))
    return v3;
  v4 = -[CUINamedVectorGlyph symbolDefaults](self, "symbolDefaults");
  return objc_msgSend(v4, "objectForKeyedSubscript:", CUIVectorGlyphDefaultsKeyFillImageNames);
}

- (CGImage)fillImageWithName:(id)a3
{
  id v5;
  void *v6;
  double lookedupScaleFactor;
  int64_t v8;
  NSLocale *v9;
  int64_t v10;
  id v11;
  CGImageRef v12;
  _QWORD v14[5];

  v5 = -[CUINamedVectorGlyph fillImageNames](self, "fillImageNames");
  v6 = v5;
  if (!a3)
    a3 = objc_msgSend(v5, "anyObject");
  if (!-[CUINamedVectorGlyph hasImageFills](self, "hasImageFills")
    || !objc_msgSend(v6, "containsObject:", a3)
    || !objc_loadWeak((id *)&self->_catalog))
  {
    return 0;
  }
  lookedupScaleFactor = self->_lookedupScaleFactor;
  v8 = -[CUINamedLookup idiom](self, "idiom");
  v9 = -[CUINamedLookup localization](self, "localization");
  v10 = -[CUINamedVectorGlyph layoutDirection](self, "layoutDirection");
  if (v9)
    v9 = +[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", objc_msgSend(objc_loadWeak((id *)&self->_catalog), "_nameForLocalizationIdentifier:", v9));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __41__CUINamedVectorGlyph_fillImageWithName___block_invoke;
  v14[3] = &unk_1E41AA808;
  v14[4] = self;
  v11 = objc_msgSend(objc_loadWeak((id *)&self->_catalog), "imageWithName:scaleFactor:deviceIdiom:layoutDirection:locale:adjustRenditionKeyWithBlock:", a3, v8, v10, v9, v14, lookedupScaleFactor);
  if (!v11)
    return 0;
  v12 = CGImageRetain((CGImageRef)objc_msgSend(v11, "image"));
  CFAutorelease(v12);
  return v12;
}

id __41__CUINamedVectorGlyph_fillImageWithName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setThemeAppearance:", objc_msgSend(*(id *)(a1 + 32), "appearanceIdentifier"));
}

- (id)symbolDefaults
{
  NSDictionary *symbolDefaults;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  NSDictionary *v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  symbolDefaults = self->_symbolDefaults;
  v10 = symbolDefaults;
  if (!symbolDefaults)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = __37__CUINamedVectorGlyph_symbolDefaults__block_invoke;
    v4[3] = &unk_1E41AA830;
    v4[4] = self;
    v4[5] = &v5;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v4);
    symbolDefaults = (NSDictionary *)v6[5];
  }
  _Block_object_dispose(&v5, 8);
  return symbolDefaults;
}

id __37__CUINamedVectorGlyph_symbolDefaults__block_invoke(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "_symbolDefaults");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_symbolDefaults
{
  NSMutableDictionary *symbolDefaults;
  uint64_t NamedStyle;
  _QWORD v6[6];

  symbolDefaults = (NSMutableDictionary *)self->_symbolDefaults;
  if (!symbolDefaults)
  {
    NamedStyle = CGSVGDocumentGetNamedStyle(objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "svgDocument"), CFSTR(".defaults"));
    symbolDefaults = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", CGSVGAttributeMapGetCount());
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __38__CUINamedVectorGlyph__symbolDefaults__block_invoke;
    v6[3] = &unk_1E41AA858;
    v6[4] = self;
    v6[5] = symbolDefaults;
    CGSVGAttributeMapEnumerate(NamedStyle, v6);
    self->_symbolDefaults = (NSDictionary *)symbolDefaults;
  }
  return symbolDefaults;
}

void __38__CUINamedVectorGlyph__symbolDefaults__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  NSNumber *v11;
  uint64_t v12;
  NSNumber *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  void *v19;
  NSSet *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  double v26;

  if (objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32), a2), "_wiggleStyleAtom") != (_DWORD)a2)
  {
    if (objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32), v6), "_wiggleAngleAtom") == (_DWORD)a2)
    {
      v26 = 0.0;
      if (CGSVGAttributeGetFloat(a3, &v26))
      {
        v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v26);
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, CUIVectorGlyphDefaultsKeyWiggleAngle);
      }
      return;
    }
    if (objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32), v10), "_rotatesClockwiseAtom") == (_DWORD)a2)
    {
      v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", CUISVGAttributeGetBoolean(a3));
      v14 = *(void **)(a1 + 40);
      v15 = CUIVectorGlyphDefaultsKeyRotatesClockwise;
    }
    else if (objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32), v12), "_variableColorContinuousAtom") == (_DWORD)a2)
    {
      v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", CUISVGAttributeGetBoolean(a3));
      v14 = *(void **)(a1 + 40);
      v15 = CUIVectorGlyphDefaultsKeyVariableColorContinuous;
    }
    else
    {
      if (objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32), v16), "_hasImageFillsAtom") != (_DWORD)a2)
      {
        v18 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32), v17), "_backgroundImageNamesAtom");
        v19 = (void *)CGSVGAttributeCopyString(a3);
        if (v18 == (_DWORD)a2)
        {
          v24 = v19;
          v20 = +[NSSet setWithArray:](NSSet, "setWithArray:", objc_msgSend(v19, "componentsSeparatedByCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")));
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v20, CUIVectorGlyphDefaultsKeyFillImageNames);

        }
        else if (v19)
        {
          v25 = v19;
          v21 = (void *)CGSVGAtomCopyString(a2);
          if (v21)
          {
            v22 = v21;
            if (objc_msgSend(v21, "hasPrefix:", CFSTR("-sfsymbols-")))
            {
              v23 = objc_msgSend(v22, "substringFromIndex:", objc_msgSend(CFSTR("-sfsymbols-"), "length"));

              v22 = v23;
            }
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v25, v22, v25);

          }
        }
        return;
      }
      v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", CUISVGAttributeGetBoolean(a3));
      v14 = *(void **)(a1 + 40);
      v15 = CUIVectorGlyphDefaultsKeyHasImageFills;
    }
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);
    return;
  }
  v7 = (const __CFString *)CGSVGAttributeCopyString(a3);
  if (v7)
  {
    v8 = v7;
    if (CFStringCompare(v7, CFSTR("linear"), 0))
    {
      if (CFStringCompare(v8, CFSTR("clockwise"), 0))
      {
        if (CFStringCompare(v8, CFSTR("counterClockwise"), 0))
        {
LABEL_18:
          CFRelease(v8);
          return;
        }
        v9 = &unk_1E41DCE90;
      }
      else
      {
        v9 = &unk_1E41DCE78;
      }
    }
    else
    {
      v9 = &unk_1E41DCE60;
    }
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, CUIVectorGlyphDefaultsKeyWiggleStyle);
    goto LABEL_18;
  }
}

- (BOOL)hasImageFills
{
  id v2;
  id v3;

  v2 = -[CUINamedVectorGlyph symbolDefaults](self, "symbolDefaults");
  v3 = objc_msgSend(v2, "objectForKeyedSubscript:", CUIVectorGlyphDefaultsKeyHasImageFills);
  if (v3)
    LOBYTE(v3) = objc_msgSend(v3, "BOOLValue");
  return (char)v3;
}

- (unint64_t)numberOfTemplateLayers
{
  float v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[CUINamedVectorGlyph templateVersion](self, "templateVersion");
  if (v3 >= 3.0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __45__CUINamedVectorGlyph_numberOfTemplateLayers__block_invoke;
    v6[3] = &unk_1E41AA830;
    v6[4] = self;
    v6[5] = &v7;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v6);
    v4 = v8[3];
  }
  else
  {
    v4 = 1;
    v8[3] = 1;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __45__CUINamedVectorGlyph_numberOfTemplateLayers__block_invoke(uint64_t a1, uint64_t a2)
{
  id result;
  uint64_t v4;
  unint64_t v5;

  result = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "monochromeLayerNamesInRendition:", a2), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if (v5 <= 1)
    v5 = 1;
  *(_QWORD *)(v4 + 24) = v5;
  return result;
}

- (id)templateLayerThresholds
{
  float v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v14 = +[NSMutableArray array](NSMutableArray, "array");
  -[CUINamedVectorGlyph templateVersion](self, "templateVersion");
  if (v3 >= 4.0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __46__CUINamedVectorGlyph_templateLayerThresholds__block_invoke;
    v8[3] = &unk_1E41AA7B8;
    v8[4] = self;
    v8[5] = &v9;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v8);
  }
  v4 = objc_msgSend((id)v10[5], "count");
  v5 = (void *)v10[5];
  if (v4)
    objc_msgSend(v5, "sortUsingSelector:", sel_compare_);
  else
    objc_msgSend(v5, "addObject:", &unk_1E41DD0B8);
  v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

id __46__CUINamedVectorGlyph_templateLayerThresholds__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;
  void ***v5;
  void **v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  uint64_t v11;
  void **v12;
  uint64_t v13;
  id (*v14)(uint64_t, void *);
  void *v15;
  uint64_t v16;

  v3 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v3 + 104) & 4) != 0)
  {
    v4 = objc_msgSend(-[CUINamedVectorGlyph monochromeLayerGroup]((_QWORD *)v3), "sublayers");
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = __46__CUINamedVectorGlyph_templateLayerThresholds__block_invoke_2;
    v15 = &unk_1E41AA880;
    v16 = *(_QWORD *)(a1 + 40);
    v5 = &v12;
  }
  else
  {
    v4 = objc_msgSend((id)v3, "monochromeLayerNamesInRendition:", a2);
    v7 = _NSConcreteStackBlock;
    v8 = 3221225472;
    v9 = __46__CUINamedVectorGlyph_templateLayerThresholds__block_invoke_3;
    v10 = &unk_1E41AA880;
    v11 = *(_QWORD *)(a1 + 40);
    v5 = &v7;
  }
  return objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
}

id __46__CUINamedVectorGlyph_templateLayerThresholds__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "valueThreshold");
  return objc_msgSend(v2, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
}

id __46__CUINamedVectorGlyph_templateLayerThresholds__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", &unk_1E41DD0B8);
}

- (void)drawInContext:(CGContext *)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __37__CUINamedVectorGlyph_drawInContext___block_invoke;
  v3[3] = &unk_1E41AA910;
  v3[4] = self;
  v3[5] = a3;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v3);
}

_QWORD *__37__CUINamedVectorGlyph_drawInContext___block_invoke(uint64_t a1)
{
  return -[CUINamedVectorGlyph _drawInContext:](*(_QWORD **)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (_QWORD)_drawInContext:(_QWORD *)result
{
  _QWORD *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t SRGBBlack;

  if (result)
  {
    if (a2)
    {
      v3 = result;
      objc_msgSend(result, "referenceCanvasSize");
      v5 = v4;
      v7 = v6;
      objc_msgSend(v3, "scale");
      v9 = v8;
      objc_msgSend(v3, "_requestedPointSizeRatio");
      v11 = v9 * v10;
      v12 = objc_msgSend(v3, "name");
      _CUILog(3, (uint64_t)"-[CUINamedVectorGlyph (%@) _drawInContext: scale:%f targetSize:%fx%f]", v13, v14, v15, v16, v17, v18, (uint64_t)v12);
      SRGBBlack = _CUIColorGetSRGBBlack();
      return -[CUINamedVectorGlyph _drawInContext:scaleFactor:targetSize:primaryColor:tertiaryColor:](v3, a2, SRGBBlack, 0, v11, v5, v7);
    }
  }
  return result;
}

- (CGPath)CGPath
{
  CGPath *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __29__CUINamedVectorGlyph_CGPath__block_invoke;
  v4[3] = &unk_1E41AA7B8;
  v4[4] = self;
  v4[5] = &v5;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v4);
  v2 = (CGPath *)v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

_QWORD *__29__CUINamedVectorGlyph_CGPath__block_invoke(_QWORD *result)
{
  _QWORD *v1;
  CGPath *Mutable;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  _QWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  if ((*(_BYTE *)(result[4] + 104) & 4) != 0)
  {
    v1 = result;
    Mutable = CGPathCreateMutable();
    v15 = v1;
    v3 = objc_msgSend(-[CUINamedVectorGlyph monochromeLayerGroup]((_QWORD *)v1[4]), "sublayers");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(objc_msgSend(v8, "sublayers"), "count"))
          {
            v18 = 0u;
            v19 = 0u;
            v16 = 0u;
            v17 = 0u;
            v9 = objc_msgSend(v8, "sublayers");
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            if (v10)
            {
              v11 = v10;
              v12 = *(_QWORD *)v17;
              do
              {
                for (j = 0; j != v11; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v17 != v12)
                    objc_enumerationMutation(v9);
                  v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)j);
                  if (objc_msgSend(v14, "shape"))
                    CGPathAddPath(Mutable, 0, (CGPathRef)objc_msgSend(v14, "shape"));
                }
                v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
              }
              while (v11);
            }
          }
          else if (objc_msgSend(v8, "shape"))
          {
            CGPathAddPath(Mutable, 0, (CGPathRef)objc_msgSend(v8, "shape"));
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v5);
    }
    *(_QWORD *)(*(_QWORD *)(v15[5] + 8) + 24) = Mutable;
    return CFAutorelease(Mutable);
  }
  return result;
}

- (CGPath)maskShape
{
  CGPath *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __32__CUINamedVectorGlyph_maskShape__block_invoke;
  v4[3] = &unk_1E41AA7B8;
  v4[4] = self;
  v4[5] = &v5;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v4);
  v2 = (CGPath *)v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __32__CUINamedVectorGlyph_maskShape__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  void *i;
  void *v7;
  double v8;
  _BOOL4 v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  double v15;
  const CGPath *v16;
  id v17;
  const CGPath *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  const CGPath *v22;
  id v23;
  uint64_t v24;
  void *k;
  const CGPath *v26;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  int v31;
  CGPathRef CopyByUnioningPath;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id obj;
  const CGPath *obja;
  uint64_t v38;
  uint64_t v39;
  _QWORD block[6];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  CGRect BoundingBox;
  CGRect v66;
  CGRect v67;

  v2 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v2 + 104) & 4) == 0)
    return;
  v33 = a1;
  v3 = objc_msgSend(-[CUINamedVectorGlyph monochromeLayerGroup]((_QWORD *)v2), "sublayers");
  v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v3;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
  if (!v5)
    goto LABEL_30;
  v38 = *(_QWORD *)v58;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v58 != v38)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v7, "isEraserLayer"))
      {
        objc_msgSend(v7, "opacity");
        v9 = v8 < 2.22044605e-16;
      }
      else
      {
        v9 = 0;
      }
      if (objc_msgSend(objc_msgSend(v7, "sublayers"), "count"))
      {
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v10 = objc_msgSend(v7, "sublayers");
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
        if (!v11)
          continue;
        v12 = *(_QWORD *)v54;
        while (1)
        {
          for (j = 0; j != v11; j = (char *)j + 1)
          {
            if (*(_QWORD *)v54 != v12)
              objc_enumerationMutation(v10);
            v14 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)j);
            if ((objc_msgSend(v14, "isEraserLayer") & 1) != 0)
            {
              objc_msgSend(v14, "opacity");
              if (((v9 ^ (v15 < 2.22044605e-16)) & 1) != 0)
                continue;
            }
            else if (v9)
            {
              continue;
            }
            v16 = (const CGPath *)objc_msgSend(v14, "shape");
            if (v16)
            {
              v17 = CUICreateSubpathArrayFromCGPath(v16);
              objc_msgSend(v4, "addObjectsFromArray:", v17);

            }
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
          if (!v11)
            goto LABEL_28;
        }
      }
      if (!v9)
      {
        v18 = (const CGPath *)objc_msgSend(v7, "shape");
        if (v18)
        {
          v19 = CUICreateSubpathArrayFromCGPath(v18);
          objc_msgSend(v4, "addObjectsFromArray:", v19);

        }
      }
LABEL_28:
      ;
    }
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
  }
  while (v5);
LABEL_30:
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v35 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
  if (v35)
  {
    obja = 0;
    v34 = *(_QWORD *)v50;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v50 != v34)
        {
          v21 = v20;
          objc_enumerationMutation(v4);
          v20 = v21;
        }
        v39 = v20;
        v22 = *(const CGPath **)(*((_QWORD *)&v49 + 1) + 8 * v20);
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v23 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v46;
          do
          {
            for (k = 0; k != v23; k = (char *)k + 1)
            {
              if (*(_QWORD *)v46 != v24)
                objc_enumerationMutation(v4);
              v26 = *(const CGPath **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)k);
              if (v22 != v26)
              {
                v41 = 0;
                v42 = &v41;
                v43 = 0x2020000000;
                v44 = 0;
                BoundingBox = CGPathGetBoundingBox(v22);
                x = BoundingBox.origin.x;
                y = BoundingBox.origin.y;
                width = BoundingBox.size.width;
                height = BoundingBox.size.height;
                v66 = CGPathGetBoundingBox(v26);
                v67.origin.x = x;
                v67.origin.y = y;
                v67.size.width = width;
                v67.size.height = height;
                if (CGRectContainsRect(v66, v67))
                {
                  block[0] = _NSConcreteStackBlock;
                  block[1] = 3221225472;
                  block[2] = __32__CUINamedVectorGlyph_maskShape__block_invoke_2;
                  block[3] = &unk_1E41AA938;
                  block[4] = &v41;
                  block[5] = v26;
                  CGPathApplyWithBlock(v22, block);
                  v31 = *((unsigned __int8 *)v42 + 24);
                  _Block_object_dispose(&v41, 8);
                  if (!v31)
                    goto LABEL_50;
                }
                else
                {
                  *((_BYTE *)v42 + 24) = 1;
                  _Block_object_dispose(&v41, 8);
                }
              }
            }
            v23 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
          }
          while (v23);
        }
        if (obja)
        {
          CopyByUnioningPath = CGPathCreateCopyByUnioningPath(obja, v22, 0);
          CGPathRelease(obja);
          obja = CopyByUnioningPath;
        }
        else
        {
          obja = CGPathRetain(v22);
        }
LABEL_50:
        v20 = v39 + 1;
      }
      while ((id)(v39 + 1) != v35);
      v35 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
    }
    while (v35);
    if (obja)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v33 + 40) + 8) + 24) = obja;
      CFAutorelease(obja);
    }
  }

}

uint64_t __32__CUINamedVectorGlyph_maskShape__block_invoke_2(uint64_t result, int *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  CGPoint *v5;

  v2 = result;
  v3 = *a2;
  if (*a2 < 2)
  {
    v5 = (CGPoint *)*((_QWORD *)a2 + 1);
    if (!v5)
      return result;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = 1;
    }
    else
    {
      if (v3 != 3)
        return result;
      v4 = 2;
    }
    v5 = (CGPoint *)(*((_QWORD *)a2 + 1) + 16 * v4);
  }
  result = CGPathContainsPoint(*(CGPathRef *)(result + 40), 0, *v5, 0);
  if ((result & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 24) = 1;
  return result;
}

- (unint64_t)numberOfMulticolorLayers
{
  float v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[CUINamedVectorGlyph templateVersion](self, "templateVersion");
  if (v3 >= 2.1)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __47__CUINamedVectorGlyph_numberOfMulticolorLayers__block_invoke;
    v6[3] = &unk_1E41AA830;
    v6[4] = self;
    v6[5] = &v7;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v6);
    v4 = v8[3];
  }
  else
  {
    v4 = 1;
    v8[3] = 1;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __47__CUINamedVectorGlyph_numberOfMulticolorLayers__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  id result;

  v3 = *(id *)(a1 + 32);
  if (v3)
    v3 = objc_msgSend(v3, "_layerNamesForRenderingMode:inRendition:", 2, a2);
  result = objc_msgSend(v3, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)multicolorLayerThresholds
{
  float v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v14 = +[NSMutableArray array](NSMutableArray, "array");
  -[CUINamedVectorGlyph templateVersion](self, "templateVersion");
  if (v3 >= 4.0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __48__CUINamedVectorGlyph_multicolorLayerThresholds__block_invoke;
    v8[3] = &unk_1E41AA7B8;
    v8[4] = self;
    v8[5] = &v9;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v8);
  }
  v4 = objc_msgSend((id)v10[5], "count");
  v5 = (void *)v10[5];
  if (v4)
    objc_msgSend(v5, "sortUsingSelector:", sel_compare_);
  else
    objc_msgSend(v5, "addObject:", &unk_1E41DD0B8);
  v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

id __48__CUINamedVectorGlyph_multicolorLayerThresholds__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;
  void ***v5;
  void **v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  uint64_t v11;
  void **v12;
  uint64_t v13;
  id (*v14)(uint64_t, void *);
  void *v15;
  uint64_t v16;

  v3 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v3 + 104) & 4) != 0)
  {
    v4 = objc_msgSend(-[CUINamedVectorGlyph multicolorLayerGroup]((_QWORD *)v3), "sublayers");
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = __48__CUINamedVectorGlyph_multicolorLayerThresholds__block_invoke_2;
    v15 = &unk_1E41AA880;
    v16 = *(_QWORD *)(a1 + 40);
    v5 = &v12;
  }
  else
  {
    v4 = objc_msgSend((id)v3, "_layerNamesForRenderingMode:inRendition:", 2, a2);
    v7 = _NSConcreteStackBlock;
    v8 = 3221225472;
    v9 = __48__CUINamedVectorGlyph_multicolorLayerThresholds__block_invoke_3;
    v10 = &unk_1E41AA880;
    v11 = *(_QWORD *)(a1 + 40);
    v5 = &v7;
  }
  return objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
}

id __48__CUINamedVectorGlyph_multicolorLayerThresholds__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "valueThreshold");
  return objc_msgSend(v2, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
}

id __48__CUINamedVectorGlyph_multicolorLayerThresholds__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", &unk_1E41DD0B8);
}

- (id)makeLayerWithColorResolver:(id)a3
{
  CGImage *v3;
  CGImage *v4;
  CALayer *v5;
  double Width;

  v3 = -[CUINamedVectorGlyph imageWithColorResolver:](self, "imageWithColorResolver:", a3);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = +[CALayer layer](CALayer, "layer");
  -[CALayer setContents:](v5, "setContents:", v4);
  Width = (double)CGImageGetWidth(v4);
  -[CALayer setBounds:](v5, "setBounds:", 0.0, 0.0, Width, (double)CGImageGetHeight(v4));
  CGImageRelease(v4);
  return v5;
}

- (void)drawMulticolorLayerAtIndex:(unint64_t)a3 inContext:(CGContext *)a4 withColorResolver:(id)a5
{
  _QWORD v5[8];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __78__CUINamedVectorGlyph_drawMulticolorLayerAtIndex_inContext_withColorResolver___block_invoke;
  v5[3] = &unk_1E41AA9B0;
  v5[6] = a3;
  v5[7] = a4;
  v5[4] = self;
  v5[5] = a5;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v5);
}

id __78__CUINamedVectorGlyph_drawMulticolorLayerAtIndex_inContext_withColorResolver___block_invoke(uint64_t a1)
{
  unint64_t v2;
  id result;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;

  v2 = *(_QWORD *)(a1 + 48);
  result = objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph multicolorLayerGroup](*(_QWORD **)(a1 + 32)), "sublayers"), "count");
  if (v2 < (unint64_t)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "referenceCanvasSize");
    v5 = v4;
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "scale");
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 32), "_requestedPointSizeRatio");
    v11 = v9 * v10;
    v12 = objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph multicolorLayerGroup](*(_QWORD **)(a1 + 32)), "sublayers"), "objectAtIndex:", *(_QWORD *)(a1 + 48));
    v13 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "variableMinValue");
    v15 = v14;
    objc_msgSend(*(id *)(a1 + 32), "variableMaxValue");
    return objc_msgSend(v12, "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:colorResolver:", v13, *(_QWORD *)(a1 + 40), v11, v5, v7, v15, v16);
  }
  return result;
}

id __47__CUINamedVectorGlyph_containsNamedColorStyles__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;
  id result;

  v3 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v3 + 104) & 4) != 0)
    v4 = objc_msgSend(-[CUINamedVectorGlyph multicolorLayerGroup]((_QWORD *)v3), "sublayers");
  else
    v4 = objc_msgSend((id)v3, "_layerNamesForRenderingMode:inRendition:", 2, a2);
  result = objc_msgSend(v4, "count");
  *(_WORD *)(*(_QWORD *)(a1 + 32) + 106) = result != 0;
  return result;
}

- (id)multicolorColorNames
{
  id v3;
  float v4;
  _QWORD v6[6];

  v3 = +[NSMutableSet set](NSMutableSet, "set");
  -[CUINamedVectorGlyph templateVersion](self, "templateVersion");
  if (v4 >= 2.1)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __43__CUINamedVectorGlyph_multicolorColorNames__block_invoke;
    v6[3] = &unk_1E41AAA28;
    v6[4] = self;
    v6[5] = v3;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v6);
  }
  return v3;
}

id __43__CUINamedVectorGlyph_multicolorColorNames__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSOrderedSet *v4;
  NSOrderedSet *v5;
  id result;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v3 + 104) & 4) != 0)
    v4 = +[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", objc_msgSend(objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph multicolorLayerGroup]((_QWORD *)v3), "sublayers"), "valueForKeyPath:", CFSTR("name")), "sortedArrayUsingSelector:", sel_compare_));
  else
    v4 = (NSOrderedSet *)objc_msgSend((id)v3, "_layerNamesForRenderingMode:inRendition:", 2, a2);
  v5 = v4;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  result = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", -[CUINamedVectorGlyph colorNameForRenderingStyle:](*(const __CFString **)(a1 + 32), *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9)));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      result = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v7 = result;
    }
    while (result);
  }
  return result;
}

- (id)multicolorLayerColorNames
{
  id v3;
  float v4;
  _QWORD v6[6];

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  -[CUINamedVectorGlyph templateVersion](self, "templateVersion");
  if (v4 >= 2.1)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __48__CUINamedVectorGlyph_multicolorLayerColorNames__block_invoke;
    v6[3] = &unk_1E41AAA28;
    v6[4] = self;
    v6[5] = v3;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v6);
  }
  return v3;
}

id __48__CUINamedVectorGlyph_multicolorLayerColorNames__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSOrderedSet *v4;
  NSOrderedSet *v5;
  id result;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v3 + 104) & 4) != 0)
    v4 = +[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", objc_msgSend(objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph multicolorLayerGroup]((_QWORD *)v3), "sublayers"), "valueForKeyPath:", CFSTR("name")), "sortedArrayUsingSelector:", sel_compare_));
  else
    v4 = (NSOrderedSet *)objc_msgSend((id)v3, "_layerNamesForRenderingMode:inRendition:", 2, a2);
  v5 = v4;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  result = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", -[CUINamedVectorGlyph colorNameForRenderingStyle:](*(const __CFString **)(a1 + 32), *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9)));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      result = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v7 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)isKnockoutEnabledForMulticolorLayerAtIndex:(int64_t)a3 opacity:(double *)a4
{
  float v7;
  char v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[CUINamedVectorGlyph templateVersion](self, "templateVersion");
  if (v7 >= 2.1)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __74__CUINamedVectorGlyph_isKnockoutEnabledForMulticolorLayerAtIndex_opacity___block_invoke;
    v10[3] = &unk_1E41AAA50;
    v10[4] = self;
    v10[5] = &v11;
    v10[6] = a3;
    v10[7] = a4;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v10);
  }
  v8 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

_BYTE *__74__CUINamedVectorGlyph_isKnockoutEnabledForMulticolorLayerAtIndex_opacity___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  _BYTE *result;
  double v6;
  double v7;
  id v8;
  unsigned int v9;
  double v10;
  double v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  _BOOL4 v15;
  _BOOL4 v16;
  double *v17;

  objc_msgSend(*(id *)(a1 + 32), "variableMinValue");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "variableMaxValue");
  result = *(_BYTE **)(a1 + 32);
  v6 = 1.0;
  if ((result[104] & 4) == 0)
    goto LABEL_24;
  v7 = v4;
  v8 = objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph multicolorLayerGroup](result), "sublayers"), "objectAtIndex:", *(_QWORD *)(a1 + 48));
  v9 = objc_msgSend(v8, "isEraserLayer");
  objc_msgSend(v8, "opacity");
  v6 = v10;
  result = objc_msgSend(v8, "valueThreshold");
  if (v9)
    v12 = v6 < 2.22044605e-16;
  else
    v12 = 0;
  if (!v12 || (v7 == INFINITY ? (v13 = v3 == INFINITY) : (v13 = 0), !v13 ? (v14 = v11 == INFINITY) : (v14 = 1), v14))
  {
LABEL_22:
    if (!v9)
      goto LABEL_24;
    goto LABEL_23;
  }
  v15 = v3 == INFINITY;
  if (v11 >= v3)
    v15 = 1;
  v16 = v11 <= v7;
  if (v11 <= 0.0)
    v16 = v11 < v7;
  if (v7 == INFINITY)
    v16 = 1;
  v6 = 0.0;
  if (!v15 || !v16)
  {
    v6 = 0.7;
    goto LABEL_22;
  }
LABEL_23:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
LABEL_24:
  v17 = *(double **)(a1 + 56);
  if (v17)
    *v17 = v6;
  return result;
}

- (id)hierarchicalLayerThresholds
{
  float v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v14 = +[NSMutableArray array](NSMutableArray, "array");
  -[CUINamedVectorGlyph templateVersion](self, "templateVersion");
  if (v3 >= 4.0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __50__CUINamedVectorGlyph_hierarchicalLayerThresholds__block_invoke;
    v8[3] = &unk_1E41AA7B8;
    v8[4] = self;
    v8[5] = &v9;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v8);
  }
  v4 = objc_msgSend((id)v10[5], "count");
  v5 = (void *)v10[5];
  if (v4)
    objc_msgSend(v5, "sortUsingSelector:", sel_compare_);
  else
    objc_msgSend(v5, "addObject:", &unk_1E41DD0B8);
  v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

id __50__CUINamedVectorGlyph_hierarchicalLayerThresholds__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;
  void ***v5;
  void **v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  uint64_t v11;
  void **v12;
  uint64_t v13;
  id (*v14)(uint64_t, void *);
  void *v15;
  uint64_t v16;

  v3 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v3 + 104) & 4) != 0)
  {
    v4 = objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup]((_QWORD *)v3), "sublayers");
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = __50__CUINamedVectorGlyph_hierarchicalLayerThresholds__block_invoke_2;
    v15 = &unk_1E41AA880;
    v16 = *(_QWORD *)(a1 + 40);
    v5 = &v12;
  }
  else
  {
    v4 = objc_msgSend((id)v3, "_layerNamesForRenderingMode:inRendition:", 3, a2);
    v7 = _NSConcreteStackBlock;
    v8 = 3221225472;
    v9 = __50__CUINamedVectorGlyph_hierarchicalLayerThresholds__block_invoke_3;
    v10 = &unk_1E41AA880;
    v11 = *(_QWORD *)(a1 + 40);
    v5 = &v7;
  }
  return objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
}

id __50__CUINamedVectorGlyph_hierarchicalLayerThresholds__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "valueThreshold");
  return objc_msgSend(v2, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
}

id __50__CUINamedVectorGlyph_hierarchicalLayerThresholds__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", &unk_1E41DD0B8);
}

- (id)hierarchyLayers
{
  id v3;
  float v4;
  _QWORD v6[6];

  v3 = +[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet");
  -[CUINamedVectorGlyph templateVersion](self, "templateVersion");
  if (v4 >= 3.0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __38__CUINamedVectorGlyph_hierarchyLayers__block_invoke;
    v6[3] = &unk_1E41AAA28;
    v6[4] = self;
    v6[5] = v3;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v6);
  }
  else
  {
    objc_msgSend(v3, "addIndex:", 0);
  }
  return v3;
}

id __38__CUINamedVectorGlyph_hierarchyLayers__block_invoke(uint64_t a1)
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  id result;
  id v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  _BOOL4 v15;
  _BOOL4 v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v2 = objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup](*(_QWORD **)(a1 + 32)), "sublayers");
  objc_msgSend(*(id *)(a1 + 32), "variableMinValue");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "variableMaxValue");
  v6 = v5;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (result)
  {
    v8 = result;
    v9 = *(_QWORD *)v19;
    v10 = v6 != INFINITY || v4 != INFINITY;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v2);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11);
        v13 = objc_msgSend(v12, "hierarchyLevel");
        if (v10)
        {
          objc_msgSend(v12, "valueThreshold");
          if (v14 == INFINITY)
            goto LABEL_17;
          v15 = v4 == INFINITY;
          if (v14 >= v4)
            v15 = 1;
          v16 = v14 <= v6;
          if (v14 <= 0.0)
            v16 = v14 < v6;
          if (v6 == INFINITY)
            v16 = 1;
          if (v15 && v16)
LABEL_17:
            v17 = 0;
          else
            v17 = 2;
        }
        else
        {
          v17 = (uint64_t)v13;
        }
        objc_msgSend(*(id *)(a1 + 40), "addIndex:", v17);
        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v8 = result;
    }
    while (result);
  }
  return result;
}

- (id)hierarchyLevels
{
  id v3;
  float v4;
  _QWORD v6[6];

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  -[CUINamedVectorGlyph templateVersion](self, "templateVersion");
  if (v4 >= 3.0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __38__CUINamedVectorGlyph_hierarchyLevels__block_invoke;
    v6[3] = &unk_1E41AAA28;
    v6[4] = self;
    v6[5] = v3;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v6);
  }
  else
  {
    objc_msgSend(v3, "addObject:", &unk_1E41DCEA8);
  }
  return v3;
}

id __38__CUINamedVectorGlyph_hierarchyLevels__block_invoke(uint64_t a1)
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  id result;
  id v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  _BOOL4 v15;
  _BOOL4 v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v2 = objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup](*(_QWORD **)(a1 + 32)), "sublayers");
  objc_msgSend(*(id *)(a1 + 32), "variableMinValue");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "variableMaxValue");
  v6 = v5;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (result)
  {
    v8 = result;
    v9 = *(_QWORD *)v19;
    v10 = v6 != INFINITY || v4 != INFINITY;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v2);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11);
        v13 = objc_msgSend(v12, "hierarchyLevel");
        if (v10)
        {
          objc_msgSend(v12, "valueThreshold");
          if (v14 == INFINITY)
            goto LABEL_17;
          v15 = v4 == INFINITY;
          if (v14 >= v4)
            v15 = 1;
          v16 = v14 <= v6;
          if (v14 <= 0.0)
            v16 = v14 < v6;
          if (v6 == INFINITY)
            v16 = 1;
          if (v15 && v16)
LABEL_17:
            v17 = 0;
          else
            v17 = 2;
        }
        else
        {
          v17 = (uint64_t)v13;
        }
        objc_msgSend(*(id *)(a1 + 40), "addObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v17));
        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v8 = result;
    }
    while (result);
  }
  return result;
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withHierarchyColorResolver:(id)a5
{
  CGImage *v5;
  _QWORD v7[8];
  CGSize v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __95__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withHierarchyColorResolver___block_invoke;
  v7[3] = &unk_1E41AA988;
  v7[5] = a5;
  v7[6] = &v9;
  *(double *)&v7[7] = a3;
  v8 = a4;
  v7[4] = self;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v7);
  v5 = (CGImage *)v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

CGImageRef __95__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withHierarchyColorResolver___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  CGImageRef result;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __95__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withHierarchyColorResolver___block_invoke_2;
  v4[3] = &unk_1E41AA960;
  v2 = *(_QWORD **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  result = -[CUINamedVectorGlyph _rasterizeImageUsingScaleFactor:forTargetSize:renderingMode:colorResolver:](v2, 3, (uint64_t)v4, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __95__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withHierarchyColorResolver___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)drawHierarchyLayerAtIndex:(unint64_t)a3 inContext:(CGContext *)a4 withColorResolver:(id)a5
{
  _QWORD v5[8];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __77__CUINamedVectorGlyph_drawHierarchyLayerAtIndex_inContext_withColorResolver___block_invoke;
  v5[3] = &unk_1E41AA9B0;
  v5[6] = a3;
  v5[7] = a4;
  v5[4] = self;
  v5[5] = a5;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v5);
}

_QWORD *__77__CUINamedVectorGlyph_drawHierarchyLayerAtIndex_inContext_withColorResolver___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  _QWORD *result;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;

  objc_msgSend(*(id *)(a1 + 32), "referenceCanvasSize");
  v3 = v2;
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "scale");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "_requestedPointSizeRatio");
  v9 = v7 * v8;
  v10 = *(_QWORD *)(a1 + 48);
  result = objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup](*(_QWORD **)(a1 + 32)), "sublayers"), "count");
  if (v10 >= (unint64_t)result)
  {
    if (!*(_QWORD *)(a1 + 48))
    {
      v17 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      return -[CUINamedVectorGlyph _drawInContext:scaleFactor:targetSize:primaryColor:tertiaryColor:](*(_QWORD **)(a1 + 32), *(_QWORD *)(a1 + 56), v17, 0, v9, v3, v5);
    }
  }
  else
  {
    v12 = objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup](*(_QWORD **)(a1 + 32)), "sublayers"), "objectAtIndex:", *(_QWORD *)(a1 + 48));
    v13 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "variableMinValue");
    v15 = v14;
    objc_msgSend(*(id *)(a1 + 32), "variableMaxValue");
    return objc_msgSend(v12, "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:hierarchicalColorResolver:", v13, *(_QWORD *)(a1 + 40), v9, v3, v5, v15, v16);
  }
  return result;
}

- (CGImage)imageWithHierarchicalPrimaryColor:(CGColor *)a3
{
  _QWORD v5[7];

  if (a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __57__CUINamedVectorGlyph_imageWithHierarchicalPrimaryColor___block_invoke;
    v5[3] = &__block_descriptor_56_e21___CGColor__24__0Q8Q16l;
    v5[4] = a3;
    v5[5] = 4;
    v5[6] = CGColorGetAlpha(a3);
    return -[CUINamedVectorGlyph imageWithHierarchyColorResolver:](self, "imageWithHierarchyColorResolver:", v5);
  }
  else
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUINamedVectorGlyph.m"), 1870, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("primaryColor"));
    return 0;
  }
}

CFTypeRef __57__CUINamedVectorGlyph_imageWithHierarchicalPrimaryColor___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  CGColor *v5;
  unint64_t v6;
  CGColorRef CopyWithAlpha;

  v5 = (CGColor *)CFRetain(*(CFTypeRef *)(a1 + 32));
  v6 = *(_QWORD *)(a1 + 40) - 1;
  if (v6 >= a3)
    v6 = a3;
  if (v6)
  {
    CopyWithAlpha = CGColorCreateCopyWithAlpha(*(CGColorRef *)(a1 + 32), CUIVectorGlyphHierarchicalColorOpacities[v6] * *(double *)(a1 + 48));
    CFRelease(*(CFTypeRef *)(a1 + 32));
  }
  else
  {
    CopyWithAlpha = v5;
  }
  return CFAutorelease(CopyWithAlpha);
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 hierarchicalPrimaryColor:(CGColor *)a5
{
  double height;
  double width;
  _QWORD v10[7];

  if (a5)
  {
    height = a4.height;
    width = a4.width;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __93__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_hierarchicalPrimaryColor___block_invoke;
    v10[3] = &__block_descriptor_56_e21___CGColor__24__0Q8Q16l;
    v10[4] = a5;
    v10[5] = 4;
    v10[6] = CGColorGetAlpha(a5);
    return -[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withHierarchyColorResolver:](self, "rasterizeImageUsingScaleFactor:forTargetSize:withHierarchyColorResolver:", v10, a3, width, height);
  }
  else
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4.width, a4.height), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUINamedVectorGlyph.m"), 1892, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("primaryColor"));
    return 0;
  }
}

CFTypeRef __93__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_hierarchicalPrimaryColor___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  CGColor *v5;
  unint64_t v6;
  CGColorRef CopyWithAlpha;

  v5 = (CGColor *)CFRetain(*(CFTypeRef *)(a1 + 32));
  v6 = *(_QWORD *)(a1 + 40) - 1;
  if (v6 >= a3)
    v6 = a3;
  if (v6)
  {
    CopyWithAlpha = CGColorCreateCopyWithAlpha(*(CGColorRef *)(a1 + 32), CUIVectorGlyphHierarchicalColorOpacities[v6] * *(double *)(a1 + 48));
    CFRelease(*(CFTypeRef *)(a1 + 32));
  }
  else
  {
    CopyWithAlpha = v5;
  }
  return CFAutorelease(CopyWithAlpha);
}

- (BOOL)isKnockoutEnabledForHierarchicalLayerAtIndex:(int64_t)a3 opacity:(double *)a4
{
  float v7;
  char v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (a4)
    *a4 = 1.0;
  -[CUINamedVectorGlyph templateVersion](self, "templateVersion");
  if (v7 >= 3.0)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __76__CUINamedVectorGlyph_isKnockoutEnabledForHierarchicalLayerAtIndex_opacity___block_invoke;
    v10[3] = &unk_1E41AAA50;
    v10[4] = self;
    v10[5] = &v11;
    v10[6] = a3;
    v10[7] = a4;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v10);
  }
  v8 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

id __76__CUINamedVectorGlyph_isKnockoutEnabledForHierarchicalLayerAtIndex_opacity___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;
  unsigned int v7;
  id result;
  double v9;
  double v10;
  BOOL v11;
  double v13;
  BOOL v14;
  BOOL v15;
  double *v16;

  objc_msgSend(*(id *)(a1 + 32), "variableMinValue");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "variableMaxValue");
  v5 = v4;
  v6 = objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup](*(_QWORD **)(a1 + 32)), "sublayers"), "objectAtIndex:", *(_QWORD *)(a1 + 48));
  v7 = objc_msgSend(v6, "isEraserLayer");
  result = objc_msgSend(v6, "opacity");
  v10 = v9;
  if (v7)
    v11 = v9 < 2.22044605e-16;
  else
    v11 = 0;
  if (v11 && (v3 != INFINITY || v5 != INFINITY))
  {
    result = objc_msgSend(v6, "valueThreshold");
    if (v13 != INFINITY)
    {
      v14 = v3 == INFINITY;
      if (v13 >= v3)
        v14 = 1;
      v15 = v13 <= v5;
      if (v13 <= 0.0)
        v15 = v13 < v5;
      if (v5 == INFINITY)
        v15 = 1;
      if (v14 && v15)
        v10 = 0.0;
      else
        v10 = 0.7;
    }
  }
  if (v7)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v16 = *(double **)(a1 + 56);
  if (v16)
    *v16 = v10;
  return result;
}

- (id)paletteLevels
{
  id v3;
  float v4;
  _QWORD v6[6];

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  -[CUINamedVectorGlyph templateVersion](self, "templateVersion");
  if (v4 >= 3.0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __36__CUINamedVectorGlyph_paletteLevels__block_invoke;
    v6[3] = &unk_1E41AAA28;
    v6[4] = self;
    v6[5] = v3;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v6);
  }
  else
  {
    objc_msgSend(v3, "addObject:", &unk_1E41DCEA8);
  }
  return v3;
}

id __36__CUINamedVectorGlyph_paletteLevels__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSOrderedSet *v4;
  uint64_t v5;
  NSOrderedSet *v6;
  id v7;
  id result;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v3 + 104) & 4) != 0)
    v4 = +[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", objc_msgSend(objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup]((_QWORD *)v3), "sublayers"), "valueForKeyPath:", CFSTR("name")), "sortedArrayUsingSelector:", sel_compare_));
  else
    v4 = (NSOrderedSet *)objc_msgSend((id)v3, "_layerNamesForRenderingMode:inRendition:", 3, a2);
  v6 = v4;
  v7 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32), v5), "_layerHierarchyStyleNames");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  result = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (result)
  {
    v9 = result;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "indexOfObject:", -[CUINamedVectorGlyph colorNameForRenderingStyle:](*(const __CFString **)(a1 + 32), *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11)))));
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      result = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v9 = result;
    }
    while (result);
  }
  return result;
}

- (void)drawPaletteLayerAtIndex:(unint64_t)a3 inContext:(CGContext *)a4 withColorResolver:(id)a5
{
  _QWORD v5[8];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __75__CUINamedVectorGlyph_drawPaletteLayerAtIndex_inContext_withColorResolver___block_invoke;
  v5[3] = &unk_1E41AA9B0;
  v5[6] = a3;
  v5[7] = a4;
  v5[4] = self;
  v5[5] = a5;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v5);
}

_QWORD *__75__CUINamedVectorGlyph_drawPaletteLayerAtIndex_inContext_withColorResolver___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  _QWORD *result;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;

  objc_msgSend(*(id *)(a1 + 32), "referenceCanvasSize");
  v3 = v2;
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "scale");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "_requestedPointSizeRatio");
  v9 = v7 * v8;
  v10 = *(_QWORD *)(a1 + 48);
  result = objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup](*(_QWORD **)(a1 + 32)), "sublayers"), "count");
  if (v10 >= (unint64_t)result)
  {
    if (!*(_QWORD *)(a1 + 48))
    {
      v17 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      return -[CUINamedVectorGlyph _drawInContext:scaleFactor:targetSize:primaryColor:tertiaryColor:](*(_QWORD **)(a1 + 32), *(_QWORD *)(a1 + 56), v17, 0, v9, v3, v5);
    }
  }
  else
  {
    v12 = objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup](*(_QWORD **)(a1 + 32)), "sublayers"), "objectAtIndex:", *(_QWORD *)(a1 + 48));
    v13 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "variableMinValue");
    v15 = v14;
    objc_msgSend(*(id *)(a1 + 32), "variableMaxValue");
    return objc_msgSend(v12, "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:paletteColorResolver:", v13, *(_QWORD *)(a1 + 40), v9, v3, v5, v15, v16);
  }
  return result;
}

CGImageRef __46__CUINamedVectorGlyph_imageWithPaletteColors___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  CGImageRef result;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __46__CUINamedVectorGlyph_imageWithPaletteColors___block_invoke_2;
  v4[3] = &unk_1E41AAA98;
  v2 = *(_QWORD **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  result = -[CUINamedVectorGlyph _rasterizeImageUsingScaleFactor:forTargetSize:renderingMode:colorResolver:](v2, 1, (uint64_t)v4, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

id __46__CUINamedVectorGlyph_imageWithPaletteColors___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "firstObject");
}

CGImageRef __86__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColors___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  CGImageRef result;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __86__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColors___block_invoke_2;
  v4[3] = &unk_1E41AAA98;
  v2 = *(_QWORD **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  result = -[CUINamedVectorGlyph _rasterizeImageUsingScaleFactor:forTargetSize:renderingMode:colorResolver:](v2, 1, (uint64_t)v4, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

id __86__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColors___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "firstObject");
}

- (void)drawInContext:(CGContext *)a3 withPaletteColors:(id)a4
{
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  id v16;
  uint64_t i;
  _QWORD v18[6];
  _QWORD v19[10];

  if (a4)
  {
    v7 = -[CUINamedVectorGlyph numberOfHierarchyLayers](self, "numberOfHierarchyLayers");
    v8 = objc_msgSend(a4, "count");
    if (v8 == (id)1)
    {
      -[CUINamedVectorGlyph referenceCanvasSize](self, "referenceCanvasSize");
      v10 = v9;
      v12 = v11;
      -[CUINamedVectorGlyph scale](self, "scale");
      v14 = v13;
      -[CUINamedVectorGlyph _requestedPointSizeRatio](self, "_requestedPointSizeRatio");
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = __55__CUINamedVectorGlyph_drawInContext_withPaletteColors___block_invoke;
      v19[3] = &unk_1E41AAB10;
      v19[5] = a4;
      v19[6] = a3;
      *(double *)&v19[7] = v14 * v15;
      v19[8] = v10;
      v19[9] = v12;
      v19[4] = self;
      -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v19);
    }
    else if (v7)
    {
      v16 = v8;
      for (i = 0; i != v7; ++i)
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = __55__CUINamedVectorGlyph_drawInContext_withPaletteColors___block_invoke_2;
        v18[3] = &unk_1E41AAAE8;
        v18[4] = a4;
        v18[5] = v16;
        -[CUINamedVectorGlyph drawPaletteLayerAtIndex:inContext:withColorResolver:](self, "drawPaletteLayerAtIndex:inContext:withColorResolver:", i, a3, v18);
      }
    }
  }
  else
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUINamedVectorGlyph.m"), 2085, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("colors"));
  }
}

_QWORD *__55__CUINamedVectorGlyph_drawInContext_withPaletteColors___block_invoke(uint64_t a1)
{
  return -[CUINamedVectorGlyph _drawInContext:scaleFactor:targetSize:primaryColor:tertiaryColor:](*(_QWORD **)(a1 + 32), *(_QWORD *)(a1 + 48), (uint64_t)objc_msgSend(*(id *)(a1 + 40), "firstObject"), 0, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

id __55__CUINamedVectorGlyph_drawInContext_withPaletteColors___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v3;
  uint64_t v4;

  v4 = a1 + 32;
  v3 = *(void **)(a1 + 32);
  if (*(_QWORD *)(v4 + 8) <= a3)
    return objc_msgSend(v3, "lastObject");
  else
    return objc_msgSend(v3, "objectAtIndex:");
}

- (id)graphicVariantWithOptions:(id)a3
{
  if ((objc_msgSend(a3, "_areValid") & 1) == 0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUINamedVectorGlyph.m"), 2118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[options _areValid]"));
  return -[_CUIGraphicVariantVectorGlyph _initWithBaseGlyph:options:]([_CUIGraphicVariantVectorGlyph alloc], "_initWithBaseGlyph:options:", self, a3);
}

- (uint64_t)_prepareShapeNode:(uint64_t)a3 atNodeIndex:(void *)a4 forRenderingStyle:(uint64_t)a5 withColorResolver:
{
  uint64_t v9;
  uint64_t AttributeMap;
  const void *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  __CFString *v15;
  id v16;
  uint64_t SRGBWhite;
  CGColor *v18;

  if (result)
  {
    v9 = result;
    result = CGSVGNodeGetType(a2);
    if ((_DWORD)result == 2)
    {
      AttributeMap = CGSVGNodeGetAttributeMap(a2);
      v11 = -[CUINamedVectorGlyph _fillColorOfStyle:](v9, AttributeMap);
      v12 = (char *)objc_msgSend(a4, "rangeOfString:", CFSTR(":"));
      if (v13 == 1 && (v14 = v12 + 1, v12 + 1 < (char *)objc_msgSend(a4, "length") - 1))
        v15 = (__CFString *)objc_msgSend(a4, "substringFromIndex:", v14);
      else
        v15 = &stru_1E41B97C0;
      v16 = objc_msgSend(objc_msgSend((id)objc_opt_class(v9, v13), "_layerHierarchyStyleNames"), "indexOfObject:", v15);
      if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("white")))
      {
        SRGBWhite = _CUIColorGetSRGBWhite();
      }
      else
      {
        if (!-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("black")))
        {
LABEL_13:
          v18 = (CGColor *)(*(uint64_t (**)(uint64_t, __CFString *, const void *, uint64_t, id, uint64_t, _QWORD))(a5 + 16))(a5, v15, v11, a3, v16, -1, 0);
          return -[CUINamedVectorGlyph _setFillColor:ofStyle:](v9, v18, AttributeMap);
        }
        SRGBWhite = _CUIColorGetSRGBBlack();
      }
      v11 = (const void *)SRGBWhite;
      goto LABEL_13;
    }
  }
  return result;
}

- (const)_fillColorOfStyle:(uint64_t)a1
{
  const void *v2;
  uint64_t Attribute;
  const void *CGColor;
  _OWORD v6[2];
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v2 = 0;
  if (a1 && a2)
  {
    Attribute = CGSVGAttributeMapGetAttribute(a2, 18);
    if (Attribute)
    {
      v11 = 0;
      v2 = 0;
      if (CGSVGAttributeGetPaint(Attribute, &v11))
      {
        v10 = 0;
        v8 = 0u;
        v9 = 0u;
        CGSVGPaintGetColor(&v8, v11);
        v6[0] = v8;
        v6[1] = v9;
        v7 = v10;
        CGColor = (const void *)CGSVGColorCreateCGColor(v6);
        v2 = CGColor;
        if (CGColor)
          CFAutorelease(CGColor);
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

- (uint64_t)_setFillColor:(uint64_t)a3 ofStyle:
{
  CGColorSpace *SRGB;
  uint64_t DisplayP3;
  uint64_t ExtendedRangeSRGB;
  CGColorSpaceRef ColorSpace;
  CGColorSpaceRef v9;
  CGColor *CopyByMatchingToColorSpace;
  CGColor *v11;
  const CGFloat *Components;
  uint64_t v13;
  _OWORD v14[2];
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  if (result && a3)
  {
    if (a2)
    {
      SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
      DisplayP3 = _CUIColorSpaceGetDisplayP3();
      ExtendedRangeSRGB = _CUIColorSpaceGetExtendedRangeSRGB();
      ColorSpace = CGColorGetColorSpace(a2);
      v9 = ColorSpace;
      if (ColorSpace == SRGB
        || ColorSpace == (CGColorSpaceRef)ExtendedRangeSRGB
        || ColorSpace == (CGColorSpaceRef)DisplayP3)
      {
        CopyByMatchingToColorSpace = CGColorRetain(a2);
      }
      else
      {
        CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(SRGB, kCGRenderingIntentDefault, a2, 0);
      }
      v11 = CopyByMatchingToColorSpace;
      Components = CGColorGetComponents(CopyByMatchingToColorSpace);
      v18 = 0;
      v16 = 0u;
      v17 = 0u;
      CGSVGColorCreateRGBA(&v16, *Components, Components[1], Components[2], Components[3]);
      LODWORD(v18) = v9 == (CGColorSpaceRef)DisplayP3;
      CGColorRelease(v11);
      v14[0] = v16;
      v14[1] = v17;
      v15 = v18;
      v13 = CGSVGAttributeCreateWithColor(18, v14);
      CGSVGAttributeMapSetAttribute(a3, v13);
      return CGSVGAttributeRelease(v13);
    }
    else
    {
      return CGSVGAttributeMapRemoveAttribute(a3, 18);
    }
  }
  return result;
}

- (void)_legacy_drawMonochromeLayerNamed:(id)a3 inContext:(CGContext *)a4 scaleFactor:(double)a5 targetSize:(CGSize)a6 onFillColor:(CGColor *)a7 offFillColor:(CGColor *)a8
{
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v10 = a6.width * a5;
  v11 = a6.height * a5;
  -[CUINamedVectorGlyph referenceCanvasSize](self, "referenceCanvasSize", a3, a4, a7, a8);
  v13 = v12;
  v15 = v14;
  CGContextSaveGState(a4);
  CGContextScaleCTM(a4, v10 / v13, v11 / v15);
  CGContextDrawSVGDocument(a4, objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "svgDocument"));
  CGContextRestoreGState(a4);
}

- (void)_legacy_drawMulticolorLayerNamed:(id)a3 inContext:(CGContext *)a4 scaleFactor:(double)a5 targetSize:(CGSize)a6 colorResolver:(id)a7
{
  double height;
  double width;
  id v14;
  uint64_t RootNode;
  uint64_t ChildAtIndex;
  uint64_t ChildCount;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t i;
  uint64_t v23;
  uint64_t Attribute;
  void *v25;

  height = a6.height;
  width = a6.width;
  v14 = objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "svgDocument");
  if (v14)
  {
    RootNode = CGSVGDocumentGetRootNode(v14);
    ChildAtIndex = CGSVGNodeGetChildAtIndex(RootNode, 0);
    ChildCount = CGSVGNodeGetChildCount();
    -[CUINamedVectorGlyph referenceCanvasSize](self, "referenceCanvasSize");
    v19 = v18;
    v21 = v20;
    CGContextSaveGState(a4);
    CGContextScaleCTM(a4, width * a5 / v19, height * a5 / v21);
    if (ChildCount)
    {
      for (i = 0; i != ChildCount; ++i)
      {
        v23 = CGSVGNodeGetChildAtIndex(ChildAtIndex, i);
        if (CGSVGNodeGetType(v23) == 2)
        {
          Attribute = CGSVGNodeFindAttribute(v23, 4);
          if (Attribute)
          {
            v25 = (void *)CGSVGAttributeCopyString(Attribute);
            if (objc_msgSend(v25, "containsString:", a3))
            {
              if (a7)
                -[CUINamedVectorGlyph _prepareShapeNode:atNodeIndex:forRenderingStyle:withColorResolver:]((uint64_t)self, v23, i, a3, (uint64_t)a7);
              CGContextDrawSVGNode(a4, v23);
            }

          }
        }
      }
    }
    CGContextRestoreGState(a4);
  }
}

- (void)_legacy_drawHierarchicalLayerNamed:(id)a3 inContext:(CGContext *)a4 scaleFactor:(double)a5 targetSize:(CGSize)a6 colorResolver:(id)a7
{
  double height;
  double width;
  id v14;
  uint64_t RootNode;
  uint64_t ChildAtIndex;
  uint64_t ChildCount;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t i;
  uint64_t v23;
  uint64_t Attribute;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  _QWORD v30[6];
  _QWORD v31[6];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  uint64_t v37;

  height = a6.height;
  width = a6.width;
  if ((*((_BYTE *)self + 104) & 4) != 0)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x3052000000;
    v35 = __Block_byref_object_copy_;
    v36 = __Block_byref_object_dispose_;
    v37 = 0;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = __105__CUINamedVectorGlyph__legacy_drawHierarchicalLayerNamed_inContext_scaleFactor_targetSize_colorResolver___block_invoke;
    v31[3] = &unk_1E41AABD8;
    v31[4] = a3;
    v31[5] = &v32;
    objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup](self), "sublayers"), "enumerateObjectsUsingBlock:", v31);
    v26 = (void *)v33[5];
    if (v26)
    {
      -[CUINamedVectorGlyph variableMinValue](self, "variableMinValue");
      v28 = v27;
      -[CUINamedVectorGlyph variableMaxValue](self, "variableMaxValue");
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = __105__CUINamedVectorGlyph__legacy_drawHierarchicalLayerNamed_inContext_scaleFactor_targetSize_colorResolver___block_invoke_2;
      v30[3] = &unk_1E41AAC00;
      v30[4] = a7;
      v30[5] = &v32;
      objc_msgSend(v26, "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:hierarchicalColorResolver:", a4, v30, a5, width, height, v28, v29);
    }
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    v14 = objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "svgDocument");
    if (v14)
    {
      RootNode = CGSVGDocumentGetRootNode(v14);
      ChildAtIndex = CGSVGNodeGetChildAtIndex(RootNode, 0);
      ChildCount = CGSVGNodeGetChildCount();
      -[CUINamedVectorGlyph referenceCanvasSize](self, "referenceCanvasSize");
      v19 = v18;
      v21 = v20;
      CGContextSaveGState(a4);
      CGContextScaleCTM(a4, width * a5 / v19, height * a5 / v21);
      if (ChildCount)
      {
        for (i = 0; i != ChildCount; ++i)
        {
          v23 = CGSVGNodeGetChildAtIndex(ChildAtIndex, i);
          if (CGSVGNodeGetType(v23) == 2)
          {
            Attribute = CGSVGNodeFindAttribute(v23, 4);
            if (Attribute)
            {
              v25 = (void *)CGSVGAttributeCopyString(Attribute);
              if (objc_msgSend(v25, "containsString:", a3))
              {
                if (a7)
                  -[CUINamedVectorGlyph _prepareShapeNode:atNodeIndex:forRenderingStyle:withColorResolver:]((uint64_t)self, v23, i, a3, (uint64_t)a7);
                CGContextDrawSVGNode(a4, v23);
              }

            }
          }
        }
      }
      CGContextRestoreGState(a4);
    }
  }
}

id __105__CUINamedVectorGlyph__legacy_drawHierarchicalLayerNamed_inContext_scaleFactor_targetSize_colorResolver___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id result;

  result = objc_msgSend(objc_msgSend(a2, "name"), "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

uint64_t __105__CUINamedVectorGlyph__legacy_drawHierarchicalLayerNamed_inContext_scaleFactor_targetSize_colorResolver___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t SRGBBlack;

  v6 = *(_QWORD *)(a1 + 32);
  SRGBBlack = _CUIColorGetSRGBBlack();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, 0, SRGBBlack, a2, a3, -1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (CGSVGNode)_getOutlineNodeForDocument:(CGSVGDocument *)a3
{
  CGSVGNode *RootNode;
  float v5;
  CGSVGNode *result;

  RootNode = (CGSVGNode *)CGSVGDocumentGetRootNode(a3);
  -[CUINamedVectorGlyph templateVersion](self, "templateVersion");
  result = RootNode;
  if (v5 >= 5.0)
    return (CGSVGNode *)CGSVGNodeFindChildWithStringIdentifier(RootNode, CFSTR("s"));
  return result;
}

- (id)_createShapeGroupSubpaths
{
  float v3;
  id v4;
  CGSVGNode *v5;
  CGSVGNode *v6;
  unsigned __int16 *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  unint64_t v12;
  double v13;
  id v14;
  id v15;
  CGSVGNode *v16;
  CGSVGNode *v17;
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;
  double v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  -[CUINamedVectorGlyph templateVersion](self, "templateVersion");
  if (v3 < 5.0)
    return 0;
  v5 = -[CUINamedVectorGlyph _getOutlineNodeForDocument:](self, "_getOutlineNodeForDocument:", objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "svgDocument"));
  v6 = v5;
  if (self->_ultralightInterpolationSource && self->_blackInterpolationSource)
  {
    v7 = (unsigned __int16 *)objc_msgSend(objc_msgSend(objc_loadWeak((id *)&self->_catalog), "_themeStore"), "renditionKeyForName:", -[CUINamedLookup name](self, "name"));
    v8 = CUIRenditionKeyValueForAttribute(v7, 17);
    -[CUINamedVectorGlyph pointSize](self, "pointSize");
    v10 = (int)v9;
    -[CUINamedVectorGlyph glyphContinuousSize](self, "glyphContinuousSize");
    v12 = (unint64_t)v11;
    -[CUINamedVectorGlyph glyphContinuousWeight](self, "glyphContinuousWeight");
    kdebug_trace(726663193, v8, v10, v12, (unint64_t)v13);
    v14 = objc_msgSend(-[CUINamedVectorGlyph _ultralightRendition](self, "_ultralightRendition"), "svgDocument");
    v15 = objc_msgSend(-[CUINamedVectorGlyph _blackRendition](self, "_blackRendition"), "svgDocument");
    v16 = -[CUINamedVectorGlyph _getOutlineNodeForDocument:](self, "_getOutlineNodeForDocument:", v14);
    v17 = -[CUINamedVectorGlyph _getOutlineNodeForDocument:](self, "_getOutlineNodeForDocument:", v15);
    v28 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v29 = *(_OWORD *)&CGAffineTransformIdentity.a;
    v27 = v29;
    v30 = v28;
    v31 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v26 = v31;
    v18 = CUICreatePathFromSVGNode(v16, &v29);
    v29 = v27;
    v30 = v28;
    v31 = v26;
    v19 = CUICreatePathFromSVGNode(v6, &v29);
    v29 = v27;
    v30 = v28;
    v31 = v26;
    v20 = CUICreatePathFromSVGNode(v17, &v29);
    -[CUINamedVectorGlyph glyphContinuousWeight](self, "glyphContinuousWeight");
    v22 = v21;
    -[CUINamedVectorGlyph glyphContinuousSize](self, "glyphContinuousSize");
    v24 = -[CUINamedVectorGlyph _interpolatedPathWithWeight:glyphSize:fromUltralightSmall:regularSmall:blackSmall:](self, "_interpolatedPathWithWeight:glyphSize:fromUltralightSmall:regularSmall:blackSmall:", v18, v19, v20, v22, v23);

    v4 = objc_msgSend(v24, "createSubpaths");
    kdebug_trace(726663194, 1, 0, 0, 0);
    return v4;
  }
  return CUICreateSubpathsFromSVGNode(v5);
}

id __39__CUINamedVectorGlyph_monochromeLayers__block_invoke(uint64_t a1)
{
  id result;

  result = objc_msgSend(-[CUINamedVectorGlyph monochromeLayerGroup](*(_QWORD **)(a1 + 32)), "sublayers");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __39__CUINamedVectorGlyph_multicolorLayers__block_invoke(uint64_t a1)
{
  id result;

  result = objc_msgSend(-[CUINamedVectorGlyph multicolorLayerGroup](*(_QWORD **)(a1 + 32)), "sublayers");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __41__CUINamedVectorGlyph_hierarchicalLayers__block_invoke(uint64_t a1)
{
  id result;

  result = objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup](*(_QWORD **)(a1 + 32)), "sublayers");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (unsigned)_wiggleStyleAtom
{
  if (_wiggleStyleAtom_onceToken != -1)
    dispatch_once(&_wiggleStyleAtom_onceToken, &__block_literal_global_110);
  return _wiggleStyleAtom_wiggleStyleAtom;
}

uint64_t __39__CUINamedVectorGlyph__wiggleStyleAtom__block_invoke()
{
  uint64_t result;

  result = CGSVGAtomFromString(CFSTR("-sfsymbols-wiggle-style"));
  _wiggleStyleAtom_wiggleStyleAtom = result;
  return result;
}

+ (unsigned)_wiggleAngleAtom
{
  if (_wiggleAngleAtom_onceToken != -1)
    dispatch_once(&_wiggleAngleAtom_onceToken, &__block_literal_global_111);
  return _wiggleAngleAtom_wiggleAngleAtom;
}

uint64_t __39__CUINamedVectorGlyph__wiggleAngleAtom__block_invoke()
{
  uint64_t result;

  result = CGSVGAtomFromString(CFSTR("-sfsymbols-wiggle-angle"));
  _wiggleAngleAtom_wiggleAngleAtom = result;
  return result;
}

+ (unsigned)_rotatesClockwiseAtom
{
  if (_rotatesClockwiseAtom_onceToken != -1)
    dispatch_once(&_rotatesClockwiseAtom_onceToken, &__block_literal_global_112);
  return _rotatesClockwiseAtom_rotateDirectionAtom;
}

uint64_t __44__CUINamedVectorGlyph__rotatesClockwiseAtom__block_invoke()
{
  uint64_t result;

  result = CGSVGAtomFromString(CFSTR("-sfsymbols-rotates-clockwise"));
  _rotatesClockwiseAtom_rotateDirectionAtom = result;
  return result;
}

+ (unsigned)_variableColorContinuousAtom
{
  if (_variableColorContinuousAtom_onceToken != -1)
    dispatch_once(&_variableColorContinuousAtom_onceToken, &__block_literal_global_113);
  return _variableColorContinuousAtom_variableColorLoopStyleAtom;
}

uint64_t __51__CUINamedVectorGlyph__variableColorContinuousAtom__block_invoke()
{
  uint64_t result;

  result = CGSVGAtomFromString(CFSTR("-sfsymbols-vc-continuous"));
  _variableColorContinuousAtom_variableColorLoopStyleAtom = result;
  return result;
}

+ (unsigned)_hasImageFillsAtom
{
  if (_hasImageFillsAtom_onceToken != -1)
    dispatch_once(&_hasImageFillsAtom_onceToken, &__block_literal_global_114);
  return _hasImageFillsAtom_hasImageFillsAtom;
}

uint64_t __41__CUINamedVectorGlyph__hasImageFillsAtom__block_invoke()
{
  uint64_t result;

  result = CGSVGAtomFromString(CFSTR("-sfsymbols-has-fill-images"));
  _hasImageFillsAtom_hasImageFillsAtom = result;
  return result;
}

+ (unsigned)_backgroundImageNamesAtom
{
  if (_backgroundImageNamesAtom_onceToken != -1)
    dispatch_once(&_backgroundImageNamesAtom_onceToken, &__block_literal_global_115);
  return _backgroundImageNamesAtom_backgroundImageNamesAtom;
}

uint64_t __48__CUINamedVectorGlyph__backgroundImageNamesAtom__block_invoke()
{
  uint64_t result;

  result = CGSVGAtomFromString(CFSTR("-sfsymbols-fill-image-names"));
  _backgroundImageNamesAtom_backgroundImageNamesAtom = result;
  return result;
}

+ (id)_colorStyleNames
{
  if (_colorStyleNames_onceToken != -1)
    dispatch_once(&_colorStyleNames_onceToken, &__block_literal_global_116);
  return (id)_colorStyleNames_colorStyleNames;
}

void *__39__CUINamedVectorGlyph__colorStyleNames__block_invoke()
{
  void *result;

  result = &unk_1E41DDC98;
  _colorStyleNames_colorStyleNames = (uint64_t)result;
  return result;
}

+ (id)_knockoutStyleNames
{
  return +[NSArray array](NSArray, "array");
}

- (double)strokeWidthForLayerNamed:(id)a3 inRendition:(id)a4
{
  CGSVGAttributeMap *v4;
  double v5;
  uint64_t Attribute;
  unsigned __int8 Float;
  double v9;

  v4 = -[CUINamedVectorGlyph attributesForLayerNamed:inRendition:](self, "attributesForLayerNamed:inRendition:", a3, a4);
  v5 = 0.0;
  if (v4)
  {
    Attribute = CGSVGAttributeMapGetAttribute(v4, 59);
    if (Attribute)
    {
      v9 = 0.0;
      Float = CGSVGAttributeGetFloat(Attribute, &v9);
      if ((Float & (v9 >= 1.0)) != 0)
        return v9;
      else
        return 0.0;
    }
  }
  return v5;
}

- (double)strokeWidthForLayerNamed:(id)a3
{
  float v5;
  double result;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  -[CUINamedVectorGlyph templateVersion](self, "templateVersion");
  if (v5 < 6.0)
    return 0.0;
  if ((*((_BYTE *)self + 104) & 4) != 0 && self->_ultralightInterpolationSource && self->_blackInterpolationSource)
  {
    -[CUINamedVectorGlyph strokeWidthForLayerNamed:inRendition:](self, "strokeWidthForLayerNamed:inRendition:", a3, -[CUINamedVectorGlyph _ultralightRendition](self, "_ultralightRendition"));
    v8 = v7;
    -[CUINamedVectorGlyph strokeWidthForLayerNamed:inRendition:](self, "strokeWidthForLayerNamed:inRendition:", a3, -[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"));
    v10 = v9;
    -[CUINamedVectorGlyph strokeWidthForLayerNamed:inRendition:](self, "strokeWidthForLayerNamed:inRendition:", a3, -[CUINamedVectorGlyph _blackRendition](self, "_blackRendition"));
    v12 = v11;
    -[CUINamedVectorGlyph glyphContinuousWeight](self, "glyphContinuousWeight");
    v14 = v13;
    -[CUINamedVectorGlyph glyphContinuousSize](self, "glyphContinuousSize");
    -[CUINamedVectorGlyph _interpolatedStrokeWidthWithWeight:glyphSize:fromUltralight:regular:black:](self, "_interpolatedStrokeWidthWithWeight:glyphSize:fromUltralight:regular:black:", v14, v15, v8, v10, v12);
  }
  else
  {
    -[CUINamedVectorGlyph strokeWidthForLayerNamed:inRendition:](self, "strokeWidthForLayerNamed:inRendition:", a3, -[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"));
  }
  return result;
}

- (CGSVGAttributeMap)attributesForLayerNamed:(id)a3 inRendition:(id)a4
{
  id v6;
  id v7;
  float v8;
  float v9;
  uint64_t RootNode;
  uint64_t v11;
  uint64_t ChildWithStringIdentifier;
  uint64_t v13;
  uint64_t ChildCount;
  uint64_t v15;
  uint64_t i;
  uint64_t ChildAtIndex;
  uint64_t Attribute;
  void *v19;
  CGSVGAttributeMap *AttributeMap;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;

  v6 = objc_msgSend(a4, "svgDocument");
  v7 = v6;
  if (a3)
  {
    -[CUINamedVectorGlyph templateVersion](self, "templateVersion");
    v9 = v8;
    RootNode = CGSVGDocumentGetRootNode(v7);
    v11 = RootNode;
    if (v9 >= 5.0
      && (ChildWithStringIdentifier = CGSVGNodeFindChildWithStringIdentifier(RootNode, CFSTR("LayerTree"))) != 0)
    {
      v13 = ChildWithStringIdentifier;
      ChildCount = CGSVGNodeGetChildCount();
      if (ChildCount)
      {
        v15 = ChildCount;
        for (i = 0; i != v15; ++i)
        {
          ChildAtIndex = CGSVGNodeGetChildAtIndex(v13, i);
          Attribute = CGSVGNodeFindAttribute(ChildAtIndex, 4);
          if (Attribute)
          {
            v19 = (void *)CGSVGAttributeCopyString(Attribute);
            if ((objc_msgSend(v19, "containsString:", a3) & 1) != 0)
            {
              AttributeMap = (CGSVGAttributeMap *)CGSVGNodeGetAttributeMap(ChildAtIndex);

              if (AttributeMap)
                return AttributeMap;
            }
            else
            {

            }
          }
        }
      }
    }
    else
    {
      v21 = CGSVGNodeGetChildAtIndex(v11, 0);
      v22 = CGSVGNodeGetChildCount();
      if (v22)
      {
        v23 = v22;
        for (j = 0; j != v23; ++j)
        {
          v25 = CGSVGNodeGetChildAtIndex(v21, j);
          v26 = CGSVGNodeFindAttribute(v25, 4);
          if (v26)
          {
            v27 = (void *)CGSVGAttributeCopyString(v26);
            if ((objc_msgSend(v27, "containsString:", a3) & 1) != 0)
            {
              AttributeMap = (CGSVGAttributeMap *)CGSVGNodeGetAttributeMap(v25);

              if (AttributeMap)
                return AttributeMap;
            }
            else
            {

            }
          }
        }
      }
    }
    return 0;
  }
  else
  {
    v29 = CGSVGDocumentGetRootNode(v6);
    v30 = CGSVGNodeGetChildAtIndex(v29, 0);
    return (CGSVGAttributeMap *)CGSVGNodeGetAttributeMap(v30);
  }
}

- (CGSVGAttributeMap)attributesForLayerNamed:(id)a3
{
  return -[CUINamedVectorGlyph attributesForLayerNamed:inRendition:](self, "attributesForLayerNamed:inRendition:", a3, -[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"));
}

- (id)edgeDefinitionTextureWithBufferAllocator:(id)a3
{
  CUICurrentPlatform();
  -[CUINamedVectorGlyph image](self, "image");
  return (id)CUICreateSDFEdgeTextureFromImage();
}

- (id)gradientTextureWithBufferAllocator:(id)a3
{
  CUICurrentPlatform();
  -[CUINamedVectorGlyph image](self, "image");
  return (id)CUICreateSDFGradientTextureFromImage();
}

- (double)_interpolatedStrokeWidthWithWeight:(double)a3 glyphSize:(double)a4 fromUltralight:(double)a5 regular:(double)a6 black:(double)a7
{
  double v12;
  double v13;
  double v14;
  double v15;

  +[CUIVectorGlyphMutator transformForGlyphContinuousSize:](CUIVectorGlyphMutator, "transformForGlyphContinuousSize:", a4);
  v13 = v12;
  +[CUIVectorGlyphMutator scalarsForGlyphContinuousWeight:glyphContinuousSize:](CUIVectorGlyphMutator, "scalarsForGlyphContinuousWeight:glyphContinuousSize:", a3, a4);
  return v13 * (a6 + (a5 - a6) * v14 + (a7 - a6) * v15);
}

- (CGPoint)_interpolatedAnchorWithWeight:(double)a3 glyphSize:(double)a4 fromUltralight:(CGPoint)a5 regular:(CGPoint)a6 black:(CGPoint)a7
{
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double y;
  CGPoint result;

  y = a7.y;
  x = a7.x;
  v8 = a6.y;
  v9 = a6.x;
  v10 = a5.y;
  v11 = a5.x;
  +[CUIVectorGlyphMutator transformForGlyphContinuousSize:](CUIVectorGlyphMutator, "transformForGlyphContinuousSize:", a4);
  v15 = v14;
  +[CUIVectorGlyphMutator scalarsForGlyphContinuousWeight:glyphContinuousSize:](CUIVectorGlyphMutator, "scalarsForGlyphContinuousWeight:glyphContinuousSize:", a3, a4);
  v18 = v9 + (x - v9) * v16 + (v11 - v9) * v17;
  v19 = v8 + (y - v8) * v16 + (v10 - v8) * v17;
  v20 = v15 * v18;
  v21 = v15 * v19;
  result.y = v21;
  result.x = v20;
  return result;
}

@end
