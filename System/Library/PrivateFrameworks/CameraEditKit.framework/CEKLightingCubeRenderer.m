@implementation CEKLightingCubeRenderer

- (CEKLightingCubeRenderer)initWithCube:(id)a3 appearance:(id)a4 components:(int64_t)a5
{
  id v9;
  id v10;
  CEKLightingCubeRenderer *v11;
  CEKLightingCubeRenderer *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CEKLightingCubeRenderer;
  v11 = -[CEKLightingCubeRenderer init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_cube, a3);
    objc_storeStrong((id *)&v12->_appearance, a4);
    v12->_components = a5;
  }

  return v12;
}

- (void)renderInContext:(CGContext *)a3 size:(CGSize)a4 scale:(double)a5 cornerRadius:(double)a6 stroke:(double)a7
{
  double v10;
  double v11;
  CGPath *v12;
  CGFloat *v13;
  int64_t v14;
  CGColorSpace *DeviceGray;
  CGColor *v16;
  CGGradient *v17;
  double v18;
  uint64_t v19;
  unint64_t v20;
  CGImage *Mask;
  CGImage *v22;
  CGPath *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGColor *v31;
  CGFloat Alpha;
  CGColor *CopyWithAlpha;
  CGImage *v34;
  CGImage *v35;
  CGGradient *v36;
  CGColorSpace *v37;
  CGColor *v38;
  CGPath *v39;
  CGPath *v40;
  CGFloat v42;
  CGFloat v43;
  _QWORD v44[9];
  _QWORD v45[9];
  _QWORD v46[8];
  _QWORD v47[8];
  CGFloat v48[2];
  CGFloat v49[8];
  CGFloat components[3];
  uint64_t v51;
  CGPoint v52;
  CGPoint v53;
  CGPoint v54;
  CGPoint v55;
  CGRect v56;
  CGRect v57;

  v51 = *MEMORY[0x1E0C80C00];
  v10 = a4.width - a7 * 0.5;
  v11 = a4.height - a7 * 0.5;
  v12 = -[CEKLightingCube pathForOutlineWithSize:cornerRadius:](self->_cube, "pathForOutlineWithSize:cornerRadius:", v10, v11, a6);
  v13 = (CGFloat *)MEMORY[0x1E0C9D538];
  v14 = self->_components;
  if ((v14 & 1) != 0)
  {
    DeviceGray = CGColorSpaceCreateDeviceGray();
    *(_OWORD *)components = xmmword_1B9877D50;
    v16 = CGColorCreate(DeviceGray, components);
    CGColorSpaceRelease(DeviceGray);
    CGContextSetFillColorWithColor(a3, v16);
    CGContextAddPath(a3, v12);
    CGContextFillPath(a3);
    CGContextBeginPath(a3);
    CGColorRelease(v16);
    v14 = self->_components;
  }
  v42 = v13[1];
  v43 = *v13;
  if ((v14 & 2) != 0)
  {
    CGContextAddPath(a3, v12);
    CGContextClip(a3);
    CGContextBeginPath(a3);
    v17 = -[CEKLightingCubeAppearance background](self->_appearance, "background");
    v52.y = v42;
    v52.x = v43;
    v54.x = v43;
    v54.y = v42;
    CGContextDrawRadialGradient(a3, v17, v52, 0.0, v54, v10 * 0.5, 3u);
    CGContextResetClip(a3);
    v14 = self->_components;
  }
  v18 = v11 / 6.0;
  if ((v14 & 4) != 0 && -[CEKLightingCubeAppearance verticalFillColor](self->_appearance, "verticalFillColor"))
  {
    v19 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __74__CEKLightingCubeRenderer_renderInContext_size_scale_cornerRadius_stroke___block_invoke;
    v47[3] = &unk_1E70A5098;
    v47[4] = self;
    *(double *)&v47[5] = v10;
    *(double *)&v47[6] = v11;
    *(double *)&v47[7] = v11 / 6.0;
    v20 = 1;
    Mask = CreateMask(1, v47, v10, v11, a5);
    v46[0] = v19;
    v46[1] = 3221225472;
    v46[2] = __74__CEKLightingCubeRenderer_renderInContext_size_scale_cornerRadius_stroke___block_invoke_2;
    v46[3] = &unk_1E70A5098;
    v46[4] = self;
    *(double *)&v46[5] = v10;
    *(double *)&v46[6] = v11;
    *(double *)&v46[7] = v11 / 6.0;
    v22 = CreateMask(1, v46, v10, v11, a5);
    do
    {
      v23 = -[CEKLightingCube pathForPlane:size:](self->_cube, "pathForPlane:size:", v20, v10, v11);
      -[CEKLightingCube intensityForPlane:](self->_cube, "intensityForPlane:", v20);
      v25 = v24;
      if (v20 <= 2)
      {
        -[CEKLightingCubeAppearance verticalFillFrontIntensity](self->_appearance, "verticalFillFrontIntensity");
        v25 = v25 * v26;
      }
      -[CEKLightingCubeAppearance verticalFillBackIntensity](self->_appearance, "verticalFillBackIntensity");
      if (v20 >= 3 && v27 != 0.0)
      {
        -[CEKLightingCubeAppearance verticalFillBackIntensity](self->_appearance, "verticalFillBackIntensity");
        v29 = v28;
        -[CEKLightingCubeAppearance verticalFillBackIntensity](self->_appearance, "verticalFillBackIntensity");
        v25 = 1.0 - v30 + v25 * v29;
      }
      v31 = -[CEKLightingCubeAppearance verticalFillColor](self->_appearance, "verticalFillColor");
      Alpha = CGColorGetAlpha(-[CEKLightingCubeAppearance verticalFillColor](self->_appearance, "verticalFillColor"));
      CopyWithAlpha = CGColorCreateCopyWithAlpha(v31, v25 * Alpha);
      CGContextSetFillColorWithColor(a3, CopyWithAlpha);
      v56.origin.x = v10 * -0.5;
      v56.origin.y = v11 * -0.5;
      v56.size.width = v10;
      v56.size.height = v11;
      CGContextClipToMask(a3, v56, Mask);
      v57.origin.x = v10 * -0.5;
      v57.origin.y = v11 * -0.5;
      v57.size.width = v10;
      v57.size.height = v11;
      CGContextClipToMask(a3, v57, v22);
      CGContextAddPath(a3, v23);
      CGContextFillPath(a3);
      CGContextBeginPath(a3);
      CGContextResetClip(a3);
      CGColorRelease(CopyWithAlpha);
      ++v20;
    }
    while (v20 != 5);
    CGImageRelease(Mask);
    CGImageRelease(v22);
  }
  if ((self->_components & 8) != 0)
  {
    if (-[CEKLightingCubeAppearance topMask](self->_appearance, "topMask")
      || -[CEKLightingCubeAppearance topFill](self->_appearance, "topFill")
      || -[CEKLightingCubeAppearance topGlow](self->_appearance, "topGlow"))
    {
      if (-[CEKLightingCubeAppearance topMask](self->_appearance, "topMask"))
      {
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __74__CEKLightingCubeRenderer_renderInContext_size_scale_cornerRadius_stroke___block_invoke_3;
        v45[3] = &unk_1E70A50C0;
        *(double *)&v45[5] = v10;
        *(double *)&v45[6] = v11;
        v45[4] = self;
        *(CGFloat *)&v45[7] = v43;
        *(CGFloat *)&v45[8] = v42;
        v34 = CreateMask(0, v45, v10, v11, a5);
      }
      else
      {
        v34 = 0;
      }
      -[CEKLightingCube points:forPlane:size:](self->_cube, "points:forPlane:size:", v49, 0, v10, v11);
      if (-[CEKLightingCubeAppearance topFill](self->_appearance, "topFill"))
        DrawPlaneFill(a3, v49, -[CEKLightingCubeAppearance topFill](self->_appearance, "topFill"), v34, v12, v10 * -0.5, v11 * -0.5, v10, v11);
      DrawPlaneGlow((uint64_t)a3, (uint64_t)v49, (uint64_t)-[CEKLightingCubeAppearance topGlow](self->_appearance, "topGlow"), (uint64_t)v34, (uint64_t)v12, 0, v18, v10 * -0.5, v11 * -0.5, v10, v11);
      CGImageRelease(v34);
    }
    if (-[CEKLightingCubeAppearance bottomMask](self->_appearance, "bottomMask")
      || -[CEKLightingCubeAppearance bottomFill](self->_appearance, "bottomFill")
      || -[CEKLightingCubeAppearance bottomOuterGlow](self->_appearance, "bottomOuterGlow")
      || -[CEKLightingCubeAppearance bottomInnerGlow](self->_appearance, "bottomInnerGlow"))
    {
      if (-[CEKLightingCubeAppearance bottomMask](self->_appearance, "bottomMask"))
      {
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __74__CEKLightingCubeRenderer_renderInContext_size_scale_cornerRadius_stroke___block_invoke_4;
        v44[3] = &unk_1E70A50C0;
        *(double *)&v44[5] = v10;
        *(double *)&v44[6] = v11;
        v44[4] = self;
        *(CGFloat *)&v44[7] = v43;
        *(CGFloat *)&v44[8] = v42;
        v35 = CreateMask(0, v44, v10, v11, a5);
      }
      else
      {
        v35 = 0;
      }
      -[CEKLightingCube points:forPlane:size:](self->_cube, "points:forPlane:size:", v49, 5, v10, v11);
      if (-[CEKLightingCubeAppearance bottomFill](self->_appearance, "bottomFill"))
        DrawPlaneFill(a3, v49, -[CEKLightingCubeAppearance bottomFill](self->_appearance, "bottomFill"), v35, v12, v10 * -0.5, v11 * -0.5, v10, v11);
      DrawPlaneGlow((uint64_t)a3, (uint64_t)v49, (uint64_t)-[CEKLightingCubeAppearance bottomOuterGlow](self->_appearance, "bottomOuterGlow"), (uint64_t)v35, (uint64_t)v12, 0, v18, v10 * -0.5, v11 * -0.5, v10, v11);
      DrawPlaneGlow((uint64_t)a3, (uint64_t)v49, (uint64_t)-[CEKLightingCubeAppearance bottomInnerGlow](self->_appearance, "bottomInnerGlow"), (uint64_t)v35, (uint64_t)v12, 6, -v18, v10 * -0.5, v11 * -0.5, v10, v11);
      CGImageRelease(v35);
    }
  }
  if ((self->_components & 0x10) != 0 && -[CEKLightingCubeAppearance topOver](self->_appearance, "topOver"))
  {
    CGContextAddPath(a3, -[CEKLightingCube pathForPlane:size:](self->_cube, "pathForPlane:size:", 0, v10, v11));
    CGContextClip(a3);
    CGContextBeginPath(a3);
    v36 = -[CEKLightingCubeAppearance topOver](self->_appearance, "topOver");
    v53.y = v42;
    v53.x = v43;
    v55.x = v43;
    v55.y = v42;
    CGContextDrawRadialGradient(a3, v36, v53, 0.0, v55, v10 * 0.5, 3u);
    CGContextResetClip(a3);
  }
  if ((self->_components & 0x20) != 0)
  {
    v37 = CGColorSpaceCreateDeviceGray();
    *(_OWORD *)v48 = xmmword_1B9877D60;
    v38 = CGColorCreate(v37, v48);
    v39 = -[CEKLightingCube centerShadowPathWithSize:width:](self->_cube, "centerShadowPathWithSize:width:", v10, v11, a7);
    CGContextAddPath(a3, v12);
    CGContextClip(a3);
    CGContextBeginPath(a3);
    CGContextSetFillColorWithColor(a3, v38);
    CGContextAddPath(a3, v39);
    CGContextFillPath(a3);
    CGContextBeginPath(a3);
    CGContextResetClip(a3);
    CGColorRelease(v38);
    CGColorSpaceRelease(v37);
    v40 = -[CEKLightingCube centerPathWithSize:](self->_cube, "centerPathWithSize:", v10, v11);
    CGContextAddPath(a3, v12);
    CGContextClip(a3);
    CGContextBeginPath(a3);
    CGContextSetLineWidth(a3, a7);
    CGContextSetStrokeColorWithColor(a3, -[CEKLightingCubeAppearance stroke](self->_appearance, "stroke"));
    CGContextAddPath(a3, v40);
    CGContextStrokePath(a3);
    CGContextBeginPath(a3);
    CGContextResetClip(a3);
    CGContextSetLineWidth(a3, a7);
    CGContextSetStrokeColorWithColor(a3, -[CEKLightingCubeAppearance stroke](self->_appearance, "stroke"));
    CGContextAddPath(a3, v12);
    CGContextStrokePath(a3);
    CGContextBeginPath(a3);
  }
}

