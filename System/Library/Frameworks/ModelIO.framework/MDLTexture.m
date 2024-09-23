@implementation MDLTexture

- (void).cxx_destruct
{
  uint64_t v3;
  NSData **v4;
  uint64_t i;

  v3 = 0;
  v4 = &self->_bottomLeftOriginData[13];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -14);
  for (i = 0; i != -14; --i)
    objc_storeStrong((id *)&self->_topLeftOriginData[i + 13], 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (CGImageRef)imageFromTextureAtLevel:(NSUInteger)level
{
  char v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  int channelCount;
  BOOL v10;
  CGColorSpace *DeviceGray;
  int64_t channelEncoding;
  uint32_t v13;
  int v14;
  const char *v15;
  uint64_t v16;
  int v17;
  int32x2_t v18;
  int8x8_t v19;
  int32x2_t v20;
  int8x8_t v21;
  size_t v22;
  size_t v23;
  int v24;
  id v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  CGContext *v29;
  CGImageRef Image;

  v3 = level;
  objc_msgSend_texelDataWithTopLeftOrigin_(self, a2, level);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  channelCount = self->_textureData.channelCount;
  if (!channelCount)
    goto LABEL_29;
  v10 = channelCount > 4 || v5 == 0;
  if (v10 || !objc_msgSend_length(v5, v6, v7))
    goto LABEL_29;
  if (self->_textureData.channelCount < 2)
  {
    DeviceGray = CGColorSpaceCreateDeviceGray();
    v13 = 0;
    channelEncoding = self->_channelEncoding;
  }
  else
  {
    DeviceGray = CGColorSpaceCreateDeviceRGB();
    channelEncoding = self->_channelEncoding;
    if (channelEncoding == 1)
      v13 = 16385;
    else
      v13 = 1;
  }
  if (channelEncoding != 770)
  {
    if (channelEncoding == 260)
    {
      v14 = 8448;
      goto LABEL_17;
    }
    if (channelEncoding != 258)
      goto LABEL_18;
  }
  v14 = 4352;
LABEL_17:
  v13 |= v14;
LABEL_18:
  v17 = sub_1DCAC8EDC(channelEncoding);
  v18.i32[0] = 0;
  v19.i32[1] = HIDWORD(*(_QWORD *)self->_anon_118);
  v19.i32[0] = 1;
  v20 = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v18, *(int32x2_t *)self->_anon_118), 0), v19, *(int8x8_t *)self->_anon_118);
  v21 = vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v18, vdup_lane_s32(v20, 1)), 0), (int8x8_t)(v20.u32[0] | 0x100000000), (int8x8_t)v20);
  if (v21.i32[0] >> v3 <= 1)
    v22 = 1;
  else
    v22 = (v21.i32[0] >> v3);
  if (v21.i32[1] >> v3 <= 1)
    v23 = 1;
  else
    v23 = (v21.i32[1] >> v3);
  v24 = self->_textureData.channelCount;
  if (objc_msgSend_length(v8, v15, v16) != (_DWORD)v22 * (v24 * v17 / 8) * (_DWORD)v23)
  {
    CGColorSpaceRelease(DeviceGray);
LABEL_29:
    Image = 0;
    goto LABEL_30;
  }
  v25 = objc_retainAutorelease(v8);
  v28 = (void *)objc_msgSend_bytes(v25, v26, v27);
  v29 = CGBitmapContextCreate(v28, v22, v23, v17, (uint64_t)(int)(v22 * v17 * self->_textureData.channelCount+ ((int)v22 * v17 * self->_textureData.channelCount < 0 ? 7 : 0)) >> 3, DeviceGray, v13);
  Image = CGBitmapContextCreateImage(v29);
  CGColorSpaceRelease(DeviceGray);
  if (v29)
    CGContextRelease(v29);
  CFAutorelease(Image);
LABEL_30:

  return Image;
}

- (NSData)texelDataWithTopLeftOriginAtMipLevel:(NSInteger)level create:(BOOL)create
{
  int32x2_t v4;
  NSData **topLeftOriginData;
  Class *v7;
  Class v8;
  int8x8_t v9;
  int32x2_t v10;
  int channelCount;
  int v12;
  uint64_t v13;
  NSData *v14;
  NSData *v15;
  const char *v16;
  uint64_t v17;
  double v19;

  topLeftOriginData = self->_topLeftOriginData;
  if (!self->_topLeftOriginData[level])
  {
    v7 = &self->super.isa + level;
    v8 = v7[53];
    if (v8)
    {
      v4.i32[0] = 0;
      v9.i32[1] = HIDWORD(*(_QWORD *)self->_anon_118);
      v9.i32[0] = 1;
      v10 = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v4, *(int32x2_t *)self->_anon_118), 0), v9, *(int8x8_t *)self->_anon_118);
      v19 = COERCE_DOUBLE(vmax_s32(vshl_s32((int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v4, vdup_lane_s32(v10, 1)), 0), (int8x8_t)(v10.u32[0] | 0x100000000), (int8x8_t)v10), vneg_s32(vdup_n_s32(level))), (int32x2_t)0x100000001));
      channelCount = self->_textureData.channelCount;
      v12 = sub_1DCAC8EDC(self->_channelEncoding);
      sub_1DCC2C550(v8, v12 / 8 * channelCount * LODWORD(v19), v19);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = topLeftOriginData[level];
      topLeftOriginData[level] = (NSData *)v13;

      v15 = objc_retainAutorelease(topLeftOriginData[level]);
      v7[2] = (Class)objc_msgSend_bytes(v15, v16, v17);
    }
    else
    {
      objc_msgSend_loadDataWithTopLeftOriginAtMipLevel_create_selector_(self, a2, level, create, a2);
    }
  }
  return topLeftOriginData[level];
}

- (id)texelDataWithTopLeftOrigin:(unint64_t)a3
{
  return (id)objc_msgSend_texelDataWithTopLeftOriginAtMipLevel_create_(self, a2, a3, self->_selfCreating);
}

