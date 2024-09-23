@implementation _HKGraphViewOverlayView

- (_HKGraphViewOverlayView)initWithFrame:(CGRect)a3
{
  _HKGraphViewOverlayView *v3;
  _HKGraphViewOverlayView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKGraphViewOverlayView;
  v3 = -[_HKGraphViewOverlayView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_HKGraphViewOverlayView setOpaque:](v3, "setOpaque:", 0);
    -[_HKGraphViewOverlayView setContentMode:](v4, "setContentMode:", 1);
    -[_HKGraphViewOverlayView _updateRendererSize:](v4, "_updateRendererSize:", 1.0, 1.0);
    -[_HKGraphViewOverlayView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 1);
  }
  return v4;
}

- (void)_updateRendererSize:(CGSize)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", a3.width, a3.height);
  -[_HKGraphViewOverlayView setImageRenderer:](self, "setImageRenderer:", v4);

}

- (void)drawContentUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[_HKGraphViewOverlayView imageRenderer](self, "imageRenderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49___HKGraphViewOverlayView_drawContentUsingBlock___block_invoke;
  v8[3] = &unk_1E9C408F8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "imageWithActions:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_HKGraphViewOverlayView setImage:](self, "setImage:", v6);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_HKGraphViewOverlayView _updateRendererSize:](self, "_updateRendererSize:", a3.size.width, a3.size.height);
  v8.receiver = self;
  v8.super_class = (Class)_HKGraphViewOverlayView;
  -[_HKGraphViewOverlayView setFrame:](&v8, sel_setFrame_, x, y, width, height);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_HKGraphViewOverlayView _updateRendererSize:](self, "_updateRendererSize:", a3.size.width, a3.size.height);
  v8.receiver = self;
  v8.super_class = (Class)_HKGraphViewOverlayView;
  -[_HKGraphViewOverlayView setBounds:](&v8, sel_setBounds_, x, y, width, height);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _HKGraphViewOverlayView *v5;
  _HKGraphViewOverlayView *v6;
  _HKGraphViewOverlayView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_HKGraphViewOverlayView;
  -[_HKGraphViewOverlayView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_HKGraphViewOverlayView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (UIGraphicsImageRenderer)imageRenderer
{
  return self->_imageRenderer;
}

- (void)setImageRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_imageRenderer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageRenderer, 0);
}

@end
