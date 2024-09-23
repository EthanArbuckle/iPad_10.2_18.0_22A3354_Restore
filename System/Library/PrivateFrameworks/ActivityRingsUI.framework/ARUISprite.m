@implementation ARUISprite

- (unint64_t)currentFrameIndex
{
  return self->_currentFrameIndex;
}

- (void)setCurrentFrameIndex:(unint64_t)a3
{
  self->_currentFrameIndex = a3;
}

- (unint64_t)hash
{
  void *v3;
  float *p_size;
  double v5;
  double v6;
  unint64_t v7;

  +[ARUIHashBuilder builder](ARUIHashBuilder, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendUnsignedInt:", self->_frameCount);
  objc_msgSend(v3, "appendUnsignedInt:", self->_frameColumns);
  objc_msgSend(v3, "appendUnsignedInt:", self->_currentFrameIndex);
  objc_msgSend(v3, "appendFloat2:", *(double *)self->_firstFrameOrigin);
  objc_msgSend(v3, "appendFloat2:", *(double *)self->_frameSize);
  p_size = &self->_size;
  *(float32x2_t *)&v5 = vld1_dup_f32(p_size);
  objc_msgSend(v3, "appendFloat2:", v5);
  objc_msgSend(v3, "appendFloat2:", *(double *)self->_translation);
  *(float *)&v6 = self->_opacity;
  objc_msgSend(v3, "appendFloat:", v6);
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (double)translation
{
  return *(double *)(a1 + 16);
}

- (float32x2_t)textureRect
{
  float32x2_t v1;
  float32x2_t v2;
  uint64x2_t v3;

  v1 = a1[4];
  v2 = a1[7];
  v3.i64[0] = *(_QWORD *)&v1 % *(_QWORD *)&v2;
  v3.i64[1] = *(_QWORD *)&v1 / *(_QWORD *)&v2;
  return vmla_f32(a1[5], a1[6], vcvt_f32_f64(vcvtq_f64_u64(v3)));
}

- (float)size
{
  return self->_size;
}

- (float)opacity
{
  return self->_opacity;
}

- (void)setTranslation:(ARUISprite *)self
{
  uint64_t v2;

  *(_QWORD *)self->_translation = v2;
}

- (void)setSize:(float)a3
{
  self->_size = a3;
}

- (void)setOpacity:(float)a3
{
  self->_opacity = a3;
}

- (ARUISprite)initWithFrameCount:(ARUISprite *)self frameColumns:(SEL)a2 firstFrameOrigin:(unint64_t)a3 frameSize:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  ARUISprite *result;
  objc_super v11;

  v6 = v5;
  v7 = v4;
  v11.receiver = self;
  v11.super_class = (Class)ARUISprite;
  result = -[ARUISprite init](&v11, sel_init);
  if (result)
  {
    result->_frameColumns = a4;
    *(_QWORD *)result->_firstFrameOrigin = v7;
    *(_QWORD *)result->_frameSize = v6;
    *(_QWORD *)result->_translation = 0;
    result->_frameCount = a3;
    result->_currentFrameIndex = 0;
    *(_QWORD *)&result->_size = 0x3F80000043960000;
  }
  return result;
}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (ARUISprite)initWithSprite:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  ARUISprite *v10;
  float v11;
  uint64_t v12;
  float v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "frameCount");
  v6 = objc_msgSend(v4, "frameColumns");
  objc_msgSend(v4, "firstFrameOrigin");
  v8 = v7;
  objc_msgSend(v4, "frameSize");
  v10 = -[ARUISprite initWithFrameCount:frameColumns:firstFrameOrigin:frameSize:](self, "initWithFrameCount:frameColumns:firstFrameOrigin:frameSize:", v5, v6, v8, v9);
  if (v10)
  {
    v10->_currentFrameIndex = objc_msgSend(v4, "currentFrameIndex");
    objc_msgSend(v4, "size");
    v10->_size = v11;
    objc_msgSend(v4, "translation");
    *(_QWORD *)v10->_translation = v12;
    objc_msgSend(v4, "opacity");
    v10->_opacity = v13;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t frameCount;
  unint64_t frameColumns;
  unint64_t currentFrameIndex;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float *p_size;
  float32x2_t v14;
  int32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float opacity;
  float v19;
  BOOL v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    frameCount = self->_frameCount;
    if (frameCount != objc_msgSend(v5, "frameCount"))
      goto LABEL_11;
    frameColumns = self->_frameColumns;
    if (frameColumns != objc_msgSend(v5, "frameColumns"))
      goto LABEL_11;
    currentFrameIndex = self->_currentFrameIndex;
    if (currentFrameIndex != objc_msgSend(v5, "currentFrameIndex"))
      goto LABEL_11;
    v9 = *(float32x2_t *)self->_firstFrameOrigin;
    objc_msgSend(v5, "firstFrameOrigin");
    if (!ARUIFloat2Equal(v9, v10))
      goto LABEL_11;
    v11 = *(float32x2_t *)self->_frameSize;
    objc_msgSend(v5, "frameSize");
    if (ARUIFloat2Equal(v11, v12)
      && (p_size = &self->_size,
          v14 = vld1_dup_f32(p_size),
          objc_msgSend(v5, "size"),
          ARUIFloat2Equal(v14, (float32x2_t)vdup_lane_s32(v15, 0)))
      && (v16 = *(float32x2_t *)self->_translation, objc_msgSend(v5, "translation"), ARUIFloat2Equal(v16, v17)))
    {
      opacity = self->_opacity;
      objc_msgSend(v5, "opacity");
      v20 = ARUIFloatEqual(opacity, v19);
    }
    else
    {
LABEL_11:
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ARUISprite;
  -[ARUISprite description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "substringWithRange:", 0, objc_msgSend(v3, "length") - 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, frame %lu/%lu>"), v4, self->_currentFrameIndex, self->_frameCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ARUISprite initWithSprite:](+[ARUISprite allocWithZone:](ARUISprite, "allocWithZone:", a3), "initWithSprite:", self);
}

+ (id)randomSprite
{
  uint64_t v2;
  ARUISprite *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  ARUISprite *v8;
  double v9;
  double v10;
  double v11;

  v2 = (int)ARUIRandomInt(0, 1000);
  v3 = [ARUISprite alloc];
  v4 = (int)ARUIRandomInt(0, 1000);
  LODWORD(v5) = 0;
  *(float32x2_t *)&v6 = ARUIRandomFloat2(v5, 1000.0);
  v7 = v6;
  LODWORD(v6) = 0;
  v8 = -[ARUISprite initWithFrameCount:frameColumns:firstFrameOrigin:frameSize:](v3, "initWithFrameCount:frameColumns:firstFrameOrigin:frameSize:", v2, v4, v7, COERCE_DOUBLE(ARUIRandomFloat2(v6, 1000.0)));
  *(float *)&v9 = ARUIRandomFloat(0.0, 1000.0);
  -[ARUISprite setSize:](v8, "setSize:", v9);
  LODWORD(v10) = 0;
  -[ARUISprite setTranslation:](v8, "setTranslation:", COERCE_DOUBLE(ARUIRandomFloat2(v10, 1000.0)));
  -[ARUISprite setCurrentFrameIndex:](v8, "setCurrentFrameIndex:", ARUIRandomNSUInt(0, v2));
  *(float *)&v11 = ARUIRandomFloat(0.0, 1.0);
  -[ARUISprite setOpacity:](v8, "setOpacity:", v11);
  return v8;
}

- (double)firstFrameOrigin
{
  return *(double *)(a1 + 40);
}

- (double)frameSize
{
  return *(double *)(a1 + 48);
}

- (unint64_t)frameColumns
{
  return self->_frameColumns;
}

@end
