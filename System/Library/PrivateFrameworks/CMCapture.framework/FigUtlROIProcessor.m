@implementation FigUtlROIProcessor

- (CGPoint)originalToRoi:(CGPoint)a3
{
  double v3;
  double v4;
  double v5;
  float64x2_t v6;
  double v7;
  CGPoint result;

  v6 = vaddq_f64(*(float64x2_t *)&self->_anon_90[64], vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)self->_anon_90, a3.x), *(float64x2_t *)&self->_anon_90[32], a3.y));
  v7 = vaddq_f64(*(float64x2_t *)&self->_anon_90[80], vmlaq_f64(vmulq_f64((float64x2_t)a3, *(float64x2_t *)&self->_anon_90[16]), *(float64x2_t *)&a3.y, *(float64x2_t *)&self->_anon_90[48])).f64[0];
  v3 = utlClamp(v6.f64[0] / v7);
  v4 = utlClamp(v6.f64[1] / v7);
  v5 = v3;
  result.y = v4;
  result.x = v5;
  return result;
}

- (CGPoint)originalToRoiPixels:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[FigUtlROIProcessor originalToRoi:](self, "originalToRoi:", a3.x / (double)(self->_originalWidth - 1), a3.y / (double)(self->_originalHeight - 1));
  v5 = v4 * (self->_roiInPixels.size.width + -1.0);
  v7 = v6 * (self->_roiInPixels.size.height + -1.0);
  result.y = v7;
  result.x = v5;
  return result;
}

- (CGPoint)roiToOriginal:(CGPoint)a3
{
  double v3;
  double v4;
  double v5;
  float64x2_t v6;
  double v7;
  CGPoint result;

  v6 = vaddq_f64((float64x2_t)self[1]._originalRectangle.size, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self[1].super.isa, a3.x), (float64x2_t)self[1]._roiInPixels.size, a3.y));
  v7 = vaddq_f64(*(float64x2_t *)&self[1]._orientation, vmlaq_f64(vmulq_f64((float64x2_t)a3, (float64x2_t)self[1]._roiInPixels.origin), *(float64x2_t *)&a3.y, (float64x2_t)self[1]._originalRectangle.origin)).f64[0];
  v3 = utlClamp(v6.f64[0] / v7);
  v4 = utlClamp(v6.f64[1] / v7);
  v5 = v3;
  result.y = v4;
  result.x = v5;
  return result;
}

- (CGPoint)roiToOriginalPixels:(CGPoint)a3
{
  CGFloat v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v3 = self->_roiInPixels.size.width + -1.0;
  v4 = self->_roiInPixels.size.height + -1.0;
  -[FigUtlROIProcessor roiToOriginal:](self, "roiToOriginal:", a3.x / v3, a3.y / v4);
  v6 = v3 * v5;
  v8 = v4 * v7;
  result.y = v8;
  result.x = v6;
  return result;
}

- (FigUtlROIProcessor)initWithWidth:(int)a3 height:(int)a4 pixelFormat:(unsigned int)a5
{
  FigUtlROIProcessor *v7;
  uint64_t PixelBuffer;
  FigM2MController *v9;
  FigM2MController *m2m;
  CGSize v11;
  FigUtlROIProcessor *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FigUtlROIProcessor;
  v7 = -[FigUtlROIProcessor init](&v14, sel_init);
  if (v7)
  {
    PixelBuffer = CreatePixelBuffer();
    v7->_pixelBuffer = (__CVBuffer *)PixelBuffer;
    if (!PixelBuffer
      || (v9 = (FigM2MController *)objc_alloc_init(MEMORY[0x1E0D08B00]),
          m2m = v7->_m2m,
          v7->_m2m = v9,
          m2m,
          !v7->_m2m))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v12 = 0;
      goto LABEL_6;
    }
    v11 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v7->_roiInPixels.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v7->_roiInPixels.size = v11;
    v7->_width = a3;
    v7->_height = a4;
  }
  v12 = v7;
LABEL_6:

  return v12;
}

- (void)dealloc
{
  __CVBuffer *pixelBuffer;
  objc_super v4;

  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    CVPixelBufferRelease(pixelBuffer);
    self->_pixelBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)FigUtlROIProcessor;
  -[FigUtlROIProcessor dealloc](&v4, sel_dealloc);
}

