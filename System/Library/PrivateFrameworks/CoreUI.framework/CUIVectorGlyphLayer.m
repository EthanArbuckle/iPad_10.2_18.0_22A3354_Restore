@implementation CUIVectorGlyphLayer

- (double)valueThreshold
{
  return self->_valueThreshold;
}

- (unint64_t)index
{
  return self->_index;
}

- (CUIVectorGlyhLayerDelegate)delegate
{
  return (CUIVectorGlyhLayerDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (unint64_t)motionGroup
{
  return self->_motionGroup;
}

- (BOOL)alwaysPulses
{
  return self->_alwaysPulses;
}

- (NSArray)sublayers
{
  return self->_sublayers;
}

- (void)drawInContext:(CGContext *)a3 scaleFactor:(double)a4 targetSize:(CGSize)a5 variableMinValue:(double)a6 variableMaxValue:(double)a7 onFillColor:(CGColor *)a8 offFillColor:(CGColor *)a9
{
  double height;
  double width;
  CUIVectorGlyhLayerDelegate **p_delegate;
  double v19;
  double v20;
  double v21;
  double v22;
  unsigned int v23;
  double v24;
  double v25;
  CGBlendMode v26;
  CGColor *SRGBClear;
  CGFloat Alpha;
  CGColorRef CopyWithAlpha;
  double v30;
  double v31;
  double v32;
  double v33;
  char v34;
  CGPath *v35;
  const CGPath *v36;
  double v37;
  CGFloat v38;
  double v39;

  height = a5.height;
  width = a5.width;
  p_delegate = &self->_delegate;
  objc_msgSend(objc_loadWeak((id *)&self->_delegate), "referenceCanvasSize");
  v20 = v19;
  v22 = v21;
  CGContextSaveGState(a3);
  v23 = -[CUIVectorGlyphLayer isEraserLayer](self, "isEraserLayer");
  -[CUIVectorGlyphLayer opacity](self, "opacity");
  v25 = v24;
  if (v23)
    v26 = kCGBlendModeCopy;
  else
    v26 = kCGBlendModeNormal;
  SRGBClear = a8;
  if (v24 < 1.0)
  {
    Alpha = CGColorGetAlpha(a8);
    CopyWithAlpha = CGColorCreateCopyWithAlpha(a8, v25 * Alpha);
    SRGBClear = (CGColor *)CFAutorelease(CopyWithAlpha);
  }
  if (a6 != INFINITY || a7 != INFINITY)
  {
    v39 = width;
    v30 = height;
    v31 = v20;
    -[CUIVectorGlyphLayer valueThreshold](self, "valueThreshold");
    v33 = v32;
    if (v32 != INFINITY)
    {
      if (!a9)
      {
        v34 = v23 ^ 1;
        if (v25 >= 2.22044605e-16)
          v34 = 1;
        if ((v34 & 1) != 0)
        {
          a9 = 0;
        }
        else
        {
          SRGBClear = (CGColor *)_CUIColorGetSRGBClear();
          a9 = CGColorCreateCopyWithAlpha(SRGBClear, 0.7);
          CFAutorelease(a9);
          v26 = kCGBlendModeDestinationIn;
        }
      }
      SRGBClear = -[CUIVectorGlyphLayer _colorForVariableThreshold:variableMinValue:variableMaxValue:onFillColor:offFillColor:](self, "_colorForVariableThreshold:variableMinValue:variableMaxValue:onFillColor:offFillColor:", SRGBClear, a9, v33, a6, a7);
    }
    v20 = v31;
    height = v30;
    width = v39;
  }
  v35 = -[CUIVectorGlyphLayer copyClipShape](self, "copyClipShape");
  if (v35)
  {
    v36 = v35;
    CGContextScaleCTM(a3, width * a4 / v20, height * a4 / v22);
    CGContextScaleCTM(a3, 1.0, -1.0);
    CGContextTranslateCTM(a3, 0.0, -v22);
    CGContextSetFillColorWithColor(a3, SRGBClear);
    CGContextSetStrokeColorWithColor(a3, SRGBClear);
    CGContextSetBlendMode(a3, v26);
    CGContextAddPath(a3, v36);
    -[CUIVectorGlyphLayer strokeWidth](self, "strokeWidth");
    if (v37 <= 0.0)
    {
      CGContextFillPath(a3);
    }
    else
    {
      v38 = v37;
      CGContextSetLineCap(a3, (CGLineCap)-[CUIVectorGlyphLayer lineCap](self, "lineCap"));
      CGContextSetLineJoin(a3, (CGLineJoin)-[CUIVectorGlyphLayer lineJoin](self, "lineJoin"));
      CGContextSetLineWidth(a3, v38);
      CGContextStrokePath(a3);
    }
    CGPathRelease(v36);
  }
  else
  {
    objc_msgSend(objc_loadWeak((id *)p_delegate), "_legacy_drawMonochromeLayerNamed:inContext:scaleFactor:targetSize:onFillColor:offFillColor:", -[CUIVectorGlyphLayer name](self, "name"), a3, a8, a9, a4, width, height);
  }
  CGContextRestoreGState(a3);
}

- (double)opacity
{
  return self->_opacity;
}

- (BOOL)isEraserLayer
{
  return self->_isEraserLayer;
}

- (CGPath)copyClipShape
{
  const CGPath *v3;
  const CGPath *v4;
  double v5;
  CGFloat v6;
  CGPath *clipPathFromSublayers;
  NSArray *sublayers;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  double v15;
  const CGPath *v16;
  const CGPath *v17;
  CGPathRef CopyByUnioningPath;
  const CGPath *v19;
  CGPath *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = -[CUIVectorGlyphLayer referenceShape](self, "referenceShape");
  if (v3)
  {
    v4 = v3;
    -[CUIVectorGlyphLayer strokeWidth](self, "strokeWidth");
    if (v5 <= 0.0 || !-[CUIVectorGlyphLayer isEraserLayer](self, "isEraserLayer"))
      return CGPathRetain(v4);
    -[CUIVectorGlyphLayer strokeWidth](self, "strokeWidth");
    return CGPathCreateCopyByStrokingPath(v4, 0, v6, (CGLineCap)-[CUIVectorGlyphLayer lineCap](self, "lineCap"), (CGLineJoin)-[CUIVectorGlyphLayer lineJoin](self, "lineJoin"), 0.0);
  }
  clipPathFromSublayers = self->_clipPathFromSublayers;
  if (clipPathFromSublayers)
    goto LABEL_29;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  sublayers = self->_sublayers;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](sublayers, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v10)
  {
    clipPathFromSublayers = 0;
    goto LABEL_28;
  }
  v11 = v10;
  clipPathFromSublayers = 0;
  v12 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(_QWORD *)v22 != v12)
        objc_enumerationMutation(sublayers);
      v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
      if (!objc_msgSend(v14, "isEraserLayer") || (objc_msgSend(v14, "opacity"), v15 >= 2.22044605e-16))
      {
        v19 = (const CGPath *)objc_msgSend(v14, "copyClipShape");
        if (!v19)
          continue;
        v17 = v19;
        if (clipPathFromSublayers)
        {
          CopyByUnioningPath = CGPathCreateCopyByUnioningPath(clipPathFromSublayers, v19, 0);
          goto LABEL_21;
        }
        clipPathFromSublayers = (CGPath *)MEMORY[0x1A1AEE508](v19);
LABEL_23:
        CGPathRelease(v17);
        continue;
      }
      if (clipPathFromSublayers)
      {
        v16 = (const CGPath *)objc_msgSend(v14, "copyClipShape");
        if (v16)
        {
          v17 = v16;
          CopyByUnioningPath = CGPathCreateCopyBySubtractingPath(clipPathFromSublayers, v16, 0);
          if (!CopyByUnioningPath)
            goto LABEL_23;
LABEL_21:
          v20 = CopyByUnioningPath;
          CGPathRelease(clipPathFromSublayers);
          clipPathFromSublayers = v20;
          goto LABEL_23;
        }
      }
    }
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](sublayers, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v11);
LABEL_28:
  self->_clipPathFromSublayers = clipPathFromSublayers;
