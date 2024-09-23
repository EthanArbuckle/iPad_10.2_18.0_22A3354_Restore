@implementation NUImageRenderRequest

- (NUImageRenderRequest)initWithComposition:(id)a3
{
  NUImageRenderRequest *v3;
  uint64_t v4;
  NUColorSpace *colorSpace;
  uint64_t v6;
  NUScalePolicy *scalePolicy;
  NUFullExtentRegionPolicy *v8;
  NURegionPolicy *regionPolicy;
  NUFullExtentPolicy *v10;
  NUExtentPolicy *extentPolicy;
  uint64_t v12;
  NUPixelFormat *pixelFormat;
  int64_t v14;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NUImageRenderRequest;
  v3 = -[NURenderRequest initWithComposition:](&v18, sel_initWithComposition_, a3);
  +[NUColorSpace sRGBColorSpace](NUColorSpace, "sRGBColorSpace");
  v4 = objc_claimAutoreleasedReturnValue();
  colorSpace = v3->_colorSpace;
  v3->_colorSpace = (NUColorSpace *)v4;

  v3->_maxEDRHeadroom = 1.0;
  v3->_currentEDRHeadroom = 1.0;
  +[NUFixedScalePolicy oneToOneScalePolicy](NUFixedScalePolicy, "oneToOneScalePolicy");
  v6 = objc_claimAutoreleasedReturnValue();
  scalePolicy = v3->_scalePolicy;
  v3->_scalePolicy = (NUScalePolicy *)v6;

  v8 = objc_alloc_init(NUFullExtentRegionPolicy);
  regionPolicy = v3->_regionPolicy;
  v3->_regionPolicy = (NURegionPolicy *)v8;

  v10 = objc_alloc_init(NUFullExtentPolicy);
  extentPolicy = v3->_extentPolicy;
  v3->_extentPolicy = (NUExtentPolicy *)v10;

  +[NUPixelFormat BGRA8](NUPixelFormat, "BGRA8");
  v12 = objc_claimAutoreleasedReturnValue();
  pixelFormat = v3->_pixelFormat;
  v3->_pixelFormat = (NUPixelFormat *)v12;

  v14 = +[NUGlobalSettings imageTileSize](NUGlobalSettings, "imageTileSize");
  if (v14 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("NUGeometryPrimitives.h"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(width >= 0) && (height >= 0)"));

  }
  v3->_tileSize.width = v14;
  v3->_tileSize.height = v14;
  v3->_auxiliaryImageType = 1;
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUImageRenderRequest;
  v4 = -[NURenderRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 19, self->_colorSpace);
    v5[20] = *(id *)&self->_maxEDRHeadroom;
    v5[21] = *(id *)&self->_currentEDRHeadroom;
    objc_storeStrong(v5 + 25, self->_pixelFormat);
    *((_OWORD *)v5 + 14) = self->_tileSize;
    *((_OWORD *)v5 + 15) = self->_borderSize;
    objc_storeStrong(v5 + 22, self->_regionPolicy);
    objc_storeStrong(v5 + 23, self->_scalePolicy);
    objc_storeStrong(v5 + 24, self->_extentPolicy);
    v5[26] = (id)self->_auxiliaryImageType;
  }
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NUImageRenderRequest;
  -[NURenderRequest description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUImageRenderRequest colorSpace](self, "colorSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUImageRenderRequest currentEDRHeadroom](self, "currentEDRHeadroom");
  v6 = v5;
  -[NUImageRenderRequest maxEDRHeadroom](self, "maxEDRHeadroom");
  v8 = v7;
  -[NUImageRenderRequest scalePolicy](self, "scalePolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUImageRenderRequest regionPolicy](self, "regionPolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NUImageRenderRequest auxiliaryImageType](self, "auxiliaryImageType");
  if (v11 > 0xC)
    v12 = CFSTR("Invalid");
  else
    v12 = off_1E5060F88[v11];
  v13 = v12;
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" Color Space: %@ EDR: %.1f/%.1f, Scale: %@ Region: %@, Aux: %@"), v4, v6, v8, v9, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_colorSpace, a3);
}

- (double)maxEDRHeadroom
{
  return self->_maxEDRHeadroom;
}

- (void)setMaxEDRHeadroom:(double)a3
{
  self->_maxEDRHeadroom = a3;
}

- (double)currentEDRHeadroom
{
  return self->_currentEDRHeadroom;
}

- (void)setCurrentEDRHeadroom:(double)a3
{
  self->_currentEDRHeadroom = a3;
}

- (NURegionPolicy)regionPolicy
{
  return self->_regionPolicy;
}

- (void)setRegionPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_regionPolicy, a3);
}

- (NUScalePolicy)scalePolicy
{
  return self->_scalePolicy;
}

- (void)setScalePolicy:(id)a3
{
  objc_storeStrong((id *)&self->_scalePolicy, a3);
}

- (NUExtentPolicy)extentPolicy
{
  return self->_extentPolicy;
}

- (void)setExtentPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_extentPolicy, a3);
}

- (NUPixelFormat)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(id)a3
{
  objc_storeStrong((id *)&self->_pixelFormat, a3);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)tileSize
{
  $5BB7312FFE32F1AB3F1F5957C99A58B3 *p_tileSize;
  int64_t width;
  int64_t height;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_tileSize = &self->_tileSize;
  width = self->_tileSize.width;
  height = p_tileSize->height;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (void)setTileSize:(id)a3
{
  self->_tileSize = ($5BB7312FFE32F1AB3F1F5957C99A58B3)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)borderSize
{
  $5BB7312FFE32F1AB3F1F5957C99A58B3 *p_borderSize;
  int64_t width;
  int64_t height;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_borderSize = &self->_borderSize;
  width = self->_borderSize.width;
  height = p_borderSize->height;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (void)setBorderSize:(id)a3
{
  self->_borderSize = ($5BB7312FFE32F1AB3F1F5957C99A58B3)a3;
}

- (int64_t)auxiliaryImageType
{
  return self->_auxiliaryImageType;
}

- (void)setAuxiliaryImageType:(int64_t)a3
{
  self->_auxiliaryImageType = a3;
}

- (NUMutableImage)targetImage
{
  return (NUMutableImage *)objc_getProperty(self, a2, 216, 1);
}

- (void)setTargetImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetImage, 0);
  objc_storeStrong((id *)&self->_pixelFormat, 0);
  objc_storeStrong((id *)&self->_extentPolicy, 0);
  objc_storeStrong((id *)&self->_scalePolicy, 0);
  objc_storeStrong((id *)&self->_regionPolicy, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
}

@end
