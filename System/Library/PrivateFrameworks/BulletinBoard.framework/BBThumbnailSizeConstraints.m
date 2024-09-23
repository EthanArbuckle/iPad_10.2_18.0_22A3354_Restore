@implementation BBThumbnailSizeConstraints

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  _BOOL4 v14;
  const __CFString *v15;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p type="), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = CFSTR("BBConstraintFixedLargeDimension");
  v8 = CFSTR("; fixedHeight=%g");
  v9 = CFSTR("BBConstraintFixedHeight");
  v10 = 12;
  switch(self->_constraintType)
  {
    case 0:
      v8 = CFSTR("; fixedWidth=%g");
      v10 = 8;
      v9 = CFSTR("BBConstraintFixedWidth");
      goto LABEL_6;
    case 1:
      goto LABEL_6;
    case 2:
      objc_msgSend(v6, "appendString:", CFSTR("BBConstraintFixedSized"));
      v11 = 12;
      v12 = 8;
      v13 = CFSTR("; fixedWidth=%g");
      goto LABEL_7;
    case 3:
      goto LABEL_5;
    case 4:
      v7 = CFSTR("BBConstraintFixedSmallDimension");
LABEL_5:
      v8 = CFSTR("; fixedDimension=%g");
      v10 = 16;
      v9 = v7;
LABEL_6:
      objc_msgSend(v6, "appendString:", v9);
      objc_msgSend(v6, "appendFormat:", v8, *(float *)((char *)&self->super.isa + v10));
      v8 = CFSTR("; maxAspectRatio=%g");
      v11 = 24;
      v12 = 20;
      v13 = CFSTR("; minAspectRatio=%g");
LABEL_7:
      objc_msgSend(v6, "appendFormat:", v13, *(float *)((char *)&self->super.isa + v12));
      objc_msgSend(v6, "appendFormat:", v8, *(float *)((char *)&self->super.isa + v11));
      break;
    default:
      break;
  }
  v14 = -[BBThumbnailSizeConstraints areReasonable](self, "areReasonable", v9);
  v15 = CFSTR("NO");
  if (v14)
    v15 = CFSTR("YES");
  objc_msgSend(v6, "appendFormat:", CFSTR("; thumbnailScale=%g; reasonable? %@>"), self->_thumbnailScale, v15);
  return v6;
}

- (BBThumbnailSizeConstraints)initWithCoder:(id)a3
{
  id v4;
  BBThumbnailSizeConstraints *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BBThumbnailSizeConstraints;
  v5 = -[BBThumbnailSizeConstraints init](&v7, sel_init);
  if (v5)
  {
    -[BBThumbnailSizeConstraints setConstraintType:](v5, "setConstraintType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("constraintType")));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("fixedWidth"));
    -[BBThumbnailSizeConstraints setFixedWidth:](v5, "setFixedWidth:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("fixedHeight"));
    -[BBThumbnailSizeConstraints setFixedHeight:](v5, "setFixedHeight:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("fixedDimension"));
    -[BBThumbnailSizeConstraints setFixedDimension:](v5, "setFixedDimension:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("minAspectRatio"));
    -[BBThumbnailSizeConstraints setMinAspectRatio:](v5, "setMinAspectRatio:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("maxAspectRatio"));
    -[BBThumbnailSizeConstraints setMaxAspectRatio:](v5, "setMaxAspectRatio:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("thumbnailScale"));
    -[BBThumbnailSizeConstraints setThumbnailScale:](v5, "setThumbnailScale:");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBThumbnailSizeConstraints constraintType](self, "constraintType"), CFSTR("constraintType"));
  -[BBThumbnailSizeConstraints fixedWidth](self, "fixedWidth");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("fixedWidth"));
  -[BBThumbnailSizeConstraints fixedHeight](self, "fixedHeight");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("fixedHeight"));
  -[BBThumbnailSizeConstraints fixedDimension](self, "fixedDimension");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("fixedDimension"));
  -[BBThumbnailSizeConstraints minAspectRatio](self, "minAspectRatio");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("minAspectRatio"));
  -[BBThumbnailSizeConstraints maxAspectRatio](self, "maxAspectRatio");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("maxAspectRatio"));
  -[BBThumbnailSizeConstraints thumbnailScale](self, "thumbnailScale");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("thumbnailScale"));

}

