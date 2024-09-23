@implementation MTKViewDisplayLinkTarget

- (void)draw
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  objc_msgSend(WeakRetained, "draw");

}

- (MTKViewDisplayLinkTarget)initWithTarget:(id)a3
{
  id v4;
  MTKViewDisplayLinkTarget *v5;
  MTKViewDisplayLinkTarget *v6;
  MTKViewDisplayLinkTarget *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTKViewDisplayLinkTarget;
  v5 = -[MTKViewDisplayLinkTarget init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MTKViewDisplayLinkTarget setTarget:](v5, "setTarget:", v4);
    v7 = v6;
  }

  return v6;
}

- (void)setTarget:(id)a3
{
  objc_storeWeak((id *)&self->_target, a3);
}

- (MTKView)target
{
  return (MTKView *)objc_loadWeakRetained((id *)&self->_target);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
}

@end
