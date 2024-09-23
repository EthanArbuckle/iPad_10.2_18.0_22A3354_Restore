@implementation CAStateControllerAnimation

- (CALayer)layer
{
  return self->_layer;
}

- (NSString)key
{
  return self->_key;
}

- (CAStateControllerAnimation)initWithLayer:(id)a3 key:(id)a4
{
  CAStateControllerAnimation *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)CAStateControllerAnimation;
  v6 = -[CAStateControllerAnimation init](&v8, sel_init);
  if (v6)
  {
    v6->_layer = (CALayer *)a3;
    v6->_key = (NSString *)objc_msgSend(a4, "copy");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)CAStateControllerAnimation;
  -[CAStateControllerAnimation dealloc](&v3, sel_dealloc);
}

@end
