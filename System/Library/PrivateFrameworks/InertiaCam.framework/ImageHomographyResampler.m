@implementation ImageHomographyResampler

- (ImageHomographyResampler)init
{
  objc_super v3;

  self->homographyMatrix[0] = 1.0;
  self->homographyMatrix[1] = 0.0;
  self->homographyMatrix[2] = 0.0;
  self->homographyMatrix[3] = 0.0;
  self->homographyMatrix[4] = 1.0;
  self->homographyMatrix[5] = 0.0;
  self->homographyMatrix[6] = 0.0;
  self->homographyMatrix[7] = 0.0;
  self->homographyMatrix[8] = 1.0;
  v3.receiver = self;
  v3.super_class = (Class)ImageHomographyResampler;
  return -[ImageHomographyResampler init](&v3, sel_init);
}

- (void)setHomographyMatrix:(double *)a3
{
  uint64_t i;

  for (i = 0; i != 9; ++i)
    self->homographyMatrix[i] = a3[i];
}

- (CGImage)ResampleCGImage:(CGImage *)a3 clipToRect:(CGRect)a4 outputSize:(CGSize)a5
{
  double height;
  double width;
  double v7;
  CGFloat v8;
  double y;
  CGFloat x;
  __int16 BitmapInfo;
  int BytesPerRow;
  CGDataProvider *DataProvider;
  const UInt8 *BytePtr;
  size_t v17;
  size_t v18;
  uint64_t v19;
  __CVBuffer *v20;
  unsigned int *v21;
  unsigned int v22;
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
  double v33;
  double v34;
  double v35;
  uint64_t i;
  float v38;
  unint64_t v39;
  double *v40;
  float v41;
  float v42;
  float v43;
  float v44;
  BOOL v45;
  int v46;
  int v47;
  size_t v48;
  char *v49;
  size_t v50;
  int v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  int v61;
  int v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  float v69;
  float v70;
  float v72;
  float v74;
  float v75;
  int v76;
  int v77;
  float v78;
  float v79;
  int v80;
  int v82;
  const UInt8 *v84;
  const UInt8 *v85;
  const UInt8 *v86;
  const UInt8 *v87;
  const UInt8 *v88;
  const UInt8 *v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  int v96;
  float v97;
  float v98;
  int v99;
  int v100;
  char *v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  int v106;
  float v107;
  float v108;
  int v109;
  int v110;
  CGDataProvider *v111;
  CGColorSpace *ColorSpace;
  CGBitmapInfo v113;
  CGImage *v114;
  size_t BitsPerPixel;
  const __CFData *cf;
  CGImageRef image;
  _DWORD v119[9];
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  uint64_t v129;

  height = a5.height;
  width = a5.width;
  v7 = a4.size.height;
  v8 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v129 = *MEMORY[0x1E0C80C00];
  BitmapInfo = CGImageGetBitmapInfo(a3);
  BitsPerPixel = CGImageGetBitsPerPixel(a3);
  BytesPerRow = CGImageGetBytesPerRow(a3);
  DataProvider = CGImageGetDataProvider(a3);
  cf = CGDataProviderCopyData(DataProvider);
  BytePtr = CFDataGetBytePtr(cf);
  v17 = CGImageGetWidth(a3);
  image = a3;
  v18 = CGImageGetHeight(a3);
  v19 = operator new();
  *(_OWORD *)v19 = 0u;
  *(_OWORD *)(v19 + 16) = 0u;
  *(_OWORD *)(v19 + 32) = 0u;
  *(_OWORD *)(v19 + 48) = 0u;
  sub_1D4D98AEC((void **)v19, (unint64_t)width, (unint64_t)height, (void *)4);
  v20 = *(__CVBuffer **)(v19 + 48);
  if (v20)
  {
    CVPixelBufferLockBaseAddress(v20, 0);
    v21 = (unsigned int *)(v19 + 56);
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 + 1, v21));
    *(_QWORD *)v19 = (char *)CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(v19 + 48), 0)
                   + *(_QWORD *)(v19 + 40);
  }
  v23 = self->homographyMatrix[7];
  v24 = self->homographyMatrix[8];
  v25 = self->homographyMatrix[4];
  v26 = self->homographyMatrix[5];
  v27 = self->homographyMatrix[6];
  v28 = v25 * v24 - v23 * v26;
  v29 = self->homographyMatrix[0];
  v30 = self->homographyMatrix[1];
  v32 = self->homographyMatrix[2];
  v31 = self->homographyMatrix[3];
  v33 = v23 * v32 - v30 * v24;
  v120 = v28;
  v121 = v33;
  v34 = v30 * v26 - v25 * v32;
  v122 = v34;
  v35 = v33 * v31 + v29 * v28 + v27 * v34;
  if (v35 >= 2.22044605e-16 || v35 <= -2.22044605e-16)
  {
    v120 = v28 / v35;
    v121 = v33 / v35;
    v122 = v34 / v35;
    v123 = (v27 * v26 - v31 * v24) / v35;
    v124 = (v29 * v24 - v27 * v32) / v35;
    v125 = (v31 * v32 - v29 * v26) / v35;
    v126 = (v31 * v23 - v27 * v25) / v35;
    v127 = (v27 * v30 - v29 * v23) / v35;
    v128 = (v29 * v25 - v31 * v30) / v35;
  }
  for (i = 0; i != 9; ++i)
  {
    v38 = *(&v120 + i);
    *(float *)&v119[i] = v38;
  }
  puts("### resampling with homography:");
  v39 = 0;
  do
  {
    v40 = (double *)(&self->super.isa + v39);
    v41 = v40[1];
    v42 = v40[2];
    v43 = v40[3];
    printf("%12.6f %12.6f %12.6f\n", v41, v42, v43);
    v45 = v39 >= 6;
    v39 += 3;
  }
  while (!v45);
  v46 = (int)y;
  v47 = (int)(v7 + (double)(int)y);
  v48 = *(_QWORD *)(v19 + 24);
  if ((int)y < v47)
  {
    v49 = *(char **)v19;
    v50 = BitsPerPixel >> 3;
    v51 = (int)(v8 + (double)(int)x);
    v52 = *(float *)v119;
    v53 = *(float *)&v119[1];
    v54 = *(float *)&v119[2];
    v55 = *(float *)&v119[3];
    v56 = *(float *)&v119[4];
    v57 = *(float *)&v119[5];
    v58 = *(float *)&v119[6];
    v59 = *(float *)&v119[7];
    v60 = *(float *)&v119[8];
    v61 = v17 - 1;
    v62 = v18 - 1;
    v63 = (int)x;
    v64 = *(char **)v19;
    v65 = v46;
    do
    {
      if ((int)v63 < v51)
      {
        v66 = v51 - v63;
        v67 = v64;
        v68 = v63;
        do
        {
          v69 = v60 + (float)((float)(v59 * (float)(int)v65) + (float)(v58 * (float)(int)v68));
          v70 = (float)(v54 + (float)((float)(v53 * (float)(int)v65) + (float)(v52 * (float)(int)v68))) / v69;
          if (v70 >= 0.0 && v70 < (float)v17)
          {
            v72 = (float)(v57 + (float)((float)(v56 * (float)(int)v65) + (float)(v55 * (float)(int)v68))) / v69;
            if (v72 >= 0.0 && v72 < (float)v18)
            {
              v74 = v70 + -0.5;
              v75 = v72 + -0.5;
              if (v74 < 0.0)
                v74 = 0.0;
              if (v75 < 0.0)
                v75 = 0.0;
              v76 = (int)v74;
              v77 = (int)v75;
              v78 = v74 - (float)(int)v74;
              v79 = v75 - (float)(int)v75;
              if (v61 > v76)
                v80 = v76 + 1;
              else
                v80 = v17 - 1;
              if (v76 >= (int)v17 && v61 <= v76)
                v76 = v17 - 1;
              if (v62 > v77)
                v82 = v77 + 1;
              else
                v82 = v18 - 1;
              if (v77 >= (int)v18 && v62 <= v77)
                v77 = v18 - 1;
              v84 = &BytePtr[v77 * (uint64_t)BytesPerRow];
              v85 = &v84[v76 * (uint64_t)(int)v50];
              v86 = &v84[v80 * (uint64_t)(int)v50];
              v87 = &BytePtr[v82 * (uint64_t)BytesPerRow];
              v88 = &v87[v76 * (uint64_t)(int)v50];
              v89 = &v87[v80 * (uint64_t)(int)v50];
              v90 = (float)(1.0 - v78) * (float)(1.0 - v79);
              v91 = v78 * (float)(1.0 - v79);
              v92 = v79 * (float)(1.0 - v78);
              v93 = v78 * v79;
              if ((BitmapInfo & 0x4000) != 0)
              {
                LOBYTE(v79) = v85[1];
                LOBYTE(v44) = v86[1];
                LOBYTE(v8) = v88[1];
                *(float *)&v102 = (float)LODWORD(v8);
                LOBYTE(x) = v89[1];
                *(float *)&v103 = (float)LODWORD(x);
                *(float *)&v104 = v91 * (float)LODWORD(v44);
                *(float *)&v105 = (float)((float)((float)(*(float *)&v104 + (float)((float)LODWORD(v79) * v90))
                                                + (float)(*(float *)&v102 * v92))
                                        + (float)(*(float *)&v103 * v93))
                                + 0.5;
                v106 = (int)*(float *)&v105;
                LOBYTE(v105) = v85[2];
                LOBYTE(v104) = v86[2];
                LOBYTE(v102) = v88[2];
                *(float *)&v8 = (float)v102;
                LOBYTE(v103) = v89[2];
                *(float *)&x = (float)v103;
                v107 = v91 * (float)v104;
                v108 = (float)((float)((float)(v107 + (float)((float)v105 * v90)) + (float)(*(float *)&v8 * v92))
                             + (float)(*(float *)&x * v93))
                     + 0.5;
                v109 = (int)v108;
                if (v106 >= 255)
                  LOBYTE(v106) = -1;
                if (v109 >= 255)
                  LOBYTE(v109) = -1;
                LOBYTE(v108) = v85[3];
                LOBYTE(v107) = v86[3];
                v44 = (float)LODWORD(v107);
                LOBYTE(v8) = v88[3];
                *(float *)&v8 = (float)LODWORD(v8);
                LOBYTE(x) = v89[3];
                *(float *)&x = (float)LODWORD(x);
                v110 = (int)(float)((float)((float)((float)((float)(v91 * v44) + (float)((float)LODWORD(v108) * v90))
                                                  + (float)(*(float *)&v8 * v92))
                                          + (float)(*(float *)&x * v93))
                                  + 0.5);
                v67[1] = v106;
                if (v110 >= 255)
                  LOBYTE(v110) = -1;
                v67[2] = v109;
                v67[3] = v110;
                v101 = v67;
              }
              else
              {
                LOBYTE(v79) = v85[2];
                LOBYTE(v44) = v86[2];
                LOBYTE(v8) = v88[2];
                *(float *)&v8 = (float)LODWORD(v8);
                LOBYTE(x) = v89[2];
                *(float *)&x = (float)LODWORD(x);
                v94 = v91 * (float)LODWORD(v44);
                v95 = (float)((float)((float)(v94 + (float)((float)LODWORD(v79) * v90)) + (float)(*(float *)&v8 * v92))
                            + (float)(*(float *)&x * v93))
                    + 0.5;
                v96 = (int)v95;
                if ((int)v95 >= 255)
                  LOBYTE(v96) = -1;
                v67[2] = v96;
                LOBYTE(v95) = v85[1];
                LOBYTE(v94) = v86[1];
                LOBYTE(v8) = v88[1];
                *(float *)&v8 = (float)LODWORD(v8);
                LOBYTE(x) = v89[1];
                *(float *)&x = (float)LODWORD(x);
                v97 = v91 * (float)LODWORD(v94);
                v98 = (float)((float)((float)(v97 + (float)((float)LODWORD(v95) * v90)) + (float)(*(float *)&v8 * v92))
                            + (float)(*(float *)&x * v93))
                    + 0.5;
                v99 = (int)v98;
                if ((int)v98 >= 255)
                  LOBYTE(v99) = -1;
                v67[1] = v99;
                LOBYTE(v98) = *v85;
                LOBYTE(v97) = *v86;
                v44 = (float)LODWORD(v97);
                LOBYTE(v8) = *v88;
                *(float *)&v8 = (float)LODWORD(v8);
                LOBYTE(x) = *v89;
                *(float *)&x = (float)LODWORD(x);
                v100 = (int)(float)((float)((float)((float)((float)(v91 * v44) + (float)((float)LODWORD(v98) * v90))
                                                  + (float)(*(float *)&v8 * v92))
                                          + (float)(*(float *)&x * v93))
                                  + 0.5);
                if (v100 >= 255)
                  LOBYTE(v100) = -1;
                *v67 = v100;
                v101 = &v49[4 * (v68 - v63) + 3 + v48 * (v65 - v46)];
              }
              *v101 = -1;
            }
          }
          ++v68;
          v67 += 4;
          --v66;
        }
        while (v66);
      }
      ++v65;
      v64 += v48;
    }
    while (v65 != v47);
  }
  CFRelease(cf);
  v111 = CGDataProviderCreateWithData((void *)v19, *(const void **)v19, *(_QWORD *)(v19 + 16) * *(_QWORD *)(v19 + 24), (CGDataProviderReleaseDataCallback)sub_1D4D8D7FC);
  ColorSpace = CGImageGetColorSpace(image);
  v113 = CGImageGetBitmapInfo(image);
  v114 = CGImageCreate((unint64_t)width, (unint64_t)height, 8uLL, 0x20uLL, v48, ColorSpace, v113, v111, 0, 1, kCGRenderingIntentDefault);
  CGDataProviderRelease(v111);
  return v114;
}

