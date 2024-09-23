@implementation VCPVanishingPointDetector

- (VCPVanishingPointDetector)initWithImage:(__CVBuffer *)a3
{
  VCPVanishingPointDetector *v4;
  VCPVanishingPointDetector *v5;
  VCPVanishingPointDetector *v6;
  VCPVanishingPointDetector *v7;
  VCPGaborFilter *v8;
  VCPGaborFilter *gaborFilter;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VCPVanishingPointDetector;
  v4 = -[VCPVanishingPointDetector init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    if (-[VCPVanishingPointDetector prepareImage:](v4, "prepareImage:", a3))
    {
      v6 = 0;
    }
    else
    {
      v6 = v5;
      if (v5->_validDimension)
      {
        v8 = -[VCPGaborFilter initWithNumberOfScales:numOfOrientations:width:height:]([VCPGaborFilter alloc], "initWithNumberOfScales:numOfOrientations:width:height:", 5, 8, 31, 31);
        gaborFilter = v5->_gaborFilter;
        v5->_gaborFilter = v8;

        v6 = v5;
      }
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int)detect:(CGPoint *)a3 withConfidence:(float *)a4 dominantLine:(id *)a5
{
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSPoint v16;
  NSPoint v17;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_validDimension)
  {
    a3->x = 0.0;
    a3->y = 0.0;
    *a4 = 0.0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v10 = -108;
      goto LABEL_12;
    }
    v16.x = 0.0;
    v16.y = 0.0;
    NSStringFromPoint(v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("Point0"));

    v17.x = 0.0;
    v17.y = 0.0;
    NSStringFromPoint(v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("Point1"));

    objc_msgSend(v11, "setObject:forKey:", &unk_1E6B71EB0, CFSTR("Radius"));
    objc_msgSend(v11, "setObject:forKey:", &unk_1E6B71EB0, CFSTR("Theta"));
    objc_msgSend(v11, "setObject:forKey:", &unk_1E6B72AA0, CFSTR("Length"));
    v14 = objc_retainAutorelease(v11);
    *a5 = v14;

    goto LABEL_10;
  }
  v10 = -[VCPVanishingPointDetector calculateOrientationResponses](self, "calculateOrientationResponses");
  if (!v10)
  {
    v10 = -[VCPVanishingPointDetector generateOrientationMap](self, "generateOrientationMap");
    if (!v10)
    {
      v10 = -[VCPVanishingPointDetector generateLineWeightMap:weightMap:](self, "generateLineWeightMap:weightMap:", v9, self->_edgeWeightMap);
      if (!v10)
      {
        v10 = -[VCPVanishingPointDetector voteVanishingPoint:](self, "voteVanishingPoint:", self->_image);
        if (!v10)
        {
          v10 = -[VCPVanishingPointDetector searchVanishingPointandDominantLine:lineGroup:vanishingPoint:vanishingPointConfidence:dominantLine:](self, "searchVanishingPointandDominantLine:lineGroup:vanishingPoint:vanishingPointConfidence:dominantLine:", self->_image, v9, a3, a4, a5);
          if (!v10)
LABEL_10:
            v10 = 0;
        }
      }
    }
  }
LABEL_12:

  return v10;
}

- (void)dealloc
{
  float *image;
  float *orientionMap;
  float *confidenceMap;
  float *edgeWeightMap;
  uint64_t i;
  uint64_t v8;
  objc_super v9;

  image = self->_image;
  if (image)
    MEMORY[0x1BCCA128C](image, 0x1000C8052888210);
  orientionMap = self->_orientionMap;
  if (orientionMap)
    MEMORY[0x1BCCA128C](orientionMap, 0x1000C8052888210);
  confidenceMap = self->_confidenceMap;
  if (confidenceMap)
    MEMORY[0x1BCCA128C](confidenceMap, 0x1000C8052888210);
  edgeWeightMap = self->_edgeWeightMap;
  if (edgeWeightMap)
    MEMORY[0x1BCCA128C](edgeWeightMap, 0x1000C8052888210);
  for (i = 16; i != 80; i += 8)
  {
    v8 = *(uint64_t *)((char *)&self->super.isa + i);
    if (v8)
      MEMORY[0x1BCCA128C](v8, 0x1000C8052888210);
  }
  v9.receiver = self;
  v9.super_class = (Class)VCPVanishingPointDetector;
  -[VCPVanishingPointDetector dealloc](&v9, sel_dealloc);
}

