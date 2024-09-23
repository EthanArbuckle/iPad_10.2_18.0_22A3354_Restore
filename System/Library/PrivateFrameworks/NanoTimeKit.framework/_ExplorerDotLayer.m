@implementation _ExplorerDotLayer

- (_ExplorerDotLayer)init
{
  _ExplorerDotLayer *v2;
  uint64_t v3;
  CALayer *noServicePillLayer;
  CALayer *v5;
  uint64_t v6;
  CALayer *connectivityDotBackingLayer;
  uint64_t v8;
  CALayer *connectivityDotLayer;
  CATransform3D v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_ExplorerDotLayer;
  v2 = -[_ExplorerDotLayer init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v3 = objc_claimAutoreleasedReturnValue();
    noServicePillLayer = v2->_noServicePillLayer;
    v2->_noServicePillLayer = (CALayer *)v3;

    v5 = v2->_noServicePillLayer;
    CATransform3DMakeRotation(&v11, 1.57079633, 1.0, 0.0, 0.0);
    -[CALayer setTransform:](v5, "setTransform:", &v11);
    -[_ExplorerDotLayer addSublayer:](v2, "addSublayer:", v2->_noServicePillLayer);
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v6 = objc_claimAutoreleasedReturnValue();
    connectivityDotBackingLayer = v2->_connectivityDotBackingLayer;
    v2->_connectivityDotBackingLayer = (CALayer *)v6;

    -[_ExplorerDotLayer addSublayer:](v2, "addSublayer:", v2->_connectivityDotBackingLayer);
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v8 = objc_claimAutoreleasedReturnValue();
    connectivityDotLayer = v2->_connectivityDotLayer;
    v2->_connectivityDotLayer = (CALayer *)v8;

    -[_ExplorerDotLayer addSublayer:](v2, "addSublayer:", v2->_connectivityDotLayer);
  }
  return v2;
}

- (void)layoutSublayers
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[_ExplorerDotLayer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CALayer setBounds:](self->_connectivityDotBackingLayer, "setBounds:");
  -[CALayer setBounds:](self->_connectivityDotLayer, "setBounds:", v4, v6, v8, v10);
  -[CALayer setPosition:](self->_noServicePillLayer, "setPosition:", v8 * 0.5, v10 * 0.5);
  -[CALayer setPosition:](self->_connectivityDotBackingLayer, "setPosition:", v8 * 0.5, v10 * 0.5);
  -[CALayer setPosition:](self->_connectivityDotLayer, "setPosition:", v8 * 0.5, v10 * 0.5);
}

- (CALayer)noServicePillLayer
{
  return self->_noServicePillLayer;
}

- (CALayer)connectivityDotBackingLayer
{
  return self->_connectivityDotBackingLayer;
}

- (CALayer)connectivityDotLayer
{
  return self->_connectivityDotLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectivityDotLayer, 0);
  objc_storeStrong((id *)&self->_connectivityDotBackingLayer, 0);
  objc_storeStrong((id *)&self->_noServicePillLayer, 0);
}

@end
