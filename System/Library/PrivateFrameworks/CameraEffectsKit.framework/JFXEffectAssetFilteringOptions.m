@implementation JFXEffectAssetFilteringOptions

- (JFXEffectAssetFilteringOptions)init
{
  JFXEffectAssetFilteringOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JFXEffectAssetFilteringOptions;
  result = -[JFXEffectAssetFilteringOptions init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_quality = 0u;
    *(_OWORD *)&result->_usageMode = 0u;
    *(_OWORD *)&result->_contentType = 0u;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 6) = self->_filteringMode;
  *((_QWORD *)result + 2) = self->_aspectRatio;
  *((_QWORD *)result + 4) = self->_colorDynamicRange;
  *((_QWORD *)result + 1) = self->_contentType;
  *((_QWORD *)result + 5) = self->_quality;
  *((_QWORD *)result + 3) = self->_usageMode;
  return result;
}

- (id)description
{
  int64_t v3;
  __CFString *v4;
  objc_class *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[JFXEffectAssetFilteringOptions filteringMode](self, "filteringMode");
  v4 = CFSTR("close");
  if (v3 == 1)
    v4 = CFSTR("exact");
  v5 = (objc_class *)MEMORY[0x24BDD16A8];
  v6 = v4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("filteringMode %@ "), v6);

  if (-[JFXEffectAssetFilteringOptions contentType](self, "contentType"))
  {
    JFX_descriptionForEffectAssetContentType(-[JFXEffectAssetFilteringOptions contentType](self, "contentType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v8);

  }
  if (-[JFXEffectAssetFilteringOptions aspectRatio](self, "aspectRatio"))
  {
    objc_msgSend(v7, "appendString:", CFSTR(","));
    JFX_descriptionForEffectAssetAspectRatio(-[JFXEffectAssetFilteringOptions aspectRatio](self, "aspectRatio"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v9);

  }
  if (-[JFXEffectAssetFilteringOptions usageMode](self, "usageMode"))
  {
    objc_msgSend(v7, "appendString:", CFSTR(","));
    JFX_descriptionForEffectAssetUsageMode(-[JFXEffectAssetFilteringOptions usageMode](self, "usageMode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v10);

  }
  return v7;
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

- (int64_t)filteringMode
{
  return self->_filteringMode;
}

- (void)setFilteringMode:(int64_t)a3
{
  self->_filteringMode = a3;
}

@end