- (__CVBuffer)ResampleCVPixels:(__CVBuffer *)a3 clipToRect:(CGRect)a4 outputSize:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  double y;
  double x;
  OSType PixelFormatType;
  CVReturn v14;
  __CVBuffer *v15;
  BOOL v16;
  CVPixelBufferRef pixelBufferOut;

  height = a5.height;
  width = a5.width;
  v7 = a4.size.height;
  v8 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  pixelBufferOut = 0;
  v14 = CVPixelBufferCreate(0, (unint64_t)width, (unint64_t)height, PixelFormatType, 0, &pixelBufferOut);
  v15 = pixelBufferOut;
  if (v14)
    v16 = 1;
  else
    v16 = pixelBufferOut == 0;
  if (!v16)
  {
    -[ImageHomographyResampler ResampleCVPixels:clipToRect:outputSize:toPixelBuffer:](self, "ResampleCVPixels:clipToRect:outputSize:toPixelBuffer:", a3, x, y, v8, v7, width, height);
    return pixelBufferOut;
  }
  return v15;
}

- (void)EraseCVPixelBuffer:(__CVBuffer *)a3
{
  void *BaseAddress;
  size_t Height;
  size_t BytesPerRow;

  CVPixelBufferLockBaseAddress(a3, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  Height = CVPixelBufferGetHeight(a3);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  bzero(BaseAddress, BytesPerRow * Height);
  CVPixelBufferUnlockBaseAddress(a3, 0);
}

- (void)ClearOutOfBoundsPixels:(WorkingPixmapRecord *)a3
{
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
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
  uint64_t i;
  __int32 v21;
  unint64_t var2;
  uint64_t v23;
  unint64_t var1;
  unint64_t var3;
  float v26;
  uint64x2_t v27;
  const float *v28;
  uint64_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  char *v38;
  float64x2_t v44;
  float64x2_t v45;
  int64x2_t v46;
  int32x4_t v47;
  char *v48;
  uint64_t v49;
  int64x2_t v50;
  int64x2_t v51;
  int32x4_t v52;
  int8x16_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float64x2_t v59;
  float64x2_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  int8x16_t v64;
  int16x4_t v65;
  float v66;
  float v67;
  int32x2_t v68;
  _BYTE v69[12];
  _BYTE v70[12];
  uint64_t v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v6 = self->homographyMatrix[7];
  v7 = self->homographyMatrix[8];
  v8 = self->homographyMatrix[4];
  v9 = self->homographyMatrix[5];
  v10 = self->homographyMatrix[6];
  v11 = v8 * v7 - v6 * v9;
  v12 = self->homographyMatrix[0];
  v13 = self->homographyMatrix[1];
  v15 = self->homographyMatrix[2];
  v14 = self->homographyMatrix[3];
  v16 = v6 * v15 - v13 * v7;
  v72 = v11;
  v73 = v16;
  v17 = v13 * v9 - v8 * v15;
  v74 = v17;
  v18 = v16 * v14 + v12 * v11 + v10 * v17;
  if (v18 >= 2.22044605e-16 || v18 <= -2.22044605e-16)
  {
    v72 = v11 / v18;
    v73 = v16 / v18;
    v74 = v17 / v18;
    v75 = (v10 * v9 - v14 * v7) / v18;
    v11 = (v14 * v6 - v10 * v8) / v18;
    v16 = -(v10 * v15);
    v76 = (v12 * v7 - v10 * v15) / v18;
    v77 = (v14 * v15 - v12 * v9) / v18;
    v78 = v11;
    v79 = (v10 * v13 - v12 * v6) / v18;
    v80 = (v12 * v8 - v14 * v13) / v18;
  }
  for (i = 0; i != 9; ++i)
  {
    *(float *)&v21 = *(&v72 + i);
    v68.i32[i] = v21;
  }
  var2 = a3->var2;
  if ((int)var2 >= 1)
  {
    v23 = 0;
    var1 = a3->var1;
    *(float *)&v11 = (float)var1;
    var3 = a3->var3;
    *(float *)&v16 = (float)var2;
    v66 = *(float *)&v69[8];
    v67 = *(float *)&v68.i32[1];
    v26 = *(float *)&v70[8];
    v27 = (uint64x2_t)vdupq_n_s64((unint64_t)var1 - 1);
    v28 = (const float *)&v71;
    v29 = a3->var2;
    v30 = (float32x4_t)vdupq_lane_s32(v68, 0);
    v31 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v69, 0);
    v32 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v69[4], 0);
    v33 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v70, 0);
    v34 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v70[4], 0);
    v35 = vld1q_dup_f32(v28);
    v36 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v11, 0);
    v37 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v16, 0);
    v38 = a3->var0 + 3;
    __asm { FMOV            V23.4S, #1.0 }
    v44 = (float64x2_t)vdupq_n_s64(0x3F747AE147AE147BuLL);
    v45 = (float64x2_t)vdupq_n_s64(0xBF747AE147AE147BLL);
    v46 = vdupq_n_s64(4uLL);
    v47.i64[0] = 0x400000004;
    v47.i64[1] = 0x400000004;
    do
    {
      if ((int)var1 >= 1)
      {
        v5.f32[0] = v26 * (float)(int)v23;
        v4.f32[0] = v66 * (float)(int)v23;
        v3.f32[0] = v67 * (float)(int)v23;
        v3 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 0);
        v4 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v4.f32, 0);
        v48 = v38;
        v5 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 0);
        v49 = (var1 + 3) & 0x1FFFFFFFCLL;
        v50 = (int64x2_t)xmmword_1D4DB2540;
        v51 = (int64x2_t)xmmword_1D4DB2530;
        v52 = (int32x4_t)xmmword_1D4DB2550;
        do
        {
          v53 = (int8x16_t)vuzp1q_s32((int32x4_t)vcgeq_u64(v27, (uint64x2_t)v50), (int32x4_t)vcgeq_u64(v27, (uint64x2_t)v51));
          v54 = vcvtq_f32_s32(v52);
          v55 = vaddq_f32(v31, vmlaq_f32(v3, v54, v30));
          v56 = vaddq_f32(v33, vmlaq_f32(v4, v54, v32));
          v57 = vaddq_f32(v35, vmlaq_f32(v5, v54, v34));
          v58 = vsubq_f32(_Q23, v57);
          v59 = vcvtq_f64_f32(*(float32x2_t *)v58.f32);
          v60 = vcvt_hight_f64_f32(v58);
          v61 = (float32x4_t)vbslq_s8(vandq_s8(v53, vbicq_s8(vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_f64(v59, v44), (int32x4_t)vcgtq_f64(v60, v44))), (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_f64(v45, v59), (int32x4_t)vcgtq_f64(v45, v60)))), (int8x16_t)_Q23, (int8x16_t)vdivq_f32(_Q23, v57));
          v62 = vmulq_f32(v56, v61);
          v63 = vmulq_f32(v55, v61);
          v64 = (int8x16_t)vcltzq_f32(v63);
          v65 = vmovn_s32((int32x4_t)vorrq_s8(vandq_s8(vbicq_s8(v53, v64), vorrq_s8(vorrq_s8((int8x16_t)vcgeq_f32(v63, v36), (int8x16_t)vcgeq_f32(v62, v37)), (int8x16_t)vcltzq_f32(v62))), vandq_s8(v53, v64)));
          if ((v65.i8[0] & 1) != 0)
            *(v48 - 3) = 0;
          if ((v65.i8[2] & 1) != 0)
            *(v48 - 2) = 0;
          if ((v65.i8[4] & 1) != 0)
            *(v48 - 1) = 0;
          if ((v65.i8[6] & 1) != 0)
            *v48 = 0;
          v51 = vaddq_s64(v51, v46);
          v50 = vaddq_s64(v50, v46);
          v52 = vaddq_s32(v52, v47);
          v48 += 4;
          v49 -= 4;
        }
        while (v49);
      }
      ++v23;
      v38 += var3;
    }
    while (v23 != v29);
  }
}

