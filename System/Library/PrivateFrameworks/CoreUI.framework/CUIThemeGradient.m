@implementation CUIThemeGradient

- (NSMutableArray)_psdGradientOpacityStopsWithOpacities:(void *)a3 locations:
{
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CUIPSDGradientOpacityStop *v12;
  double v13;
  double v14;
  double v15;
  CUIPSDGradientOpacityStop *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  if (!a1)
    return 0;
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(a2, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(a2);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v10);
        v12 = [CUIPSDGradientOpacityStop alloc];
        objc_msgSend(objc_msgSend(a3, "objectAtIndex:", (char *)v10 + v8), "doubleValue");
        v14 = v13;
        objc_msgSend(v11, "doubleValue");
        v16 = -[CUIPSDGradientOpacityStop initWithLocation:opacity:](v12, "initWithLocation:opacity:", v14, v15);
        -[NSMutableArray addObject:](v5, "addObject:", v16);

        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v8 += (uint64_t)v10;
    }
    while (v7);
  }
  return v5;
}

- (const)_psdGradientColorWithColor:(uint64_t)a3 colorSpace:
{
  const CGFloat *v4;
  id v5;
  size_t NumberOfComponents;

  if (result)
  {
    v4 = result;
    v5 = objc_msgSend(a2, "colorUsingCGColorSpace:");
    NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)objc_msgSend(v5, "CGColor"));
    result = CGColorGetComponents((CGColorRef)objc_msgSend(v5, "CGColor"));
    if (NumberOfComponents != 4 && NumberOfComponents != 2)
      return (const CGFloat *)-[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__psdGradientColorWithColor_colorSpace_, v4, CFSTR("CUIThemeGradient.m"), 129, CFSTR("CUIThemeGradient can't initialize with unsupported color space: %@"), a3);
  }
  return result;
}

- (NSMutableArray)_psdGradientColorStopsWithColors:(void *)a3 locations:(uint64_t)a4 colorSpace:
{
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CUIPSDGradientColorStop *v14;
  CUIPSDGradientColorStop *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  if (!a1)
    return 0;
  v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(a2, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    obj = a2;
    v11 = 0;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(obj);
        -[CUIThemeGradient _psdGradientColorWithColor:colorSpace:](a1, *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v13), a4);
        v14 = [CUIPSDGradientColorStop alloc];
        objc_msgSend(objc_msgSend(a3, "objectAtIndex:", (char *)v13 + v11), "doubleValue");
        v15 = -[CUIPSDGradientColorStop initWithLocation:gradientColor:](v14, "initWithLocation:gradientColor:");
        -[NSMutableArray addObject:](v8, "addObject:", v15);

        v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v11 += (uint64_t)v13;
    }
    while (v10);
  }
  return v8;
}

- (id)_initWithGradientEvaluator:(id)a3 colorSpace:(CGColorSpace *)a4
{
  CUIThemeGradient *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CUIThemeGradient;
  v6 = -[CUIThemeGradient init](&v8, sel_init);
  if (v6)
  {
    v6->gradientEvaluator = a3;
    v6->colorSpace = CGColorSpaceRetain(a4);
  }
  return v6;
}

- (CUIThemeGradient)initWithColors:(id)a3 colorlocations:(id)a4 colorMidpoints:(id)a5 opacities:(id)a6 opacityLocations:(id)a7 opacityMidpoints:(id)a8 smoothingCoefficient:(double)a9 fillColor:(id)a10 colorSpace:(CGColorSpace *)a11
{
  uint64_t v12;

  LOBYTE(v12) = 0;
  return -[CUIThemeGradient initWithColors:colorlocations:colorMidpoints:opacities:opacityLocations:opacityMidpoints:smoothingCoefficient:fillColor:colorSpace:dither:](self, "initWithColors:colorlocations:colorMidpoints:opacities:opacityLocations:opacityMidpoints:smoothingCoefficient:fillColor:colorSpace:dither:", a3, a4, a5, a6, a7, a8, a9, a10, a11, v12);
}

