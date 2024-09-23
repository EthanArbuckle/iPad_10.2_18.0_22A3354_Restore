@implementation MDLSkyCubeTexture

- (void)setGroundColor:(CGColorRef)groundColor
{
  CGColor *v5;

  v5 = self->_groundColor;
  if (v5)
    CGColorRelease(v5);
  self->_groundColor = CGColorCreateCopy(groundColor);
}

- (CGColorRef)groundColor
{
  return self->_groundColor;
}

- (MDLSkyCubeTexture)initWithName:(NSString *)name channelEncoding:(MDLTextureChannelEncoding)channelEncoding textureDimensions:(vector_int2)textureDimensions turbidity:(float)turbidity sunElevation:(float)sunElevation sunAzimuth:(float)sunAzimuth upperAtmosphereScattering:(float)upperAtmosphereScattering groundAlbedo:(float)groundAlbedo
{
  NSString *v17;
  MDLSkyCubeTexture *v18;
  const char *v19;
  uint64_t v20;
  MDLSkyCubeTexture *v21;
  const char *v22;
  uint64_t v23;
  NSString *v24;
  int v25;
  const float *v26;
  float32x2_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  MDLSkyCubeTexture *v32;
  __int128 v34;
  objc_super v35;

  v34 = *(_OWORD *)textureDimensions.i8;
  v17 = name;
  v35.receiver = self;
  v35.super_class = (Class)MDLSkyCubeTexture;
  v18 = -[MDLTexture init](&v35, sel_init);
  v21 = v18;
  if (v18)
  {
    objc_msgSend_clearTexelData(v18, v19, v20);
    if (v17)
    {
      objc_msgSend_stringWithString_(MEMORY[0x1E0CB3940], v22, (uint64_t)v17);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v21->super._name;
      v21->super._name = (NSString *)v23;
    }
    else
    {
      v24 = v21->super._name;
      v21->super._name = (NSString *)&stru_1EA577998;
    }

    if (channelEncoding > (MDLTextureChannelEncodingFloat16|MDLTextureChannelEncodingUint8))
    {
      if (channelEncoding != MDLTextureChannelEncodingFloat32 && channelEncoding != MDLTextureChannelEncodingFloat16SR)
        goto LABEL_15;
    }
    else
    {
      if (channelEncoding == MDLTextureChannelEncodingUInt8)
      {
LABEL_16:
        v21->_groundAlbedo = 0.29844;
        v26 = (const float *)&unk_1DCC5CA88;
        v27 = vld1_dup_f32(v26);
        v27.f32[0] = (float)(turbidity * 3.0) + 1.0;
        *(float32x2_t *)v21->_highDynamicRangeCompression = v27;
        v25 = 4;
        channelEncoding = MDLTextureChannelEncodingUInt8;
LABEL_18:
        LODWORD(v28) = v34;
        *(_QWORD *)&v21->super._anon_118[8] = v25 * (int)v34;
        HIDWORD(v28) = 6 * DWORD1(v34);
        *(_QWORD *)v21->super._anon_118 = v28;
        v21->super._textureData.channelCount = 4;
        v21->super._anon_118[16] = 1;
        v21->super._channelEncoding = channelEncoding;
        *(float *)(&v21->super._hasAlphaValues + 2) = turbidity;
        v21->_turbidity = sunElevation;
        v21->_sunAzimuth = upperAtmosphereScattering;
        v21->_upperAtmosphereScattering = groundAlbedo;
        v21->_sunElevation = sunAzimuth;
        v21->_groundColor = CGColorCreate(0, 0);
        v29 = operator new();
        sub_1DCB2AE44(v29);
        v21->_sky = (SkyDescriptor *)v29;
        objc_msgSend_updateTexture(v21, v30, v31);
        v32 = v21;
        goto LABEL_19;
      }
      if (channelEncoding != MDLTextureChannelEncodingFloat16)
      {
LABEL_15:
        NSLog(CFSTR("Only UInt8 and Float skies are supported. Overriding to UInt8"), v34);
        goto LABEL_16;
      }
    }
    if ((channelEncoding & 0xFFFFFFFFFFFFFDFFLL) == 0x102)
    {
      v21->_groundAlbedo = 0.45455;
      *(_QWORD *)v21->_highDynamicRangeCompression = 0x467A000040800000;
      v25 = 8;
    }
    else if (channelEncoding == MDLTextureChannelEncodingFloat32)
    {
      v21->_groundAlbedo = 0.45455;
      *(_QWORD *)v21->_highDynamicRangeCompression = 0x467A000040800000;
      v25 = 16;
    }
    else
    {
      v25 = 4;
    }
    goto LABEL_18;
  }
LABEL_19:

  return v21;
}