LABEL_29:
  CGPathRetain(clipPathFromSublayers);
  return clipPathFromSublayers;
}

- (id)referenceShape
{
  return -[CUIVectorGlyphPath path](self->_referencePath, "path");
}

+ (id)createLayerGroupWithLayerNames:(id)a3 delegate:(id)a4
{
  id v7;
  char *v8;
  char *v9;
  char *i;
  id v11;
  id v12;
  id v13;
  id v14;
  double v15;
  id v16;
  id v17;

  if (!a3)
    return 0;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(a3, "count"));
  v8 = (char *)objc_msgSend(a3, "count");
  if (v8)
  {
    v9 = v8;
    for (i = 0; i != v9; ++i)
    {
      v11 = objc_msgSend(a3, "objectAtIndex:", i);
      v12 = objc_msgSend(a4, "styleForLayerName:", v11);
      v13 = objc_msgSend(a4, "attributesForLayerNamed:", v11);
      v14 = objc_msgSend(a4, "pathForLayerNamed:", v11);
      objc_msgSend(a4, "strokeWidthForLayerNamed:", v11);
      v16 = objc_msgSend(objc_alloc((Class)a1), "_initWithName:index:shape:strokeWidth:attributes:style:delegate:", v11, i, v14, v13, v12, a4, v15);
      objc_msgSend(v7, "addObject:", v16);

    }
  }
  v17 = objc_msgSend(objc_alloc((Class)a1), "_initWithName:index:sublayers:attributes:style:delegate:", CFSTR("root"), 0, v7, 0, 0, a4);

  return v17;
}

- (BOOL)_anyLayerAlwaysPulses
{
  id v2;
  NSArray *sublayers;
  id v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (self->_alwaysPulses)
  {
LABEL_2:
    LOBYTE(v2) = 1;
    return (char)v2;
  }
  v2 = -[NSArray count](self->_sublayers, "count");
  if (v2)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    sublayers = self->_sublayers;
    v2 = -[NSArray countByEnumeratingWithState:objects:count:](sublayers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v2)
    {
      v5 = v2;
      v6 = *(_QWORD *)v10;
LABEL_7:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(sublayers);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "_anyLayerAlwaysPulses") & 1) != 0)
          goto LABEL_2;
        if (v5 == (id)++v7)
        {
          v5 = -[NSArray countByEnumeratingWithState:objects:count:](sublayers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
          LOBYTE(v2) = 0;
          if (v5)
            goto LABEL_7;
          return (char)v2;
        }
      }
    }
  }
  return (char)v2;
}

- (void)_setAllLayersAlwaysPulse:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *sublayers;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (self->_opacity != 0.0)
  {
    v3 = a3;
    self->_alwaysPulses = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    sublayers = self->_sublayers;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](sublayers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(sublayers);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "_setAllLayersAlwaysPulse:", v3);
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](sublayers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
  }
}

- (NSString)name
{
  return self->_name;
}

+ (id)_colorNameForRenderingStyle:(id)a3
{
  char *v4;
  uint64_t v5;
  char *v6;

  v4 = (char *)objc_msgSend(a3, "rangeOfString:", CFSTR(":"));
  if (v5 == 1 && (v6 = v4 + 1, v4 + 1 < (char *)objc_msgSend(a3, "length") - 1))
    return objc_msgSend(a3, "substringFromIndex:", v6);
  else
    return &stru_1E41B97C0;
}

+ (id)_layerHierarchyStyleNames
{
  if (_layerHierarchyStyleNames_onceToken_0 != -1)
    dispatch_once(&_layerHierarchyStyleNames_onceToken_0, &__block_literal_global_73);
  return (id)_layerHierarchyStyleNames_layerHierarchyStyleNames_0;
}

