@implementation SKOpenGLNode

- (SKOpenGLNode)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKOpenGLNode;
  return -[SKNode init](&v3, sel_init);
}

- (SKOpenGLNode)initWithViewportSize:(CGSize)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKOpenGLNode;
  return -[SKNode init](&v4, sel_init, a3.width, a3.height);
}

- (SKOpenGLNode)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKOpenGLNode;
  return -[SKNode initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKOpenGLNode;
  -[SKNode encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  -[SKOpenGLNode viewportSize](self, "viewportSize");
  objc_msgSend(v4, "encodeCGSize:forKey:", CFSTR("viewportSize"));

}

- (CGSize)viewportSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)openGLNodeWithViewportSize:(CGSize)a3
{
  return -[SKOpenGLNode initWithViewportSize:]([SKOpenGLNode alloc], "initWithViewportSize:", a3.width, a3.height);
}

- (BOOL)needsRenderForTime:(double)a3
{
  return 0;
}

- (void)renderForTime:(double)a3
{
  glClearColor(0.0, 0.0, 0.0, 0.0);
  glClear(0x4400u);
}

@end