+ (MDLTexture)textureNamed:(NSString *)name assetResolver:(id)resolver
{
  NSString *v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  id v10;
  NSString *v11;
  const char *v12;
  uint64_t v13;
  char *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  void *v46;
  char v47;
  void *__p;
  char v49;
  __int128 v50;
  uint64_t v51;
  void *v52[2];
  uint64_t v53;

  v5 = name;
  v6 = resolver;
  objc_msgSend_resolveAssetNamed_(v6, v7, (uint64_t)v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v6;
    v52[0] = 0;
    v52[1] = 0;
    v53 = 0;
    v11 = objc_retainAutorelease(v5);
    v14 = (char *)objc_msgSend_UTF8String(v11, v12, v13);
    sub_1DCB0345C(&v46, v14);
    pxrInternal__aapl__pxrReserved__::ArSplitPackageRelativePathInner();
    *(_OWORD *)v52 = v50;
    v53 = v51;
    v51 = 0;
    v50 = 0uLL;
    if (v49 < 0)
      operator delete(__p);
    if (v47 < 0)
      operator delete(v46);
    if (v53 >= 0)
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v15, (uint64_t)v52);
    else
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v15, (uint64_t)v52[0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pathExtension(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lowercaseString(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend_isEqualToString_(v22, v23, (uint64_t)CFSTR("jpg")) & 1) == 0
      && (objc_msgSend_isEqualToString_(v22, v24, (uint64_t)CFSTR("png")) & 1) == 0
      && (objc_msgSend_isEqualToString_(v22, v24, (uint64_t)CFSTR("jpeg")) & 1) == 0)
    {
      NSLog(CFSTR("Warning: unsupported image format %@ in USDZ archive"), v22);
    }
    objc_msgSend_resolveInsideArchiveWithAssetNamed_(v10, v24, (uint64_t)v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v25;
    if (v25)
    {
      objc_msgSend_objectAtIndexedSubscript_(v25, v26, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend_longValue(v28, v29, v30);

      objc_msgSend_objectAtIndexedSubscript_(v27, v32, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend_longValue(v33, v34, v35);

      objc_msgSend_data(v10, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend_data(v10, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_textureWithData_offset_size_(MDLTexture, v43, (uint64_t)v42, v31, v36);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend_textureWithURL_offset_size_(MDLTexture, v40, (uint64_t)v8, v31, v36);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v44 = 0;
    }

    if (SHIBYTE(v53) < 0)
      operator delete(v52[0]);

  }
  else
  {
    objc_msgSend_textureWithURL_(MDLTexture, v9, (uint64_t)v8);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (MDLTexture *)v44;
}

+ (MDLTexture)textureWithURL:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5
{
  id v7;
  MDLMemoryMappedData *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const __CFData *v13;
  const __CFData *v14;
  CGImageSource *v15;
  void *isCube;
  CGImage *ImageAtIndex;
  int Width;
  int Height;
  id v20;
  size_t v21;
  const char *v22;
  CGColorSpace *DeviceRGB;
  id v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  CGContext *v28;
  id v29;
  const char *v30;
  char v32;
  id v33;
  CGRect v35;

  v7 = a3;
  v8 = [MDLMemoryMappedData alloc];
  v10 = (void *)objc_msgSend_initWithURL_offset_length_(v8, v9, (uint64_t)v7, a4, a5);
  objc_msgSend_dataNoCopy(v10, v11, v12);
  v13 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    goto LABEL_5;
  v15 = CGImageSourceCreateWithData(v13, 0);
  isCube = v15;
  if (v15)
  {
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v15, 0, 0);
    CFRelease(isCube);
    if (ImageAtIndex)
    {
      Width = CGImageGetWidth(ImageAtIndex);
      Height = CGImageGetHeight(ImageAtIndex);
      v20 = objc_alloc(MEMORY[0x1E0C99DF0]);
      v21 = 4 * Width;
      v33 = (id)objc_msgSend_initWithLength_(v20, v22, Height * v21);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v24 = objc_retainAutorelease(v33);
      v27 = (void *)objc_msgSend_bytes(v24, v25, v26);
      v28 = CGBitmapContextCreate(v27, Width, Height, 8uLL, v21, DeviceRGB, 1u);
      CFRelease(DeviceRGB);
      CGContextSetBlendMode(v28, kCGBlendModeCopy);
      v35.size.width = (double)Width;
      v35.size.height = (double)Height;
      v35.origin.x = 0.0;
      v35.origin.y = 0.0;
      CGContextDrawImage(v28, v35, ImageAtIndex);
      CGContextRelease(v28);
      CFRelease(ImageAtIndex);
      v29 = objc_alloc((Class)a1);
      v32 = 0;
      isCube = (void *)objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v29, v30, (uint64_t)v24, 1, 0, v21, 4, 1, COERCE_DOUBLE(__PAIR64__(Height, Width)), v32);

      goto LABEL_6;
    }
LABEL_5:
    isCube = 0;
  }
LABEL_6:

  return (MDLTexture *)isCube;
}

- (MDLTexture)initWithData:(NSData *)pixelData topLeftOrigin:(BOOL)topLeftOrigin name:(NSString *)name dimensions:(vector_int2)dimensions rowStride:(NSInteger)rowStride channelCount:(NSUInteger)channelCount channelEncoding:(MDLTextureChannelEncoding)channelEncoding isCube:(BOOL)isCube
{
  int v11;
  _BOOL4 v15;
  NSData *v17;
  NSString *v18;
  MDLTexture *v19;
  const char *v20;
  uint64_t v21;
  MDLTexture *v22;
  const char *v23;
  uint64_t v24;
  NSString *v25;
  NSData *v26;
  NSData *v27;
  NSData *v28;
  NSData *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSData *v34;
  NSData *v35;
  const char *v36;
  uint64_t v37;
  MDLTexture *v38;
  objc_super v40;

  v11 = channelCount;
  v15 = topLeftOrigin;
  v17 = pixelData;
  v18 = name;
  v40.receiver = self;
  v40.super_class = (Class)MDLTexture;
  v19 = -[MDLTexture init](&v40, sel_init);
  v22 = v19;
  if (v19)
  {
    objc_msgSend_clearTexelData(v19, v20, v21);
    if (v18)
    {
      objc_msgSend_stringWithString_(MEMORY[0x1E0CB3940], v23, (uint64_t)v18);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v22->_name;
      v22->_name = (NSString *)v24;
    }
    else
    {
      v25 = v22->_name;
      v22->_name = (NSString *)&stru_1EA577998;
    }

    v26 = v17;
    v27 = v26;
    if (v15)
    {
      v28 = v22->_topLeftOriginData[0];
      v22->_topLeftOriginData[0] = v26;

      v29 = objc_retainAutorelease(v27);
      v32 = objc_msgSend_bytes(v29, v30, v31);
      v33 = 16;
    }
    else
    {
      v34 = v22->_bottomLeftOriginData[0];
      v22->_bottomLeftOriginData[0] = v26;

      v35 = objc_retainAutorelease(v27);
      v32 = objc_msgSend_bytes(v35, v36, v37);
      v33 = 144;
    }
    *(Class *)((char *)&v22->super.isa + v33) = (Class)v32;
    *(vector_int2 *)v22->_anon_118 = dimensions;
    *(_QWORD *)&v22->_anon_118[8] = rowStride;
    v22->_textureData.channelCount = v11;
    v22->_channelEncoding = channelEncoding;
    v22->_anon_118[16] = isCube;
    v38 = v22;
  }

  return v22;
}

- (void)clearTexelData
{
  uint64_t i;
  _QWORD *v4;
  NSData *v5;
  NSData *v6;

  for (i = 0; i != 14; ++i)
  {
    v4 = (Class *)((char *)&self->super.isa + i * 8);
    v5 = self->_topLeftOriginData[i];
    self->_topLeftOriginData[i] = 0;

    v4[2] = 0;
    v6 = self->_bottomLeftOriginData[i];
    v4[53] = 0;

    v4[18] = 0;
  }
}

- (BOOL)isCube
{
  return self->_anon_118[16];
}

- (CGImageRef)imageFromTexture
{
  return (CGImageRef)objc_msgSend_imageFromTextureAtLevel_(self, a2, 0);
}

- (vector_int2)dimensions
{
  return *(vector_int2 *)self->_anon_118;
}

- (NSInteger)rowStride
{
  return *(_QWORD *)&self->_anon_118[8];
}

- (NSUInteger)channelCount
{
  return self->_textureData.channelCount;
}

- (MDLTextureData)textureData
{
  return &self->_textureData;
}

- (void)setIsCube:(BOOL)isCube
{
  self->_anon_118[16] = isCube;
}

- (BOOL)hasAlphaValues
{
  BOOL v3;
  NSData *v4;
  NSData *v6;
  NSData *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSData *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;

  if (self->_textureData.channelCount < 4
    || (*(_QWORD *)self->_anon_118 ? (v3 = HIDWORD(*(_QWORD *)self->_anon_118) == 0) : (v3 = 1), v3))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = *(NSData **)&self->_anon_118[8];
    if (v4)
    {
      v6 = self->_topLeftOriginData[0];
      if (v6 || (v4 = self->_bottomLeftOriginData[0]) != 0)
      {
        if (self->_alphaValuesSet)
        {
          LOBYTE(v4) = self->_hasAlphaValues;
        }
        else
        {
          v7 = objc_retainAutorelease(v6);
          v10 = objc_msgSend_bytes(v7, v8, v9);
          if (!v10)
          {
            v11 = objc_retainAutorelease(self->_bottomLeftOriginData[0]);
            v10 = objc_msgSend_bytes(v11, v12, v13);
          }
          v14 = *(_QWORD *)self->_anon_118;
          if (SHIDWORD(v14) < 1)
          {
            LOBYTE(v4) = 0;
          }
          else
          {
            v15 = 0;
            do
            {
              if ((int)v14 < 1)
              {
                LOBYTE(v4) = 0;
              }
              else
              {
                v16 = 0;
                do
                {
                  v17 = HIBYTE(*(_DWORD *)(v10 + 4 * v16));
                  LOBYTE(v4) = v17 != 255;
                  ++v16;
                }
                while (v16 < (int)v14 && v17 >= 0xFF);
              }
              if (++v15 >= (unint64_t)HIDWORD(v14))
                break;
              v10 += *(_QWORD *)&self->_anon_118[8];
            }
            while ((v4 & 1) == 0);
          }
          self->_hasAlphaValues = (char)v4;
          self->_alphaValuesSet = 1;
        }
      }
    }
  }
  return (char)v4;
}

- (void)setHasAlphaValues:(BOOL)hasAlphaValues
{
  self->_alphaValuesSet = 1;
  self->_hasAlphaValues = hasAlphaValues;
}

- (id)allocateDataAtLevel:(int64_t)a3
{
  int32x2_t v3;
  int8x8_t v4;
  int32x2_t v5;
  int8x8_t v6;
  int v7;
  int v8;
  int channelCount;
  int v10;
  id v11;
  const char *v12;

  v3.i32[0] = 0;
  v4.i32[1] = HIDWORD(*(_QWORD *)self->_anon_118);
  v4.i32[0] = 1;
  v5 = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v3, *(int32x2_t *)self->_anon_118), 0), v4, *(int8x8_t *)self->_anon_118);
  v6 = vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v3, vdup_lane_s32(v5, 1)), 0), (int8x8_t)(v5.u32[0] | 0x100000000), (int8x8_t)v5);
  if (v6.i32[0] >> a3 <= 1)
    v7 = 1;
  else
    v7 = v6.i32[0] >> a3;
  if (v6.i32[1] >> a3 <= 1)
    v8 = 1;
  else
    v8 = v6.i32[1] >> a3;
  channelCount = self->_textureData.channelCount;
  v10 = (int)sub_1DCAC8EDC(self->_channelEncoding) / 8;
  v11 = objc_alloc(MEMORY[0x1E0C99DF0]);
  return (id)objc_msgSend_initWithLength_(v11, v12, v10 * channelCount * v8 * v7);
}

