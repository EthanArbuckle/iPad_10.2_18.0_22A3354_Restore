@implementation DKInkThumbnailRenderer

+ (CGSize)sizeForDrawing:(id)a3 inSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  CGFloat v7;
  CGFloat x;
  CGFloat y;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGSize result;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  if (DKDrawingIsValid(v6))
  {
    objc_msgSend((id)objc_opt_class(), "scaleToFitDrawing:inSize:", v6, width, height);
    memset(&v17, 0, sizeof(v17));
    CGAffineTransformMakeScale(&v17, v7, v7);
    objc_msgSend(v6, "strokesFrame");
    v16 = v17;
    v20 = CGRectApplyAffineTransform(v19, &v16);
    x = v20.origin.x;
    y = v20.origin.y;
    v10 = v20.size.width;
    v11 = v20.size.height;
    v12 = fmax(CGRectGetWidth(v20), 0.0);
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = v10;
    v21.size.height = v11;
    v13 = fmax(CGRectGetHeight(v21), 0.0);
  }
  else
  {
    v12 = *MEMORY[0x24BDBF148];
    v13 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v14 = v12;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

+ (id)imageForDrawing:(id)a3 fittingInSize:(CGSize)a4 color:(id)a5 highFidelity:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  id v10;
  id v11;
  void *v12;

  v6 = a6;
  height = a4.height;
  width = a4.width;
  v10 = a5;
  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "imageForDrawing:fittingInSize:backingScale:color:highFidelity:", v11, v10, v6, width, height, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)imageForDrawing:(id)a3 fittingInSize:(CGSize)a4 backingScale:(double)a5 color:(id)a6 highFidelity:(BOOL)a7
{
  _BOOL4 v7;
  double height;
  double width;
  id v12;
  id v13;
  double v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;

  v7 = a7;
  height = a4.height;
  width = a4.width;
  v12 = a3;
  v13 = a6;
  if (a5 <= 0.0)
  {
    +[DKInkView windowBackingScaleFactor:](DKInkView, "windowBackingScaleFactor:", 0);
    a5 = v14;
  }
  if (!v7)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "dk_deviceSupportsGL") & 1) == 0)
  {

    goto LABEL_8;
  }
  v16 = +[DKInkView gpuAvailable](DKInkView, "gpuAvailable");

  if (!v16)
  {
LABEL_8:
    objc_msgSend((id)objc_opt_class(), "_imageForDrawingUsingCG:fittingInSize:displayScale:color:", v12, v13, width, height, a5);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend((id)objc_opt_class(), "_imageForDrawingUsingGL:fittingInSize:displayScale:color:", v12, v13, width, height, a5);
  v17 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v18 = (void *)v17;

  return v18;
}

+ (double)scaleToFitDrawing:(id)a3 inSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  CGFloat x;
  CGFloat y;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  CGRect v23;
  CGRect v24;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  objc_msgSend(v6, "canvasBounds");
  v8 = *MEMORY[0x24BDBF148];
  v9 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v10 = 1.0;
  if (v11 != *MEMORY[0x24BDBF148] || v7 != v9)
  {
    objc_msgSend(v6, "strokesFrame");
    if (v14 != v8 || v13 != v9)
    {
      objc_msgSend(v6, "strokesFrame");
      x = v23.origin.x;
      y = v23.origin.y;
      v18 = v23.size.width;
      v19 = v23.size.height;
      v20 = height / CGRectGetHeight(v23);
      v24.origin.x = x;
      v24.origin.y = y;
      v24.size.width = v18;
      v24.size.height = v19;
      v21 = width / CGRectGetWidth(v24);
      if (v20 < v21)
        v21 = v20;
      v10 = fmin(v21, 2.0);
    }
  }

  return v10;
}