- (void)dealloc
{
  CUIVectorGlyphPath *referencePath;
  CGPath *clipPathFromSublayers;
  objc_super v5;

  referencePath = self->_referencePath;
  if (referencePath)
  {

    self->_referencePath = 0;
  }

  clipPathFromSublayers = self->_clipPathFromSublayers;
  if (clipPathFromSublayers)
  {
    CGPathRelease(clipPathFromSublayers);
    self->_clipPathFromSublayers = 0;
  }
  objc_storeWeak((id *)&self->_delegate, 0);
  v5.receiver = self;
  v5.super_class = (Class)CUIVectorGlyphLayer;
  -[CUIVectorGlyphLayer dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void *__48__CUIVectorGlyphLayer__layerHierarchyStyleNames__block_invoke()
{
  void *result;

  result = &unk_1E41DDDE8;
  _layerHierarchyStyleNames_layerHierarchyStyleNames_0 = (uint64_t)result;
  return result;
}

+ (CGColor)_fillColorFromStyle:(CGSVGAttributeMap *)a3
{
  uint64_t Attribute;
  CGColor *v4;
  CGColor *CGColor;
  _OWORD v7[2];
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  if (!a3)
    return 0;
  Attribute = CGSVGAttributeMapGetAttribute(a3, 18);
  if (!Attribute)
    return 0;
  v12 = 0;
  v4 = 0;
  if (CGSVGAttributeGetPaint(Attribute, &v12))
  {
    v11 = 0;
    v9 = 0u;
    v10 = 0u;
    CGSVGPaintGetColor(&v9, v12);
    v7[0] = v9;
    v7[1] = v10;
    v8 = v11;
    CGColor = (CGColor *)CGSVGColorCreateCGColor(v7);
    v4 = CGColor;
    if (CGColor)
      CFAutorelease(CGColor);
  }
  return v4;
}

+ (double)_strokeWidthForNode:(CGSVGNode *)a3
{
  double v3;
  uint64_t AttributeMap;
  uint64_t Attribute;
  unsigned __int8 Float;
  double v8;

  v3 = 0.0;
  if (a3)
  {
    AttributeMap = CGSVGNodeGetAttributeMap(a3);
    if (AttributeMap)
    {
      Attribute = CGSVGAttributeMapGetAttribute(AttributeMap, 59);
      if (Attribute)
      {
        v8 = 0.0;
        Float = CGSVGAttributeGetFloat(Attribute, &v8);
        if ((Float & (v8 != 0.0)) != 0)
          return v8;
        else
          return 0.0;
      }
    }
  }
  return v3;
}

+ (unsigned)_clearBehindAtom
{
  if (_clearBehindAtom_onceToken != -1)
    dispatch_once(&_clearBehindAtom_onceToken, &__block_literal_global_17);
  return _clearBehindAtom_clearBehindAtom;
}

uint64_t __39__CUIVectorGlyphLayer__clearBehindAtom__block_invoke()
{
  uint64_t result;

  result = CGSVGAtomFromString(CFSTR("-sfsymbols-clear-behind"));
  _clearBehindAtom_clearBehindAtom = result;
  return result;
}

+ (unsigned)_variableThresholdAtom
{
  if (_variableThresholdAtom_onceToken != -1)
    dispatch_once(&_variableThresholdAtom_onceToken, &__block_literal_global_2_0);
  return _variableThresholdAtom_variableThresholdAtom;
}

uint64_t __45__CUIVectorGlyphLayer__variableThresholdAtom__block_invoke()
{
  uint64_t result;

  result = CGSVGAtomFromString(CFSTR("-sfsymbols-variable-threshold"));
  _variableThresholdAtom_variableThresholdAtom = result;
  return result;
}

+ (unsigned)_fillActionAtom
{
  if (_fillActionAtom_onceToken != -1)
    dispatch_once(&_fillActionAtom_onceToken, &__block_literal_global_5);
  return _fillActionAtom_fillActionAtom;
}

uint64_t __38__CUIVectorGlyphLayer__fillActionAtom__block_invoke()
{
  uint64_t result;

  result = CGSVGAtomFromString(CFSTR("-sfsymbols-fill-action"));
  _fillActionAtom_fillActionAtom = result;
  return result;
}

+ (unsigned)_motionGroupAtom
{
  if (_motionGroupAtom_onceToken != -1)
    dispatch_once(&_motionGroupAtom_onceToken, &__block_literal_global_8_0);
  return _motionGroupAtom_motionGroupAtom;
}

uint64_t __39__CUIVectorGlyphLayer__motionGroupAtom__block_invoke()
{
  uint64_t result;

  result = CGSVGAtomFromString(CFSTR("-sfsymbols-motion-group"));
  _motionGroupAtom_motionGroupAtom = result;
  return result;
}

+ (unsigned)_alwaysPulsesAtom
{
  if (_alwaysPulsesAtom_onceToken != -1)
    dispatch_once(&_alwaysPulsesAtom_onceToken, &__block_literal_global_11);
  return _alwaysPulsesAtom_alwaysPulsesAtom;
}

uint64_t __40__CUIVectorGlyphLayer__alwaysPulsesAtom__block_invoke()
{
  uint64_t result;

  result = CGSVGAtomFromString(CFSTR("-sfsymbols-always-pulses"));
  _alwaysPulsesAtom_alwaysPulsesAtom = result;
  return result;
}

+ (unsigned)_alwaysRotatesAtom
{
  if (_alwaysRotatesAtom_onceToken != -1)
    dispatch_once(&_alwaysRotatesAtom_onceToken, &__block_literal_global_14_0);
  return _alwaysRotatesAtom_alwaysRotatesAtom;
}

uint64_t __41__CUIVectorGlyphLayer__alwaysRotatesAtom__block_invoke()
{
  uint64_t result;

  result = CGSVGAtomFromString(CFSTR("-sfsymbols-always-rotates"));
  _alwaysRotatesAtom_alwaysRotatesAtom = result;
  return result;
}

+ (unsigned)_alwaysBreathesAtom
{
  if (_alwaysBreathesAtom_onceToken != -1)
    dispatch_once(&_alwaysBreathesAtom_onceToken, &__block_literal_global_17);
  return _alwaysBreathesAtom_alwaysBreathesAtom;
}

uint64_t __42__CUIVectorGlyphLayer__alwaysBreathesAtom__block_invoke()
{
  uint64_t result;

  result = CGSVGAtomFromString(CFSTR("-sfsymbols-always-breathes"));
  _alwaysBreathesAtom_alwaysBreathesAtom = result;
  return result;
}

+ (unsigned)_subpathIndicesAtom
{
  if (_subpathIndicesAtom_onceToken != -1)
    dispatch_once(&_subpathIndicesAtom_onceToken, &__block_literal_global_20);
  return _subpathIndicesAtom_sSubpathIndicesAtom;
}

uint64_t __42__CUIVectorGlyphLayer__subpathIndicesAtom__block_invoke()
{
  uint64_t result;

  result = CGSVGAtomFromString(CFSTR("-sfsymbols-indices"));
  _subpathIndicesAtom_sSubpathIndicesAtom = result;
  return result;
}

+ (unsigned)_layerTagsAtom
{
  if (_layerTagsAtom_onceToken != -1)
    dispatch_once(&_layerTagsAtom_onceToken, &__block_literal_global_23_0);
  return _layerTagsAtom_layerTagsAtom;
}

uint64_t __37__CUIVectorGlyphLayer__layerTagsAtom__block_invoke()
{
  uint64_t result;

  result = CGSVGAtomFromString(CFSTR("-sfsymbols-layer-tags"));
  _layerTagsAtom_layerTagsAtom = result;
  return result;
}

+ (BOOL)_classesContainRenderModeClass:(id)a3
{
  if ((objc_msgSend(a3, "containsString:", CFSTR("monochrome-")) & 1) != 0
    || (objc_msgSend(a3, "containsString:", CFSTR("monochrome-")) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "containsString:", CFSTR("hierarchical-"));
  }
}

+ (id)_suffixForNamedStyleWithPrefix:(id)a3 styles:(id)a4
{
  id v5;
  id result;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = objc_msgSend(a4, "componentsSeparatedByString:", CFSTR(" "));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        if ((objc_msgSend(v10, "hasPrefix:", a3) & 1) != 0)
        {
          v11 = objc_msgSend(v10, "rangeOfString:", a3);
          return objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", v11, v12, &stru_1E41B97C0);
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v7 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

+ (BOOL)_indexFromStyleSuffix:(id)a3 integer:(unint64_t *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  BOOL result;
  unint64_t v9;

  if (a3 && a4)
  {
    v5 = a3;
    v6 = objc_msgSend(a3, "rangeOfString:", CFSTR(":"));
    if (v6 == (id)0x7FFFFFFFFFFFFFFFLL || v7 == 1 && (v5 = objc_msgSend(v5, "substringToIndex:", v6)) != 0)
    {
      v9 = 0;
      if (-[NSScanner scanInteger:](+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v5), "scanInteger:", &v9))
      {
        if ((v9 & 0x8000000000000000) == 0)
        {
          *a4 = v9;
          return 1;
        }
      }
    }
    goto LABEL_10;
  }
  if (a4)
  {
LABEL_10:
    result = 0;
    *a4 = 0;
    return result;
  }
  return 0;
}

+ (id)_createPathFromStyle:(CGSVGAttributeMap *)a3 subpaths:(id)a4
{
  id result;
  void *v6;
  id v7;

  result = (id)CGSVGAttributeMapGetAttribute(a3, objc_msgSend(a1, "_subpathIndicesAtom"));
  if (result)
  {
    v6 = (void *)CGSVGAttributeCopyString(result);
    v7 = objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), &stru_1E41B97C0);

    return +[CUIVectorGlyphPath createFromSubpaths:indices:](CUIVectorGlyphPath, "createFromSubpaths:indices:", a4, objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(" ")));
  }
  return result;
}