- (int)prepareImage:(__CVBuffer *)a3
{
  int Width;
  int Height;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  signed int v13;
  int v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  const std::nothrow_t *v18;
  float *v19;
  float *v20;
  unint64_t v21;
  size_t v22;
  float *v23;
  float *v24;
  BOOL v25;
  uint64_t v28;
  const std::nothrow_t *v29;
  float *v30;
  _BYTE *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  float v33;
  int v34;
  float *v35;
  int64_t v36;
  float v37;
  float v38;
  uint64_t i;
  float v40;
  int64_t stridePadded;
  float *v42;
  float *v43;
  int v44;
  int64_t v45;
  float *v46;
  float *v47;
  unint64_t v48;
  float *image;
  float *v50;
  const float *v51;
  float *v52;
  const float *v53;
  int64_t v54;
  _DWORD v55[6];
  CVPixelBufferRef pixelBuffer;

  if (!a3)
    return -50;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (Height >= Width)
    v7 = Width;
  else
    v7 = Height;
  if (Width <= Height)
    v8 = Height;
  else
    v8 = Width;
  self->_validDimension = v7 > 127;
  if (v7 < 128)
    return 0;
  if ((float)((float)v8 / (float)v7) <= 2.0)
  {
    v10 = (Width << 7) / v7;
    v9 = (Height << 7) / v7;
  }
  else
  {
    v9 = (Height << 8) / v8;
    if (Height < Width)
      v9 = 128;
    v10 = (Width << 8) / v8;
    if (Height >= Width)
      v10 = 128;
  }
  v12 = v10 & 0xFFFFFFFE;
  v13 = v9 & 0xFFFFFFFE;
  pixelBuffer = 0;
  Scaler::Scale(&self->_scaler, a3, &pixelBuffer, v12, v9 & 0xFFFFFFFE, 875704422);
  v11 = v14;
  if (!v14)
  {
    self->_width = (int)v12;
    self->_height = v13;
    self->_stride = (int)v12;
    self->_widthPadded = (int)v12 + 30;
    v15 = v13 + 30;
    self->_heightPadded = v15;
    self->_stridePadded = (int)v12 + 30;
    self->_offset = 15 * ((int)v12 + 30) + 15;
    v16 = ((int)v12 + 30) * v15;
    if (v16 >> 62)
      v17 = -1;
    else
      v17 = 4 * v16;
    v18 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
    v19 = (float *)operator new[](v17, MEMORY[0x1E0DE4E10]);
    self->_image = v19;
    v20 = (float *)operator new[](v17, v18);
    self->_edgeWeightMap = v20;
    v21 = (int)v12 * (uint64_t)v13;
    if (v21 >> 62)
      v22 = -1;
    else
      v22 = 4 * v21;
    v23 = (float *)operator new[](v22, v18);
    self->_orientionMap = v23;
    v24 = (float *)operator new[](v22, v18);
    self->_confidenceMap = v24;
    if (v19)
      v25 = v20 == 0;
    else
      v25 = 1;
    if (!v25 && v23 && v24 != 0)
    {
      v28 = 0;
      v29 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
      while (1)
      {
        v30 = (float *)operator new[](v22, v29);
        self->_orientationResponses[v28] = v30;
        if (!v30)
          break;
        if (++v28 == 8)
        {
          CVPixelBufferLock::CVPixelBufferLock((CVPixelBufferLock *)v55, pixelBuffer, 1uLL);
          v11 = v55[0];
          if (!v55[0])
          {
            BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
            BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
            if (v13 < 1)
            {
              v38 = 0.0;
              v37 = 0.0;
            }
            else
            {
              v34 = 0;
              v35 = &self->_image[self->_offset];
              v36 = 4 * self->_stridePadded;
              v37 = 0.0;
              v38 = 0.0;
              do
              {
                if ((int)v12 >= 1)
                {
                  for (i = 0; i != v12; ++i)
                  {
                    LOBYTE(v33) = BaseAddressOfPlane[i];
                    v33 = (float)LODWORD(v33);
                    v35[i] = v33;
                    v38 = v38 + v33;
                    v37 = v37 + (float)(v33 * v33);
                  }
                }
                BaseAddressOfPlane += BytesPerRowOfPlane;
                ++v34;
                v35 = (float *)((char *)v35 + v36);
              }
              while (v34 != v13);
            }
            v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)v55);
            if (!v11)
            {
              v40 = (float)(v12 * v13);
              self->_pixelMean = v38 / v40;
              self->_pixelVar = sqrtf(fmaxf((float)(v37 / v40) - (float)(v38 / v40), 0.0));
              stridePadded = self->_stridePadded;
              v42 = &self->_image[15 * stridePadded];
              v43 = &v42[(self->_height - 1) * stridePadded];
              v44 = 15;
              do
              {
                v45 = self->_stridePadded;
                v46 = &v42[-v45];
                v47 = &v43[v45];
                memcpy(v46, v42, 4 * v45);
                memcpy(v47, v43, 4 * self->_stridePadded);
                v43 = v47;
                v42 = v46;
                --v44;
              }
              while (v44);
              if (self->_heightPadded)
              {
                v48 = 0;
                image = self->_image;
                v50 = &image[self->_widthPadded];
                v51 = v50 - 16;
                v52 = v50 - 15;
                v53 = image + 15;
                do
                {
                  vDSP_vfill(v53, image, 1, 0xFuLL);
                  vDSP_vfill(v51, v52, 1, 0xFuLL);
                  v54 = self->_stridePadded;
                  v53 += v54;
                  v51 += v54;
                  image += v54;
                  v52 += v54;
                  ++v48;
                }
                while (self->_heightPadded > v48);
              }
              v11 = 0;
            }
          }
          CVPixelBufferLock::~CVPixelBufferLock((CVPixelBufferLock *)v55);
          goto LABEL_35;
        }
      }
    }
    v11 = -108;
  }
