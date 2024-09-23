@implementation CUIPattern

- (CUIPattern)initWithImageRef:(CGImage *)a3
{
  CUIPattern *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIPattern;
  v4 = -[CUIPattern init](&v6, sel_init);
  if (v4)
  {
    v4->_patternImage = CGImageRetain(a3);
    v4->_alpha = 1.0;
  }
  return v4;
}

- (void)dealloc
{
  CGPattern *pattern;
  objc_super v4;

  CGImageRelease(self->_patternImage);
  pattern = self->_pattern;
  if (pattern)
    CGPatternRelease(pattern);
  self->_pattern = 0;
  v4.receiver = self;
  v4.super_class = (Class)CUIPattern;
  -[CUIPattern dealloc](&v4, sel_dealloc);
}

- (CGPattern)_newPattern
{
  size_t Height;
  size_t Width;
  CGImage *patternImage;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGRect v9;

  Height = CGImageGetHeight(self->_patternImage);
  Width = CGImageGetWidth(self->_patternImage);
  CGAffineTransformMakeScale(&v8, (double)Width, (double)Height);
  CGImageRetain(self->_patternImage);
  patternImage = self->_patternImage;
  v7 = v8;
  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  v9.size.width = 1.0;
  v9.size.height = 1.0;
  return CGPatternCreate(patternImage, v9, &v7, 1.0, 1.0, kCGPatternTilingConstantSpacing, 1, &patternBitmapCallbacks);
}

- (CGPattern)pattern
{
  CGPattern *result;

  result = self->_pattern;
  if (!result)
  {
    result = -[CUIPattern _newPattern](self, "_newPattern");
    self->_pattern = result;
  }
  return result;
}

- (void)setPatternInContext:(CGContext *)a3
{
  _CUISetPattern(a3, -[CUIPattern pattern](self, "pattern"));
  CGContextSetAlpha(a3, self->_alpha);
}

- (id)description
{
  id v3;
  size_t Width;

  v3 = objc_msgSend((id)objc_opt_class(self, a2), "description");
  Width = CGImageGetWidth(self->_patternImage);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: (%zux%zu)"), v3, Width, CGImageGetHeight(self->_patternImage));
}

- (CGImage)patternImageRef
{
  return self->_patternImage;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

@end