+ (id)_imageForDrawingUsingCG:(id)a3 fittingInSize:(CGSize)a4 displayScale:(double)a5 color:(id)a6
{
  double height;
  double width;
  id v10;
  id v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat x;
  CGFloat y;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  id v20;
  CGContext *CurrentContext;
  void *v22;
  void *v23;
  double v25;
  _QWORD v26[7];
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGSize v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = a6;
  if (DKDrawingIsValid(v10))
  {
    objc_msgSend((id)objc_opt_class(), "scaleToFitDrawing:inSize:", v10, width, height);
    v13 = v12;
    memset(&v28, 0, sizeof(v28));
    CGAffineTransformMakeScale(&v28, v12, v12);
    objc_msgSend(v10, "strokesFrame");
    v27 = v28;
    v31 = CGRectApplyAffineTransform(v30, &v27);
    x = v31.origin.x;
    y = v31.origin.y;
    v16 = v31.size.width;
    v17 = v31.size.height;
    v25 = height;
    v18 = ceil(CGRectGetWidth(v31));
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = v16;
    v32.size.height = v17;
    v19 = ceil(CGRectGetHeight(v32));
    v20 = +[DKDrawing copyOfDrawing:toFitInBounds:](DKDrawing, "copyOfDrawing:toFitInBounds:", v10, 0.0, 0.0, v18, v19);
    v29.width = v18;
    v29.height = v19;
    UIGraphicsBeginImageContextWithOptions(v29, 0, a5);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(objc_retainAutorelease(v11), "CGColor"));
    v22 = (void *)objc_opt_class();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __83__DKInkThumbnailRenderer__imageForDrawingUsingCG_fittingInSize_displayScale_color___block_invoke;
    v26[3] = &__block_descriptor_56_e7_v24__08l;
    *(double *)&v26[4] = a5;
    *(CGFloat *)&v26[5] = v13;
    v26[6] = CurrentContext;
    objc_msgSend(v22, "_interpolateDrawing:inSize:displayScale:ellipseHandler:", v20, v26, width, v25, a5);
    UIGraphicsGetImageFromCurrentImageContext();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

void __83__DKInkThumbnailRenderer__imageForDrawingUsingCG_fittingInSize_displayScale_color___block_invoke(uint64_t a1, float32x4_t a2)
{
  float v3;
  double v4;
  double v5;
  unint64_t v6;
  CGRect v7;

  v6 = a2.i64[0];
  v3 = *(double *)(a1 + 32);
  v4 = DKRenderPointWidthForPoint(a2, v3);
  v5 = *(double *)(a1 + 40);
  if (v5 < 0.26)
    v5 = 0.26;
  v7.size.width = ClampToMinWidthCG(v5 * v4, 0.75);
  v7.origin.x = *(float *)&v6 - v7.size.width * 0.5;
  v7.origin.y = *((float *)&v6 + 1) - v7.size.width * 0.5;
  v7.size.height = v7.size.width;
  CGContextFillEllipseInRect(*(CGContextRef *)(a1 + 48), v7);
}

+ (void)_interpolateDrawing:(id)a3 inSize:(CGSize)a4 displayScale:(double)a5 ellipseHandler:(id)a6
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  float64x2_t v21;
  float64_t v22;
  float64x2_t v23;
  double v24;
  double v25;
  double v26;
  float64x2_t v27;
  float64_t v28;
  float64x2_t v29;
  double v30;
  double v31;
  double v32;
  float64x2_t v33;
  float64_t v34;
  float64x2_t v35;
  double v36;
  id v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  float64_t v42;
  float64_t v43;
  float64_t v44;
  float64_t v45;
  float64_t v46;
  float64_t v47;
  double v48;
  float64_t v49;
  float64_t v50;
  double v51;
  float64_t v52;
  double v53;
  _QWORD v54[4];
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a6;
  if (objc_msgSend(v7, "totalPoints") >= 1)
  {
    v37 = v7;
    objc_msgSend(v7, "strokes");
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (v40)
    {
      v39 = *(_QWORD *)v57;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v57 != v39)
            objc_enumerationMutation(obj);
          v41 = v9;
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * v9), "strokePoints");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "count");
          v12 = v11 - 2;
          if (v11 != 2)
          {
            v13 = 0;
            do
            {
              objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = v13 + 2;
              objc_msgSend(v10, "objectAtIndexedSubscript:", v13 + 2);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "objectAtIndexedSubscript:", v13 + 1);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "location");
              v52 = v18;
              objc_msgSend(v14, "location");
              v49 = v19;
              objc_msgSend(v14, "velocity");
              v45 = v20;
              objc_msgSend(v14, "force");
              v21.f64[0] = v45;
              v21.f64[1] = v22;
              v23.f64[0] = v52;
              v23.f64[1] = v49;
              *(_QWORD *)&v53 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v23), v21).u64[0];
              objc_msgSend(v16, "location");
              v50 = v24;
              objc_msgSend(v16, "location");
              v46 = v25;
              objc_msgSend(v16, "velocity");
              v43 = v26;
              objc_msgSend(v16, "force");
              v27.f64[0] = v43;
              v27.f64[1] = v28;
              v29.f64[0] = v50;
              v29.f64[1] = v46;
              *(_QWORD *)&v51 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v29), v27).u64[0];
              objc_msgSend(v17, "location");
              v47 = v30;
              objc_msgSend(v17, "location");
              v44 = v31;
              objc_msgSend(v17, "velocity");
              v42 = v32;
              objc_msgSend(v17, "force");
              v33.f64[0] = v42;
              v33.f64[1] = v34;
              v35.f64[0] = v47;
              v35.f64[1] = v44;
              *(_QWORD *)&v48 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v35), v33).u64[0];
              v54[0] = MEMORY[0x24BDAC760];
              v54[1] = 3221225472;
              v54[2] = __81__DKInkThumbnailRenderer__interpolateDrawing_inSize_displayScale_ellipseHandler___block_invoke;
              v54[3] = &unk_24E1B0CE0;
              v55 = v8;
              LODWORD(v36) = 1059761370;
              +[DKPointSmoothing _interpolateFromPoint:toPoint:withControlPoint:atUnitScale:emissionHandler:](DKPointSmoothing, "_interpolateFromPoint:toPoint:withControlPoint:atUnitScale:emissionHandler:", v54, v53, v51, v48, v36);

              v13 = v15;
            }
            while (v15 < v12);
          }

          v9 = v41 + 1;
        }
        while (v41 + 1 != v40);
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      }
      while (v40);
    }

    v7 = v37;
  }

}