void __74__CEKLightingCubeRenderer_renderInContext_size_scale_cornerRadius_stroke___block_invoke(uint64_t a1, uint64_t a2)
{
  double v4;
  uint64_t v5;
  _BYTE v6[64];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "points:forPlane:size:", v6, 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  v4 = *(double *)(a1 + 56);
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "topGlow");
  DrawPlaneGlow(a2, (uint64_t)v6, v5, 0, 0, 0, v4, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

void __74__CEKLightingCubeRenderer_renderInContext_size_scale_cornerRadius_stroke___block_invoke_2(uint64_t a1, CGContext *a2)
{
  CGColor *v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9[9];

  v9[8] = *(CGFloat *)MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "points:forPlane:size:", v9, 5, *(double *)(a1 + 40), *(double *)(a1 + 48));
  v4 = (CGColor *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "bottomFill");
  v5 = *MEMORY[0x1E0C9D628];
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  DrawPlaneFill(a2, v9, v4, 0, 0, *MEMORY[0x1E0C9D628], v6, v7, v8);
  DrawPlaneGlow((uint64_t)a2, (uint64_t)v9, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "bottomOuterGlow"), 0, 0, 0, *(double *)(a1 + 56), v5, v6, v7, v8);
}

void __74__CEKLightingCubeRenderer_renderInContext_size_scale_cornerRadius_stroke___block_invoke_3(uint64_t a1, CGContext *a2)
{
  CGFloat v4;
  CGGradient *v5;
  CGPoint v6;

  v4 = *(double *)(a1 + 40) * 0.5;
  v5 = (CGGradient *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "topMask");
  v6 = *(CGPoint *)(a1 + 56);
  CGContextDrawRadialGradient(a2, v5, v6, 0.0, v6, v4, 3u);
}

void __74__CEKLightingCubeRenderer_renderInContext_size_scale_cornerRadius_stroke___block_invoke_4(uint64_t a1, CGContext *a2)
{
  CGFloat v4;
  CGGradient *v5;
  CGPoint v6;

  v4 = *(double *)(a1 + 40) * 0.5;
  v5 = (CGGradient *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "bottomMask");
  v6 = *(CGPoint *)(a1 + 56);
  CGContextDrawRadialGradient(a2, v5, v6, 0.0, v6, v4, 3u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearance, 0);
  objc_storeStrong((id *)&self->_cube, 0);
}

@end
