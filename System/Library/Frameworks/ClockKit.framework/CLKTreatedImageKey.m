@implementation CLKTreatedImageKey

+ (id)keyWithRawImage:(id)a3 scale:(double)a4 sdkDeviceScale:(double)a5 maskMode:(int64_t)a6
{
  UIImage *v9;
  CLKTreatedImageKey *v10;
  UIImage *rawImage;

  v9 = (UIImage *)a3;
  v10 = objc_alloc_init(CLKTreatedImageKey);
  rawImage = v10->_rawImage;
  v10->_rawImage = v9;

  v10->_scaleMode = 1;
  v10->_scale = a4;
  v10->_sdkDeviceScale = a5;
  v10->_maskMode = a6;
  return v10;
}

+ (id)keyWithRawImage:(id)a3 scale:(double)a4 sdkDeviceScale:(double)a5 cornerRadius:(double)a6
{
  UIImage *v9;
  CLKTreatedImageKey *v10;
  UIImage *rawImage;

  v9 = (UIImage *)a3;
  v10 = objc_alloc_init(CLKTreatedImageKey);
  rawImage = v10->_rawImage;
  v10->_rawImage = v9;

  v10->_scaleMode = 1;
  v10->_scale = a4;
  v10->_sdkDeviceScale = a5;
  v10->_maskMode = 2;
  v10->_cornerRadius = a6;
  return v10;
}

+ (id)keyWithRawImage:(id)a3 maxSDKSize:(CGSize)a4 maxDeviceSize:(CGSize)a5 maskMode:(int64_t)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat v9;
  CGFloat v10;
  UIImage *v11;
  CLKTreatedImageKey *v12;
  UIImage *rawImage;

  height = a5.height;
  width = a5.width;
  v9 = a4.height;
  v10 = a4.width;
  v11 = (UIImage *)a3;
  v12 = objc_alloc_init(CLKTreatedImageKey);
  rawImage = v12->_rawImage;
  v12->_rawImage = v11;

  v12->_scaleMode = 0;
  v12->_maxSDKSize.width = v10;
  v12->_maxSDKSize.height = v9;
  v12->_maxDeviceSize.width = width;
  v12->_maxDeviceSize.height = height;
  v12->_maskMode = a6;
  return v12;
}

+ (id)keyWithRawImage:(id)a3 maxSDKSize:(CGSize)a4 maxDeviceSize:(CGSize)a5 cornerRadius:(double)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat v9;
  CGFloat v10;
  UIImage *v11;
  CLKTreatedImageKey *v12;
  UIImage *rawImage;

  height = a5.height;
  width = a5.width;
  v9 = a4.height;
  v10 = a4.width;
  v11 = (UIImage *)a3;
  v12 = objc_alloc_init(CLKTreatedImageKey);
  rawImage = v12->_rawImage;
  v12->_rawImage = v11;

  v12->_scaleMode = 0;
  v12->_maxSDKSize.height = v9;
  v12->_maxDeviceSize.width = width;
  v12->_maxDeviceSize.height = height;
  v12->_maskMode = 2;
  v12->_cornerRadius = a6;
  v12->_maxSDKSize.width = v10;
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  CLKTreatedImageKey *v4;
  UIImage *rawImage;
  void *v6;
  double scale;
  double v8;
  double sdkDeviceScale;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  int64_t maskMode;
  int64_t scaleMode;
  double cornerRadius;
  double v19;

  v4 = (CLKTreatedImageKey *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      rawImage = self->_rawImage;
      -[CLKTreatedImageKey rawImage](v4, "rawImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[UIImage isEqual:](rawImage, "isEqual:", v6))
        goto LABEL_15;
      scale = self->_scale;
      -[CLKTreatedImageKey scale](v4, "scale");
      if (!CLKFloatEqualsFloat(scale, v8))
        goto LABEL_15;
      sdkDeviceScale = self->_sdkDeviceScale;
      -[CLKTreatedImageKey sdkDeviceScale](v4, "sdkDeviceScale");
      if (!CLKFloatEqualsFloat(sdkDeviceScale, v10))
        goto LABEL_15;
      -[CLKTreatedImageKey maxSDKSize](v4, "maxSDKSize");
      v12 = 0;
      if (self->_maxSDKSize.width != v13)
        goto LABEL_16;
      if (self->_maxSDKSize.height != v11)
        goto LABEL_16;
      -[CLKTreatedImageKey maxDeviceSize](v4, "maxDeviceSize");
      v12 = 0;
      if (self->_maxDeviceSize.width != v15 || self->_maxDeviceSize.height != v14)
        goto LABEL_16;
      maskMode = self->_maskMode;
      if (maskMode == -[CLKTreatedImageKey maskMode](v4, "maskMode")
        && (scaleMode = self->_scaleMode, scaleMode == -[CLKTreatedImageKey scaleMode](v4, "scaleMode")))
      {
        cornerRadius = self->_cornerRadius;
        -[CLKTreatedImageKey cornerRadius](v4, "cornerRadius");
        v12 = CLKFloatEqualsFloat(cornerRadius, v19);
      }
      else
      {
LABEL_15:
        v12 = 0;
      }
LABEL_16:

      goto LABEL_17;
    }
    v12 = 0;
  }
LABEL_17:

  return v12;
}

- (unint64_t)hash
{
  double v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  unint64_t v17;

  v3 = (double)(unint64_t)-[UIImage hash](self->_rawImage, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_sdkDeviceScale);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (double)(unint64_t)objc_msgSend(v4, "hash") * 1000000000.0 + v3 * 1.0e10;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_scale);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 + (double)(unint64_t)objc_msgSend(v6, "hash") * 100000000.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_scaleMode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 + (double)(unint64_t)objc_msgSend(v8, "hash") * 10000000.0;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", self->_maxDeviceSize.width, self->_maxDeviceSize.height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 + (double)(unint64_t)objc_msgSend(v10, "hash") * 1000000.0;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", self->_maxSDKSize.width, self->_maxSDKSize.height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 + (double)(unint64_t)objc_msgSend(v12, "hash") * 100000.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_maskMode);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 + (double)(unint64_t)objc_msgSend(v14, "hash") * 10000.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_cornerRadius);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (unint64_t)(v15 + (double)(unint64_t)objc_msgSend(v16, "hash") * 1000.0);

  return v17;
}

- (UIImage)rawImage
{
  return self->_rawImage;
}

- (int64_t)scaleMode
{
  return self->_scaleMode;
}

- (CGSize)maxSDKSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxSDKSize.width;
  height = self->_maxSDKSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)maxDeviceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxDeviceSize.width;
  height = self->_maxDeviceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (double)sdkDeviceScale
{
  return self->_sdkDeviceScale;
}

- (int64_t)maskMode
{
  return self->_maskMode;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawImage, 0);
}

@end