LABEL_35:
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBuffer);
  return v11;
}

- (int)calculateOrientationResponses
{
  uint64_t v3;
  vDSP_Length v4;
  uint64_t v5;
  int result;

  if (!self->_validDimension || !self->_gaborFilter)
    return -50;
  v3 = 0;
  v4 = self->_height * self->_width;
LABEL_4:
  vDSP_vclr(self->_orientationResponses[v3], 1, v4);
  v5 = 0;
  while (1)
  {
    result = -[VCPGaborFilter processWithFilterScaleIdx:orientIdx:srcImage:outImage:width:height:](self->_gaborFilter, "processWithFilterScaleIdx:orientIdx:srcImage:outImage:width:height:", v5, v3, self->_image, self->_edgeWeightMap, self->_widthPadded, self->_heightPadded);
    if (result)
      return result;
    -[VCPVanishingPointDetector extractUsefulAreaFrom:to:withOffset:stridePadded:width:height:](self, "extractUsefulAreaFrom:to:withOffset:stridePadded:width:height:", self->_edgeWeightMap, self->_orientionMap, self->_offset, self->_stridePadded, self->_width, self->_height);
    -[VCPVanishingPointDetector averageOrientationResponses:withCurrentMap:](self, "averageOrientationResponses:withCurrentMap:", v3, self->_orientionMap);
    v5 = (v5 + 1);
    if ((_DWORD)v5 == 5)
    {
      result = 0;
      if (++v3 != 8)
        goto LABEL_4;
      return result;
    }
  }
}

- (void)extractUsefulAreaFrom:(float *)a3 to:(float *)a4 withOffset:(unint64_t)a5 stridePadded:(unint64_t)a6 width:(unint64_t)a7 height:(unint64_t)a8
{
  unint64_t v8;
  size_t v10;
  unint64_t v11;
  float *v12;

  if (a8)
  {
    v8 = a8;
    v10 = 4 * a7;
    v11 = 4 * a6;
    v12 = &a3[a5];
    do
    {
      memcpy(a4, v12, v10);
      a4 = (float *)((char *)a4 + v10);
      v12 = (float *)((char *)v12 + v11);
      --v8;
    }
    while (v8);
  }
}

