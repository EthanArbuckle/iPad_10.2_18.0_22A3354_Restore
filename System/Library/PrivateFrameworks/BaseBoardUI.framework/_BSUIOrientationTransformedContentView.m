@implementation _BSUIOrientationTransformedContentView

- (void)setContentOrientation:(int64_t)a3
{
  self->_contentOrientation = a3;
}

- (_BSUIOrientationTransformedContentView)initWithFrame:(CGRect)a3
{
  _BSUIOrientationTransformedContentView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_BSUIOrientationTransformedContentView;
  result = -[_BSUIOrientationTransformedContentView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_contentOrientation = 1;
  return result;
}

- (id)description
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BSInterfaceOrientationDescription();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("content"));

  v5 = (id)objc_msgSend(v2, "appendSuper");
  objc_msgSend(v2, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)contentOrientation
{
  return self->_contentOrientation;
}

@end