+ (id)_createTreeWithLayerTreeNode:(CGSVGNode *)a3 modePrefix:(id)a4 layerName:(id)a5 index:(unint64_t)a6 subpaths:(id)a7 delegate:(id)a8
{
  uint64_t ChildCount;
  uint64_t v13;
  uint64_t ChildAtIndex;
  uint64_t Attribute;
  void *v16;
  unsigned __int8 v17;
  id v18;
  id v19;
  id v20;
  NSString *v21;
  id v22;
  id v23;
  NSString *v24;
  id v25;
  NSString *v26;
  id v27;
  id v31;
  uint64_t v33;

  if (!a3)
    return 0;
  ChildCount = CGSVGNodeGetChildCount(a3, a2);
  v31 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", ChildCount);
  if (ChildCount)
  {
    v13 = 0;
    while (1)
    {
      ChildAtIndex = CGSVGNodeGetChildAtIndex(a3, v13);
      Attribute = CGSVGNodeFindAttribute(ChildAtIndex, 4);
      if (!Attribute)
        break;
      v16 = (void *)CGSVGAttributeCopyString(Attribute);
      v17 = +[CUIVectorGlyphLayer _classesContainRenderModeClass:](CUIVectorGlyphLayer, "_classesContainRenderModeClass:", v16);
      v18 = v16;
      if ((v17 & 1) == 0)
        goto LABEL_10;
      v19 = objc_msgSend(a1, "_suffixForNamedStyleWithPrefix:styles:", a4, v16);
      if (v19)
      {
        v20 = v19;
        v33 = 0;
        if (objc_msgSend(a1, "_indexFromStyleSuffix:integer:", v19, &v33))
        {
          v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), a4, v20);
          v22 = objc_msgSend(a1, "_createLayerWithLayerTreeNode:layerName:index:subpaths:delegate:", ChildAtIndex, v21, v33, a7, a8);
          objc_msgSend(v31, "addObject:", v22);

        }
      }
LABEL_15:
      if (ChildCount == ++v13)
        goto LABEL_16;
    }
    v16 = 0;
LABEL_10:
    v23 = objc_msgSend(a1, "_suffixForNamedStyleWithPrefix:styles:", CFSTR("group-"), v16);
    v33 = 0;
    if ((objc_msgSend(a1, "_indexFromStyleSuffix:integer:", v23, &v33) & 1) != 0)
    {
      v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("group-"), v23);
      v25 = objc_msgSend(a1, "_createTreeWithLayerTreeNode:modePrefix:layerName:index:subpaths:delegate:", ChildAtIndex, a4, v24, v33, a7, a8);
      objc_msgSend(v31, "addObject:", v25);
    }
    else
    {
      v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@0"), CFSTR("anonymousGroup-"));
      v25 = objc_msgSend(a1, "_createTreeWithLayerTreeNode:modePrefix:layerName:index:subpaths:delegate:", ChildAtIndex, a4, v26, v33, a7, a8);
      if (objc_msgSend(v25, "sublayers"))
        objc_msgSend(v31, "addObjectsFromArray:", objc_msgSend(v25, "sublayers"));
    }

    goto LABEL_15;
  }
LABEL_16:
  v27 = objc_msgSend(objc_alloc((Class)a1), "__initTreeWithName:index:sublayers:attributes:style:delegate:", a5, a6, v31, 0, objc_msgSend(a8, "styleForLayerName:", a5), a8);

  return v27;
}

+ (id)_createLayerWithLayerTreeNode:(CGSVGNode *)a3 layerName:(id)a4 index:(unint64_t)a5 subpaths:(id)a6 delegate:(id)a7
{
  if (CGSVGNodeGetChildCount(a3, a2))
    return objc_msgSend(a1, "_createShapeLayerWithLayerTreeNode:layerName:index:shapes:delegate:", a3, a4, a5, a6, a7);
  else
    return objc_msgSend(a1, "_createSimpleLayerWithLayerTreeNode:layerName:index:subpaths:delegate:", a3, a4, a5, a6, a7);
}

+ (id)_createSimpleLayerWithLayerTreeNode:(CGSVGNode *)a3 layerName:(id)a4 index:(unint64_t)a5 subpaths:(id)a6 delegate:(id)a7
{
  uint64_t AttributeMap;
  id v14;
  id v15;
  double v16;
  id v17;

  if (!a3)
    return 0;
  AttributeMap = CGSVGNodeGetAttributeMap(a3);
  v14 = objc_msgSend(a7, "styleForLayerName:", a4);
  v15 = objc_msgSend(a1, "_createPathFromStyle:subpaths:", v14, a6);
  objc_msgSend(a1, "_strokeWidthForNode:", a3);
  v17 = objc_msgSend(objc_alloc((Class)a1), "_initWithName:index:shape:strokeWidth:attributes:style:delegate:", a4, a5, v15, AttributeMap, v14, a7, v16);
  if (v15)

  return v17;
}