- (void)averageOrientationResponses:(int)a3 withCurrentMap:(float *)a4
{
  vDSP_Length v5;
  float *v6;
  float __B;

  __B = 8.0;
  v5 = self->_height * self->_width;
  v6 = self->_orientationResponses[a3];
  vDSP_vsdiv(a4, 1, &__B, a4, 1, v5);
  vDSP_vadd(v6, 1, a4, 1, v6, 1, v5);
}

- (int)generateOrientationMap
{
  float *orientionMap;
  float *confidenceMap;
  const std::nothrow_t *v5;
  const float *v6;
  vDSP_Length *v7;
  vDSP_Length *v8;
  BOOL v9;
  int v10;
  unint64_t height;
  unint64_t v12;
  uint64_t v13;
  unint64_t width;
  float v15;
  float v16;
  unint64_t v17;
  vDSP_Length i;
  unint64_t v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  uint64_t j;
  float v33;
  float v34;
  int64_t stride;
  uint64_t v36;
  int v37;
  unint64_t v38;
  float *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v43;
  float v44;

  orientionMap = self->_orientionMap;
  confidenceMap = self->_confidenceMap;
  v5 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
  v6 = (const float *)operator new[](0x20uLL, MEMORY[0x1E0DE4E10]);
  v7 = (vDSP_Length *)operator new[](0x40uLL, v5);
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = -108;
    if (!v6)
      goto LABEL_42;
LABEL_41:
    MEMORY[0x1BCCA128C](v6, 0x1000C8052888210);
    goto LABEL_42;
  }
  height = self->_height;
  if (!height)
  {
    v10 = 0;
    goto LABEL_41;
  }
  v12 = 0;
  LODWORD(v13) = 0;
  width = self->_width;
  v15 = 0.0;
  v16 = 1.0;
  do
  {
    if (width)
    {
      v43 = v12;
      v17 = 0;
      v13 = (int)v13;
      do
      {
        v44 = v15;
        for (i = 0; i != 8; ++i)
        {
          v6[i] = self->_orientationResponses[i][v13];
          v8[i] = i;
        }
        vDSP_vsorti(v6, v8, 0, 8uLL, -1);
        v19 = v8[1];
        v20 = v6[*v8];
        v21 = vabds_f32(v20, v6[v8[7]]);
        v22 = v6[v19];
        v23 = vabds_f32(v22, v6[v8[6]]);
        v24 = (float)((float)*v8 * 22.5) * 0.017453;
        v25 = (float)((float)v19 * 22.5) * 0.017453;
        v26 = cosf(v24);
        v27 = (float)(cosf(v25) * v23) + (float)(v21 * v26);
        if (v27 == 0.0)
        {
          v28 = 90.0;
        }
        else
        {
          v29 = sinf(v24);
          v30 = sinf(v25);
          v28 = atanf((float)((float)(v30 * v23) + (float)(v21 * v29)) / v27) * 57.296;
        }
        v15 = v44;
        if (v28 < 0.0)
          v28 = v28 + 180.0;
        orientionMap[v17] = v28;
        v31 = 0.0;
        for (j = 2; j != 8; ++j)
          v31 = v31 + v6[v8[j]];
        v33 = 0.0;
        v34 = (float)((float)(v20 + 0.0) + v22) * 0.5;
        if (v34 != 0.0)
          v33 = (float)((float)(v31 / -6.0) / v34) + 1.0;
        confidenceMap[v17] = v33;
        if (v33 < v16)
          v16 = v33;
        if (v33 > v44)
          v15 = v33;
        ++v17;
        ++v13;
        width = self->_width;
      }
      while (width > v17);
      height = self->_height;
      v12 = v43;
    }
    stride = self->_stride;
    orientionMap += stride;
    confidenceMap += stride;
    ++v12;
  }
  while (height > v12);
  if (height)
  {
    v36 = 0;
    v37 = 0;
    v38 = self->_width;
    do
    {
      if (v38)
      {
        v39 = self->_confidenceMap;
        v40 = v37;
        v37 += v38;
        v41 = v38;
        do
        {
          if (v39[v40] < (float)((float)(v15 - v16) * 0.22))
            self->_orientionMap[v40] = -1.0;
          ++v40;
          --v41;
        }
        while (v41);
      }
      ++v36;
    }
    while (v36 != height);
  }
  v10 = 0;
  if (v6)
    goto LABEL_41;
