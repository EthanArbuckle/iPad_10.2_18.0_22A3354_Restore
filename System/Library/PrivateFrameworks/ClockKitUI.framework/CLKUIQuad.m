@implementation CLKUIQuad

- (CLKUIQuad)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKUIQuad;
  return -[CLKUIQuad init](&v3, sel_init);
}

- (BOOL)prepareForTime:(double)a3
{
  return 0;
}

- (BOOL)isOpaque
{
  return self->_opaque;
}

- (void)setOpaque:(BOOL)a3
{
  self->_opaque = a3;
}

- (CLKUIQuadView)quadView
{
  return (CLKUIQuadView *)objc_loadWeakRetained((id *)&self->_quadView);
}

- (void)setQuadView:(id)a3
{
  objc_storeWeak((id *)&self->_quadView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_quadView);
}

@end
