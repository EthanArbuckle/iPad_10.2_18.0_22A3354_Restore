@implementation JFXEffectAssetAttributes

- (JFXEffectAssetAttributes)init
{
  JFXEffectAssetAttributes *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JFXEffectAssetAttributes;
  result = -[JFXEffectAssetAttributes init](&v3, sel_init);
  if (result)
  {
    result->_quality = 0;
    *(_OWORD *)&result->_usageMode = 0u;
    *(_OWORD *)&result->_contentType = 0u;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  if (-[JFXEffectAssetAttributes contentType](self, "contentType"))
  {
    JFX_descriptionForEffectAssetContentType(-[JFXEffectAssetAttributes contentType](self, "contentType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v4);

  }
  if (-[JFXEffectAssetAttributes aspectRatio](self, "aspectRatio"))
  {
    if (objc_msgSend(v3, "length"))
      objc_msgSend(v3, "appendString:", CFSTR(","));
    JFX_descriptionForEffectAssetAspectRatio(-[JFXEffectAssetAttributes aspectRatio](self, "aspectRatio"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v5);

  }
  if (-[JFXEffectAssetAttributes usageMode](self, "usageMode"))
  {
    if (objc_msgSend(v3, "length"))
      objc_msgSend(v3, "appendString:", CFSTR(","));
    JFX_descriptionForEffectAssetUsageMode(-[JFXEffectAssetAttributes usageMode](self, "usageMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v6);

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 2) = self->_aspectRatio;
  *((_QWORD *)result + 4) = self->_colorDynamicRange;
  *((_QWORD *)result + 1) = self->_contentType;
  *((_QWORD *)result + 5) = self->_quality;
  *((_QWORD *)result + 3) = self->_usageMode;
  return result;
}

- (BOOL)isMatchingFilterAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;

  v4 = a3;
  if (objc_msgSend(v4, "contentType"))
  {
    v5 = objc_msgSend(v4, "contentType");
    if (v5 != -[JFXEffectAssetAttributes contentType](self, "contentType"))
      goto LABEL_15;
  }
  if (objc_msgSend(v4, "usageMode"))
  {
    if (objc_msgSend(v4, "usageMode") == 2)
    {
      if (-[JFXEffectAssetAttributes usageMode](self, "usageMode") == 1)
        goto LABEL_15;
    }
    else
    {
      v6 = objc_msgSend(v4, "usageMode");
      if (v6 != -[JFXEffectAssetAttributes usageMode](self, "usageMode"))
      {
LABEL_15:
        v10 = 0;
        goto LABEL_16;
      }
    }
  }
  if (objc_msgSend(v4, "aspectRatio"))
  {
    v7 = objc_msgSend(v4, "aspectRatio");
    if (v7 != -[JFXEffectAssetAttributes aspectRatio](self, "aspectRatio"))
      goto LABEL_15;
  }
  if (objc_msgSend(v4, "colorDynamicRange"))
  {
    v8 = objc_msgSend(v4, "colorDynamicRange");
    if (v8 != -[JFXEffectAssetAttributes colorDynamicRange](self, "colorDynamicRange"))
      goto LABEL_15;
  }
  if (objc_msgSend(v4, "quality"))
  {
    v9 = objc_msgSend(v4, "quality");
    if (v9 != -[JFXEffectAssetAttributes quality](self, "quality"))
      goto LABEL_15;
  }
  v10 = 1;
LABEL_16:

  return v10;
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(int64_t)a3
{
  self->_contentType = a3;
}

- (int64_t)aspectRatio
{
  return self->_aspectRatio;
}

- (void)setAspectRatio:(int64_t)a3
{
  self->_aspectRatio = a3;
}

- (int64_t)usageMode
{
  return self->_usageMode;
}

- (void)setUsageMode:(int64_t)a3
{
  self->_usageMode = a3;
}

- (int64_t)colorDynamicRange
{
  return self->_colorDynamicRange;
}

- (void)setColorDynamicRange:(int64_t)a3
{
  self->_colorDynamicRange = a3;
}

- (int64_t)quality
{
  return self->_quality;
}

- (void)setQuality:(int64_t)a3
{
  self->_quality = a3;
}

@end