- (void)matrix:(float64x2_t *)a3@<X2> rectangle:(float64x2_t *)a4@<X8> scaleX:(float64_t)a5@<D0> scaleY:(float64_t)a6@<D1> inverse:(float64_t)a7@<D2>
{
  __n128 v25;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  double v37;
  double v38;
  uint64_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t *v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t v57;
  float64x2_t v58;
  float64x2_t v59;
  float64x2_t v60;
  float64x2_t v61;
  float64x2_t v62;
  float64x2_t v63;
  float64x2_t vars0;
  float64x2_t v65;

  v25.n128_u64[1] = 0;
  a4[4] = 0u;
  a4[5] = 0u;
  a4[2] = 0u;
  a4[3] = 0u;
  *a4 = 0u;
  a4[1] = 0u;
  if (a1)
  {
    v25.n128_f64[0] = a9;
    utlCreateTransformationDouble(a2, a4, v25, a10, 0.0, 0.0, 0.5, 0.5);
    v31 = a4[3];
    a21 = a4[2];
    a22 = v31;
    v32 = a4[5];
    a23 = a4[4];
    a24 = v32;
    v34 = a4[1];
    a19 = *a4;
    v33.f64[1] = a19.f64[1];
    a20 = v34;
    v33.f64[0] = a5;
    v34.f64[0] = a6;
    v35.f64[0] = a7;
    v36.f64[0] = a8;
    v37 = -utlTransformRectDouble(&a19, v33, v34, v35, v36);
    a17 = 0u;
    a18 = 0u;
    a15 = 0u;
    a16 = 0u;
    a13 = 0u;
    a14 = 0u;
    utlCreateTransformationDouble(1, &a13, (__n128)COERCE_UNSIGNED_INT64(1.0), 1.0, v37, -v38, 0.5, 0.5);
    v39 = 0;
    v46 = a13;
    v40 = a14;
    v47 = a15;
    v41 = a16;
    v48 = a17;
    v42 = a18;
    v43 = a4[3];
    v62 = a4[2];
    v63 = v43;
    v44 = a4[5];
    vars0 = a4[4];
    v65 = v44;
    v45 = a4[1];
    v60 = *a4;
    v61 = v45;
    a19 = 0u;
    a20 = 0u;
    a21 = 0u;
    a22 = 0u;
    a23 = 0u;
    a24 = 0u;
    *(_QWORD *)&v46.f64[1] = vextq_s8((int8x16_t)v46, (int8x16_t)v46, 8uLL).u64[0];
    *(_QWORD *)&v47.f64[1] = vextq_s8((int8x16_t)v47, (int8x16_t)v47, 8uLL).u64[0];
    *(_QWORD *)&v48.f64[1] = vextq_s8((int8x16_t)v48, (int8x16_t)v48, 8uLL).u64[0];
    do
    {
      v50 = *(float64x2_t *)((char *)&v60 + v39);
      v49 = *(float64x2_t *)((char *)&v60 + v39 + 16);
      v51 = (float64x2_t *)((char *)&a19 + v39);
      *v51 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v46, v50.f64[0]), v47, v50, 1), v48, v49.f64[0]);
      v51[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v40, v50), v41, v50, 1), v49, v42);
      v39 += 32;
    }
    while (v39 != 96);
    v52 = a22;
    a4[2] = a21;
    a4[3] = v52;
    v53 = a24;
    a4[4] = a23;
    a4[5] = v53;
    v54 = a20;
    *a4 = a19;
    a4[1] = v54;
    if (a3)
    {
      v55 = a4[3];
      a21 = a4[2];
      a22 = v55;
      v56 = a4[5];
      a23 = a4[4];
      a24 = v56;
      v57 = a4[1];
      a19 = *a4;
      a20 = v57;
      __invert_d3();
      v58 = v63;
      a3[2] = v62;
      a3[3] = v58;
      a3[4] = vars0;
      a3[5] = v65;
      v59 = v61;
      *a3 = v60;
      a3[1] = v59;
    }
  }
}