uint64_t __81__DKInkThumbnailRenderer__interpolateDrawing_inSize_displayScale_ellipseHandler___block_invoke(uint64_t result, __n128 *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;

  if (a3)
  {
    v3 = a3;
    v5 = result;
    do
    {
      result = *(_QWORD *)(v5 + 32);
      if (result)
        result = (*(uint64_t (**)(__n128))(result + 16))(*a2);
      ++a2;
      --v3;
    }
    while (v3);
  }
  return result;
}

+ (CGPath)_newStrokedInterpolatedPathWithDrawing:(id)a3 inSize:(CGSize)a4 displayScale:(double)a5
{
  double height;
  double width;
  id v8;
  CGPath *Mutable;
  void *v10;
  _QWORD v12[6];

  height = a4.height;
  width = a4.width;
  v8 = a3;
  Mutable = CGPathCreateMutable();
  v10 = (void *)objc_opt_class();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __85__DKInkThumbnailRenderer__newStrokedInterpolatedPathWithDrawing_inSize_displayScale___block_invoke;
  v12[3] = &__block_descriptor_48_e7_v24__08l;
  *(double *)&v12[4] = a5;
  v12[5] = Mutable;
  objc_msgSend(v10, "_interpolateDrawing:inSize:displayScale:ellipseHandler:", v8, v12, width, height, a5);

  return Mutable;
}

double __85__DKInkThumbnailRenderer__newStrokedInterpolatedPathWithDrawing_inSize_displayScale___block_invoke(uint64_t a1, float32x4_t a2)
{
  float v3;
  float v4;
  double result;
  unint64_t v6;
  CGRect v7;

  v6 = a2.i64[0];
  v3 = *(double *)(a1 + 32);
  v4 = DKRenderPointWidthForPoint(a2, v3);
  v7.origin.y = (float)(*((float *)&v6 + 1) - (float)(v4 * 0.5));
  v7.size.height = v4;
  v7.origin.x = (float)(*(float *)&v6 - (float)(v4 * 0.5));
  v7.size.width = v7.size.height;
  CGPathAddEllipseInRect(*(CGMutablePathRef *)(a1 + 40), 0, v7);
  return result;
}

+ (void)_drawPath:(id)a3 atScale:(double)a4 inRect:(CGRect)a5 inkColor:(id)a6 backgroundColor:(id)a7 inContext:(CGContext *)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v16;
  id v17;
  double v18;
  double v19;
  id v20;
  CGRect v21;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v20 = a7;
  v16 = a6;
  v17 = a3;
  CGContextSaveGState(a8);
  if (v20)
  {
    objc_msgSend(v20, "set");
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    CGContextFillRect(a8, v21);
  }
  objc_msgSend(v17, "bounds");
  v19 = v18;
  CGContextScaleCTM(a8, a4, a4);
  CGContextTranslateCTM(a8, -(v19 + -10.0), 0.0);
  objc_msgSend(v16, "set");

  objc_msgSend(v17, "fill");
  CGContextRestoreGState(a8);

}

