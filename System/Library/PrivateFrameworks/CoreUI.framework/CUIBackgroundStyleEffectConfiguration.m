@implementation CUIBackgroundStyleEffectConfiguration

- (CUIBackgroundStyleEffectConfiguration)init
{
  CUIBackgroundStyleEffectConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIBackgroundStyleEffectConfiguration;
  result = -[CUIStyleEffectConfiguration init](&v3, sel_init);
  if (result)
    result->_shouldRespectOutputBlending = -3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIBackgroundStyleEffectConfiguration;
  -[CUIStyleEffectConfiguration dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CUIBackgroundStyleEffectConfiguration;
  v5 = -[CUIStyleEffectConfiguration copyWithZone:](&v7, sel_copyWithZone_);
  if (v5)
  {
    v5[10] = -[NSString copyWithZone:](self->_backgroundType, "copyWithZone:", a3);
    *((_BYTE *)v5 + 88) = self->_effectShowsValue;
  }
  return v5;
}

- (BOOL)shouldIgnoreForegroundColor
{
  _BOOL8 v3;
  unint64_t v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CUIBackgroundStyleEffectConfiguration;
  LOBYTE(v3) = -[CUIStyleEffectConfiguration shouldIgnoreForegroundColor](&v13, sel_shouldIgnoreForegroundColor);
  if (self->_backgroundType
    && !-[CUIStyleEffectConfiguration foregroundColorShouldTintEffects](self, "foregroundColorShouldTintEffects"))
  {
    v4 = (unint64_t)CUIConstantToMapID(-[CUIBackgroundStyleEffectConfiguration backgroundType](self, "backgroundType"))
       - 32;
    if (v4 < 0x22 && ((0x27246837FuLL >> v4) & 1) != 0)
    {
      return (0x1FFFFFFDFuLL >> v4) & 1;
    }
    else
    {
      v5 = -[CUIBackgroundStyleEffectConfiguration backgroundType](self, "backgroundType");
      _CUILog(4, (uint64_t)"CoreUI: Invalid background type requested: %@", v6, v7, v8, v9, v10, v11, (uint64_t)v5);
    }
  }
  return v3;
}

- (void)setShouldRespectOutputBlending:(BOOL)a3
{
  self->_shouldRespectOutputBlending = a3;
}

- (BOOL)shouldRespectOutputBlending
{
  int shouldRespectOutputBlending;
  _BOOL4 v3;
  unint64_t v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  shouldRespectOutputBlending = self->_shouldRespectOutputBlending;
  if (shouldRespectOutputBlending < 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)CUIBackgroundStyleEffectConfiguration;
    LOBYTE(v3) = -[CUIStyleEffectConfiguration shouldRespectOutputBlending](&v14, sel_shouldRespectOutputBlending);
    if (self->_backgroundType)
    {
      v5 = (unint64_t)CUIConstantToMapID(-[CUIBackgroundStyleEffectConfiguration backgroundType](self, "backgroundType"))
         - 32;
      if (v5 < 0x1F && ((0x7246837Fu >> v5) & 1) != 0)
      {
        return (0x4FB9FE90u >> v5) & 1;
      }
      else
      {
        v6 = -[CUIBackgroundStyleEffectConfiguration backgroundType](self, "backgroundType");
        _CUILog(4, (uint64_t)"CoreUI: Invalid background type requested: %@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
      }
    }
  }
  else
  {
    LOBYTE(v3) = shouldRespectOutputBlending != 0;
  }
  return v3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIBackgroundStyleEffectConfiguration;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\nbackgroundType: %@\neffectShowsValue: %d"), -[CUIStyleEffectConfiguration description](&v3, sel_description), -[CUIBackgroundStyleEffectConfiguration backgroundType](self, "backgroundType"), -[CUIBackgroundStyleEffectConfiguration effectShowsValue](self, "effectShowsValue"));
}

- (NSString)backgroundType
{
  return self->_backgroundType;
}

- (void)setBackgroundType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)effectShowsValue
{
  return self->_effectShowsValue;
}

- (void)setEffectShowsValue:(BOOL)a3
{
  self->_effectShowsValue = a3;
}

@end