- (CUIThemeGradient)initWithColors:(id)a3 colorlocations:(id)a4 colorMidpoints:(id)a5 opacities:(id)a6 opacityLocations:(id)a7 opacityMidpoints:(id)a8 smoothingCoefficient:(double)a9 fillColor:(id)a10 colorSpace:(CGColorSpace *)a11 dither:(BOOL)a12
{
  id v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CUIPSDGradientEvaluator *v31;
  NSMutableArray *v32;
  CUIPSDGradientEvaluator *v33;
  CUIThemeGradient *v34;
  CUIThemeGradient *v36;

  if (objc_msgSend(a3, "count"))
  {
    v21 = objc_msgSend(a3, "count");
    if (v21 != objc_msgSend(a4, "count"))
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeGradient.m"), 172, CFSTR("CUIThemeGradient needs the same number of colors as there are of color locations for initialization"));
    v22 = objc_msgSend(a6, "count");
    if (v22 != objc_msgSend(a7, "count"))
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeGradient.m"), 173, CFSTR("CUIThemeGradient needs the same number of opacities as there are of opacity locations for initialization"));
    -[CUIThemeGradient _psdGradientColorWithColor:colorSpace:]((const CGFloat *)self, a10, (uint64_t)a11);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v31 = [CUIPSDGradientEvaluator alloc];
    v32 = -[CUIThemeGradient _psdGradientColorStopsWithColors:locations:colorSpace:]((const CGFloat *)self, a3, a4, (uint64_t)a11);
    v33 = -[CUIPSDGradientEvaluator initWithColorStops:colorMidpoints:opacityStops:opacityMidpoints:smoothingCoefficient:fillColor:dither:](v31, "initWithColorStops:colorMidpoints:opacityStops:opacityMidpoints:smoothingCoefficient:fillColor:dither:", v32, a5, -[CUIThemeGradient _psdGradientOpacityStopsWithOpacities:locations:]((uint64_t)self, a6, a7), a8, a12, a9, v24, v26, v28, v30);
    v34 = -[CUIThemeGradient _initWithGradientEvaluator:colorSpace:](self, "_initWithGradientEvaluator:colorSpace:", v33, a11);

    return v34;
  }
  else
  {
    v36 = self;
    return 0;
  }
}

- (id)gradientByApplyingEffects:(id)a3
{
  CUIThemeGradient *v3;
  id v5;

  v3 = self;
  if (a3)
  {
    v5 = objc_msgSend(self->gradientEvaluator, "copy");
    v3 = (CUIThemeGradient *)-[CUIThemeGradient _initWithGradientEvaluator:colorSpace:]([CUIThemeGradient alloc], "_initWithGradientEvaluator:colorSpace:", v5, v3->colorSpace);
    -[CUIThemeGradient _tintColorStopsWithEffects:]((uint64_t)v3, a3);

  }
  return v3;
}

- (void)_tintColorStopsWithEffects:(uint64_t)a1
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGColor *v15;
  CGColor *v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  CGFloat components[4];

  if (a1)
  {
    v17 = *(void **)(a1 + 8);
    v4 = objc_msgSend(v17, "colorStops");
    v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = v4;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "gradientColor");
          components[0] = v11;
          components[1] = v12;
          components[2] = v13;
          components[3] = v14;
          v15 = CGColorCreate(*(CGColorSpaceRef *)(a1 + 24), components);
          v16 = (CGColor *)objc_msgSend(a2, "newColorByProcessingColor:", v15);
          CGColorGetComponents(v16);
          objc_msgSend(v10, "location");
          objc_msgSend(v5, "addObject:", +[CUIPSDGradientColorStop colorStopWithLocation:gradientColor:](CUIPSDGradientColorStop, "colorStopWithLocation:gradientColor:"));
          CGColorRelease(v15);
          CGColorRelease(v16);
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }
    if (v5)
      objc_msgSend(v17, "setColorStops:midpoints:", v5, objc_msgSend(v17, "colorMidpointLocations"));

  }
}

- (CUIColor)_colorFromPSDGradientColor:(CGFloat)a3
{
  CGColor *v5;
  CUIColor *v6;
  CGFloat components[4];

  if (!a1)
    return 0;
  components[0] = a2;
  components[1] = a3;
  components[2] = a4;
  components[3] = a5;
  v5 = CGColorCreate(*(CGColorSpaceRef *)(a1 + 24), components);
  v6 = +[CUIColor colorWithCGColor:](CUIColor, "colorWithCGColor:", v5);
  CGColorRelease(v5);
  return v6;
}