- (BOOL)areReasonable
{
  float fixedWidth;
  float fixedHeight;
  BOOL v4;
  BOOL v5;
  float minAspectRatio;
  float fixedDimension;
  BOOL v8;
  BOOL v9;
  float maxAspectRatio;
  BOOL result;

  fixedWidth = self->_fixedWidth;
  fixedHeight = self->_fixedHeight;
  v4 = fixedWidth >= 10.0;
  if (fixedWidth > 1000.0)
    v4 = 0;
  v5 = fixedHeight >= 10.0;
  if (fixedHeight > 1000.0)
    v5 = 0;
  fixedDimension = self->_fixedDimension;
  minAspectRatio = self->_minAspectRatio;
  v8 = fixedDimension >= 10.0;
  if (fixedDimension > 1000.0)
    v8 = 0;
  if (minAspectRatio >= 0.1)
  {
    maxAspectRatio = self->_maxAspectRatio;
    v9 = maxAspectRatio <= 10.0;
    if (minAspectRatio > maxAspectRatio)
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  switch(self->_constraintType)
  {
    case 0:
      result = v4 && v9;
      break;
    case 1:
      result = v5 && v9;
      break;
    case 2:
      result = v4 && v5;
      break;
    case 3:
    case 4:
      result = v8 && v9;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (CGSize)sizeFromAspectRatio:(double)a3
{
  double v3;
  float v6;
  float v7;
  float v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  float v14;
  float v15;
  float v16;
  double v17;
  float v18;
  float v19;
  CGSize result;

  v3 = 0.0;
  if (a3 <= 0.0)
  {
    v10 = 0.0;
  }
  else
  {
    -[BBThumbnailSizeConstraints minAspectRatio](self, "minAspectRatio");
    v7 = v6;
    -[BBThumbnailSizeConstraints maxAspectRatio](self, "maxAspectRatio");
    v9 = v8;
    if (v9 >= a3)
      v9 = a3;
    if (v9 > v7)
      v7 = v9;
    v10 = 0.0;
    switch(-[BBThumbnailSizeConstraints constraintType](self, "constraintType"))
    {
      case 0:
        -[BBThumbnailSizeConstraints fixedWidth](self, "fixedWidth");
        v10 = v11;
        v3 = v11 / v7;
        break;
      case 1:
        -[BBThumbnailSizeConstraints fixedHeight](self, "fixedHeight");
        v3 = v14;
        v10 = v7 * v14;
        break;
      case 2:
        -[BBThumbnailSizeConstraints fixedWidth](self, "fixedWidth");
        v10 = v15;
        -[BBThumbnailSizeConstraints fixedHeight](self, "fixedHeight");
        v3 = v16;
        break;
      case 3:
        v17 = v7;
        -[BBThumbnailSizeConstraints fixedDimension](self, "fixedDimension");
        v10 = v18;
        if (v7 <= 1.0)
          goto LABEL_15;
        goto LABEL_13;
      case 4:
        v17 = v7;
        -[BBThumbnailSizeConstraints fixedDimension](self, "fixedDimension");
        v10 = v19;
        if (v7 < 1.0)
        {
LABEL_13:
          v3 = v10 / v17;
        }
        else
        {
LABEL_15:
          v3 = v10;
          v10 = v17 * v10;
        }
        break;
      default:
        break;
    }
  }
  v12 = v10;
  v13 = v3;
  result.height = v13;
  result.width = v12;
  return result;
}

- (int64_t)constraintType
{
  return self->_constraintType;
}

- (void)setConstraintType:(int64_t)a3
{
  self->_constraintType = a3;
}

- (float)fixedWidth
{
  return self->_fixedWidth;
}

- (void)setFixedWidth:(float)a3
{
  self->_fixedWidth = a3;
}

- (float)fixedHeight
{
  return self->_fixedHeight;
}

- (void)setFixedHeight:(float)a3
{
  self->_fixedHeight = a3;
}

- (float)fixedDimension
{
  return self->_fixedDimension;
}

- (void)setFixedDimension:(float)a3
{
  self->_fixedDimension = a3;
}

- (float)minAspectRatio
{
  return self->_minAspectRatio;
}

- (void)setMinAspectRatio:(float)a3
{
  self->_minAspectRatio = a3;
}

- (float)maxAspectRatio
{
  return self->_maxAspectRatio;
}

- (void)setMaxAspectRatio:(float)a3
{
  self->_maxAspectRatio = a3;
}

- (float)thumbnailScale
{
  return self->_thumbnailScale;
}

- (void)setThumbnailScale:(float)a3
{
  self->_thumbnailScale = a3;
}

@end
