@implementation MPUMutableFontDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MPUMutableFontDescriptor _copyAllowingGlobalCacheLookup:](self, "_copyAllowingGlobalCacheLookup:", 1);
}

- (void)setDefaultPointSizeAdjustment:(double)a3
{
  if (!MPUFloatEqualToFloat(self->super._defaultPointSizeAdjustment, a3))
  {
    self->super._defaultPointSizeAdjustment = a3;
    -[MPUFontDescriptor _invalidateCachedFontsAndMetrics](self, "_invalidateCachedFontsAndMetrics");
  }
}

- (void)setLeadingAdjustment:(int64_t)a3
{
  if (self->super._leadingAdjustment != a3)
  {
    self->super._leadingAdjustment = a3;
    -[MPUFontDescriptor _invalidateCachedFontsAndMetrics](self, "_invalidateCachedFontsAndMetrics");
  }
}

- (void)setSystemFontSize:(double)a3
{
  if (!MPUFloatEqualToFloat(self->super._systemFontSize, a3))
  {
    self->super._systemFontSize = a3;
    -[MPUFontDescriptor _invalidateCachedFontsAndMetrics](self, "_invalidateCachedFontsAndMetrics");
  }
}

- (void)setTextStyle:(int64_t)a3
{
  if (self->super._textStyle != a3)
  {
    self->super._textStyle = a3;
    -[MPUFontDescriptor _invalidateCachedFontsAndMetrics](self, "_invalidateCachedFontsAndMetrics");
  }
}

- (void)setWeight:(int64_t)a3
{
  if (self->super._weight != a3)
  {
    self->super._weight = a3;
    -[MPUFontDescriptor _invalidateCachedFontsAndMetrics](self, "_invalidateCachedFontsAndMetrics");
  }
}

- (void)setUsesItalic:(BOOL)a3
{
  if (self->super._usesItalic != a3)
  {
    self->super._usesItalic = a3;
    -[MPUFontDescriptor _invalidateCachedFontsAndMetrics](self, "_invalidateCachedFontsAndMetrics");
  }
}

- (void)setUsesCondensedMetrics:(BOOL)a3
{
  if (self->super._usesCondensedMetrics != a3)
  {
    self->super._usesCondensedMetrics = a3;
    -[MPUFontDescriptor _invalidateCachedFontsAndMetrics](self, "_invalidateCachedFontsAndMetrics");
  }
}

- (void)setWantsMonospaceNumbers:(BOOL)a3
{
  if (self->super._wantsMonospaceNumbers != a3)
  {
    self->super._wantsMonospaceNumbers = a3;
    -[MPUFontDescriptor _invalidateCachedFontsAndMetrics](self, "_invalidateCachedFontsAndMetrics");
  }
}

- (id)_copyAllowingGlobalCacheLookup:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  MPUFontDescriptor *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  if (a3)
  {
    +[MPUFontDescriptorCache sharedFontDescriptorCache](MPUFontDescriptorCache, "sharedFontDescriptorCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cachedImmutableFontDescriptorMatchingMutableFontDescriptor:", self);
    v5 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = objc_alloc_init(MPUFontDescriptor);
    v5 = (uint64_t)v6;
    if (v6)
    {
      v6->_textStyle = self->super._textStyle;
      v6->_weight = self->super._weight;
      v6->_defaultPointSizeAdjustment = self->super._defaultPointSizeAdjustment;
      v6->_leadingAdjustment = self->super._leadingAdjustment;
      v6->_usesItalic = self->super._usesItalic;
      v6->_usesCondensedMetrics = self->super._usesCondensedMetrics;
      v6->_wantsMonospaceNumbers = self->super._wantsMonospaceNumbers;
      objc_storeStrong((id *)&v6->_preferredFont, self->super._preferredFont);
      *(_OWORD *)(v5 + 64) = *(_OWORD *)&self->super._preferredFontMetrics.ascender;
      v7 = *(_OWORD *)&self->super._preferredFontMetrics.bodyLeading;
      v8 = *(_OWORD *)&self->super._preferredFontMetrics.capHeight;
      v9 = *(_OWORD *)&self->super._preferredFontMetrics.lineHeight;
      *(_OWORD *)(v5 + 112) = *(_OWORD *)&self->super._preferredFontMetrics.descender;
      *(_OWORD *)(v5 + 128) = v9;
      *(_OWORD *)(v5 + 80) = v7;
      *(_OWORD *)(v5 + 96) = v8;
      objc_storeStrong((id *)(v5 + 144), self->super._defaultFont);
      *(_OWORD *)(v5 + 152) = *(_OWORD *)&self->super._defaultFontMetrics.ascender;
      v10 = *(_OWORD *)&self->super._defaultFontMetrics.bodyLeading;
      v11 = *(_OWORD *)&self->super._defaultFontMetrics.capHeight;
      v12 = *(_OWORD *)&self->super._defaultFontMetrics.descender;
      *(_OWORD *)(v5 + 216) = *(_OWORD *)&self->super._defaultFontMetrics.lineHeight;
      *(_OWORD *)(v5 + 200) = v12;
      *(_OWORD *)(v5 + 184) = v11;
      *(_OWORD *)(v5 + 168) = v10;
      *(double *)(v5 + 24) = self->super._systemFontSize;
    }
  }
  return (id)v5;
}

- (void)_resetToDefaultValues
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MPUMutableFontDescriptor;
  -[MPUFontDescriptor _resetToDefaultValues](&v2, sel__resetToDefaultValues);
}

@end
