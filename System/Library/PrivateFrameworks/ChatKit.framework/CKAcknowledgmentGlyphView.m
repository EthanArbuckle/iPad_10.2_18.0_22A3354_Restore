@implementation CKAcknowledgmentGlyphView

+ (id)viewCache
{
  if (viewCache_onceToken != -1)
    dispatch_once(&viewCache_onceToken, &__block_literal_global_266);
  return (id)viewCache_sCache;
}

void __38__CKAcknowledgmentGlyphView_viewCache__block_invoke()
{
  CKMultiCache *v0;
  void *v1;

  v0 = objc_alloc_init(CKMultiCache);
  v1 = (void *)viewCache_sCache;
  viewCache_sCache = (uint64_t)v0;

}

- (CKAcknowledgmentGlyphView)initWithFrame:(CGRect)a3 color:(char)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKAcknowledgmentGlyphView;
  return -[CKAcknowledgmentGlyphView initWithFrame:](&v5, sel_initWithFrame_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (id)glyphViewForAcknowledgmentType:(int64_t)a3 glyphColor:(char)a4
{
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  switch(a3)
  {
    case 2000:
    case 2001:
    case 2002:
    case 2004:
    case 2005:
      goto LABEL_4;
    case 2003:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "messageAcknowledgmentImageNameForType:", 2003);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hasSuffix:", CFSTR("ENG"));

LABEL_4:
      v5 = (objc_class *)objc_opt_class();
      break;
    default:
      v5 = 0;
      break;
  }
  v8 = [v5 alloc];
  return (id)objc_msgSend(v8, "initWithFrame:color:", v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)animateWithBeginTime:(double)a3 completionDelay:(double)a4 completion:(id)a5
{
  if (a5)
    (*((void (**)(id, double, double))a5 + 2))(a5, a3, a4);
}

- (int64_t)acknowledgmentType
{
  return 0;
}

- (CGPoint)glyphOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_glyphOffset.x;
  y = self->_glyphOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (UIColor)glyphColor
{
  return self->_glyphColor;
}

- (void)setGlyphColor:(id)a3
{
  objc_storeStrong((id *)&self->_glyphColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphColor, 0);
}

@end