+ (id)_createShapeLayerWithLayerTreeNode:(CGSVGNode *)a3 layerName:(id)a4 index:(unint64_t)a5 shapes:(id)a6 delegate:(id)a7
{
  uint64_t ChildCount;
  id v12;
  uint64_t v13;
  uint64_t ChildAtIndex;
  uint64_t Attribute;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  double v23;
  id v24;
  id v25;
  uint64_t AttributeMap;
  id v30;

  if (!a3)
    return 0;
  ChildCount = CGSVGNodeGetChildCount(a3, a2);
  AttributeMap = CGSVGNodeGetAttributeMap(a3);
  v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", ChildCount);
  if (ChildCount)
  {
    v13 = 0;
    v30 = a6;
    do
    {
      ChildAtIndex = CGSVGNodeGetChildAtIndex(a3, v13);
      Attribute = CGSVGNodeFindAttribute(ChildAtIndex, 4);
      if (Attribute)
      {
        v16 = (void *)CGSVGAttributeCopyString(Attribute);
        if ((objc_msgSend(v16, "hasPrefix:", CFSTR("shapeGroupLayer-")) & 1) != 0)
        {
          v17 = objc_msgSend(a7, "styleForLayerName:", v16);
          v18 = v16;
          if (v17)
          {
            if (CGSVGNodeGetChildCount(ChildAtIndex, v19))
            {
              v20 = objc_msgSend(a1, "_createShapeLayerWithLayerTreeNode:layerName:index:shapes:delegate:", ChildAtIndex, v16, v13, a6, a7);
              objc_msgSend(v12, "addObject:", v20);

            }
            else
            {
              v22 = objc_msgSend(a1, "_createPathFromStyle:subpaths:", v17, a6);
              if (v22)
              {
                objc_msgSend(a1, "_strokeWidthForNode:", ChildAtIndex);
                v24 = objc_msgSend(objc_alloc((Class)a1), "_initWithName:index:shape:strokeWidth:attributes:style:delegate:", v16, v13, v22, AttributeMap, v17, a7, v23);
                objc_msgSend(v12, "addObject:", v24);

              }
              a6 = v30;
            }
          }
        }
        else
        {
          v21 = v16;
        }
      }
      ++v13;
    }
    while (ChildCount != v13);
  }
  v25 = objc_msgSend(objc_alloc((Class)a1), "_initWithName:index:sublayers:attributes:style:delegate:", a4, a5, v12, 0, objc_msgSend(a7, "styleForLayerName:", a4, AttributeMap), a7);

  return v25;
}

+ (id)createLayerGroupWithLayerTree:(CGSVGNode *)a3 layerNames:(id)a4 shapes:(id)a5 delegate:(id)a6
{
  char *v8;
  uint64_t v9;
  uint64_t ChildCount;
  uint64_t v11;
  char *i;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t ChildAtIndex;
  uint64_t Attribute;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  double v24;
  id v25;
  id v26;
  uint64_t AttributeMap;
  id v30;

  if (!a3)
    return 0;
  v8 = (char *)objc_msgSend(a4, "count");
  v30 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v8);
  ChildCount = CGSVGNodeGetChildCount(a3, v9);
  if (v8)
  {
    v11 = ChildCount;
    for (i = 0; i != v8; ++i)
    {
      v13 = objc_msgSend(a4, "objectAtIndex:", i);
      if (v11)
      {
        v14 = v13;
        v15 = 0;
        while (1)
        {
          ChildAtIndex = CGSVGNodeGetChildAtIndex(a3, v15);
          Attribute = CGSVGNodeFindAttribute(ChildAtIndex, 4);
          if (Attribute)
          {
            v18 = (void *)CGSVGAttributeCopyString(Attribute);
            v19 = objc_msgSend(v18, "containsString:", v14);

            if (ChildAtIndex)
            {
              if ((v19 & 1) != 0)
                break;
            }
          }
          if (v11 == ++v15)
            goto LABEL_15;
        }
        if (CGSVGNodeGetChildCount(ChildAtIndex, v20))
        {
          v21 = objc_msgSend(a1, "_createShapeLayerWithLayerTreeNode:layerName:index:shapes:delegate:", ChildAtIndex, v14, i, a5, a6);
          objc_msgSend(v30, "addObject:", v21);

        }
        else
        {
          AttributeMap = CGSVGNodeGetAttributeMap(ChildAtIndex);
          v22 = objc_msgSend(a6, "styleForLayerName:", v14);
          v23 = objc_msgSend(a1, "_createPathFromStyle:subpaths:", v22, a5);
          objc_msgSend(a6, "strokeWidthForLayerNamed:", v14);
          v25 = objc_msgSend(objc_alloc((Class)a1), "_initWithName:index:shape:strokeWidth:attributes:style:delegate:", v14, i, v23, AttributeMap, v22, a6, v24);
          objc_msgSend(v30, "addObject:", v25);

          if (v23)
        }
      }
LABEL_15:
      ;
    }
  }
  v26 = objc_msgSend(objc_alloc((Class)a1), "_initWithName:index:sublayers:attributes:style:delegate:", CFSTR("root"), 0, v30, 0, 0, a6);

  return v26;
}

+ (id)createLayerGroupWithLayerTree:(CGSVGNode *)a3 modePrefix:(id)a4 shapes:(id)a5 delegate:(id)a6
{
  return objc_msgSend(a1, "_createTreeWithLayerTreeNode:modePrefix:layerName:index:subpaths:delegate:", a3, a4, CFSTR("root"), 0, a5, a6);
}