LABEL_42:
  if (v8)
    MEMORY[0x1BCCA128C](v8, 0x1000C8000313F17);
  return v10;
}

- (void)smoothFiltering:(float *)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  int v8;
  float *v9;
  unint64_t v10;
  int32x2_t v11;
  uint64x2_t v12;
  int32x2_t v13;
  float32x2_t v14;
  float v15;
  uint64x2_t v16;
  float v17;
  float v18;
  unsigned __int8 v19;
  uint64x2_t v20;
  float __F[25];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = -2;
  v9 = __F;
  v16 = (uint64x2_t)vdupq_n_s64(5uLL);
  do
  {
    v10 = 0;
    v11 = vdup_n_s32(v8 * v8);
    do
    {
      v12 = (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v10), (int8x16_t)xmmword_1B6FBCE90);
      v19 = vmovn_s64((int64x2_t)vcgtq_u64(v16, v12)).u8[0];
      v20 = v12;
      v13 = vadd_s32(vdup_n_s32(v10), (int32x2_t)-2);
      v14 = vmul_f32(vcvt_f32_s32(vneg_s32(vmla_s32(v11, v13, v13))), (float32x2_t)0x3F0000003F000000);
      v17 = v14.f32[0];
      v18 = expf(v14.f32[1]);
      v15 = expf(v17);
      if ((v19 & 1) != 0)
        v9[v10] = v15 / 2.5066;
      if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(5uLL), v20)).i32[1] & 1) != 0)
        v9[v10 + 1] = v18 / 2.5066;
      v10 += 2;
    }
    while (v10 != 6);
    ++v8;
    v9 += 5;
  }
  while (v8 != 3);
  vDSP_f5x5(a3, a5, a4, __F, a3);
}

- (int)voteVanishingPoint:(float *)a3
{
  unint64_t width;
  unint64_t height;
  unint64_t v7;
  uint64_t v8;
  int v9;
  float v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  int v24;
  int v25;

  width = self->_width;
  height = self->_height;
  if (width <= height)
    v7 = self->_height;
  else
    v7 = self->_width;
  vDSP_vclr(a3, 1, height * width);
  v24 = height;
  if ((int)height >= 1)
  {
    v25 = 0;
    LODWORD(v8) = 0;
    v9 = (int)(float)((float)v7 * 0.35);
    v10 = sqrt((double)((int)width * (int)width + (int)height * (int)height));
    do
    {
      if ((int)width >= 1)
      {
        v11 = 0;
        v8 = (int)v8;
        do
        {
          v12 = -v9;
          if (v9 >= 1)
          {
            do
            {
              v13 = (v12 + v25);
              if (v12 + v25 >= 0 && (int)v13 < v24)
              {
                v14 = -v9;
                do
                {
                  v15 = v11 + v14;
                  if (v11 + v14 >= 0 && v15 < (int)width)
                  {
                    v16 = self->_orientionMap[self->_stride * v13 + v15];
                    if (v16 >= 0.0)
                    {
                      v17 = sqrtf((float)(v12 * v12 + v14 * v14));
                      v18 = v17 / v10;
                      if (v14 >= 0)
                        v20 = -(float)v12;
                      else
                        v20 = (float)v12;
                      v21 = vabds_f32(acosf(v20 / v17) * 57.296, v16);
                      if (v21 <= 90.0)
                        v22 = v21;
                      else
                        v22 = 180.0 - v21;
                      v19 = 5.0 / ((float)(v18 + v18) + 1.0);
                      if (v22 <= v19)
                        a3[v8] = a3[v8]
                               + (float)((float)((float)(fabsf(sinf((float)(v16 + v16) * 0.017453)) + 1.0)
                                               * self->_edgeWeightMap[v8])
                                       / (float)((float)((float)(v18 * v22) * (float)(v18 * v22)) + 1.0));
                    }
                  }
                  v14 += 4;
                }
                while (v14 < v9);
              }
              v12 += 4;
            }
            while (v12 < v9);
          }
          ++v11;
          ++v8;
        }
        while (v11 != (_DWORD)width);
      }
      ++v25;
    }
    while (v25 != v24);
  }
  return 0;
}

