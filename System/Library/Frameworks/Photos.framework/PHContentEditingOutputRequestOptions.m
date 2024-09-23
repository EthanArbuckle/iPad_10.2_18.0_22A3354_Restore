@implementation PHContentEditingOutputRequestOptions

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("Y");
  if (self->_asyncAdjustment)
    v8 = CFSTR("Y");
  else
    v8 = CFSTR("N");
  if (!self->_onlyChangingOriginalChoice)
    v7 = CFSTR("N");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> async: %@, onlyOriginalChoice: %@, "), v5, self, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setOnlyChangingOriginalChoice:(BOOL)a3
{
  if (a3)
    self->_asyncAdjustment = 1;
  self->_onlyChangingOriginalChoice = a3;
}

- (PHContentEditingOutputRequestOptions)initWithCoder:(id)a3
{
  id v4;
  PHContentEditingOutputRequestOptions *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PHContentEditingOutputRequestOptions;
  v5 = -[PHContentEditingOutputRequestOptions init](&v7, sel_init);
  if (v5)
  {
    v5->_asyncAdjustment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("asyncAdjustment"));
    v5->_onlyChangingOriginalChoice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onlyChangingOriginalChoice"));
    v5->_playbackStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("playbackStyle"));
    v5->_preferHEICForRenderedImages = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("preferHEICForRenderedImages"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 asyncAdjustment;
  id v5;

  asyncAdjustment = self->_asyncAdjustment;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", asyncAdjustment, CFSTR("asyncAdjustment"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_onlyChangingOriginalChoice, CFSTR("onlyChangingOriginalChoice"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_playbackStyle, CFSTR("playbackStyle"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_preferHEICForRenderedImages, CFSTR("preferHEICForRenderedImages"));

}

- (BOOL)isAsyncAdjustment
{
  return self->_asyncAdjustment;
}

- (void)setAsyncAdjustment:(BOOL)a3
{
  self->_asyncAdjustment = a3;
}

- (BOOL)isOnlyChangingOriginalChoice
{
  return self->_onlyChangingOriginalChoice;
}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (void)setPlaybackStyle:(int64_t)a3
{
  self->_playbackStyle = a3;
}

- (BOOL)preferHEICForRenderedImages
{
  return self->_preferHEICForRenderedImages;
}

- (void)setPreferHEICForRenderedImages:(BOOL)a3
{
  self->_preferHEICForRenderedImages = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
