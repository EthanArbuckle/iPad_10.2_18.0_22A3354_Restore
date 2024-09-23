@implementation VNSupportedImageSize

- (VNSupportedImageSize)initWithIdealFormat:(unsigned int)a3 pixelsWideRange:(id)a4 pixelsHighRange:(id)a5 aspectRatioHandling:(unint64_t)a6 idealOrientation:(unsigned int)a7 orientationAgnostic:(BOOL)a8
{
  id v14;
  id v15;
  VNSupportedImageSize *v16;
  VNSupportedImageSize *v17;
  uint64_t v18;
  VNSizeRange *pixelsWideRange;
  uint64_t v20;
  VNSizeRange *pixelsHighRange;
  VNSupportedImageSize *v22;
  objc_super v24;

  v14 = a4;
  v15 = a5;
  v24.receiver = self;
  v24.super_class = (Class)VNSupportedImageSize;
  v16 = -[VNSupportedImageSize init](&v24, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_idealImageFormat = a3;
    v18 = objc_msgSend(v14, "copy");
    pixelsWideRange = v17->_pixelsWideRange;
    v17->_pixelsWideRange = (VNSizeRange *)v18;

    v20 = objc_msgSend(v15, "copy");
    pixelsHighRange = v17->_pixelsHighRange;
    v17->_pixelsHighRange = (VNSizeRange *)v20;

    v17->_aspectRatioHandling = a6;
    v17->_idealOrientation = a7;
    v17->_orientationAgnostic = a8;
    v22 = v17;
  }

  return v17;
}

- (VNSupportedImageSize)initWithIdealFormat:(unsigned int)a3 width:(unint64_t)a4 height:(unint64_t)a5 orientation:(unsigned int)a6 aspectRatioHandling:(unint64_t)a7 orientationAgnostic:(BOOL)a8
{
  _BOOL8 v8;
  uint64_t v10;
  uint64_t v13;
  VNSizeRange *v15;
  VNSizeRange *v16;
  VNSizeRange *v17;
  VNSizeRange *v18;
  VNSupportedImageSize *v19;

  v8 = a8;
  v10 = *(_QWORD *)&a6;
  v13 = *(_QWORD *)&a3;
  v15 = -[VNSizeRange initWithMinimumDimension:maximumDimension:idealDimension:]([VNSizeRange alloc], "initWithMinimumDimension:maximumDimension:idealDimension:", a4, a4, a4);
  v16 = v15;
  if (a4 == a5)
    v17 = v15;
  else
    v17 = -[VNSizeRange initWithMinimumDimension:maximumDimension:idealDimension:]([VNSizeRange alloc], "initWithMinimumDimension:maximumDimension:idealDimension:", a5, a5, a5);
  v18 = v17;
  v19 = -[VNSupportedImageSize initWithIdealFormat:pixelsWideRange:pixelsHighRange:aspectRatioHandling:idealOrientation:orientationAgnostic:](self, "initWithIdealFormat:pixelsWideRange:pixelsHighRange:aspectRatioHandling:idealOrientation:orientationAgnostic:", v13, v16, v17, a7, v10, v8);

  return v19;
}