- (void)_readCSSAttributes:(CGSVGAttributeMap *)a3 styleAttributes:(CGSVGAttributeMap *)a4
{
  uint64_t v7;
  float v8;
  float v9;
  uint64_t Attribute;
  double v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  unint64_t v15;
  BOOL v16;
  int v17;
  int v18;
  uint64_t v19;
  _BOOL4 Boolean;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  double v37;
  unsigned int v38;
  unsigned int v39;
  double v40;
  uint64_t v41;

  v41 = 0x7FF0000000000000;
  -[CUIVectorGlyhLayerDelegate templateVersion](-[CUIVectorGlyphLayer delegate](self, "delegate"), "templateVersion");
  if (a4)
  {
    v9 = v8;
    Attribute = CGSVGAttributeMapGetAttribute(a4, 41);
    if (Attribute)
    {
      v40 = 1.0;
      if (CGSVGAttributeGetFloat(Attribute, &v40))
        v11 = v40;
      else
        v11 = 1.0;
    }
    else
    {
      v11 = 1.0;
    }
    v19 = CGSVGAttributeMapGetAttribute(a4, +[CUIVectorGlyphLayer _clearBehindAtom](CUIVectorGlyphLayer, "_clearBehindAtom"));
    if (v19)
      Boolean = CUISVGAttributeGetBoolean(v19);
    else
      Boolean = 0;
    if (v9 >= 4.0)
    {
      v21 = CGSVGAttributeMapGetAttribute(a4, +[CUIVectorGlyphLayer _variableThresholdAtom](CUIVectorGlyphLayer, "_variableThresholdAtom"));
      if (v21)
        CGSVGAttributeGetFloat(v21, &v41);
    }
    if (v9 >= 5.0)
    {
      v22 = CGSVGAttributeMapGetAttribute(a4, +[CUIVectorGlyphLayer _fillActionAtom](CUIVectorGlyphLayer, "_fillActionAtom"));
      if (v22)
      {
        v23 = (void *)CGSVGAttributeCopyString(v22);
        v24 = objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), &stru_1E41B97C0);

        if (objc_msgSend(CFSTR("erase"), "caseInsensitiveCompare:", v24))
        {
          v25 = objc_msgSend(CFSTR("draw"), "caseInsensitiveCompare:", v24);
          v12 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          Boolean = 0;
          if (v25)
            v11 = 0.0;
          else
            v11 = 1.0;
        }
        else
        {
          v12 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v11 = 0.0;
          Boolean = 1;
        }
      }
      else
      {
        v26 = CGSVGAttributeMapGetAttribute(a4, +[CUIVectorGlyphLayer _motionGroupAtom](CUIVectorGlyphLayer, "_motionGroupAtom"));
        if (v26)
        {
          v40 = 0.0;
          if (CGSVGAttributeGetFloat(v26, &v40))
            v15 = (unint64_t)v40;
          else
            v15 = 0;
        }
        else
        {
          v15 = 0;
        }
        v27 = CGSVGAttributeMapGetAttribute(a4, +[CUIVectorGlyphLayer _alwaysPulsesAtom](CUIVectorGlyphLayer, "_alwaysPulsesAtom"));
        LODWORD(v40) = 0;
        if (v27 && CGSVGAttributeGetAtom(v27, &v40))
        {
          v28 = (void *)CGSVGAtomCopyString(LODWORD(v40));
          v14 = objc_msgSend(v28, "BOOLValue");

        }
        else
        {
          v14 = 0;
        }
        v29 = CGSVGAttributeMapGetAttribute(a4, +[CUIVectorGlyphLayer _alwaysRotatesAtom](CUIVectorGlyphLayer, "_alwaysRotatesAtom"));
        v39 = 0;
        if (v29 && CGSVGAttributeGetAtom(v29, &v39))
        {
          v30 = (void *)CGSVGAtomCopyString(v39);
          v13 = objc_msgSend(v30, "BOOLValue");

        }
        else
        {
          v13 = 0;
        }
        v31 = CGSVGAttributeMapGetAttribute(a4, +[CUIVectorGlyphLayer _alwaysBreathesAtom](CUIVectorGlyphLayer, "_alwaysBreathesAtom"));
        v38 = 0;
        if (v31 && CGSVGAttributeGetAtom(v31, &v38))
        {
          v32 = (void *)CGSVGAtomCopyString(v38);
          v12 = objc_msgSend(v32, "BOOLValue");

        }
        else
        {
          v12 = 0;
        }
      }
    }
    else
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
    }
    if (v9 >= 6.0
      && (v33 = CGSVGAttributeMapGetAttribute(a4, +[CUIVectorGlyphLayer _layerTagsAtom](CUIVectorGlyphLayer, "_layerTagsAtom"))) != 0)
    {
      v34 = (void *)CGSVGAttributeCopyString(v33);
      v35 = objc_msgSend(v34, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), &stru_1E41B97C0);

      a4 = (CGSVGAttributeMap *)objc_msgSend(v35, "componentsSeparatedByString:", CFSTR(" "));
    }
    else
    {
      a4 = 0;
    }
    v16 = Boolean;
    if (a3)
      goto LABEL_45;
  }
  else
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v11 = 1.0;
    if (a3)
    {
LABEL_45:
      v18 = objc_msgSend((id)objc_opt_class(self, v7), "_lineCapFromStyle:", a3);
      v17 = objc_msgSend((id)objc_opt_class(self, v36), "_lineJoinFromStyle:", a3);
      goto LABEL_46;
    }
  }
  v17 = 0;
  v18 = 1;
LABEL_46:
  self->_lineCap = v18;
  self->_lineJoin = v17;
  self->_isEraserLayer = v16;
  v37 = *(double *)&v41;
  self->_opacity = v11;
  self->_valueThreshold = v37;
  self->_motionGroup = v15;
  self->_alwaysPulses = v14;
  self->_alwaysRotates = v13;
  self->_alwaysBreathes = v12;
  self->_tags = (NSArray *)a4;
}

- (id)_initWithName:(id)a3 index:(unint64_t)a4 shape:(id)a5 strokeWidth:(double)a6 attributes:(CGSVGAttributeMap *)a7 style:(CGSVGAttributeMap *)a8 delegate:(id)a9
{
  CUIVectorGlyphLayer *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CUIVectorGlyphLayer;
  v16 = -[CUIVectorGlyphLayer init](&v18, sel_init);
  if (v16)
  {
    v16->_name = (NSString *)objc_msgSend(a3, "copy");
    v16->_index = a4;
    objc_storeWeak((id *)&v16->_delegate, a9);
    v16->_isPassthrough = 1;
    if (a5)
      v16->_referencePath = (CUIVectorGlyphPath *)objc_msgSend(a5, "copy");
    -[CUIVectorGlyphLayer _readCSSAttributes:styleAttributes:](v16, "_readCSSAttributes:styleAttributes:", a7, a8);
    v16->_strokeWidth = a6;
  }
  return v16;
}

- (id)_initWithName:(id)a3 index:(unint64_t)a4 sublayers:(id)a5 attributes:(CGSVGAttributeMap *)a6 style:(CGSVGAttributeMap *)a7 delegate:(id)a8
{
  return -[CUIVectorGlyphLayer __initGroupWithName:index:sublayers:attributes:style:passthrough:delegate:](self, "__initGroupWithName:index:sublayers:attributes:style:passthrough:delegate:", a3, a4, a5, a6, a7, 0, a8);
}

- (id)__initTreeWithName:(id)a3 index:(unint64_t)a4 sublayers:(id)a5 attributes:(CGSVGAttributeMap *)a6 style:(CGSVGAttributeMap *)a7 delegate:(id)a8
{
  return -[CUIVectorGlyphLayer __initGroupWithName:index:sublayers:attributes:style:passthrough:delegate:](self, "__initGroupWithName:index:sublayers:attributes:style:passthrough:delegate:", a3, a4, a5, a6, a7, 1, a8);
}

- (id)__initGroupWithName:(id)a3 index:(unint64_t)a4 sublayers:(id)a5 attributes:(CGSVGAttributeMap *)a6 style:(CGSVGAttributeMap *)a7 passthrough:(BOOL)a8 delegate:(id)a9
{
  CUIVectorGlyphLayer *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CUIVectorGlyphLayer;
  v15 = -[CUIVectorGlyphLayer init](&v17, sel_init);
  if (v15)
  {
    v15->_name = (NSString *)objc_msgSend(a3, "copy");
    v15->_index = a4;
    objc_storeWeak((id *)&v15->_delegate, a9);
    v15->_isPassthrough = a8;
    v15->_sublayers = (NSArray *)a5;
    -[CUIVectorGlyphLayer _readCSSAttributes:styleAttributes:](v15, "_readCSSAttributes:styleAttributes:", a6, a7);
    v15->_strokeWidth = 0.0;
  }
  return v15;
}