- (id)generateDataAtLevel:(int64_t)a3 selector:(SEL)a4
{
  unsigned int v4;
  void *v6;
  int channelCount;
  const char *v8;
  uint64_t v9;
  int v10;
  int32x2_t v11;
  int v13;
  int8x8_t v14;
  int32x2_t v15;
  int8x8_t v16;
  int v17;
  int v18;
  uint64_t i;
  Class *v20;
  Class v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  _DWORD *v26;
  int v27;
  _DWORD *v28;
  int v29;
  objc_class *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  const char *v35;
  uint64_t v36;
  _DWORD *v37;
  int v38;
  _DWORD *v39;
  int v40;

  v4 = a3;
  objc_msgSend_allocateDataAtLevel_(self, a2, a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  channelCount = self->_textureData.channelCount;
  v10 = sub_1DCAC8EDC(self->_channelEncoding) & 0xFFFFFFF8;
  if (channelCount == 4 && v10 == 8)
  {
    v11.i32[0] = 0;
    v13 = 1;
    v14.i32[1] = HIDWORD(*(_QWORD *)self->_anon_118);
    v14.i32[0] = 1;
    v15 = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v11, *(int32x2_t *)self->_anon_118), 0), v14, *(int8x8_t *)self->_anon_118);
    v16 = vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v11, vdup_lane_s32(v15, 1)), 0), (int8x8_t)(v15.u32[0] | 0x100000000), (int8x8_t)v15);
    if (v16.i32[0] >> v4 <= 1)
      v17 = 1;
    else
      v17 = v16.i32[0] >> v4;
    if (v16.i32[1] >> v4 <= 1)
      v18 = 1;
    else
      v18 = v16.i32[1] >> v4;
    for (i = v4; (int)i >= 1; --i)
    {
      v13 *= 2;
      v20 = &self->super.isa + i;
      v21 = v20[38];
      if (v21)
      {
        v30 = objc_retainAutorelease(v21);
        v33 = objc_msgSend_bytes(v30, v31, v32);
        v34 = objc_retainAutorelease(v6);
        v37 = (_DWORD *)objc_msgSend_bytes(v34, v35, v36);
        v38 = 0;
        do
        {
          v39 = (_DWORD *)v33;
          v40 = v17;
          do
          {
            *v37++ = *v39;
            v39 += v13;
            --v40;
          }
          while (v40);
          ++v38;
          v33 += 4 * v13 * v17 * v13;
        }
        while (v38 != v18);
        return v6;
      }
      if (v20[52])
      {
        v22 = objc_msgSend_bytes(0, v8, v9);
        v23 = objc_retainAutorelease(v6);
        v26 = (_DWORD *)objc_msgSend_bytes(v23, v24, v25);
        v27 = 0;
        do
        {
          v28 = (_DWORD *)v22;
          v29 = v17;
          do
          {
            *v26++ = *v28;
            v28 += v13;
            --v29;
          }
          while (v29);
          ++v27;
          v22 += 4 * v13 * v17 * v13;
        }
        while (v27 != v18);
        return v6;
      }
    }
  }
  return v6;
}