- (int)searchVanishingPointandDominantLine:(float *)a3 lineGroup:(id)a4 vanishingPoint:(CGPoint *)a5 vanishingPointConfidence:(float *)a6 dominantLine:(id *)a7
{
  unint64_t height;
  unint64_t width;
  int v13;
  int v14;
  double v15;
  float v16;
  double v17;
  double v18;
  float *v19;
  double v20;
  int v21;
  float v22;
  float v23;
  id v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t v28;
  float v29;
  float v30;
  uint64_t i;
  void *v32;
  void *v33;
  float v34;
  float v35;
  void *v36;
  float v37;
  float v38;
  __float2 v39;
  float v40;
  float v41;
  float *v42;
  double v43;
  int v44;
  float *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v46 = a6;
  v53 = *MEMORY[0x1E0C80C00];
  v47 = a4;
  width = self->_width;
  height = self->_height;
  -[VCPVanishingPointDetector smoothFiltering:width:height:](self, "smoothFiltering:width:height:", a3, (int)width, (int)height);
  if ((int)height < 1)
  {
    v18 = 0.0;
    v17 = 0.0;
  }
  else
  {
    v13 = 0;
    v14 = 0;
    v15 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    v18 = 0.0;
    do
    {
      if ((int)width >= 1)
      {
        v19 = &a3[v13];
        v20 = 0.0;
        v21 = width;
        do
        {
          v22 = *v19++;
          v23 = v22;
          if (v22 > v16)
          {
            v18 = v20;
            v17 = v15;
            v16 = v23;
          }
          v20 = v20 + 1.0;
          --v21;
        }
        while (v21);
      }
      v15 = v15 + 1.0;
      ++v14;
      v13 += width & ~((int)width >> 31);
    }
    while (v14 != (_DWORD)height);
  }
  a5->x = v18 / (double)(int)width;
  a5->y = v17 / (double)(int)height;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v24 = v47;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  v26 = v18 - (float)((float)(int)width * 0.5);
  v27 = v17 - (float)((float)(int)height * 0.5);
  if (v25)
  {
    v28 = *(_QWORD *)v49;
    v29 = 0.0;
    v30 = 3.4028e38;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v49 != v28)
          objc_enumerationMutation(v24);
        v32 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v32, "objectForKey:", CFSTR("Radius"), v46);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "floatValue");
        v35 = v34;

        objc_msgSend(v32, "objectForKey:", CFSTR("Theta"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "floatValue");
        v38 = v37;

        v39 = __sincosf_stret(v38 * 0.017453);
        v40 = v27 * v39.__sinval + v26 * v39.__cosval;
        v41 = vabds_f32(v40, v35);
        if (v41 < v30)
        {
          *a7 = objc_retainAutorelease(v32);
          v30 = v41;
        }
        v29 = v29 + v41;
      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v25);
  }
  else
  {
    v29 = 0.0;
  }

  if (!objc_msgSend(v24, "count"))
  {
    v42 = v46;
    *v46 = 0.0;
LABEL_26:
    v44 = 0;
    *v42 = 1.0;
    goto LABEL_27;
  }
  v42 = v46;
  *(float *)&v43 = v29 / (float)(unint64_t)objc_msgSend(v24, "count");
  v44 = -[VCPVanishingPointDetector calculateConfidence:lineDistance:vaninshingPoint:vanishingPointConfidence:](self, "calculateConfidence:lineDistance:vaninshingPoint:vanishingPointConfidence:", v24, v46, v43, v26, v27);
  if (!v44)
    goto LABEL_26;
LABEL_27:

  return v44;
}