- (id)debugDescriptionWithIndentLevel:(unint64_t)a3
{
  objc_class *v5;
  NSString *v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  double v12;
  NSNumber *v13;
  unint64_t v14;
  const __CFString *v15;
  NSString *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  id v21;
  unint64_t v22;
  __CFString *v23;
  NSString *v25;
  NSArray *obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v5 = (objc_class *)objc_opt_class(self, a2);
  v25 = NSStringFromClass(v5);
  v6 = -[CUIVectorGlyphLayer name](self, "name");
  v7 = -[CUIVectorGlyphLayer index](self, "index");
  v8 = -[CUIVectorGlyphLayer referenceShape](self, "referenceShape");
  -[CUIVectorGlyphLayer opacity](self, "opacity");
  v10 = v9;
  if (-[CUIVectorGlyphLayer isEraserLayer](self, "isEraserLayer"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  -[CUIVectorGlyphLayer valueThreshold](self, "valueThreshold");
  if (v12 == INFINITY)
  {
    v13 = (NSNumber *)CFSTR("<unspecified>");
  }
  else
  {
    -[CUIVectorGlyphLayer valueThreshold](self, "valueThreshold");
    v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  }
  v14 = -[CUIVectorGlyphLayer motionGroup](self, "motionGroup");
  if (-[CUIVectorGlyphLayer alwaysPulses](self, "alwaysPulses"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, %@, layerIndex=%lu, shape=%p, opacity=%.2f, eraser=%@, value=%@, motionGroup=%lu, alwaysPulses=%@"), v25, self, v6, v7, v8, v10, v11, v13, v14, v15);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->_sublayers;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(obj);
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), "debugDescriptionWithIndentLevel:", a3 + 1);
        if (a3)
        {
          v22 = a3;
          v23 = CFSTR("\n");
          do
          {
            v23 = (__CFString *)-[__CFString stringByAppendingString:](v23, "stringByAppendingString:", CFSTR("\t"));
            --v22;
          }
          while (v22);
        }
        else
        {
          v23 = CFSTR("\n");
        }
        v16 = -[NSString stringByAppendingString:](v16, "stringByAppendingString:", -[__CFString stringByAppendingString:](v23, "stringByAppendingString:", v21));
      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v18);
  }
  return v16;
}

- (id)debugDescription
{
  return -[CUIVectorGlyphLayer debugDescriptionWithIndentLevel:](self, "debugDescriptionWithIndentLevel:", 1);
}

- (CGPath)shape
{
  CUIVectorGlyhLayerDelegate **p_delegate;
  double v4;

  p_delegate = &self->_delegate;
  if (objc_loadWeak((id *)&self->_delegate))
    objc_msgSend(objc_loadWeak((id *)p_delegate), "scale");
  else
    v4 = 1.0;
  return -[CUIVectorGlyphLayer shapeAtScale:](self, "shapeAtScale:", v4);
}

- (CGPath)shapeAtScale:(double)a3
{
  id v3;
  const CGPath *v4;

  v3 = -[CUIVectorGlyphLayer pathAtScale:](self, "pathAtScale:", a3);
  if (!v3)
    return 0;
  v4 = (const CGPath *)objc_msgSend(v3, "path");
  CGPathRetain(v4);
  CFAutorelease(v4);
  return v4;
}

- (id)path
{
  CUIVectorGlyhLayerDelegate **p_delegate;
  double v4;

  p_delegate = &self->_delegate;
  if (objc_loadWeak((id *)&self->_delegate))
    objc_msgSend(objc_loadWeak((id *)p_delegate), "scale");
  else
    v4 = 1.0;
  return -[CUIVectorGlyphLayer pathAtScale:](self, "pathAtScale:", v4);
}

- (id)pathAtScale:(double)a3
{
  CUIVectorGlyhLayerDelegate **p_delegate;
  double v6;
  double v7;
  CUIVectorGlyphPath *v8;
  CUIVectorGlyphPath *v9;
  CUIVectorGlyphPath *referencePath;
  CUIVectorGlyphPath *v11;
  CGAffineTransform v13;
  CGAffineTransform v14;

  if (!self->_referencePath)
    return 0;
  p_delegate = &self->_delegate;
  if (!objc_loadWeak((id *)&self->_delegate))
    return 0;
  objc_msgSend(objc_loadWeak((id *)p_delegate), "_requestedPointSizeRatio");
  v7 = v6 * a3;
  if (fabs(v7 + -1.0) >= 2.22044605e-16)
  {
    memset(&v14, 0, sizeof(v14));
    CGAffineTransformMakeScale(&v14, v7, v7);
    referencePath = self->_referencePath;
    v13 = v14;
    v8 = -[CUIVectorGlyphPath createCopyApplyingTransform:](referencePath, "createCopyApplyingTransform:", &v13);
  }
  else
  {
    v8 = self->_referencePath;
  }
  v9 = v8;
  v11 = v8;
  return v9;
}

- (void)_setAlwaysPulses:(BOOL)a3
{
  self->_alwaysPulses = a3;
}

- (void)_setAlwaysRotates:(BOOL)a3
{
  self->_alwaysRotates = a3;
}

- (BOOL)_anyLayerAlwaysRotates
{
  id v2;
  NSArray *sublayers;
  id v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (self->_alwaysRotates)
  {
LABEL_2:
    LOBYTE(v2) = 1;
    return (char)v2;
  }
  v2 = -[NSArray count](self->_sublayers, "count");
  if (v2)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    sublayers = self->_sublayers;
    v2 = -[NSArray countByEnumeratingWithState:objects:count:](sublayers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v2)
    {
      v5 = v2;
      v6 = *(_QWORD *)v10;
LABEL_7:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(sublayers);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "_anyLayerAlwaysRotates") & 1) != 0)
          goto LABEL_2;
        if (v5 == (id)++v7)
        {
          v5 = -[NSArray countByEnumeratingWithState:objects:count:](sublayers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
          LOBYTE(v2) = 0;
          if (v5)
            goto LABEL_7;
          return (char)v2;
        }
      }
    }
  }
  return (char)v2;
}