- (MDLTexture)init
{
  MDLTexture *v2;
  const char *v3;
  uint64_t v4;
  MDLTexture *v5;
  NSString *name;
  MDLTexture *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MDLTexture;
  v2 = -[MDLTexture init](&v9, sel_init);
  v5 = v2;
  if (v2)
  {
    objc_msgSend_clearTexelData(v2, v3, v4);
    name = v5->_name;
    v5->_name = (NSString *)&stru_1EA577998;

    v7 = v5;
  }

  return v5;
}

- (NSUInteger)mipLevelCount
{
  NSUInteger result;
  Class *v4;

  for (result = 0; result != 14; ++result)
  {
    v4 = &self->super.isa + result;
    if (!v4[39] && !v4[53])
      break;
  }
  return result;
}

+ (id)_textureCubeWithSingleImageNamed:(id)a3 bundle:(id)a4
{
  id v6;
  const char *v7;
  const __CFURL *v8;
  CGImageSource *v9;
  CGImageSource *v10;
  CGImage *ImageAtIndex;
  __int32 Width;
  int Height;
  id v14;
  const char *v15;
  int32x2_t v16;
  size_t v17;
  int32x2_t v18;
  int32x2_t v19;
  int8x8_t v20;
  int v21;
  int v22;
  CGImage *v23;
  CGImage *v24;
  size_t v25;
  size_t v26;
  CGColorSpace *v27;
  const char *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  CGContext *v33;
  void *v34;
  id v35;
  const char *v36;
  size_t v37;
  int v38;
  CGImage *v39;
  CGImage *v40;
  size_t v41;
  CGColorSpace *DeviceRGB;
  const char *v43;
  id v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  CGContext *v48;
  int v49;
  int v50;
  int v51;
  CGImage *v52;
  id v54;
  void *v55;
  CGImage *cf;
  void *isCube;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v6 = a3;
  v54 = a4;
  v55 = v6;
  sub_1DCC2B258(v6, v54);
  v8 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v7, (uint64_t)v6);
    v8 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_19;
  }
  v9 = CGImageSourceCreateWithURL(v8, 0);
  v10 = v9;
  if (!v9)
    goto LABEL_19;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v9, 0, 0);
  if (!ImageAtIndex)
  {
    CFRelease(v10);
LABEL_19:

    v34 = 0;
    goto LABEL_34;
  }

  Width = CGImageGetWidth(ImageAtIndex);
  Height = CGImageGetHeight(ImageAtIndex);
  cf = ImageAtIndex;
  if (Height <= Width)
  {
    v35 = objc_alloc((Class)a1);
    isCube = (void *)objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v35, v36, 0, 1, v6, 4 * Height, 4, 1, COERCE_DOUBLE(__PAIR64__(Width, Height)), 1);
    v37 = 0;
    if (Height < 0)
      v38 = 1;
    else
      v38 = Height;
    while (CGImageSourceGetCount(v10) > v37)
    {
      if (v37)
        v39 = CGImageSourceCreateImageAtIndex(v10, v37, 0);
      else
        v39 = (CGImage *)CFRetain(cf);
      v40 = v39;
      if (v38 >> v37 <= 1)
        v41 = 1;
      else
        v41 = (v38 >> v37);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      objc_msgSend_texelDataWithTopLeftOriginAtMipLevel_create_(isCube, v43, v37, 1);
      v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v47 = (void *)objc_msgSend_bytes(v44, v45, v46);
      v48 = CGBitmapContextCreate(v47, v41, (6 * v41), 8uLL, (4 * v41), DeviceRGB, 1u);
      CFRelease(DeviceRGB);

      CGContextSetBlendMode(v48, kCGBlendModeCopy);
      v49 = 0;
      v50 = 5 * v41;
      v51 = 6;
      do
      {
        v59.origin.x = (double)v49;
        v59.origin.y = 0.0;
        v59.size.width = (double)(int)v41;
        v59.size.height = (double)(int)v41;
        v52 = CGImageCreateWithImageInRect(v40, v59);
        v60.origin.y = (float)v50;
        v60.origin.x = 0.0;
        v60.size.width = (double)(int)v41;
        v60.size.height = (double)(int)v41;
        CGContextDrawImage(v48, v60, v52);
        CGImageRelease(v52);
        v49 += v41;
        v50 -= v41;
        --v51;
      }
      while (v51);
      CGContextRelease(v48);
      CGImageRelease(v40);
      ++v37;
    }
  }
  else
  {
    v14 = objc_alloc((Class)a1);
    isCube = (void *)objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v14, v15, 0, 1, v6, 4 * Width, 4, 1, 1);
    v16.i32[0] = 0;
    v17 = 0;
    v18.i32[0] = Width;
    v19 = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v16, v18), 0), (int8x8_t)__PAIR64__(Height, 1), (int8x8_t)__PAIR64__(Height, Width));
    v20 = vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v16, vdup_lane_s32(v19, 1)), 0), (int8x8_t)(v19.u32[0] | 0x100000000), (int8x8_t)v19);
    v21 = v20.i32[1];
    v22 = v20.i32[0];
    while (CGImageSourceGetCount(v10) > v17)
    {
      if (v17)
        v23 = CGImageSourceCreateImageAtIndex(v10, v17, 0);
      else
        v23 = (CGImage *)CFRetain(cf);
      v24 = v23;
      if (v22 >> v17 <= 1)
        v25 = 1;
      else
        v25 = (v22 >> v17);
      if (v21 >> v17 <= 1)
        v26 = 1;
      else
        v26 = (v21 >> v17);
      v27 = CGColorSpaceCreateDeviceRGB();
      objc_msgSend_texelDataWithTopLeftOriginAtMipLevel_create_(isCube, v28, v17, 1);
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v32 = (void *)objc_msgSend_bytes(v29, v30, v31);
      v33 = CGBitmapContextCreate(v32, v25, v26, 8uLL, (4 * v25), v27, 1u);
      CFRelease(v27);

      CGContextSetBlendMode(v33, kCGBlendModeCopy);
      v58.size.width = (double)(int)v25;
      v58.size.height = (double)(int)v26;
      v58.origin.x = 0.0;
      v58.origin.y = 0.0;
      CGContextDrawImage(v33, v58, v24);
      CGContextRelease(v33);
      CFRelease(v24);
      ++v17;
    }
  }
  v34 = isCube;
  CFRelease(cf);
  CFRelease(v10);
LABEL_34:

  return v34;
}