- (int)calculateConfidence:(id)a3 lineDistance:(float)a4 vaninshingPoint:(CGPoint)a5 vanishingPointConfidence:(float *)a6
{
  id v9;
  float v10;
  int v11;
  float v12;
  float v13;
  uint64_t v14;
  int v15;
  float v16;
  uint64_t v17;
  float v18;
  uint64_t v19;
  void *v20;
  void *v21;
  float v22;
  void *v23;
  float v24;
  float v25;
  void *v26;
  float v27;
  uint64_t v28;
  BOOL v29;
  char v30;
  float v31;
  __float2 v32;
  void *v33;
  void *v34;
  float v35;
  float v36;
  void *v37;
  float v38;
  float v39;
  void *v40;
  void *v41;
  float v42;
  uint64_t v43;
  uint64_t v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  __float2 v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float *v58;
  uint64_t v59;
  uint64_t v60;
  float v62;

  v9 = a3;
  v10 = hypotf((float)self->_width, (float)self->_height);
  v11 = objc_msgSend(v9, "count");
  v12 = expf((float)((float)(a4 / v10) * (float)(a4 / v10)) / -0.0648);
  *a6 = v12;
  if (v12 >= 0.4)
  {
    v58 = a6;
    v13 = 0.2;
    if (v11 >= 3)
    {
      v14 = 0;
      v15 = 0;
      v16 = 0.0;
      v17 = 1;
      v18 = 0.087266;
      do
      {
        v19 = v14;
        objc_msgSend(v9, "objectAtIndex:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", CFSTR("Radius"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "floatValue");
        v62 = v22;

        objc_msgSend(v20, "objectForKey:", CFSTR("Theta"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "floatValue");
        v25 = v24;

        objc_msgSend(v20, "objectForKey:", CFSTR("Theta"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "floatValue");
        v28 = (int)v27;

        v29 = -[VCPVanishingPointDetector isVerticalOrHorizontal:](self, "isVerticalOrHorizontal:", v28);
        v59 = v17;
        v60 = v19 + 1;
        v30 = v19 + 1 >= v11 || v29;
        if ((v30 & 1) == 0)
        {
          v31 = v25 * 0.017453;
          v32 = __sincosf_stret(v25 * 0.017453);
          do
          {
            objc_msgSend(v9, "objectAtIndex:", v17);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "objectForKey:", CFSTR("Radius"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "floatValue");
            v36 = v35;

            objc_msgSend(v33, "objectForKey:", CFSTR("Theta"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "floatValue");
            v39 = v38;

            objc_msgSend(v33, "objectForKey:", CFSTR("Theta"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "floatValue");
            v41 = v20;
            v43 = (int)v42;

            v44 = v43;
            v20 = v41;
            if (!-[VCPVanishingPointDetector isVerticalOrHorizontal:](self, "isVerticalOrHorizontal:", v44))
            {
              v45 = v39 * 0.017453;
              v46 = vabds_f32(v31, v45);
              if (v46 > v18 && v46 < 3.14159265)
              {
                v47 = v18;
                v48 = v16;
                v49 = v10;
                v50 = 1.0 / sinf(v31 - v45);
                v51 = __sincosf_stret(v45);
                v52 = -(float)((float)((float)(v62 * v51.__sinval) - (float)(v36 * v32.__sinval)) * v50);
                v53 = (float)((float)(v62 * v51.__cosval) - (float)(v36 * v32.__cosval)) * v50;
                v10 = v49;
                v54 = v48;
                v18 = v47;
                v55 = v52 - a5.x;
                v56 = v53 - a5.y;
                v16 = v54 + hypotf(v55, v56);
                ++v15;
              }
            }

            ++v17;
          }
          while ((int)v17 < v11 && v15 < 5);
        }

        v14 = v60;
        if (v60 >= v11 - 1)
          break;
        v17 = v59 + 1;
      }
      while (v15 < 5);
      v13 = 0.2;
      if (v15)
        v13 = expf((float)((float)(v16 / (float)(v10 * (float)v15)) * (float)(v16 / (float)(v10 * (float)v15))) / -0.0512);
    }
    *v58 = v13;
  }

  return 0;
}

- (BOOL)isVerticalOrHorizontal:(int)a3
{
  int v3;
  float v4;
  float v5;
  int v6;
  BOOL v7;
  int v8;
  float v9;
  BOOL v10;

  v3 = a3 % 180 + (a3 % 180 < 0 ? 0xB4 : 0);
  v4 = (float)v3 * 0.017453;
  v5 = (float)(180 - v3) * 0.017453;
  v6 = 90 - v3;
  v7 = v3 >= 0x5A;
  v8 = v3 - 90;
  if (!v7)
    v8 = v6;
  v9 = (float)v8 * 0.017453;
  v10 = v4 < 0.0087266;
  if (v5 < 0.0087266)
    v10 = 1;
  return v9 < 0.0087266 || v10;
}

- (int)generateLineWeightMap:(id)a3 weightMap:(float *)a4
{
  id v6;
  float v7;
  float v8;
  float v9;
  VCPEdgeDetector *v10;
  double v11;
  double v12;
  double v13;
  int v14;
  VCPHoughTransform *v15;
  double v16;
  unint64_t height;
  uint64_t v18;
  unint64_t width;
  unint64_t i;
  uint64_t v21;
  VCPVanishingPointDetector *v22;
  uint64_t v23;
  float v24;
  float v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  float v30;
  float v31;
  void *v32;
  float v33;
  float v34;
  void *v35;
  uint64_t v36;
  float v37;
  __float2 v38;
  float v39;
  float v40;
  VCPHoughTransform *v42;
  VCPEdgeDetector *v43;
  unint64_t v44;
  float v45;
  uint64_t v46;
  float *v47;

  v6 = a3;
  v7 = (float)(self->_pixelVar * -0.03078) + 5.3225;
  v8 = 5.0;
  if (v7 < 5.0)
    v8 = (float)(self->_pixelVar * -0.03078) + 5.3225;
  if (v7 <= 1.0)
    v9 = 1.0;
  else
    v9 = v8;
  v10 = -[VCPEdgeDetector initWithImage:edgeMap:width:height:widthExtension:heightExtension:]([VCPEdgeDetector alloc], "initWithImage:edgeMap:width:height:widthExtension:heightExtension:", self->_image, a4, self->_width, self->_height, 15, 15);
  LODWORD(v11) = 1153957888;
  LODWORD(v12) = 1161527296;
  v43 = v10;
  *(float *)&v13 = v9;
  v14 = -[VCPEdgeDetector detectWithSigma:lowThreshold:highThreshold:](v10, "detectWithSigma:lowThreshold:highThreshold:", v13, v11, v12);
  if (!v14)
  {
    v15 = [VCPHoughTransform alloc];
    LODWORD(v16) = 1.0;
    v47 = a4;
    v42 = -[VCPHoughTransform initWithEdgeMap:mapWidth:mapHeight:angleStep:](v15, "initWithEdgeMap:mapWidth:mapHeight:angleStep:", a4, LODWORD(self->_width), LODWORD(self->_height), v16);
    -[VCPHoughTransform DetectLinesWithThreshold:output:](v42, "DetectLinesWithThreshold:output:", 70, v6);
    height = self->_height;
    if (height)
    {
      LODWORD(v18) = 0;
      width = self->_width;
      for (i = 0; i < height; ++i)
      {
        if (width)
        {
          v21 = 0;
          v44 = i;
          v45 = (float)(int)i;
          v18 = (int)v18;
          v22 = self;
          do
          {
            v23 = 0;
            v47[v18] = 1.0;
            v46 = v21;
            v24 = (float)(int)v21 - (float)((float)width * 0.5);
            v25 = v45 - (float)((float)v22->_height * 0.5);
            while (1)
            {
              v26 = objc_msgSend(v6, "count");
              v27 = v26 >= 5 ? 5 : v26;
              if (v27 <= v23)
                break;
              objc_msgSend(v6, "objectAtIndex:", v23);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "objectForKey:", CFSTR("Radius"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "floatValue");
              v31 = v30;

              objc_msgSend(v28, "objectForKey:", CFSTR("Theta"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "floatValue");
              v34 = v33;

              objc_msgSend(v28, "objectForKey:", CFSTR("Length"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "integerValue");
              v37 = v34 * 0.017453;

              v38 = __sincosf_stret(v37);
              if (vabds_f32((float)(v25 * v38.__sinval) + (float)(v24 * v38.__cosval), v31) <= 2.0)
              {
                v39 = fminf(expf((float)v36 / 320.0), 3.0);
                v40 = (fabsf(sinf(v37 + v37)) + 1.0) * v39;
                v47[v18] = v40;
              }

              ++v23;
            }
            v22 = self;
            v21 = v46 + 1;
            ++v18;
            width = self->_width;
          }
          while (width > v46 + 1);
          height = self->_height;
          i = v44;
        }
      }
    }

    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  Scaler *p_scaler;

  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_gaborFilter, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 24) = 0;
  *((_DWORD *)self + 50) = 0;
  return self;
}

@end
