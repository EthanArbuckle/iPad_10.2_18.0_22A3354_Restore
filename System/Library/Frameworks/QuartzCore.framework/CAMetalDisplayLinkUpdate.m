@implementation CAMetalDisplayLinkUpdate

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)CAMetalDisplayLinkUpdate;
  -[CAMetalDisplayLinkUpdate dealloc](&v3, sel_dealloc);
}

- (id)drawable
{
  return self->_drawable;
}

- (CFTimeInterval)targetTimestamp
{
  return self->_targetTimestamp;
}

- (CFTimeInterval)targetPresentationTimestamp
{
  return self->_targetPresentationTimestamp;
}

+ (CAMetalDisplayLinkUpdate)updateWithDrawable:(id)a3 targetTimestamp:(double)a4 targetPresentationTimestamp:(double)a5
{
  CAMetalDisplayLinkUpdate *v8;

  v8 = objc_alloc_init(CAMetalDisplayLinkUpdate);
  if (v8)
  {
    v8->_drawable = (CAMetalDrawable *)a3;
    v8->_targetTimestamp = a4;
    v8->_targetPresentationTimestamp = a5;
  }
  return v8;
}

@end