+ (MDLTexture)textureWithURL:(id)a3
{
  const __CFURL *v4;
  const __CFURL *v5;
  CGImageSource *v6;
  CGImageSource *v7;
  CGImage *ImageAtIndex;
  int Width;
  int Height;
  id v11;
  size_t v12;
  const char *v13;
  void *v14;
  CGColorSpace *DeviceRGB;
  id v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  CGContext *v20;
  id v21;
  const char *v22;
  void *isCube;
  char v25;
  CGRect v26;

  v4 = (const __CFURL *)a3;
  v5 = v4;
  if (v4
    && (v6 = CGImageSourceCreateWithURL(v4, 0), (v7 = v6) != 0)
    && (ImageAtIndex = CGImageSourceCreateImageAtIndex(v6, 0, 0), CFRelease(v7), ImageAtIndex))
  {
    Width = CGImageGetWidth(ImageAtIndex);
    Height = CGImageGetHeight(ImageAtIndex);
    v11 = objc_alloc(MEMORY[0x1E0C99DF0]);
    v12 = 4 * Width;
    v14 = (void *)objc_msgSend_initWithLength_(v11, v13, Height * v12);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v16 = objc_retainAutorelease(v14);
    v19 = (void *)objc_msgSend_bytes(v16, v17, v18);
    v20 = CGBitmapContextCreate(v19, Width, Height, 8uLL, v12, DeviceRGB, 1u);
    CFRelease(DeviceRGB);
    CGContextSetBlendMode(v20, kCGBlendModeCopy);
    v26.size.width = (double)Width;
    v26.size.height = (double)Height;
    v26.origin.x = 0.0;
    v26.origin.y = 0.0;
    CGContextDrawImage(v20, v26, ImageAtIndex);
    CGContextRelease(v20);
    CFRelease(ImageAtIndex);
    v21 = objc_alloc((Class)a1);
    v25 = 0;
    isCube = (void *)objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v21, v22, (uint64_t)v16, 1, 0, v12, 4, 1, COERCE_DOUBLE(__PAIR64__(Height, Width)), v25);

  }
  else
  {
    isCube = 0;
  }

  return (MDLTexture *)isCube;
}

+ (MDLTexture)textureWithData:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5
{
  id v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const __CFData *v15;
  CGImageSource *v16;
  void *isCube;
  CGImage *ImageAtIndex;
  int Width;
  int Height;
  void *v21;
  CGColorSpace *DeviceRGB;
  CGContext *v23;
  id v24;
  const char *v25;
  void *v26;
  id v27;
  const char *v28;
  objc_class *v30;
  CGRect v31;

  v8 = a3;
  v9 = (void *)MEMORY[0x1E0C99D50];
  v10 = objc_retainAutorelease(v8);
  v13 = objc_msgSend_bytes(v10, v11, v12);
  objc_msgSend_dataWithBytes_length_(v9, v14, v13 + a4, a5);
  v15 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v16 = CGImageSourceCreateWithData(v15, 0);
  isCube = v16;
  if (v16)
  {
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v16, 0, 0);
    CFRelease(isCube);
    if (ImageAtIndex)
    {
      v30 = (objc_class *)a1;
      Width = CGImageGetWidth(ImageAtIndex);
      Height = CGImageGetHeight(ImageAtIndex);
      v21 = malloc_type_malloc(Height * (uint64_t)(4 * Width), 0xA58C4EA5uLL);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v23 = CGBitmapContextCreate(v21, Width, Height, 8uLL, 4 * Width, DeviceRGB, 1u);
      CFRelease(DeviceRGB);
      CGContextSetBlendMode(v23, kCGBlendModeCopy);
      v31.size.width = (double)Width;
      v31.size.height = (double)Height;
      v31.origin.x = 0.0;
      v31.origin.y = 0.0;
      CGContextDrawImage(v23, v31, ImageAtIndex);
      CGContextRelease(v23);
      v24 = objc_alloc(MEMORY[0x1E0C99DF0]);
      v26 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v24, v25, (uint64_t)v21, Height * (uint64_t)(4 * Width), 1);
      CFRelease(ImageAtIndex);
      v27 = [v30 alloc];
      isCube = (void *)objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v27, v28, (uint64_t)v26, 1, 0, 4 * Width, 4, 1, COERCE_DOUBLE(__PAIR64__(Height, Width)), 0);

    }
    else
    {
      isCube = 0;
    }
  }

  return (MDLTexture *)isCube;
}