- (id)colorStops
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  unsigned __int8 v10;
  char v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = objc_msgSend(self->gradientEvaluator, "colorStops");
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "isDoubleStop");
        v11 = 1;
        do
        {
          if (objc_msgSend(v9, "isDoubleStop"))
          {
            if ((v11 & 1) != 0)
              objc_msgSend(v9, "leadInColor");
            else
              objc_msgSend(v9, "leadOutColor");
          }
          else
          {
            objc_msgSend(v9, "gradientColor");
          }
          -[NSMutableArray addObject:](v4, "addObject:", -[CUIThemeGradient _colorFromPSDGradientColor:]((uint64_t)self, v12, v13, v14, v15));
          v16 = v10 & v11;
          v11 = 0;
        }
        while ((v16 & 1) != 0);
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  return v4;
}

- (id)colorLocations
{
  id v2;
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  unsigned int v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = objc_msgSend(self->gradientEvaluator, "colorStops");
  v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v9 = objc_msgSend(v8, "isDoubleStop");
        objc_msgSend(v8, "location");
        -[NSMutableArray addObject:](v3, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        if (v9)
        {
          objc_msgSend(v8, "location");
          -[NSMutableArray addObject:](v3, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10 + 0.01));
        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  return v3;
}

- (id)opacityStops
{
  id v2;
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  unsigned __int8 v9;
  char v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = objc_msgSend(self->gradientEvaluator, "opacityStops");
  v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v9 = objc_msgSend(v8, "isDoubleStop");
        v10 = 1;
        do
        {
          if (objc_msgSend(v8, "isDoubleStop"))
          {
            if ((v10 & 1) != 0)
              objc_msgSend(v8, "leadInOpacity");
            else
              objc_msgSend(v8, "leadOutOpacity");
          }
          else
          {
            objc_msgSend(v8, "opacity");
          }
          -[NSMutableArray addObject:](v3, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v11 = v9 & v10;
          v10 = 0;
        }
        while ((v11 & 1) != 0);
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  return v3;
}

- (id)opacityLocations
{
  id v2;
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  unsigned int v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = objc_msgSend(self->gradientEvaluator, "opacityStops");
  v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v9 = objc_msgSend(v8, "isDoubleStop");
        objc_msgSend(v8, "location");
        if (v9)
        {
          -[NSMutableArray addObject:](v3, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10 + -0.01));
          objc_msgSend(v8, "location");
        }
        -[NSMutableArray addObject:](v3, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  return v3;
}

- (double)smoothingCoefficient
{
  double result;

  objc_msgSend(self->gradientEvaluator, "smoothingCoefficient");
  return result;
}

- (BOOL)isDithered
{
  return objc_msgSend(self->gradientEvaluator, "isDithered");
}

- (id)fillColor
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;

  objc_msgSend(self->gradientEvaluator, "fillColor");
  return -[CUIThemeGradient _colorFromPSDGradientColor:]((uint64_t)self, v3, v4, v5, v6);
}

- (int)blendMode
{
  return objc_msgSend(self->gradientEvaluator, "blendMode");
}

- (void)dealloc
{
  CGFunction *colorShader;
  CGImage *gradientImage;
  objc_super v5;

  CGColorSpaceRelease(self->colorSpace);
  colorShader = self->colorShader;
  if (colorShader)
    CGFunctionRelease(colorShader);
  gradientImage = self->_gradientImage;
  if (gradientImage)
    CGImageRelease(gradientImage);
  v5.receiver = self;
  v5.super_class = (Class)CUIThemeGradient;
  -[CUIThemeGradient dealloc](&v5, sel_dealloc);
}

- (CGFunctionRef)_newColorShaderForDistance:(CGFunctionRef)result
{
  id v3;
  CGFunctionCallbacks callbacks;
  CGFloat range[2];
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat domain[3];

  if (result)
  {
    *(_QWORD *)&callbacks.version = 0;
    callbacks.evaluate = (CGFunctionEvaluateCallback)LinearGradientShaderFunction;
    callbacks.releaseInfo = (CGFunctionReleaseInfoCallback)GradientEvaluatorRelease;
    v3 = objc_msgSend(*((id *)result + 1), "copy");
    objc_msgSend(v3, "customizeForDistance:", a2);
    CFRetain(v3);

    *(_OWORD *)domain = xmmword_19EC72D40;
    range[0] = 0.0;
    v6 = 0;
    v8 = 0;
    range[1] = 1.0;
    v7 = 0x3FF0000000000000;
    v9 = 0x3FF0000000000000;
    v10 = 0;
    v11 = 0x3FF0000000000000;
    return CGFunctionCreate(v3, 1uLL, domain, 4uLL, range, &callbacks);
  }
  return result;
}

- (CGFunctionRef)colorShader
{
  CGFunctionRef v1;
  CGFunctionCallbacks callbacks;
  CGFloat range[2];
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat domain[3];

  if (result)
  {
    v1 = result;
    result = (CGFunctionRef)*((_QWORD *)result + 2);
    if (!result)
    {
      *(_QWORD *)&callbacks.version = 0;
      callbacks.evaluate = (CGFunctionEvaluateCallback)LinearGradientShaderFunction;
      callbacks.releaseInfo = (CGFunctionReleaseInfoCallback)GradientEvaluatorRelease;
      *(_OWORD *)domain = xmmword_19EC72D40;
      range[0] = 0.0;
      v4 = 0;
      v6 = 0;
      range[1] = 1.0;
      v5 = 0x3FF0000000000000;
      v7 = 0x3FF0000000000000;
      v8 = 0;
      v9 = 0x3FF0000000000000;
      result = CGFunctionCreate(*((id *)v1 + 1), 1uLL, domain, 4uLL, range, &callbacks);
      *((_QWORD *)v1 + 2) = result;
    }
  }
  return result;
}

- (void)drawInRect:(CGRect)a3 angle:(double)a4 withContext:(CGContext *)a5
{
  -[CUIThemeGradient drawInRect:angle:options:withContext:](self, "drawInRect:angle:options:withContext:", 0, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

- (void)drawInRect:(CGRect)a3 angle:(double)a4 options:(unint64_t)a5 withContext:(CGContext *)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = 0.0;
  v16 = 0.0;
  v13 = 0.0;
  v14 = 0.0;
  FrameIntersectionWithAxis(&v15, &v13, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
  CGContextSaveGState(a6);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  CGContextClipToRect(a6, v17);
  -[CUIThemeGradient drawFromPoint:toPoint:options:withContext:](self, "drawFromPoint:toPoint:options:withContext:", a5, a6, v15, v16, v13, v14);
  CGContextRestoreGState(a6);
}

- (void)drawInRect:(CGRect)a3 angle:(double)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  _CUILog(3, (uint64_t)"Calling drawInRect: witha a CUIThemeGradient.  This operation is not supported.", v4, v5, v6, v7, v8, v9, v10);
}

- (void)drawRadialGradientInRect:(CGRect)a3 relativeCenterPosition:(CGPoint)a4 withContext:(CGContext *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  NSStringFromSelector(a2);
  _CUILog(3, (uint64_t)"%@: need to implement %@", v6, v7, v8, v9, v10, v11, (uint64_t)self);
}

- (void)drawAngleGradientInRect:(CGRect)a3 relativeCenterPosition:(CGPoint)a4 withContext:(CGContext *)a5
{
  double y;
  double x;
  double height;
  double width;
  double v10;
  double v11;
  CGImage *gradientImage;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  y = a4.y;
  x = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  gradientImage = self->_gradientImage;
  if (!gradientImage)
  {
    gradientImage = -[CUIThemeGradient _createRadialGradientImageWithWidth:height:](self, "_createRadialGradientImageWithWidth:height:", 256.0, 256.0);
    self->_gradientImage = gradientImage;
  }
  v14 = v11 + width * 0.5;
  v15 = v10 + height * 0.5;
  v16 = v15 - y;
  if (v14 - x <= 0.0)
    v17 = 0.0;
  else
    v17 = v11 - (v14 - x);
  if (v16 <= 0.0)
    v18 = 0.0;
  else
    v18 = v10 - v16;
  v19 = width + vabdd_f64(v14, x);
  v20 = height + vabdd_f64(v15, y);
  CGContextDrawImage(a5, *(CGRect *)&v17, gradientImage);
}

- (void)drawFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 options:(unint64_t)a5 withContext:(CGContext *)a6
{
  char v7;
  double y;
  double x;
  double v10;
  double v11;
  BOOL v13;
  double v14;
  double v15;
  CGFunction *v16;
  int v17;
  CGShading *Axial;
  CGPoint v19;
  CGPoint v20;

  v7 = a5;
  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  v13 = a3.x == a4.x || a3.y == a4.y;
  if (v13 && objc_msgSend(self->gradientEvaluator, "hasEdgePixel"))
  {
    v14 = vabdd_f64(x, v11);
    v15 = vabdd_f64(y, v10);
    if (v14 <= v15)
      v14 = v15;
    v16 = -[CUIThemeGradient _newColorShaderForDistance:]((CGFunctionRef)self, v14);
    v17 = 1;
  }
  else
  {
    v16 = -[CUIThemeGradient colorShader]((CGFunctionRef)self);
    v17 = 0;
  }
  v19.x = v11;
  v19.y = v10;
  v20.x = x;
  v20.y = y;
  Axial = CGShadingCreateAxial(self->colorSpace, v19, v20, v16, v7 & 1, (v7 & 2) != 0);
  CGContextDrawShading(a6, Axial);
  CGShadingRelease(Axial);
  if (v17)
    CGFunctionRelease(v16);
}

- (id)interpolatedColorAtLocation:(double)a3
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGColor *v8;
  CUIColor *v9;
  CGFloat components[4];

  objc_msgSend(self->gradientEvaluator, "_smoothedGradientColorAtLocation:", a3);
  components[0] = v4;
  components[1] = v5;
  components[2] = v6;
  components[3] = v7;
  v8 = CGColorCreate(self->colorSpace, components);
  v9 = +[CUIColor colorWithCGColor:](CUIColor, "colorWithCGColor:", v8);
  CGColorRelease(v8);
  return v9;
}

- (CGImage)_createRadialGradientImageWithWidth:(double)a3 height:(double)a4
{
  CGImage *result;
  CGContext *v8;
  __int32 *Data;
  uint64_t SRGB;
  CGColorSpace *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  id v18;
  CGColor *v19;
  const CGFloat *Components;
  uint32x2_t v21;
  CGImage *Image;
  float64x2_t v23;

  result = CreateARGBBitmapContext(a3, a4, 1.0);
  if (result)
  {
    v8 = result;
    Data = (__int32 *)CGBitmapContextGetData(result);
    SRGB = _CUIColorSpaceGetSRGB();
    if (a4 > 0.0)
    {
      v11 = (CGColorSpace *)SRGB;
      v12 = 0;
      v13 = 0.0;
      v23 = (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL);
      do
      {
        if (a3 > 0.0)
        {
          v14 = v13 - a4 * 0.5;
          v15 = 0.0;
          v16 = 1;
          do
          {
            v17 = atan2(v14, v15 - a3 * 0.5);
            if (v14 < 0.0)
              v17 = v17 + 6.28318531;
            v18 = -[CUIThemeGradient interpolatedColorAtLocation:](self, "interpolatedColorAtLocation:", v17 / 6.28318531, *(_OWORD *)&v23);
            v19 = (CGColor *)objc_msgSend(v18, "CGColor");
            if (CGColorGetColorSpace(v19) != v11)
              v19 = (CGColor *)objc_msgSend(objc_msgSend(v18, "colorUsingCGColorSpace:", v11), "CGColor");
            Components = CGColorGetComponents(v19);
            v21 = vshl_u32((uint32x2_t)vmovn_s64(vcvtq_s64_f64(vmulq_f64(*(float64x2_t *)(Components + 1), v23))), (uint32x2_t)0x800000010);
            *Data++ = v21.i32[0] | ((int)(*Components * 255.0) << 24) | (int)(Components[3] * 255.0) | v21.i32[1];
            v15 = (double)v16++;
          }
          while (v15 < a3);
        }
        v13 = (double)++v12;
      }
      while ((double)v12 < a4);
    }
    Image = CGBitmapContextCreateImage(v8);
    CGContextRelease(v8);
    return Image;
  }
  return result;
}

@end
