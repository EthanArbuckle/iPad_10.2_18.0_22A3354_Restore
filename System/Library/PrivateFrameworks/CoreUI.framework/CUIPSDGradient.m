@implementation CUIPSDGradient

+ (id)getMidpointLocationFromArray:(id)a3 atIndex:(int64_t)a4 withPolicy:(int)a5
{
  id v5;
  int64_t v6;

  switch(a5)
  {
    case 0:
      return 0;
    case 2:
      if (a4)
      {
        v5 = a3;
        v6 = a4 - 1;
        return objc_msgSend(v5, "objectAtIndex:", v6);
      }
      break;
    case 3:
      v5 = a3;
      v6 = a4;
      return objc_msgSend(v5, "objectAtIndex:", v6);
  }
  return &unk_1E41DD0C8;
}

+ (CUIPSDGradient)cuiPSDGradientWithColors:(id)a3 locations:(id)a4 midpointLocations:(id)a5 angle:(double)a6 isRadial:(BOOL)a7
{
  uint64_t v7;

  if (a7)
    v7 = 1382312992;
  else
    v7 = 1282306592;
  return (CUIPSDGradient *)objc_msgSend(a1, "cuiPSDGradientWithColors:locations:midpointLocations:angle:style:", a3, a4, a5, v7, a6);
}

+ (CUIPSDGradient)cuiPSDGradientWithColors:(id)a3 locations:(id)a4 midpointLocations:(id)a5 angle:(double)a6 style:(unsigned int)a7
{
  uint64_t v12;
  id v13;
  id v14;
  int v15;
  id v16;
  uint64_t i;
  double v18;
  double v19;
  CGColor *v20;
  int64_t NumberOfComponents;
  int64_t v22;
  const CGFloat *Components;
  CUIPSDGradientColorStop *v24;
  id v25;
  CUIPSDGradientOpacityStop *v26;
  CUIPSDGradientEvaluator *v27;
  unsigned int v29;
  id v30;
  id v31;
  unsigned int v32;
  id v33;

  v12 = (uint64_t)objc_msgSend(a3, "count");
  v13 = objc_msgSend(a4, "count");
  v14 = objc_msgSend(a5, "count");
  if ((id)v12 != v13)
    return 0;
  if (!v14)
  {
    v29 = a7;
    v15 = 1;
    goto LABEL_8;
  }
  if (v14 != (id)(v12 - 1))
  {
    if (v14 == (id)v12)
    {
      v29 = a7;
      v15 = 3;
      goto LABEL_8;
    }
    return 0;
  }
  v29 = a7;
  v15 = 2;
LABEL_8:
  v32 = v15;
  v33 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v12);
  v16 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v12);
  v31 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v12);
  v30 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v12);
  if (v12 >= 1)
  {
    for (i = 0; i != v12; ++i)
    {
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", i), "doubleValue");
      v19 = v18;
      v20 = (CGColor *)objc_msgSend(a3, "objectAtIndex:", i);
      NumberOfComponents = CGColorGetNumberOfComponents(v20);
      if (NumberOfComponents >= 3)
      {
        v22 = NumberOfComponents;
        Components = CGColorGetComponents(v20);
        v24 = -[CUIPSDGradientColorStop initWithLocation:gradientColor:]([CUIPSDGradientColorStop alloc], "initWithLocation:gradientColor:", v19, *Components, Components[1], Components[2], 1.0);
        v25 = +[CUIPSDGradient getMidpointLocationFromArray:atIndex:withPolicy:](CUIPSDGradient, "getMidpointLocationFromArray:atIndex:withPolicy:", a5, i, v32);
        objc_msgSend(v16, "addObject:", v25);
        objc_msgSend(v33, "addObject:", v24);
        if (v22 != 3)
        {
          v26 = -[CUIPSDGradientOpacityStop initWithLocation:opacity:]([CUIPSDGradientOpacityStop alloc], "initWithLocation:opacity:", v19, Components[3]);
          objc_msgSend(v30, "addObject:", v25);
          objc_msgSend(v31, "addObject:", v26);
        }
      }
    }
  }
  v27 = -[CUIPSDGradientEvaluator initWithColorStops:colorMidpoints:opacityStops:opacityMidpoints:smoothingCoefficient:fillColor:dither:]([CUIPSDGradientEvaluator alloc], "initWithColorStops:colorMidpoints:opacityStops:opacityMidpoints:smoothingCoefficient:fillColor:dither:", v33, v16, v31, v30, 1, 100.0, 0.0, 0.0, 0.0, 1.0);

  return -[CUIPSDGradient initWithEvaluator:drawingAngle:gradientStyle:]([CUIPSDGradient alloc], "initWithEvaluator:drawingAngle:gradientStyle:", v27, v29, a6);
}

- (CUIPSDGradient)initWithEvaluator:(id)a3 drawingAngle:(double)a4 gradientStyle:(unsigned int)a5
{
  CUIPSDGradient *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CUIPSDGradient;
  v8 = -[CUIPSDGradient init](&v10, sel_init);
  if (v8)
  {
    v8->evaluator = (CUIPSDGradientEvaluator *)a3;
    v8->drawingAngle = a4;
    v8->gradientStyle = a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDGradient;
  -[CUIPSDGradient dealloc](&v3, sel_dealloc);
}

- (CUIPSDGradientEvaluator)evaluator
{
  return (CUIPSDGradientEvaluator *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEvaluator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (double)drawingAngle
{
  return self->drawingAngle;
}

- (void)setDrawingAngle:(double)a3
{
  self->drawingAngle = a3;
}

- (unsigned)gradientStyle
{
  return self->gradientStyle;
}

- (void)setGradientStyle:(unsigned int)a3
{
  self->gradientStyle = a3;
}

@end