+ (id)textureResourceNamed:(id)a3 assetResolver:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  void *v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  char *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  MDLMemoryMappedData *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  void *v42;
  char v43;
  void *__p;
  char v45;
  __int128 v46;
  uint64_t v47;
  void *v48[2];
  uint64_t v49;

  v5 = a3;
  v6 = a4;
  objc_msgSend_resolveAssetNamed_(v6, v7, (uint64_t)v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v6;
    v48[0] = 0;
    v48[1] = 0;
    v49 = 0;
    v10 = objc_retainAutorelease(v5);
    v13 = (char *)objc_msgSend_UTF8String(v10, v11, v12);
    sub_1DCB0345C(&v42, v13);
    pxrInternal__aapl__pxrReserved__::ArSplitPackageRelativePathInner();
    *(_OWORD *)v48 = v46;
    v49 = v47;
    v47 = 0;
    v46 = 0uLL;
    if (v45 < 0)
      operator delete(__p);
    if (v43 < 0)
      operator delete(v42);
    if (v49 >= 0)
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v14, (uint64_t)v48);
    else
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v14, (uint64_t)v48[0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pathExtension(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lowercaseString(v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend_isEqualToString_(v21, v22, (uint64_t)CFSTR("jpg")) & 1) == 0
      && (objc_msgSend_isEqualToString_(v21, v23, (uint64_t)CFSTR("png")) & 1) == 0
      && (objc_msgSend_isEqualToString_(v21, v23, (uint64_t)CFSTR("jpeg")) & 1) == 0)
    {
      NSLog(CFSTR("Warning: unsupported image format %@ in USDZ archive"), v21);
    }
    objc_msgSend_resolveInsideArchiveWithAssetNamed_(v9, v23, (uint64_t)v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v24, v25, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend_longValue(v26, v27, v28);

    objc_msgSend_objectAtIndexedSubscript_(v24, v30, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_longValue(v31, v32, v33);

    v35 = [MDLMemoryMappedData alloc];
    v37 = (void *)objc_msgSend_initWithURL_offset_length_(v35, v36, (uint64_t)v8, v29, v34);
    objc_msgSend_dataNoCopy(v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (SHIBYTE(v49) < 0)
      operator delete(v48[0]);

  }
  else
  {
    NSLog(CFSTR("Needs MDLAsset loaded from a USDZ file."));
    v40 = 0;
  }

  return v40;
}

+ (id)textureFromResource:(id)a3
{
  const __CFData *v4;
  CGImageSource *v5;
  CGImageSource *v6;
  CGImage *ImageAtIndex;
  int Width;
  int Height;
  id v10;
  size_t v11;
  const char *v12;
  void *v13;
  CGColorSpace *DeviceRGB;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  CGContext *v19;
  id v20;
  const char *v21;
  void *isCube;
  char v24;
  CGRect v25;

  v4 = (const __CFData *)a3;
  v5 = CGImageSourceCreateWithData(v4, 0);
  v6 = v5;
  if (v5 && (ImageAtIndex = CGImageSourceCreateImageAtIndex(v5, 0, 0), CFRelease(v6), ImageAtIndex))
  {
    Width = CGImageGetWidth(ImageAtIndex);
    Height = CGImageGetHeight(ImageAtIndex);
    v10 = objc_alloc(MEMORY[0x1E0C99DF0]);
    v11 = 4 * Width;
    v13 = (void *)objc_msgSend_initWithLength_(v10, v12, Height * v11);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v15 = objc_retainAutorelease(v13);
    v18 = (void *)objc_msgSend_bytes(v15, v16, v17);
    v19 = CGBitmapContextCreate(v18, Width, Height, 8uLL, v11, DeviceRGB, 1u);
    CFRelease(DeviceRGB);
    CGContextSetBlendMode(v19, kCGBlendModeCopy);
    v25.size.width = (double)Width;
    v25.size.height = (double)Height;
    v25.origin.x = 0.0;
    v25.origin.y = 0.0;
    CGContextDrawImage(v19, v25, ImageAtIndex);
    CGContextRelease(v19);
    CFRelease(ImageAtIndex);
    v20 = objc_alloc((Class)a1);
    v24 = 0;
    isCube = (void *)objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v20, v21, (uint64_t)v15, 1, 0, v11, 4, 1, COERCE_DOUBLE(__PAIR64__(Height, Width)), v24);

  }
  else
  {
    isCube = 0;
  }

  return isCube;
}

+ (MDLTexture)textureNamed:(NSString *)name bundle:(NSBundle *)bundleOrNil
{
  NSString *v6;
  const char *v7;
  uint64_t v8;
  NSBundle *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;

  v6 = name;
  v9 = bundleOrNil;
  if (v6 && objc_msgSend_length(v6, v7, v8))
  {
    if (!v9)
    {
      objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v10, v11);
      v9 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    }
    sub_1DCC2B258(v6, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend_textureWithURL_(a1, v12, (uint64_t)v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return (MDLTexture *)v14;
}

+ (MDLTexture)textureNamed:(NSString *)name
{
  objc_msgSend_textureNamed_bundle_(a1, a2, (uint64_t)name, 0);
  return (MDLTexture *)(id)objc_claimAutoreleasedReturnValue();
}

+ (MDLTexture)textureCubeWithImagesNamed:(NSArray *)names bundle:(NSBundle *)bundleOrNil
{
  NSArray *v6;
  NSBundle *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *isCube;
  uint64_t v15;
  void *v16;
  const __CFURL *v17;
  const char *v18;
  void *v19;
  void *v20;
  const char *v21;
  CGImageSource *v22;
  CGImageSource *v23;
  CGImage *v24;
  int Width;
  int Height;
  id v27;
  size_t v28;
  const char *v29;
  CGColorSpace *DeviceRGB;
  id v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  CGContext *v35;
  uint64_t v36;
  double v37;
  double v38;
  int v39;
  uint64_t i;
  CGImageRef v41;
  id v42;
  const char *v43;
  double v45;
  objc_class *v46;
  id v47;
  CGImageRef image[2];
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  CGRect v52;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = names;
  v7 = bundleOrNil;
  if (objc_msgSend_count(v6, v8, v9) == 1)
  {
    objc_msgSend_firstObject(v6, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__textureCubeWithSingleImageNamed_bundle_(a1, v13, (uint64_t)v12, v7);
    isCube = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
    v49 = 0u;
    v50 = 0u;
    *(_OWORD *)image = 0u;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(v6, v10, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1DCC2B258(v16, v7);
      v17 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v19 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend_objectAtIndexedSubscript_(v6, v18, v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_fileURLWithPath_(v19, v21, (uint64_t)v20);
        v17 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

      }
      v22 = CGImageSourceCreateWithURL(v17, 0);
      v23 = v22;
      if (v22)
      {
        image[v15] = CGImageSourceCreateImageAtIndex(v22, 0, 0);
        CFRelease(v23);
      }

      ++v15;
    }
    while (v15 != 6);
    v24 = image[0];
    Width = CGImageGetWidth(image[0]);
    Height = CGImageGetHeight(v24);
    v27 = objc_alloc(MEMORY[0x1E0C99DF0]);
    v28 = 4 * Width;
    v47 = (id)objc_msgSend_initWithLength_(v27, v29, v28 * 6 * Height);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v31 = objc_retainAutorelease(v47);
    v34 = (void *)objc_msgSend_bytes(v31, v32, v33);
    v35 = CGBitmapContextCreate(v34, Width, 6 * Height, 8uLL, v28, DeviceRGB, 1u);
    CFRelease(DeviceRGB);
    v46 = (objc_class *)a1;
    CGContextSetBlendMode(v35, kCGBlendModeCopy);
    v36 = 0;
    LODWORD(v37) = Width;
    HIDWORD(v37) = 6 * Height;
    v45 = v37;
    v38 = (double)Width;
    v39 = 30 * Height;
    do
    {
      v52.origin.y = (double)(v39 / 6);
      v52.origin.x = 0.0;
      v52.size.width = v38;
      v52.size.height = (double)Height;
      CGContextDrawImage(v35, v52, image[v36]);
      v39 -= 6 * Height;
      ++v36;
    }
    while (v36 != 6);
    CGContextRelease(v35);
    for (i = 0; i != 6; ++i)
    {
      v41 = image[i];
      if (v41)
      {
        CFRelease(v41);
        image[i] = 0;
      }
    }
    v42 = [v46 alloc];
    isCube = (void *)objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v42, v43, (uint64_t)v31, 1, 0, v28, 4, 1, v45, 1);

  }
  return (MDLTexture *)isCube;
}

+ (MDLTexture)textureCubeWithImagesNamed:(NSArray *)names
{
  NSArray *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;

  v3 = names;
  objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_textureCubeWithImagesNamed_bundle_(MDLTexture, v7, (uint64_t)v3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MDLTexture *)v8;
}

- (void)loadDataWithTopLeftOriginAtMipLevel:(int64_t)a3 create:(BOOL)a4 selector:(SEL)a5
{
  NSData **topLeftOriginData;
  BOOL v8;
  uint64_t v9;
  NSData *v10;
  NSData *v11;
  const char *v12;
  uint64_t v13;

  if (a3 <= 13)
  {
    topLeftOriginData = self->_topLeftOriginData;
    if (self->_topLeftOriginData[a3])
      v8 = 1;
    else
      v8 = !a4;
    if (!v8)
    {
      objc_msgSend_generateDataAtLevel_selector_(self, a2, a3, a5);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = topLeftOriginData[a3];
      topLeftOriginData[a3] = (NSData *)v9;

      v11 = objc_retainAutorelease(topLeftOriginData[a3]);
      self->_textureData.topLeftBytesForMip[a3] = (char *)objc_msgSend_bytes(v11, v12, v13);
    }
  }
}

- (void)loadDataWithBottomLeftOriginAtMipLevel:(int64_t)a3 create:(BOOL)a4 selector:(SEL)a5
{
  NSData **bottomLeftOriginData;
  BOOL v8;
  uint64_t v9;
  NSData *v10;
  NSData *v11;
  const char *v12;
  uint64_t v13;

  if (a3 <= 13)
  {
    bottomLeftOriginData = self->_bottomLeftOriginData;
    if (self->_bottomLeftOriginData[a3])
      v8 = 1;
    else
      v8 = !a4;
    if (!v8)
    {
      objc_msgSend_generateDataAtLevel_selector_(self, a2, a3, a5);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = bottomLeftOriginData[a3];
      bottomLeftOriginData[a3] = (NSData *)v9;

      v11 = objc_retainAutorelease(bottomLeftOriginData[a3]);
      self->_textureData.bottomLeftBytesForMip[a3] = (char *)objc_msgSend_bytes(v11, v12, v13);
    }
  }
}

- (NSData)texelDataWithTopLeftOrigin
{
  return (NSData *)objc_msgSend_texelDataWithTopLeftOriginAtMipLevel_create_(self, a2, 0, self->_selfCreating);
}

- (NSData)texelDataWithBottomLeftOrigin
{
  return (NSData *)MEMORY[0x1E0DE7D20](self, sel_texelDataWithBottomLeftOriginAtMipLevel_create_, 0);
}

- (NSData)texelDataWithBottomLeftOriginAtMipLevel:(NSInteger)level create:(BOOL)create
{
  int32x2_t v4;
  NSData **bottomLeftOriginData;
  NSData **topLeftOriginData;
  NSData *v9;
  int8x8_t v10;
  int32x2_t v11;
  int channelCount;
  int v13;
  uint64_t v14;
  NSData *v15;
  NSData *v16;
  const char *v17;
  uint64_t v18;
  double v20;

  bottomLeftOriginData = self->_bottomLeftOriginData;
  if (!self->_bottomLeftOriginData[level])
  {
    topLeftOriginData = self->_topLeftOriginData;
    v9 = self->_topLeftOriginData[level];
    if (v9)
    {
      v4.i32[0] = 0;
      v10.i32[1] = HIDWORD(*(_QWORD *)self->_anon_118);
      v10.i32[0] = 1;
      v11 = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v4, *(int32x2_t *)self->_anon_118), 0), v10, *(int8x8_t *)self->_anon_118);
      v20 = COERCE_DOUBLE(vmax_s32(vshl_s32((int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v4, vdup_lane_s32(v11, 1)), 0), (int8x8_t)(v11.u32[0] | 0x100000000), (int8x8_t)v11), vneg_s32(vdup_n_s32(level))), (int32x2_t)0x100000001));
      channelCount = self->_textureData.channelCount;
      v13 = sub_1DCAC8EDC(self->_channelEncoding);
      sub_1DCC2C550(v9, v13 / 8 * channelCount * LODWORD(v20), v20);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = bottomLeftOriginData[level];
      bottomLeftOriginData[level] = (NSData *)v14;

      v16 = objc_retainAutorelease(topLeftOriginData[level]);
      self->_textureData.bottomLeftBytesForMip[level] = (char *)objc_msgSend_bytes(v16, v17, v18);
    }
    else
    {
      objc_msgSend_loadDataWithBottomLeftOriginAtMipLevel_create_selector_(self, a2, level, create, a2);
    }
  }
  return bottomLeftOriginData[level];
}

