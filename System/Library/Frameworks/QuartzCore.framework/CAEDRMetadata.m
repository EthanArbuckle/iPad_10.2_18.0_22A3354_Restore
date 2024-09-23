@implementation CAEDRMetadata

- (CAEDRMetadata)initWithCoder:(id)a3
{
  CAEDRMetadata *v4;
  void *v5;
  _CAEDRMetadataPrivate *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)CAEDRMetadata;
  v4 = -[CAEDRMetadata init](&v8, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CA_EDR_Metadata"));
    if (objc_msgSend(v5, "length") == 48)
    {
      v6 = (_CAEDRMetadataPrivate *)malloc_type_calloc(1uLL, 0x30uLL, 0x72436645uLL);
      v4->_priv = v6;
      objc_msgSend(v5, "getBytes:length:", v6, 48);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  _CAEDRMetadataPrivate *priv;
  uint64_t v5;

  if (a3)
  {
    priv = self->_priv;
    if (priv)
    {
      v5 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", priv, 48);
      if (v5)
        objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("CA_EDR_Metadata"));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  _OWORD *v5;
  _CAEDRMetadataPrivate *priv;
  __int128 v7;
  __int128 v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = malloc_type_malloc(0x30uLL, 0xAC14F77CuLL);
    v4[1] = v5;
    priv = self->_priv;
    v8 = *((_OWORD *)priv + 1);
    v7 = *((_OWORD *)priv + 2);
    *v5 = *(_OWORD *)priv;
    v5[1] = v8;
    v5[2] = v7;
  }
  return v4;
}

- (CAEDRMetadata)initWithSEIMasteringDisplayData:(id)a3 contentLightLevelData:(id)a4
{
  double v4;

  LODWORD(v4) = 1120403456;
  return -[CAEDRMetadata initWithSEIMasteringDisplayData:contentLightLevelData:opticalOutputScale:](self, "initWithSEIMasteringDisplayData:contentLightLevelData:opticalOutputScale:", a3, a4, v4);
}

- (CAEDRMetadata)initWithSEIMasteringDisplayData:(id)a3 contentLightLevelData:(id)a4 opticalOutputScale:(float)a5
{
  CAEDRMetadata *v8;
  _CAEDRMetadataPrivate *priv;
  unsigned __int16 *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned __int16 *v21;
  unsigned int v22;
  unsigned int v23;
  NSObject *v24;
  const char *v25;
  objc_super v27;
  uint8_t buf[8];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)CAEDRMetadata;
  v8 = -[CAEDRMetadata init](&v27, sel_init);
  if (v8)
  {
    priv = (_CAEDRMetadataPrivate *)malloc_type_calloc(1uLL, 0x30uLL, 0x9D86E492uLL);
    v8->_priv = priv;
    if (!priv)
    {

      return 0;
    }
    if (a3)
    {
      if ((unint64_t)objc_msgSend(a3, "length") <= 0x17)
      {

        if (x_log_hook_p())
          goto LABEL_32;
        v24 = x_log_category_api;
        if (!os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
          return 0;
        *(_WORD *)buf = 0;
        v25 = "SEI mastering display color volume info must be 24 bytes";
        goto LABEL_43;
      }
      v10 = (unsigned __int16 *)objc_msgSend(a3, "bytes");
      v11 = bswap32(*v10) >> 16;
      if (v11 >= 0xC350)
        LOWORD(v11) = -15536;
      priv = v8->_priv;
      *(_WORD *)priv = v11;
      v12 = bswap32(v10[1]) >> 16;
      if (v12 >= 0xC350)
        LOWORD(v12) = -15536;
      *((_WORD *)priv + 1) = v12;
      v13 = bswap32(v10[2]) >> 16;
      if (v13 >= 0xC350)
        LOWORD(v13) = -15536;
      *((_WORD *)priv + 2) = v13;
      v14 = bswap32(v10[3]) >> 16;
      if (v14 >= 0xC350)
        LOWORD(v14) = -15536;
      *((_WORD *)priv + 3) = v14;
      v15 = bswap32(v10[4]) >> 16;
      if (v15 >= 0xC350)
        LOWORD(v15) = -15536;
      *((_WORD *)priv + 4) = v15;
      v16 = bswap32(v10[5]) >> 16;
      if (v16 >= 0xC350)
        LOWORD(v16) = -15536;
      *((_WORD *)priv + 5) = v16;
      v17 = bswap32(v10[6]) >> 16;
      if (v17 >= 0xC350)
        LOWORD(v17) = -15536;
      *((_WORD *)priv + 6) = v17;
      v18 = bswap32(v10[7]) >> 16;
      if (v18 >= 0xC350)
        LOWORD(v18) = -15536;
      *((_WORD *)priv + 7) = v18;
      v19 = bswap32(*((_DWORD *)v10 + 4));
      if (v19 >= 0x5F5E100)
        v19 = 100000000;
      *((_DWORD *)priv + 4) = v19;
      v20 = bswap32(*((_DWORD *)v10 + 5));
      if (v20 >= 0x5F5E100)
        v20 = 100000000;
      *((_DWORD *)priv + 5) = v20;
    }
    if (a4)
    {
      if ((unint64_t)objc_msgSend(a4, "length") <= 3)
      {

        if (x_log_hook_p())
        {
LABEL_32:
          x_log_();
          return 0;
        }
        v24 = x_log_category_api;
        if (!os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
          return 0;
        *(_WORD *)buf = 0;
        v25 = "SEI content light level info must be 4 bytes";
LABEL_43:
        _os_log_impl(&dword_184457000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
        return 0;
      }
      v21 = (unsigned __int16 *)objc_msgSend(a4, "bytes");
      v22 = bswap32(*v21) >> 16;
      if (v22 >= 0x2710)
        LOWORD(v22) = 10000;
      priv = v8->_priv;
      *((_WORD *)priv + 12) = v22;
      v23 = bswap32(v21[1]) >> 16;
      if (v23 >= 0x2710)
        LOWORD(v23) = 10000;
      *((_WORD *)priv + 13) = v23;
    }
    *((float *)priv + 11) = a5;
  }
  return v8;
}

- (CAEDRMetadata)initWithMasteringDisplayMinNits:(float)a3 maxNits:(float)a4 opticalOutputScale:(float)a5
{
  CAEDRMetadata *v6;
  _CAEDRMetadataPrivate *v7;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)CAEDRMetadata;
  v6 = -[CAEDRMetadata init](&v11, sel_init);
  if (v6)
  {
    v7 = (_CAEDRMetadataPrivate *)malloc_type_calloc(1uLL, 0x30uLL, 0x7AB30AD5uLL);
    v6->_priv = v7;
    if (v7)
    {
      *((uint32x2_t *)v7 + 2) = vcvt_u32_f32(vmul_f32((float32x2_t)__PAIR64__(LODWORD(a3), LODWORD(a4)), (float32x2_t)vdup_n_s32(0x461C4000u)));
      *((float *)v7 + 11) = a5;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (CAEDRMetadata)initWithSEIAmbientViewingEnvironment:(id)a3
{
  CAEDRMetadata *v4;
  _CAEDRMetadataPrivate *priv;
  uint64_t v6;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[8];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)CAEDRMetadata;
  v4 = -[CAEDRMetadata init](&v9, sel_init);
  if (v4)
  {
    priv = (_CAEDRMetadataPrivate *)malloc_type_calloc(1uLL, 0x30uLL, 0x83F54FA7uLL);
    v4->_priv = priv;
    if (priv)
    {
      if (a3)
      {
        if ((unint64_t)objc_msgSend(a3, "length") <= 7)
        {

          if (x_log_hook_p())
          {
            x_log_();
          }
          else
          {
            v8 = x_log_category_api;
            if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_184457000, v8, OS_LOG_TYPE_ERROR, "SEI ambient viewing environment info must be 8 bytes", buf, 2u);
            }
          }
          return 0;
        }
        v6 = objc_msgSend(a3, "copy");
        priv = v4->_priv;
        *((_QWORD *)priv + 4) = v6;
      }
      *((_BYTE *)priv + 40) = 1;
      return v4;
    }

    return 0;
  }
  return v4;
}

- (CAEDRMetadata)initWithBT2100HLG
{
  CAEDRMetadata *v2;
  _CAEDRMetadataPrivate *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)CAEDRMetadata;
  v2 = -[CAEDRMetadata init](&v5, sel_init);
  if (v2)
  {
    v3 = (_CAEDRMetadataPrivate *)malloc_type_calloc(1uLL, 0x30uLL, 0x68C4A5DCuLL);
    v2->_priv = v3;
    if (v3)
    {
      *((_BYTE *)v3 + 40) = 1;
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  _CAEDRMetadataPrivate *priv;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  priv = self->_priv;
  if (priv)
  {

    free(self->_priv);
    self->_priv = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CAEDRMetadata;
  -[CAEDRMetadata dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  _CAEDRMetadataPrivate *priv;
  uint64_t v6;
  unint64_t v7;
  BOOL v9;
  BOOL v10;

  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  priv = self->_priv;
  v6 = *((_QWORD *)a3 + 1);
  if (!*((_BYTE *)priv + 40))
  {
    if (!*(_BYTE *)(v6 + 40))
    {
      v9 = *(_QWORD *)priv == *(_QWORD *)v6 && *((_QWORD *)priv + 1) == *(_QWORD *)(v6 + 8);
      v10 = v9 && *((_QWORD *)priv + 2) == *(_QWORD *)(v6 + 16);
      if (v10 && *((_DWORD *)priv + 6) == *(_DWORD *)(v6 + 24))
        return *((float *)priv + 11) == *(float *)(v6 + 44);
    }
    return 0;
  }
  if (*((unsigned __int8 *)priv + 40) != *(unsigned __int8 *)(v6 + 40))
    return 0;
  v7 = *((_QWORD *)priv + 4);
  if (!(v7 | *(_QWORD *)(v6 + 32)))
    return 1;
  return objc_msgSend((id)v7, "isEqual:");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CAEDRMetadata <%p> display min nits: %f, max nits: %f"), self, (float)((float)*((unsigned int *)self->_priv + 5) * 0.0001), (float)((float)*((unsigned int *)self->_priv + 4) * 0.0001));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (CAEDRMetadata)HDR10MetadataWithDisplayInfo:(NSData *)displayData contentInfo:(NSData *)contentData opticalOutputScale:(float)scale
{
  CAEDRMetadata *v8;
  double v9;

  if (CADeviceHasHardwareAcceleratedHDR::once != -1)
    dispatch_once(&CADeviceHasHardwareAcceleratedHDR::once, &__block_literal_global_93);
  if (!CADeviceHasHardwareAcceleratedHDR::has_capability)
  {
    if (CADeviceIsVirtualized::once[0] != -1)
      dispatch_once(CADeviceIsVirtualized::once, &__block_literal_global_204);
    if (!CADeviceIsVirtualized::is_virtualized)
      return 0;
  }
  v8 = [CAEDRMetadata alloc];
  *(float *)&v9 = scale;
  return -[CAEDRMetadata initWithSEIMasteringDisplayData:contentLightLevelData:opticalOutputScale:](v8, "initWithSEIMasteringDisplayData:contentLightLevelData:opticalOutputScale:", displayData, contentData, v9);
}

+ (CAEDRMetadata)HDR10MetadataWithMinLuminance:(float)minNits maxLuminance:(float)maxNits opticalOutputScale:(float)scale
{
  CAEDRMetadata *v8;
  double v9;
  double v10;
  double v11;

  if (CADeviceHasHardwareAcceleratedHDR::once != -1)
    dispatch_once(&CADeviceHasHardwareAcceleratedHDR::once, &__block_literal_global_93);
  if (!CADeviceHasHardwareAcceleratedHDR::has_capability)
  {
    if (CADeviceIsVirtualized::once[0] != -1)
      dispatch_once(CADeviceIsVirtualized::once, &__block_literal_global_204);
    if (!CADeviceIsVirtualized::is_virtualized)
      return 0;
  }
  v8 = [CAEDRMetadata alloc];
  *(float *)&v9 = minNits;
  *(float *)&v10 = maxNits;
  *(float *)&v11 = scale;
  return -[CAEDRMetadata initWithMasteringDisplayMinNits:maxNits:opticalOutputScale:](v8, "initWithMasteringDisplayMinNits:maxNits:opticalOutputScale:", v9, v10, v11);
}

+ (CAEDRMetadata)HLGMetadataWithAmbientViewingEnvironment:(NSData *)data
{
  if (CADeviceHasHardwareAcceleratedHDR::once != -1)
    dispatch_once(&CADeviceHasHardwareAcceleratedHDR::once, &__block_literal_global_93);
  if (CADeviceHasHardwareAcceleratedHDR::has_capability)
    return -[CAEDRMetadata initWithSEIAmbientViewingEnvironment:]([CAEDRMetadata alloc], "initWithSEIAmbientViewingEnvironment:", data);
  if (CADeviceIsVirtualized::once[0] != -1)
    dispatch_once(CADeviceIsVirtualized::once, &__block_literal_global_204);
  if (CADeviceIsVirtualized::is_virtualized)
    return -[CAEDRMetadata initWithSEIAmbientViewingEnvironment:]([CAEDRMetadata alloc], "initWithSEIAmbientViewingEnvironment:", data);
  else
    return 0;
}

+ (CAEDRMetadata)HLGMetadata
{
  if (CADeviceHasHardwareAcceleratedHDR::once != -1)
    dispatch_once(&CADeviceHasHardwareAcceleratedHDR::once, &__block_literal_global_93);
  if (CADeviceHasHardwareAcceleratedHDR::has_capability)
    return -[CAEDRMetadata initWithBT2100HLG]([CAEDRMetadata alloc], "initWithBT2100HLG");
  if (CADeviceIsVirtualized::once[0] != -1)
    dispatch_once(CADeviceIsVirtualized::once, &__block_literal_global_204);
  if (CADeviceIsVirtualized::is_virtualized)
    return -[CAEDRMetadata initWithBT2100HLG]([CAEDRMetadata alloc], "initWithBT2100HLG");
  else
    return 0;
}

+ (BOOL)isAvailable
{
  if (CADeviceHasHardwareAcceleratedHDR::once != -1)
    dispatch_once(&CADeviceHasHardwareAcceleratedHDR::once, &__block_literal_global_93);
  if (CADeviceHasHardwareAcceleratedHDR::has_capability)
    return 1;
  if (CADeviceIsVirtualized::once[0] != -1)
    dispatch_once(CADeviceIsVirtualized::once, &__block_literal_global_204);
  return CADeviceIsVirtualized::is_virtualized != 0;
}

+ (void)setMetadata:(id)a3 onSurface:(__IOSurface *)a4
{
  const void *v6;
  CA::Render *PixelFormat;
  double v8;
  uint64_t v9;

  if (!a4)
    return;
  if (!a3)
  {
    IOSurfaceRemoveValue(a4, CFSTR("isHLG"));
LABEL_9:
    IOSurfaceRemoveValue(a4, (CFStringRef)*MEMORY[0x1E0CA8CC8]);
    goto LABEL_10;
  }
  if (*(_BYTE *)(*((_QWORD *)a3 + 1) + 40))
    IOSurfaceSetValue(a4, CFSTR("isHLG"), (CFTypeRef)*MEMORY[0x1E0C9AE50]);
  else
    IOSurfaceRemoveValue(a4, CFSTR("isHLG"));
  v6 = *(const void **)(*((_QWORD *)a3 + 1) + 32);
  if (!v6)
    goto LABEL_9;
  IOSurfaceSetValue(a4, (CFStringRef)*MEMORY[0x1E0CA8CC8], v6);
LABEL_10:
  PixelFormat = (CA::Render *)IOSurfaceGetPixelFormat(a4);
  if (CA::Render::fourcc_compressed_of_type(PixelFormat, 0, 0) == 1380411457)
  {
    if (a3 && (v9 = *((_QWORD *)a3 + 1), !*(_BYTE *)(v9 + 40)))
    {
      LODWORD(v8) = *(_DWORD *)(v9 + 44);
      IOSurfaceSetValue(a4, CFSTR("SDRBrightnessInNits"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8));
    }
    else
    {
      IOSurfaceRemoveValue(a4, CFSTR("SDRBrightnessInNits"));
    }
  }
  IOSurfaceSetBulkAttachments2();
}

@end