- (void)_setAllLayersAlwaysRotate:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *sublayers;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = a3;
  self->_alwaysRotates = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  sublayers = self->_sublayers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](sublayers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(sublayers);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "_setAllLayersAlwaysRotate:", v3);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](sublayers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (BOOL)needsWideGamut
{
  return 0;
}

- (BOOL)anyLayerNeedsWideGamutColor
{
  NSArray *sublayers;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (-[NSArray count](self->_sublayers, "count"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    sublayers = self->_sublayers;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](sublayers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(sublayers);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "needsWideGamut") & 1) != 0)
          {
            LOBYTE(v4) = 1;
            return (char)v4;
          }
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](sublayers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        LOBYTE(v4) = 0;
        if (v5)
          continue;
        break;
      }
    }
  }
  else if (self->_referencePath)
  {
    LOBYTE(v4) = -[CUIVectorGlyphLayer needsWideGamut](self, "needsWideGamut");
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (CGColor)_colorForVariableThreshold:(double)a3 variableMinValue:(double)a4 variableMaxValue:(double)a5 onFillColor:(CGColor *)a6 offFillColor:(CGColor *)a7
{
  CGColor *CopyWithAlpha;
  BOOL v10;
  BOOL v11;
  CGFloat Alpha;

  if (a3 == INFINITY || a6 == 0)
    return a6;
  CopyWithAlpha = a7;
  v10 = a3 <= a5;
  if (a3 <= 0.0)
    v10 = a3 < a5;
  if (a5 == INFINITY)
    v10 = 1;
  v11 = a3 >= a4 || a4 == INFINITY;
  if (v11 && v10)
    return a6;
  if (!a7)
  {
    Alpha = CGColorGetAlpha(a6);
    CopyWithAlpha = CGColorCreateCopyWithAlpha(a6, Alpha * 0.3);
    CFAutorelease(CopyWithAlpha);
  }
  return CopyWithAlpha;
}

- (CGImage)createImageUsingScaleFactor:(double)a3 targetSize:(CGSize)a4 variableMinValue:(double)a5 variableMaxValue:(double)a6 onFillColor:(CGColor *)a7 offFillColor:(CGColor *)a8
{
  double height;
  double width;
  double v16;
  double v17;
  CGColorSpace *SRGB;
  uint64_t v19;
  uint64_t v20;
  CGContext *v21;
  NSArray *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  CGImage *Image;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  height = a4.height;
  width = a4.width;
  v16 = a4.width * a3;
  v17 = a4.height * a3;
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  v21 = CUICGBitmapContextCreate(vcvtpd_u64_f64(v16), vcvtpd_u64_f64(v17), 8uLL, 0, SRGB, 8193, v19, v20);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v22 = -[CUIVectorGlyphLayer sublayers](self, "sublayers", 0);
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v26), "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:onFillColor:offFillColor:", v21, a7, a8, a3, width, height, a5, a6);
        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v24);
  }
  Image = CGBitmapContextCreateImage(v21);
  CGContextRelease(v21);
  return Image;
}

- (CGImage)createSublayerMaskUsingScaleFactor:(double)a3 targetSize:(CGSize)a4 maskColor:(CGColor *)a5
{
  uint64_t SRGBBlack;
  double height;
  double width;
  double v10;
  double v11;
  CGColorSpace *SRGB;
  uint64_t v13;
  uint64_t v14;
  CGContext *v15;
  NSArray *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  CGImage *Image;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  SRGBBlack = (uint64_t)a5;
  height = a4.height;
  width = a4.width;
  v10 = a4.width * a3;
  v11 = a4.height * a3;
  if (!a5)
    SRGBBlack = _CUIColorGetSRGBBlack();
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  v15 = CUICGBitmapContextCreate(vcvtpd_u64_f64(v10), vcvtpd_u64_f64(v11), 8uLL, 0, SRGB, 8193, v13, v14);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = -[CUIVectorGlyphLayer sublayers](self, "sublayers", 0);
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v20), "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:onFillColor:offFillColor:", v15, SRGBBlack, 0, a3, width, height, INFINITY, INFINITY);
        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v18);
  }
  Image = CGBitmapContextCreateImage(v15);
  CGContextRelease(v15);
  return Image;
}

+ (CGColor)_strokeColorFromStyle:(CGSVGAttributeMap *)a3
{
  uint64_t Attribute;
  CGColor *v4;
  CGColor *CGColor;
  _OWORD v7[2];
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  if (!a3)
    return 0;
  Attribute = CGSVGAttributeMapGetAttribute(a3, 57);
  if (!Attribute)
    return 0;
  v12 = 0;
  v4 = 0;
  if (CGSVGAttributeGetPaint(Attribute, &v12))
  {
    v11 = 0;
    v9 = 0u;
    v10 = 0u;
    CGSVGPaintGetColor(&v9, v12);
    v7[0] = v9;
    v7[1] = v10;
    v8 = v11;
    CGColor = (CGColor *)CGSVGColorCreateCGColor(v7);
    v4 = CGColor;
    if (CGColor)
      CFAutorelease(CGColor);
  }
  return v4;
}

+ (double)_strokeWidthFromStyle:(CGSVGAttributeMap *)a3
{
  double v3;
  uint64_t Attribute;
  unsigned __int8 Float;
  double v7;

  v3 = 0.0;
  if (a3)
  {
    Attribute = CGSVGAttributeMapGetAttribute(a3, 59);
    if (Attribute)
    {
      v7 = 0.0;
      Float = CGSVGAttributeGetFloat(Attribute, &v7);
      if ((Float & (v7 >= 1.0)) != 0)
        return v7;
      else
        return 0.0;
    }
  }
  return v3;
}

+ (int)_lineCapFromStyle:(CGSVGAttributeMap *)a3
{
  uint64_t Attribute;
  int v4;
  unsigned __int8 Atom;
  int v6;
  int v7;
  int v9;

  if (!a3)
    return 1;
  Attribute = CGSVGAttributeMapGetAttribute(a3, 34);
  v4 = 1;
  if (Attribute)
  {
    v9 = 0;
    Atom = CGSVGAttributeGetAtom(Attribute, &v9);
    if (v9 == 54)
      v6 = 2;
    else
      v6 = 1;
    if (v9 == 2)
      v7 = 0;
    else
      v7 = v6;
    if ((Atom & (v9 != 0)) != 0)
      return v7;
    else
      return 1;
  }
  return v4;
}

+ (int)_lineJoinFromStyle:(CGSVGAttributeMap *)a3
{
  uint64_t Attribute;
  unsigned __int8 Atom;
  int v5;
  int v7;

  if (a3)
  {
    Attribute = CGSVGAttributeMapGetAttribute(a3, 35);
    if (Attribute)
    {
      v7 = 0;
      Atom = CGSVGAttributeGetAtom(Attribute, &v7);
      if (v7 == 50)
        v5 = 1;
      else
        v5 = 2 * (v7 == 38);
      if ((Atom & (v7 != 0)) != 0)
        LODWORD(Attribute) = v5;
      else
        LODWORD(Attribute) = 0;
    }
  }
  else
  {
    LODWORD(Attribute) = 0;
  }
  return Attribute;
}

- (NSArray)tags
{
  return self->_tags;
}

- (BOOL)alwaysRotates
{
  return self->_alwaysRotates;
}

- (BOOL)alwaysBreathes
{
  return self->_alwaysBreathes;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (int)lineCap
{
  return self->_lineCap;
}

- (int)lineJoin
{
  return self->_lineJoin;
}

- (CUIVectorGlyphPath)referencePath
{
  return self->_referencePath;
}

- (BOOL)isPassthrough
{
  return self->_isPassthrough;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

@end
