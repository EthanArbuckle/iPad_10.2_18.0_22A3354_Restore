@implementation CPCompoundGraphic

- (CPCompoundGraphic)initWithGraphicObjects:(id)a3 withRenderedBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CPCompoundGraphic *v9;
  CPCompoundGraphic *v10;
  objc_super v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)CPCompoundGraphic;
  v9 = -[CPGraphicObject init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    if (a3)
      -[CPChunk setChildren:](v9, "setChildren:", a3);
    v10->super.renderedBounds.origin.x = x;
    v10->super.renderedBounds.origin.y = y;
    v10->super.renderedBounds.size.width = width;
    v10->super.renderedBounds.size.height = height;
  }
  return v10;
}

- (void)accept:(id)a3
{
  objc_msgSend(a3, "visitCompoundGraphic:", self);
}

@end