- (BOOL)processImage:(__CVBuffer *)a3 orientation:(int)a4 rect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v9;
  int v12;
  int v13;
  int v14;
  double v15;
  double v16;
  int v17;
  int v18;
  double v19;
  double v20;
  int v21;
  int v22;
  int v23;
  double v24;
  double v25;
  int v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  CGPoint v36;
  __int128 v37;
  float64x2_t v38;
  CGPoint v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  double v50;
  double v51;
  FigM2MController *m2m;
  __CVBuffer *pixelBuffer;
  BOOL v54;
  uint64_t v56;
  uint64_t v57;
  float64x2_t v58;
  double v59;
  double v60;
  float64x2_t v61;
  float64x2_t v62;
  float64x2_t v63;
  float64x2_t v64;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t v68;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t v73;
  CGPoint v74;
  CGSize v75;
  CGPoint v76;
  CGSize v77;
  __int128 v78;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = *(_QWORD *)&a4;
  v12 = CVPixelBufferGetWidth(a3);
  v13 = CVPixelBufferGetHeight(a3);
  v14 = v13;
  self->_originalWidth = v12;
  self->_originalHeight = v13;
  v15 = floor(width * (double)v12);
  v16 = floor(height * (double)v13);
  v17 = v12;
  v18 = v13;
  v19 = v15;
  v20 = v16;
  switch((int)v9)
  {
    case 1:
    case 3:
      goto LABEL_3;
    case 6:
    case 8:
      v17 = v13;
      v18 = v12;
      v19 = v16;
      v20 = v15;
LABEL_3:
      v21 = (int)v20;
      v22 = (int)v19;
      v23 = self->_width;
      v24 = 1.0;
      v25 = 1.0;
      if (v23 <= v22)
        v25 = (double)v23 / (double)v22;
      v26 = self->_height;
      if (v26 <= v21)
        v24 = (double)v26 / (double)v21;
      if (v25 < v24)
        v24 = v25;
      if (v24 < 0.25)
        goto LABEL_14;
      v58.f64[0] = v16;
      v58.f64[1] = v15;
      v77 = (CGSize)0;
      v78 = 0u;
      v75 = (CGSize)0;
      v76 = (CGPoint)0;
      v73 = 0u;
      v74 = (CGPoint)0;
      v72 = 0u;
      -[FigUtlROIProcessor matrix:rectangle:scaleX:scaleY:inverse:]((uint64_t)self, v9, &v73, &v67, x, y, width, height, v24 / (double)v23 * (double)v17, v24 / (double)v26 * (double)v18, v56, v57, v58, v61, v62, v63, v64, v65, v66,
        (float64x2_t)0,
        (float64x2_t)0,
        (float64x2_t)0,
        (float64x2_t)0,
        (float64x2_t)0);
      v27 = v70;
      v28 = v69;
      v29 = v70;
      *(float64x2_t *)&self->_anon_90[32] = v69;
      *(float64x2_t *)&self->_anon_90[48] = v27;
      v30 = v72;
      v31 = v71;
      v32 = v72;
      *(float64x2_t *)&self->_anon_90[64] = v71;
      *(float64x2_t *)&self->_anon_90[80] = v30;
      v33 = v68;
      v34 = v67;
      v35 = v68;
      *(float64x2_t *)self->_anon_90 = v67;
      *(float64x2_t *)&self->_anon_90[16] = v33;
      v36 = v76;
      self[1]._roiInPixels.size = v75;
      self[1]._originalRectangle.origin = v36;
      v37 = v78;
      self[1]._originalRectangle.size = v77;
      *(_OWORD *)&self[1]._orientation = v37;
      v38.f64[1] = v73.f64[1];
      v39 = v74;
      *(float64x2_t *)&self[1].super.isa = v73;
      self[1]._roiInPixels.origin = v39;
      v63 = v28;
      v64 = v29;
      v65 = v31;
      v66 = v32;
      v61 = v34;
      v62 = v35;
      v38.f64[0] = x;
      v28.f64[0] = y;
      v31.f64[0] = width;
      v29.f64[0] = height;
      v40 = utlTransformRectDouble(&v61, v38, v28, v31, v29);
      v42 = v41;
      v44 = v43;
      v46 = utlClamp(v45);
      v47 = utlClamp(v44);
      v48 = (double)self->_width;
      v49 = floor(v46 * v48);
      v50 = (double)self->_height;
      v51 = floor(v47 * v50);
      self->_roiInPixels.size.width = v49;
      self->_roiInPixels.size.height = v51;
      self->_roiInPixels.origin.x = 0.0;
      self->_roiInPixels.origin.y = 0.0;
      if (v49 <= v48 && v51 <= v50)
      {
        self->_originalRectangle.origin.x = x;
        self->_originalRectangle.origin.y = y;
        self->_originalRectangle.size.width = width;
        self->_originalRectangle.size.height = height;
        self->_orientation = v9;
        self->_roiRectangle.origin.x = v40;
        self->_roiRectangle.origin.y = v42;
        self->_roiRectangle.size.width = v46;
        self->_roiRectangle.size.height = v47;
        m2m = self->_m2m;
        pixelBuffer = self->_pixelBuffer;
        v54 = 1;
        if (!-[FigM2MController transform:srcRect:dst:dstRect:rotate:sync_m2m:](m2m, "transform:srcRect:dst:dstRect:rotate:sync_m2m:", a3, pixelBuffer, v9, 1, floor(x * (double)(v12 - 1)), floor(y * (double)(v14 - 1)), v60, v59, 0.0, 0.0))return v54;
      }
      fig_log_get_emitter();
LABEL_15:
      FigDebugAssert3();
      return 0;
    default:
LABEL_14:
      fig_log_get_emitter();
      goto LABEL_15;
  }
}

- (__n128)originalToRoiMatrix
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;

  v2 = *(_OWORD *)(a1 + 192);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(a2 + 48) = v2;
  v3 = *(_OWORD *)(a1 + 224);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 208);
  *(_OWORD *)(a2 + 80) = v3;
  result = *(__n128 *)(a1 + 144);
  v5 = *(_OWORD *)(a1 + 160);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

- (__n128)roiToOriginalMatrix
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;

  v2 = *(_OWORD *)(a1 + 288);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 272);
  *(_OWORD *)(a2 + 48) = v2;
  v3 = *(_OWORD *)(a1 + 320);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 304);
  *(_OWORD *)(a2 + 80) = v3;
  result = *(__n128 *)(a1 + 240);
  v5 = *(_OWORD *)(a1 + 256);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

- (CGRect)roiRectangle
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_roiRectangle.origin.x;
  y = self->_roiRectangle.origin.y;
  width = self->_roiRectangle.size.width;
  height = self->_roiRectangle.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (int)width
{
  return self->_width;
}

- (int)height
{
  return self->_height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_m2m, 0);
}

@end
