@implementation SCNSpriteKitSource

- (id)textureSource
{
  SCNTextureSpriteKitSource *v3;

  v3 = objc_alloc_init(SCNTextureSpriteKitSource);
  -[SCNTextureSpriteKitSource setScene:](v3, "setScene:", -[SCNSpriteKitSource scene](self, "scene"));
  return v3;
}

- (BOOL)isOpaque
{
  float v2;
  char v5;

  v5 = 0;
  -[UIColor scn_C3DColorIgnoringColorSpace:success:](-[SKScene backgroundColor](-[SCNSpriteKitSource scene](self, "scene"), "backgroundColor"), "scn_C3DColorIgnoringColorSpace:success:", 0, &v5);
  return v2 == 1.0 || v5 == 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNSpriteKitSource;
  -[SCNSpriteKitSource dealloc](&v3, sel_dealloc);
}

- (void)setScene:(id)a3
{
  SKScene *scene;

  scene = self->_scene;
  if (scene != a3)
  {

    self->_scene = (SKScene *)a3;
  }
}

- (SKScene)scene
{
  return self->_scene;
}

@end
