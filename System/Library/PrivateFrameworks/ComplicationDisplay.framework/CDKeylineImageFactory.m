@implementation CDKeylineImageFactory

+ (id)cornerKeylineWithDevice:(id)a3 corner:(unint64_t)a4 size:(CGSize)a5 innerCircleRadius:(double)a6 strokeWidth:(double)a7 filled:(BOOL)a8
{
  _BOOL8 v8;
  double height;
  double width;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;

  v8 = a8;
  height = a5.height;
  width = a5.width;
  v15 = a3;
  if (cornerKeylineWithDevice_corner_size_innerCircleRadius_strokeWidth_filled__onceToken != -1)
    dispatch_once(&cornerKeylineWithDevice_corner_size_innerCircleRadius_strokeWidth_filled__onceToken, &__block_literal_global_0);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu-%lu-(%f-%f)-%f-%f-%i"), objc_msgSend(v15, "sizeClass"), a4, *(_QWORD *)&width, *(_QWORD *)&height, *(_QWORD *)&a6, *(_QWORD *)&a7, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)cornerKeylineWithDevice_corner_size_innerCircleRadius_strokeWidth_filled__imageCache, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend((id)cornerKeylineWithDevice_corner_size_innerCircleRadius_strokeWidth_filled__imageCache, "objectForKeyedSubscript:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_cornerKeylineWithDevice:size:innerCircleRadius:strokeWidth:filled:", v15, v8, width, height, a6, a7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    switch(a4)
    {
      case 1uLL:
        v21 = v19;
        goto LABEL_12;
      case 2uLL:
        v22 = objc_retainAutorelease(v19);
        v23 = objc_msgSend(v22, "CGImage");
        objc_msgSend(v22, "scale");
        v24 = v22;
        v25 = v23;
        v26 = 4;
        goto LABEL_11;
      case 4uLL:
        v27 = objc_retainAutorelease(v19);
        v28 = objc_msgSend(v27, "CGImage");
        objc_msgSend(v27, "scale");
        v24 = v27;
        v25 = v28;
        v26 = 5;
        goto LABEL_11;
      case 8uLL:
        v29 = objc_retainAutorelease(v19);
        v30 = objc_msgSend(v29, "CGImage");
        objc_msgSend(v29, "scale");
        v24 = v29;
        v25 = v30;
        v26 = 1;
LABEL_11:
        v21 = (id)objc_msgSend(v24, "initWithCGImage:scale:orientation:", v25, v26);
LABEL_12:
        v18 = v21;
        break;
      default:
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%s corner argument expects that exactly one corner is specified"), "+[CDKeylineImageFactory cornerKeylineWithDevice:corner:size:innerCircleRadius:strokeWidth:filled:]");
        v18 = 0;
        break;
    }
    objc_msgSend((id)cornerKeylineWithDevice_corner_size_innerCircleRadius_strokeWidth_filled__imageCache, "setObject:forKeyedSubscript:", v18, v16);

  }
  return v18;
}

void __98__CDKeylineImageFactory_cornerKeylineWithDevice_corner_size_innerCircleRadius_strokeWidth_filled___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)cornerKeylineWithDevice_corner_size_innerCircleRadius_strokeWidth_filled__imageCache;
  cornerKeylineWithDevice_corner_size_innerCircleRadius_strokeWidth_filled__imageCache = v0;

}

+ (id)_cornerKeylineWithDevice:(id)a3 size:(CGSize)a4 innerCircleRadius:(double)a5 strokeWidth:(double)a6 filled:(BOOL)a7
{
  CGFloat height;
  CGFloat width;
  void *v9;
  void *v10;
  CGSize v12;

  height = a4.height;
  width = a4.width;
  +[CDKeylineImageFactory topLeftCornerShapeWithDevice:size:innerCircleRadius:strokeWidth:filled:](CDKeylineImageFactory, "topLeftCornerShapeWithDevice:size:innerCircleRadius:strokeWidth:filled:", a3, a7, a4.width, a4.height, a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.width = width;
  v12.height = height;
  UIGraphicsBeginImageContextWithOptions(v12, 0, 0.0);
  objc_msgSend(v9, "renderInContext:", UIGraphicsGetCurrentContext());
  UIGraphicsGetImageFromCurrentImageContext();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v10;
}

+ (id)topLeftCornerShapeWithDevice:(id)a3 size:(CGSize)a4 innerCircleRadius:(double)a5 strokeWidth:(double)a6 filled:(BOOL)a7
{
  const CGPath *v9;
  void *v10;
  id v11;
  id v12;

  v9 = (const CGPath *)objc_msgSend(a1, "_cornerPathWithDevice:size:innerCircleRadius:strokeWidth:", a3, a4.width, a4.height, a5);
  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPath:", v9);
  if (a7)
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "setFillColor:", objc_msgSend(v11, "CGColor"));

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v12, "CGColor"));

  objc_msgSend(v10, "setLineWidth:", a6);
  CGPathRelease(v9);
  return v10;
}