- (MDLSkyCubeTexture)initWithName:(NSString *)name channelEncoding:(MDLTextureChannelEncoding)channelEncoding textureDimensions:(vector_int2)textureDimensions turbidity:(float)turbidity sunElevation:(float)sunElevation upperAtmosphereScattering:(float)upperAtmosphereScattering groundAlbedo:(float)groundAlbedo
{
  return (MDLSkyCubeTexture *)MEMORY[0x1E0DE7D20](self, sel_initWithName_channelEncoding_textureDimensions_turbidity_sunElevation_sunAzimuth_upperAtmosphereScattering_groundAlbedo_, name);
}

- (void)dealloc
{
  SkyDescriptor *sky;
  uint64_t v4;
  CGColor *groundColor;
  objc_super v6;

  sky = self->_sky;
  if (sky)
  {
    v4 = sub_1DCB2AEAC((uint64_t)sky);
    MEMORY[0x1DF0D228C](v4, 0x10A0C401EE0EB22);
  }
  self->_sky = 0;
  groundColor = self->_groundColor;
  if (groundColor)
  {
    CFRelease(groundColor);
    self->_groundColor = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MDLSkyCubeTexture;
  -[MDLSkyCubeTexture dealloc](&v6, sel_dealloc);
}

- (void)updateTexture
{
  float v3;
  SkyDescriptor *sky;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  size_t NumberOfComponents;
  const CGFloat *Components;
  unsigned int i;
  float v13;
  unsigned int n;
  unsigned int j;
  float v16;
  float v17;
  uint64_t k;
  float v19;
  uint64_t m;
  float v21;
  unint64_t v22;
  id v23;
  const char *v24;
  void *v25;
  NSData *v26;
  const char *v27;
  uint64_t v28;
  float32x4_t *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  int64_t channelEncoding;
  unsigned int v35;
  uint64_t ii;
  id v37;

  v3 = self->_groundAlbedo + 0.298437;
  sky = self->_sky;
  sky->var12 = v3;
  v5 = self->_groundAlbedo + 0.298437;
  sky->var13 = v5;
  v6 = self->_groundAlbedo + 0.298437;
  sky->var14 = v6;
  v7 = self->_gamma + -0.139942;
  sky->var15 = v7;
  *(_OWORD *)&sky->var16 = xmmword_1DCC5B090;
  sky->var19 = *(_QWORD *)self->_highDynamicRangeCompression;
  sky->var20 = *(_DWORD *)&self->_highDynamicRangeCompression[4];
  sky->var21 = self->_exposure + 1.25;
  v8 = self->_contrast + 4.4;
  sky->var22 = v8;
  sky->var23 = self->_brightness + 1.0;
  sky->var0 = *(float *)(&self->super._hasAlphaValues + 2) * 4.5;
  v9 = (float)(1.0 - self->_turbidity) * 3.14159265;
  sky->var2 = v9;
  sky->var1 = self->_sunAzimuth * 1.25;
  sky->var3 = self->_sunElevation;
  sky->var4 = self->_upperAtmosphereScattering + self->_upperAtmosphereScattering;
  NumberOfComponents = CGColorGetNumberOfComponents(self->_groundColor);
  Components = CGColorGetComponents(self->_groundColor);
  switch(NumberOfComponents)
  {
    case 1uLL:
      for (i = 0; i != 3; ++i)
      {
        v13 = *Components;
        *(&self->_sky->var8 + i) = v13;
      }
      goto LABEL_13;
    case 2uLL:
      for (j = 0; j != 3; ++j)
      {
        v16 = *Components;
        *(&self->_sky->var8 + j) = v16;
      }
      v17 = Components[1];
      goto LABEL_14;
    case 3uLL:
      for (k = 0; k != 3; ++k)
      {
        v19 = Components[k];
        *(&self->_sky->var8 + k) = v19;
      }
LABEL_13:
      v17 = 0.0;
LABEL_14:
      self->_sky->var11 = v17;
      break;
    case 4uLL:
      for (m = 0; m != 4; ++m)
      {
        v21 = Components[m];
        *(&self->_sky->var8 + m) = v21;
      }
      break;
    default:
      for (n = 0; n != 4; ++n)
        *((_DWORD *)&self->_sky->var8 + n) = 0;
      break;
  }
  v22 = *(_QWORD *)&self->super._anon_118[8] * *(int *)&self->super._anon_118[4];
  v23 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v25 = (void *)objc_msgSend_initWithLength_(v23, v24, 6 * (v22 / 6));
  if (v25)
  {
    v37 = v25;
    objc_storeStrong((id *)self->super._topLeftOriginData, v25);
    v26 = objc_retainAutorelease(self->super._topLeftOriginData[0]);
    self->super._textureData.topLeftBytesForMip[0] = (char *)objc_msgSend_bytes(v26, v27, v28);
    v29 = (float32x4_t *)malloc_type_malloc(16* (int)HIDWORD(*(_QWORD *)self->super._anon_118)* (uint64_t)(int)*(_QWORD *)self->super._anon_118, 0xD15E0195uLL);
    v25 = v37;
    if (v29)
    {
      v30 = objc_retainAutorelease(v37);
      v33 = objc_msgSend_mutableBytes(v30, v31, v32);
      channelEncoding = self->super._channelEncoding;
      switch(channelEncoding)
      {
        case 258:
          v35 = 1;
          break;
        case 260:
          v35 = 3;
          break;
        case 770:
          v35 = 2;
          break;
        default:
          v35 = 0;
          break;
      }
      for (ii = 0; ii != 6; ++ii)
      {
        sub_1DCB2B69C((uint64_t)self->_sky, ii, 1, *(_QWORD *)self->super._anon_118, (int)HIDWORD(*(_QWORD *)self->super._anon_118) / 6, v29, v35, v33);
        v33 += v22 / 6;
      }
      free(v29);
      v25 = v37;
    }
  }

}

- (float)turbidity
{
  return *(float *)(&self->super._hasAlphaValues + 2);
}

- (void)setTurbidity:(float)turbidity
{
  *(float *)(&self->super._hasAlphaValues + 2) = turbidity;
}

- (float)sunElevation
{
  return self->_turbidity;
}

- (void)setSunElevation:(float)sunElevation
{
  self->_turbidity = sunElevation;
}

- (float)sunAzimuth
{
  return self->_sunElevation;
}

- (void)setSunAzimuth:(float)sunAzimuth
{
  self->_sunElevation = sunAzimuth;
}

- (float)upperAtmosphereScattering
{
  return self->_sunAzimuth;
}

- (void)setUpperAtmosphereScattering:(float)upperAtmosphereScattering
{
  self->_sunAzimuth = upperAtmosphereScattering;
}

- (float)groundAlbedo
{
  return self->_upperAtmosphereScattering;
}

- (void)setGroundAlbedo:(float)groundAlbedo
{
  self->_upperAtmosphereScattering = groundAlbedo;
}

- (float)brightness
{
  return self->_exposure;
}

- (void)setBrightness:(float)brightness
{
  self->_exposure = brightness;
}

- (float)contrast
{
  return self->_brightness;
}

- (void)setContrast:(float)contrast
{
  self->_brightness = contrast;
}

- (float)saturation
{
  return self->_contrast;
}

- (void)setSaturation:(float)saturation
{
  self->_contrast = saturation;
}

- (vector_float2)highDynamicRangeCompression
{
  return *(vector_float2 *)self->_highDynamicRangeCompression;
}

- (void)setHighDynamicRangeCompression:(vector_float2)highDynamicRangeCompression
{
  *(vector_float2 *)self->_highDynamicRangeCompression = highDynamicRangeCompression;
}

- (float)horizonElevation
{
  return self->_horizonElevation;
}

- (void)setHorizonElevation:(float)horizonElevation
{
  self->_horizonElevation = horizonElevation;
}

- (float)gamma
{
  return self->_groundAlbedo;
}

- (void)setGamma:(float)gamma
{
  self->_groundAlbedo = gamma;
}

- (float)exposure
{
  return self->_gamma;
}

- (void)setExposure:(float)exposure
{
  self->_gamma = exposure;
}

@end
