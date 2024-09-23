@implementation SKOverlayTransitionContext

- (SKOverlayTransitionContext)initWithASOOverlayTransitionContext:(id)a3
{
  id v5;
  SKOverlayTransitionContext *v6;
  SKOverlayTransitionContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKOverlayTransitionContext;
  v6 = -[SKOverlayTransitionContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_backing, a3);

  return v7;
}

- (CGRect)startFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SKOverlayTransitionContext backing](self, "backing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)endFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SKOverlayTransitionContext backing](self, "backing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)addAnimationBlock:(void *)block
{
  void *v4;
  id v5;

  v4 = block;
  -[SKOverlayTransitionContext backing](self, "backing");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAnimationBlock:", v4);

}

- (ASOOverlayTransitionContext)backing
{
  return self->_backing;
}

- (void)setBacking:(id)a3
{
  objc_storeStrong((id *)&self->_backing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backing, 0);
}

@end