+ (CGPath)cornerPathWithDevice:(id)a3 corner:(unint64_t)a4 size:(CGSize)a5 innerCircleRadius:(double)a6
{
  CGFloat height;
  CGFloat width;
  CGPath *v9;
  CGFloat v10;
  CGFloat v11;
  __int128 v12;
  __int128 v13;
  CGPath *v14;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;

  height = a5.height;
  width = a5.width;
  v9 = (CGPath *)objc_msgSend(a1, "_cornerPathWithDevice:size:innerCircleRadius:strokeWidth:", a3, a5.width, a5.height, a6, 0.0);
  memset(&v18, 0, sizeof(v18));
  switch(a4)
  {
    case 1uLL:
      return v9;
    case 2uLL:
      CGAffineTransformMakeScale(&v18, -1.0, 1.0);
      v16 = v18;
      v10 = 0.0;
      v11 = width;
      goto LABEL_7;
    case 4uLL:
      CGAffineTransformMakeScale(&v18, 1.0, -1.0);
      v16 = v18;
      v11 = 0.0;
      goto LABEL_6;
    case 8uLL:
      CGAffineTransformMakeScale(&v18, -1.0, -1.0);
      v16 = v18;
      v11 = width;
LABEL_6:
      v10 = height;
LABEL_7:
      CGAffineTransformTranslate(&v17, &v16, v11, v10);
      *(_OWORD *)&v18.a = *(_OWORD *)&v17.a;
      *(_OWORD *)&v18.c = *(_OWORD *)&v17.c;
      v13 = *(_OWORD *)&v17.tx;
      break;
    default:
      v12 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)&v18.a = *MEMORY[0x24BDBD8B8];
      *(_OWORD *)&v18.c = v12;
      v13 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      break;
  }
  *(_OWORD *)&v18.tx = v13;
  v14 = (CGPath *)MEMORY[0x2199A9EFC](v9, &v18);
  CGPathRelease(v9);
  return v14;
}

+ (CGPath)_cornerPathWithDevice:(id)a3 size:(CGSize)a4 innerCircleRadius:(double)a5 strokeWidth:(double)a6
{
  double height;
  double v9;
  id v10;
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
  CGPath *Mutable;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  const CGPath *v30;
  id v31;
  double v33;
  double v34;
  double v35;
  long double v36;
  long double v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat width;
  _QWORD block[4];
  id v43;
  CGPath *v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  _QWORD aBlock[14];

  height = a4.height;
  v40 = a4.height;
  width = a4.width;
  v9 = a4.width;
  v10 = a3;
  objc_msgSend(v10, "screenBounds");
  v12 = v11 * 0.5;
  objc_msgSend(v10, "screenBounds");
  v14 = a6 * 0.5;
  v15 = a6 * 0.5 + v12;
  v16 = a6 * 0.5 + v13 * 0.5;
  v39 = v16 - (v15 - v9 - sqrt(-((v15 - v9) * a5) - (v15 - v9) * v16 + v16 * a5 + a5 * a5) * -1.41421356) + a5;
  v37 = atan2(v16 - v39, v15 - v9 + v39);
  v38 = v15
      - (v16
       - height
       - sqrt(-((v16 - height) * a5) - (v16 - height) * v15 + v15 * a5 + a5 * a5) * -1.41421356)
      + a5;
  v36 = atan2(v15 - v38, v16 - height + v38);
  objc_msgSend(v10, "screenCornerRadius");
  v18 = (v17 - a6 * 0.5) * 1.6;
  v34 = v18;
  objc_msgSend(v10, "screenCornerRadius");
  v20 = (v19 - a6 * 0.5) * 1.6;
  v35 = v20;
  Mutable = CGPathCreateMutable();
  v22 = (void *)MEMORY[0x24BEBD420];
  v33 = a6;
  v23 = v18 - a6;
  v24 = v20 - a6;
  objc_msgSend(v10, "screenCornerRadius");
  v26 = v25 - v14;
  objc_msgSend(v10, "screenCornerRadius");
  v28 = v27;

  objc_msgSend(v22, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 1, v14, v14, v23, v24, v26, v28 - v14);
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v30 = (const CGPath *)objc_msgSend(v29, "CGPath");

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__CDKeylineImageFactory__cornerPathWithDevice_size_innerCircleRadius_strokeWidth___block_invoke;
  aBlock[3] = &__block_descriptor_112_e17_v16__0__CGPath__8l;
  *(CGFloat *)&aBlock[4] = width;
  *(double *)&aBlock[5] = v39;
  *(double *)&aBlock[6] = v33;
  *(long double *)&aBlock[7] = v37;
  *(double *)&aBlock[8] = v15;
  *(double *)&aBlock[9] = v16;
  *(double *)&aBlock[10] = a5;
  *(long double *)&aBlock[11] = v36;
  *(double *)&aBlock[12] = v38;
  *(CGFloat *)&aBlock[13] = v40;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__CDKeylineImageFactory__cornerPathWithDevice_size_innerCircleRadius_strokeWidth___block_invoke_2;
  block[3] = &unk_24CF21310;
  v45 = v33;
  v46 = width;
  v47 = v39;
  v48 = v40;
  v49 = v38;
  v50 = v34;
  v51 = v35;
  v43 = _Block_copy(aBlock);
  v44 = Mutable;
  v31 = v43;
  CGPathApplyWithBlock(v30, block);
  CGPathCloseSubpath(Mutable);

  return Mutable;
}

