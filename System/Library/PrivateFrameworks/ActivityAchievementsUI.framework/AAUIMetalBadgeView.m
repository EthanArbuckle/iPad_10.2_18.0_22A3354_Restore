@implementation AAUIMetalBadgeView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)cleanupAfterSnapshot
{
  id v2;

  -[AAUIMetalBadgeView renderer](self, "renderer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cleanupAfterSnapshot");

}

- (id)initUsingEarnedShader:(BOOL)a3 delegate:(id)a4
{
  id v6;
  AAUIMetalBadgeView *v7;
  AAUIMetalBadgeView *v8;
  uint64_t v9;
  CAMetalLayer *metalLayer;
  AAUIMetalBadgeRenderer *v11;
  AAUIMetalBadgeRenderer *renderer;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AAUIMetalBadgeView;
  v7 = -[AAUIMetalBadgeView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_useEarnedShader = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    -[AAUIMetalBadgeView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
    -[AAUIMetalBadgeView layer](v8, "layer");
    v9 = objc_claimAutoreleasedReturnValue();
    metalLayer = v8->_metalLayer;
    v8->_metalLayer = (CAMetalLayer *)v9;

    v11 = -[AAUIMetalBadgeRenderer initWithCAMetalLayer:useEarnedShader:]([AAUIMetalBadgeRenderer alloc], "initWithCAMetalLayer:useEarnedShader:", v8->_metalLayer, v8->_useEarnedShader);
    renderer = v8->_renderer;
    v8->_renderer = v11;

    objc_initWeak(&location, v8);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __53__AAUIMetalBadgeView_initUsingEarnedShader_delegate___block_invoke;
    v14[3] = &unk_24E0B2D10;
    objc_copyWeak(&v15, &location);
    -[AAUIMetalBadgeRenderer setStateUpdateBlock:](v8->_renderer, "setStateUpdateBlock:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AAUIMetalBadgeView;
  -[AAUIMetalBadgeView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[AAUIMetalBadgeView resizeBadgeForCurrentViewSize](self, "resizeBadgeForCurrentViewSize");
}

- (void)resizeBadgeForCurrentViewSize
{
  id v2;

  -[AAUIMetalBadgeView renderer](self, "renderer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resizeBadgeForCurrentViewSize");

}

- (AAUIMetalBadgeRenderer)renderer
{
  return self->_renderer;
}

- (void)setConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AAUIMetalBadgeView renderer](self, "renderer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfiguration:", v4);

}

- (id)snapshot
{
  void *v2;
  void *v3;

  -[AAUIMetalBadgeView renderer](self, "renderer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __53__AAUIMetalBadgeView_initUsingEarnedShader_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateBadgeModelForDrawable:", WeakRetained);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AAUIBadgeViewDrawableDelegate)delegate
{
  return (AAUIBadgeViewDrawableDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isPaused
{
  void *v2;
  char v3;

  -[AAUIMetalBadgeView renderer](self, "renderer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaused");

  return v3;
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AAUIMetalBadgeView renderer](self, "renderer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPaused:", v3);

}

- (AAUIBadgeModelConfiguration)configuration
{
  void *v2;
  void *v3;

  -[AAUIMetalBadgeView renderer](self, "renderer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AAUIBadgeModelConfiguration *)v3;
}

- (void)setBackTextureImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AAUIMetalBadgeView renderer](self, "renderer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackTextureImage:", v4);

}

- (UIImage)backTextureImage
{
  void *v2;
  void *v3;

  -[AAUIMetalBadgeView renderer](self, "renderer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backTextureImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CAMetalLayer)metalLayer
{
  return self->_metalLayer;
}

- (void)setMetalLayer:(id)a3
{
  objc_storeStrong((id *)&self->_metalLayer, a3);
}

- (void)setRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_renderer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_metalLayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
