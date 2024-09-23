@implementation AAUIMetalBadgeRendererDisplayLinkTarget

- (id)_initWithTarget:(id)a3
{
  id v4;
  AAUIMetalBadgeRendererDisplayLinkTarget *v5;
  AAUIMetalBadgeRendererDisplayLinkTarget *v6;
  AAUIMetalBadgeRendererDisplayLinkTarget *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIMetalBadgeRendererDisplayLinkTarget;
  v5 = -[AAUIMetalBadgeRendererDisplayLinkTarget init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AAUIMetalBadgeRendererDisplayLinkTarget setTarget:](v5, "setTarget:", v4);
    v7 = v6;
  }

  return v6;
}

- (void)_drawBadgeFrameCallback
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  objc_msgSend(WeakRetained, "_drawBadgeFrameCallback");

}

- (AAUIMetalBadgeRenderer)target
{
  return (AAUIMetalBadgeRenderer *)objc_loadWeakRetained((id *)&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak((id *)&self->_target, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
}

@end
