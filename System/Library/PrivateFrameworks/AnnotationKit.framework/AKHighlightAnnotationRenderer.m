@implementation AKHighlightAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  id v4;
  __int128 v5;
  double width;
  unint64_t v7;
  unint64_t v8;
  double height;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[5];
  uint64_t v15;
  CGRect *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  CGRect result;

  v4 = a3;
  v15 = 0;
  v16 = (CGRect *)&v15;
  v17 = 0x4010000000;
  v18 = &unk_22909F2DD;
  v5 = *(_OWORD *)(MEMORY[0x24BDBF070] + 16);
  v19 = *MEMORY[0x24BDBF070];
  v20 = v5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_229042034;
  v14[3] = &unk_24F1A7FE0;
  v14[4] = &v15;
  objc_msgSend(a1, "_enumerateQuadPathsOfAnnotation:applyStyle:handler:", v4, 1, v14);
  if (CGRectIsNull(v16[1]))
  {
    width = 1.0;
    *(double *)&v7 = -10000.0;
    *(double *)&v8 = -10000.0;
    height = 1.0;
  }
  else
  {
    v7 = *(unint64_t *)&v16[1].origin.x;
    v8 = *(unint64_t *)&v16[1].origin.y;
    width = v16[1].size.width;
    height = v16[1].size.height;
  }
  _Block_object_dispose(&v15, 8);

  v10 = *(double *)&v7;
  v11 = *(double *)&v8;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x24BDBF148];
  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];

  v7 = a5;
  v10 = a3;
  v11 = a6;
  CGContextSaveGState(a4);
  objc_msgSend(a1, "_transformContextToModelCoordinates:forAnnotation:forDisplay:pageControllerOrNil:", a4, v10, v7, v11);

  objc_msgSend(v10, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v10, "color");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v13, "CGColor"));

  }
  CGContextSetBlendMode(a4, kCGBlendModeMultiply);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_2290421B0;
  v14[3] = &unk_24F1A8000;
  v14[4] = a4;
  objc_msgSend(a1, "_enumerateQuadPathsOfAnnotation:applyStyle:handler:", v10, 1, v14);
  CGContextRestoreGState(a4);

}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  return 0;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_2290422C4;
  v9[3] = &unk_24F1A8028;
  v9[4] = &v10;
  *(CGFloat *)&v9[5] = x;
  *(CGFloat *)&v9[6] = y;
  objc_msgSend(a1, "_enumerateQuadPathsOfAnnotation:applyStyle:handler:", v7, 0, v9);
  LOBYTE(a1) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)a1;
}

+ (CGRect)_rectForQuad:(AKQuadrilateral *)a3 rotationAngle:(double *)a4
{
  double y;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  if (a4)
    *a4 = atan2(a3->var3.y - a3->var0.y, a3->var3.x - a3->var0.x);
  y = a3->var0.y;
  v6 = sqrt((a3->var3.y - y) * (a3->var3.y - y) + (a3->var3.x - a3->var0.x) * (a3->var3.x - a3->var0.x));
  v7 = sqrt((a3->var1.y - y) * (a3->var1.y - y) + (a3->var0.x - a3->var1.x) * (a3->var0.x - a3->var1.x));
  v8 = 0.0;
  v9 = 0.0;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

+ (double)_highlightOutsetFactor
{
  return 0.1;
}

+ (void)_enumerateQuadPathsOfAnnotation:(id)a3 applyStyle:(BOOL)a4 handler:(id)a5
{
  _BOOL4 v6;
  id v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  CGFloat x;
  double v18;
  CGFloat y;
  double v20;
  CGFloat width;
  double v22;
  CGFloat v23;
  double Height;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  uint64_t v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGPathRef v34;
  const CGPath *v35;
  uint64_t (*v36)(_QWORD *, CGAffineTransform *, CGPathRef);
  char v37;
  CGFloat MidY;
  uint64_t v39;
  CGAffineTransform v40;
  CGAffineTransform transform;
  CGAffineTransform v42;
  __int128 v43;
  CGFloat angle[7];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v6 = a4;
  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v8, "quadPoints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v47;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v47 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v14);
        v45 = 0u;
        memset(&angle[1], 0, 48);
        if (v15)
          objc_msgSend(v15, "quadrilateralValue");
        angle[0] = 0.0;
        v42 = *(CGAffineTransform *)&angle[1];
        v43 = v45;
        objc_msgSend(a1, "_rectForQuad:rotationAngle:", &v42, angle);
        x = v16;
        y = v18;
        width = v20;
        v23 = v22;
        if (!v6)
          goto LABEL_18;
        if (objc_msgSend(v8, "style") == 1)
        {
          v52.origin.x = x;
          v52.origin.y = y;
          v52.size.width = width;
          v52.size.height = v23;
          Height = CGRectGetHeight(v52);
          objc_msgSend(a1, "_highlightOutsetFactor");
          v26 = -(Height * v25);
          v53.origin.x = x;
          v53.origin.y = y;
          v53.size.width = width;
          v53.size.height = v23;
          v54 = CGRectInset(v53, v26, v26);
          x = v54.origin.x;
          y = v54.origin.y;
          width = v54.size.width;
          v27 = v54.size.height;
          goto LABEL_19;
        }
        if (objc_msgSend(v8, "style") == 2 || objc_msgSend(v8, "style") == 3)
        {
          v55.origin.x = x;
          v55.origin.y = y;
          v55.size.width = width;
          v55.size.height = v23;
          v28 = CGRectGetHeight(v55) * 0.08;
          if (v28 >= 1.0)
            v27 = v28;
          else
            v27 = 1.0;
          v29 = objc_msgSend(v8, "style");
          v30 = x;
          v31 = y;
          v32 = width;
          v33 = v23;
          if (v29 == 2)
          {
            width = CGRectGetWidth(*(CGRect *)&v30);
          }
          else
          {
            MidY = CGRectGetMidY(*(CGRect *)&v30);
            v57.origin.x = x;
            v57.origin.y = y;
            v57.size.width = width;
            v57.size.height = v23;
            width = CGRectGetWidth(v57);
            y = MidY;
          }
        }
        else
        {
LABEL_18:
          v27 = v23;
        }
LABEL_19:
        memset(&transform, 0, sizeof(transform));
        CGAffineTransformMakeTranslation(&v42, angle[1], angle[2]);
        transform = v42;
        v40 = v42;
        CGAffineTransformRotate(&v42, &v40, angle[0]);
        transform = v42;
        v56.origin.x = x;
        v56.origin.y = y;
        v56.size.width = width;
        v56.size.height = v27;
        v34 = CGPathCreateWithRect(v56, &transform);
        v35 = v34;
        if (v9)
        {
          v36 = (uint64_t (*)(_QWORD *, CGAffineTransform *, CGPathRef))v9[2];
          v42 = *(CGAffineTransform *)&angle[1];
          v43 = v45;
          v37 = v36(v9, &v42, v34);
          if (!v35)
            goto LABEL_22;
LABEL_21:
          CGPathRelease(v35);
          goto LABEL_22;
        }
        v37 = 0;
        if (v34)
          goto LABEL_21;
LABEL_22:
        if ((v37 & 1) != 0)
          goto LABEL_29;
        ++v14;
      }
      while (v12 != v14);
      v39 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      v12 = v39;
    }
    while (v39);
  }
LABEL_29:

}

@end
