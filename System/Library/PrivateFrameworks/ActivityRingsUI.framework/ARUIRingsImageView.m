@implementation ARUIRingsImageView

- (ARUIRingsImageView)initWithRingGroup:(id)a3
{
  id v4;
  ARUIRingsImageView *v5;

  v4 = a3;
  v5 = -[ARUIRingsImageView initWithRingGroup:renderer:]([ARUIRingsImageView alloc], "initWithRingGroup:renderer:", v4, 0);

  return v5;
}

- (ARUIRingsImageView)initWithRingGroup:(id)a3 renderer:(id)a4
{
  id v7;
  ARUIRenderer *v8;
  ARUIRingsImageView *v9;
  ARUIRenderer *v10;
  objc_super v12;

  v7 = a3;
  v8 = (ARUIRenderer *)a4;
  v12.receiver = self;
  v12.super_class = (Class)ARUIRingsImageView;
  v9 = -[ARUIRingsImageView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v9)
  {
    objc_msgSend(v7, "setDelegate:", v9);
    objc_storeStrong((id *)&v9->_ringGroup, a3);
    v10 = v8;
    if (!v8)
      v10 = objc_alloc_init(ARUIRenderer);
    objc_storeStrong((id *)&v9->_renderer, v10);
    if (!v8)

    -[ARUIRingsImageView _updateRenderContext](v9, "_updateRenderContext");
    v9->_needsImageRender = 1;
  }

  return v9;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ARUIRingsImageView;
  -[ARUIRingsImageView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[ARUIRingsImageView _updateRenderContext](self, "_updateRenderContext");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ARUIRingsImageView;
  -[ARUIRingsImageView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[ARUIRingsImageView _updateRenderContext](self, "_updateRenderContext");
}

- (void)_updateRenderContext
{
  double v3;
  double v4;
  ARUIRenderContext *v5;
  ARUIRenderContext *renderContext;

  -[ARUIRingsImageView bounds](self, "bounds");
  v5 = -[ARUIRenderContext initWithSize:]([ARUIRenderContext alloc], "initWithSize:", v3, v4);
  renderContext = self->_renderContext;
  self->_renderContext = v5;

}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)ARUIRingsImageView;
  -[ARUIRingsImageView layoutSubviews](&v3, sel_layoutSubviews);
  if (self->_needsImageRender)
  {
    -[ARUIRingsImageView bounds](self, "bounds");
    if (!CGRectEqualToRect(v4, *MEMORY[0x24BDBF090]))
    {
      -[ARUIRingsImageView _renderImage](self, "_renderImage");
      self->_needsImageRender = 0;
    }
  }
}

- (void)_renderImage
{
  ARUIRenderer *renderer;
  void *v4;
  void *v5;
  id v6;

  renderer = self->_renderer;
  -[ARUIRingGroup rings](self->_ringGroup, "rings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARUIRingGroup spriteSheet](self->_ringGroup, "spriteSheet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARUIRenderer snapshotRings:spriteSheet:withContext:](renderer, "snapshotRings:spriteSheet:withContext:", v4, v5, self->_renderContext);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[ARUIRingsImageView setImage:](self, "setImage:", v6);
}

- (void)ringGroupHasUpdated:(id)a3
{
  self->_needsImageRender = 1;
  -[ARUIRingsImageView setNeedsLayout](self, "setNeedsLayout", a3);
}

- (ARUIRingGroup)ringGroup
{
  return self->_ringGroup;
}

- (ARUIRenderer)renderer
{
  return self->_renderer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_ringGroup, 0);
  objc_storeStrong((id *)&self->_renderContext, 0);
}

@end