void __82__CDKeylineImageFactory__cornerPathWithDevice_size_innerCircleRadius_strokeWidth___block_invoke(double *a1, CGMutablePathRef path)
{
  CGPathAddArc(path, 0, a1[4] - a1[5], a1[5], a1[5] - a1[6] * 0.5, -1.57079633, a1[7], 0);
  CGPathAddArc(path, 0, a1[8], a1[9], a1[10] + a1[6] * 0.5, a1[7] + -3.14159265, -1.57079633 - a1[11], 1);
  CGPathAddArc(path, 0, a1[12], a1[13] - a1[12], a1[12] - a1[6] * 0.5, a1[11], -3.14159265, 0);
}

void __82__CDKeylineImageFactory__cornerPathWithDevice_size_innerCircleRadius_strokeWidth___block_invoke_2(uint64_t a1, uint64_t a2)
{
  CGFloat *v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  _BOOL4 v8;
  double v9;
  double v10;

  v3 = *(CGFloat **)(a2 + 8);
  switch(*(_DWORD *)a2)
  {
    case 0:
      CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *v3, v3[1]);
      break;
    case 1:
      v4 = *(double *)(a1 + 48) * 0.5;
      v5 = *v3;
      v6 = v3[1];
      v7 = v6 == v4 && v5 <= *(double *)(a1 + 56) - *(double *)(a1 + 64);
      v8 = v5 == v4 && v6 <= *(double *)(a1 + 72) - *(double *)(a1 + 80);
      if (v7 || v8)
      {
        CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 40), 0, v5, v6);
        v5 = *v3;
        v6 = v3[1];
        v4 = *(double *)(a1 + 48) * 0.5;
      }
      v9 = *(double *)(a1 + 88) - v4;
      v10 = *(double *)(a1 + 96) - v4;
      if (v5 == v9 && v6 == v10)
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      break;
    case 2:
      CGPathAddQuadCurveToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *v3, v3[1], v3[2], v3[3]);
      break;
    case 3:
      CGPathAddCurveToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *v3, v3[1], v3[2], v3[3], v3[4], v3[5]);
      break;
    default:
      return;
  }
}