+ (id)_imageForDrawingUsingGL:(id)a3 fittingInSize:(CGSize)a4 displayScale:(double)a5 color:(id)a6
{
  double height;
  double width;
  id v10;
  id v11;
  CGFloat v12;
  double v13;
  CGFloat x;
  CGFloat y;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  DKOpenGLRenderer *v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = a6;
  if (+[DKGLUtilities gpuAvailable](DKGLUtilities, "gpuAvailable") && DKDrawingIsValid(v10))
  {
    objc_msgSend((id)objc_opt_class(), "scaleToFitDrawing:inSize:", v10, width, height);
    v13 = v12;
    memset(&v32, 0, sizeof(v32));
    CGAffineTransformMakeScale(&v32, v12, v12);
    objc_msgSend(v10, "strokesFrame");
    v31 = v32;
    v34 = CGRectApplyAffineTransform(v33, &v31);
    x = v34.origin.x;
    y = v34.origin.y;
    v16 = v34.size.width;
    v17 = v34.size.height;
    v18 = ceil(CGRectGetWidth(v34));
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = v16;
    v35.size.height = v17;
    v19 = ceil(CGRectGetHeight(v35));
    objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[DKGLUtilities createSharedGLContext](DKGLUtilities, "createSharedGLContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      +[DKGLUtilities setCurrentGLContext:](DKGLUtilities, "setCurrentGLContext:", v21);
    v22 = +[DKDrawing copyOfDrawing:toFitInBounds:](DKDrawing, "copyOfDrawing:toFitInBounds:", v10, 0.0, 0.0, v18, v19);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_opt_class();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __83__DKInkThumbnailRenderer__imageForDrawingUsingGL_fittingInSize_displayScale_color___block_invoke;
    v29[3] = &unk_24E1B0D28;
    v25 = v23;
    v30 = v25;
    objc_msgSend(v24, "_interpolateDrawing:inSize:displayScale:ellipseHandler:", v22, v29, v18, v19, a5);

    if (+[DKGLUtilities gpuAvailable](DKGLUtilities, "gpuAvailable"))
    {
      v26 = -[DKOpenGLRenderer initWithBounds:scale:bufferSize:sharedContext:]([DKOpenGLRenderer alloc], "initWithBounds:scale:bufferSize:sharedContext:", objc_msgSend(v25, "count"), 1, 0.0, 0.0, v18, v19, a5);
      -[DKOpenGLRenderer setLineWidthScale:](v26, "setLineWidthScale:", v13);
      -[DKOpenGLRenderer setInkColor:](v26, "setInkColor:", v11);
      -[DKOpenGLRenderer setDrawingEnabled:](v26, "setDrawingEnabled:", 0);
      -[DKOpenGLRenderer addPoints:withSegmentLength:](v26, "addPoints:withSegmentLength:", v25, 25);
      -[DKOpenGLRenderer setDrawingEnabled:](v26, "setDrawingEnabled:", 1);
      -[DKOpenGLRenderer redrawEntireDrawingImmediatelyWithLayeredBlending:](v26, "redrawEntireDrawingImmediatelyWithLayeredBlending:", 0);
      -[DKOpenGLRenderer snapshotImage](v26, "snapshotImage");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v27 = 0;
    }
    +[DKGLUtilities setCurrentGLContext:](DKGLUtilities, "setCurrentGLContext:", v20);

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

void __83__DKInkThumbnailRenderer__imageForDrawingUsingGL_fittingInSize_displayScale_color___block_invoke(uint64_t a1, int8x16_t a2)
{
  float v3;
  int8x16_t v4;
  void *v5;
  float64x2_t v6;
  uint64_t v7;
  float64x2_t v8;

  v3 = 1.0;
  if (*(float *)&a2.i32[2] < 3.0)
    v3 = *(float *)&a2.i32[2] / 3.0;
  v6 = vcvtq_f64_f32(*(float32x2_t *)a2.i8);
  v7 = 0;
  v4 = vextq_s8(a2, a2, 8uLL);
  *(float *)v4.i32 = v3;
  v8 = vcvtq_f64_f32(*(float32x2_t *)v4.i8);
  objc_msgSend(MEMORY[0x24BDD1968], "dk_valueWithRenderPoint:", &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

+ (BOOL)_drawDebugPatternInGLContext:(id)a3 inSize:(CGSize)a4
{
  double height;
  double width;
  GLuint Program;
  GLint v7;
  unsigned int v8;
  float v9;
  double v10;
  GLint UniformLocation;
  GLint v12;
  double v13;
  double v14;
  double v15;
  double v16;
  GLint v17;
  double v18;
  double v19;
  double v20;
  double v21;
  GLint v22;
  double v23;
  double v24;
  double v25;
  double v26;
  GLint v27;
  double v28;
  double v29;
  double v30;
  double v31;
  GLenum Error;
  GLfloat v34[4];
  GLfloat v35[4];
  GLfloat v36[4];
  GLfloat v[4];
  GLfloat value[4];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  GLint params;

  height = a4.height;
  width = a4.width;
  glViewport(0, 0, (int)a4.width, (int)a4.height);
  +[DKGLUtilities setCurrentClearColor](DKGLUtilities, "setCurrentClearColor");
  glClear(0x4000u);
  Program = glCreateProgram();
  glAttachShader(Program, +[DKGLUtilities compileShader:ofType:](DKGLUtilities, "compileShader:ofType:", CFSTR("color"), CFSTR("vert")));
  glAttachShader(Program, +[DKGLUtilities compileShader:ofType:](DKGLUtilities, "compileShader:ofType:", CFSTR("color"), CFSTR("frag")));
  glBindAttribLocation(Program, 0, "iPosition");
  glBindAttribLocation(Program, 1u, "iTexCoord");
  glLinkProgram(Program);
  params = 0;
  glGetProgramiv(Program, 0x8B82u, &params);
  v7 = params;
  if (params)
  {
    glUseProgram(Program);
    v40 = 0u;
    v41 = 0u;
    *(_OWORD *)value = 0u;
    v39 = 0u;
    *(float *)&v8 = width;
    v9 = height;
    *(float *)&v10 = v9;
    +[DKGLUtilities setProjectionMatrixForWidth:height:flipped:matrix:](DKGLUtilities, "setProjectionMatrixForWidth:height:flipped:matrix:", 1, value, COERCE_DOUBLE((unint64_t)v8), v10);
    UniformLocation = glGetUniformLocation(Program, "uModelViewProjection");
    glUniformMatrix4fv(UniformLocation, 1, 0, value);
    *(_OWORD *)v = xmmword_21DCC0820;
    v12 = glGetUniformLocation(Program, "uColor");
    glUniform4fv(v12, 1, v);
    LODWORD(v13) = 0;
    LODWORD(v14) = 0;
    *(float *)&v15 = *(float *)&v8 * 0.5;
    *(float *)&v16 = v9 * 0.5;
    +[DKGLUtilities drawQuadAtX:Y:width:height:](DKGLUtilities, "drawQuadAtX:Y:width:height:", v13, v14, v15, v16);
    *(_OWORD *)v36 = xmmword_21DCC0830;
    v17 = glGetUniformLocation(Program, "uColor");
    glUniform4fv(v17, 1, v36);
    LODWORD(v18) = 0;
    *(float *)&v19 = *(float *)&v8 * 0.5;
    *(float *)&v20 = *(float *)&v8 * 0.5;
    *(float *)&v21 = v9 * 0.5;
    +[DKGLUtilities drawQuadAtX:Y:width:height:](DKGLUtilities, "drawQuadAtX:Y:width:height:", v19, v18, v20, v21);
    *(_OWORD *)v35 = xmmword_21DCC0840;
    v22 = glGetUniformLocation(Program, "uColor");
    glUniform4fv(v22, 1, v35);
    LODWORD(v23) = 0;
    *(float *)&v24 = v9 * 0.5;
    *(float *)&v25 = *(float *)&v8 * 0.5;
    *(float *)&v26 = v9 * 0.5;
    +[DKGLUtilities drawQuadAtX:Y:width:height:](DKGLUtilities, "drawQuadAtX:Y:width:height:", v23, v24, v25, v26);
    *(_OWORD *)v34 = xmmword_21DCC0850;
    v27 = glGetUniformLocation(Program, "uColor");
    glUniform4fv(v27, 1, v34);
    *(float *)&v28 = *(float *)&v8 * 0.5;
    *(float *)&v29 = v9 * 0.5;
    *(float *)&v30 = *(float *)&v8 * 0.5;
    *(float *)&v31 = v9 * 0.5;
    +[DKGLUtilities drawQuadAtX:Y:width:height:](DKGLUtilities, "drawQuadAtX:Y:width:height:", v28, v29, v30, v31);
  }
  else
  {
    NSLog(CFSTR("Error linking color program"));
    Error = glGetError();
    if (Error)
      printf("glError: %04x caught at %s:%u\n", Error, "/Library/Caches/com.apple.xbs/Sources/DrawingKit/DrawingKit/Source/Shared/DKInkThumbnailRenderer.m", 449);
  }
  return v7 != 0;
}

@end