- (void)setTexelDataWithBottomLeftOrigin:(id)a3 atMipLevel:(int64_t)a4
{
  id *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a3;
  v7 = (id *)(&self->super.isa + a4);
  objc_storeStrong(v7 + 53, a3);
  v8 = objc_retainAutorelease(v7[53]);
  v7[18] = (id)objc_msgSend_bytes(v8, v9, v10);
  v11 = v7[39];
  v7[39] = 0;

  v7[2] = 0;
}

- (void)setTexelDataWithTopLeftOrigin:(id)a3 atMipLevel:(int64_t)a4
{
  objc_class *v6;
  Class *v7;
  Class v8;
  Class v9;
  objc_class *v10;
  objc_class *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = (objc_class *)a3;
  v7 = &self->super.isa + a4;
  v8 = v7[53];
  v7[53] = 0;

  v7[18] = 0;
  v9 = v7[39];
  v7[39] = v6;
  v10 = v6;

  v11 = objc_retainAutorelease(v10);
  v14 = objc_msgSend_bytes(v11, v12, v13);

  v7[2] = (Class)v14;
}

- (BOOL)writeToURL:(NSURL *)URL
{
  return MEMORY[0x1E0DE7D20](self, sel_writeToURL_level_, URL);
}

- (BOOL)writeToURL:(NSURL *)URL level:(NSUInteger)level
{
  NSURL *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  _QWORD *v15;
  char v16;
  BOOL v17;
  const char *v19;

  v6 = URL;
  objc_msgSend_pathExtension(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseString(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend_isEqualToString_(v12, v13, (uint64_t)CFSTR("jpeg")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v12, v14, (uint64_t)CFSTR("jpg")) & 1) != 0)
  {
    v15 = (_QWORD *)MEMORY[0x1E0CA5BA8];
LABEL_8:
    v16 = objc_msgSend_writeToURL_type_(self, v14, (uint64_t)v6, *v15);
    goto LABEL_9;
  }
  if ((objc_msgSend_isEqualToString_(v12, v14, (uint64_t)CFSTR("gif")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v12, v14, (uint64_t)CFSTR("tiff")) & 1) != 0
    || objc_msgSend_isEqualToString_(v12, v14, (uint64_t)CFSTR("tif")))
  {
    v15 = (_QWORD *)MEMORY[0x1E0CA5C80];
    goto LABEL_8;
  }
  if (objc_msgSend_isEqualToString_(v12, v14, (uint64_t)CFSTR("exr")))
    v16 = objc_msgSend_writeToURL_type_(self, v19, (uint64_t)v6, CFSTR("com.ilm.openexr-image"));
  else
    v16 = objc_msgSend_writeToURL_type_level_(self, v19, (uint64_t)v6, *MEMORY[0x1E0CA5C10], level);
LABEL_9:
  v17 = v16;

  return v17;
}

- (BOOL)writeToURL:(NSURL *)nsurl type:(CFStringRef)type
{
  return objc_msgSend_writeToURL_type_level_(self, a2, (uint64_t)nsurl, type, 0);
}

- (BOOL)writeToURL:(NSURL *)nsurl type:(CFStringRef)type level:(NSUInteger)level
{
  NSURL *v8;
  const char *v9;
  CGImage *v10;
  const __CFURL *v11;
  CGImageDestination *v12;
  CGImageDestination *v13;

  v8 = nsurl;
  v10 = (CGImage *)objc_msgSend_imageFromTextureAtLevel_(self, v9, level);
  if (v10)
  {
    v11 = v8;
    v12 = CGImageDestinationCreateWithURL(v11, type, 1uLL, 0);
    v13 = v12;
    if (v12)
    {
      CGImageDestinationAddImage(v12, v10, 0);
      LOBYTE(v10) = CGImageDestinationFinalize(v13);
      CFRelease(v13);
      if (v11)
        CFRelease(v11);
    }
    else
    {
      if (v11)
        CFRelease(v11);
      LOBYTE(v10) = 0;
    }
  }

  return (char)v10;
}