- (BOOL)isAllowedPixelsWide:(unint64_t)a3 pixelsHigh:(unint64_t)a4
{
  void *v7;
  void *v8;
  char v9;

  -[VNSupportedImageSize pixelsWideRange](self, "pixelsWideRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isAllowedDimension:", a3))
  {
    -[VNSupportedImageSize pixelsHighRange](self, "pixelsHighRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isAllowedDimension:", a4);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t result;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;

  result = self->_cachedCalculatedHash;
  if (!result)
  {
    v4 = -[VNSupportedImageSize idealImageFormat](self, "idealImageFormat");
    -[VNSupportedImageSize pixelsWideRange](self, "pixelsWideRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hash");

    -[VNSupportedImageSize pixelsHighRange](self, "pixelsHighRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hash") ^ __ROR8__(v6 ^ ((unint64_t)v4 << 13), 51);

    v9 = -[VNSupportedImageSize idealOrientation](self, "idealOrientation") ^ __ROR8__(-[VNSupportedImageSize aspectRatioHandling](self, "aspectRatioHandling") ^ __ROR8__(v8, 51), 51);
    v10 = -[VNSupportedImageSize isOrientationAgnostic](self, "isOrientationAgnostic");
    v11 = 21845;
    if (v10)
      v11 = 43690;
    result = v11 ^ __ROR8__(v9, 51);
    self->_cachedCalculatedHash = result;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  VNSupportedImageSize *v4;
  VNSupportedImageSize *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  unint64_t v13;
  unsigned int v14;
  _BOOL4 v15;
  _BOOL4 v16;

  v4 = (VNSupportedImageSize *)a3;
  if (self == v4)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[VNSupportedImageSize idealImageFormat](self, "idealImageFormat");
      if (v6 != -[VNSupportedImageSize idealImageFormat](v5, "idealImageFormat"))
        goto LABEL_11;
      -[VNSupportedImageSize pixelsWideRange](self, "pixelsWideRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNSupportedImageSize pixelsWideRange](v5, "pixelsWideRange");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = VisionCoreEqualOrNilObjects();

      if ((v9 & 1) == 0)
        goto LABEL_11;
      -[VNSupportedImageSize pixelsHighRange](self, "pixelsHighRange");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNSupportedImageSize pixelsHighRange](v5, "pixelsHighRange");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = VisionCoreEqualOrNilObjects();

      if ((v12 & 1) == 0)
        goto LABEL_11;
      v13 = -[VNSupportedImageSize aspectRatioHandling](self, "aspectRatioHandling");
      if (v13 == -[VNSupportedImageSize aspectRatioHandling](v5, "aspectRatioHandling")
        && (v14 = -[VNSupportedImageSize idealOrientation](self, "idealOrientation"),
            v14 == -[VNSupportedImageSize idealOrientation](v5, "idealOrientation")))
      {
        v15 = -[VNSupportedImageSize isOrientationAgnostic](self, "isOrientationAgnostic");
        v16 = v15 ^ -[VNSupportedImageSize isOrientationAgnostic](v5, "isOrientationAgnostic") ^ 1;
      }
      else
      {
LABEL_11:
        LOBYTE(v16) = 0;
      }

    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_idealImageFormat, CFSTR("idealFormat"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_pixelsWideRange, CFSTR("wideRange"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_pixelsHighRange, CFSTR("highRange"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_aspectRatioHandling, CFSTR("aspectHandling"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_idealOrientation, CFSTR("idealOrientation"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_orientationAgnostic, CFSTR("orientationAgnostic"));

}

- (VNSupportedImageSize)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  VNSupportedImageSize *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("idealFormat"));
  v6 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("wideRange"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("highRange"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VNSupportedImageSize initWithIdealFormat:pixelsWideRange:pixelsHighRange:aspectRatioHandling:idealOrientation:orientationAgnostic:](self, "initWithIdealFormat:pixelsWideRange:pixelsHighRange:aspectRatioHandling:idealOrientation:orientationAgnostic:", v5, v7, v8, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("aspectHandling")), objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("idealOrientation")), objc_msgSend(v4, "decodeBoolForKey:", CFSTR("orientationAgnostic")));

  return v9;
}

- (VNSizeRange)pixelsWideRange
{
  return self->_pixelsWideRange;
}

- (VNSizeRange)pixelsHighRange
{
  return self->_pixelsHighRange;
}

- (unint64_t)aspectRatioHandling
{
  return self->_aspectRatioHandling;
}

- (unsigned)idealImageFormat
{
  return self->_idealImageFormat;
}

- (unsigned)idealOrientation
{
  return self->_idealOrientation;
}

- (BOOL)isOrientationAgnostic
{
  return self->_orientationAgnostic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pixelsHighRange, 0);
  objc_storeStrong((id *)&self->_pixelsWideRange, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