+ (id)heartKeylineWithDevice:(id)a3 outerRadius:(double)a4 innerRadius:(double)a5 sideCircleRadius:(double)a6 topCircleRadius:(double)a7 strokeWidth:(double)a8 filled:(BOOL)a9
{
  _BOOL8 v9;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v9 = a9;
  v16 = a3;
  if (heartKeylineWithDevice_outerRadius_innerRadius_sideCircleRadius_topCircleRadius_strokeWidth_filled__onceToken != -1)
    dispatch_once(&heartKeylineWithDevice_outerRadius_innerRadius_sideCircleRadius_topCircleRadius_strokeWidth_filled__onceToken, &__block_literal_global_12);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu-%f-%f-%f-%f-%f-%i"), objc_msgSend(v16, "sizeClass"), *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)heartKeylineWithDevice_outerRadius_innerRadius_sideCircleRadius_topCircleRadius_strokeWidth_filled__imageCache, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(a1, "_heartKeylineWithDevice:outerRadius:innerRadius:sideCircleRadius:topCircleRadius:strokeWidth:filled:", v16, v9, a4, a5, a6, a7, a8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)heartKeylineWithDevice_outerRadius_innerRadius_sideCircleRadius_topCircleRadius_strokeWidth_filled__imageCache, "setObject:forKeyedSubscript:", v19, v17);

  }
  objc_msgSend((id)heartKeylineWithDevice_outerRadius_innerRadius_sideCircleRadius_topCircleRadius_strokeWidth_filled__imageCache, "objectForKeyedSubscript:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __124__CDKeylineImageFactory_heartKeylineWithDevice_outerRadius_innerRadius_sideCircleRadius_topCircleRadius_strokeWidth_filled___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)heartKeylineWithDevice_outerRadius_innerRadius_sideCircleRadius_topCircleRadius_strokeWidth_filled__imageCache;
  heartKeylineWithDevice_outerRadius_innerRadius_sideCircleRadius_topCircleRadius_strokeWidth_filled__imageCache = v0;

}

+ (id)_heartKeylineWithDevice:(id)a3 outerRadius:(double)a4 innerRadius:(double)a5 sideCircleRadius:(double)a6 topCircleRadius:(double)a7 strokeWidth:(double)a8 filled:(BOOL)a9
{
  double v12;
  CGFloat v13;
  CGFloat v14;
  long double v15;
  long double v16;
  double v17;
  CGPath *Mutable;
  CGPath *v19;
  CGPath *v20;
  CGFloat v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  double radius;
  double v28;
  CGSize v30;

  v12 = a4 + a4;
  radius = a5 - a8 * 0.5;
  v13 = a4 - a8 * 0.5;
  v14 = a6 - a8 * 0.5;
  v28 = a8 * 0.5 + a7;
  v15 = a5 - a6;
  v16 = sqrt((a6 + a7) * (a6 + a7) - v15 * v15);
  v17 = atan2(v16, v15);
  Mutable = CGPathCreateMutable();
  v19 = CGPathCreateMutable();
  v20 = CGPathCreateMutable();
  v21 = v12 * 0.5;
  CGPathAddArc(v20, 0, v12 * 0.5, v12 * 0.5, v13, 0.0, 6.28318531, 1);
  CGPathCloseSubpath(v20);
  CGPathAddArc(v19, 0, v21, v21, radius, 0.0, 3.14159265, 0);
  CGPathAddArc(v19, 0, v21 - a5 + a6, v21, v14, 3.14159265, -v17, 0);
  CGPathAddArc(v19, 0, v21, v21 - v16, v28, 3.14159265 - v17, v17, 1);
  CGPathAddArc(v19, 0, v21 + a5 - a6, v21, v14, v17 + 3.14159265, 0.0, 0);
  CGPathCloseSubpath(v19);
  CGPathAddPath(Mutable, 0, v19);
  CGPathAddPath(Mutable, 0, v20);
  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPath:", Mutable);
  if (a9)
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v22, "setFillColor:", objc_msgSend(v23, "CGColor"));

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v22, "setStrokeColor:", objc_msgSend(v24, "CGColor"));

  objc_msgSend(v22, "setLineWidth:", a8);
  v30.width = v12;
  v30.height = v12;
  UIGraphicsBeginImageContextWithOptions(v30, 0, 0.0);
  objc_msgSend(v22, "renderInContext:", UIGraphicsGetCurrentContext());
  UIGraphicsGetImageFromCurrentImageContext();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  CGPathRelease(Mutable);
  CGPathRelease(v19);
  CGPathRelease(v20);

  return v25;
}

+ (id)heartKeylineWithDevice:(id)a3 outerRadius:(double)a4 innerRadius:(double)a5 sideComplicationDistance:(double)a6 topComplicationDistance:(double)a7 strokeWidth:(double)a8 filled:(BOOL)a9
{
  return (id)objc_msgSend(a1, "heartKeylineWithDevice:outerRadius:innerRadius:sideCircleRadius:topCircleRadius:strokeWidth:filled:", a3, a9, a4);
}