- (signed)ResampleCVPixels:(__CVBuffer *)a3 clipToRect:(CGRect)a4 outputSize:(CGSize)a5 toPixelBuffer:(__CVBuffer *)a6
{
  double height;
  double width;
  double y;
  double x;
  double v13;
  double v14;
  double v15;
  double v16;
  char *BaseAddress;
  size_t v18;
  size_t BytesPerRow;
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
  char *v34;
  int v35;
  double v36;
  double v37;
  size_t v38;
  void *v39;
  uint64_t i;
  float v41;
  qos_class_t v42;
  NSObject *v43;
  int v44;
  int v45;
  int v46;
  int v47;
  CVPixelBufferRef pixelBuffer;
  NSObject *group;
  _QWORD block[4];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  int v60;
  int v61;
  int v62;
  int v63;
  _OWORD v64[2];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  uint64_t v80;
  CGRect CleanRect;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v80 = *MEMORY[0x1E0C80C00];
  -[ImageHomographyResampler EraseCVPixelBuffer:](self, "EraseCVPixelBuffer:", a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.width, a5.height);
  CVPixelBufferLockBaseAddress(a3, 0);
  CVPixelBufferLockBaseAddress(a6, 0);
  CleanRect = CVImageBufferGetCleanRect(a3);
  v13 = CleanRect.origin.x;
  v14 = CleanRect.origin.y;
  v15 = CleanRect.size.width;
  v16 = CleanRect.size.height;
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
  v18 = CVPixelBufferGetHeight(a3);
  pixelBuffer = a3;
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  v20 = self->homographyMatrix[7];
  v21 = self->homographyMatrix[8];
  v22 = self->homographyMatrix[4];
  v23 = self->homographyMatrix[5];
  v24 = self->homographyMatrix[6];
  v25 = v22 * v21 - v20 * v23;
  v26 = self->homographyMatrix[0];
  v27 = self->homographyMatrix[1];
  v29 = self->homographyMatrix[2];
  v28 = self->homographyMatrix[3];
  v30 = v20 * v29 - v27 * v21;
  v71 = v25;
  v72 = v30;
  v31 = v27 * v23 - v22 * v29;
  v73 = v31;
  v32 = v30 * v28 + v26 * v25 + v24 * v31;
  if (v32 >= 2.22044605e-16 || v32 <= -2.22044605e-16)
  {
    v71 = v25 / v32;
    v72 = v30 / v32;
    v73 = v31 / v32;
    v74 = (v24 * v23 - v28 * v21) / v32;
    v75 = (v26 * v21 - v24 * v29) / v32;
    v76 = (v28 * v29 - v26 * v23) / v32;
    v77 = (v28 * v20 - v24 * v22) / v32;
    v78 = (v24 * v27 - v26 * v20) / v32;
    v79 = (v26 * v22 - v28 * v27) / v32;
  }
  v34 = &BaseAddress[4 * (unint64_t)v13 + (v18 - (unint64_t)(v14 + v16)) * BytesPerRow];
  v35 = (int)y;
  v36 = width + (double)(int)x;
  v37 = height + (double)(int)y;
  v38 = CVPixelBufferGetBytesPerRow(a6);
  v39 = CVPixelBufferGetBaseAddress(a6);
  for (i = 0; i != 9; ++i)
  {
    v41 = *(&v71 + i);
    *((float *)v64 + i) = v41;
  }
  *((_QWORD *)&v65 + 1) = v34;
  *(_QWORD *)&v66 = BytesPerRow;
  *((_QWORD *)&v66 + 1) = 4;
  *(_QWORD *)&v67 = (unint64_t)v15;
  *((_QWORD *)&v67 + 1) = (unint64_t)v16;
  *(_QWORD *)&v68 = v39;
  *((_QWORD *)&v68 + 1) = v38;
  *(_QWORD *)&v69 = 4;
  *((_QWORD *)&v69 + 1) = CVPixelBufferGetWidth(a6);
  *(_QWORD *)&v70 = CVPixelBufferGetWidth(a6);
  *((_QWORD *)&v70 + 1) = v35;
  group = dispatch_group_create();
  v42 = qos_class_self();
  dispatch_get_global_queue(v42, 0);
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = (int)v37 - v35;
  if ((int)v37 < v35)
    v44 = (int)v37 - v35 + 15;
  v45 = v44 >> 4;
  v46 = 16;
  do
  {
    block[0] = MEMORY[0x1E0C809B0];
    if (--v46)
      v47 = v35 + v45;
    else
      v47 = (int)v37;
    block[1] = 3221225472;
    block[2] = sub_1D4D8E9E8;
    block[3] = &unk_1E988B5E0;
    v56 = v67;
    v57 = v68;
    v58 = v69;
    v59 = v70;
    v52 = v64[0];
    v53 = v64[1];
    v54 = v65;
    v55 = v66;
    v60 = (int)x;
    v61 = (int)v36;
    v62 = v35;
    v63 = v47;
    dispatch_group_async(group, v43, block);
    v35 = v47;
  }
  while (v46);
  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  CVPixelBufferUnlockBaseAddress(a6, 0);

  return 0;
}

@end