+ (MDLTexture)irradianceTextureCubeWithTexture:(MDLTexture *)texture name:(NSString *)name dimensions:(vector_int2)dimensions
{
  MDLTexture *v6;
  NSString *v7;
  float v8;
  float v9;
  MDLTexture *v10;
  double v11;
  const char *v12;
  uint64_t isCube;
  const char *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  void *v27;
  void *v28;
  const char *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  _BYTE *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  float32x4_t v37;
  int v38;
  int v39;
  int v40;
  double v41;
  __int128 v42;
  int v43;
  NSString *v45;
  float32x4_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  int v50;
  __int128 v51;
  void *__p;
  void *v53;
  uint64_t v54;

  v51 = *(_OWORD *)dimensions.i8;
  v6 = texture;
  v7 = name;
  if ((_DWORD)v51 == DWORD1(v51) && (v8 = log2f((float)(int)v51), 1 << (int)v8 == (_DWORD)v51))
  {
    v9 = v8;
    v10 = [MDLTexture alloc];
    LODWORD(v11) = v51;
    HIDWORD(v11) = 6 * v51;
    isCube = objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v10, v12, 0, 1, v7, 4 * (int)v51, 4, 1, v11, 1);
    objc_msgSend_texelDataWithTopLeftOrigin(v6, v14, v15);
    v45 = v7;
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = (const char *)objc_msgSend_bytes(v16, v17, v18);

    v50 = 0;
    v47 = 4 * (int)v51 * 6 * (int)v51;
    v48 = (void *)isCube;
    v20 = 4;
    v46 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    do
    {
      v21 = v51;
      __p = 0;
      v53 = 0;
      v54 = 0;
      sub_1DCC2DD54((uint64_t)&__p, 6 * (int)v51 * DWORD1(v51));
      v23 = 0;
      v24 = 0;
      v49 = (int)v51 * DWORD1(v51);
      do
      {
        sub_1DCC2D7D8(v6, v19, v24++, (float)v50 * (float)(1.0 / v9), *(double *)&v51, v22, v20, (uint64_t)__p + v23);
        v23 += 16 * v49;
      }
      while (v24 != 6);
      v25 = objc_alloc(MEMORY[0x1E0C99DF0]);
      v27 = (void *)objc_msgSend_initWithCapacity_(v25, v26, v47);
      v28 = v48;
      objc_msgSend_setLength_(v27, v29, v47);
      v30 = objc_retainAutorelease(v27);
      v33 = (_BYTE *)objc_msgSend_bytes(v30, v31, v32);
      if ((_DWORD)v49)
      {
        v35 = 0;
        if ((unint64_t)(6 * (int)v51 * DWORD1(v51)) <= 1)
          v36 = 1;
        else
          v36 = 6 * (int)v51 * DWORD1(v51);
        do
        {
          v37 = vminnmq_f32(vmaxnmq_f32(vmulq_f32(*((float32x4_t *)__p + v35), v46), (float32x4_t)0), v46);
          *v33 = (int)v37.f32[0];
          v33[1] = (int)v37.f32[1];
          v33[2] = (int)v37.f32[2];
          v33[3] = -1;
          v33 += 4;
          ++v35;
        }
        while (v36 != v35);
      }
      objc_msgSend_setTexelDataWithTopLeftOrigin_atMipLevel_(v48, v34, (uint64_t)v30, v50);
      if ((int)v51 >= 0)
        v38 = v51;
      else
        v38 = v51 + 1;
      v39 = v38 >> 1;
      if ((SDWORD1(v51) & 0x80000000) == 0)
        v40 = DWORD1(v51);
      else
        v40 = DWORD1(v51) + 1;
      LODWORD(v41) = v39;
      v42 = v51;
      if ((_DWORD)v51 != 1)
      {
        HIDWORD(v41) = v40 >> 1;
        *(double *)&v42 = v41;
      }
      v51 = v42;
      if (v21 == 1)
        v43 = v50;
      else
        v43 = v50 + 1;
      v50 = v43;
      if (v21 != 1)
        v20 *= 2;

      if (__p)
      {
        v53 = __p;
        operator delete(__p);
      }
    }
    while (v21 != 1);
    v7 = v45;
  }
  else
  {
    v28 = 0;
  }

  return (MDLTexture *)v28;
}

+ (MDLTexture)irradianceTextureCubeWithTexture:(MDLTexture *)texture name:(NSString *)name dimensions:(vector_int2)dimensions roughness:(float)roughness
{
  MDLTexture *v8;
  NSString *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  id v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  float32x4_t v32;
  float32x4_t v33;
  MDLTexture *v34;
  const char *v35;
  void *isCube;
  double v38;
  void *__p;
  void *v41;
  uint64_t v42;

  v8 = texture;
  v9 = name;
  if (dimensions.i32[0] == dimensions.i32[1] && 1 << (int)log2f((float)dimensions.i32[0]) == dimensions.i32[0])
  {
    objc_msgSend_texelDataWithTopLeftOrigin(v8, v10, v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend_bytes(v12, v13, v14);

    __p = 0;
    v41 = 0;
    v42 = 0;
    sub_1DCC2DD54((uint64_t)&__p, 6 * (dimensions.i32[0] * dimensions.i32[0]));
    v17 = 0;
    v18 = 0;
    LODWORD(v19) = dimensions.i32[0];
    HIDWORD(v19) = 6 * dimensions.i32[0];
    v38 = v19;
    do
    {
      sub_1DCC2D7D8(v8, v15, v18++, roughness, *(double *)&dimensions, v16, 1024, (uint64_t)__p + v17);
      v17 += 16 * (dimensions.i32[0] * dimensions.i32[0]);
    }
    while (v18 != 6);
    v20 = objc_alloc(MEMORY[0x1E0C99DF0]);
    v21 = 4 * dimensions.i32[0] * 6 * dimensions.i32[0];
    v23 = (void *)objc_msgSend_initWithCapacity_(v20, v22, v21);
    objc_msgSend_setLength_(v23, v24, v21);
    v25 = objc_retainAutorelease(v23);
    v28 = (_BYTE *)objc_msgSend_bytes(v25, v26, v27);
    if (dimensions.i32[0])
    {
      v29 = 0;
      if (6 * (unint64_t)(dimensions.i32[0] * dimensions.i32[0]) <= 1)
        v30 = 1;
      else
        v30 = 6 * (dimensions.i32[0] * dimensions.i32[0]);
      v31 = 16 * v30;
      v32 = (float32x4_t)vdupq_n_s32(0x437F0000u);
      do
      {
        v33 = vminnmq_f32(vmaxnmq_f32(vmulq_f32(*(float32x4_t *)((char *)__p + v29), v32), (float32x4_t)0), v32);
        *v28 = (int)v33.f32[0];
        v28[1] = (int)v33.f32[1];
        v28[2] = (int)v33.f32[2];
        v28[3] = -1;
        v28 += 4;
        v29 += 16;
      }
      while (v31 != v29);
    }
    v34 = [MDLTexture alloc];
    isCube = (void *)objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v34, v35, (uint64_t)v25, 1, v9, 4 * dimensions.i32[0], 4, 1, v38, 1);

    if (__p)
    {
      v41 = __p;
      operator delete(__p);
    }
  }
  else
  {
    isCube = 0;
  }

  return (MDLTexture *)isCube;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MDLTextureChannelEncoding)channelEncoding
{
  return self->_channelEncoding;
}

@end