+ (id)smileKeylineWithDevice:(id)a3 outerRadius:(double)a4 innerRadius:(double)a5 angle:(double)a6 strokeWidth:(double)a7 filled:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a8;
  v14 = a3;
  if (smileKeylineWithDevice_outerRadius_innerRadius_angle_strokeWidth_filled__onceToken != -1)
    dispatch_once(&smileKeylineWithDevice_outerRadius_innerRadius_angle_strokeWidth_filled__onceToken, &__block_literal_global_15);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu-%f-%f-%f-%f-%i"), objc_msgSend(v14, "sizeClass"), *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)smileKeylineWithDevice_outerRadius_innerRadius_angle_strokeWidth_filled__imageCache, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(a1, "_smileKeylineWithDevice:outerRadius:innerRadius:angle:strokeWidth:filled:", v14, v8, a4, a5, a6, a7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)smileKeylineWithDevice_outerRadius_innerRadius_angle_strokeWidth_filled__imageCache, "setObject:forKeyedSubscript:", v17, v15);

  }
  objc_msgSend((id)smileKeylineWithDevice_outerRadius_innerRadius_angle_strokeWidth_filled__imageCache, "objectForKeyedSubscript:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __97__CDKeylineImageFactory_smileKeylineWithDevice_outerRadius_innerRadius_angle_strokeWidth_filled___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)smileKeylineWithDevice_outerRadius_innerRadius_angle_strokeWidth_filled__imageCache;
  smileKeylineWithDevice_outerRadius_innerRadius_angle_strokeWidth_filled__imageCache = v0;

}

+ (id)_smileKeylineWithDevice:(id)a3 outerRadius:(double)a4 innerRadius:(double)a5 angle:(double)a6 strokeWidth:(double)a7 filled:(BOOL)a8
{
  void *v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  CGSize v13;

  +[CDKeylineImageFactory smileShapeWithDevice:outerRadius:innerRadius:angle:strokeWidth:filled:](CDKeylineImageFactory, "smileShapeWithDevice:outerRadius:innerRadius:angle:strokeWidth:filled:", a3, a8, a4, a5, a6, a7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v13.width = v9;
  v13.height = v10;
  UIGraphicsBeginImageContextWithOptions(v13, 0, 0.0);
  objc_msgSend(v8, "renderInContext:", UIGraphicsGetCurrentContext());
  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v11;
}

+ (id)smileShapeWithDevice:(id)a3 outerRadius:(double)a4 innerRadius:(double)a5 angle:(double)a6 strokeWidth:(double)a7 filled:(BOOL)a8
{
  double v10;
  double v11;
  double v12;
  double v13;
  CGPath *Mutable;
  __double2 v15;
  double v16;
  __double2 v17;
  void *v18;
  id v19;
  id v20;
  CGFloat v22;
  double y;
  double v25;

  v10 = a4 - a5;
  v11 = (a4 - a5) * 0.5;
  v12 = (a4 + a5) * 0.5;
  v22 = a6 + 1.57079633;
  v13 = 1.57079633 - a6;
  Mutable = CGPathCreateMutable();
  v15 = __sincos_stret(v13);
  v25 = v11 + v12 * v15.__cosval + v11 + v12 * v15.__cosval;
  y = -(v12 * v15.__sinval - v10 * 0.5);
  CGPathAddArc(Mutable, 0, v25 * 0.5, y, a7 * 0.5 + a5, v22, v13, 1);
  v16 = -(v11 - v12 * v15.__sinval);
  CGPathAddArc(Mutable, 0, v25 * 0.5 + v12 * v15.__cosval, -(v16 - v12 * v15.__sinval), v11 - a7 * 0.5, v13 + 3.14159265, v13, 0);
  CGPathAddArc(Mutable, 0, v25 * 0.5, y, a4 - a7 * 0.5, v13, v22, 0);
  v17 = __sincos_stret(v22);
  CGPathAddArc(Mutable, 0, v25 * 0.5 + v12 * v17.__cosval, -(v16 - v12 * v17.__sinval), v11 - a7 * 0.5, v22, v22 + 3.14159265, 0);
  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBounds:", 0.0, 0.0, v25, a4 - v16);
  objc_msgSend(v18, "setPath:", Mutable);
  if (a8)
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v18, "setFillColor:", objc_msgSend(v19, "CGColor"));

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v18, "setStrokeColor:", objc_msgSend(v20, "CGColor"));

  objc_msgSend(v18, "setLineWidth:", a7);
  CGPathRelease(Mutable);
  return v18;
}

@end
